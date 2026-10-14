part of 'main.dart';

void loadFile() {
  final shouldSkip = !CygnusWebViewController.isMethodSupported(
    CygnusPlatformWebViewControllerMethod.loadFile,
  );

  skippableTestWidgets('loadFile', (WidgetTester tester) async {
    final Completer<CygnusWebViewController> controllerCompleter =
        Completer<CygnusWebViewController>();
    final StreamController<String> pageLoads =
        StreamController<String>.broadcast();

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
            pageLoads.add(url!.toString());
          },
        ),
      ),
    );

    final CygnusWebViewController controller = await controllerCompleter.future;
    // do not wait for pump to not miss the load event
    tester.pump();
    await pageLoads.stream.first;

    await controller.loadFile(
      assetFilePath: "test_assets/in_app_webview_initial_file_test.html",
    );
    await pageLoads.stream.first;

    final Uri? url = await controller.getUrl();
    expect(url, isNotNull);
    expect(url!.scheme, kIsWeb ? 'http' : 'file');
    expect(
      url.path,
      endsWith("test_assets/in_app_webview_initial_file_test.html"),
    );

    pageLoads.close();
  }, skip: shouldSkip);
}
