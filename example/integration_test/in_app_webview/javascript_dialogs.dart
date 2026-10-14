part of 'main.dart';

void javascriptDialogs() {
  final shouldSkip = !CygnusWebView.isPropertySupported(
    CygnusPlatformWebViewCreationParamsProperty.onJsAlert,
  );

  skippableTestWidgets('javascript dialogs', (WidgetTester tester) async {
    final Completer<CygnusWebViewController> controllerCompleter =
        Completer<CygnusWebViewController>();
    final Completer<void> pageLoaded = Completer<void>();
    final Completer<CygnusJsAlertRequest> alertCompleter =
        Completer<CygnusJsAlertRequest>();
    final Completer<bool> confirmCompleter = Completer<bool>();
    final Completer<String> promptCompleter = Completer<String>();
    await tester.pumpWidget(
      Directionality(
        textDirection: TextDirection.ltr,
        child: CygnusWebView(
          key: GlobalKey(),
          initialFile: "test_assets/in_app_webview_on_js_dialog_test.html",
          initialSettings: CygnusWebViewSettings(clearCache: true),
          onWebViewCreated: (controller) {
            controllerCompleter.complete(controller);

            controller.addJavaScriptHandler(
              handlerName: 'confirm',
              callback: (args) {
                confirmCompleter.complete(args[0] as bool);
              },
            );

            controller.addJavaScriptHandler(
              handlerName: 'prompt',
              callback: (args) {
                promptCompleter.complete(args[0] as String);
              },
            );
          },
          onLoadStop: (controller, url) {
            pageLoaded.complete();
          },
          onJsAlert: (controller, jsAlertRequest) async {
            CygnusJsAlertResponseAction action = CygnusJsAlertResponseAction.CONFIRM;
            alertCompleter.complete(jsAlertRequest);
            return CygnusJsAlertResponse(handledByClient: true, action: action);
          },
          onJsConfirm: (controller, jsConfirmRequest) async {
            CygnusJsConfirmResponseAction action = CygnusJsConfirmResponseAction.CONFIRM;
            return CygnusJsConfirmResponse(handledByClient: true, action: action);
          },
          onJsPrompt: (controller, jsPromptRequest) async {
            CygnusJsPromptResponseAction action = CygnusJsPromptResponseAction.CONFIRM;
            return CygnusJsPromptResponse(
              handledByClient: true,
              action: action,
              value: 'new value',
            );
          },
        ),
      ),
    );

    await pageLoaded.future;

    final CygnusJsAlertRequest jsAlertRequest = await alertCompleter.future;
    expect(jsAlertRequest.message, 'alert message');

    final bool onJsConfirmValue = await confirmCompleter.future;
    expect(onJsConfirmValue, true);

    final String onJsPromptValue = await promptCompleter.future;
    expect(onJsPromptValue, 'new value');
  }, skip: shouldSkip);
}
