part of 'main.dart';

void audioPlaybackPolicy() {
  final shouldSkip = !CygnusWebViewSettings.isPropertySupported(
    CygnusWebViewSettingsProperty.mediaPlaybackRequiresUserGesture,
  );

  skippableGroup('Audio playback policy', () {
    String audioTestBase64 = "";
    setUpAll(() async {
      final ByteData audioData = await rootBundle.load(
        'test_assets/sample_audio.ogg',
      );
      final String base64AudioData = base64Encode(
        Uint8List.view(audioData.buffer),
      );
      final String audioTest =
          '''
        <!DOCTYPE html><html>
        <head><title>Audio auto play</title>
          <script type="text/javascript">
            function play() {
              var audio = document.getElementById("audio");
              audio.play();
            }
            function isPaused() {
              var audio = document.getElementById("audio");
              return audio.paused;
            }
          </script>
        </head>
        <body onload="play();">
        <audio controls id="audio">
          <source src="data:audio/ogg;charset=utf-8;base64,$base64AudioData">
        </audio>
        </body>
        </html>
      ''';
      audioTestBase64 = base64Encode(const Utf8Encoder().convert(audioTest));
    });

    skippableTestWidgets('Auto media playback', (WidgetTester tester) async {
      Completer<CygnusWebViewController> controllerCompleter =
          Completer<CygnusWebViewController>();
      Completer<void> pageStarted = Completer<void>();
      Completer<void> pageLoaded = Completer<void>();

      await tester.pumpWidget(
        Directionality(
          textDirection: TextDirection.ltr,
          child: CygnusWebView(
            key: GlobalKey(),
            initialUrlRequest: CygnusURLRequest(
              url: CygnusWebUri(
                'data:text/html;charset=utf-8;base64,$audioTestBase64',
              ),
            ),
            onWebViewCreated: (controller) {
              controllerCompleter.complete(controller);
            },
            initialSettings: CygnusWebViewSettings(
              javaScriptEnabled: true,
              mediaPlaybackRequiresUserGesture: false,
            ),
            onLoadStart: (controller, url) {
              pageStarted.complete();
            },
            onLoadStop: (controller, url) {
              pageLoaded.complete();
            },
          ),
        ),
      );
      CygnusWebViewController controller = await controllerCompleter.future;
      await pageStarted.future;
      await pageLoaded.future;

      bool isPaused = await controller.evaluateJavascript(
        source: 'isPaused();',
      );
      expect(isPaused, false);

      controllerCompleter = Completer<CygnusWebViewController>();
      pageStarted = Completer<void>();
      pageLoaded = Completer<void>();

      // We change the key to re-create a new webview as we change the mediaPlaybackRequiresUserGesture
      await tester.pumpWidget(
        Directionality(
          textDirection: TextDirection.ltr,
          child: CygnusWebView(
            key: GlobalKey(),
            initialUrlRequest: CygnusURLRequest(
              url: CygnusWebUri(
                'data:text/html;charset=utf-8;base64,$audioTestBase64',
              ),
            ),
            onWebViewCreated: (controller) {
              controllerCompleter.complete(controller);
            },
            initialSettings: CygnusWebViewSettings(
              javaScriptEnabled: true,
              mediaPlaybackRequiresUserGesture: true,
            ),
            onLoadStart: (controller, url) {
              pageStarted.complete();
            },
            onLoadStop: (controller, url) {
              pageLoaded.complete();
            },
          ),
        ),
      );

      controller = await controllerCompleter.future;
      await pageStarted.future;
      await pageLoaded.future;

      isPaused = await controller.evaluateJavascript(source: 'isPaused();');
      expect(isPaused, true);
    });
  }, skip: shouldSkip);
}
