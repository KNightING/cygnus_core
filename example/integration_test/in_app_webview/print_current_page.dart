part of 'main.dart';

void printCurrentPage() {
  final shouldSkip = !CygnusWebViewController.isMethodSupported(
    CygnusPlatformWebViewControllerMethod.printCurrentPage,
  );

  var url = !kIsWeb ? TEST_CROSS_PLATFORM_URL_1 : TEST_WEB_PLATFORM_URL_1;

  skippableTestWidgets('printCurrentPage', (WidgetTester tester) async {
    final Completer<CygnusWebViewController> controllerCompleter =
        Completer<CygnusWebViewController>();
    final Completer<void> pageLoaded = Completer<void>();

    await tester.pumpWidget(
      Directionality(
        textDirection: TextDirection.ltr,
        child: CygnusWebView(
          key: GlobalKey(),
          initialUrlRequest: CygnusURLRequest(url: url),
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
    await tester.pump();
    await pageLoaded.future;
    await expectLater(controller.printCurrentPage(), completes);
  }, skip: shouldSkip);
}
