// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'platform_browser.dart';

// **************************************************************************
// SupportedPlatformsGenerator
// **************************************************************************

extension _CygnusPlatformBrowserClassSupported on CygnusPlatformBrowser {
  ///{@template cygnus_core.CygnusPlatformBrowser.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView
  ///- iOS WKWebView
  ///- macOS WKWebView
  ///- Windows WebView2
  ///- Linux WPE WebKit ([Official API - GtkWindow + WPE WebKit](https://wpewebkit.org/reference/stable/wpe-webkit-2.0/class.WebView.html))
  ///
  ///Use the [CygnusPlatformBrowser.isClassSupported] method to check if this class is supported at runtime.
  ///{@endtemplate}
  static bool isClassSupported({TargetPlatform? platform}) {
    return ((kIsWeb && platform != null) || !kIsWeb) &&
        [
          TargetPlatform.android,
          TargetPlatform.iOS,
          TargetPlatform.macOS,
          TargetPlatform.windows,
          TargetPlatform.linux,
        ].contains(platform ?? defaultTargetPlatform);
  }
}

///List of [CygnusPlatformBrowser]'s properties that can be used to check i they are supported or not by the current platform.
enum CygnusPlatformBrowserProperty {
  ///Can be used to check if the [CygnusPlatformBrowser.contextMenu] property is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusPlatformBrowser.contextMenu.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView
  ///- iOS WKWebView
  ///
  ///Use the [CygnusPlatformBrowser.isPropertySupported] method to check if this property is supported at runtime.
  ///{@endtemplate}
  contextMenu,

  ///Can be used to check if the [CygnusPlatformBrowser.findInteractionController] property is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusPlatformBrowser.findInteractionController.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView
  ///- iOS WKWebView
  ///- macOS WKWebView
  ///
  ///Use the [CygnusPlatformBrowser.isPropertySupported] method to check if this property is supported at runtime.
  ///{@endtemplate}
  findInteractionController,

  ///Can be used to check if the [CygnusPlatformBrowser.id] property is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusPlatformBrowser.id.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView
  ///- iOS WKWebView
  ///- macOS WKWebView
  ///- Windows WebView2
  ///- Linux WPE WebKit
  ///
  ///Use the [CygnusPlatformBrowser.isPropertySupported] method to check if this property is supported at runtime.
  ///{@endtemplate}
  id,

  ///Can be used to check if the [CygnusPlatformBrowser.initialUserScripts] property is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusPlatformBrowser.initialUserScripts.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView
  ///- iOS WKWebView:
  ///    - This property will be ignored if the [CygnusPlatformWebViewCreationParams.windowId] has been set. There isn't any way to add/remove user scripts specific to iOS window WebViews. This is a limitation of the native WebKit APIs.
  ///- macOS WKWebView:
  ///    - This property will be ignored if the [CygnusPlatformWebViewCreationParams.windowId] has been set. There isn't any way to add/remove user scripts specific to iOS window WebViews. This is a limitation of the native WebKit APIs.
  ///- Windows WebView2
  ///- Linux WPE WebKit
  ///
  ///Use the [CygnusPlatformBrowser.isPropertySupported] method to check if this property is supported at runtime.
  ///{@endtemplate}
  initialUserScripts,

  ///Can be used to check if the [CygnusPlatformBrowser.pullToRefreshController] property is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusPlatformBrowser.pullToRefreshController.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView
  ///- iOS WKWebView
  ///
  ///Use the [CygnusPlatformBrowser.isPropertySupported] method to check if this property is supported at runtime.
  ///{@endtemplate}
  pullToRefreshController,

  ///Can be used to check if the [CygnusPlatformBrowser.webViewEnvironment] property is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusPlatformBrowser.webViewEnvironment.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Windows WebView2
  ///
  ///Use the [CygnusPlatformBrowser.isPropertySupported] method to check if this property is supported at runtime.
  ///{@endtemplate}
  webViewEnvironment,

  ///Can be used to check if the [CygnusPlatformBrowser.windowId] property is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusPlatformBrowser.windowId.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView
  ///- iOS WKWebView
  ///- macOS WKWebView
  ///- Windows WebView2
  ///- Linux WPE WebKit
  ///
  ///Use the [CygnusPlatformBrowser.isPropertySupported] method to check if this property is supported at runtime.
  ///{@endtemplate}
  windowId,
}

extension _CygnusPlatformBrowserPropertySupported on CygnusPlatformBrowser {
  static bool isPropertySupported(
    CygnusPlatformBrowserProperty property, {
    TargetPlatform? platform,
  }) {
    switch (property) {
      case CygnusPlatformBrowserProperty.contextMenu:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [
              TargetPlatform.android,
              TargetPlatform.iOS,
            ].contains(platform ?? defaultTargetPlatform);
      case CygnusPlatformBrowserProperty.findInteractionController:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [
              TargetPlatform.android,
              TargetPlatform.iOS,
              TargetPlatform.macOS,
            ].contains(platform ?? defaultTargetPlatform);
      case CygnusPlatformBrowserProperty.id:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [
              TargetPlatform.android,
              TargetPlatform.iOS,
              TargetPlatform.macOS,
              TargetPlatform.windows,
              TargetPlatform.linux,
            ].contains(platform ?? defaultTargetPlatform);
      case CygnusPlatformBrowserProperty.initialUserScripts:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [
              TargetPlatform.android,
              TargetPlatform.iOS,
              TargetPlatform.macOS,
              TargetPlatform.windows,
              TargetPlatform.linux,
            ].contains(platform ?? defaultTargetPlatform);
      case CygnusPlatformBrowserProperty.pullToRefreshController:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [
              TargetPlatform.android,
              TargetPlatform.iOS,
            ].contains(platform ?? defaultTargetPlatform);
      case CygnusPlatformBrowserProperty.webViewEnvironment:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [
              TargetPlatform.windows,
            ].contains(platform ?? defaultTargetPlatform);
      case CygnusPlatformBrowserProperty.windowId:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [
              TargetPlatform.android,
              TargetPlatform.iOS,
              TargetPlatform.macOS,
              TargetPlatform.windows,
              TargetPlatform.linux,
            ].contains(platform ?? defaultTargetPlatform);
    }
  }
}

///List of [CygnusPlatformBrowser]'s methods that can be used to check if they are supported or not by the current platform.
enum CygnusPlatformBrowserMethod {
  ///Can be used to check if the [CygnusPlatformBrowser.addMenuItem] method is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusPlatformBrowser.addMenuItem.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView
  ///- iOS WKWebView 14.0+
  ///- macOS WKWebView 10.15+
  ///
  ///**Parameters - Officially Supported Platforms/Implementations**:
  ///- [menuItem]: all platforms
  ///
  ///Use the [CygnusPlatformBrowser.isMethodSupported] method to check if this method is supported at runtime.
  ///{@endtemplate}
  addMenuItem,

  ///Can be used to check if the [CygnusPlatformBrowser.addMenuItems] method is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusPlatformBrowser.addMenuItems.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView
  ///- iOS WKWebView 14.0+
  ///- macOS WKWebView 10.15+
  ///
  ///**Parameters - Officially Supported Platforms/Implementations**:
  ///- [menuItems]: all platforms
  ///
  ///Use the [CygnusPlatformBrowser.isMethodSupported] method to check if this method is supported at runtime.
  ///{@endtemplate}
  addMenuItems,

  ///Can be used to check if the [CygnusPlatformBrowser.close] method is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusPlatformBrowser.close.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView
  ///- iOS WKWebView
  ///- macOS WKWebView
  ///- Windows WebView2
  ///- Linux WPE WebKit
  ///
  ///Use the [CygnusPlatformBrowser.isMethodSupported] method to check if this method is supported at runtime.
  ///{@endtemplate}
  close,

  ///Can be used to check if the [CygnusPlatformBrowser.dispose] method is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusPlatformBrowser.dispose.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView
  ///- iOS WKWebView
  ///- macOS WKWebView
  ///- Windows WebView2
  ///- Linux WPE WebKit
  ///
  ///Use the [CygnusPlatformBrowser.isMethodSupported] method to check if this method is supported at runtime.
  ///{@endtemplate}
  dispose,

  ///Can be used to check if the [CygnusPlatformBrowser.getOptions] method is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusPlatformBrowser.getOptions.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView
  ///- iOS WKWebView
  ///
  ///Use the [CygnusPlatformBrowser.isMethodSupported] method to check if this method is supported at runtime.
  ///{@endtemplate}
  @Deprecated('Use getSettings instead')
  getOptions,

  ///Can be used to check if the [CygnusPlatformBrowser.getSettings] method is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusPlatformBrowser.getSettings.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView
  ///- iOS WKWebView
  ///- macOS WKWebView
  ///- Windows WebView2
  ///- Linux WPE WebKit
  ///
  ///Use the [CygnusPlatformBrowser.isMethodSupported] method to check if this method is supported at runtime.
  ///{@endtemplate}
  getSettings,

  ///Can be used to check if the [CygnusPlatformBrowser.hasMenuItem] method is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusPlatformBrowser.hasMenuItem.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView
  ///- iOS WKWebView 14.0+
  ///- macOS WKWebView 10.15+
  ///
  ///**Parameters - Officially Supported Platforms/Implementations**:
  ///- [menuItem]: all platforms
  ///
  ///Use the [CygnusPlatformBrowser.isMethodSupported] method to check if this method is supported at runtime.
  ///{@endtemplate}
  hasMenuItem,

  ///Can be used to check if the [CygnusPlatformBrowser.hide] method is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusPlatformBrowser.hide.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView
  ///- iOS WKWebView
  ///- macOS WKWebView
  ///- Windows WebView2
  ///- Linux WPE WebKit
  ///
  ///Use the [CygnusPlatformBrowser.isMethodSupported] method to check if this method is supported at runtime.
  ///{@endtemplate}
  hide,

  ///Can be used to check if the [CygnusPlatformBrowser.isHidden] method is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusPlatformBrowser.isHidden.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView
  ///- iOS WKWebView
  ///- macOS WKWebView
  ///- Windows WebView2
  ///- Linux WPE WebKit
  ///
  ///Use the [CygnusPlatformBrowser.isMethodSupported] method to check if this method is supported at runtime.
  ///{@endtemplate}
  isHidden,

  ///Can be used to check if the [CygnusPlatformBrowser.isOpened] method is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusPlatformBrowser.isOpened.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView
  ///- iOS WKWebView
  ///- macOS WKWebView
  ///- Windows WebView2
  ///- Linux WPE WebKit
  ///
  ///Use the [CygnusPlatformBrowser.isMethodSupported] method to check if this method is supported at runtime.
  ///{@endtemplate}
  isOpened,

  ///Can be used to check if the [CygnusPlatformBrowser.openData] method is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusPlatformBrowser.openData.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView
  ///- iOS WKWebView
  ///- macOS WKWebView
  ///- Windows WebView2
  ///- Linux WPE WebKit
  ///
  ///**Parameters - Officially Supported Platforms/Implementations**:
  ///- [data]: all platforms
  ///- [mimeType]: all platforms
  ///- [encoding]: all platforms
  ///- [baseUrl]: all platforms
  ///- [historyUrl]: all platforms
  ///- [settings]: all platforms
  ///
  ///Use the [CygnusPlatformBrowser.isMethodSupported] method to check if this method is supported at runtime.
  ///{@endtemplate}
  openData,

  ///Can be used to check if the [CygnusPlatformBrowser.openFile] method is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusPlatformBrowser.openFile.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView
  ///- iOS WKWebView
  ///- macOS WKWebView
  ///- Windows WebView2
  ///- Linux WPE WebKit
  ///
  ///**Parameters - Officially Supported Platforms/Implementations**:
  ///- [assetFilePath]: all platforms
  ///- [settings]: all platforms
  ///
  ///Use the [CygnusPlatformBrowser.isMethodSupported] method to check if this method is supported at runtime.
  ///{@endtemplate}
  openFile,

  ///Can be used to check if the [CygnusPlatformBrowser.openUrlRequest] method is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusPlatformBrowser.openUrlRequest.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView
  ///- iOS WKWebView
  ///- macOS WKWebView
  ///- Windows WebView2
  ///- Linux WPE WebKit
  ///
  ///**Parameters - Officially Supported Platforms/Implementations**:
  ///- [urlRequest]: all platforms
  ///- [settings]: all platforms
  ///
  ///Use the [CygnusPlatformBrowser.isMethodSupported] method to check if this method is supported at runtime.
  ///{@endtemplate}
  openUrlRequest,

  ///Can be used to check if the [CygnusPlatformBrowser.openWithSystemBrowser] method is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusPlatformBrowser.openWithSystemBrowser.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView
  ///- iOS WKWebView
  ///- macOS WKWebView
  ///- Windows WebView2
  ///- Linux WPE WebKit
  ///
  ///**Parameters - Officially Supported Platforms/Implementations**:
  ///- [url]: all platforms
  ///
  ///Use the [CygnusPlatformBrowser.isMethodSupported] method to check if this method is supported at runtime.
  ///{@endtemplate}
  openWithSystemBrowser,

  ///Can be used to check if the [CygnusPlatformBrowser.removeAllMenuItem] method is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusPlatformBrowser.removeAllMenuItem.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView
  ///- iOS WKWebView 14.0+
  ///- macOS WKWebView 10.15+
  ///
  ///Use the [CygnusPlatformBrowser.isMethodSupported] method to check if this method is supported at runtime.
  ///{@endtemplate}
  removeAllMenuItem,

  ///Can be used to check if the [CygnusPlatformBrowser.removeMenuItem] method is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusPlatformBrowser.removeMenuItem.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView
  ///- iOS WKWebView 14.0+
  ///- macOS WKWebView 10.15+
  ///
  ///**Parameters - Officially Supported Platforms/Implementations**:
  ///- [menuItem]: all platforms
  ///
  ///Use the [CygnusPlatformBrowser.isMethodSupported] method to check if this method is supported at runtime.
  ///{@endtemplate}
  removeMenuItem,

  ///Can be used to check if the [CygnusPlatformBrowser.removeMenuItems] method is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusPlatformBrowser.removeMenuItems.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView
  ///- iOS WKWebView 14.0+
  ///- macOS WKWebView 10.15+
  ///
  ///**Parameters - Officially Supported Platforms/Implementations**:
  ///- [menuItems]: all platforms
  ///
  ///Use the [CygnusPlatformBrowser.isMethodSupported] method to check if this method is supported at runtime.
  ///{@endtemplate}
  removeMenuItems,

  ///Can be used to check if the [CygnusPlatformBrowser.setOptions] method is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusPlatformBrowser.setOptions.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView
  ///- iOS WKWebView
  ///
  ///**Parameters - Officially Supported Platforms/Implementations**:
  ///- [options]: all platforms
  ///
  ///Use the [CygnusPlatformBrowser.isMethodSupported] method to check if this method is supported at runtime.
  ///{@endtemplate}
  @Deprecated('Use setSettings instead')
  setOptions,

  ///Can be used to check if the [CygnusPlatformBrowser.setSettings] method is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusPlatformBrowser.setSettings.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView
  ///- iOS WKWebView
  ///- macOS WKWebView
  ///- Windows WebView2
  ///- Linux WPE WebKit
  ///
  ///**Parameters - Officially Supported Platforms/Implementations**:
  ///- [settings]: all platforms
  ///
  ///Use the [CygnusPlatformBrowser.isMethodSupported] method to check if this method is supported at runtime.
  ///{@endtemplate}
  setSettings,

