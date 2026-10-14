part of 'main.dart';

void keepAlive() {
  final shouldSkip = !CygnusWebView.isPropertySupported(
    CygnusPlatformWebViewWidgetCreationParamsProperty.keepAlive,
  );

  final initialUrl = !kIsWeb
      ? TEST_CROSS_PLATFORM_URL_1
      : TEST_WEB_PLATFORM_URL_1;

  skippableTestWidgets('Keep Alive', (WidgetTester tester) async {
    final keepAlive = CygnusWebViewKeepAlive();

    final Completer<CygnusWebViewController> controllerCompleter =
        Completer<CygnusWebViewController>();
    final Completer<CygnusWebViewController> controllerCompleter2 =
        Completer<CygnusWebViewController>();
    final Completer<void> pageLoaded = Completer<void>();
    final Completer<void> pageLoaded2 = Completer<void>();

    await tester.pumpWidget(
      Directionality(
        textDirection: TextDirection.ltr,
        child: CygnusWebView(
          key: GlobalKey(),
          keepAlive: keepAlive,
          initialUrlRequest: CygnusURLRequest(url: initialUrl),
          onWebViewCreated: (controller) {
            controllerCompleter.complete(controller);
          },
          onLoadStop: (controller, url) {
            if (!pageLoaded.isCompleted &&
                initialUrl.toString() == url.toString()) {
              pageLoaded.complete();
            }
            if (!pageLoaded2.isCompleted &&
                TEST_CROSS_PLATFORM_URL_2.toString() == url.toString()) {
              pageLoaded2.complete();
            }
          },
        ),
      ),
    );

    final CygnusWebViewController controller = await controllerCompleter.future;
    await pageLoaded.future;

    await controller.loadUrl(
      urlRequest: CygnusURLRequest(url: TEST_CROSS_PLATFORM_URL_2),
    );
    await pageLoaded2.future;

    await tester.pumpWidget(
      Directionality(
        textDirection: TextDirection.ltr,
        child: CygnusWebView(
          key: GlobalKey(),
          keepAlive: keepAlive,
          onWebViewCreated: (controller) {
            controllerCompleter2.complete(controller);
          },
        ),
      ),
    );
    final CygnusWebViewController controller2 =
        await controllerCompleter2.future;

    final String? currentUrl = (await controller2.getUrl())?.toString();
    expect(currentUrl, TEST_CROSS_PLATFORM_URL_2.toString());

    await expectLater(
      CygnusWebViewController.disposeKeepAlive(keepAlive),
      completes,
    );
  }, skip: shouldSkip);
}
