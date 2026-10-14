part of 'main.dart';

void supported() {
  skippableGroup('supported', () {
    skippableTestWidgets('basic', (WidgetTester tester) async {
      expect(CygnusHeadlessWebView.isClassSupported(), true);
      expect(
        CygnusHeadlessWebView.isPropertySupported(
          CygnusPlatformHeadlessWebViewCreationParamsProperty.initialSize,
        ),
        true,
      );
      expect(
        CygnusHeadlessWebView.isPropertySupported(
          CygnusPlatformHeadlessWebViewCreationParamsProperty.webViewEnvironment,
        ),
        defaultTargetPlatform == TargetPlatform.windows,
      );
      expect(
        CygnusHeadlessWebView.isMethodSupported(
          CygnusPlatformHeadlessWebViewMethod.run,
        ),
        true,
      );
      expect(
        CygnusHeadlessWebView.isMethodSupported(
          CygnusPlatformHeadlessWebViewMethod.dispose,
        ),
        true,
      );
    }, skip: false);
  }, skip: false);
}