  ///Can be used to check if the [CygnusPlatformBrowser.show] method is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusPlatformBrowser.show.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView
  ///- iOS WKWebView
  ///- macOS WKWebView
  ///- Windows WebView2
  ///- Linux WPE WebKit
  ///
  ///Use the [CygnusPlatformBrowser.isMethodSupported] method to check if this method is supported at runtime.
  ///{@endtemplate}
  show,
}

extension _CygnusPlatformBrowserMethodSupported on CygnusPlatformBrowser {
  static bool isMethodSupported(
    CygnusPlatformBrowserMethod method, {
    TargetPlatform? platform,
  }) {
    switch (method) {
      case CygnusPlatformBrowserMethod.addMenuItem:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [
              TargetPlatform.android,
              TargetPlatform.iOS,
              TargetPlatform.macOS,
            ].contains(platform ?? defaultTargetPlatform);
      case CygnusPlatformBrowserMethod.addMenuItems:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [
              TargetPlatform.android,
              TargetPlatform.iOS,
              TargetPlatform.macOS,
            ].contains(platform ?? defaultTargetPlatform);
      case CygnusPlatformBrowserMethod.close:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [
              TargetPlatform.android,
              TargetPlatform.iOS,
              TargetPlatform.macOS,
              TargetPlatform.windows,
              TargetPlatform.linux,
            ].contains(platform ?? defaultTargetPlatform);
      case CygnusPlatformBrowserMethod.dispose:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [
              TargetPlatform.android,
              TargetPlatform.iOS,
              TargetPlatform.macOS,
              TargetPlatform.windows,
              TargetPlatform.linux,
            ].contains(platform ?? defaultTargetPlatform);
      case CygnusPlatformBrowserMethod.getOptions:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [
              TargetPlatform.android,
              TargetPlatform.iOS,
            ].contains(platform ?? defaultTargetPlatform);
      case CygnusPlatformBrowserMethod.getSettings:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [
              TargetPlatform.android,
              TargetPlatform.iOS,
              TargetPlatform.macOS,
              TargetPlatform.windows,
              TargetPlatform.linux,
            ].contains(platform ?? defaultTargetPlatform);
      case CygnusPlatformBrowserMethod.hasMenuItem:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [
              TargetPlatform.android,
              TargetPlatform.iOS,
              TargetPlatform.macOS,
            ].contains(platform ?? defaultTargetPlatform);
      case CygnusPlatformBrowserMethod.hide:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [
              TargetPlatform.android,
              TargetPlatform.iOS,
              TargetPlatform.macOS,
              TargetPlatform.windows,
              TargetPlatform.linux,
            ].contains(platform ?? defaultTargetPlatform);
      case CygnusPlatformBrowserMethod.isHidden:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [
              TargetPlatform.android,
              TargetPlatform.iOS,
              TargetPlatform.macOS,
              TargetPlatform.windows,
              TargetPlatform.linux,
            ].contains(platform ?? defaultTargetPlatform);
      case CygnusPlatformBrowserMethod.isOpened:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [
              TargetPlatform.android,
              TargetPlatform.iOS,
              TargetPlatform.macOS,
              TargetPlatform.windows,
              TargetPlatform.linux,
            ].contains(platform ?? defaultTargetPlatform);
      case CygnusPlatformBrowserMethod.openData:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [
              TargetPlatform.android,
              TargetPlatform.iOS,
              TargetPlatform.macOS,
              TargetPlatform.windows,
              TargetPlatform.linux,
            ].contains(platform ?? defaultTargetPlatform);
      case CygnusPlatformBrowserMethod.openFile:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [
              TargetPlatform.android,
              TargetPlatform.iOS,
              TargetPlatform.macOS,
              TargetPlatform.windows,
              TargetPlatform.linux,
            ].contains(platform ?? defaultTargetPlatform);
      case CygnusPlatformBrowserMethod.openUrlRequest:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [
              TargetPlatform.android,
              TargetPlatform.iOS,
              TargetPlatform.macOS,
              TargetPlatform.windows,
              TargetPlatform.linux,
            ].contains(platform ?? defaultTargetPlatform);
      case CygnusPlatformBrowserMethod.openWithSystemBrowser:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [
              TargetPlatform.android,
              TargetPlatform.iOS,
              TargetPlatform.macOS,
              TargetPlatform.windows,
              TargetPlatform.linux,
            ].contains(platform ?? defaultTargetPlatform);
      case CygnusPlatformBrowserMethod.removeAllMenuItem:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [
              TargetPlatform.android,
              TargetPlatform.iOS,
              TargetPlatform.macOS,
            ].contains(platform ?? defaultTargetPlatform);
      case CygnusPlatformBrowserMethod.removeMenuItem:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [
              TargetPlatform.android,
              TargetPlatform.iOS,
              TargetPlatform.macOS,
            ].contains(platform ?? defaultTargetPlatform);
      case CygnusPlatformBrowserMethod.removeMenuItems:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [
              TargetPlatform.android,
              TargetPlatform.iOS,
              TargetPlatform.macOS,
            ].contains(platform ?? defaultTargetPlatform);
      case CygnusPlatformBrowserMethod.setOptions:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [
              TargetPlatform.android,
              TargetPlatform.iOS,
            ].contains(platform ?? defaultTargetPlatform);
      case CygnusPlatformBrowserMethod.setSettings:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [
              TargetPlatform.android,
              TargetPlatform.iOS,
              TargetPlatform.macOS,
              TargetPlatform.windows,
              TargetPlatform.linux,
            ].contains(platform ?? defaultTargetPlatform);
      case CygnusPlatformBrowserMethod.show:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [
              TargetPlatform.android,
              TargetPlatform.iOS,
              TargetPlatform.macOS,
              TargetPlatform.windows,
              TargetPlatform.linux,
            ].contains(platform ?? defaultTargetPlatform);
    }
  }
}

///List of [CygnusPlatformBrowserEvents]'s methods that can be used to check if they are supported or not by the current platform.
enum CygnusPlatformBrowserEventsMethod {
  ///Can be used to check if the [CygnusPlatformBrowserEvents.androidOnFormResubmission] method is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusPlatformBrowserEvents.androidOnFormResubmission.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView
  ///
  ///**Parameters - Officially Supported Platforms/Implementations**:
  ///- [url]: all platforms
  ///
  ///Use the [CygnusPlatformBrowserEvents.isMethodSupported] method to check if this method is supported at runtime.
  ///{@endtemplate}
  @Deprecated('Use onFormResubmission instead')
  androidOnFormResubmission,

  ///Can be used to check if the [CygnusPlatformBrowserEvents.androidOnGeolocationPermissionsHidePrompt] method is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusPlatformBrowserEvents.androidOnGeolocationPermissionsHidePrompt.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView
  ///
  ///Use the [CygnusPlatformBrowserEvents.isMethodSupported] method to check if this method is supported at runtime.
  ///{@endtemplate}
  @Deprecated('Use onGeolocationPermissionsHidePrompt instead')
  androidOnGeolocationPermissionsHidePrompt,

  ///Can be used to check if the [CygnusPlatformBrowserEvents.androidOnGeolocationPermissionsShowPrompt] method is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusPlatformBrowserEvents.androidOnGeolocationPermissionsShowPrompt.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView
  ///
  ///**Parameters - Officially Supported Platforms/Implementations**:
  ///- [origin]: all platforms
  ///
  ///Use the [CygnusPlatformBrowserEvents.isMethodSupported] method to check if this method is supported at runtime.
  ///{@endtemplate}
  @Deprecated('Use onGeolocationPermissionsShowPrompt instead')
  androidOnGeolocationPermissionsShowPrompt,

  ///Can be used to check if the [CygnusPlatformBrowserEvents.androidOnJsBeforeUnload] method is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusPlatformBrowserEvents.androidOnJsBeforeUnload.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView
  ///
  ///**Parameters - Officially Supported Platforms/Implementations**:
  ///- [jsBeforeUnloadRequest]: all platforms
  ///
  ///Use the [CygnusPlatformBrowserEvents.isMethodSupported] method to check if this method is supported at runtime.
  ///{@endtemplate}
  @Deprecated('Use onJsBeforeUnload instead')
  androidOnJsBeforeUnload,

  ///Can be used to check if the [CygnusPlatformBrowserEvents.androidOnPermissionRequest] method is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusPlatformBrowserEvents.androidOnPermissionRequest.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView
  ///
  ///**Parameters - Officially Supported Platforms/Implementations**:
  ///- [origin]: all platforms
  ///- [resources]: all platforms
  ///
  ///Use the [CygnusPlatformBrowserEvents.isMethodSupported] method to check if this method is supported at runtime.
  ///{@endtemplate}
  @Deprecated('Use onPermissionRequest instead')
  androidOnPermissionRequest,

  ///Can be used to check if the [CygnusPlatformBrowserEvents.androidOnReceivedIcon] method is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusPlatformBrowserEvents.androidOnReceivedIcon.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView
  ///
  ///**Parameters - Officially Supported Platforms/Implementations**:
  ///- [icon]: all platforms
  ///
  ///Use the [CygnusPlatformBrowserEvents.isMethodSupported] method to check if this method is supported at runtime.
  ///{@endtemplate}
  @Deprecated('Use onReceivedIcon instead')
  androidOnReceivedIcon,

  ///Can be used to check if the [CygnusPlatformBrowserEvents.androidOnReceivedLoginRequest] method is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusPlatformBrowserEvents.androidOnReceivedLoginRequest.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView
  ///
  ///**Parameters - Officially Supported Platforms/Implementations**:
  ///- [loginRequest]: all platforms
  ///
  ///Use the [CygnusPlatformBrowserEvents.isMethodSupported] method to check if this method is supported at runtime.
  ///{@endtemplate}
  @Deprecated('Use onReceivedLoginRequest instead')
  androidOnReceivedLoginRequest,

  ///Can be used to check if the [CygnusPlatformBrowserEvents.androidOnReceivedTouchIconUrl] method is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusPlatformBrowserEvents.androidOnReceivedTouchIconUrl.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView
  ///
  ///**Parameters - Officially Supported Platforms/Implementations**:
  ///- [url]: all platforms
  ///- [precomposed]: all platforms
  ///
  ///Use the [CygnusPlatformBrowserEvents.isMethodSupported] method to check if this method is supported at runtime.
  ///{@endtemplate}
  @Deprecated('Use onReceivedTouchIconUrl instead')
  androidOnReceivedTouchIconUrl,

  ///Can be used to check if the [CygnusPlatformBrowserEvents.androidOnRenderProcessGone] method is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusPlatformBrowserEvents.androidOnRenderProcessGone.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView
  ///
  ///**Parameters - Officially Supported Platforms/Implementations**:
  ///- [detail]: all platforms
  ///
  ///Use the [CygnusPlatformBrowserEvents.isMethodSupported] method to check if this method is supported at runtime.
  ///{@endtemplate}
  @Deprecated('Use onRenderProcessGone instead')
  androidOnRenderProcessGone,

  ///Can be used to check if the [CygnusPlatformBrowserEvents.androidOnRenderProcessResponsive] method is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusPlatformBrowserEvents.androidOnRenderProcessResponsive.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView
  ///
  ///**Parameters - Officially Supported Platforms/Implementations**:
  ///- [url]: all platforms
  ///
  ///Use the [CygnusPlatformBrowserEvents.isMethodSupported] method to check if this method is supported at runtime.
  ///{@endtemplate}
  @Deprecated('Use onRenderProcessResponsive instead')
  androidOnRenderProcessResponsive,

  ///Can be used to check if the [CygnusPlatformBrowserEvents.androidOnRenderProcessUnresponsive] method is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusPlatformBrowserEvents.androidOnRenderProcessUnresponsive.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView
  ///
  ///**Parameters - Officially Supported Platforms/Implementations**:
  ///- [url]: all platforms
  ///
  ///Use the [CygnusPlatformBrowserEvents.isMethodSupported] method to check if this method is supported at runtime.
  ///{@endtemplate}
  @Deprecated('Use onRenderProcessUnresponsive instead')
  androidOnRenderProcessUnresponsive,

  ///Can be used to check if the [CygnusPlatformBrowserEvents.androidOnSafeBrowsingHit] method is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusPlatformBrowserEvents.androidOnSafeBrowsingHit.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView
  ///
  ///**Parameters - Officially Supported Platforms/Implementations**:
  ///- [url]: all platforms
  ///- [threatType]: all platforms
  ///
  ///Use the [CygnusPlatformBrowserEvents.isMethodSupported] method to check if this method is supported at runtime.
  ///{@endtemplate}
  @Deprecated('Use onSafeBrowsingHit instead')
  androidOnSafeBrowsingHit,

  ///Can be used to check if the [CygnusPlatformBrowserEvents.androidOnScaleChanged] method is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusPlatformBrowserEvents.androidOnScaleChanged.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView
  ///
  ///**Parameters - Officially Supported Platforms/Implementations**:
  ///- [oldScale]: all platforms
  ///- [newScale]: all platforms
  ///
  ///Use the [CygnusPlatformBrowserEvents.isMethodSupported] method to check if this method is supported at runtime.
  ///{@endtemplate}
  @Deprecated('Use onZoomScaleChanged instead')
  androidOnScaleChanged,

  ///Can be used to check if the [CygnusPlatformBrowserEvents.androidShouldInterceptRequest] method is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusPlatformBrowserEvents.androidShouldInterceptRequest.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView
  ///
  ///**Parameters - Officially Supported Platforms/Implementations**:
  ///- [request]: all platforms
  ///
  ///Use the [CygnusPlatformBrowserEvents.isMethodSupported] method to check if this method is supported at runtime.
  ///{@endtemplate}
  @Deprecated('Use shouldInterceptRequest instead')
  androidShouldInterceptRequest,

  ///Can be used to check if the [CygnusPlatformBrowserEvents.iosOnDidReceiveServerRedirectForProvisionalNavigation] method is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusPlatformBrowserEvents.iosOnDidReceiveServerRedirectForProvisionalNavigation.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- iOS WKWebView
  ///
  ///Use the [CygnusPlatformBrowserEvents.isMethodSupported] method to check if this method is supported at runtime.
  ///{@endtemplate}
  @Deprecated('Use onDidReceiveServerRedirectForProvisionalNavigation instead')
  iosOnDidReceiveServerRedirectForProvisionalNavigation,

  ///Can be used to check if the [CygnusPlatformBrowserEvents.iosOnNavigationResponse] method is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusPlatformBrowserEvents.iosOnNavigationResponse.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- iOS WKWebView
  ///
  ///**Parameters - Officially Supported Platforms/Implementations**:
  ///- [navigationResponse]: all platforms
  ///
  ///Use the [CygnusPlatformBrowserEvents.isMethodSupported] method to check if this method is supported at runtime.
  ///{@endtemplate}
  @Deprecated('Use onNavigationResponse instead')
  iosOnNavigationResponse,

  ///Can be used to check if the [CygnusPlatformBrowserEvents.iosOnWebContentProcessDidTerminate] method is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusPlatformBrowserEvents.iosOnWebContentProcessDidTerminate.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- iOS WKWebView
  ///
  ///Use the [CygnusPlatformBrowserEvents.isMethodSupported] method to check if this method is supported at runtime.
  ///{@endtemplate}
  @Deprecated('Use onWebContentProcessDidTerminate instead')
  iosOnWebContentProcessDidTerminate,

