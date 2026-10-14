part of 'main.dart';

void convertToWebView() {
  final shouldSkip = !CygnusWebView.isPropertySupported(
    CygnusPlatformWebViewWidgetCreationParamsProperty.headlessWebView,
  );

  skippableTestWidgets('convert to CygnusWebView', (WidgetTester tester) async {
    final Completer<CygnusWebViewController> controllerCompleter =
        Completer<CygnusWebViewController>();
    final Completer<void> pageLoaded = Completer<void>();

    var headlessWebView = new CygnusHeadlessWebView(
      initialUrlRequest: CygnusURLRequest(url: TEST_CROSS_PLATFORM_URL_1),
      onWebViewCreated: (controller) {
        controllerCompleter.complete(controller);
      },
      onLoadStop: (controller, url) async {
        pageLoaded.complete();
      },
    );

    await headlessWebView.run();
    expect(headlessWebView.isRunning(), true);

    final CygnusWebViewController controller = await controllerCompleter.future;
    await tester.pump();
    await pageLoaded.future;

    final String? url = (await controller.getUrl())?.toString();
    expect(url, TEST_CROSS_PLATFORM_URL_1.toString());

    final Completer<CygnusWebViewController> widgetControllerCompleter =
        Completer<CygnusWebViewController>();
    final Completer<String> loadedUrl = Completer<String>();

    await tester.pumpWidget(
      Directionality(
        textDirection: TextDirection.ltr,
        child: CygnusWebView(
          key: GlobalKey(),
          headlessWebView: headlessWebView,
          onWebViewCreated: (controller) {
            widgetControllerCompleter.complete(controller);
          },
          onLoadStop: (controller, url) {
            if (url.toString() == TEST_CROSS_PLATFORM_URL_2.toString() &&
                !loadedUrl.isCompleted) {
              loadedUrl.complete(url.toString());
            }
          },
        ),
      ),
    );
    final CygnusWebViewController widgetController =
        await widgetControllerCompleter.future;
    await tester.pump();

    expect(headlessWebView.isRunning(), false);

    expect(
      (await widgetController.getUrl())?.toString(),
      TEST_CROSS_PLATFORM_URL_1.toString(),
    );

    await widgetController.loadUrl(
      urlRequest: CygnusURLRequest(url: TEST_CROSS_PLATFORM_URL_2),
    );
    expect(await loadedUrl.future, TEST_CROSS_PLATFORM_URL_2.toString());
  }, skip: shouldSkip);
}
