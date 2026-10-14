part of 'main.dart';

void onReceivedIcon() {
  final shouldSkip = !CygnusWebView.isPropertySupported(
    CygnusPlatformWebViewCreationParamsProperty.onReceivedIcon,
  );

  skippableTestWidgets('onReceivedIcon', (WidgetTester tester) async {
    final Completer<CygnusWebViewController> controllerCompleter =
        Completer<CygnusWebViewController>();
    final Completer<void> pageLoaded = Completer<void>();
    final Completer<Uint8List> onReceivedIconCompleter = Completer<Uint8List>();

    await tester.pumpWidget(
      Directionality(
        textDirection: TextDirection.ltr,
        child: CygnusWebView(
          key: GlobalKey(),
          initialUrlRequest: CygnusURLRequest(url: TEST_URL_1),
          onWebViewCreated: (controller) {
            controllerCompleter.complete(controller);
          },
          onLoadStop: (controller, url) {
            pageLoaded.complete();
          },
          onReceivedIcon: (controller, icon) {
            if (!onReceivedIconCompleter.isCompleted) {
              onReceivedIconCompleter.complete(icon);
            }
          },
        ),
      ),
    );

    await pageLoaded.future;
    final Uint8List icon = await onReceivedIconCompleter.future;
    expect(icon, isNotNull);
  }, skip: shouldSkip);
}
