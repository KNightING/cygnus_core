// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'platform_chrome_safari_browser.dart';

// **************************************************************************
// SupportedPlatformsGenerator
// **************************************************************************

extension _CygnusPlatformChromeSafariBrowserClassSupported
    on CygnusPlatformChromeSafariBrowser {
  ///{@template cygnus_core.CygnusPlatformChromeSafariBrowser.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android Chrome Custom Tabs:
  ///    - This class uses native [Chrome Custom Tabs](https://developer.android.com/reference/android/support/customtabs/package-summary). If you want to use the `CygnusChromeSafariBrowser` class on Android 11+ you need to specify your app querying for `android.support.customtabs.action.CustomTabsService` in your `AndroidManifest.xml` (you can read more about it here: https://developers.google.com/web/android/custom-tabs/best-practices#applications_targeting_android_11_api_level_30_or_above).
  ///- iOS SFSafariViewController:
  ///    - This class uses native [SFSafariViewController](https://developer.apple.com/documentation/safariservices/sfsafariviewcontroller)
  ///
  ///Use the [CygnusPlatformChromeSafariBrowser.isClassSupported] method to check if this class is supported at runtime.
  ///{@endtemplate}
  static bool isClassSupported({TargetPlatform? platform}) {
    return ((kIsWeb && platform != null) || !kIsWeb) &&
        [
          TargetPlatform.android,
          TargetPlatform.iOS,
        ].contains(platform ?? defaultTargetPlatform);
  }
}

///List of [CygnusPlatformChromeSafariBrowser]'s methods that can be used to check if they are supported or not by the current platform.
enum CygnusPlatformChromeSafariBrowserMethod {
  ///Can be used to check if the [CygnusPlatformChromeSafariBrowser.addMenuItem] method is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusPlatformChromeSafariBrowser.addMenuItem.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android Chrome Custom Tabs:
  ///    - Not available in a Trusted Web Activity.
  ///- iOS SFSafariViewController
  ///
  ///**Parameters - Officially Supported Platforms/Implementations**:
  ///- [menuItem]: all platforms
  ///
  ///Use the [CygnusPlatformChromeSafariBrowser.isMethodSupported] method to check if this method is supported at runtime.
  ///{@endtemplate}
  addMenuItem,

  ///Can be used to check if the [CygnusPlatformChromeSafariBrowser.addMenuItems] method is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusPlatformChromeSafariBrowser.addMenuItems.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android Chrome Custom Tabs:
  ///    - Not available in a Trusted Web Activity.
  ///- iOS SFSafariViewController
  ///
  ///**Parameters - Officially Supported Platforms/Implementations**:
  ///- [menuItems]: all platforms
  ///
  ///Use the [CygnusPlatformChromeSafariBrowser.isMethodSupported] method to check if this method is supported at runtime.
  ///{@endtemplate}
  addMenuItems,

  ///Can be used to check if the [CygnusPlatformChromeSafariBrowser.clearWebsiteData] method is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusPlatformChromeSafariBrowser.clearWebsiteData.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- iOS SFSafariViewController 16.0+ ([Official API - SFSafariViewController.DataStore.clearWebsiteData](https://developer.apple.com/documentation/safariservices/sfsafariviewcontroller/datastore/3981117-clearwebsitedata))
  ///
  ///Use the [CygnusPlatformChromeSafariBrowser.isMethodSupported] method to check if this method is supported at runtime.
  ///{@endtemplate}
  clearWebsiteData,

  ///Can be used to check if the [CygnusPlatformChromeSafariBrowser.close] method is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusPlatformChromeSafariBrowser.close.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android Chrome Custom Tabs
  ///- iOS SFSafariViewController
  ///
  ///Use the [CygnusPlatformChromeSafariBrowser.isMethodSupported] method to check if this method is supported at runtime.
  ///{@endtemplate}
  close,

  ///Can be used to check if the [CygnusPlatformChromeSafariBrowser.dispose] method is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusPlatformChromeSafariBrowser.dispose.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android Chrome Custom Tabs
  ///- iOS SFSafariViewController
  ///
  ///Use the [CygnusPlatformChromeSafariBrowser.isMethodSupported] method to check if this method is supported at runtime.
  ///{@endtemplate}
  dispose,

