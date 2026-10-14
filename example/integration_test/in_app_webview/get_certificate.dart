part of 'main.dart';

void getCertificate() {
  final shouldSkip = !CygnusWebViewController.isMethodSupported(
    CygnusPlatformWebViewControllerMethod.getCertificate,
  );

  skippableTestWidgets('getCertificate', (WidgetTester tester) async {
    final Completer<CygnusWebViewController> controllerCompleter =
        Completer<CygnusWebViewController>();
    final Completer<void> pageLoaded = Completer<void>();

    await tester.pumpWidget(
      Directionality(
        textDirection: TextDirection.ltr,
        child: CygnusWebView(
          key: GlobalKey(),
          initialUrlRequest: CygnusURLRequest(url: TEST_CROSS_PLATFORM_URL_1),
          onWebViewCreated: (controller) {
            controllerCompleter.complete(controller);
          },
          onLoadStop: (controller, url) {
            pageLoaded.complete();
          },
        ),
      ),
    );

    final CygnusWebViewController controller = await controllerCompleter.future;
    await pageLoaded.future;

    var sslCertificate = await controller.getCertificate();
    expect(sslCertificate, isNotNull);
    expect(sslCertificate!.x509Certificate, isNotNull);
    expect(sslCertificate.issuedBy, isNotNull);
    expect(sslCertificate.issuedTo, isNotNull);
    expect(sslCertificate.validNotAfterDate, isNotNull);
    expect(sslCertificate.validNotBeforeDate, isNotNull);
  }, skip: shouldSkip);
}