  ///Can be used to check if the [CygnusPlatformBrowserEvents.iosShouldAllowDeprecatedTLS] method is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusPlatformBrowserEvents.iosShouldAllowDeprecatedTLS.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- iOS WKWebView
  ///
  ///**Parameters - Officially Supported Platforms/Implementations**:
  ///- [challenge]: all platforms
  ///
  ///Use the [CygnusPlatformBrowserEvents.isMethodSupported] method to check if this method is supported at runtime.
  ///{@endtemplate}
  @Deprecated('Use shouldAllowDeprecatedTLS instead')
  iosShouldAllowDeprecatedTLS,

  ///Can be used to check if the [CygnusPlatformBrowserEvents.onAcceleratorKeyPressed] method is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusPlatformBrowserEvents.onAcceleratorKeyPressed.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Windows WebView2 ([Official API - ICoreWebView2Controller.add_AcceleratorKeyPressed](https://learn.microsoft.com/en-us/microsoft-edge/webview2/reference/win32/icorewebview2controller?view=webview2-1.0.2849.39#add_acceleratorkeypressed))
  ///
  ///**Parameters - Officially Supported Platforms/Implementations**:
  ///- [detail]: all platforms
  ///
  ///Use the [CygnusPlatformBrowserEvents.isMethodSupported] method to check if this method is supported at runtime.
  ///{@endtemplate}
  onAcceleratorKeyPressed,

  ///Can be used to check if the [CygnusPlatformBrowserEvents.onAjaxProgress] method is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusPlatformBrowserEvents.onAjaxProgress.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView:
  ///    - In order to be able to listen this event, check the [CygnusWebViewSettings.useShouldInterceptAjaxRequest] and [CygnusWebViewSettings.useOnAjaxProgress] settings documentation. Also, on Android that doesn't support the [CygnusWebViewFeature.DOCUMENT_START_SCRIPT], unlike iOS that has [WKUserScript](https://developer.apple.com/documentation/webkit/wkuserscript) that can inject javascript code right after the document element is created but before any other content is loaded, in Android the javascript code used to intercept ajax requests is loaded as soon as possible so it won't be instantaneous as iOS. In that case, after the `window.addEventListener("flutterInAppWebViewPlatformReady")` event is dispatched, the ajax requests can be intercept for sure.
  ///- iOS WKWebView
  ///- macOS WKWebView
  ///
  ///**Parameters - Officially Supported Platforms/Implementations**:
  ///- [ajaxRequest]: all platforms
  ///
  ///Use the [CygnusPlatformBrowserEvents.isMethodSupported] method to check if this method is supported at runtime.
  ///{@endtemplate}
  onAjaxProgress,

  ///Can be used to check if the [CygnusPlatformBrowserEvents.onAjaxReadyStateChange] method is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusPlatformBrowserEvents.onAjaxReadyStateChange.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView:
  ///    - In order to be able to listen this event, check the [CygnusWebViewSettings.useShouldInterceptAjaxRequest] and [CygnusWebViewSettings.useOnAjaxReadyStateChange] settings documentation. Also, on Android that doesn't support the [CygnusWebViewFeature.DOCUMENT_START_SCRIPT], unlike iOS that has [WKUserScript](https://developer.apple.com/documentation/webkit/wkuserscript) that can inject javascript code right after the document element is created but before any other content is loaded, in Android the javascript code used to intercept ajax requests is loaded as soon as possible so it won't be instantaneous as iOS. In that case, after the `window.addEventListener("flutterInAppWebViewPlatformReady")` event is dispatched, the ajax requests can be intercept for sure.
  ///- iOS WKWebView
  ///- macOS WKWebView
  ///
  ///**Parameters - Officially Supported Platforms/Implementations**:
  ///- [ajaxRequest]: all platforms
  ///
  ///Use the [CygnusPlatformBrowserEvents.isMethodSupported] method to check if this method is supported at runtime.
  ///{@endtemplate}
  onAjaxReadyStateChange,

  ///Can be used to check if the [CygnusPlatformBrowserEvents.onBrowserCreated] method is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusPlatformBrowserEvents.onBrowserCreated.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView
  ///- iOS WKWebView
  ///- macOS WKWebView
  ///- Windows WebView2
  ///- Linux WPE WebKit
  ///
  ///Use the [CygnusPlatformBrowserEvents.isMethodSupported] method to check if this method is supported at runtime.
  ///{@endtemplate}
  onBrowserCreated,

  ///Can be used to check if the [CygnusPlatformBrowserEvents.onCameraCaptureStateChanged] method is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusPlatformBrowserEvents.onCameraCaptureStateChanged.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- iOS WKWebView 15.0+
  ///- macOS WKWebView 12.0+
  ///
  ///**Parameters - Officially Supported Platforms/Implementations**:
  ///- [oldState]: all platforms
  ///- [newState]: all platforms
  ///
  ///Use the [CygnusPlatformBrowserEvents.isMethodSupported] method to check if this method is supported at runtime.
  ///{@endtemplate}
  onCameraCaptureStateChanged,

  ///Can be used to check if the [CygnusPlatformBrowserEvents.onCloseWindow] method is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusPlatformBrowserEvents.onCloseWindow.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView ([Official API - WebChromeClient.onCloseWindow](https://developer.android.com/reference/android/webkit/WebChromeClient#onCloseWindow(android.webkit.WebView)))
  ///- iOS WKWebView ([Official API - WKUIDelegate.webViewDidClose](https://developer.apple.com/documentation/webkit/wkuidelegate/1537390-webviewdidclose))
  ///- macOS WKWebView ([Official API - WKUIDelegate.webViewDidClose](https://developer.apple.com/documentation/webkit/wkuidelegate/1537390-webviewdidclose))
  ///- Web \<iframe\> but requires same origin
  ///- Windows WebView2 ([Official API - ICoreWebView2.add_WindowCloseRequested](https://learn.microsoft.com/en-us/microsoft-edge/webview2/reference/win32/icorewebview2?view=webview2-1.0.2210.55#add_windowcloserequested))
  ///
  ///Use the [CygnusPlatformBrowserEvents.isMethodSupported] method to check if this method is supported at runtime.
  ///{@endtemplate}
  onCloseWindow,

  ///Can be used to check if the [CygnusPlatformBrowserEvents.onConsoleMessage] method is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusPlatformBrowserEvents.onConsoleMessage.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView ([Official API - WebChromeClient.onConsoleMessage](https://developer.android.com/reference/android/webkit/WebChromeClient#onConsoleMessage(android.webkit.CygnusConsoleMessage)))
  ///- iOS WKWebView:
  ///    - This event is implemented using JavaScript.
  ///- macOS WKWebView:
  ///    - This event is implemented using JavaScript.
  ///- Web \<iframe\> but requires same origin
  ///- Windows WebView2
  ///
  ///**Parameters - Officially Supported Platforms/Implementations**:
  ///- [consoleMessage]: all platforms
  ///
  ///Use the [CygnusPlatformBrowserEvents.isMethodSupported] method to check if this method is supported at runtime.
  ///{@endtemplate}
  onConsoleMessage,

  ///Can be used to check if the [CygnusPlatformBrowserEvents.onContentLoading] method is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusPlatformBrowserEvents.onContentLoading.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Windows WebView2 ([Official API - ICoreWebView2.add_ContentLoading](https://learn.microsoft.com/en-us/microsoft-edge/webview2/reference/win32/icorewebview2?view=webview2-1.0.2210.55#add_contentloading))
  ///
  ///**Parameters - Officially Supported Platforms/Implementations**:
  ///- [url]: all platforms
  ///
  ///Use the [CygnusPlatformBrowserEvents.isMethodSupported] method to check if this method is supported at runtime.
  ///{@endtemplate}
  onContentLoading,

  ///Can be used to check if the [CygnusPlatformBrowserEvents.onContentSizeChanged] method is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusPlatformBrowserEvents.onContentSizeChanged.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- iOS WKWebView
  ///
  ///**Parameters - Officially Supported Platforms/Implementations**:
  ///- [oldContentSize]: all platforms
  ///- [newContentSize]: all platforms
  ///
  ///Use the [CygnusPlatformBrowserEvents.isMethodSupported] method to check if this method is supported at runtime.
  ///{@endtemplate}
  onContentSizeChanged,

  ///Can be used to check if the [CygnusPlatformBrowserEvents.onCreateWindow] method is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusPlatformBrowserEvents.onCreateWindow.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView ([Official API - WebChromeClient.onCreateWindow](https://developer.android.com/reference/android/webkit/WebChromeClient#onCreateWindow(android.webkit.WebView,%20boolean,%20boolean,%20android.os.Message))):
  ///    - You need to set [CygnusWebViewSettings.supportMultipleWindows] setting to `true`. Also, if the request has been created using JavaScript (`window.open()`), then there are some limitation: check the [CygnusNavigationAction] class.
  ///- iOS WKWebView ([Official API - WKUIDelegate.webView](https://developer.apple.com/documentation/webkit/wkuidelegate/1536907-webview)):
  ///    - Setting these initial settings [CygnusWebViewSettings.supportZoom], [CygnusWebViewSettings.useOnLoadResource], [CygnusWebViewSettings.useShouldInterceptAjaxRequest], [CygnusWebViewSettings.useShouldInterceptFetchRequest], [CygnusWebViewSettings.applicationNameForUserAgent], [CygnusWebViewSettings.javaScriptCanOpenWindowsAutomatically], [CygnusWebViewSettings.javaScriptEnabled], [CygnusWebViewSettings.minimumFontSize], [CygnusWebViewSettings.preferredContentMode], [CygnusWebViewSettings.incognito], [CygnusWebViewSettings.cacheEnabled], [CygnusWebViewSettings.mediaPlaybackRequiresUserGesture], [CygnusWebViewSettings.resourceCustomSchemes], [CygnusWebViewSettings.sharedCookiesEnabled], [CygnusWebViewSettings.enableViewportScale], [CygnusWebViewSettings.allowsAirPlayForMediaPlayback], [CygnusWebViewSettings.allowsPictureInPictureMediaPlayback], [CygnusWebViewSettings.isFraudulentWebsiteWarningEnabled], [CygnusWebViewSettings.allowsInlineMediaPlayback], [CygnusWebViewSettings.suppressesIncrementalRendering], [CygnusWebViewSettings.selectionGranularity], [CygnusWebViewSettings.ignoresViewportScaleLimits], [CygnusWebViewSettings.limitsNavigationsToAppBoundDomains], [CygnusWebViewSettings.upgradeKnownHostsToHTTPS], will have no effect due to a `WKWebView` limitation when creating the new window WebView: it's impossible to return the new `WKWebView` with a different `WKWebViewConfiguration` instance (see https://developer.apple.com/documentation/webkit/wkuidelegate/1536907-webview). So, these options will be inherited from the caller WebView. Also, note that calling [CygnusWebViewController.setSettings] method using the controller of the new created WebView, it will update also the WebView options of the caller WebView.
  ///- macOS WKWebView ([Official API - WKUIDelegate.webView](https://developer.apple.com/documentation/webkit/wkuidelegate/1536907-webview)):
  ///    - Setting these initial settings [CygnusWebViewSettings.supportZoom], [CygnusWebViewSettings.useOnLoadResource], [CygnusWebViewSettings.useShouldInterceptAjaxRequest], [CygnusWebViewSettings.useShouldInterceptFetchRequest], [CygnusWebViewSettings.applicationNameForUserAgent], [CygnusWebViewSettings.javaScriptCanOpenWindowsAutomatically], [CygnusWebViewSettings.javaScriptEnabled], [CygnusWebViewSettings.minimumFontSize], [CygnusWebViewSettings.preferredContentMode], [CygnusWebViewSettings.incognito], [CygnusWebViewSettings.cacheEnabled], [CygnusWebViewSettings.mediaPlaybackRequiresUserGesture], [CygnusWebViewSettings.resourceCustomSchemes], [CygnusWebViewSettings.sharedCookiesEnabled], [CygnusWebViewSettings.enableViewportScale], [CygnusWebViewSettings.allowsAirPlayForMediaPlayback], [CygnusWebViewSettings.allowsPictureInPictureMediaPlayback], [CygnusWebViewSettings.isFraudulentWebsiteWarningEnabled], [CygnusWebViewSettings.allowsInlineMediaPlayback], [CygnusWebViewSettings.suppressesIncrementalRendering], [CygnusWebViewSettings.selectionGranularity], [CygnusWebViewSettings.ignoresViewportScaleLimits], [CygnusWebViewSettings.limitsNavigationsToAppBoundDomains], [CygnusWebViewSettings.upgradeKnownHostsToHTTPS], will have no effect due to a `WKWebView` limitation when creating the new window WebView: it's impossible to return the new `WKWebView` with a different `WKWebViewConfiguration` instance (see https://developer.apple.com/documentation/webkit/wkuidelegate/1536907-webview). So, these options will be inherited from the caller WebView. Also, note that calling [CygnusWebViewController.setSettings] method using the controller of the new created WebView, it will update also the WebView options of the caller WebView.
  ///- Windows WebView2 ([Official API - ICoreWebView2.add_NewWindowRequested](https://learn.microsoft.com/en-us/microsoft-edge/webview2/reference/win32/icorewebview2?view=webview2-1.0.2210.55#add_newwindowrequested))
  ///
  ///**Parameters - Officially Supported Platforms/Implementations**:
  ///- [createWindowAction]: all platforms
  ///
  ///Use the [CygnusPlatformBrowserEvents.isMethodSupported] method to check if this method is supported at runtime.
  ///{@endtemplate}
  onCreateWindow,

  ///Can be used to check if the [CygnusPlatformBrowserEvents.onDOMContentLoaded] method is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusPlatformBrowserEvents.onDOMContentLoaded.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Windows WebView2 ([Official API - ICoreWebView2_2.add_DOMContentLoaded](https://learn.microsoft.com/en-us/microsoft-edge/webview2/reference/win32/icorewebview2_2?view=webview2-1.0.2210.55#add_domcontentloaded))
  ///
  ///**Parameters - Officially Supported Platforms/Implementations**:
  ///- [url]: all platforms
  ///
  ///Use the [CygnusPlatformBrowserEvents.isMethodSupported] method to check if this method is supported at runtime.
  ///{@endtemplate}
  onDOMContentLoaded,

  ///Can be used to check if the [CygnusPlatformBrowserEvents.onDidReceiveServerRedirectForProvisionalNavigation] method is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusPlatformBrowserEvents.onDidReceiveServerRedirectForProvisionalNavigation.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- iOS WKWebView ([Official API - WKNavigationDelegate.webView](https://developer.apple.com/documentation/webkit/wknavigationdelegate/1455627-webview))
  ///- macOS WKWebView ([Official API - WKNavigationDelegate.webView](https://developer.apple.com/documentation/webkit/wknavigationdelegate/1455627-webview))
  ///
  ///Use the [CygnusPlatformBrowserEvents.isMethodSupported] method to check if this method is supported at runtime.
  ///{@endtemplate}
  onDidReceiveServerRedirectForProvisionalNavigation,

  ///Can be used to check if the [CygnusPlatformBrowserEvents.onDownloadStart] method is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusPlatformBrowserEvents.onDownloadStart.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView
  ///- iOS WKWebView
  ///
  ///**Parameters - Officially Supported Platforms/Implementations**:
  ///- [url]: all platforms
  ///
  ///Use the [CygnusPlatformBrowserEvents.isMethodSupported] method to check if this method is supported at runtime.
  ///{@endtemplate}
  @Deprecated('Use onDownloadStarting instead')
  onDownloadStart,