  ///Can be used to check if the [CygnusPlatformChromeSafariBrowser.getMaxToolbarItems] method is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusPlatformChromeSafariBrowser.getMaxToolbarItems.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android Chrome Custom Tabs
  ///
  ///Use the [CygnusPlatformChromeSafariBrowser.isMethodSupported] method to check if this method is supported at runtime.
  ///{@endtemplate}
  getMaxToolbarItems,

  ///Can be used to check if the [CygnusPlatformChromeSafariBrowser.getPackageName] method is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusPlatformChromeSafariBrowser.getPackageName.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android Chrome Custom Tabs ([Official API - CustomTabsClient.getPackageName](https://developer.android.com/reference/androidx/browser/customtabs/CustomTabsClient#getPackageName(android.content.Context,java.util.List%3Cjava.lang.String%3E,boolean)))
  ///
  ///**Parameters - Officially Supported Platforms/Implementations**:
  ///- [packages]: all platforms
  ///- [ignoreDefault]: all platforms
  ///
  ///Use the [CygnusPlatformChromeSafariBrowser.isMethodSupported] method to check if this method is supported at runtime.
  ///{@endtemplate}
  getPackageName,

  ///Can be used to check if the [CygnusPlatformChromeSafariBrowser.invalidatePrewarmingToken] method is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusPlatformChromeSafariBrowser.invalidatePrewarmingToken.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- iOS SFSafariViewController 15.0+ ([Official API - SFSafariViewController.CygnusPrewarmingToken.invalidate](https://developer.apple.com/documentation/safariservices/sfsafariviewcontroller/prewarmingtoken/invalidate()))
  ///
  ///**Parameters - Officially Supported Platforms/Implementations**:
  ///- [prewarmingToken]: all platforms
  ///
  ///Use the [CygnusPlatformChromeSafariBrowser.isMethodSupported] method to check if this method is supported at runtime.
  ///{@endtemplate}
  invalidatePrewarmingToken,

  ///Can be used to check if the [CygnusPlatformChromeSafariBrowser.isAvailable] method is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusPlatformChromeSafariBrowser.isAvailable.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android Chrome Custom Tabs
  ///- iOS SFSafariViewController
  ///
  ///Use the [CygnusPlatformChromeSafariBrowser.isMethodSupported] method to check if this method is supported at runtime.
  ///{@endtemplate}
  isAvailable,

  ///Can be used to check if the [CygnusPlatformChromeSafariBrowser.isEngagementSignalsApiAvailable] method is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusPlatformChromeSafariBrowser.isEngagementSignalsApiAvailable.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android Chrome Custom Tabs ([Official API - CustomTabsSession.isEngagementSignalsApiAvailable](https://developer.android.com/reference/androidx/browser/customtabs/CustomTabsSession#isEngagementSignalsApiAvailable(android.os.Bundle)))
  ///
  ///Use the [CygnusPlatformChromeSafariBrowser.isMethodSupported] method to check if this method is supported at runtime.
  ///{@endtemplate}
  isEngagementSignalsApiAvailable,

  ///Can be used to check if the [CygnusPlatformChromeSafariBrowser.isOpened] method is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusPlatformChromeSafariBrowser.isOpened.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android Chrome Custom Tabs
  ///- iOS SFSafariViewController
  ///
  ///Use the [CygnusPlatformChromeSafariBrowser.isMethodSupported] method to check if this method is supported at runtime.
  ///{@endtemplate}
  isOpened,

  ///Can be used to check if the [CygnusPlatformChromeSafariBrowser.launchUrl] method is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusPlatformChromeSafariBrowser.launchUrl.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android Chrome Custom Tabs
  ///
  ///**Parameters - Officially Supported Platforms/Implementations**:
  ///- [url]: all platforms
  ///- [headers]: all platforms
  ///- [otherLikelyURLs]: all platforms
  ///- [referrer]: all platforms
  ///
  ///Use the [CygnusPlatformChromeSafariBrowser.isMethodSupported] method to check if this method is supported at runtime.
  ///{@endtemplate}
  launchUrl,

