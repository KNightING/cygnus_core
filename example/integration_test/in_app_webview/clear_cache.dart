part of 'main.dart';

void clearCache() {
  final shouldSkip = !CygnusWebViewController.isMethodSupported(
    CygnusPlatformWebViewControllerMethod.clearAllCache,
  );

  skippableTestWidgets('clearAllCache', (WidgetTester tester) async {
    await expectLater(
      CygnusWebViewController.clearAllCache(includeDiskFiles: true),
      completes,
    );
  }, skip: shouldSkip);
}
