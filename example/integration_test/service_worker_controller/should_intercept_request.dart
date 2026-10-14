part of 'main.dart';

void shouldInterceptRequest() {
  final shouldSkip = !CygnusServiceWorkerController.isMethodSupported(
    CygnusPlatformServiceWorkerControllerMethod.setServiceWorkerClient,
  );

  skippableTestWidgets('shouldInterceptRequest', (WidgetTester tester) async {
    final Completer completer = Completer();

    var swAvailable = await CygnusWebViewFeature.isFeatureSupported(
      CygnusWebViewFeature.SERVICE_WORKER_BASIC_USAGE,
    );
    var swInterceptAvailable = await CygnusWebViewFeature.isFeatureSupported(
      CygnusWebViewFeature.SERVICE_WORKER_SHOULD_INTERCEPT_REQUEST,
    );

    if (swAvailable && swInterceptAvailable) {
      CygnusServiceWorkerController serviceWorkerController =
          CygnusServiceWorkerController.instance();

      await serviceWorkerController.setServiceWorkerClient(
        CygnusServiceWorkerClient(
          shouldInterceptRequest: (request) async {
            if (!completer.isCompleted) {
              completer.complete();
            }
            return null;
          },
        ),
      );
    } else {
      completer.complete();
    }

    await tester.pumpWidget(
      Directionality(
        textDirection: TextDirection.ltr,
        child: CygnusWebView(
          key: GlobalKey(),
          initialUrlRequest: CygnusURLRequest(url: TEST_SERVICE_WORKER_URL),
        ),
      ),
    );

    await expectLater(completer.future, completes);
  }, skip: shouldSkip);
}
