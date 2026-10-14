part of 'main.dart';

void safeBrowsing() {
  final shouldSkip = !CygnusWebView.isPropertySupported(
    CygnusPlatformWebViewCreationParamsProperty.onSafeBrowsingHit,
  );

  skippableGroup('safe browsing', () {
    skippableTestWidgets('onSafeBrowsingHit', (WidgetTester tester) async {
      final Completer<String> pageLoaded = Completer<String>();
      await tester.pumpWidget(
        Directionality(
          textDirection: TextDirection.ltr,
          child: CygnusWebView(
            key: GlobalKey(),
            initialUrlRequest: CygnusURLRequest(
              url: TEST_CHROME_SAFE_BROWSING_MALWARE,
            ),
            initialSettings: CygnusWebViewSettings(
              // if I set javaScriptEnabled to true, it will crash!
              javaScriptEnabled: false,
              clearCache: true,
              safeBrowsingEnabled: true,
            ),
            onWebViewCreated: (controller) {
              controller.startSafeBrowsing();
            },
            onLoadStop: (controller, url) {
              pageLoaded.complete(url!.toString());
            },
            onSafeBrowsingHit: (controller, url, threatType) async {
              return CygnusSafeBrowsingResponse(
                report: true,
                action: CygnusSafeBrowsingResponseAction.PROCEED,
              );
            },
          ),
        ),
      );

      final String url = await pageLoaded.future;
      expect(url, TEST_CHROME_SAFE_BROWSING_MALWARE.toString());
    });

    skippableTest('getSafeBrowsingPrivacyPolicyUrl', () async {
      expect(
        await CygnusWebViewController.getSafeBrowsingPrivacyPolicyUrl(),
        isNotNull,
      );
    });

    skippableTest('setSafeBrowsingWhitelist', () async {
      expect(
        await CygnusWebViewController.setSafeBrowsingAllowlist(
          hosts: ["flutter.dev", "github.com"],
        ),
        true,
      );
    });
  }, skip: shouldSkip);
}
