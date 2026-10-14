part of 'main.dart';

void onReceivedError() {
  final shouldSkip = !CygnusWebView.isPropertySupported(
    CygnusPlatformWebViewCreationParamsProperty.onReceivedError,
  );

  skippableGroup('onReceivedError', () {
    skippableTestWidgets('invalid url', (WidgetTester tester) async {
      final Completer<String> errorUrlCompleter = Completer<String>();
      final Completer<CygnusWebResourceErrorType> errorCodeCompleter =
          Completer<CygnusWebResourceErrorType>();

      await tester.pumpWidget(
        Directionality(
          textDirection: TextDirection.ltr,
          child: CygnusWebView(
            key: GlobalKey(),
            initialUrlRequest: CygnusURLRequest(url: TEST_NOT_A_WEBSITE_URL),
            onReceivedError: (controller, request, error) {
              errorUrlCompleter.complete(request.url.toString());
              errorCodeCompleter.complete(error.type);
            },
          ),
        ),
      );

      final String url = await errorUrlCompleter.future;
      final CygnusWebResourceErrorType errorType = await errorCodeCompleter.future;

      expect(errorType, CygnusWebResourceErrorType.HOST_LOOKUP);
      expect(url, TEST_NOT_A_WEBSITE_URL.toString());
    });

    skippableTestWidgets('event is not called with valid url', (
      WidgetTester tester,
    ) async {
      final Completer<void> onReceivedErrorCompleter = Completer<void>();

      await tester.pumpWidget(
        Directionality(
          textDirection: TextDirection.ltr,
          child: CygnusWebView(
            key: GlobalKey(),
            initialUrlRequest: CygnusURLRequest(
              url: CygnusWebUri(
                'data:text/html;charset=utf-8;base64,PCFET0NUWVBFIGh0bWw+',
              ),
            ),
            onReceivedError: (controller, request, error) {
              onReceivedErrorCompleter.complete();
            },
          ),
        ),
      );

      expect(onReceivedErrorCompleter.future, doesNotComplete);
    });
  }, skip: shouldSkip);
}
