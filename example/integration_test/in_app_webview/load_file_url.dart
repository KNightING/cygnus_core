part of 'main.dart';

void loadFileUrl() {
  final shouldSkip = !CygnusWebViewSettings.isPropertySupported(
    CygnusWebViewSettingsProperty.allowingReadAccessTo,
  );

  skippableGroup('load file URL', () {
    late Directory appSupportDir;
    late File fileHtml;
    late File fileJs;

    setUpAll(() async {
      appSupportDir = (await getApplicationSupportDirectory());

      final Directory htmlFolder = Directory('${appSupportDir.path}/html/');
      if (!await htmlFolder.exists()) {
        await htmlFolder.create(recursive: true);
      }

      final Directory jsFolder = Directory('${appSupportDir.path}/js/');
      if (!await jsFolder.exists()) {
        await jsFolder.create(recursive: true);
      }

      var html = """
      <!DOCTYPE html><html>
      <head>
        <title>file scheme</title>
      </head>
      <body>
        <script src="../js/main.js"></script>
      </body>
      </html>
    """;
      fileHtml = File(htmlFolder.path + "index.html");
      fileHtml.writeAsStringSync(html);

      var js = """
      console.log('message');
      """;
      fileJs = File(jsFolder.path + "main.js");
      fileJs.writeAsStringSync(js);
    });

    skippableTestWidgets(
      'initialUrl with file:// scheme and allowingReadAccessTo',
      (WidgetTester tester) async {
        final Completer<CygnusConsoleMessage?> consoleMessageShouldNotComplete =
            Completer<CygnusConsoleMessage?>();
        await tester.pumpWidget(
          Directionality(
            textDirection: TextDirection.ltr,
            child: CygnusWebView(
              key: GlobalKey(),
              initialUrlRequest: CygnusURLRequest(
                url: CygnusWebUri('file://${fileHtml.path}'),
              ),
              onConsoleMessage: (controller, consoleMessage) {
                consoleMessageShouldNotComplete.complete(consoleMessage);
              },
            ),
          ),
        );
        var result = await consoleMessageShouldNotComplete.future.timeout(
          const Duration(seconds: 2),
          onTimeout: () => null,
        );
        expect(result, null);

        final Completer<CygnusConsoleMessage> consoleMessageCompleter =
            Completer<CygnusConsoleMessage>();
        await tester.pumpWidget(
          Directionality(
            textDirection: TextDirection.ltr,
            child: CygnusWebView(
              key: GlobalKey(),
              initialUrlRequest: CygnusURLRequest(
                url: CygnusWebUri('file://${fileHtml.path}'),
              ),
              initialSettings: CygnusWebViewSettings(
                allowingReadAccessTo: CygnusWebUri('file://${appSupportDir.path}/'),
              ),
              onConsoleMessage: (controller, consoleMessage) {
                consoleMessageCompleter.complete(consoleMessage);
              },
            ),
          ),
        );
        final CygnusConsoleMessage consoleMessage =
            await consoleMessageCompleter.future;
        expect(consoleMessage.messageLevel, CygnusConsoleMessageLevel.LOG);
        expect(consoleMessage.message, 'message');
      },
    );

    skippableTestWidgets(
      'loadUrl with file:// scheme and allowingReadAccessTo argument',
      (WidgetTester tester) async {
        final Completer<CygnusConsoleMessage?> consoleMessageShouldNotComplete =
            Completer<CygnusConsoleMessage?>();
        await tester.pumpWidget(
          Directionality(
            textDirection: TextDirection.ltr,
            child: CygnusWebView(
              key: GlobalKey(),
              onWebViewCreated: (controller) {
                controller.loadUrl(
                  urlRequest: CygnusURLRequest(
                    url: CygnusWebUri('file://${fileHtml.path}'),
                  ),
                );
              },
              onConsoleMessage: (controller, consoleMessage) {
                consoleMessageShouldNotComplete.complete(consoleMessage);
              },
            ),
          ),
        );
        var result = await consoleMessageShouldNotComplete.future.timeout(
          const Duration(seconds: 2),
          onTimeout: () => null,
        );
        expect(result, null);

        final Completer<CygnusConsoleMessage> consoleMessageCompleter =
            Completer<CygnusConsoleMessage>();
        await tester.pumpWidget(
          Directionality(
            textDirection: TextDirection.ltr,
            child: CygnusWebView(
              key: GlobalKey(),
              onWebViewCreated: (controller) {
                controller.loadUrl(
                  urlRequest: CygnusURLRequest(
                    url: CygnusWebUri('file://${fileHtml.path}'),
                  ),
                  allowingReadAccessTo: CygnusWebUri('file://${appSupportDir.path}/'),
                );
              },
              onConsoleMessage: (controller, consoleMessage) {
                consoleMessageCompleter.complete(consoleMessage);
              },
            ),
          ),
        );
        final CygnusConsoleMessage consoleMessage =
            await consoleMessageCompleter.future;
        expect(consoleMessage.messageLevel, CygnusConsoleMessageLevel.LOG);
        expect(consoleMessage.message, 'message');
      },
    );
  }, skip: shouldSkip);
}
