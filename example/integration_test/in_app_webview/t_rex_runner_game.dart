part of 'main.dart';

void tRexRunnerGame() {
  final shouldSkip = !CygnusWebViewController.isPropertySupported(
    CygnusPlatformWebViewControllerProperty.tRexRunnerHtml,
  );

  skippableTestWidgets('T-Rex Runner game', (WidgetTester tester) async {
    final Completer<CygnusWebViewController> controllerCompleter =
        Completer<CygnusWebViewController>();
    final Completer<void> pageLoaded = Completer<void>();

    await tester.pumpWidget(
      Directionality(
        textDirection: TextDirection.ltr,
        child: CygnusWebView(
          key: GlobalKey(),
          initialUrlRequest: CygnusURLRequest(url: TEST_URL_ABOUT_BLANK),
          onWebViewCreated: (controller) {
            controllerCompleter.complete(controller);
          },
          onLoadStop: (controller, url) {
            pageLoaded.complete();
          },
        ),
      ),
    );

    await controllerCompleter.future;
    await pageLoaded.future;

    var html = await CygnusWebViewController.tRexRunnerHtml;
    var css = await CygnusWebViewController.tRexRunnerCss;

    expect(html, isNotNull);
    expect(css, isNotNull);
  }, skip: shouldSkip);
}
