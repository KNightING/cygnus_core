// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'platform_find_interaction_controller.dart';

// **************************************************************************
// SupportedPlatformsGenerator
// **************************************************************************

extension _CygnusPlatformFindInteractionControllerCreationParamsClassSupported
    on CygnusPlatformFindInteractionControllerCreationParams {
  ///{@template cygnus_core.CygnusPlatformFindInteractionControllerCreationParams.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView
  ///- iOS WKWebView
  ///- macOS WKWebView
  ///- Linux WPE WebKit
  ///- Windows WebView2
  ///
  ///Use the [CygnusPlatformFindInteractionControllerCreationParams.isClassSupported] method to check if this class is supported at runtime.
  ///{@endtemplate}
  static bool isClassSupported({TargetPlatform? platform}) {
    return ((kIsWeb && platform != null) || !kIsWeb) &&
        [
          TargetPlatform.android,
          TargetPlatform.iOS,
          TargetPlatform.macOS,
          TargetPlatform.linux,
          TargetPlatform.windows,
        ].contains(platform ?? defaultTargetPlatform);
  }
}

///List of [CygnusPlatformFindInteractionControllerCreationParams]'s properties that can be used to check i they are supported or not by the current platform.
enum CygnusPlatformFindInteractionControllerCreationParamsProperty {
  ///Can be used to check if the [CygnusPlatformFindInteractionControllerCreationParams.onFindResultReceived] property is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusPlatformFindInteractionControllerCreationParams.onFindResultReceived.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView ([Official API - WebView.FindListener.onFindResultReceived](https://developer.android.com/reference/android/webkit/WebView.FindListener#onFindResultReceived(int,%20int,%20boolean)))
  ///- iOS WKWebView:
  ///    - If [CygnusWebViewSettings.isFindInteractionEnabled] is `true`, this event will not be called.
  ///- macOS WKWebView
  ///- Linux WPE WebKit ([Official API - WebKitFindController::counted-matches](https://wpewebkit.org/reference/stable/wpe-webkit-2.0/signal.FindController.counted-matches.html))
  ///- Windows WebView2 ([Official API - ICoreWebView2Find.ActiveMatchIndexChanged/MatchCountChanged](https://learn.microsoft.com/en-us/microsoft-edge/webview2/reference/win32/icorewebview2find))
  ///
  ///**Parameters - Officially Supported Platforms/Implementations**:
  ///- [controller]: all platforms
  ///- [activeMatchOrdinal]: all platforms
  ///- [numberOfMatches]: all platforms
  ///- [isDoneCounting]: all platforms
  ///
  ///Use the [CygnusPlatformFindInteractionControllerCreationParams.isPropertySupported] method to check if this property is supported at runtime.
  ///{@endtemplate}
  onFindResultReceived,
}

extension _CygnusPlatformFindInteractionControllerCreationParamsPropertySupported
    on CygnusPlatformFindInteractionControllerCreationParams {
  static bool isPropertySupported(
    CygnusPlatformFindInteractionControllerCreationParamsProperty property, {
    TargetPlatform? platform,
  }) {
    switch (property) {
      case CygnusPlatformFindInteractionControllerCreationParamsProperty
          .onFindResultReceived:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [
              TargetPlatform.android,
              TargetPlatform.iOS,
              TargetPlatform.macOS,
              TargetPlatform.linux,
              TargetPlatform.windows,
            ].contains(platform ?? defaultTargetPlatform);
    }
  }
}

extension _CygnusPlatformFindInteractionControllerClassSupported
    on CygnusPlatformFindInteractionController {
  ///{@template cygnus_core.CygnusPlatformFindInteractionController.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView
  ///- iOS WKWebView
  ///- macOS WKWebView
  ///- Linux WPE WebKit
  ///- Windows WebView2
  ///
  ///Use the [CygnusPlatformFindInteractionController.isClassSupported] method to check if this class is supported at runtime.
  ///{@endtemplate}
  static bool isClassSupported({TargetPlatform? platform}) {
    return ((kIsWeb && platform != null) || !kIsWeb) &&
        [
          TargetPlatform.android,
          TargetPlatform.iOS,
          TargetPlatform.macOS,
          TargetPlatform.linux,
          TargetPlatform.windows,
        ].contains(platform ?? defaultTargetPlatform);
  }
}

