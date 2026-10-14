part of 'main.dart';

void setGetSettings() {
  final shouldSkip = !CygnusBrowser.isClassSupported();

  skippableTest('set/get settings', () async {
    var inAppBrowser = new MyInAppBrowser();
    await inAppBrowser.openUrlRequest(
      urlRequest: CygnusURLRequest(url: TEST_URL_1),
      settings: CygnusBrowserClassSettings(
        browserSettings: CygnusBrowserSettings(hideToolbarTop: true),
      ),
    );
    await inAppBrowser.browserCreated.future;
    await inAppBrowser.firstPageLoaded.future;

    CygnusBrowserClassSettings? settings = await inAppBrowser.getSettings();
    expect(settings, isNotNull);
    expect(settings!.browserSettings.hideToolbarTop, true);

    await inAppBrowser.setSettings(
      settings: CygnusBrowserClassSettings(
        browserSettings: CygnusBrowserSettings(hideToolbarTop: false),
      ),
    );

    settings = await inAppBrowser.getSettings();
    expect(settings, isNotNull);
    expect(settings!.browserSettings.hideToolbarTop, false);

    await expectLater(inAppBrowser.close(), completes);
  }, skip: shouldSkip);
}
