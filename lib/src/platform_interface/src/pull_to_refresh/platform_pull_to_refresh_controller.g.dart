// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'platform_pull_to_refresh_controller.dart';

// **************************************************************************
// SupportedPlatformsGenerator
// **************************************************************************

extension _CygnusPlatformPullToRefreshControllerCreationParamsClassSupported
    on CygnusPlatformPullToRefreshControllerCreationParams {
  ///{@template cygnus_core.CygnusPlatformPullToRefreshControllerCreationParams.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView
  ///- iOS WKWebView
  ///
  ///Use the [CygnusPlatformPullToRefreshControllerCreationParams.isClassSupported] method to check if this class is supported at runtime.
  ///{@endtemplate}
  static bool isClassSupported({TargetPlatform? platform}) {
    return ((kIsWeb && platform != null) || !kIsWeb) &&
        [
          TargetPlatform.android,
          TargetPlatform.iOS,
        ].contains(platform ?? defaultTargetPlatform);
  }
}

///List of [CygnusPlatformPullToRefreshControllerCreationParams]'s properties that can be used to check i they are supported or not by the current platform.
enum CygnusPlatformPullToRefreshControllerCreationParamsProperty {
  ///Can be used to check if the [CygnusPlatformPullToRefreshControllerCreationParams.onRefresh] property is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusPlatformPullToRefreshControllerCreationParams.onRefresh.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView
  ///- iOS WKWebView
  ///
  ///Use the [CygnusPlatformPullToRefreshControllerCreationParams.isPropertySupported] method to check if this property is supported at runtime.
  ///{@endtemplate}
  onRefresh,

  ///Can be used to check if the [CygnusPlatformPullToRefreshControllerCreationParams.options] property is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusPlatformPullToRefreshControllerCreationParams.options.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView
  ///- iOS WKWebView
  ///
  ///Use the [CygnusPlatformPullToRefreshControllerCreationParams.isPropertySupported] method to check if this property is supported at runtime.
  ///{@endtemplate}
  @Deprecated('Use settings instead')
  options,

  ///Can be used to check if the [CygnusPlatformPullToRefreshControllerCreationParams.settings] property is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusPlatformPullToRefreshControllerCreationParams.settings.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView
  ///- iOS WKWebView
  ///
  ///Use the [CygnusPlatformPullToRefreshControllerCreationParams.isPropertySupported] method to check if this property is supported at runtime.
  ///{@endtemplate}
  settings,
}

extension _CygnusPlatformPullToRefreshControllerCreationParamsPropertySupported
    on CygnusPlatformPullToRefreshControllerCreationParams {
  static bool isPropertySupported(
    CygnusPlatformPullToRefreshControllerCreationParamsProperty property, {
    TargetPlatform? platform,
  }) {
    switch (property) {
      case CygnusPlatformPullToRefreshControllerCreationParamsProperty
          .onRefresh:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [
              TargetPlatform.android,
              TargetPlatform.iOS,
            ].contains(platform ?? defaultTargetPlatform);
      case CygnusPlatformPullToRefreshControllerCreationParamsProperty.options:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [
              TargetPlatform.android,
              TargetPlatform.iOS,
            ].contains(platform ?? defaultTargetPlatform);
      case CygnusPlatformPullToRefreshControllerCreationParamsProperty.settings:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [
              TargetPlatform.android,
              TargetPlatform.iOS,
            ].contains(platform ?? defaultTargetPlatform);
    }
  }
}

extension _CygnusPlatformPullToRefreshControllerClassSupported
    on CygnusPlatformPullToRefreshController {
  ///{@template cygnus_core.CygnusPlatformPullToRefreshController.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView:
  ///    - **NOTE**: to be able to use the "pull-to-refresh" feature, [CygnusWebViewSettings.useHybridComposition] must be `true`.
  ///- iOS WKWebView
  ///
  ///Use the [CygnusPlatformPullToRefreshController.isClassSupported] method to check if this class is supported at runtime.
  ///{@endtemplate}
  static bool isClassSupported({TargetPlatform? platform}) {
    return ((kIsWeb && platform != null) || !kIsWeb) &&
        [
          TargetPlatform.android,
          TargetPlatform.iOS,
        ].contains(platform ?? defaultTargetPlatform);
  }
}

