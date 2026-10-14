part of 'main.dart';

void onConsoleMessage() {
  final shouldSkip = !CygnusWebView.isPropertySupported(
    CygnusPlatformWebViewCreationParamsProperty.onConsoleMessage,
  );

  skippableTestWidgets('onConsoleMessage', (WidgetTester tester) async {
    final Completer<CygnusWebViewController> controllerCompleter =
        Completer<CygnusWebViewController>();
    final Completer<CygnusConsoleMessage> onConsoleMessageCompleter =
        Completer<CygnusConsoleMessage>();
    await tester.pumpWidget(
      Directionality(
        textDirection: TextDirection.ltr,
        child: CygnusWebView(
          key: GlobalKey(),
          initialFile: !kIsWeb
              ? "test_assets/in_app_webview_on_console_message_test.html"
              : null,
          initialUrlRequest: kIsWeb
              ? CygnusURLRequest(url: TEST_WEB_PLATFORM_URL_1)
              : null,
          onWebViewCreated: (controller) {
            controllerCompleter.complete(controller);
          },
          onConsoleMessage: (controller, consoleMessage) {
            onConsoleMessageCompleter.complete(consoleMessage);
          },
        ),
      ),
    );
    await tester.pump();
    final CygnusConsoleMessage consoleMessage =
        await onConsoleMessageCompleter.future;
    expect(consoleMessage.message, 'message');
    expect(consoleMessage.messageLevel, CygnusConsoleMessageLevel.LOG);
  }, skip: shouldSkip);
}
