part of 'main.dart';

void getCurrentWebViewPackage() {
  final shouldSkip = !CygnusWebViewController.isMethodSupported(
    CygnusPlatformWebViewControllerMethod.getCurrentWebViewPackage,
  );

  skippableTest('getCurrentWebViewPackage', () async {
    expect(await CygnusWebViewController.getCurrentWebViewPackage(), isNotNull);
  }, skip: shouldSkip);
}
