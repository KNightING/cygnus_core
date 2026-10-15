part of 'main.dart';

void setGetSettings() {
  final shouldSkip = !CygnusBrowser.isClassSupported();

  skippableTest('set/get settings', () async {
    var browser = new CygnusMyBrowser();
    await browser.openUrlRequest(
      urlRequest: CygnusURLRequest(url: TEST_URL_1),
      settings: CygnusBrowserClassSettings(
        browserSettings: CygnusBrowserSettings(hideToolbarTop: true),
      ),
    );
    await browser.browserCreated.future;
    await browser.firstPageLoaded.future;

    CygnusBrowserClassSettings? settings = await browser.getSettings();
    expect(settings, isNotNull);
    expect(settings!.browserSettings.hideToolbarTop, true);

    await browser.setSettings(
      settings: CygnusBrowserClassSettings(
        browserSettings: CygnusBrowserSettings(hideToolbarTop: false),
      ),
    );

    settings = await browser.getSettings();
    expect(settings, isNotNull);
    expect(settings!.browserSettings.hideToolbarTop, false);

    await expectLater(browser.close(), completes);
  }, skip: shouldSkip);
}
