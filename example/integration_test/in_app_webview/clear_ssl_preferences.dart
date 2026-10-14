part of 'main.dart';

void clearSslPreferences() {
  final shouldSkip = !CygnusWebViewController.isMethodSupported(
    CygnusPlatformWebViewControllerMethod.clearSslPreferences,
  );

  skippableTestWidgets('clearSslPreferences', (WidgetTester tester) async {
    final Completer<CygnusWebViewController> controllerCompleter =
        Completer<CygnusWebViewController>();
    final Completer<void> pageLoaded = Completer<void>();

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

    final CygnusWebViewController controller = await controllerCompleter.future;
    await pageLoaded.future;
    await expectLater(controller.clearSslPreferences(), completes);
  }, skip: shouldSkip);
}
