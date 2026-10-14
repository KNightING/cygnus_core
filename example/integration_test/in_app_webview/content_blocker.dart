part of 'main.dart';

void contentBlocker() {
  final shouldSkip = !CygnusWebViewSettings.isPropertySupported(
    CygnusWebViewSettingsProperty.contentBlockers,
  );

  skippableTestWidgets('Content Blocker', (WidgetTester tester) async {
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
          initialSettings: CygnusWebViewSettings(
            clearCache: true,
            contentBlockers: [
              CygnusContentBlocker(
                trigger: CygnusContentBlockerTrigger(
                  urlFilter: ".*",
                  resourceType: [
                    CygnusContentBlockerTriggerResourceType.IMAGE,
                    CygnusContentBlockerTriggerResourceType.STYLE_SHEET,
                  ],
                  ifTopUrl: [TEST_CROSS_PLATFORM_URL_1.toString()],
                ),
                action: CygnusContentBlockerAction(
                  type: CygnusContentBlockerActionType.BLOCK,
                ),
              ),
            ],
          ),
          onLoadStop: (controller, url) {
            pageLoaded.complete();
          },
        ),
      ),
    );
    await expectLater(pageLoaded.future, completes);
  }, skip: shouldSkip);
}
