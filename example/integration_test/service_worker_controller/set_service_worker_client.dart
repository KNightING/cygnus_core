part of 'main.dart';

void setServiceWorkerClient() {
  final shouldSkip = !CygnusServiceWorkerController.isMethodSupported(
    CygnusPlatformServiceWorkerControllerMethod.setServiceWorkerClient,
  );

  skippableTestWidgets('setServiceWorkerClient to null', (
    WidgetTester tester,
  ) async {
    final Completer<String> pageLoaded = Completer<String>();

    var swAvailable = await CygnusWebViewFeature.isFeatureSupported(
      CygnusWebViewFeature.SERVICE_WORKER_BASIC_USAGE,
    );
    var swInterceptAvailable = await CygnusWebViewFeature.isFeatureSupported(
      CygnusWebViewFeature.SERVICE_WORKER_SHOULD_INTERCEPT_REQUEST,
    );

    if (swAvailable && swInterceptAvailable) {
      CygnusServiceWorkerController serviceWorkerController =
          CygnusServiceWorkerController.instance();

      await serviceWorkerController.setServiceWorkerClient(null);
    }

    await tester.pumpWidget(
      Directionality(
        textDirection: TextDirection.ltr,
        child: CygnusWebView(
          key: GlobalKey(),
          initialUrlRequest: CygnusURLRequest(url: TEST_SERVICE_WORKER_URL),
          onLoadStop: (controller, url) {
            pageLoaded.complete(url!.toString());
          },
        ),
      ),
    );

    final String url = await pageLoaded.future;
    expect(url, TEST_SERVICE_WORKER_URL.toString());
  }, skip: shouldSkip);
}
