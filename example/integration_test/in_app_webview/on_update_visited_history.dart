part of 'main.dart';

void onUpdateVisitedHistory() {
  final shouldSkip = !CygnusWebView.isPropertySupported(
    CygnusPlatformWebViewCreationParamsProperty.onUpdateVisitedHistory,
  );

  var url = !kIsWeb ? TEST_CROSS_PLATFORM_URL_1 : TEST_WEB_PLATFORM_URL_1;

  skippableTestWidgets('onUpdateVisitedHistory', (WidgetTester tester) async {
    final Completer<CygnusWebViewController> controllerCompleter =
        Completer<CygnusWebViewController>();
    final Completer<String> firstPushCompleter = Completer<String>();
    final Completer<String> secondPushCompleter = Completer<String>();
    final Completer<void> pageLoaded = Completer<void>();

    await tester.pumpWidget(
      Directionality(
        textDirection: TextDirection.ltr,
        child: CygnusWebView(
          key: GlobalKey(),
          initialUrlRequest: CygnusURLRequest(url: url),
          initialSettings: CygnusWebViewSettings(clearCache: true),
          onWebViewCreated: (controller) {
            controllerCompleter.complete(controller);
          },
          onLoadStop: (controller, url) {
            pageLoaded.complete();
          },
          onUpdateVisitedHistory: (controller, url, androidIsReload) async {
            if (url!.toString().endsWith("second-push")) {
              secondPushCompleter.complete(url.toString());
            } else if (url.toString().endsWith("first-push")) {
              firstPushCompleter.complete(url.toString());
            }
          },
        ),
      ),
    );

    final CygnusWebViewController controller = await controllerCompleter.future;
    await tester.pump();
    await pageLoaded.future;

    await controller.evaluateJavascript(
      source: """
var state = {}
var title = ''
var url = 'first-push';
history.pushState(state, title, url);

setTimeout(function() {
    var url = 'second-push';
    history.pushState(state, title, url);
}, 500);
""",
    );

    var firstPushUrl = await firstPushCompleter.future;
    expect(
      firstPushUrl,
      '${!kIsWeb ? TEST_CROSS_PLATFORM_URL_1 : TEST_WEB_PLATFORM_BASE_URL}first-push',
    );

    var secondPushUrl = await secondPushCompleter.future;
    expect(
      secondPushUrl,
      '${!kIsWeb ? TEST_CROSS_PLATFORM_URL_1 : TEST_WEB_PLATFORM_BASE_URL}second-push',
    );
  }, skip: shouldSkip);
}
