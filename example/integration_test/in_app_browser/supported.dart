part of 'main.dart';

void supported() {
  skippableGroup('supported', () {
    skippableTestWidgets('basic', (WidgetTester tester) async {
      expect(CygnusBrowser.isClassSupported(), true);
      expect(
        CygnusBrowser.isPropertySupported(CygnusPlatformBrowserProperty.windowId),
        true,
      );
      expect(
        CygnusBrowser.isMethodSupported(
          CygnusPlatformBrowserMethod.openUrlRequest,
        ),
        true,
      );
      expect(
        CygnusBrowser.isMethodSupported(CygnusPlatformBrowserMethod.close),
        true,
      );
      expect(
        CygnusBrowser.isMethodSupported(CygnusPlatformBrowserMethod.hide),
        true,
      );
      expect(
        CygnusBrowser.isMethodSupported(CygnusPlatformBrowserMethod.show),
        true,
      );
      expect(
        CygnusBrowser.isEventMethodSupported(
          CygnusPlatformBrowserEventsMethod.onWebContentProcessDidTerminate,
        ),
        [
          TargetPlatform.iOS,
          TargetPlatform.macOS,
          TargetPlatform.windows,
        ].contains(defaultTargetPlatform),
      );
      expect(
        CygnusBrowser.isEventMethodSupported(
          CygnusPlatformBrowserEventsMethod.onAcceleratorKeyPressed,
        ),
        defaultTargetPlatform == TargetPlatform.windows,
      );

      expect(
        CygnusBrowserSettings.isPropertySupported(
          CygnusBrowserSettingsProperty.toolbarBottomTintColor,
        ),
        defaultTargetPlatform == TargetPlatform.iOS,
      );
      expect(
        CygnusBrowserSettings.isPropertySupported(
          CygnusBrowserSettingsProperty.hidden,
        ),
        true,
      );
      expect(
        CygnusBrowserSettings.isPropertySupported(
          CygnusBrowserSettingsProperty.closeOnCannotGoBack,
        ),
        defaultTargetPlatform == TargetPlatform.android,
      );
    }, skip: false);
  }, skip: false);
}
