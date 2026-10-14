part of 'main.dart';

void initialUrlRequest() {
  final shouldSkip = !CygnusWebView.isPropertySupported(
    CygnusPlatformWebViewCreationParamsProperty.initialUrlRequest,
  );

  skippableGroup('initial url request', () {
    final shouldSkipTest2 = !CygnusWebViewSettings.isPropertySupported(
      CygnusWebViewSettingsProperty.allowsBackForwardNavigationGestures,
    );

    skippableTestWidgets(
      'launches with allowsBackForwardNavigationGestures true',
      (WidgetTester tester) async {
        final Completer<void> pageLoaded = Completer<void>();
        final Completer<CygnusWebViewController> controllerCompleter =
            Completer<CygnusWebViewController>();

        await tester.pumpWidget(
          Directionality(
            textDirection: TextDirection.ltr,
            child: SizedBox(
              width: 400,
              height: 300,
              child: CygnusWebView(
                key: GlobalKey(),
                initialUrlRequest: CygnusURLRequest(url: TEST_URL_1),
                initialSettings: CygnusWebViewSettings(
                  allowsBackForwardNavigationGestures: true,
                ),
                onWebViewCreated: (controller) {
                  controllerCompleter.complete(controller);
                },
                onLoadStop: (controller, url) {
                  pageLoaded.complete();
                },
              ),
            ),
          ),
        );
        await pageLoaded.future;
        final CygnusWebViewController controller =
            await controllerCompleter.future;
        final String? currentUrl = (await controller.getUrl())?.toString();
        expect(currentUrl, TEST_URL_1.toString());
      },
      skip: shouldSkipTest2,
    );

    final shouldSkipTest1 = !CygnusWebView.isPropertySupported(
      CygnusPlatformWebViewCreationParamsProperty.initialUrlRequest,
    );

    skippableTestWidgets('basic', (WidgetTester tester) async {
      final Completer<void> pageLoaded = Completer<void>();
      final Completer<CygnusWebViewController> controllerCompleter =
          Completer<CygnusWebViewController>();

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
      // Platform view creation happens asynchronously.
      await tester.pump();

      await pageLoaded.future;
      final CygnusWebViewController controller =
          await controllerCompleter.future;
      final String? currentUrl = (await controller.getUrl())?.toString();

      expect(currentUrl, TEST_CROSS_PLATFORM_URL_1.toString());
    }, skip: shouldSkipTest1);
  }, skip: shouldSkip);
}
