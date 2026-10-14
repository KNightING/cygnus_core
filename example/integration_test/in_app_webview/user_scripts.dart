part of 'main.dart';

void userScripts() {
  final shouldSkip = !CygnusWebViewController.isMethodSupported(
    CygnusPlatformWebViewControllerMethod.addUserScript,
  );

  skippableGroup('user scripts', () {
    skippableTestWidgets('initialUserScripts', (WidgetTester tester) async {
      final Completer<CygnusWebViewController> controllerCompleter =
          Completer<CygnusWebViewController>();
      final Completer<void> pageLoaded = Completer<void>();

      await tester.pumpWidget(
        Directionality(
          textDirection: TextDirection.ltr,
          child: CygnusWebView(
            key: GlobalKey(),
            initialUrlRequest: CygnusURLRequest(url: TEST_CROSS_PLATFORM_URL_1),
            initialUserScripts: UnmodifiableListView<CygnusUserScript>([
              CygnusUserScript(
                source: "var foo = 49;",
                injectionTime: CygnusUserScriptInjectionTime.AT_DOCUMENT_START,
              ),
              CygnusUserScript(
                source: "var foo2 = 19;",
                injectionTime: CygnusUserScriptInjectionTime.AT_DOCUMENT_START,
                contentWorld: CygnusContentWorld.PAGE,
              ),
              CygnusUserScript(
                source: "var bar = 2;",
                injectionTime: CygnusUserScriptInjectionTime.AT_DOCUMENT_END,
                forMainFrameOnly:
                    defaultTargetPlatform != TargetPlatform.android,
                contentWorld: CygnusContentWorld.DEFAULT_CLIENT,
              ),
              CygnusUserScript(
                source: "var bar2 = 12;",
                injectionTime: CygnusUserScriptInjectionTime.AT_DOCUMENT_END,
                forMainFrameOnly:
                    defaultTargetPlatform != TargetPlatform.android,
                contentWorld: CygnusContentWorld.world(name: "test"),
              ),
            ]),
            onWebViewCreated: (controller) {
              controllerCompleter.complete(controller);
            },
            onLoadStop: (controller, url) async {
              pageLoaded.complete();
            },
          ),
        ),
      );
      final CygnusWebViewController controller =
          await controllerCompleter.future;
      await pageLoaded.future;

      expect(await controller.evaluateJavascript(source: "foo;"), 49);
      expect(await controller.evaluateJavascript(source: "foo2;"), 19);
      expect(
        await controller.evaluateJavascript(
          source: "foo2;",
          contentWorld: CygnusContentWorld.PAGE,
        ),
        19,
      );
      expect(await controller.evaluateJavascript(source: "bar;"), isNull);
      expect(await controller.evaluateJavascript(source: "bar2;"), isNull);
      expect(
        await controller.evaluateJavascript(
          source: "bar;",
          contentWorld: CygnusContentWorld.DEFAULT_CLIENT,
        ),
        2,
      );
      expect(
        await controller.evaluateJavascript(
          source: "bar2;",
          contentWorld: CygnusContentWorld.world(name: "test"),
        ),
        12,
      );
    });

    skippableTestWidgets('add/remove user scripts', (
      WidgetTester tester,
    ) async {
      final Completer<CygnusWebViewController> controllerCompleter =
          Completer<CygnusWebViewController>();
      final StreamController<String> pageLoads =
          StreamController<String>.broadcast();

      await tester.pumpWidget(
        Directionality(
          textDirection: TextDirection.ltr,
          child: CygnusWebView(
            key: GlobalKey(),
            initialUrlRequest: CygnusURLRequest(url: TEST_CROSS_PLATFORM_URL_1),
            onWebViewCreated: (controller) {
              controllerCompleter.complete(controller);
            },
            onLoadStop: (controller, url) {
              pageLoads.add(url!.toString());
            },
          ),
        ),
      );

      final CygnusWebViewController controller =
          await controllerCompleter.future;
      await pageLoads.stream.first;

      var userScript1 = CygnusUserScript(
        source: "window.foo = 49;",
        injectionTime: CygnusUserScriptInjectionTime.AT_DOCUMENT_START,
      );
      var userScript2 = CygnusUserScript(
        source: "window.bar = 19;",
        injectionTime: CygnusUserScriptInjectionTime.AT_DOCUMENT_END,
      );
      await controller.addUserScripts(userScripts: [userScript1, userScript2]);
      await controller.reload();
      await pageLoads.stream.first;
      var value = await controller.evaluateJavascript(source: "window.foo;");
      expect(value, 49);
      value = await controller.evaluateJavascript(source: "window.bar;");
      expect(value, 19);

      await controller.removeUserScript(userScript: userScript1);
      await controller.reload();
      await pageLoads.stream.first;
      value = await controller.evaluateJavascript(source: "window.foo;");
      expect(value, isNull);
      value = await controller.evaluateJavascript(source: "window.bar;");
      expect(value, 19);

      await controller.removeAllUserScripts();
      await controller.reload();
      await pageLoads.stream.first;
      value = await controller.evaluateJavascript(source: "window.foo;");
      expect(value, isNull);
      value = await controller.evaluateJavascript(source: "window.bar;");
      expect(value, isNull);

      pageLoads.close();
    });
  }, skip: shouldSkip);
}