///List of [CygnusPlatformPullToRefreshController]'s methods that can be used to check if they are supported or not by the current platform.
enum CygnusPlatformPullToRefreshControllerMethod {
  ///Can be used to check if the [CygnusPlatformPullToRefreshController.beginRefreshing] method is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusPlatformPullToRefreshController.beginRefreshing.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView ([Official API - SwipeRefreshLayout.setRefreshing](https://developer.android.com/reference/androidx/swiperefreshlayout/widget/SwipeRefreshLayout#setRefreshing(boolean)))
  ///- iOS WKWebView ([Official API - UIRefreshControl.beginRefreshing](https://developer.apple.com/documentation/uikit/uirefreshcontrol/1624842-beginrefreshing))
  ///
  ///Use the [CygnusPlatformPullToRefreshController.isMethodSupported] method to check if this method is supported at runtime.
  ///{@endtemplate}
  beginRefreshing,

  ///Can be used to check if the [CygnusPlatformPullToRefreshController.dispose] method is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusPlatformPullToRefreshController.dispose.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView
  ///- iOS WKWebView
  ///
  ///**Parameters - Officially Supported Platforms/Implementations**:
  ///- [isKeepAlive]: all platforms
  ///
  ///Use the [CygnusPlatformPullToRefreshController.isMethodSupported] method to check if this method is supported at runtime.
  ///{@endtemplate}
  dispose,

  ///Can be used to check if the [CygnusPlatformPullToRefreshController.endRefreshing] method is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusPlatformPullToRefreshController.endRefreshing.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView ([Official API - SwipeRefreshLayout.setRefreshing](https://developer.android.com/reference/androidx/swiperefreshlayout/widget/SwipeRefreshLayout#setRefreshing(boolean)))
  ///- iOS WKWebView ([Official API - UIRefreshControl.endRefreshing](https://developer.apple.com/documentation/uikit/uirefreshcontrol/1624846-endrefreshing))
  ///
  ///Use the [CygnusPlatformPullToRefreshController.isMethodSupported] method to check if this method is supported at runtime.
  ///{@endtemplate}
  endRefreshing,

  ///Can be used to check if the [CygnusPlatformPullToRefreshController.getDefaultSlingshotDistance] method is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusPlatformPullToRefreshController.getDefaultSlingshotDistance.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView ([Official API - SwipeRefreshLayout.DEFAULT_SLINGSHOT_DISTANCE](https://developer.android.com/reference/androidx/swiperefreshlayout/widget/SwipeRefreshLayout#DEFAULT_SLINGSHOT_DISTANCE()))
  ///
  ///Use the [CygnusPlatformPullToRefreshController.isMethodSupported] method to check if this method is supported at runtime.
  ///{@endtemplate}
  getDefaultSlingshotDistance,

  ///Can be used to check if the [CygnusPlatformPullToRefreshController.isEnabled] method is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusPlatformPullToRefreshController.isEnabled.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView ([Official API - View.isEnabled](https://developer.android.com/reference/android/view/View#isEnabled()))
  ///- iOS WKWebView ([Official API - UIScrollView.refreshControl](https://developer.apple.com/documentation/uikit/uiscrollview/2127691-refreshcontrol))
  ///
  ///Use the [CygnusPlatformPullToRefreshController.isMethodSupported] method to check if this method is supported at runtime.
  ///{@endtemplate}
  isEnabled,

  ///Can be used to check if the [CygnusPlatformPullToRefreshController.isRefreshing] method is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusPlatformPullToRefreshController.isRefreshing.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView ([Official API - SwipeRefreshLayout.isRefreshing](https://developer.android.com/reference/androidx/swiperefreshlayout/widget/SwipeRefreshLayout#isRefreshing()))
  ///- iOS WKWebView ([Official API - UIRefreshControl.isRefreshing](https://developer.apple.com/documentation/uikit/uirefreshcontrol/1624844-isrefreshing))
  ///
  ///Use the [CygnusPlatformPullToRefreshController.isMethodSupported] method to check if this method is supported at runtime.
  ///{@endtemplate}
  isRefreshing,

  ///Can be used to check if the [CygnusPlatformPullToRefreshController.setAttributedTitle] method is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusPlatformPullToRefreshController.setAttributedTitle.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- iOS WKWebView ([Official API - UIRefreshControl.attributedTitle](https://developer.apple.com/documentation/uikit/uirefreshcontrol/1624845-attributedtitle))
  ///
  ///**Parameters - Officially Supported Platforms/Implementations**:
  ///- [attributedTitle]: all platforms
  ///
  ///Use the [CygnusPlatformPullToRefreshController.isMethodSupported] method to check if this method is supported at runtime.
  ///{@endtemplate}
  @Deprecated('Use setStyledTitle instead')
  setAttributedTitle,

