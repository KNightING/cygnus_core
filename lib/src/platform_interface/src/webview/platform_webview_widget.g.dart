// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'platform_webview_widget.dart';

// **************************************************************************
// SupportedPlatformsGenerator
// **************************************************************************

extension _CygnusPlatformWebViewWidgetCreationParamsClassSupported
    on CygnusPlatformWebViewWidgetCreationParams {
  ///{@template cygnus_core.CygnusPlatformWebViewWidgetCreationParams.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView
  ///- iOS WKWebView
  ///- macOS WKWebView
  ///- Web \<iframe\>
  ///- Windows WebView2
  ///- Linux WPE WebKit
  ///
  ///Use the [CygnusPlatformWebViewWidgetCreationParams.isClassSupported] method to check if this class is supported at runtime.
  ///{@endtemplate}
  static bool isClassSupported({TargetPlatform? platform}) {
    return kIsWeb && platform == null
        ? true
        : ((kIsWeb && platform != null) || !kIsWeb) &&
              [
                TargetPlatform.android,
                TargetPlatform.iOS,
                TargetPlatform.macOS,
                TargetPlatform.windows,
                TargetPlatform.linux,
              ].contains(platform ?? defaultTargetPlatform);
  }
}

///List of [CygnusPlatformWebViewWidgetCreationParams]'s properties that can be used to check i they are supported or not by the current platform.
enum CygnusPlatformWebViewWidgetCreationParamsProperty {
  ///Can be used to check if the [CygnusPlatformWebViewWidgetCreationParams.headlessWebView] property is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusPlatformWebViewWidgetCreationParams.headlessWebView.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView
  ///- iOS WKWebView
  ///- macOS WKWebView
  ///- Web \<iframe\>
  ///- Windows WebView2
  ///
  ///Use the [CygnusPlatformWebViewWidgetCreationParams.isPropertySupported] method to check if this property is supported at runtime.
  ///{@endtemplate}
  headlessWebView,

  ///Can be used to check if the [CygnusPlatformWebViewWidgetCreationParams.keepAlive] property is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusPlatformWebViewWidgetCreationParams.keepAlive.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView
  ///- iOS WKWebView
  ///- macOS WKWebView
  ///- Windows WebView2
  ///
  ///Use the [CygnusPlatformWebViewWidgetCreationParams.isPropertySupported] method to check if this property is supported at runtime.
  ///{@endtemplate}
  keepAlive,

  ///Can be used to check if the [CygnusPlatformWebViewWidgetCreationParams.preventGestureDelay] property is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusPlatformWebViewWidgetCreationParams.preventGestureDelay.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- iOS WKWebView
  ///
  ///Use the [CygnusPlatformWebViewWidgetCreationParams.isPropertySupported] method to check if this property is supported at runtime.
  ///{@endtemplate}
  preventGestureDelay,

  ///Can be used to check if the [CygnusPlatformWebViewWidgetCreationParams.webViewEnvironment] property is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusPlatformWebViewWidgetCreationParams.webViewEnvironment.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Windows WebView2
  ///- Linux WPE WebKit ([Official API - WebKitWebContext](https://wpewebkit.org/reference/stable/wpe-webkit-2.0/class.WebContext.html))
  ///
  ///Use the [CygnusPlatformWebViewWidgetCreationParams.isPropertySupported] method to check if this property is supported at runtime.
  ///{@endtemplate}
  webViewEnvironment,
}

extension _CygnusPlatformWebViewWidgetCreationParamsPropertySupported
    on CygnusPlatformWebViewWidgetCreationParams {
  static bool isPropertySupported(
    CygnusPlatformWebViewWidgetCreationParamsProperty property, {
    TargetPlatform? platform,
  }) {
    switch (property) {
      case CygnusPlatformWebViewWidgetCreationParamsProperty.headlessWebView:
        return kIsWeb && platform == null
            ? true
            : ((kIsWeb && platform != null) || !kIsWeb) &&
                  [
                    TargetPlatform.android,
                    TargetPlatform.iOS,
                    TargetPlatform.macOS,
                    TargetPlatform.windows,
                  ].contains(platform ?? defaultTargetPlatform);
      case CygnusPlatformWebViewWidgetCreationParamsProperty.keepAlive:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [
              TargetPlatform.android,
              TargetPlatform.iOS,
              TargetPlatform.macOS,
              TargetPlatform.windows,
            ].contains(platform ?? defaultTargetPlatform);
      case CygnusPlatformWebViewWidgetCreationParamsProperty
          .preventGestureDelay:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [TargetPlatform.iOS].contains(platform ?? defaultTargetPlatform);
      case CygnusPlatformWebViewWidgetCreationParamsProperty.webViewEnvironment:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [
              TargetPlatform.windows,
              TargetPlatform.linux,
            ].contains(platform ?? defaultTargetPlatform);
    }
  }
}