  ///Can be used to check if the [CygnusPlatformChromeSafariBrowser.mayLaunchUrl] method is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusPlatformChromeSafariBrowser.mayLaunchUrl.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android Chrome Custom Tabs ([Official API - CustomTabsSession.mayLaunchUrl](https://developer.android.com/reference/androidx/browser/customtabs/CustomTabsSession#mayLaunchUrl(android.net.Uri,android.os.Bundle,java.util.List%3Candroid.os.Bundle%3E)))
  ///
  ///**Parameters - Officially Supported Platforms/Implementations**:
  ///- [url]: all platforms
  ///- [otherLikelyURLs]: all platforms
  ///
  ///Use the [CygnusPlatformChromeSafariBrowser.isMethodSupported] method to check if this method is supported at runtime.
  ///{@endtemplate}
  mayLaunchUrl,

  ///Can be used to check if the [CygnusPlatformChromeSafariBrowser.open] method is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusPlatformChromeSafariBrowser.open.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android Chrome Custom Tabs
  ///- iOS SFSafariViewController
  ///
  ///**Parameters - Officially Supported Platforms/Implementations**:
  ///- [url]: all platforms
  ///- [headers]:
  ///    - Android Chrome Custom Tabs
  ///- [otherLikelyURLs]:
  ///    - Android Chrome Custom Tabs
  ///- [referrer]:
  ///    - Android Chrome Custom Tabs
  ///- [settings]: all platforms
  ///
  ///Use the [CygnusPlatformChromeSafariBrowser.isMethodSupported] method to check if this method is supported at runtime.
  ///{@endtemplate}
  open,

  ///Can be used to check if the [CygnusPlatformChromeSafariBrowser.postMessage] method is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusPlatformChromeSafariBrowser.postMessage.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android Chrome Custom Tabs ([Official API - CustomTabsSession.postMessage](https://developer.android.com/reference/androidx/browser/customtabs/CustomTabsSession#postMessage(java.lang.String,android.os.Bundle)))
  ///
  ///**Parameters - Officially Supported Platforms/Implementations**:
  ///- [message]: all platforms
  ///
  ///Use the [CygnusPlatformChromeSafariBrowser.isMethodSupported] method to check if this method is supported at runtime.
  ///{@endtemplate}
  postMessage,

  ///Can be used to check if the [CygnusPlatformChromeSafariBrowser.prewarmConnections] method is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusPlatformChromeSafariBrowser.prewarmConnections.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- iOS SFSafariViewController 15.0+ ([Official API - SFSafariViewController.prewarmConnections](https://developer.apple.com/documentation/safariservices/sfsafariviewcontroller/3752133-prewarmconnections))
  ///
  ///**Parameters - Officially Supported Platforms/Implementations**:
  ///- [URLs]: all platforms
  ///
  ///Use the [CygnusPlatformChromeSafariBrowser.isMethodSupported] method to check if this method is supported at runtime.
  ///{@endtemplate}
  prewarmConnections,

  ///Can be used to check if the [CygnusPlatformChromeSafariBrowser.requestPostMessageChannel] method is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusPlatformChromeSafariBrowser.requestPostMessageChannel.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android Chrome Custom Tabs ([Official API - CustomTabsSession.requestPostMessageChannel](https://developer.android.com/reference/androidx/browser/customtabs/CustomTabsSession#requestPostMessageChannel(android.net.Uri,android.net.Uri,android.os.Bundle)))
  ///
  ///**Parameters - Officially Supported Platforms/Implementations**:
  ///- [sourceOrigin]: all platforms
  ///- [targetOrigin]: all platforms
  ///
  ///Use the [CygnusPlatformChromeSafariBrowser.isMethodSupported] method to check if this method is supported at runtime.
  ///{@endtemplate}
  requestPostMessageChannel,