  ///Can be used to check if the [CygnusPlatformPullToRefreshController.setBackgroundColor] method is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusPlatformPullToRefreshController.setBackgroundColor.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView ([Official API - SwipeRefreshLayout.setProgressBackgroundColorSchemeColor](https://developer.android.com/reference/androidx/swiperefreshlayout/widget/SwipeRefreshLayout#setProgressBackgroundColorSchemeColor(int)))
  ///- iOS WKWebView ([Official API - UIView.backgroundColor](https://developer.apple.com/documentation/uikit/uiview/1622591-backgroundcolor))
  ///
  ///**Parameters - Officially Supported Platforms/Implementations**:
  ///- [color]: all platforms
  ///
  ///Use the [CygnusPlatformPullToRefreshController.isMethodSupported] method to check if this method is supported at runtime.
  ///{@endtemplate}
  setBackgroundColor,

  ///Can be used to check if the [CygnusPlatformPullToRefreshController.setColor] method is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusPlatformPullToRefreshController.setColor.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView ([Official API - SwipeRefreshLayout.setColorSchemeColors](https://developer.android.com/reference/androidx/swiperefreshlayout/widget/SwipeRefreshLayout#setColorSchemeColors(int...)))
  ///- iOS WKWebView ([Official API - UIRefreshControl.tintColor](https://developer.apple.com/documentation/uikit/uirefreshcontrol/1624847-tintcolor))
  ///
  ///**Parameters - Officially Supported Platforms/Implementations**:
  ///- [color]: all platforms
  ///
  ///Use the [CygnusPlatformPullToRefreshController.isMethodSupported] method to check if this method is supported at runtime.
  ///{@endtemplate}
  setColor,

  ///Can be used to check if the [CygnusPlatformPullToRefreshController.setDistanceToTriggerSync] method is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusPlatformPullToRefreshController.setDistanceToTriggerSync.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView ([Official API - SwipeRefreshLayout.setDistanceToTriggerSync](https://developer.android.com/reference/androidx/swiperefreshlayout/widget/SwipeRefreshLayout#setDistanceToTriggerSync(int)))
  ///
  ///**Parameters - Officially Supported Platforms/Implementations**:
  ///- [distanceToTriggerSync]: all platforms
  ///
  ///Use the [CygnusPlatformPullToRefreshController.isMethodSupported] method to check if this method is supported at runtime.
  ///{@endtemplate}
  setDistanceToTriggerSync,

  ///Can be used to check if the [CygnusPlatformPullToRefreshController.setEnabled] method is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusPlatformPullToRefreshController.setEnabled.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView ([Official API - SwipeRefreshLayout.setEnabled](https://developer.android.com/reference/androidx/swiperefreshlayout/widget/SwipeRefreshLayout#setEnabled(boolean)))
  ///- iOS WKWebView ([Official API - UIScrollView.refreshControl](https://developer.apple.com/documentation/uikit/uiscrollview/2127691-refreshcontrol))
  ///
  ///**Parameters - Officially Supported Platforms/Implementations**:
  ///- [enabled]: all platforms
  ///
  ///Use the [CygnusPlatformPullToRefreshController.isMethodSupported] method to check if this method is supported at runtime.
  ///{@endtemplate}
  setEnabled,

  ///Can be used to check if the [CygnusPlatformPullToRefreshController.setIndicatorSize] method is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusPlatformPullToRefreshController.setIndicatorSize.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView ([Official API - SwipeRefreshLayout.setSize](https://developer.android.com/reference/androidx/swiperefreshlayout/widget/SwipeRefreshLayout#setSize(int)))
  ///
  ///**Parameters - Officially Supported Platforms/Implementations**:
  ///- [size]: all platforms
  ///
  ///Use the [CygnusPlatformPullToRefreshController.isMethodSupported] method to check if this method is supported at runtime.
  ///{@endtemplate}
  setIndicatorSize,

  ///Can be used to check if the [CygnusPlatformPullToRefreshController.setSize] method is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusPlatformPullToRefreshController.setSize.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView ([Official API - SwipeRefreshLayout.setSize](https://developer.android.com/reference/androidx/swiperefreshlayout/widget/SwipeRefreshLayout#setSize(int)))
  ///
  ///**Parameters - Officially Supported Platforms/Implementations**:
  ///- [size]: all platforms
  ///
  ///Use the [CygnusPlatformPullToRefreshController.isMethodSupported] method to check if this method is supported at runtime.
  ///{@endtemplate}
  @Deprecated('Use setIndicatorSize instead')
  setSize,

