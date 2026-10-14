part of 'main.dart';

void clearClientCertPreferences() {
  final shouldSkip = !CygnusWebViewController.isMethodSupported(
    CygnusPlatformWebViewControllerMethod.clearClientCertPreferences,
  );

  skippableTest('clearClientCertPreferences', () async {
    await expectLater(
      CygnusWebViewController.clearClientCertPreferences(),
      completes,
    );
  }, skip: shouldSkip);
}
