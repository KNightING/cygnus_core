part of 'main.dart';

void createPdf() {
  final shouldSkip = !CygnusWebViewController.isMethodSupported(
    CygnusPlatformWebViewControllerMethod.createPdf,
  );

  skippableTestWidgets('createPdf', (WidgetTester tester) async {
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

    var pdfConfiguration = CygnusPDFConfiguration(
      rect: CygnusWebViewRect(width: 100, height: 100, x: 50, y: 50),
    );
    var pdf = await controller.createPdf(pdfConfiguration: pdfConfiguration);
    expect(pdf, isNotNull);
  }, skip: shouldSkip);
}
