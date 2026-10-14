part of 'main.dart';

void customMenuItems() {
  final shouldSkip = !CygnusBrowser.isClassSupported();

  skippableTest('custom menu items', () async {
    var inAppBrowser = new MyInAppBrowser();

    final data = (await rootBundle.load(
      'test_assets/images/flutter-logo.png',
    )).buffer.asUint8List();

    inAppBrowser.addMenuItem(
      CygnusBrowserMenuItem(
        id: 0,
        title: 'Menu Item 0',
        iconColor: Colors.black,
        order: 0,
        onClick: () {
          inAppBrowser.webViewController?.reload();
        },
      ),
    );
    inAppBrowser.addMenuItem(
      CygnusBrowserMenuItem(
        id: 1,
        title: 'Menu Item 1',
        icon: data,
        showAsAction: true,
        order: 2,
        onClick: () {
          inAppBrowser.webViewController?.reload();
        },
      ),
    );

    var icon = null;
    if ([
      TargetPlatform.iOS,
      TargetPlatform.macOS,
    ].contains(defaultTargetPlatform)) {
      icon = CygnusUIImage(systemName: 'ellipsis.circle');
    } else if (defaultTargetPlatform == TargetPlatform.android) {
      icon = CygnusAndroidResource.drawable(
        name: 'ic_menu_edit',
        defPackage: 'android',
      );
    }
    inAppBrowser.addMenuItem(
      CygnusBrowserMenuItem(
        id: 2,
        title: 'Menu Item 2',
        icon: icon,
        iconColor: Colors.red,
        showAsAction: true,
        order: 1,
        onClick: () {
          inAppBrowser.webViewController?.reload();
        },
      ),
    );

    await inAppBrowser.openUrlRequest(
      urlRequest: CygnusURLRequest(url: TEST_URL_1),
      settings: CygnusBrowserClassSettings(
        browserSettings: CygnusBrowserSettings(hideDefaultMenuItems: true),
      ),
    );
    await inAppBrowser.browserCreated.future;
    await inAppBrowser.firstPageLoaded.future;

    await expectLater(inAppBrowser.close(), completes);
  }, skip: shouldSkip);
}
