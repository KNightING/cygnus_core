part of 'main.dart';

void getDefaultUserAgent() {
  final shouldSkip = !CygnusWebViewController.isMethodSupported(
    CygnusPlatformWebViewControllerMethod.getDefaultUserAgent,
  );

  skippableTest('getDefaultUserAgent', () async {
    expect(await CygnusWebViewController.getDefaultUserAgent(), isNotNull);
  }, skip: shouldSkip);
}
