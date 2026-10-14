part of 'main.dart';

void onNavigationResponse() {
  final shouldSkip = !CygnusWebView.isPropertySupported(
    CygnusPlatformWebViewCreationParamsProperty.onNavigationResponse,
  );

  skippableGroup('onNavigationResponse', () {
    skippableTestWidgets('allow navigation', (WidgetTester tester) async {
      final Completer<CygnusWebViewController> controllerCompleter =
          Completer<CygnusWebViewController>();
      final Completer<void> pageLoaded = Completer<void>();
      final Completer<String> onNavigationResponseCompleter =
          Completer<String>();

      await tester.pumpWidget(
        Directionality(
          textDirection: TextDirection.ltr,
          child: CygnusWebView(
            key: GlobalKey(),
            initialUrlRequest: CygnusURLRequest(url: TEST_URL_1),
            onWebViewCreated: (controller) {
              controllerCompleter.complete(controller);
            },
            onLoadStop: (controller, url) {
              pageLoaded.complete();
            },
            onNavigationResponse: (controller, navigationResponse) async {
              onNavigationResponseCompleter.complete(
                navigationResponse.response!.url.toString(),
              );
              return CygnusNavigationResponseAction.ALLOW;
            },
          ),
        ),
      );

      await pageLoaded.future;
      final String url = await onNavigationResponseCompleter.future;
      expect(url, TEST_URL_1.toString());
    });

    skippableTestWidgets('cancel navigation', (WidgetTester tester) async {
      final Completer<CygnusWebViewController> controllerCompleter =
          Completer<CygnusWebViewController>();
      final Completer<void> pageLoaded = Completer<void>();
      final Completer<String> onNavigationResponseCompleter =
          Completer<String>();

      await tester.pumpWidget(
        Directionality(
          textDirection: TextDirection.ltr,
          child: CygnusWebView(
            key: GlobalKey(),
            initialUrlRequest: CygnusURLRequest(url: TEST_URL_1),
            onWebViewCreated: (controller) {
              controllerCompleter.complete(controller);
            },
            onLoadStop: (controller, url) {
              pageLoaded.complete();
            },
            onNavigationResponse: (controller, navigationResponse) async {
              onNavigationResponseCompleter.complete(
                navigationResponse.response!.url.toString(),
              );
              return CygnusNavigationResponseAction.CANCEL;
            },
          ),
        ),
      );

      final String url = await onNavigationResponseCompleter.future;
      expect(url, TEST_URL_1.toString());
      expect(pageLoaded.future, doesNotComplete);
    });
  }, skip: shouldSkip);
}
