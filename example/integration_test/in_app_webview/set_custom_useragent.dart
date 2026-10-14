part of 'main.dart';

void setCustomUserAgent() {
  final shouldSkip = !CygnusWebViewSettings.isPropertySupported(
    CygnusWebViewSettingsProperty.userAgent,
  );

  skippableTestWidgets('set custom userAgent', (WidgetTester tester) async {
    final Completer controllerCompleter1 = Completer<CygnusWebViewController>();
    await tester.pumpWidget(
      Directionality(
        textDirection: TextDirection.ltr,
        child: CygnusWebView(
          initialUrlRequest: CygnusURLRequest(url: TEST_URL_ABOUT_BLANK),
          initialSettings: CygnusWebViewSettings(
            javaScriptEnabled: true,
            userAgent: 'Custom_User_Agent1',
          ),
          onWebViewCreated: (controller) {
            controllerCompleter1.complete(controller);
          },
        ),
      ),
    );
    CygnusWebViewController controller1 = await controllerCompleter1.future;
    final String customUserAgent1 = await controller1.evaluateJavascript(
      source: 'navigator.userAgent;',
    );
    expect(customUserAgent1, 'Custom_User_Agent1');

    await controller1.setSettings(
      settings: CygnusWebViewSettings(userAgent: 'Custom_User_Agent2'),
    );

    final String customUserAgent2 = await controller1.evaluateJavascript(
      source: 'navigator.userAgent;',
    );
    expect(customUserAgent2, 'Custom_User_Agent2');
  }, skip: shouldSkip);
}
