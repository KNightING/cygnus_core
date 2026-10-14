part of 'main.dart';

void openAndClose() {
  final shouldSkip = !CygnusChromeSafariBrowser.isMethodSupported(
    CygnusPlatformChromeSafariBrowserMethod.open,
  );

  skippableTest('open and close', () async {
    var chromeSafariBrowser = MyChromeSafariBrowser();
    expect(chromeSafariBrowser.isOpened(), false);

    await chromeSafariBrowser.open(
      url: TEST_URL_1,
      settings: CygnusChromeSafariBrowserSettings(
        shareState: CygnusCustomTabsShareState.SHARE_STATE_OFF,
        startAnimations: [
          CygnusAndroidResource.anim(name: "slide_in_left", defPackage: "android"),
          CygnusAndroidResource.anim(name: "slide_out_right", defPackage: "android"),
        ],
        exitAnimations: [
          CygnusAndroidResource.anim(
            name: "abc_slide_in_top",
            defPackage: "com.pichillilorenzo.flutter_inappwebviewexample",
          ),
          CygnusAndroidResource.anim(
            name: "abc_slide_out_top",
            defPackage: "com.pichillilorenzo.flutter_inappwebviewexample",
          ),
        ],
        keepAliveEnabled: true,
        dismissButtonStyle: CygnusDismissButtonStyle.CLOSE,
        presentationStyle: CygnusModalPresentationStyle.OVER_FULL_SCREEN,
        eventAttribution: CygnusUIEventAttribution(
          sourceIdentifier: 4,
          destinationURL: CygnusWebUri("https://shop.example/test.html"),
          sourceDescription: "Banner ad for Test.",
          purchaser: "Shop Example, Inc.",
        ),
        activityButton: CygnusActivityButton(
          templateImage: CygnusUIImage(systemName: "sun.max"),
          extensionIdentifier:
              "com.pichillilorenzo.flutterinappwebview-ios-example5.test",
        ),
      ),
    );
    await chromeSafariBrowser.opened.future;
    expect(chromeSafariBrowser.isOpened(), true);
    expect(() async {
      await chromeSafariBrowser.open(url: TEST_CROSS_PLATFORM_URL_1);
    }, throwsAssertionError);

    await expectLater(chromeSafariBrowser.firstPageLoaded.future, completes);
    await chromeSafariBrowser.close();
    await chromeSafariBrowser.closed.future;
    expect(chromeSafariBrowser.isOpened(), false);
  }, skip: shouldSkip);
}
