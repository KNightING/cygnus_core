part of 'main.dart';

void setGetSettings() {
  final shouldSkip = !CygnusWebViewController.isMethodSupported(
    CygnusPlatformWebViewControllerMethod.getSettings,
  );

  final url = !kIsWeb ? TEST_CROSS_PLATFORM_URL_1 : TEST_WEB_PLATFORM_URL_1;

  skippableTestWidgets('set/get settings', (WidgetTester tester) async {
    final Completer<CygnusWebViewController> controllerCompleter =
        Completer<CygnusWebViewController>();
    final Completer<void> pageLoaded = Completer<void>();

    await tester.pumpWidget(
      Directionality(
        textDirection: TextDirection.ltr,
        child: CygnusWebView(
          key: GlobalKey(),
          initialUrlRequest: CygnusURLRequest(url: url),
          initialSettings: CygnusWebViewSettings(javaScriptEnabled: false),
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
    await tester.pumpAndSettle();
    final CygnusWebViewController controller = await controllerCompleter.future;
    await pageLoaded.future;

    CygnusWebViewSettings? settings = await controller.getSettings();
    expect(settings, isNotNull);
    expect(settings!.javaScriptEnabled, false);

    if (kIsWeb) {
      expect(settings.iframeSandbox, isNotNull);
      expect(settings.iframeSandbox!.contains(CygnusSandbox.ALLOW_SCRIPTS), false);
    }

    await controller.setSettings(
      settings: CygnusWebViewSettings(javaScriptEnabled: true),
    );

    settings = await controller.getSettings();
    expect(settings, isNotNull);
    expect(settings!.javaScriptEnabled, true);

    if (kIsWeb) {
      expect(settings.iframeSandbox, isNotNull);
      expect(settings.iframeSandbox!.contains(CygnusSandbox.ALLOW_SCRIPTS), true);
    }
  }, skip: shouldSkip);
}