  ///Can be used to check if the [CygnusPlatformBrowserEvents.onDownloadStartRequest] method is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusPlatformBrowserEvents.onDownloadStartRequest.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView
  ///- iOS WKWebView
  ///- macOS WKWebView
  ///
  ///**Parameters - Officially Supported Platforms/Implementations**:
  ///- [downloadStartRequest]: all platforms
  ///
  ///Use the [CygnusPlatformBrowserEvents.isMethodSupported] method to check if this method is supported at runtime.
  ///{@endtemplate}
  @Deprecated('Use onDownloadStarting instead')
  onDownloadStartRequest,

  ///Can be used to check if the [CygnusPlatformBrowserEvents.onDownloadStarting] method is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusPlatformBrowserEvents.onDownloadStarting.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView ([Official API - WebView.setDownloadListener]((https://developer.android.com/reference/android/webkit/WebView#setDownloadListener(android.webkit.DownloadListener)))
  ///- iOS WKWebView
  ///- macOS WKWebView
  ///- Windows WebView2 ([Official API - ICoreWebView2_4.add_DownloadStarting](https://learn.microsoft.com/en-us/microsoft-edge/webview2/reference/win32/icorewebview2_4?view=webview2-1.0.2849.39#add_downloadstarting))
  ///
  ///**Parameters - Officially Supported Platforms/Implementations**:
  ///- [downloadStartRequest]: all platforms
  ///
  ///Use the [CygnusPlatformBrowserEvents.isMethodSupported] method to check if this method is supported at runtime.
  ///{@endtemplate}
  onDownloadStarting,

  ///Can be used to check if the [CygnusPlatformBrowserEvents.onEnterFullscreen] method is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusPlatformBrowserEvents.onEnterFullscreen.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView ([Official API - WebChromeClient.onShowCustomView](https://developer.android.com/reference/android/webkit/WebChromeClient#onShowCustomView(android.view.View,%20android.webkit.WebChromeClient.CustomViewCallback)))
  ///- iOS WKWebView ([Official API - UIWindow.didBecomeVisibleNotification](https://developer.apple.com/documentation/uikit/uiwindow/1621621-didbecomevisiblenotification))
  ///- macOS WKWebView ([Official API - NSWindow.didEnterFullScreenNotification](https://developer.apple.com/documentation/appkit/nswindow/1419651-didenterfullscreennotification))
  ///- Windows WebView2 ([Official API - ICoreWebView2.add_ContainsFullScreenElementChanged](https://learn.microsoft.com/en-us/microsoft-edge/webview2/reference/win32/icorewebview2?view=webview2-1.0.2210.55#add_containsfullscreenelementchanged))
  ///
  ///Use the [CygnusPlatformBrowserEvents.isMethodSupported] method to check if this method is supported at runtime.
  ///{@endtemplate}
  onEnterFullscreen,

  ///Can be used to check if the [CygnusPlatformBrowserEvents.onExit] method is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusPlatformBrowserEvents.onExit.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView
  ///- iOS WKWebView
  ///- macOS WKWebView
  ///- Windows WebView2
  ///- Linux WPE WebKit
  ///
  ///Use the [CygnusPlatformBrowserEvents.isMethodSupported] method to check if this method is supported at runtime.
  ///{@endtemplate}
  onExit,

  ///Can be used to check if the [CygnusPlatformBrowserEvents.onExitFullscreen] method is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusPlatformBrowserEvents.onExitFullscreen.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView ([Official API - WebChromeClient.onHideCustomView](https://developer.android.com/reference/android/webkit/WebChromeClient#onHideCustomView()))
  ///- iOS WKWebView ([Official API - UIWindow.didBecomeHiddenNotification](https://developer.apple.com/documentation/uikit/uiwindow/1621617-didbecomehiddennotification))
  ///- macOS WKWebView ([Official API - NSWindow.didExitFullScreenNotification](https://developer.apple.com/documentation/appkit/nswindow/1419177-didexitfullscreennotification))
  ///- Windows WebView2 ([Official API - ICoreWebView2.add_ContainsFullScreenElementChanged](https://learn.microsoft.com/en-us/microsoft-edge/webview2/reference/win32/icorewebview2?view=webview2-1.0.2210.55#add_containsfullscreenelementchanged))
  ///
  ///Use the [CygnusPlatformBrowserEvents.isMethodSupported] method to check if this method is supported at runtime.
  ///{@endtemplate}
  onExitFullscreen,

  ///Can be used to check if the [CygnusPlatformBrowserEvents.onFaviconChanged] method is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusPlatformBrowserEvents.onFaviconChanged.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView ([Official API - WebChromeClient.onReceivedIcon](https://developer.android.com/reference/android/webkit/WebChromeClient#onReceivedIcon(android.webkit.WebView,%20android.graphics.Bitmap)))
  ///- Windows WebView2 ([Official API - ICoreWebView2_15.add_FaviconChanged](https://learn.microsoft.com/en-us/microsoft-edge/webview2/reference/win32/icorewebview2_15?view=webview2-1.0.2849.39#add_faviconchanged))
  ///
  ///**Parameters - Officially Supported Platforms/Implementations**:
  ///- [faviconChangedRequest]: all platforms
  ///
  ///Use the [CygnusPlatformBrowserEvents.isMethodSupported] method to check if this method is supported at runtime.
  ///{@endtemplate}
  onFaviconChanged,

  ///Can be used to check if the [CygnusPlatformBrowserEvents.onFindResultReceived] method is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusPlatformBrowserEvents.onFindResultReceived.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView
  ///- iOS WKWebView
  ///- macOS WKWebView
  ///
  ///**Parameters - Officially Supported Platforms/Implementations**:
  ///- [activeMatchOrdinal]: all platforms
  ///- [numberOfMatches]: all platforms
  ///- [isDoneCounting]: all platforms
  ///
  ///Use the [CygnusPlatformBrowserEvents.isMethodSupported] method to check if this method is supported at runtime.
  ///{@endtemplate}
  @Deprecated(
    'Use CygnusFindInteractionController.onFindResultReceived instead',
  )
  onFindResultReceived,

  ///Can be used to check if the [CygnusPlatformBrowserEvents.onFormResubmission] method is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusPlatformBrowserEvents.onFormResubmission.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView ([Official API - WebViewClient.onFormResubmission](https://developer.android.com/reference/android/webkit/WebViewClient#onFormResubmission(android.webkit.WebView,%20android.os.Message,%20android.os.Message)))
  ///
  ///**Parameters - Officially Supported Platforms/Implementations**:
  ///- [url]: all platforms
  ///
  ///Use the [CygnusPlatformBrowserEvents.isMethodSupported] method to check if this method is supported at runtime.
  ///{@endtemplate}
  onFormResubmission,

  ///Can be used to check if the [CygnusPlatformBrowserEvents.onGeolocationPermissionsHidePrompt] method is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusPlatformBrowserEvents.onGeolocationPermissionsHidePrompt.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView ([Official API - WebChromeClient.onGeolocationPermissionsHidePrompt](https://developer.android.com/reference/android/webkit/WebChromeClient#onGeolocationPermissionsHidePrompt()))
  ///
  ///Use the [CygnusPlatformBrowserEvents.isMethodSupported] method to check if this method is supported at runtime.
  ///{@endtemplate}
  onGeolocationPermissionsHidePrompt,

  ///Can be used to check if the [CygnusPlatformBrowserEvents.onGeolocationPermissionsShowPrompt] method is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusPlatformBrowserEvents.onGeolocationPermissionsShowPrompt.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView ([Official API - WebChromeClient.onGeolocationPermissionsShowPrompt](https://developer.android.com/reference/android/webkit/WebChromeClient#onGeolocationPermissionsShowPrompt(java.lang.String,%20android.webkit.GeolocationPermissions.Callback)))
  ///
  ///**Parameters - Officially Supported Platforms/Implementations**:
  ///- [origin]: all platforms
  ///
  ///Use the [CygnusPlatformBrowserEvents.isMethodSupported] method to check if this method is supported at runtime.
  ///{@endtemplate}
  onGeolocationPermissionsShowPrompt,

  ///Can be used to check if the [CygnusPlatformBrowserEvents.onJsAlert] method is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusPlatformBrowserEvents.onJsAlert.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView ([Official API - WebChromeClient.onJsAlert](https://developer.android.com/reference/android/webkit/WebChromeClient#onJsAlert(android.webkit.WebView,%20java.lang.String,%20java.lang.String,%20android.webkit.JsResult)))
  ///- iOS WKWebView ([Official API - WKUIDelegate.webView](https://developer.apple.com/documentation/webkit/wkuidelegate/1537406-webview))
  ///- macOS WKWebView ([Official API - WKUIDelegate.webView](https://developer.apple.com/documentation/webkit/wkuidelegate/1537406-webview))
  ///
  ///**Parameters - Officially Supported Platforms/Implementations**:
  ///- [jsAlertRequest]: all platforms
  ///
  ///Use the [CygnusPlatformBrowserEvents.isMethodSupported] method to check if this method is supported at runtime.
  ///{@endtemplate}
  onJsAlert,

  ///Can be used to check if the [CygnusPlatformBrowserEvents.onJsConfirm] method is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusPlatformBrowserEvents.onJsConfirm.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView ([Official API - WebChromeClient.onJsConfirm](https://developer.android.com/reference/android/webkit/WebChromeClient#onJsConfirm(android.webkit.WebView,%20java.lang.String,%20java.lang.String,%20android.webkit.JsResult)))
  ///- iOS WKWebView ([Official API - WKUIDelegate.webView](https://developer.apple.com/documentation/webkit/wkuidelegate/1536489-webview))
  ///- macOS WKWebView ([Official API - WKUIDelegate.webView](https://developer.apple.com/documentation/webkit/wkuidelegate/1536489-webview))
  ///
  ///**Parameters - Officially Supported Platforms/Implementations**:
  ///- [jsConfirmRequest]: all platforms
  ///
  ///Use the [CygnusPlatformBrowserEvents.isMethodSupported] method to check if this method is supported at runtime.
  ///{@endtemplate}
  onJsConfirm,

  ///Can be used to check if the [CygnusPlatformBrowserEvents.onJsPrompt] method is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusPlatformBrowserEvents.onJsPrompt.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView ([Official API - WebChromeClient.onJsPrompt](https://developer.android.com/reference/android/webkit/WebChromeClient#onJsPrompt(android.webkit.WebView,%20java.lang.String,%20java.lang.String,%20java.lang.String,%20android.webkit.JsPromptResult)))
  ///- iOS WKWebView ([Official API - WKUIDelegate.webView](https://developer.apple.com/documentation/webkit/wkuidelegate/1538086-webview))
  ///- macOS WKWebView ([Official API - WKUIDelegate.webView](https://developer.apple.com/documentation/webkit/wkuidelegate/1538086-webview))
  ///
  ///**Parameters - Officially Supported Platforms/Implementations**:
  ///- [jsPromptRequest]: all platforms
  ///
  ///Use the [CygnusPlatformBrowserEvents.isMethodSupported] method to check if this method is supported at runtime.
  ///{@endtemplate}
  onJsPrompt,

  ///Can be used to check if the [CygnusPlatformBrowserEvents.onLaunchingExternalUriScheme] method is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusPlatformBrowserEvents.onLaunchingExternalUriScheme.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Windows WebView2 ([Official API - ICoreWebView2_18.add_LaunchingExternalUriScheme](https://learn.microsoft.com/en-us/microsoft-edge/webview2/reference/win32/icorewebview2_18?view=webview2-1.0.2849.39#add_launchingexternalurischeme))
  ///
  ///**Parameters - Officially Supported Platforms/Implementations**:
  ///- [request]: all platforms
  ///
  ///Use the [CygnusPlatformBrowserEvents.isMethodSupported] method to check if this method is supported at runtime.
  ///{@endtemplate}
  onLaunchingExternalUriScheme,

  ///Can be used to check if the [CygnusPlatformBrowserEvents.onLoadError] method is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusPlatformBrowserEvents.onLoadError.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView
  ///- iOS WKWebView
  ///- macOS WKWebView
  ///
  ///**Parameters - Officially Supported Platforms/Implementations**:
  ///- [url]: all platforms
  ///- [code]: all platforms
  ///- [message]: all platforms
  ///
  ///Use the [CygnusPlatformBrowserEvents.isMethodSupported] method to check if this method is supported at runtime.
  ///{@endtemplate}
  @Deprecated('Use onReceivedError instead')
  onLoadError,

  ///Can be used to check if the [CygnusPlatformBrowserEvents.onLoadHttpError] method is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusPlatformBrowserEvents.onLoadHttpError.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView
  ///- iOS WKWebView
  ///- macOS WKWebView
  ///
  ///**Parameters - Officially Supported Platforms/Implementations**:
  ///- [url]: all platforms
  ///- [statusCode]: all platforms
  ///- [description]: all platforms
  ///
  ///Use the [CygnusPlatformBrowserEvents.isMethodSupported] method to check if this method is supported at runtime.
  ///{@endtemplate}
  @Deprecated('Use onReceivedHttpError instead')
  onLoadHttpError,

  ///Can be used to check if the [CygnusPlatformBrowserEvents.onLoadResource] method is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusPlatformBrowserEvents.onLoadResource.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView:
  ///    - This event is implemented using JavaScript.
  ///- iOS WKWebView:
  ///    - This event is implemented using JavaScript.
  ///- macOS WKWebView:
  ///    - This event is implemented using JavaScript.
  ///
  ///**Parameters - Officially Supported Platforms/Implementations**:
  ///- [resource]: all platforms
  ///
  ///Use the [CygnusPlatformBrowserEvents.isMethodSupported] method to check if this method is supported at runtime.
  ///{@endtemplate}
  onLoadResource,

  ///Can be used to check if the [CygnusPlatformBrowserEvents.onLoadResourceCustomScheme] method is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusPlatformBrowserEvents.onLoadResourceCustomScheme.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView
  ///- iOS WKWebView
  ///- macOS WKWebView
  ///
  ///**Parameters - Officially Supported Platforms/Implementations**:
  ///- [url]: all platforms
  ///
  ///Use the [CygnusPlatformBrowserEvents.isMethodSupported] method to check if this method is supported at runtime.
  ///{@endtemplate}
  @Deprecated('Use onLoadResourceWithCustomScheme instead')
  onLoadResourceCustomScheme,

  ///Can be used to check if the [CygnusPlatformBrowserEvents.onLoadResourceWithCustomScheme] method is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusPlatformBrowserEvents.onLoadResourceWithCustomScheme.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView
  ///- iOS WKWebView ([Official API - WKURLSchemeHandler](https://developer.apple.com/documentation/webkit/wkurlschemehandler))
  ///- macOS WKWebView ([Official API - WKURLSchemeHandler](https://developer.apple.com/documentation/webkit/wkurlschemehandler))
  ///- Windows WebView2
  ///
  ///**Parameters - Officially Supported Platforms/Implementations**:
  ///- [request]: all platforms
  ///
  ///Use the [CygnusPlatformBrowserEvents.isMethodSupported] method to check if this method is supported at runtime.
  ///{@endtemplate}
  onLoadResourceWithCustomScheme,