  ///Can be used to check if the [CygnusPlatformChromeSafariBrowser.setActionButton] method is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusPlatformChromeSafariBrowser.setActionButton.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android Chrome Custom Tabs ([Official API - CustomTabsSession.setActionButton](https://developer.android.com/reference/androidx/browser/customtabs/CustomTabsIntent.Builder#setActionButton(android.graphics.Bitmap,%20java.lang.String,%20android.app.PendingIntent,%20boolean))):
  ///    - Not available in a Trusted Web Activity.
  ///
  ///**Parameters - Officially Supported Platforms/Implementations**:
  ///- [actionButton]: all platforms
  ///
  ///Use the [CygnusPlatformChromeSafariBrowser.isMethodSupported] method to check if this method is supported at runtime.
  ///{@endtemplate}
  setActionButton,

  ///Can be used to check if the [CygnusPlatformChromeSafariBrowser.setSecondaryToolbar] method is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusPlatformChromeSafariBrowser.setSecondaryToolbar.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android Chrome Custom Tabs ([Official API - CustomTabsIntent.Builder.setSecondaryToolbarViews](https://developer.android.com/reference/androidx/browser/customtabs/CustomTabsIntent.Builder#setSecondaryToolbarViews(android.widget.RemoteViews,int[],android.app.PendingIntent))):
  ///    - Not available in a Trusted Web Activity.
  ///
  ///**Parameters - Officially Supported Platforms/Implementations**:
  ///- [secondaryToolbar]: all platforms
  ///
  ///Use the [CygnusPlatformChromeSafariBrowser.isMethodSupported] method to check if this method is supported at runtime.
  ///{@endtemplate}
  setSecondaryToolbar,

  ///Can be used to check if the [CygnusPlatformChromeSafariBrowser.updateActionButton] method is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusPlatformChromeSafariBrowser.updateActionButton.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android Chrome Custom Tabs ([Official API - CustomTabsSession.setActionButton](https://developer.android.com/reference/androidx/browser/customtabs/CustomTabsIntent.Builder#setActionButton(android.graphics.Bitmap,%20java.lang.String,%20android.app.PendingIntent,%20boolean))):
  ///    - Not available in a Trusted Web Activity.
  ///
  ///**Parameters - Officially Supported Platforms/Implementations**:
  ///- [icon]: all platforms
  ///- [description]: all platforms
  ///
  ///Use the [CygnusPlatformChromeSafariBrowser.isMethodSupported] method to check if this method is supported at runtime.
  ///{@endtemplate}
  updateActionButton,

  ///Can be used to check if the [CygnusPlatformChromeSafariBrowser.updateSecondaryToolbar] method is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusPlatformChromeSafariBrowser.updateSecondaryToolbar.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android Chrome Custom Tabs ([Official API - CustomTabsIntent.Builder.setSecondaryToolbarViews](https://developer.android.com/reference/androidx/browser/customtabs/CustomTabsIntent.Builder#setSecondaryToolbarViews(android.widget.RemoteViews,int[],android.app.PendingIntent))):
  ///    - Not available in a Trusted Web Activity.
  ///
  ///**Parameters - Officially Supported Platforms/Implementations**:
  ///- [secondaryToolbar]: all platforms
  ///
  ///Use the [CygnusPlatformChromeSafariBrowser.isMethodSupported] method to check if this method is supported at runtime.
  ///{@endtemplate}
  updateSecondaryToolbar,

  ///Can be used to check if the [CygnusPlatformChromeSafariBrowser.validateRelationship] method is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusPlatformChromeSafariBrowser.validateRelationship.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android Chrome Custom Tabs ([Official API - CustomTabsSession.validateRelationship](https://developer.android.com/reference/androidx/browser/customtabs/CustomTabsSession#validateRelationship(int,android.net.Uri,android.os.Bundle)))
  ///
  ///**Parameters - Officially Supported Platforms/Implementations**:
  ///- [relation]: all platforms
  ///- [origin]: all platforms
  ///
  ///Use the [CygnusPlatformChromeSafariBrowser.isMethodSupported] method to check if this method is supported at runtime.
  ///{@endtemplate}
  validateRelationship,
}

