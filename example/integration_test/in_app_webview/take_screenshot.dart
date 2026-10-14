part of 'main.dart';

void takeScreenshot() {
  final shouldSkip = !CygnusWebViewController.isMethodSupported(
    CygnusPlatformWebViewControllerMethod.takeScreenshot,
  );

  skippableTestWidgets('takeScreenshot', (WidgetTester tester) async {
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

    await Future.delayed(Duration(seconds: 1));
    await tester.pump();

    var screenshotConfiguration = CygnusScreenshotConfiguration(
      compressFormat: CygnusCompressFormat.JPEG,
      quality: 20,
      rect: CygnusWebViewRect(width: 100, height: 100, x: 50, y: 50),
    );
    var screenshot = await controller.takeScreenshot(
      screenshotConfiguration: screenshotConfiguration,
    );
    expect(screenshot, isNotNull);
  }, skip: shouldSkip);
}
