part of 'main.dart';

void webMessage() {
  final shouldSkip = !CygnusWebMessageChannel.isClassSupported();

  skippableGroup('CygnusWebMessage', () {
    skippableTestWidgets('CygnusWebMessageChannel post String', (
      WidgetTester tester,
    ) async {
      final Completer<CygnusWebViewController> controllerCompleter =
          Completer<CygnusWebViewController>();
      final Completer webMessageCompleter = Completer<String>();
      await tester.pumpWidget(
        Directionality(
          textDirection: TextDirection.ltr,
          child: CygnusWebView(
            key: GlobalKey(),
            initialData: CygnusWebViewInitialData(
              data: """
<!DOCTYPE html>
<html lang="en">
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>CygnusWebMessageChannel Test</title>
</head>
<body>
    <button id="button" onclick="port.postMessage(input.value);" />Send</button>
    <br />
    <input id="input" type="text" value="JavaScript To Native" />

    <script>
      var port;
      window.addEventListener('message', function(event) {
          if (event.data == 'capturePort') {
              if (event.ports[0] != null) {
                  port = event.ports[0];
                  port.onmessage = function (event) {
                      console.log(event.data);
                  };
              }
          }
      }, false);
    </script>
</body>
</html>
                      """,
            ),
            onWebViewCreated: (controller) {
              controllerCompleter.complete(controller);
            },
            onConsoleMessage: (controller, consoleMessage) {
              webMessageCompleter.complete(consoleMessage.message);
            },
            onLoadStop: (controller, url) async {
              var webMessageChannel = await controller
                  .createWebMessageChannel();
              var port1 = webMessageChannel!.port1;
              var port2 = webMessageChannel.port2;

              await port1.setWebMessageCallback((message) async {
                await port1.postMessage(
                  CygnusWebMessage(data: message!.data + " and back"),
                );
              });
              await controller.postWebMessage(
                message: CygnusWebMessage(data: "capturePort", ports: [port2]),
                targetOrigin: CygnusWebUri("*"),
              );
              await controller.evaluateJavascript(
                source: "document.getElementById('button').click();",
              );
            },
          ),
        ),
      );
      await controllerCompleter.future;

      final String message = await webMessageCompleter.future;
      expect(message, 'JavaScript To Native and back');
    });

    skippableTestWidgets('CygnusWebMessageChannel post ArrayBuffer', (
      WidgetTester tester,
    ) async {
      final Completer<CygnusWebViewController> controllerCompleter =
          Completer<CygnusWebViewController>();
      final Completer webMessageCompleter = Completer<String>();
      await tester.pumpWidget(
        Directionality(
          textDirection: TextDirection.ltr,
          child: CygnusWebView(
            key: GlobalKey(),
            initialData: CygnusWebViewInitialData(
              data: """
<!DOCTYPE html>
<html lang="en">
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>CygnusWebMessageChannel Test</title>
</head>
<body>
    <button id="button" onclick="port.postMessage(stringToBuffer(input.value));" />Send</button>
    <br />
    <input id="input" type="text" value="JavaScript To Native" />

    <script>
      function bufferToString(buffer) {
          return String.fromCharCode.apply(null, Array.from(new Uint8Array(buffer)));
      }
      
      function stringToBuffer(value) {
          var buffer = new ArrayBuffer(value.length);
          var view = new Uint8Array(buffer);
          for (var i = 0, length = value.length; i < length; i++) {
              view[i] = value.charCodeAt(i);
          }
          return buffer;
      }
      
      var port;
      window.addEventListener('message', function(event) {
          if (bufferToString(event.data) == 'capturePort') {
              if (event.ports[0] != null) {
                  port = event.ports[0];
                  port.onmessage = function (event) {
                      console.log(bufferToString(event.data));
                  };
              }
          }
      }, false);
    </script>
</body>
</html>
                      """,
            ),
            onWebViewCreated: (controller) {
              controllerCompleter.complete(controller);
            },
            onConsoleMessage: (controller, consoleMessage) {
              webMessageCompleter.complete(consoleMessage.message);
            },
            onLoadStop: (controller, url) async {
              var webMessageChannel = await controller
                  .createWebMessageChannel();
              var port1 = webMessageChannel!.port1;
              var port2 = webMessageChannel.port2;

              await port1.setWebMessageCallback((message) async {
                await port1.postMessage(
                  CygnusWebMessage(
                    data: utf8.encode(utf8.decode(message!.data) + " and back"),
                    type: CygnusWebMessageType.ARRAY_BUFFER,
                  ),
                );
              });
              await controller.postWebMessage(
                message: CygnusWebMessage(
                  data: utf8.encode("capturePort"),
                  type: CygnusWebMessageType.ARRAY_BUFFER,
                  ports: [port2],
                ),
                targetOrigin: CygnusWebUri("*"),
              );
              await controller.evaluateJavascript(
                source: "document.getElementById('button').click();",
              );
            },
          ),
        ),
      );
      await controllerCompleter.future;

      final String message = await webMessageCompleter.future;
      expect(message, 'JavaScript To Native and back');
    });

    skippableTestWidgets('CygnusWebMessageListener post String', (
      WidgetTester tester,
    ) async {
      final Completer<CygnusWebViewController> controllerCompleter =
          Completer<CygnusWebViewController>();
      final Completer<void> pageLoaded = Completer<void>();
      final Completer webMessageCompleter = Completer<String>();
      await tester.pumpWidget(
        Directionality(
          textDirection: TextDirection.ltr,
          child: CygnusWebView(
            key: GlobalKey(),
            onWebViewCreated: (controller) async {
              await controller.addWebMessageListener(
                CygnusWebMessageListener(
                  jsObjectName: "myTestObj",
                  allowedOriginRules: Set.from(["https://*.example.com"]),
                  onPostMessage:
                      (message, sourceOrigin, isMainFrame, replyProxy) {
                        if (isMainFrame &&
                            (sourceOrigin.toString() + '/') ==
                                TEST_URL_EXAMPLE.toString()) {
                          replyProxy.postMessage(
                            CygnusWebMessage(data: message!.data + " and back"),
                          );
                        } else {
                          replyProxy.postMessage(CygnusWebMessage(data: "Nope"));
                        }
                      },
                ),
              );
              controllerCompleter.complete(controller);
            },
            onConsoleMessage: (controller, consoleMessage) {
              webMessageCompleter.complete(consoleMessage.message);
            },
            onLoadStop: (controller, url) async {
              if (url.toString() == TEST_URL_EXAMPLE.toString()) {
                pageLoaded.complete();
              }
            },
          ),
        ),
      );
      final controller = await controllerCompleter.future;
      await controller.loadUrl(urlRequest: CygnusURLRequest(url: TEST_URL_EXAMPLE));
      await pageLoaded.future;

      await controller.evaluateJavascript(
        source: """
          myTestObj.addEventListener('message', function(event) {
            console.log(event.data);
          });
          myTestObj.postMessage('JavaScript To Native');
        """,
      );

      final String message = await webMessageCompleter.future;
      expect(message, 'JavaScript To Native and back');
    });

    skippableTestWidgets('CygnusWebMessageListener post ArrayBuffer', (
      WidgetTester tester,
    ) async {
      final Completer<CygnusWebViewController> controllerCompleter =
          Completer<CygnusWebViewController>();
      final Completer<void> pageLoaded = Completer<void>();
      final Completer webMessageCompleter = Completer<String>();
      await tester.pumpWidget(
        Directionality(
          textDirection: TextDirection.ltr,
          child: CygnusWebView(
            key: GlobalKey(),
            onWebViewCreated: (controller) async {
              await controller.addWebMessageListener(
                CygnusWebMessageListener(
                  jsObjectName: "myTestObj",
                  allowedOriginRules: Set.from(["https://*.example.com"]),
                  onPostMessage:
                      (message, sourceOrigin, isMainFrame, replyProxy) {
                        if (isMainFrame &&
                            (sourceOrigin.toString() + '/') ==
                                TEST_URL_EXAMPLE.toString()) {
                          replyProxy.postMessage(
                            CygnusWebMessage(
                              data: utf8.encode(
                                utf8.decode(message!.data) + " and back",
                              ),
                              type: CygnusWebMessageType.ARRAY_BUFFER,
                            ),
                          );
                        } else {
                          replyProxy.postMessage(
                            CygnusWebMessage(
                              data: utf8.encode("Nope"),
                              type: CygnusWebMessageType.ARRAY_BUFFER,
                            ),
                          );
                        }
                      },
                ),
              );
              controllerCompleter.complete(controller);
            },
            onConsoleMessage: (controller, consoleMessage) {
              webMessageCompleter.complete(consoleMessage.message);
            },
            onLoadStop: (controller, url) async {
              if (url.toString() == TEST_URL_EXAMPLE.toString()) {
                pageLoaded.complete();
              }
            },
          ),
        ),
      );
      final controller = await controllerCompleter.future;
      await controller.loadUrl(urlRequest: CygnusURLRequest(url: TEST_URL_EXAMPLE));
      await pageLoaded.future;

      await controller.evaluateJavascript(
        source: """
          function bufferToString(buffer) {
              return String.fromCharCode.apply(null, Array.from(new Uint8Array(buffer)));
          }
          
          function stringToBuffer(value) {
              var buffer = new ArrayBuffer(value.length);
              var view = new Uint8Array(buffer);
              for (var i = 0, length = value.length; i < length; i++) {
                  view[i] = value.charCodeAt(i);
              }
              return buffer;
          }
          
          myTestObj.addEventListener('message', function(event) {
            console.log(bufferToString(event.data));
          });
          myTestObj.postMessage(stringToBuffer('JavaScript To Native'));
        """,
      );

      final String message = await webMessageCompleter.future;
      expect(message, 'JavaScript To Native and back');
    });
  }, skip: shouldSkip);
}
