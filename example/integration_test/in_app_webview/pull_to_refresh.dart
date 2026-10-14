part of 'main.dart';

void pullToRefresh() {
  final shouldSkip = !CygnusPullToRefreshController.isClassSupported();

  skippableTestWidgets('launches with pull-to-refresh feature', (
    WidgetTester tester,
  ) async {
    final Completer<CygnusWebViewController> controllerCompleter =
        Completer<CygnusWebViewController>();
    final pullToRefreshController = CygnusPullToRefreshController(
      settings: CygnusPullToRefreshSettings(
        color: Colors.blue,
        size: CygnusPullToRefreshSize.DEFAULT,
        backgroundColor: Colors.grey,
        enabled: true,
        slingshotDistance: 150,
        distanceToTriggerSync: 150,
        attributedTitle: CygnusAttributedString(string: "test"),
      ),
      onRefresh: () {},
    );

    await tester.pumpWidget(
      Directionality(
        textDirection: TextDirection.ltr,
        child: CygnusWebView(
          key: GlobalKey(),
          initialUrlRequest: CygnusURLRequest(url: TEST_URL_1),
          pullToRefreshController: pullToRefreshController,
          onWebViewCreated: (controller) {
            controllerCompleter.complete(controller);
          },
        ),
      ),
    );
    final CygnusWebViewController controller = await controllerCompleter.future;
    final String? currentUrl = (await controller.getUrl())?.toString();
    expect(currentUrl, TEST_URL_1.toString());
  }, skip: shouldSkip);
}