extension _CygnusPlatformChromeSafariBrowserMethodSupported
    on CygnusPlatformChromeSafariBrowser {
  static bool isMethodSupported(
    CygnusPlatformChromeSafariBrowserMethod method, {
    TargetPlatform? platform,
  }) {
    switch (method) {
      case CygnusPlatformChromeSafariBrowserMethod.addMenuItem:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [
              TargetPlatform.android,
              TargetPlatform.iOS,
            ].contains(platform ?? defaultTargetPlatform);
      case CygnusPlatformChromeSafariBrowserMethod.addMenuItems:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [
              TargetPlatform.android,
              TargetPlatform.iOS,
            ].contains(platform ?? defaultTargetPlatform);
      case CygnusPlatformChromeSafariBrowserMethod.clearWebsiteData:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [TargetPlatform.iOS].contains(platform ?? defaultTargetPlatform);
      case CygnusPlatformChromeSafariBrowserMethod.close:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [
              TargetPlatform.android,
              TargetPlatform.iOS,
            ].contains(platform ?? defaultTargetPlatform);
      case CygnusPlatformChromeSafariBrowserMethod.dispose:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [
              TargetPlatform.android,
              TargetPlatform.iOS,
            ].contains(platform ?? defaultTargetPlatform);
      case CygnusPlatformChromeSafariBrowserMethod.getMaxToolbarItems:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [
              TargetPlatform.android,
            ].contains(platform ?? defaultTargetPlatform);
      case CygnusPlatformChromeSafariBrowserMethod.getPackageName:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [
              TargetPlatform.android,
            ].contains(platform ?? defaultTargetPlatform);
      case CygnusPlatformChromeSafariBrowserMethod.invalidatePrewarmingToken:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [TargetPlatform.iOS].contains(platform ?? defaultTargetPlatform);
      case CygnusPlatformChromeSafariBrowserMethod.isAvailable:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [
              TargetPlatform.android,
              TargetPlatform.iOS,
            ].contains(platform ?? defaultTargetPlatform);
      case CygnusPlatformChromeSafariBrowserMethod
          .isEngagementSignalsApiAvailable:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [
              TargetPlatform.android,
            ].contains(platform ?? defaultTargetPlatform);
      case CygnusPlatformChromeSafariBrowserMethod.isOpened:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [
              TargetPlatform.android,
              TargetPlatform.iOS,
            ].contains(platform ?? defaultTargetPlatform);
      case CygnusPlatformChromeSafariBrowserMethod.launchUrl:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [
              TargetPlatform.android,
            ].contains(platform ?? defaultTargetPlatform);
      case CygnusPlatformChromeSafariBrowserMethod.mayLaunchUrl:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [
              TargetPlatform.android,
            ].contains(platform ?? defaultTargetPlatform);
      case CygnusPlatformChromeSafariBrowserMethod.open:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [
              TargetPlatform.android,
              TargetPlatform.iOS,
            ].contains(platform ?? defaultTargetPlatform);
      case CygnusPlatformChromeSafariBrowserMethod.postMessage:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [
              TargetPlatform.android,
            ].contains(platform ?? defaultTargetPlatform);
      case CygnusPlatformChromeSafariBrowserMethod.prewarmConnections:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [TargetPlatform.iOS].contains(platform ?? defaultTargetPlatform);
      case CygnusPlatformChromeSafariBrowserMethod.requestPostMessageChannel:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [
              TargetPlatform.android,
            ].contains(platform ?? defaultTargetPlatform);
      case CygnusPlatformChromeSafariBrowserMethod.setActionButton:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [
              TargetPlatform.android,
            ].contains(platform ?? defaultTargetPlatform);
      case CygnusPlatformChromeSafariBrowserMethod.setSecondaryToolbar:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [
              TargetPlatform.android,
            ].contains(platform ?? defaultTargetPlatform);
      case CygnusPlatformChromeSafariBrowserMethod.updateActionButton:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [
              TargetPlatform.android,
            ].contains(platform ?? defaultTargetPlatform);
      case CygnusPlatformChromeSafariBrowserMethod.updateSecondaryToolbar:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [
              TargetPlatform.android,
            ].contains(platform ?? defaultTargetPlatform);
      case CygnusPlatformChromeSafariBrowserMethod.validateRelationship:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [
              TargetPlatform.android,
            ].contains(platform ?? defaultTargetPlatform);
    }
  }
}