///List of [CygnusPlatformFindInteractionController]'s methods that can be used to check if they are supported or not by the current platform.
enum CygnusPlatformFindInteractionControllerMethod {
  ///Can be used to check if the [CygnusPlatformFindInteractionController.clearMatches] method is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusPlatformFindInteractionController.clearMatches.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView ([Official API - WebView.clearMatches](https://developer.android.com/reference/android/webkit/WebView#clearMatches()))
  ///- iOS WKWebView:
  ///    - If [CygnusWebViewSettings.isFindInteractionEnabled] is `true`, it uses the built-in find interaction native UI, otherwise this is implemented using CSS and Javascript. In this case, it will use the [Official API - UIFindInteraction.dismissFindNavigator](https://developer.apple.com/documentation/uikit/uifindinteraction/3975827-dismissfindnavigator?changes=_2)
  ///- macOS WKWebView
  ///- Linux WPE WebKit ([Official API - webkit_find_controller_search_finish](https://wpewebkit.org/reference/stable/wpe-webkit-2.0/method.FindController.search_finish.html))
  ///- Windows WebView2 ([Official API - ICoreWebView2Find.Stop](https://learn.microsoft.com/en-us/microsoft-edge/webview2/reference/win32/icorewebview2find#stop))
  ///
  ///Use the [CygnusPlatformFindInteractionController.isMethodSupported] method to check if this method is supported at runtime.
  ///{@endtemplate}
  clearMatches,

  ///Can be used to check if the [CygnusPlatformFindInteractionController.dismissFindNavigator] method is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusPlatformFindInteractionController.dismissFindNavigator.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- iOS WKWebView ([Official API - UIFindInteraction.dismissFindNavigator](https://developer.apple.com/documentation/uikit/uifindinteraction/3975827-dismissfindnavigator?changes=_2)):
  ///    - Available only if [CygnusWebViewSettings.isFindInteractionEnabled] is `true`.
  ///
  ///Use the [CygnusPlatformFindInteractionController.isMethodSupported] method to check if this method is supported at runtime.
  ///{@endtemplate}
  dismissFindNavigator,

  ///Can be used to check if the [CygnusPlatformFindInteractionController.dispose] method is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusPlatformFindInteractionController.dispose.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView
  ///- iOS WKWebView
  ///- macOS WKWebView
  ///- Linux WPE WebKit
  ///- Windows WebView2
  ///
  ///**Parameters - Officially Supported Platforms/Implementations**:
  ///- [isKeepAlive]: all platforms
  ///
  ///Use the [CygnusPlatformFindInteractionController.isMethodSupported] method to check if this method is supported at runtime.
  ///{@endtemplate}
  dispose,

  ///Can be used to check if the [CygnusPlatformFindInteractionController.findAll] method is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusPlatformFindInteractionController.findAll.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView ([Official API - WebView.findAllAsync](https://developer.android.com/reference/android/webkit/WebView#findAllAsync(java.lang.String))):
  ///    - It finds all instances asynchronously. Successive calls to this will cancel any pending searches.
  ///- iOS WKWebView:
  ///    - If [CygnusWebViewSettings.isFindInteractionEnabled] is `true`, it uses the built-in find interaction native UI, otherwise this is implemented using CSS and Javascript. In this case, it will use the [Official API - UIFindInteraction.presentFindNavigator](https://developer.apple.com/documentation/uikit/uifindinteraction/3975832-presentfindnavigator?changes=_2) with [Official API - UIFindInteraction.searchText](https://developer.apple.com/documentation/uikit/uifindinteraction/3975834-searchtext?changes=_2)
  ///- macOS WKWebView
  ///- Linux WPE WebKit ([Official API - webkit_find_controller_search](https://wpewebkit.org/reference/stable/wpe-webkit-2.0/method.FindController.search.html))
  ///- Windows WebView2 ([Official API - ICoreWebView2Find.Start](https://learn.microsoft.com/en-us/microsoft-edge/webview2/reference/win32/icorewebview2find#start))
  ///
  ///**Parameters - Officially Supported Platforms/Implementations**:
  ///- [find]: all platforms
  ///
  ///Use the [CygnusPlatformFindInteractionController.isMethodSupported] method to check if this method is supported at runtime.
  ///{@endtemplate}
  findAll,

  ///Can be used to check if the [CygnusPlatformFindInteractionController.findNext] method is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusPlatformFindInteractionController.findNext.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView ([Official API - WebView.findNext](https://developer.android.com/reference/android/webkit/WebView#findNext(boolean)))
  ///- iOS WKWebView:
  ///    - If [CygnusWebViewSettings.isFindInteractionEnabled] is `true`, it uses the built-in find interaction native UI, otherwise this is implemented using CSS and Javascript. In this case, it will use the [Official API - UIFindInteraction.findNext](https://developer.apple.com/documentation/uikit/uifindinteraction/3975829-findnext?changes=_2) and ([Official API - UIFindInteraction.findPrevious](https://developer.apple.com/documentation/uikit/uifindinteraction/3975830-findprevious?changes=_2)
  ///- macOS WKWebView
  ///- Linux WPE WebKit ([Official API - webkit_find_controller_search_next](https://wpewebkit.org/reference/stable/wpe-webkit-2.0/method.FindController.search_next.html))
  ///- Windows WebView2 ([Official API - ICoreWebView2Find.FindNext/FindPrevious](https://learn.microsoft.com/en-us/microsoft-edge/webview2/reference/win32/icorewebview2find#findnext))
  ///
  ///**Parameters - Officially Supported Platforms/Implementations**:
  ///- [forward]: all platforms
  ///
  ///Use the [CygnusPlatformFindInteractionController.isMethodSupported] method to check if this method is supported at runtime.
  ///{@endtemplate}
  findNext,

