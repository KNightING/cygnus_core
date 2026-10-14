part of 'main.dart';

void webArchive() {
  final shouldSkip = !CygnusWebViewController.isMethodSupported(
    CygnusPlatformWebViewControllerMethod.saveWebArchive,
  );

  skippableGroup('web archive', () {
    final shouldSkipTest1 = !CygnusWebViewController.isMethodSupported(
      CygnusPlatformWebViewControllerMethod.createWebArchiveData,
    );

    skippableTestWidgets('create data', (WidgetTester tester) async {
      final Completer<CygnusWebViewController> controllerCompleter =
          Completer<CygnusWebViewController>();
      final Completer<void> pageLoaded = Completer<void>();

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
              pageLoaded.complete();
            },
          ),
        ),
      );

      final CygnusWebViewController controller =
          await controllerCompleter.future;
      await pageLoaded.future;

      expect(await controller.createWebArchiveData(), isNotNull);
    }, skip: shouldSkipTest1);

    skippableTestWidgets('save', (WidgetTester tester) async {
      final Completer<CygnusWebViewController> controllerCompleter =
          Completer<CygnusWebViewController>();
      final Completer<void> pageLoaded = Completer<void>();

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
              if (!pageLoaded.isCompleted) {
                pageLoaded.complete();
              }
            },
          ),
        ),
      );

      final CygnusWebViewController controller =
          await controllerCompleter.future;
      await pageLoaded.future;

      // wait a little bit after page load otherwise Android will not save the web archive
      await Future.delayed(Duration(seconds: 1));

      var supportDir = await getApplicationSupportDirectory();

      var fileName = "flutter-website.";
      if (CygnusWebArchiveFormat.MHT.isSupported()) {
        fileName = fileName + CygnusWebArchiveFormat.MHT.toValue();
      } else {
        fileName = fileName + CygnusWebArchiveFormat.WEBARCHIVE.toValue();
      }

      var fullPath = supportDir.path + Platform.pathSeparator + fileName;
      var path = await controller.saveWebArchive(filePath: fullPath);
      expect(path, isNotNull);
      expect(path, endsWith(fileName));

      path = await controller.saveWebArchive(
        filePath: supportDir.path,
        autoname: true,
      );
      expect(path, isNotNull);
    });
  }, skip: shouldSkip);
}