///List of [CygnusPlatformChromeSafariBrowserEvents]'s methods that can be used to check if they are supported or not by the current platform.
enum CygnusPlatformChromeSafariBrowserEventsMethod {
  ///Can be used to check if the [CygnusPlatformChromeSafariBrowserEvents.onClosed] method is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusPlatformChromeSafariBrowserEvents.onClosed.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView
  ///- iOS WKWebView
  ///
  ///Use the [CygnusPlatformChromeSafariBrowserEvents.isMethodSupported] method to check if this method is supported at runtime.
  ///{@endtemplate}
  onClosed,

  ///Can be used to check if the [CygnusPlatformChromeSafariBrowserEvents.onCompletedInitialLoad] method is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusPlatformChromeSafariBrowserEvents.onCompletedInitialLoad.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView
  ///- iOS WKWebView ([Official API - SFSafariViewControllerDelegate.safariViewController](https://developer.apple.com/documentation/safariservices/sfsafariviewcontrollerdelegate/1621215-safariviewcontroller))
  ///
  ///**Parameters - Officially Supported Platforms/Implementations**:
  ///- [didLoadSuccessfully]:
  ///    - iOS WKWebView
  ///
  ///Use the [CygnusPlatformChromeSafariBrowserEvents.isMethodSupported] method to check if this method is supported at runtime.
  ///{@endtemplate}
  onCompletedInitialLoad,

  ///Can be used to check if the [CygnusPlatformChromeSafariBrowserEvents.onGreatestScrollPercentageIncreased] method is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusPlatformChromeSafariBrowserEvents.onGreatestScrollPercentageIncreased.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView ([Official API - EngagementSignalsCallback.onGreatestScrollPercentageIncreased](https://developer.android.com/reference/androidx/browser/customtabs/EngagementSignalsCallback#onGreatestScrollPercentageIncreased(int,android.os.Bundle)))
  ///
  ///**Parameters - Officially Supported Platforms/Implementations**:
  ///- [scrollPercentage]: all platforms
  ///
  ///Use the [CygnusPlatformChromeSafariBrowserEvents.isMethodSupported] method to check if this method is supported at runtime.
  ///{@endtemplate}
  onGreatestScrollPercentageIncreased,

  ///Can be used to check if the [CygnusPlatformChromeSafariBrowserEvents.onInitialLoadDidRedirect] method is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusPlatformChromeSafariBrowserEvents.onInitialLoadDidRedirect.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- iOS WKWebView ([Official API - SFSafariViewControllerDelegate.safariViewController](https://developer.apple.com/documentation/safariservices/sfsafariviewcontrollerdelegate/2923545-safariviewcontroller))
  ///
  ///**Parameters - Officially Supported Platforms/Implementations**:
  ///- [url]: all platforms
  ///
  ///Use the [CygnusPlatformChromeSafariBrowserEvents.isMethodSupported] method to check if this method is supported at runtime.
  ///{@endtemplate}
  onInitialLoadDidRedirect,

  ///Can be used to check if the [CygnusPlatformChromeSafariBrowserEvents.onMessageChannelReady] method is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusPlatformChromeSafariBrowserEvents.onMessageChannelReady.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView ([Official API - CustomTabsCallback.onMessageChannelReady](https://developer.android.com/reference/androidx/browser/customtabs/CustomTabsCallback#onMessageChannelReady(android.os.Bundle)))
  ///
  ///Use the [CygnusPlatformChromeSafariBrowserEvents.isMethodSupported] method to check if this method is supported at runtime.
  ///{@endtemplate}
  onMessageChannelReady,

