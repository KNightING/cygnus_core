part of 'main.dart';

void setGetSettings() {
  final shouldSkip = false;

  skippableTest('set/get settings', () async {
    final Completer<CygnusWebViewController> controllerCompleter =
        Completer<CygnusWebViewController>();
    final Completer<void> pageLoaded = Completer<void>();

    var headlessWebView = new CygnusHeadlessWebView(
      initialUrlRequest: CygnusURLRequest(url: TEST_CROSS_PLATFORM_URL_1),
      initialSettings: CygnusWebViewSettings(javaScriptEnabled: false),
      onWebViewCreated: (controller) {
        controllerCompleter.complete(controller);
      },
      onLoadStop: (controller, url) async {
        pageLoaded.complete();
      },
    );

    await headlessWebView.run();
    final CygnusWebViewController controller = await controllerCompleter.future;
    await pageLoaded.future;

    var settings = await controller.getSettings();
    expect(settings, isNotNull);
    expect(settings!.javaScriptEnabled, false);

    await controller.setSettings(
      settings: CygnusWebViewSettings(javaScriptEnabled: true),
    );

    settings = await controller.getSettings();
    expect(settings, isNotNull);
    expect(settings!.javaScriptEnabled, true);
  }, skip: shouldSkip);
}
