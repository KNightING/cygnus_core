part of 'main.dart';

void setWebContentsDebuggingEnabled() {
  final shouldSkip = !CygnusWebViewController.isMethodSupported(
    CygnusPlatformWebViewControllerMethod.setWebContentsDebuggingEnabled,
  );

  skippableTest('setWebContentsDebuggingEnabled', () async {
    expect(
      CygnusWebViewController.setWebContentsDebuggingEnabled(true),
      completes,
    );
  }, skip: shouldSkip);
}