  ///Can be used to check if the [CygnusPlatformChromeSafariBrowserEvents.onNavigationEvent] method is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusPlatformChromeSafariBrowserEvents.onNavigationEvent.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView ([Official API - CustomTabsCallback.onNavigationEvent](https://developer.android.com/reference/androidx/browser/customtabs/CustomTabsCallback#onNavigationEvent(int,android.os.Bundle)))
  ///
  ///**Parameters - Officially Supported Platforms/Implementations**:
  ///- [navigationEvent]: all platforms
  ///
  ///Use the [CygnusPlatformChromeSafariBrowserEvents.isMethodSupported] method to check if this method is supported at runtime.
  ///{@endtemplate}
  onNavigationEvent,

  ///Can be used to check if the [CygnusPlatformChromeSafariBrowserEvents.onOpened] method is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusPlatformChromeSafariBrowserEvents.onOpened.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView
  ///- iOS WKWebView
  ///
  ///Use the [CygnusPlatformChromeSafariBrowserEvents.isMethodSupported] method to check if this method is supported at runtime.
  ///{@endtemplate}
  onOpened,

  ///Can be used to check if the [CygnusPlatformChromeSafariBrowserEvents.onPostMessage] method is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusPlatformChromeSafariBrowserEvents.onPostMessage.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView ([Official API - CustomTabsCallback.onPostMessage](https://developer.android.com/reference/androidx/browser/customtabs/CustomTabsCallback#onPostMessage(java.lang.String,android.os.Bundle)))
  ///
  ///**Parameters - Officially Supported Platforms/Implementations**:
  ///- [message]: all platforms
  ///
  ///Use the [CygnusPlatformChromeSafariBrowserEvents.isMethodSupported] method to check if this method is supported at runtime.
  ///{@endtemplate}
  onPostMessage,

  ///Can be used to check if the [CygnusPlatformChromeSafariBrowserEvents.onRelationshipValidationResult] method is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusPlatformChromeSafariBrowserEvents.onRelationshipValidationResult.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView ([Official API - CustomTabsCallback.onRelationshipValidationResult](https://developer.android.com/reference/androidx/browser/customtabs/CustomTabsCallback#onRelationshipValidationResult(int,android.net.Uri,boolean,android.os.Bundle)))
  ///
  ///**Parameters - Officially Supported Platforms/Implementations**:
  ///- [relation]: all platforms
  ///- [requestedOrigin]: all platforms
  ///- [result]: all platforms
  ///
  ///Use the [CygnusPlatformChromeSafariBrowserEvents.isMethodSupported] method to check if this method is supported at runtime.
  ///{@endtemplate}
  onRelationshipValidationResult,

  ///Can be used to check if the [CygnusPlatformChromeSafariBrowserEvents.onServiceConnected] method is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusPlatformChromeSafariBrowserEvents.onServiceConnected.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView
  ///
  ///Use the [CygnusPlatformChromeSafariBrowserEvents.isMethodSupported] method to check if this method is supported at runtime.
  ///{@endtemplate}
  onServiceConnected,

  ///Can be used to check if the [CygnusPlatformChromeSafariBrowserEvents.onSessionEnded] method is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusPlatformChromeSafariBrowserEvents.onSessionEnded.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView ([Official API - EngagementSignalsCallback.onSessionEnded](https://developer.android.com/reference/androidx/browser/customtabs/EngagementSignalsCallback#onSessionEnded(boolean,android.os.Bundle)))
  ///
  ///**Parameters - Officially Supported Platforms/Implementations**:
  ///- [didUserInteract]: all platforms
  ///
  ///Use the [CygnusPlatformChromeSafariBrowserEvents.isMethodSupported] method to check if this method is supported at runtime.
  ///{@endtemplate}
  onSessionEnded,