  ///Can be used to check if the [CygnusPlatformBrowserEvents.onLoadStart] method is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusPlatformBrowserEvents.onLoadStart.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView ([Official API - WebViewClient.onPageStarted](https://developer.android.com/reference/android/webkit/WebViewClient#onPageStarted(android.webkit.WebView,%20java.lang.String,%20android.graphics.Bitmap)))
  ///- iOS WKWebView ([Official API - WKNavigationDelegate.webView](https://developer.apple.com/documentation/webkit/wknavigationdelegate/1455621-webview))
  ///- macOS WKWebView ([Official API - WKNavigationDelegate.webView](https://developer.apple.com/documentation/webkit/wknavigationdelegate/1455621-webview))
  ///- Windows WebView2 ([Official API - ICoreWebView2.add_NavigationStarting](https://learn.microsoft.com/en-us/microsoft-edge/webview2/reference/win32/iwebview2webview?view=webview2-0.8.355#add_navigationstarting))
  ///
  ///**Parameters - Officially Supported Platforms/Implementations**:
  ///- [url]: all platforms
  ///
  ///Use the [CygnusPlatformBrowserEvents.isMethodSupported] method to check if this method is supported at runtime.
  ///{@endtemplate}
  onLoadStart,

  ///Can be used to check if the [CygnusPlatformBrowserEvents.onLoadStop] method is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusPlatformBrowserEvents.onLoadStop.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView ([Official API - WebViewClient.onPageFinished](https://developer.android.com/reference/android/webkit/WebViewClient#onPageFinished(android.webkit.WebView,%20java.lang.String)))
  ///- iOS WKWebView ([Official API - WKNavigationDelegate.webView](https://developer.apple.com/documentation/webkit/wknavigationdelegate/1455629-webview))
  ///- macOS WKWebView ([Official API - WKNavigationDelegate.webView](https://developer.apple.com/documentation/webkit/wknavigationdelegate/1455629-webview))
  ///- Windows WebView2 ([Official API - ICoreWebView2.add_NavigationCompleted](https://learn.microsoft.com/en-us/microsoft-edge/webview2/reference/win32/iwebview2webview?view=webview2-0.8.355#add_navigationcompleted))
  ///
  ///**Parameters - Officially Supported Platforms/Implementations**:
  ///- [url]: all platforms
  ///
  ///Use the [CygnusPlatformBrowserEvents.isMethodSupported] method to check if this method is supported at runtime.
  ///{@endtemplate}
  onLoadStop,

  ///Can be used to check if the [CygnusPlatformBrowserEvents.onLongPressHitTestResult] method is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusPlatformBrowserEvents.onLongPressHitTestResult.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView ([Official API - View.setOnLongClickListener](https://developer.android.com/reference/android/view/View#setOnLongClickListener(android.view.View.OnLongClickListener)))
  ///- iOS WKWebView ([Official API - UILongPressGestureRecognizer](https://developer.apple.com/documentation/uikit/uilongpressgesturerecognizer))
  ///
  ///**Parameters - Officially Supported Platforms/Implementations**:
  ///- [hitTestResult]: all platforms
  ///
  ///Use the [CygnusPlatformBrowserEvents.isMethodSupported] method to check if this method is supported at runtime.
  ///{@endtemplate}
  onLongPressHitTestResult,

  ///Can be used to check if the [CygnusPlatformBrowserEvents.onMainWindowWillClose] method is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusPlatformBrowserEvents.onMainWindowWillClose.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- macOS WKWebView
  ///
  ///Use the [CygnusPlatformBrowserEvents.isMethodSupported] method to check if this method is supported at runtime.
  ///{@endtemplate}
  onMainWindowWillClose,

  ///Can be used to check if the [CygnusPlatformBrowserEvents.onMicrophoneCaptureStateChanged] method is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusPlatformBrowserEvents.onMicrophoneCaptureStateChanged.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- iOS WKWebView 15.0+
  ///- macOS WKWebView 12.0+
  ///
  ///**Parameters - Officially Supported Platforms/Implementations**:
  ///- [oldState]: all platforms
  ///- [newState]: all platforms
  ///
  ///Use the [CygnusPlatformBrowserEvents.isMethodSupported] method to check if this method is supported at runtime.
  ///{@endtemplate}
  onMicrophoneCaptureStateChanged,

  ///Can be used to check if the [CygnusPlatformBrowserEvents.onNavigationResponse] method is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusPlatformBrowserEvents.onNavigationResponse.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- iOS WKWebView ([Official API - WKNavigationDelegate.webView](https://developer.apple.com/documentation/webkit/wknavigationdelegate/1455643-webview))
  ///- macOS WKWebView ([Official API - WKNavigationDelegate.webView](https://developer.apple.com/documentation/webkit/wknavigationdelegate/1455643-webview))
  ///
  ///**Parameters - Officially Supported Platforms/Implementations**:
  ///- [navigationResponse]: all platforms
  ///
  ///Use the [CygnusPlatformBrowserEvents.isMethodSupported] method to check if this method is supported at runtime.
  ///{@endtemplate}
  onNavigationResponse,

  ///Can be used to check if the [CygnusPlatformBrowserEvents.onNotificationReceived] method is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusPlatformBrowserEvents.onNotificationReceived.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Windows WebView2 ([Official API - ICoreWebView2_24.add_NotificationReceived](https://learn.microsoft.com/en-us/microsoft-edge/webview2/reference/win32/icorewebview2_24?view=webview2-1.0.2849.39#add_notificationreceived))
  ///
  ///**Parameters - Officially Supported Platforms/Implementations**:
  ///- [request]: all platforms
  ///
  ///Use the [CygnusPlatformBrowserEvents.isMethodSupported] method to check if this method is supported at runtime.
  ///{@endtemplate}
  onNotificationReceived,

  ///Can be used to check if the [CygnusPlatformBrowserEvents.onOverScrolled] method is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusPlatformBrowserEvents.onOverScrolled.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView ([Official API - WebView.onOverScrolled](https://developer.android.com/reference/android/webkit/WebView#onOverScrolled(int,%20int,%20boolean,%20boolean)))
  ///- iOS WKWebView
  ///
  ///**Parameters - Officially Supported Platforms/Implementations**:
  ///- [x]: all platforms
  ///- [y]: all platforms
  ///- [clampedX]: all platforms
  ///- [clampedY]: all platforms
  ///
  ///Use the [CygnusPlatformBrowserEvents.isMethodSupported] method to check if this method is supported at runtime.
  ///{@endtemplate}
  onOverScrolled,

  ///Can be used to check if the [CygnusPlatformBrowserEvents.onPageCommitVisible] method is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusPlatformBrowserEvents.onPageCommitVisible.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView ([Official API - WebViewClient.onPageCommitVisible](https://developer.android.com/reference/android/webkit/WebViewClient#onPageCommitVisible(android.webkit.WebView,%20java.lang.String)))
  ///- iOS WKWebView ([Official API - WKNavigationDelegate.webView](https://developer.apple.com/documentation/webkit/wknavigationdelegate/1455635-webview))
  ///- macOS WKWebView ([Official API - WKNavigationDelegate.webView](https://developer.apple.com/documentation/webkit/wknavigationdelegate/1455635-webview))
  ///
  ///**Parameters - Officially Supported Platforms/Implementations**:
  ///- [url]: all platforms
  ///
  ///Use the [CygnusPlatformBrowserEvents.isMethodSupported] method to check if this method is supported at runtime.
  ///{@endtemplate}
  onPageCommitVisible,

  ///Can be used to check if the [CygnusPlatformBrowserEvents.onPermissionRequest] method is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusPlatformBrowserEvents.onPermissionRequest.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView 21+ ([Official API - WebChromeClient.onPermissionRequest](https://developer.android.com/reference/android/webkit/WebChromeClient#onPermissionRequest(android.webkit.CygnusPermissionRequest)))
  ///- iOS WKWebView 15.0+:
  ///    - The default [CygnusPermissionResponse.action] is [CygnusPermissionResponseAction.PROMPT].
  ///- macOS WKWebView 12.0+:
  ///    - The default [CygnusPermissionResponse.action] is [CygnusPermissionResponseAction.PROMPT].
  ///- Windows WebView2 ([Official API - ICoreWebView2.add_PermissionRequested](https://learn.microsoft.com/en-us/microsoft-edge/webview2/reference/win32/icorewebview2?view=webview2-1.0.2210.55#add_permissionrequested))
  ///
  ///**Parameters - Officially Supported Platforms/Implementations**:
  ///- [permissionRequest]: all platforms
  ///
  ///Use the [CygnusPlatformBrowserEvents.isMethodSupported] method to check if this method is supported at runtime.
  ///{@endtemplate}
  onPermissionRequest,

  ///Can be used to check if the [CygnusPlatformBrowserEvents.onPermissionRequestCanceled] method is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusPlatformBrowserEvents.onPermissionRequestCanceled.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView 21+ ([Official API - WebChromeClient.onPermissionRequestCanceled](https://developer.android.com/reference/android/webkit/WebChromeClient#onPermissionRequestCanceled(android.webkit.CygnusPermissionRequest)))
  ///
  ///**Parameters - Officially Supported Platforms/Implementations**:
  ///- [permissionRequest]: all platforms
  ///
  ///Use the [CygnusPlatformBrowserEvents.isMethodSupported] method to check if this method is supported at runtime.
  ///{@endtemplate}
  onPermissionRequestCanceled,

  ///Can be used to check if the [CygnusPlatformBrowserEvents.onPrint] method is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusPlatformBrowserEvents.onPrint.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView
  ///- iOS WKWebView
  ///
  ///**Parameters - Officially Supported Platforms/Implementations**:
  ///- [url]: all platforms
  ///
  ///Use the [CygnusPlatformBrowserEvents.isMethodSupported] method to check if this method is supported at runtime.
  ///{@endtemplate}
  @Deprecated('Use onPrintRequest instead')
  onPrint,

  ///Can be used to check if the [CygnusPlatformBrowserEvents.onPrintRequest] method is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusPlatformBrowserEvents.onPrintRequest.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView ([Official API - View.scrollBy](https://developer.android.com/reference/android/view/View#scrollBy(int,%20int)))
  ///- iOS WKWebView ([Official API - UIScrollView.setContentOffset](https://developer.apple.com/documentation/uikit/uiscrollview/1619400-setcontentoffset))
  ///- macOS WKWebView:
  ///    - This method is implemented using JavaScript.
  ///
  ///**Parameters - Officially Supported Platforms/Implementations**:
  ///- [url]: all platforms
  ///- [printJobController]: all platforms
  ///
  ///Use the [CygnusPlatformBrowserEvents.isMethodSupported] method to check if this method is supported at runtime.
  ///{@endtemplate}
  onPrintRequest,

  ///Can be used to check if the [CygnusPlatformBrowserEvents.onProcessFailed] method is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusPlatformBrowserEvents.onProcessFailed.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Windows WebView2 ([Official API - ICoreWebView2.add_ProcessFailed](https://learn.microsoft.com/en-us/microsoft-edge/webview2/reference/win32/icorewebview2?view=webview2-1.0.2849.39#add_processfailed))
  ///
  ///**Parameters - Officially Supported Platforms/Implementations**:
  ///- [detail]: all platforms
  ///
  ///Use the [CygnusPlatformBrowserEvents.isMethodSupported] method to check if this method is supported at runtime.
  ///{@endtemplate}
  onProcessFailed,

  ///Can be used to check if the [CygnusPlatformBrowserEvents.onProgressChanged] method is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusPlatformBrowserEvents.onProgressChanged.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView ([Official API - WebChromeClient.onProgressChanged](https://developer.android.com/reference/android/webkit/WebChromeClient#onProgressChanged(android.webkit.WebView,%20int)))
  ///- iOS WKWebView
  ///- macOS WKWebView
  ///- Windows WebView2
  ///
  ///**Parameters - Officially Supported Platforms/Implementations**:
  ///- [progress]: all platforms
  ///
  ///Use the [CygnusPlatformBrowserEvents.isMethodSupported] method to check if this method is supported at runtime.
  ///{@endtemplate}
  onProgressChanged,

  ///Can be used to check if the [CygnusPlatformBrowserEvents.onReceivedClientCertRequest] method is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusPlatformBrowserEvents.onReceivedClientCertRequest.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView ([Official API - WebViewClient.onReceivedClientCertRequest](https://developer.android.com/reference/android/webkit/WebViewClient#onReceivedClientCertRequest(android.webkit.WebView,%20android.webkit.ClientCertRequest)))
  ///- iOS WKWebView ([Official API - WKNavigationDelegate.webView](https://developer.apple.com/documentation/webkit/wknavigationdelegate/1455638-webview))
  ///- macOS WKWebView ([Official API - WKNavigationDelegate.webView](https://developer.apple.com/documentation/webkit/wknavigationdelegate/1455638-webview))
  ///- Windows WebView2 ([Official API - ICoreWebView2_5.add_ClientCertificateRequested](https://learn.microsoft.com/en-us/microsoft-edge/webview2/reference/win32/icorewebview2_5?view=webview2-1.0.2849.39#add_clientcertificaterequested))
  ///
  ///**Parameters - Officially Supported Platforms/Implementations**:
  ///- [challenge]: all platforms
  ///
  ///Use the [CygnusPlatformBrowserEvents.isMethodSupported] method to check if this method is supported at runtime.
  ///{@endtemplate}
  onReceivedClientCertRequest,

  ///Can be used to check if the [CygnusPlatformBrowserEvents.onReceivedError] method is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusPlatformBrowserEvents.onReceivedError.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView ([Official API - WebViewClient.onReceivedError](https://developer.android.com/reference/android/webkit/WebViewClient#onReceivedError(android.webkit.WebView,%20android.webkit.CygnusWebResourceRequest,%20android.webkit.CygnusWebResourceError)))
  ///- iOS WKWebView ([Official API - WKNavigationDelegate.webView](https://developer.apple.com/documentation/webkit/wknavigationdelegate/1455623-webview))
  ///- macOS WKWebView ([Official API - WKNavigationDelegate.webView](https://developer.apple.com/documentation/webkit/wknavigationdelegate/1455623-webview))
  ///- Windows WebView2 ([Official API - ICoreWebView2.add_NavigationCompleted](https://learn.microsoft.com/en-us/microsoft-edge/webview2/reference/win32/iwebview2webview?view=webview2-0.8.355#add_navigationcompleted))
  ///
  ///**Parameters - Officially Supported Platforms/Implementations**:
  ///- [request]: all platforms
  ///- [error]: all platforms
  ///
  ///Use the [CygnusPlatformBrowserEvents.isMethodSupported] method to check if this method is supported at runtime.
  ///{@endtemplate}
  onReceivedError,

  ///Can be used to check if the [CygnusPlatformBrowserEvents.onReceivedHttpAuthRequest] method is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusPlatformBrowserEvents.onReceivedHttpAuthRequest.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView ([Official API - WebViewClient.onReceivedHttpAuthRequest](https://developer.android.com/reference/android/webkit/WebViewClient#onReceivedHttpAuthRequest(android.webkit.WebView,%20android.webkit.HttpAuthHandler,%20java.lang.String,%20java.lang.String)))
  ///- iOS WKWebView ([Official API - WKNavigationDelegate.webView](https://developer.apple.com/documentation/webkit/wknavigationdelegate/1455638-webview))
  ///- macOS WKWebView ([Official API - WKNavigationDelegate.webView](https://developer.apple.com/documentation/webkit/wknavigationdelegate/1455638-webview))
  ///- Windows WebView2 ([Official API - ICoreWebView2_10.add_BasicAuthenticationRequested](https://learn.microsoft.com/en-us/microsoft-edge/webview2/reference/win32/icorewebview2_10?view=webview2-1.0.2849.39#add_basicauthenticationrequested))
  ///
  ///**Parameters - Officially Supported Platforms/Implementations**:
  ///- [challenge]: all platforms
  ///
  ///Use the [CygnusPlatformBrowserEvents.isMethodSupported] method to check if this method is supported at runtime.
  ///{@endtemplate}
  onReceivedHttpAuthRequest,

