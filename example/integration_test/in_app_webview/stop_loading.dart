part of 'main.dart';

void stopLoading() {
  final shouldSkip = !CygnusWebViewController.isMethodSupported(
    CygnusPlatformWebViewControllerMethod.stopLoading,
  );

  skippableTestWidgets('stopLoading', (WidgetTester tester) async {
    final Completer<CygnusWebViewController> controllerCompleter =
        Completer<CygnusWebViewController>();
    final Completer<void> pageLoaded = Completer<void>();

    await tester.pumpWidget(
      Directionality(
        textDirection: TextDirection.ltr,
        child: CygnusWebView(
          key: GlobalKey(),
          initialUrlRequest: CygnusURLRequest(url: TEST_CROSS_PLATFORM_URL_1),
          initialSettings: CygnusWebViewSettings(clearCache: true),
          onWebViewCreated: (controller) {
            controllerCompleter.complete(controller);
          },
          onLoadStart: (controller, url) {
            controller.stopLoading();
          },
          onLoadStop: (controller, url) {
            pageLoaded.complete();
          },
        ),
      ),
    );

    final CygnusWebViewController controller = await controllerCompleter.future;

    if (defaultTargetPlatform == TargetPlatform.android) {
      await pageLoaded.future;
      expect(
        await controller.evaluateJavascript(source: "document.body"),
        isNullOrEmpty,
      );
    } else if (defaultTargetPlatform == TargetPlatform.iOS) {
      expect(pageLoaded.future, doesNotComplete);
    }
  }, skip: shouldSkip);
}
