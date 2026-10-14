part of 'main.dart';

void supported() {
  skippableGroup('supported', () {
    skippableTestWidgets('basic', (WidgetTester tester) async {
      expect(CygnusWebViewController.isClassSupported(), true);
      expect(
        CygnusWebViewController.isPropertySupported(
          CygnusPlatformWebViewControllerProperty.webStorage,
        ),
        true,
      );
      expect(
        CygnusWebViewController.isMethodSupported(
          CygnusPlatformWebViewControllerMethod.startSafeBrowsing,
        ),
        defaultTargetPlatform == TargetPlatform.android,
      );
      expect(
        CygnusWebViewController.isMethodSupported(
          CygnusPlatformWebViewControllerMethod.createPdf,
        ),
        [
          TargetPlatform.iOS,
          TargetPlatform.macOS,
        ].contains(defaultTargetPlatform),
      );
      expect(
        CygnusWebViewController.isMethodSupported(
          CygnusPlatformWebViewControllerMethod.clearSslPreferences,
        ),
        [
          TargetPlatform.android,
          TargetPlatform.windows,
        ].contains(defaultTargetPlatform),
      );
      expect(
        CygnusWebViewController.isMethodSupported(
          CygnusPlatformWebViewControllerMethod.openDevTools,
        ),
        defaultTargetPlatform == TargetPlatform.windows,
      );

      expect(CygnusWebView.isClassSupported(), true);
      expect(
        CygnusWebView.isPropertySupported(
          CygnusPlatformWebViewCreationParamsProperty.initialSettings,
        ),
        true,
      );
      expect(
        CygnusWebView.isPropertySupported(
          CygnusPlatformWebViewCreationParamsProperty.windowId,
        ),
        true,
      );
      expect(
        CygnusWebView.isPropertySupported(
          CygnusPlatformWebViewWidgetCreationParamsProperty.preventGestureDelay,
        ),
        defaultTargetPlatform == TargetPlatform.iOS,
      );
      expect(
        CygnusWebView.isPropertySupported(
          CygnusPlatformWebViewCreationParamsProperty.onWebContentProcessDidTerminate,
        ),
        [
          TargetPlatform.iOS,
          TargetPlatform.macOS,
          TargetPlatform.windows,
        ].contains(defaultTargetPlatform),
      );
      expect(
        CygnusWebView.isPropertySupported(
          CygnusPlatformWebViewCreationParamsProperty.onAcceleratorKeyPressed,
        ),
        defaultTargetPlatform == TargetPlatform.windows,
      );

      expect(
        CygnusWebViewSettings.isPropertySupported(
          CygnusWebViewSettingsProperty.algorithmicDarkeningAllowed,
        ),
        defaultTargetPlatform == TargetPlatform.android,
      );
      expect(
        CygnusWebViewSettings.isPropertySupported(
          CygnusWebViewSettingsProperty.allowsBackForwardNavigationGestures,
        ),
        [
          TargetPlatform.iOS,
          TargetPlatform.macOS,
          TargetPlatform.windows,
        ].contains(defaultTargetPlatform),
      );
      expect(
        CygnusWebViewSettings.isPropertySupported(
          CygnusWebViewSettingsProperty.handleAcceleratorKeyPressed,
        ),
        defaultTargetPlatform == TargetPlatform.windows,
      );
    }, skip: false);
  }, skip: false);
}
