part of 'main.dart';

void handlesURLScheme() {
  final shouldSkip = !CygnusWebViewController.isMethodSupported(
    CygnusPlatformWebViewControllerMethod.handlesURLScheme,
  );

  skippableTest('handlesURLScheme', () async {
    expect(await CygnusWebViewController.handlesURLScheme("http"), true);
    expect(await CygnusWebViewController.handlesURLScheme("https"), true);
  }, skip: shouldSkip);
}
