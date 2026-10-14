part of 'main.dart';

void onPageCommitVisible() {
  final shouldSkip = !CygnusWebView.isPropertySupported(
    CygnusPlatformWebViewCreationParamsProperty.onPageCommitVisible,
  );

  skippableTestWidgets('onPageCommitVisible', (WidgetTester tester) async {
    final Completer<CygnusWebViewController> controllerCompleter =
        Completer<CygnusWebViewController>();
    final Completer<String> onPageCommitVisibleCompleter = Completer<String>();

    await tester.pumpWidget(
      Directionality(
        textDirection: TextDirection.ltr,
        child: CygnusWebView(
          key: GlobalKey(),
          initialUrlRequest: CygnusURLRequest(url: TEST_URL_1),
          onWebViewCreated: (controller) {
            controllerCompleter.complete(controller);
          },
          onPageCommitVisible: (controller, url) {
            onPageCommitVisibleCompleter.complete(url?.toString());
          },
        ),
      ),
    );

    final String? url = await onPageCommitVisibleCompleter.future;
    expect(url, TEST_URL_1.toString());
  }, skip: shouldSkip);
}