  ///Can be used to check if the [CygnusPlatformBrowserEvents.onReceivedHttpError] method is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusPlatformBrowserEvents.onReceivedHttpError.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView 23+ ([Official API - WebViewClient.onReceivedHttpError](https://developer.android.com/reference/android/webkit/WebViewClient#onReceivedHttpError(android.webkit.WebView,%20android.webkit.CygnusWebResourceRequest,%20android.webkit.CygnusWebResourceResponse)))
  ///- iOS WKWebView ([Official API - WKNavigationDelegate.webView](https://developer.apple.com/documentation/webkit/wknavigationdelegate/1455643-webview))
  ///- macOS WKWebView ([Official API - WKNavigationDelegate.webView](https://developer.apple.com/documentation/webkit/wknavigationdelegate/1455643-webview))
  ///- Windows WebView2 ([Official API - ICoreWebView2.add_NavigationCompleted](https://learn.microsoft.com/en-us/microsoft-edge/webview2/reference/win32/iwebview2webview?view=webview2-0.8.355#add_navigationcompleted))
  ///
  ///**Parameters - Officially Supported Platforms/Implementations**:
  ///- [request]: all platforms
  ///- [errorResponse]: all platforms
  ///
  ///Use the [CygnusPlatformBrowserEvents.isMethodSupported] method to check if this method is supported at runtime.
  ///{@endtemplate}
  onReceivedHttpError,

  ///Can be used to check if the [CygnusPlatformBrowserEvents.onReceivedIcon] method is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusPlatformBrowserEvents.onReceivedIcon.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView ([Official API - WebChromeClient.onReceivedIcon](https://developer.android.com/reference/android/webkit/WebChromeClient#onReceivedIcon(android.webkit.WebView,%20android.graphics.Bitmap)))
  ///
  ///**Parameters - Officially Supported Platforms/Implementations**:
  ///- [icon]: all platforms
  ///
  ///Use the [CygnusPlatformBrowserEvents.isMethodSupported] method to check if this method is supported at runtime.
  ///{@endtemplate}
  @Deprecated('Use onFaviconChanged instead')
  onReceivedIcon,

  ///Can be used to check if the [CygnusPlatformBrowserEvents.onReceivedLoginRequest] method is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusPlatformBrowserEvents.onReceivedLoginRequest.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView ([Official API - WebViewClient.onReceivedLoginRequest](https://developer.android.com/reference/android/webkit/WebViewClient#onReceivedLoginRequest(android.webkit.WebView,%20java.lang.String,%20java.lang.String,%20java.lang.String)))
  ///
  ///**Parameters - Officially Supported Platforms/Implementations**:
  ///- [loginRequest]: all platforms
  ///
  ///Use the [CygnusPlatformBrowserEvents.isMethodSupported] method to check if this method is supported at runtime.
  ///{@endtemplate}
  onReceivedLoginRequest,

  ///Can be used to check if the [CygnusPlatformBrowserEvents.onReceivedServerTrustAuthRequest] method is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusPlatformBrowserEvents.onReceivedServerTrustAuthRequest.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView ([Official API - WebViewClient.onReceivedSslError](https://developer.android.com/reference/android/webkit/WebViewClient#onReceivedSslError(android.webkit.WebView,%20android.webkit.SslErrorHandler,%20android.net.http.CygnusSslError)))
  ///- iOS WKWebView ([Official API - WKNavigationDelegate.webView](https://developer.apple.com/documentation/webkit/wknavigationdelegate/1455638-webview)):
  ///    - To override the certificate verification logic, you have to provide ATS (App Transport Security) exceptions in your iOS/macOS `Info.plist`. See `NSAppTransportSecurity` in the [Information Property List Key Reference](https://developer.apple.com/library/content/documentation/General/Reference/InfoPlistKeyReference/Articles/CocoaKeys.html#//apple_ref/doc/uid/TP40009251-SW1) for details.
  ///- macOS WKWebView ([Official API - WKNavigationDelegate.webView](https://developer.apple.com/documentation/webkit/wknavigationdelegate/1455638-webview)):
  ///    - To override the certificate verification logic, you have to provide ATS (App Transport Security) exceptions in your iOS/macOS `Info.plist`. See `NSAppTransportSecurity` in the [Information Property List Key Reference](https://developer.apple.com/library/content/documentation/General/Reference/InfoPlistKeyReference/Articles/CocoaKeys.html#//apple_ref/doc/uid/TP40009251-SW1) for details.
  ///- Windows WebView2 ([Official API - ICoreWebView2_14.add_ServerCertificateErrorDetected](https://learn.microsoft.com/en-us/microsoft-edge/webview2/reference/win32/icorewebview2_14?view=webview2-1.0.2792.45#add_servercertificateerrordetected))
  ///
  ///**Parameters - Officially Supported Platforms/Implementations**:
  ///- [challenge]: all platforms
  ///
  ///Use the [CygnusPlatformBrowserEvents.isMethodSupported] method to check if this method is supported at runtime.
  ///{@endtemplate}
  onReceivedServerTrustAuthRequest,

  ///Can be used to check if the [CygnusPlatformBrowserEvents.onReceivedTouchIconUrl] method is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusPlatformBrowserEvents.onReceivedTouchIconUrl.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView ([Official API - WebChromeClient.onReceivedTouchIconUrl](https://developer.android.com/reference/android/webkit/WebChromeClient#onReceivedTouchIconUrl(android.webkit.WebView,%20java.lang.String,%20boolean)))
  ///
  ///**Parameters - Officially Supported Platforms/Implementations**:
  ///- [url]: all platforms
  ///- [precomposed]: all platforms
  ///
  ///Use the [CygnusPlatformBrowserEvents.isMethodSupported] method to check if this method is supported at runtime.
  ///{@endtemplate}
  onReceivedTouchIconUrl,

  ///Can be used to check if the [CygnusPlatformBrowserEvents.onRenderProcessGone] method is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusPlatformBrowserEvents.onRenderProcessGone.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView 26+ ([Official API - WebViewClient.onRenderProcessGone](https://developer.android.com/reference/android/webkit/WebViewClient#onRenderProcessGone(android.webkit.WebView,%20android.webkit.CygnusRenderProcessGoneDetail)))
  ///- Windows WebView2 ([Official API - ICoreWebView2.add_ProcessFailed](https://learn.microsoft.com/en-us/microsoft-edge/webview2/reference/win32/icorewebview2?view=webview2-1.0.2849.39#add_processfailed))
  ///
  ///**Parameters - Officially Supported Platforms/Implementations**:
  ///- [detail]: all platforms
  ///
  ///Use the [CygnusPlatformBrowserEvents.isMethodSupported] method to check if this method is supported at runtime.
  ///{@endtemplate}
  onRenderProcessGone,

  ///Can be used to check if the [CygnusPlatformBrowserEvents.onRenderProcessResponsive] method is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusPlatformBrowserEvents.onRenderProcessResponsive.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView 29+ ([Official API - WebViewRenderProcessClient.onRenderProcessResponsive](https://developer.android.com/reference/android/webkit/WebViewRenderProcessClient#onRenderProcessResponsive(android.webkit.WebView,%20android.webkit.WebViewRenderProcess)))
  ///
  ///**Parameters - Officially Supported Platforms/Implementations**:
  ///- [url]: all platforms
  ///
  ///Use the [CygnusPlatformBrowserEvents.isMethodSupported] method to check if this method is supported at runtime.
  ///{@endtemplate}
  onRenderProcessResponsive,

  ///Can be used to check if the [CygnusPlatformBrowserEvents.onRenderProcessUnresponsive] method is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusPlatformBrowserEvents.onRenderProcessUnresponsive.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView 29+ ([Official API - WebViewRenderProcessClient.onRenderProcessUnresponsive](https://developer.android.com/reference/android/webkit/WebViewRenderProcessClient#onRenderProcessUnresponsive(android.webkit.WebView,%20android.webkit.WebViewRenderProcess)))
  ///- Windows WebView2 ([Official API - ICoreWebView2.add_ProcessFailed](https://learn.microsoft.com/en-us/microsoft-edge/webview2/reference/win32/icorewebview2?view=webview2-1.0.2849.39#add_processfailed))
  ///
  ///**Parameters - Officially Supported Platforms/Implementations**:
  ///- [url]: all platforms
  ///
  ///Use the [CygnusPlatformBrowserEvents.isMethodSupported] method to check if this method is supported at runtime.
  ///{@endtemplate}
  onRenderProcessUnresponsive,

  ///Can be used to check if the [CygnusPlatformBrowserEvents.onRequestFocus] method is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusPlatformBrowserEvents.onRequestFocus.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView ([Official API - WebChromeClient.onRequestFocus](https://developer.android.com/reference/android/webkit/WebChromeClient#onRequestFocus(android.webkit.WebView)))
  ///
  ///Use the [CygnusPlatformBrowserEvents.isMethodSupported] method to check if this method is supported at runtime.
  ///{@endtemplate}
  onRequestFocus,

  ///Can be used to check if the [CygnusPlatformBrowserEvents.onSafeBrowsingHit] method is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusPlatformBrowserEvents.onSafeBrowsingHit.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView 27+ ([Official API - WebViewClient.onSafeBrowsingHit](https://developer.android.com/reference/android/webkit/WebViewClient#onSafeBrowsingHit(android.webkit.WebView,%20android.webkit.CygnusWebResourceRequest,%20int,%20android.webkit.CygnusSafeBrowsingResponse)))
  ///
  ///**Parameters - Officially Supported Platforms/Implementations**:
  ///- [url]: all platforms
  ///- [threatType]: all platforms
  ///
  ///Use the [CygnusPlatformBrowserEvents.isMethodSupported] method to check if this method is supported at runtime.
  ///{@endtemplate}
  onSafeBrowsingHit,

  ///Can be used to check if the [CygnusPlatformBrowserEvents.onSaveAsUIShowing] method is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusPlatformBrowserEvents.onSaveAsUIShowing.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Windows WebView2 ([Official API - ICoreWebView2_25.add_SaveAsUIShowing](https://learn.microsoft.com/en-us/microsoft-edge/webview2/reference/win32/icorewebview2_25?view=webview2-1.0.2849.39#add_saveasuishowing))
  ///
  ///**Parameters - Officially Supported Platforms/Implementations**:
  ///- [request]: all platforms
  ///
  ///Use the [CygnusPlatformBrowserEvents.isMethodSupported] method to check if this method is supported at runtime.
  ///{@endtemplate}
  onSaveAsUIShowing,

  ///Can be used to check if the [CygnusPlatformBrowserEvents.onSaveFileSecurityCheckStarting] method is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusPlatformBrowserEvents.onSaveFileSecurityCheckStarting.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Windows WebView2 ([Official API - ICoreWebView2_26.add_SaveFileSecurityCheckStarting](https://learn.microsoft.com/en-us/microsoft-edge/webview2/reference/win32/icorewebview2_26?view=webview2-1.0.2849.39#add_savefilesecuritycheckstarting))
  ///
  ///**Parameters - Officially Supported Platforms/Implementations**:
  ///- [request]: all platforms
  ///
  ///Use the [CygnusPlatformBrowserEvents.isMethodSupported] method to check if this method is supported at runtime.
  ///{@endtemplate}
  onSaveFileSecurityCheckStarting,

  ///Can be used to check if the [CygnusPlatformBrowserEvents.onScreenCaptureStarting] method is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusPlatformBrowserEvents.onScreenCaptureStarting.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Windows WebView2 ([Official API - ICoreWebView2_27.add_ScreenCaptureStarting](https://learn.microsoft.com/en-us/microsoft-edge/webview2/reference/win32/icorewebview2_27?view=webview2-1.0.2849.39#add_screencapturestarting))
  ///
  ///**Parameters - Officially Supported Platforms/Implementations**:
  ///- [request]: all platforms
  ///
  ///Use the [CygnusPlatformBrowserEvents.isMethodSupported] method to check if this method is supported at runtime.
  ///{@endtemplate}
  onScreenCaptureStarting,

  ///Can be used to check if the [CygnusPlatformBrowserEvents.onScrollChanged] method is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusPlatformBrowserEvents.onScrollChanged.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView ([Official API - WebView.onScrollChanged](https://developer.android.com/reference/android/webkit/WebView#onScrollChanged(int,%20int,%20int,%20int)))
  ///- iOS WKWebView ([Official API - UIScrollViewDelegate.scrollViewDidScroll](https://developer.apple.com/documentation/uikit/uiscrollviewdelegate/1619392-scrollviewdidscroll))
  ///- macOS WKWebView:
  ///    - This event is implemented using JavaScript.
  ///
  ///**Parameters - Officially Supported Platforms/Implementations**:
  ///- [x]: all platforms
  ///- [y]: all platforms
  ///
  ///Use the [CygnusPlatformBrowserEvents.isMethodSupported] method to check if this method is supported at runtime.
  ///{@endtemplate}
  onScrollChanged,

  ///Can be used to check if the [CygnusPlatformBrowserEvents.onShowFileChooser] method is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusPlatformBrowserEvents.onShowFileChooser.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView ([Official API - WebChromeClient.onShowFileChooser](https://developer.android.com/reference/android/webkit/WebChromeClient#onShowFileChooser(android.webkit.WebView,%20android.webkit.ValueCallback%3Candroid.net.Uri[]%3E,%20android.webkit.WebChromeClient.FileChooserParams)))
  ///
  ///**Parameters - Officially Supported Platforms/Implementations**:
  ///- [request]: all platforms
  ///
  ///Use the [CygnusPlatformBrowserEvents.isMethodSupported] method to check if this method is supported at runtime.
  ///{@endtemplate}
  onShowFileChooser,

  ///Can be used to check if the [CygnusPlatformBrowserEvents.onTitleChanged] method is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusPlatformBrowserEvents.onTitleChanged.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView ([Official API - WebChromeClient.onReceivedTitle](https://developer.android.com/reference/android/webkit/WebChromeClient#onReceivedTitle(android.webkit.WebView,%20java.lang.String)))
  ///- iOS WKWebView
  ///- macOS WKWebView
  ///- Windows WebView2 ([Official API - ICoreWebView2.add_DocumentTitleChanged](https://learn.microsoft.com/en-us/microsoft-edge/webview2/reference/win32/icorewebview2?view=webview2-1.0.2210.55#add_documenttitlechanged))
  ///
  ///**Parameters - Officially Supported Platforms/Implementations**:
  ///- [title]: all platforms
  ///
  ///Use the [CygnusPlatformBrowserEvents.isMethodSupported] method to check if this method is supported at runtime.
  ///{@endtemplate}
  onTitleChanged,

