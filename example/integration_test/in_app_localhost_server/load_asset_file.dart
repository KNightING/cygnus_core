part of 'main.dart';

void loadAssetFile(CygnusLocalhostServer localhostServer) {
  final shouldSkip = kIsWeb || !CygnusWebView.isClassSupported();

  skippableTestWidgets('load asset file', (WidgetTester tester) async {
    expect(localhostServer.isRunning(), true);

    final Completer<CygnusWebViewController> controllerCompleter =
        Completer<CygnusWebViewController>();

    await tester.pumpWidget(
      Directionality(
        textDirection: TextDirection.ltr,
        child: CygnusWebView(
          key: GlobalKey(),
          initialUrlRequest: CygnusURLRequest(
            url: CygnusWebUri('http://localhost:8080/test_assets/index.html'),
          ),
          onWebViewCreated: (controller) {
            controllerCompleter.complete(controller);
          },
        ),
      ),
    );
    final CygnusWebViewController controller = await controllerCompleter.future;
    final String? currentUrl = (await controller.getUrl())?.toString();
    expect(currentUrl, 'http://localhost:8080/test_assets/index.html');
  }, skip: shouldSkip);
}
