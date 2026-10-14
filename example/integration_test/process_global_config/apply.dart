part of 'main.dart';

void apply() {
  final shouldSkip = !CygnusProcessGlobalConfig.isMethodSupported(
    CygnusPlatformProcessGlobalConfigMethod.apply,
  );

  skippableTestWidgets('apply', (WidgetTester tester) async {
    await expectLater(
      CygnusProcessGlobalConfig.instance().apply(
        settings: CygnusProcessGlobalConfigSettings(
          dataDirectorySuffix:
              (await CygnusWebViewFeature.isStartupFeatureSupported(
                CygnusWebViewFeature.STARTUP_FEATURE_SET_DATA_DIRECTORY_SUFFIX,
              ))
              ? 'suffix_inappwebviewexample'
              : null,
          directoryBasePaths:
              (await CygnusWebViewFeature.isStartupFeatureSupported(
                CygnusWebViewFeature.STARTUP_FEATURE_SET_DIRECTORY_BASE_PATHS,
              ))
              ? CygnusProcessGlobalConfigDirectoryBasePaths(
                  cacheDirectoryBasePath:
                      (await getApplicationDocumentsDirectory()).absolute.path +
                      '/inappwebviewexample/cache',
                  dataDirectoryBasePath:
                      (await getApplicationDocumentsDirectory()).absolute.path +
                      '/inappwebviewexample/data',
                )
              : null,
        ),
      ),
      completes,
    );
  }, skip: shouldSkip);
}