  ///Can be used to check if the [CygnusPlatformBrowserEvents.onUpdateVisitedHistory] method is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusPlatformBrowserEvents.onUpdateVisitedHistory.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView ([Official API - WebViewClient.doUpdateVisitedHistory](https://developer.android.com/reference/android/webkit/WebViewClient#doUpdateVisitedHistory(android.webkit.WebView,%20java.lang.String,%20boolean)))
  ///- iOS WKWebView
  ///- macOS WKWebView
  ///- Windows WebView2 ([Official API - ICoreWebView2.add_HistoryChanged](https://learn.microsoft.com/en-us/microsoft-edge/webview2/reference/win32/icorewebview2?view=webview2-1.0.2210.55#add_historychanged))
  ///
  ///**Parameters - Officially Supported Platforms/Implementations**:
  ///- [url]: all platforms
  ///- [isReload]:
  ///    - Android WebView
  ///
  ///Use the [CygnusPlatformBrowserEvents.isMethodSupported] method to check if this method is supported at runtime.
  ///{@endtemplate}
  onUpdateVisitedHistory,

  ///Can be used to check if the [CygnusPlatformBrowserEvents.onWebContentProcessDidTerminate] method is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusPlatformBrowserEvents.onWebContentProcessDidTerminate.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- iOS WKWebView ([Official API - WKNavigationDelegate.webViewWebContentProcessDidTerminate](https://developer.apple.com/documentation/webkit/wknavigationdelegate/1455639-webviewwebcontentprocessdidtermi))
  ///- macOS WKWebView ([Official API - WKNavigationDelegate.webViewWebContentProcessDidTerminate](https://developer.apple.com/documentation/webkit/wknavigationdelegate/1455639-webviewwebcontentprocessdidtermi))
  ///- Windows WebView2 ([Official API - ICoreWebView2.add_ProcessFailed](https://learn.microsoft.com/en-us/microsoft-edge/webview2/reference/win32/icorewebview2?view=webview2-1.0.2849.39#add_processfailed))
  ///
  ///Use the [CygnusPlatformBrowserEvents.isMethodSupported] method to check if this method is supported at runtime.
  ///{@endtemplate}
  onWebContentProcessDidTerminate,

  ///Can be used to check if the [CygnusPlatformBrowserEvents.onWindowBlur] method is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusPlatformBrowserEvents.onWindowBlur.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView
  ///- iOS WKWebView
  ///- macOS WKWebView
  ///
  ///Use the [CygnusPlatformBrowserEvents.isMethodSupported] method to check if this method is supported at runtime.
  ///{@endtemplate}
  onWindowBlur,

  ///Can be used to check if the [CygnusPlatformBrowserEvents.onWindowFocus] method is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusPlatformBrowserEvents.onWindowFocus.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView
  ///- iOS WKWebView
  ///- macOS WKWebView
  ///
  ///Use the [CygnusPlatformBrowserEvents.isMethodSupported] method to check if this method is supported at runtime.
  ///{@endtemplate}
  onWindowFocus,

  ///Can be used to check if the [CygnusPlatformBrowserEvents.onZoomScaleChanged] method is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusPlatformBrowserEvents.onZoomScaleChanged.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView ([Official API - WebViewClient.onScaleChanged](https://developer.android.com/reference/android/webkit/WebViewClient#onScaleChanged(android.webkit.WebView,%20float,%20float)))
  ///- iOS WKWebView ([Official API - UIScrollViewDelegate.scrollViewDidZoom](https://developer.apple.com/documentation/uikit/uiscrollviewdelegate/1619409-scrollviewdidzoom))
  ///- Windows WebView2 ([Official API - ICoreWebView2Controller.add_ZoomFactorChanged](https://learn.microsoft.com/en-us/microsoft-edge/webview2/reference/win32/icorewebview2controller?view=webview2-1.0.2849.39#add_zoomfactorchanged))
  ///
  ///**Parameters - Officially Supported Platforms/Implementations**:
  ///- [oldScale]: all platforms
  ///- [newScale]: all platforms
  ///
  ///Use the [CygnusPlatformBrowserEvents.isMethodSupported] method to check if this method is supported at runtime.
  ///{@endtemplate}
  onZoomScaleChanged,

  ///Can be used to check if the [CygnusPlatformBrowserEvents.shouldAllowDeprecatedTLS] method is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusPlatformBrowserEvents.shouldAllowDeprecatedTLS.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- iOS WKWebView 14.0+ ([Official API - WKNavigationDelegate.webView](https://developer.apple.com/documentation/webkit/wknavigationdelegate/3601237-webview))
  ///- macOS WKWebView 11.0+ ([Official API - WKNavigationDelegate.webView](https://developer.apple.com/documentation/webkit/wknavigationdelegate/3601237-webview))
  ///
  ///**Parameters - Officially Supported Platforms/Implementations**:
  ///- [challenge]: all platforms
  ///
  ///Use the [CygnusPlatformBrowserEvents.isMethodSupported] method to check if this method is supported at runtime.
  ///{@endtemplate}
  shouldAllowDeprecatedTLS,

  ///Can be used to check if the [CygnusPlatformBrowserEvents.shouldInterceptAjaxRequest] method is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusPlatformBrowserEvents.shouldInterceptAjaxRequest.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView:
  ///    - In order to be able to listen this event, check the [CygnusWebViewSettings.useShouldInterceptAjaxRequest] setting documentation. Also, on Android that doesn't support the [CygnusWebViewFeature.DOCUMENT_START_SCRIPT], unlike iOS that has [WKUserScript](https://developer.apple.com/documentation/webkit/wkuserscript) that can inject javascript code right after the document element is created but before any other content is loaded, in Android the javascript code used to intercept ajax requests is loaded as soon as possible so it won't be instantaneous as iOS. In that case, after the `window.addEventListener("flutterInAppWebViewPlatformReady")` event is dispatched, the ajax requests can be intercept for sure.
  ///- iOS WKWebView
  ///- macOS WKWebView
  ///
  ///**Parameters - Officially Supported Platforms/Implementations**:
  ///- [ajaxRequest]: all platforms
  ///
  ///Use the [CygnusPlatformBrowserEvents.isMethodSupported] method to check if this method is supported at runtime.
  ///{@endtemplate}
  shouldInterceptAjaxRequest,

  ///Can be used to check if the [CygnusPlatformBrowserEvents.shouldInterceptFetchRequest] method is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusPlatformBrowserEvents.shouldInterceptFetchRequest.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView:
  ///    - In order to be able to listen this event, check the [CygnusWebViewSettings.useShouldInterceptFetchRequest] setting documentation. Also, on Android that doesn't support the [CygnusWebViewFeature.DOCUMENT_START_SCRIPT], unlike iOS that has [WKUserScript](https://developer.apple.com/documentation/webkit/wkuserscript) that can inject javascript code right after the document element is created but before any other content is loaded, in Android the javascript code used to intercept ajax requests is loaded as soon as possible so it won't be instantaneous as iOS. In that case, after the `window.addEventListener("flutterInAppWebViewPlatformReady")` event is dispatched, the ajax requests can be intercept for sure.
  ///- iOS WKWebView
  ///- macOS WKWebView
  ///
  ///**Parameters - Officially Supported Platforms/Implementations**:
  ///- [fetchRequest]: all platforms
  ///
  ///Use the [CygnusPlatformBrowserEvents.isMethodSupported] method to check if this method is supported at runtime.
  ///{@endtemplate}
  shouldInterceptFetchRequest,

  ///Can be used to check if the [CygnusPlatformBrowserEvents.shouldInterceptRequest] method is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusPlatformBrowserEvents.shouldInterceptRequest.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView ([Official API - WebViewClient.shouldInterceptRequest](https://developer.android.com/reference/android/webkit/WebViewClient#shouldInterceptRequest(android.webkit.WebView,%20android.webkit.CygnusWebResourceRequest)))
  ///- Windows WebView2 ([Official API - ICoreWebView2.add_WebResourceRequested](https://learn.microsoft.com/en-us/microsoft-edge/webview2/reference/win32/icorewebview2?view=webview2-1.0.2478.35#add_webresourcerequested))
  ///
  ///**Parameters - Officially Supported Platforms/Implementations**:
  ///- [request]: all platforms
  ///
  ///Use the [CygnusPlatformBrowserEvents.isMethodSupported] method to check if this method is supported at runtime.
  ///{@endtemplate}
  shouldInterceptRequest,

  ///Can be used to check if the [CygnusPlatformBrowserEvents.shouldOverrideUrlLoading] method is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusPlatformBrowserEvents.shouldOverrideUrlLoading.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView ([Official API - WebViewClient.shouldOverrideUrlLoading](https://developer.android.com/reference/android/webkit/WebViewClient#shouldOverrideUrlLoading(android.webkit.WebView,%20java.lang.String))):
  ///    - There isn't any way to load an URL for a frame that is not the main frame, so if the request is not for the main frame, the navigation is allowed by default. However, if you want to cancel requests for subframes, you can use the [CygnusWebViewSettings.regexToCancelSubFramesLoading] setting to write a Regular Expression that, if the url request of a subframe matches, then the request of that subframe is canceled. Instead, the [CygnusWebViewSettings.regexToAllowSyncUrlLoading] setting could be used to allow navigation requests synchronously, as this event is synchronous on native side and the current plugin implementation will always cancel the current request and load a new request if this event returns [CygnusNavigationActionPolicy.ALLOW] because Flutter method channels work only asynchronously. Also, this event is not called for POST requests and is not called on the first page load.
  ///- iOS WKWebView ([Official API - WKNavigationDelegate.webView](https://developer.apple.com/documentation/webkit/wknavigationdelegate/1455641-webview))
  ///- macOS WKWebView ([Official API - WKNavigationDelegate.webView](https://developer.apple.com/documentation/webkit/wknavigationdelegate/1455641-webview))
  ///- Windows WebView2
  ///
  ///**Parameters - Officially Supported Platforms/Implementations**:
  ///- [navigationAction]: all platforms
  ///
  ///Use the [CygnusPlatformBrowserEvents.isMethodSupported] method to check if this method is supported at runtime.
  ///{@endtemplate}
  shouldOverrideUrlLoading,
}

