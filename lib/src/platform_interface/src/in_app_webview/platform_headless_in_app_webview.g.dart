// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'platform_headless_in_app_webview.dart';

// **************************************************************************
// SupportedPlatformsGenerator
// **************************************************************************

extension _CygnusPlatformHeadlessWebViewCreationParamsClassSupported
    on CygnusPlatformHeadlessWebViewCreationParams {
  ///{@template cygnus_core.CygnusPlatformHeadlessWebViewCreationParams.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView
  ///- iOS WKWebView
  ///- macOS WKWebView
  ///- Web \<iframe\>
  ///- Windows WebView2
  ///- Linux WPE WebKit
  ///
  ///Use the [CygnusPlatformHeadlessWebViewCreationParams.isClassSupported] method to check if this class is supported at runtime.
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

///List of [CygnusPlatformHeadlessWebViewCreationParams]'s properties that can be used to check i they are supported or not by the current platform.
enum CygnusPlatformHeadlessWebViewCreationParamsProperty {
  ///Can be used to check if the [CygnusPlatformHeadlessWebViewCreationParams.initialSize] property is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusPlatformHeadlessWebViewCreationParams.initialSize.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView:
  ///    - `Size` width and height values will be converted to `int` values because they cannot have `double` values.
  ///- iOS WKWebView
  ///- macOS WKWebView
  ///- Web \<iframe\>
  ///- Windows WebView2
  ///- Linux WPE WebKit
  ///
  ///Use the [CygnusPlatformHeadlessWebViewCreationParams.isPropertySupported] method to check if this property is supported at runtime.
  ///{@endtemplate}
  initialSize,

  ///Can be used to check if the [CygnusPlatformHeadlessWebViewCreationParams.webViewEnvironment] property is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusPlatformHeadlessWebViewCreationParams.webViewEnvironment.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Windows WebView2
  ///- Linux WPE WebKit ([Official API - WebKitWebContext](https://wpewebkit.org/reference/stable/wpe-webkit-2.0/class.WebContext.html))
  ///
  ///Use the [CygnusPlatformHeadlessWebViewCreationParams.isPropertySupported] method to check if this property is supported at runtime.
  ///{@endtemplate}
  webViewEnvironment,
}

extension _CygnusPlatformHeadlessWebViewCreationParamsPropertySupported
    on CygnusPlatformHeadlessWebViewCreationParams {
  static bool isPropertySupported(
    CygnusPlatformHeadlessWebViewCreationParamsProperty property, {
    TargetPlatform? platform,
  }) {
    switch (property) {
      case CygnusPlatformHeadlessWebViewCreationParamsProperty.initialSize:
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
      case CygnusPlatformHeadlessWebViewCreationParamsProperty
          .webViewEnvironment:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [
              TargetPlatform.windows,
              TargetPlatform.linux,
            ].contains(platform ?? defaultTargetPlatform);
    }
  }
}

extension _CygnusPlatformHeadlessWebViewClassSupported
    on CygnusPlatformHeadlessWebView {
  ///{@template cygnus_core.CygnusPlatformHeadlessWebView.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView
  ///- iOS WKWebView
  ///- macOS WKWebView
  ///- Web \<iframe\>
  ///- Windows WebView2
  ///- Linux WPE WebKit
  ///
  ///Use the [CygnusPlatformHeadlessWebView.isClassSupported] method to check if this class is supported at runtime.
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

///List of [CygnusPlatformHeadlessWebView]'s methods that can be used to check if they are supported or not by the current platform.
enum CygnusPlatformHeadlessWebViewMethod {
  ///Can be used to check if the [CygnusPlatformHeadlessWebView.dispose] method is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusPlatformHeadlessWebView.dispose.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView
  ///- iOS WKWebView
  ///- macOS WKWebView
  ///- Web \<iframe\>
  ///- Windows WebView2
  ///- Linux WPE WebKit
  ///
  ///Use the [CygnusPlatformHeadlessWebView.isMethodSupported] method to check if this method is supported at runtime.
  ///{@endtemplate}
  dispose,

  ///Can be used to check if the [CygnusPlatformHeadlessWebView.getSize] method is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusPlatformHeadlessWebView.getSize.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView
  ///- iOS WKWebView
  ///- macOS WKWebView
  ///- Web \<iframe\>
  ///- Linux WPE WebKit
  ///
  ///Use the [CygnusPlatformHeadlessWebView.isMethodSupported] method to check if this method is supported at runtime.
  ///{@endtemplate}
  getSize,

  ///Can be used to check if the [CygnusPlatformHeadlessWebView.isRunning] method is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusPlatformHeadlessWebView.isRunning.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView
  ///- iOS WKWebView
  ///- macOS WKWebView
  ///- Web \<iframe\>
  ///- Windows WebView2
  ///- Linux WPE WebKit
  ///
  ///Use the [CygnusPlatformHeadlessWebView.isMethodSupported] method to check if this method is supported at runtime.
  ///{@endtemplate}
  isRunning,

  ///Can be used to check if the [CygnusPlatformHeadlessWebView.run] method is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusPlatformHeadlessWebView.run.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView
  ///- iOS WKWebView
  ///- macOS WKWebView
  ///- Web \<iframe\>:
  ///    - It will append a new `iframe` to the body.
  ///- Windows WebView2
  ///- Linux WPE WebKit
  ///
  ///Use the [CygnusPlatformHeadlessWebView.isMethodSupported] method to check if this method is supported at runtime.
  ///{@endtemplate}
  run,

  ///Can be used to check if the [CygnusPlatformHeadlessWebView.setSize] method is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusPlatformHeadlessWebView.setSize.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView:
  ///    - `Size` width and height values will be converted to `int` values because they cannot have `double` values.
  ///- iOS WKWebView
  ///- macOS WKWebView
  ///- Web \<iframe\>
  ///- Linux WPE WebKit
  ///
  ///**Parameters - Officially Supported Platforms/Implementations**:
  ///- [size]: all platforms
  ///
  ///Use the [CygnusPlatformHeadlessWebView.isMethodSupported] method to check if this method is supported at runtime.
  ///{@endtemplate}
  setSize,
}

extension _CygnusPlatformHeadlessWebViewMethodSupported
    on CygnusPlatformHeadlessWebView {
  static bool isMethodSupported(
    CygnusPlatformHeadlessWebViewMethod method, {
    TargetPlatform? platform,
  }) {
    switch (method) {
      case CygnusPlatformHeadlessWebViewMethod.dispose:
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
      case CygnusPlatformHeadlessWebViewMethod.getSize:
        return kIsWeb && platform == null
            ? true
            : ((kIsWeb && platform != null) || !kIsWeb) &&
                  [
                    TargetPlatform.android,
                    TargetPlatform.iOS,
                    TargetPlatform.macOS,
                    TargetPlatform.linux,
                  ].contains(platform ?? defaultTargetPlatform);
      case CygnusPlatformHeadlessWebViewMethod.isRunning:
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
      case CygnusPlatformHeadlessWebViewMethod.run:
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
      case CygnusPlatformHeadlessWebViewMethod.setSize:
        return kIsWeb && platform == null
            ? true
            : ((kIsWeb && platform != null) || !kIsWeb) &&
                  [
                    TargetPlatform.android,
                    TargetPlatform.iOS,
                    TargetPlatform.macOS,
                    TargetPlatform.linux,
                  ].contains(platform ?? defaultTargetPlatform);
    }
  }
}