  ///Can be used to check if the [CygnusPlatformFindInteractionController.getActiveFindSession] method is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusPlatformFindInteractionController.getActiveFindSession.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView
  ///- iOS WKWebView ([Official API - UIFindInteraction.activeFindSession](https://developer.apple.com/documentation/uikit/uifindinteraction/3975825-activefindsession?changes=_7____4_8&language=objc))
  ///- macOS WKWebView
  ///- Linux WPE WebKit ([Official API - WebKitFindController](https://wpewebkit.org/reference/stable/wpe-webkit-2.0/class.FindController.html))
  ///- Windows WebView2 ([Official API - ICoreWebView2Find](https://learn.microsoft.com/en-us/microsoft-edge/webview2/reference/win32/icorewebview2find))
  ///
  ///Use the [CygnusPlatformFindInteractionController.isMethodSupported] method to check if this method is supported at runtime.
  ///{@endtemplate}
  getActiveFindSession,

  ///Can be used to check if the [CygnusPlatformFindInteractionController.getSearchText] method is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusPlatformFindInteractionController.getSearchText.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView
  ///- iOS WKWebView ([Official API - UIFindInteraction.getSearchText](https://developer.apple.com/documentation/uikit/uifindinteraction/3975834-searchtext?changes=_2)):
  ///    - If [CygnusWebViewSettings.isFindInteractionEnabled] is `true`, it will get the system find panel's search text field value.
  ///- macOS WKWebView
  ///- Linux WPE WebKit ([Official API - webkit_find_controller_get_search_text](https://wpewebkit.org/reference/stable/wpe-webkit-2.0/method.FindController.get_search_text.html))
  ///- Windows WebView2
  ///
  ///Use the [CygnusPlatformFindInteractionController.isMethodSupported] method to check if this method is supported at runtime.
  ///{@endtemplate}
  getSearchText,

  ///Can be used to check if the [CygnusPlatformFindInteractionController.isFindNavigatorVisible] method is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusPlatformFindInteractionController.isFindNavigatorVisible.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- iOS WKWebView ([Official API - UIFindInteraction.isFindNavigatorVisible](https://developer.apple.com/documentation/uikit/uifindinteraction/3975828-isfindnavigatorvisible?changes=_2)):
  ///    - Available only if [CygnusWebViewSettings.isFindInteractionEnabled] is `true`.
  ///
  ///Use the [CygnusPlatformFindInteractionController.isMethodSupported] method to check if this method is supported at runtime.
  ///{@endtemplate}
  isFindNavigatorVisible,

  ///Can be used to check if the [CygnusPlatformFindInteractionController.presentFindNavigator] method is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusPlatformFindInteractionController.presentFindNavigator.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- iOS WKWebView ([Official API - UIFindInteraction.presentFindNavigator](https://developer.apple.com/documentation/uikit/uifindinteraction/3975832-presentfindnavigator?changes=_2)):
  ///    - Available only if [CygnusWebViewSettings.isFindInteractionEnabled] is `true`.
  ///
  ///Use the [CygnusPlatformFindInteractionController.isMethodSupported] method to check if this method is supported at runtime.
  ///{@endtemplate}
  presentFindNavigator,

  ///Can be used to check if the [CygnusPlatformFindInteractionController.setFindOptions] method is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusPlatformFindInteractionController.setFindOptions.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Windows WebView2 ([Official API - ICoreWebView2Environment15.CreateFindOptions](https://learn.microsoft.com/en-us/microsoft-edge/webview2/reference/win32/icorewebview2environment15?view=webview2-1.0.2849.39#createfindoptions))
  ///
  ///**Parameters - Officially Supported Platforms/Implementations**:
  ///- [options]: all platforms
  ///
  ///Use the [CygnusPlatformFindInteractionController.isMethodSupported] method to check if this method is supported at runtime.
  ///{@endtemplate}
  setFindOptions,

