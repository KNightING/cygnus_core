part of 'main.dart';

void webViewAssetLoader() {
  final shouldSkip = !CygnusWebViewSettings.isPropertySupported(
    CygnusWebViewSettingsProperty.webViewAssetLoader,
  );

  skippableTestWidgets('CygnusWebViewAssetLoader', (WidgetTester tester) async {
    final Completer<CygnusWebViewController> controllerCompleter =
        Completer<CygnusWebViewController>();
    final Completer<String> pageLoaded = Completer<String>();

    await tester.pumpWidget(
      Directionality(
        textDirection: TextDirection.ltr,
        child: CygnusWebView(
          key: GlobalKey(),
          initialUrlRequest: CygnusURLRequest(url: TEST_WEBVIEW_ASSET_LOADER_URL),
          initialSettings: CygnusWebViewSettings(
            allowFileAccessFromFileURLs: false,
            allowUniversalAccessFromFileURLs: false,
            allowFileAccess: false,
            allowContentAccess: false,
            webViewAssetLoader: CygnusWebViewAssetLoader(
              domain: TEST_WEBVIEW_ASSET_LOADER_DOMAIN,
              pathHandlers: [CygnusAssetsPathHandler(path: '/assets/')],
            ),
          ),
          onWebViewCreated: (controller) {
            controllerCompleter.complete(controller);
          },
          onLoadStop: (controller, url) {
            pageLoaded.complete(url.toString());
          },
        ),
      ),
    );

    final CygnusWebViewController controller = await controllerCompleter.future;
    final url = await pageLoaded.future;

    expect(url, TEST_WEBVIEW_ASSET_LOADER_URL.toString());

    expect(
      await controller.evaluateJavascript(
        source: "document.querySelector('h1').innerHTML",
      ),
      'CygnusWebViewAssetLoader',
    );
  }, skip: shouldSkip);
}