extension _CygnusPlatformBrowserEventsMethodSupported
    on CygnusPlatformBrowserEvents {
  static bool isMethodSupported(
    CygnusPlatformBrowserEventsMethod method, {
    TargetPlatform? platform,
  }) {
    switch (method) {
      case CygnusPlatformBrowserEventsMethod.androidOnFormResubmission:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [
              TargetPlatform.android,
            ].contains(platform ?? defaultTargetPlatform);
      case CygnusPlatformBrowserEventsMethod
          .androidOnGeolocationPermissionsHidePrompt:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [
              TargetPlatform.android,
            ].contains(platform ?? defaultTargetPlatform);
      case CygnusPlatformBrowserEventsMethod
          .androidOnGeolocationPermissionsShowPrompt:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [
              TargetPlatform.android,
            ].contains(platform ?? defaultTargetPlatform);
      case CygnusPlatformBrowserEventsMethod.androidOnJsBeforeUnload:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [
              TargetPlatform.android,
            ].contains(platform ?? defaultTargetPlatform);
      case CygnusPlatformBrowserEventsMethod.androidOnPermissionRequest:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [
              TargetPlatform.android,
            ].contains(platform ?? defaultTargetPlatform);
      case CygnusPlatformBrowserEventsMethod.androidOnReceivedIcon:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [
              TargetPlatform.android,
            ].contains(platform ?? defaultTargetPlatform);
      case CygnusPlatformBrowserEventsMethod.androidOnReceivedLoginRequest:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [
              TargetPlatform.android,
            ].contains(platform ?? defaultTargetPlatform);
      case CygnusPlatformBrowserEventsMethod.androidOnReceivedTouchIconUrl:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [
              TargetPlatform.android,
            ].contains(platform ?? defaultTargetPlatform);
      case CygnusPlatformBrowserEventsMethod.androidOnRenderProcessGone:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [
              TargetPlatform.android,
            ].contains(platform ?? defaultTargetPlatform);
      case CygnusPlatformBrowserEventsMethod.androidOnRenderProcessResponsive:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [
              TargetPlatform.android,
            ].contains(platform ?? defaultTargetPlatform);
      case CygnusPlatformBrowserEventsMethod.androidOnRenderProcessUnresponsive:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [
              TargetPlatform.android,
            ].contains(platform ?? defaultTargetPlatform);
      case CygnusPlatformBrowserEventsMethod.androidOnSafeBrowsingHit:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [
              TargetPlatform.android,
            ].contains(platform ?? defaultTargetPlatform);
      case CygnusPlatformBrowserEventsMethod.androidOnScaleChanged:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [
              TargetPlatform.android,
            ].contains(platform ?? defaultTargetPlatform);
      case CygnusPlatformBrowserEventsMethod.androidShouldInterceptRequest:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [
              TargetPlatform.android,
            ].contains(platform ?? defaultTargetPlatform);
      case CygnusPlatformBrowserEventsMethod
          .iosOnDidReceiveServerRedirectForProvisionalNavigation:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [TargetPlatform.iOS].contains(platform ?? defaultTargetPlatform);
      case CygnusPlatformBrowserEventsMethod.iosOnNavigationResponse:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [TargetPlatform.iOS].contains(platform ?? defaultTargetPlatform);
      case CygnusPlatformBrowserEventsMethod.iosOnWebContentProcessDidTerminate:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [TargetPlatform.iOS].contains(platform ?? defaultTargetPlatform);
      case CygnusPlatformBrowserEventsMethod.iosShouldAllowDeprecatedTLS:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [TargetPlatform.iOS].contains(platform ?? defaultTargetPlatform);
      case CygnusPlatformBrowserEventsMethod.onAcceleratorKeyPressed:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [
              TargetPlatform.windows,
            ].contains(platform ?? defaultTargetPlatform);
      case CygnusPlatformBrowserEventsMethod.onAjaxProgress:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [
              TargetPlatform.android,
              TargetPlatform.iOS,
              TargetPlatform.macOS,
            ].contains(platform ?? defaultTargetPlatform);
      case CygnusPlatformBrowserEventsMethod.onAjaxReadyStateChange:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [
              TargetPlatform.android,
              TargetPlatform.iOS,
              TargetPlatform.macOS,
            ].contains(platform ?? defaultTargetPlatform);
      case CygnusPlatformBrowserEventsMethod.onBrowserCreated:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [
              TargetPlatform.android,
              TargetPlatform.iOS,
              TargetPlatform.macOS,
              TargetPlatform.windows,
              TargetPlatform.linux,
            ].contains(platform ?? defaultTargetPlatform);
      case CygnusPlatformBrowserEventsMethod.onCameraCaptureStateChanged:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [
              TargetPlatform.iOS,
              TargetPlatform.macOS,
            ].contains(platform ?? defaultTargetPlatform);
      case CygnusPlatformBrowserEventsMethod.onCloseWindow:
        return kIsWeb && platform == null
            ? true
            : ((kIsWeb && platform != null) || !kIsWeb) &&
                  [
                    TargetPlatform.android,
                    TargetPlatform.iOS,
                    TargetPlatform.macOS,
                    TargetPlatform.windows,
                  ].contains(platform ?? defaultTargetPlatform);
      case CygnusPlatformBrowserEventsMethod.onConsoleMessage:
        return kIsWeb && platform == null
            ? true
            : ((kIsWeb && platform != null) || !kIsWeb) &&
                  [
                    TargetPlatform.android,
                    TargetPlatform.iOS,
                    TargetPlatform.macOS,
                    TargetPlatform.windows,
                  ].contains(platform ?? defaultTargetPlatform);
      case CygnusPlatformBrowserEventsMethod.onContentLoading:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [
              TargetPlatform.windows,
            ].contains(platform ?? defaultTargetPlatform);
      case CygnusPlatformBrowserEventsMethod.onContentSizeChanged:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [TargetPlatform.iOS].contains(platform ?? defaultTargetPlatform);
      case CygnusPlatformBrowserEventsMethod.onCreateWindow:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [
              TargetPlatform.android,
              TargetPlatform.iOS,
              TargetPlatform.macOS,
              TargetPlatform.windows,
            ].contains(platform ?? defaultTargetPlatform);
      case CygnusPlatformBrowserEventsMethod.onDOMContentLoaded:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [
              TargetPlatform.windows,
            ].contains(platform ?? defaultTargetPlatform);
      case CygnusPlatformBrowserEventsMethod
          .onDidReceiveServerRedirectForProvisionalNavigation:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [
              TargetPlatform.iOS,
              TargetPlatform.macOS,
            ].contains(platform ?? defaultTargetPlatform);
      case CygnusPlatformBrowserEventsMethod.onDownloadStart:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [
              TargetPlatform.android,
              TargetPlatform.iOS,
            ].contains(platform ?? defaultTargetPlatform);
      case CygnusPlatformBrowserEventsMethod.onDownloadStartRequest:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [
              TargetPlatform.android,
              TargetPlatform.iOS,
              TargetPlatform.macOS,
            ].contains(platform ?? defaultTargetPlatform);
      case CygnusPlatformBrowserEventsMethod.onDownloadStarting:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [
              TargetPlatform.android,
              TargetPlatform.iOS,
              TargetPlatform.macOS,
              TargetPlatform.windows,
            ].contains(platform ?? defaultTargetPlatform);
      case CygnusPlatformBrowserEventsMethod.onEnterFullscreen:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [
              TargetPlatform.android,
              TargetPlatform.iOS,
              TargetPlatform.macOS,
              TargetPlatform.windows,
            ].contains(platform ?? defaultTargetPlatform);
      case CygnusPlatformBrowserEventsMethod.onExit:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [
              TargetPlatform.android,
              TargetPlatform.iOS,
              TargetPlatform.macOS,
              TargetPlatform.windows,
              TargetPlatform.linux,
            ].contains(platform ?? defaultTargetPlatform);
      case CygnusPlatformBrowserEventsMethod.onExitFullscreen:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [
              TargetPlatform.android,
              TargetPlatform.iOS,
              TargetPlatform.macOS,
              TargetPlatform.windows,
            ].contains(platform ?? defaultTargetPlatform);
      case CygnusPlatformBrowserEventsMethod.onFaviconChanged:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [
              TargetPlatform.android,
              TargetPlatform.windows,
            ].contains(platform ?? defaultTargetPlatform);
      case CygnusPlatformBrowserEventsMethod.onFindResultReceived:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [
              TargetPlatform.android,
              TargetPlatform.iOS,
              TargetPlatform.macOS,
            ].contains(platform ?? defaultTargetPlatform);
      case CygnusPlatformBrowserEventsMethod.onFormResubmission:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [
              TargetPlatform.android,
            ].contains(platform ?? defaultTargetPlatform);
      case CygnusPlatformBrowserEventsMethod.onGeolocationPermissionsHidePrompt:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [
              TargetPlatform.android,
            ].contains(platform ?? defaultTargetPlatform);
      case CygnusPlatformBrowserEventsMethod.onGeolocationPermissionsShowPrompt:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [
              TargetPlatform.android,
            ].contains(platform ?? defaultTargetPlatform);
      case CygnusPlatformBrowserEventsMethod.onJsAlert:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [
              TargetPlatform.android,
              TargetPlatform.iOS,
              TargetPlatform.macOS,
            ].contains(platform ?? defaultTargetPlatform);
      case CygnusPlatformBrowserEventsMethod.onJsConfirm:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [
              TargetPlatform.android,
              TargetPlatform.iOS,
              TargetPlatform.macOS,
            ].contains(platform ?? defaultTargetPlatform);
      case CygnusPlatformBrowserEventsMethod.onJsPrompt:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [
              TargetPlatform.android,
              TargetPlatform.iOS,
              TargetPlatform.macOS,
            ].contains(platform ?? defaultTargetPlatform);
      case CygnusPlatformBrowserEventsMethod.onLaunchingExternalUriScheme:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [
              TargetPlatform.windows,
            ].contains(platform ?? defaultTargetPlatform);
      case CygnusPlatformBrowserEventsMethod.onLoadError:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [
              TargetPlatform.android,
              TargetPlatform.iOS,
              TargetPlatform.macOS,
            ].contains(platform ?? defaultTargetPlatform);
      case CygnusPlatformBrowserEventsMethod.onLoadHttpError:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [
              TargetPlatform.android,
              TargetPlatform.iOS,
              TargetPlatform.macOS,
            ].contains(platform ?? defaultTargetPlatform);
      case CygnusPlatformBrowserEventsMethod.onLoadResource:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [
              TargetPlatform.android,
              TargetPlatform.iOS,
              TargetPlatform.macOS,
            ].contains(platform ?? defaultTargetPlatform);
      case CygnusPlatformBrowserEventsMethod.onLoadResourceCustomScheme:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [
              TargetPlatform.android,
              TargetPlatform.iOS,
              TargetPlatform.macOS,
            ].contains(platform ?? defaultTargetPlatform);
      case CygnusPlatformBrowserEventsMethod.onLoadResourceWithCustomScheme:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [
              TargetPlatform.android,
              TargetPlatform.iOS,
              TargetPlatform.macOS,
              TargetPlatform.windows,
            ].contains(platform ?? defaultTargetPlatform);
      case CygnusPlatformBrowserEventsMethod.onLoadStart:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [
              TargetPlatform.android,
              TargetPlatform.iOS,
              TargetPlatform.macOS,
              TargetPlatform.windows,
            ].contains(platform ?? defaultTargetPlatform);
      case CygnusPlatformBrowserEventsMethod.onLoadStop:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [
              TargetPlatform.android,
              TargetPlatform.iOS,
              TargetPlatform.macOS,
              TargetPlatform.windows,
            ].contains(platform ?? defaultTargetPlatform);
      case CygnusPlatformBrowserEventsMethod.onLongPressHitTestResult:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [
              TargetPlatform.android,
              TargetPlatform.iOS,
            ].contains(platform ?? defaultTargetPlatform);
      case CygnusPlatformBrowserEventsMethod.onMainWindowWillClose:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [TargetPlatform.macOS].contains(platform ?? defaultTargetPlatform);
      case CygnusPlatformBrowserEventsMethod.onMicrophoneCaptureStateChanged:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [
              TargetPlatform.iOS,
              TargetPlatform.macOS,
            ].contains(platform ?? defaultTargetPlatform);
      case CygnusPlatformBrowserEventsMethod.onNavigationResponse:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [
              TargetPlatform.iOS,
              TargetPlatform.macOS,
            ].contains(platform ?? defaultTargetPlatform);
      case CygnusPlatformBrowserEventsMethod.onNotificationReceived:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [
              TargetPlatform.windows,
            ].contains(platform ?? defaultTargetPlatform);
      case CygnusPlatformBrowserEventsMethod.onOverScrolled:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [
              TargetPlatform.android,
              TargetPlatform.iOS,
            ].contains(platform ?? defaultTargetPlatform);
      case CygnusPlatformBrowserEventsMethod.onPageCommitVisible:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [
              TargetPlatform.android,
              TargetPlatform.iOS,
              TargetPlatform.macOS,
            ].contains(platform ?? defaultTargetPlatform);
      case CygnusPlatformBrowserEventsMethod.onPermissionRequest:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [
              TargetPlatform.android,
              TargetPlatform.iOS,
              TargetPlatform.macOS,
              TargetPlatform.windows,
            ].contains(platform ?? defaultTargetPlatform);
      case CygnusPlatformBrowserEventsMethod.onPermissionRequestCanceled:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [
              TargetPlatform.android,
            ].contains(platform ?? defaultTargetPlatform);
      case CygnusPlatformBrowserEventsMethod.onPrint:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [
              TargetPlatform.android,
              TargetPlatform.iOS,
            ].contains(platform ?? defaultTargetPlatform);
      case CygnusPlatformBrowserEventsMethod.onPrintRequest:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [
              TargetPlatform.android,
              TargetPlatform.iOS,
              TargetPlatform.macOS,
            ].contains(platform ?? defaultTargetPlatform);
      case CygnusPlatformBrowserEventsMethod.onProcessFailed:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [
              TargetPlatform.windows,
            ].contains(platform ?? defaultTargetPlatform);
      case CygnusPlatformBrowserEventsMethod.onProgressChanged:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [
              TargetPlatform.android,
              TargetPlatform.iOS,
              TargetPlatform.macOS,
              TargetPlatform.windows,
            ].contains(platform ?? defaultTargetPlatform);
      case CygnusPlatformBrowserEventsMethod.onReceivedClientCertRequest:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [
              TargetPlatform.android,
              TargetPlatform.iOS,
              TargetPlatform.macOS,
              TargetPlatform.windows,
            ].contains(platform ?? defaultTargetPlatform);
      case CygnusPlatformBrowserEventsMethod.onReceivedError:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [
              TargetPlatform.android,
              TargetPlatform.iOS,
              TargetPlatform.macOS,
              TargetPlatform.windows,
            ].contains(platform ?? defaultTargetPlatform);
      case CygnusPlatformBrowserEventsMethod.onReceivedHttpAuthRequest:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [
              TargetPlatform.android,
              TargetPlatform.iOS,
              TargetPlatform.macOS,
              TargetPlatform.windows,
            ].contains(platform ?? defaultTargetPlatform);
      case CygnusPlatformBrowserEventsMethod.onReceivedHttpError:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [
              TargetPlatform.android,
              TargetPlatform.iOS,
              TargetPlatform.macOS,
              TargetPlatform.windows,
            ].contains(platform ?? defaultTargetPlatform);
      case CygnusPlatformBrowserEventsMethod.onReceivedIcon:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [
              TargetPlatform.android,
            ].contains(platform ?? defaultTargetPlatform);
      case CygnusPlatformBrowserEventsMethod.onReceivedLoginRequest:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [
              TargetPlatform.android,
            ].contains(platform ?? defaultTargetPlatform);
      case CygnusPlatformBrowserEventsMethod.onReceivedServerTrustAuthRequest:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [
              TargetPlatform.android,
              TargetPlatform.iOS,
              TargetPlatform.macOS,
              TargetPlatform.windows,
            ].contains(platform ?? defaultTargetPlatform);
      case CygnusPlatformBrowserEventsMethod.onReceivedTouchIconUrl:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [
              TargetPlatform.android,
            ].contains(platform ?? defaultTargetPlatform);
      case CygnusPlatformBrowserEventsMethod.onRenderProcessGone:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [
              TargetPlatform.android,
              TargetPlatform.windows,
            ].contains(platform ?? defaultTargetPlatform);
      case CygnusPlatformBrowserEventsMethod.onRenderProcessResponsive:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [
              TargetPlatform.android,
            ].contains(platform ?? defaultTargetPlatform);
      case CygnusPlatformBrowserEventsMethod.onRenderProcessUnresponsive:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [
              TargetPlatform.android,
              TargetPlatform.windows,
            ].contains(platform ?? defaultTargetPlatform);
      case CygnusPlatformBrowserEventsMethod.onRequestFocus:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [
              TargetPlatform.android,
            ].contains(platform ?? defaultTargetPlatform);
      case CygnusPlatformBrowserEventsMethod.onSafeBrowsingHit:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [
              TargetPlatform.android,
            ].contains(platform ?? defaultTargetPlatform);
      case CygnusPlatformBrowserEventsMethod.onSaveAsUIShowing:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [
              TargetPlatform.windows,
            ].contains(platform ?? defaultTargetPlatform);
      case CygnusPlatformBrowserEventsMethod.onSaveFileSecurityCheckStarting:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [
              TargetPlatform.windows,
            ].contains(platform ?? defaultTargetPlatform);
      case CygnusPlatformBrowserEventsMethod.onScreenCaptureStarting:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [
              TargetPlatform.windows,
            ].contains(platform ?? defaultTargetPlatform);
      case CygnusPlatformBrowserEventsMethod.onScrollChanged:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [
              TargetPlatform.android,
              TargetPlatform.iOS,
              TargetPlatform.macOS,
            ].contains(platform ?? defaultTargetPlatform);
      case CygnusPlatformBrowserEventsMethod.onShowFileChooser:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [
              TargetPlatform.android,
            ].contains(platform ?? defaultTargetPlatform);
      case CygnusPlatformBrowserEventsMethod.onTitleChanged:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [
              TargetPlatform.android,
              TargetPlatform.iOS,
              TargetPlatform.macOS,
              TargetPlatform.windows,
            ].contains(platform ?? defaultTargetPlatform);
      case CygnusPlatformBrowserEventsMethod.onUpdateVisitedHistory:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [
              TargetPlatform.android,
              TargetPlatform.iOS,
              TargetPlatform.macOS,
              TargetPlatform.windows,
            ].contains(platform ?? defaultTargetPlatform);
      case CygnusPlatformBrowserEventsMethod.onWebContentProcessDidTerminate:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [
              TargetPlatform.iOS,
              TargetPlatform.macOS,
              TargetPlatform.windows,
            ].contains(platform ?? defaultTargetPlatform);
      case CygnusPlatformBrowserEventsMethod.onWindowBlur:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [
              TargetPlatform.android,
              TargetPlatform.iOS,
              TargetPlatform.macOS,
            ].contains(platform ?? defaultTargetPlatform);
      case CygnusPlatformBrowserEventsMethod.onWindowFocus:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [
              TargetPlatform.android,
              TargetPlatform.iOS,
              TargetPlatform.macOS,
            ].contains(platform ?? defaultTargetPlatform);
      case CygnusPlatformBrowserEventsMethod.onZoomScaleChanged:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [
              TargetPlatform.android,
              TargetPlatform.iOS,
              TargetPlatform.windows,
            ].contains(platform ?? defaultTargetPlatform);
      case CygnusPlatformBrowserEventsMethod.shouldAllowDeprecatedTLS:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [
              TargetPlatform.iOS,
              TargetPlatform.macOS,
            ].contains(platform ?? defaultTargetPlatform);
      case CygnusPlatformBrowserEventsMethod.shouldInterceptAjaxRequest:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [
              TargetPlatform.android,
              TargetPlatform.iOS,
              TargetPlatform.macOS,
            ].contains(platform ?? defaultTargetPlatform);
      case CygnusPlatformBrowserEventsMethod.shouldInterceptFetchRequest:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [
              TargetPlatform.android,
              TargetPlatform.iOS,
              TargetPlatform.macOS,
            ].contains(platform ?? defaultTargetPlatform);
      case CygnusPlatformBrowserEventsMethod.shouldInterceptRequest:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [
              TargetPlatform.android,
              TargetPlatform.windows,
            ].contains(platform ?? defaultTargetPlatform);
      case CygnusPlatformBrowserEventsMethod.shouldOverrideUrlLoading:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [
              TargetPlatform.android,
              TargetPlatform.iOS,
              TargetPlatform.macOS,
              TargetPlatform.windows,
            ].contains(platform ?? defaultTargetPlatform);
    }
  }
}