  ///Can be used to check if the [CygnusPlatformFindInteractionController.setSearchText] method is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusPlatformFindInteractionController.setSearchText.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView
  ///- iOS WKWebView ([Official API - UIFindInteraction.searchText](https://developer.apple.com/documentation/uikit/uifindinteraction/3975834-searchtext?changes=_2)):
  ///    - If [CygnusWebViewSettings.isFindInteractionEnabled] is `true`, it will pre-populate the system find panel's search text field with a search query.
  ///- macOS WKWebView
  ///- Linux WPE WebKit ([Official API - webkit_find_controller_search](https://wpewebkit.org/reference/stable/wpe-webkit-2.0/method.FindController.search.html))
  ///- Windows WebView2 ([Official API - ICoreWebView2FindOptions.put_FindTerm](https://learn.microsoft.com/en-us/microsoft-edge/webview2/reference/win32/icorewebview2findoptions))
  ///
  ///**Parameters - Officially Supported Platforms/Implementations**:
  ///- [searchText]: all platforms
  ///
  ///Use the [CygnusPlatformFindInteractionController.isMethodSupported] method to check if this method is supported at runtime.
  ///{@endtemplate}
  setSearchText,

  ///Can be used to check if the [CygnusPlatformFindInteractionController.updateResultCount] method is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusPlatformFindInteractionController.updateResultCount.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- iOS WKWebView ([Official API - UIFindInteraction.updateResultCount](https://developer.apple.com/documentation/uikit/uifindinteraction/3975835-updateresultcount?changes=_2)):
  ///    - Available only if [CygnusWebViewSettings.isFindInteractionEnabled] is `true`.
  ///
  ///Use the [CygnusPlatformFindInteractionController.isMethodSupported] method to check if this method is supported at runtime.
  ///{@endtemplate}
  updateResultCount,
}

extension _CygnusPlatformFindInteractionControllerMethodSupported
    on CygnusPlatformFindInteractionController {
  static bool isMethodSupported(
    CygnusPlatformFindInteractionControllerMethod method, {
    TargetPlatform? platform,
  }) {
    switch (method) {
      case CygnusPlatformFindInteractionControllerMethod.clearMatches:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [
              TargetPlatform.android,
              TargetPlatform.iOS,
              TargetPlatform.macOS,
              TargetPlatform.linux,
              TargetPlatform.windows,
            ].contains(platform ?? defaultTargetPlatform);
      case CygnusPlatformFindInteractionControllerMethod.dismissFindNavigator:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [TargetPlatform.iOS].contains(platform ?? defaultTargetPlatform);
      case CygnusPlatformFindInteractionControllerMethod.dispose:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [
              TargetPlatform.android,
              TargetPlatform.iOS,
              TargetPlatform.macOS,
              TargetPlatform.linux,
              TargetPlatform.windows,
            ].contains(platform ?? defaultTargetPlatform);
      case CygnusPlatformFindInteractionControllerMethod.findAll:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [
              TargetPlatform.android,
              TargetPlatform.iOS,
              TargetPlatform.macOS,
              TargetPlatform.linux,
              TargetPlatform.windows,
            ].contains(platform ?? defaultTargetPlatform);
      case CygnusPlatformFindInteractionControllerMethod.findNext:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [
              TargetPlatform.android,
              TargetPlatform.iOS,
              TargetPlatform.macOS,
              TargetPlatform.linux,
              TargetPlatform.windows,
            ].contains(platform ?? defaultTargetPlatform);
      case CygnusPlatformFindInteractionControllerMethod.getActiveFindSession:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [
              TargetPlatform.android,
              TargetPlatform.iOS,
              TargetPlatform.macOS,
              TargetPlatform.linux,
              TargetPlatform.windows,
            ].contains(platform ?? defaultTargetPlatform);
      case CygnusPlatformFindInteractionControllerMethod.getSearchText:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [
              TargetPlatform.android,
              TargetPlatform.iOS,
              TargetPlatform.macOS,
              TargetPlatform.linux,
              TargetPlatform.windows,
            ].contains(platform ?? defaultTargetPlatform);
      case CygnusPlatformFindInteractionControllerMethod.isFindNavigatorVisible:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [TargetPlatform.iOS].contains(platform ?? defaultTargetPlatform);
      case CygnusPlatformFindInteractionControllerMethod.presentFindNavigator:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [TargetPlatform.iOS].contains(platform ?? defaultTargetPlatform);
      case CygnusPlatformFindInteractionControllerMethod.setFindOptions:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [
              TargetPlatform.windows,
            ].contains(platform ?? defaultTargetPlatform);
      case CygnusPlatformFindInteractionControllerMethod.setSearchText:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [
              TargetPlatform.android,
              TargetPlatform.iOS,
              TargetPlatform.macOS,
              TargetPlatform.linux,
              TargetPlatform.windows,
            ].contains(platform ?? defaultTargetPlatform);
      case CygnusPlatformFindInteractionControllerMethod.updateResultCount:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [TargetPlatform.iOS].contains(platform ?? defaultTargetPlatform);
    }
  }
}