  ///Can be used to check if the [CygnusPlatformChromeSafariBrowserEvents.onVerticalScrollEvent] method is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusPlatformChromeSafariBrowserEvents.onVerticalScrollEvent.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView ([Official API - EngagementSignalsCallback.onVerticalScrollEvent](https://developer.android.com/reference/androidx/browser/customtabs/EngagementSignalsCallback#onVerticalScrollEvent(boolean,android.os.Bundle)))
  ///
  ///**Parameters - Officially Supported Platforms/Implementations**:
  ///- [isDirectionUp]: all platforms
  ///
  ///Use the [CygnusPlatformChromeSafariBrowserEvents.isMethodSupported] method to check if this method is supported at runtime.
  ///{@endtemplate}
  onVerticalScrollEvent,

  ///Can be used to check if the [CygnusPlatformChromeSafariBrowserEvents.onWillOpenInBrowser] method is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusPlatformChromeSafariBrowserEvents.onWillOpenInBrowser.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- iOS WKWebView 14.0+ ([Official API - SFSafariViewControllerDelegate.safariViewControllerWillOpenInBrowser](https://developer.apple.com/documentation/safariservices/sfsafariviewcontrollerdelegate/3650426-safariviewcontrollerwillopeninbr))
  ///
  ///Use the [CygnusPlatformChromeSafariBrowserEvents.isMethodSupported] method to check if this method is supported at runtime.
  ///{@endtemplate}
  onWillOpenInBrowser,
}

extension _CygnusPlatformChromeSafariBrowserEventsMethodSupported
    on CygnusPlatformChromeSafariBrowserEvents {
  static bool isMethodSupported(
    CygnusPlatformChromeSafariBrowserEventsMethod method, {
    TargetPlatform? platform,
  }) {
    switch (method) {
      case CygnusPlatformChromeSafariBrowserEventsMethod.onClosed:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [
              TargetPlatform.android,
              TargetPlatform.iOS,
            ].contains(platform ?? defaultTargetPlatform);
      case CygnusPlatformChromeSafariBrowserEventsMethod.onCompletedInitialLoad:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [
              TargetPlatform.android,
              TargetPlatform.iOS,
            ].contains(platform ?? defaultTargetPlatform);
      case CygnusPlatformChromeSafariBrowserEventsMethod
          .onGreatestScrollPercentageIncreased:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [
              TargetPlatform.android,
            ].contains(platform ?? defaultTargetPlatform);
      case CygnusPlatformChromeSafariBrowserEventsMethod
          .onInitialLoadDidRedirect:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [TargetPlatform.iOS].contains(platform ?? defaultTargetPlatform);
      case CygnusPlatformChromeSafariBrowserEventsMethod.onMessageChannelReady:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [
              TargetPlatform.android,
            ].contains(platform ?? defaultTargetPlatform);
      case CygnusPlatformChromeSafariBrowserEventsMethod.onNavigationEvent:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [
              TargetPlatform.android,
            ].contains(platform ?? defaultTargetPlatform);
      case CygnusPlatformChromeSafariBrowserEventsMethod.onOpened:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [
              TargetPlatform.android,
              TargetPlatform.iOS,
            ].contains(platform ?? defaultTargetPlatform);
      case CygnusPlatformChromeSafariBrowserEventsMethod.onPostMessage:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [
              TargetPlatform.android,
            ].contains(platform ?? defaultTargetPlatform);
      case CygnusPlatformChromeSafariBrowserEventsMethod
          .onRelationshipValidationResult:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [
              TargetPlatform.android,
            ].contains(platform ?? defaultTargetPlatform);
      case CygnusPlatformChromeSafariBrowserEventsMethod.onServiceConnected:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [
              TargetPlatform.android,
            ].contains(platform ?? defaultTargetPlatform);
      case CygnusPlatformChromeSafariBrowserEventsMethod.onSessionEnded:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [
              TargetPlatform.android,
            ].contains(platform ?? defaultTargetPlatform);
      case CygnusPlatformChromeSafariBrowserEventsMethod.onVerticalScrollEvent:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [
              TargetPlatform.android,
            ].contains(platform ?? defaultTargetPlatform);
      case CygnusPlatformChromeSafariBrowserEventsMethod.onWillOpenInBrowser:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [TargetPlatform.iOS].contains(platform ?? defaultTargetPlatform);
    }
  }
}
