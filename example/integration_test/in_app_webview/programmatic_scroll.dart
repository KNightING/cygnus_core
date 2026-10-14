part of 'main.dart';

void programmaticScroll() {
  final shouldSkip = !CygnusWebViewController.isMethodSupported(
    CygnusPlatformWebViewControllerMethod.scrollTo,
  );

  skippableGroup('Programmatic Scroll', () {
    final shouldSkipTest1 = !CygnusWebViewController.isMethodSupported(
      CygnusPlatformWebViewControllerMethod.scrollTo,
    );

    skippableTestWidgets('set and get scroll position', (
      WidgetTester tester,
    ) async {
      final String scrollTestPage = '''
        <!DOCTYPE html>
        <html>
          <head>
            <style>
              body {
                height: 100%;
                width: 100%;
              }
              #container{
                width:5000px;
                height:5000px;
            }
            </style>
          </head>
          <body>
            <div id="container"/>
          </body>
        </html>
      ''';

      final String scrollTestPageBase64 = base64Encode(
        const Utf8Encoder().convert(scrollTestPage),
      );

      var url = !kIsWeb
          ? CygnusWebUri('data:text/html;charset=utf-8;base64,$scrollTestPageBase64')
          : TEST_WEB_PLATFORM_URL_1;

      final Completer<void> pageLoaded = Completer<void>();
      final Completer<CygnusWebViewController> controllerCompleter =
          Completer<CygnusWebViewController>();

      await tester.pumpWidget(
        Directionality(
          textDirection: TextDirection.ltr,
          child: CygnusWebView(
            initialUrlRequest: CygnusURLRequest(url: url),
            onWebViewCreated: (controller) {
              controllerCompleter.complete(controller);
            },
            onLoadStop: (controller, url) {
              pageLoaded.complete();
            },
          ),
        ),
      );

      final CygnusWebViewController controller =
          await controllerCompleter.future;
      await tester.pump();
      await pageLoaded.future;

      await controller.scrollTo(x: 0, y: 0);

      // Check scrollTo()
      const int X_SCROLL = 123;
      const int Y_SCROLL = 321;

      await controller.scrollTo(x: X_SCROLL, y: Y_SCROLL);
      int? scrollPosX = await controller.getScrollX();
      int? scrollPosY = await controller.getScrollY();
      expect(scrollPosX, X_SCROLL);
      expect(scrollPosY, Y_SCROLL);

      // Check scrollBy() (on top of scrollTo())
      await controller.scrollBy(x: X_SCROLL, y: Y_SCROLL);
      scrollPosX = await controller.getScrollX();
      scrollPosY = await controller.getScrollY();
      expect(scrollPosX, X_SCROLL * 2);
      expect(scrollPosY, Y_SCROLL * 2);
    }, skip: shouldSkipTest1);

    final shouldSkipTest2 =
        kIsWeb ||
        !CygnusWebViewSettings.isPropertySupported(
          CygnusWebViewSettingsProperty.useHybridComposition,
        );

    testWidgets(
      'set and get scroll position on Android without Hybrid Composition',
      (WidgetTester tester) async {
        final String scrollTestPage = '''
        <!DOCTYPE html>
        <html>
          <head>
            <style>
              body {
                height: 100%;
                width: 100%;
              }
              #container{
                width:5000px;
                height:5000px;
            }
            </style>
          </head>
          <body>
            <div id="container"/>
          </body>
        </html>
      ''';

        final String scrollTestPageBase64 = base64Encode(
          const Utf8Encoder().convert(scrollTestPage),
        );

        final Completer<void> pageLoaded = Completer<void>();
        final Completer<CygnusWebViewController> controllerCompleter =
            Completer<CygnusWebViewController>();

        await tester.pumpWidget(
          Directionality(
            textDirection: TextDirection.ltr,
            child: CygnusWebView(
              initialUrlRequest: CygnusURLRequest(
                url: CygnusWebUri(
                  'data:text/html;charset=utf-8;base64,$scrollTestPageBase64',
                ),
              ),
              onWebViewCreated: (controller) {
                controllerCompleter.complete(controller);
              },
              initialSettings: CygnusWebViewSettings(
                useHybridComposition: false,
              ),
              onLoadStop: (controller, url) {
                pageLoaded.complete();
              },
            ),
          ),
        );

        final CygnusWebViewController controller =
            await controllerCompleter.future;
        await pageLoaded.future;
        await controller.scrollTo(x: 0, y: 0);

        await tester.pumpAndSettle(Duration(seconds: 3));

        // Check scrollTo()
        const int X_SCROLL = 123;
        const int Y_SCROLL = 321;

        await controller.scrollTo(x: X_SCROLL, y: Y_SCROLL);
        await tester.pumpAndSettle(Duration(seconds: 2));
        int? scrollPosX = await controller.getScrollX();
        int? scrollPosY = await controller.getScrollY();
        expect(scrollPosX, X_SCROLL);
        expect(scrollPosY, Y_SCROLL);

        // Check scrollBy() (on top of scrollTo())
        await controller.scrollBy(x: X_SCROLL, y: Y_SCROLL);
        await tester.pumpAndSettle(Duration(seconds: 2));
        scrollPosX = await controller.getScrollX();
        scrollPosY = await controller.getScrollY();
        expect(scrollPosX, X_SCROLL * 2);
        expect(scrollPosY, Y_SCROLL * 2);
      },
      skip: shouldSkipTest2,
    );
  }, skip: shouldSkip);
}
