part of 'main.dart';

void hideAndShow() {
  final shouldSkip = !CygnusBrowser.isClassSupported();

  skippableTest('hide and show', () async {
    var browser = new CygnusMyBrowser();
    await browser.openUrlRequest(
      urlRequest: CygnusURLRequest(url: TEST_URL_1),
      settings: CygnusBrowserClassSettings(
        browserSettings: CygnusBrowserSettings(hidden: true),
      ),
    );
    await browser.browserCreated.future;
    await browser.firstPageLoaded.future;

    expect(await browser.isHidden(), true);
    await expectLater(browser.show(), completes);
    expect(await browser.isHidden(), false);
    await expectLater(browser.hide(), completes);
    expect(await browser.isHidden(), true);

    await expectLater(browser.close(), completes);
  }, skip: shouldSkip);
}