  ///Can be used to check if the [CygnusPlatformPullToRefreshController.setSlingshotDistance] method is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusPlatformPullToRefreshController.setSlingshotDistance.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView ([Official API - SwipeRefreshLayout.setSlingshotDistance](https://developer.android.com/reference/androidx/swiperefreshlayout/widget/SwipeRefreshLayout#setSlingshotDistance(int)))
  ///
  ///**Parameters - Officially Supported Platforms/Implementations**:
  ///- [slingshotDistance]: all platforms
  ///
  ///Use the [CygnusPlatformPullToRefreshController.isMethodSupported] method to check if this method is supported at runtime.
  ///{@endtemplate}
  setSlingshotDistance,

  ///Can be used to check if the [CygnusPlatformPullToRefreshController.setStyledTitle] method is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusPlatformPullToRefreshController.setStyledTitle.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- iOS WKWebView ([Official API - UIRefreshControl.attributedTitle](https://developer.apple.com/documentation/uikit/uirefreshcontrol/1624845-attributedtitle))
  ///
  ///**Parameters - Officially Supported Platforms/Implementations**:
  ///- [attributedTitle]: all platforms
  ///
  ///Use the [CygnusPlatformPullToRefreshController.isMethodSupported] method to check if this method is supported at runtime.
  ///{@endtemplate}
  setStyledTitle,
}

extension _CygnusPlatformPullToRefreshControllerMethodSupported
    on CygnusPlatformPullToRefreshController {
  static bool isMethodSupported(
    CygnusPlatformPullToRefreshControllerMethod method, {
    TargetPlatform? platform,
  }) {
    switch (method) {
      case CygnusPlatformPullToRefreshControllerMethod.beginRefreshing:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [
              TargetPlatform.android,
              TargetPlatform.iOS,
            ].contains(platform ?? defaultTargetPlatform);
      case CygnusPlatformPullToRefreshControllerMethod.dispose:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [
              TargetPlatform.android,
              TargetPlatform.iOS,
            ].contains(platform ?? defaultTargetPlatform);
      case CygnusPlatformPullToRefreshControllerMethod.endRefreshing:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [
              TargetPlatform.android,
              TargetPlatform.iOS,
            ].contains(platform ?? defaultTargetPlatform);
      case CygnusPlatformPullToRefreshControllerMethod
          .getDefaultSlingshotDistance:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [
              TargetPlatform.android,
            ].contains(platform ?? defaultTargetPlatform);
      case CygnusPlatformPullToRefreshControllerMethod.isEnabled:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [
              TargetPlatform.android,
              TargetPlatform.iOS,
            ].contains(platform ?? defaultTargetPlatform);
      case CygnusPlatformPullToRefreshControllerMethod.isRefreshing:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [
              TargetPlatform.android,
              TargetPlatform.iOS,
            ].contains(platform ?? defaultTargetPlatform);
      case CygnusPlatformPullToRefreshControllerMethod.setAttributedTitle:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [TargetPlatform.iOS].contains(platform ?? defaultTargetPlatform);
      case CygnusPlatformPullToRefreshControllerMethod.setBackgroundColor:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [
              TargetPlatform.android,
              TargetPlatform.iOS,
            ].contains(platform ?? defaultTargetPlatform);
      case CygnusPlatformPullToRefreshControllerMethod.setColor:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [
              TargetPlatform.android,
              TargetPlatform.iOS,
            ].contains(platform ?? defaultTargetPlatform);
      case CygnusPlatformPullToRefreshControllerMethod.setDistanceToTriggerSync:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [
              TargetPlatform.android,
            ].contains(platform ?? defaultTargetPlatform);
      case CygnusPlatformPullToRefreshControllerMethod.setEnabled:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [
              TargetPlatform.android,
              TargetPlatform.iOS,
            ].contains(platform ?? defaultTargetPlatform);
      case CygnusPlatformPullToRefreshControllerMethod.setIndicatorSize:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [
              TargetPlatform.android,
            ].contains(platform ?? defaultTargetPlatform);
      case CygnusPlatformPullToRefreshControllerMethod.setSize:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [
              TargetPlatform.android,
            ].contains(platform ?? defaultTargetPlatform);
      case CygnusPlatformPullToRefreshControllerMethod.setSlingshotDistance:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [
              TargetPlatform.android,
            ].contains(platform ?? defaultTargetPlatform);
      case CygnusPlatformPullToRefreshControllerMethod.setStyledTitle:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [TargetPlatform.iOS].contains(platform ?? defaultTargetPlatform);
    }
  }
}
