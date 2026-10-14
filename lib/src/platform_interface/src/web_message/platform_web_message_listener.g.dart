// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'platform_web_message_listener.dart';

// **************************************************************************
// SupportedPlatformsGenerator
// **************************************************************************

extension _CygnusPlatformWebMessageListenerCreationParamsClassSupported
    on CygnusPlatformWebMessageListenerCreationParams {
  ///{@template cygnus_core.CygnusPlatformWebMessageListenerCreationParams.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView
  ///- iOS WKWebView
  ///- macOS WKWebView
  ///- Linux WPE WebKit
  ///- Windows WebView2
  ///
  ///Use the [CygnusPlatformWebMessageListenerCreationParams.isClassSupported] method to check if this class is supported at runtime.
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

///List of [CygnusPlatformWebMessageListenerCreationParams]'s properties that can be used to check i they are supported or not by the current platform.
enum CygnusPlatformWebMessageListenerCreationParamsProperty {
  ///Can be used to check if the [CygnusPlatformWebMessageListenerCreationParams.allowedOriginRules] property is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusPlatformWebMessageListenerCreationParams.allowedOriginRules.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView
  ///- iOS WKWebView
  ///- macOS WKWebView
  ///- Linux WPE WebKit
  ///- Windows WebView2
  ///
  ///Use the [CygnusPlatformWebMessageListenerCreationParams.isPropertySupported] method to check if this property is supported at runtime.
  ///{@endtemplate}
  allowedOriginRules,

  ///Can be used to check if the [CygnusPlatformWebMessageListenerCreationParams.jsObjectName] property is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusPlatformWebMessageListenerCreationParams.jsObjectName.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView
  ///- iOS WKWebView
  ///- macOS WKWebView
  ///- Linux WPE WebKit
  ///- Windows WebView2
  ///
  ///Use the [CygnusPlatformWebMessageListenerCreationParams.isPropertySupported] method to check if this property is supported at runtime.
  ///{@endtemplate}
  jsObjectName,

  ///Can be used to check if the [CygnusPlatformWebMessageListenerCreationParams.onPostMessage] property is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusPlatformWebMessageListenerCreationParams.onPostMessage.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView ([Official API - WebViewCompat.CygnusWebMessageListener.onPostMessage](https://developer.android.com/reference/androidx/webkit/WebViewCompat.CygnusWebMessageListener#onPostMessage(android.webkit.WebView,%20androidx.webkit.WebMessageCompat,%20android.net.Uri,%20boolean,%20androidx.webkit.CygnusJavaScriptReplyProxy)))
  ///- iOS WKWebView
  ///- macOS WKWebView
  ///- Linux WPE WebKit
  ///- Windows WebView2
  ///
  ///**Parameters - Officially Supported Platforms/Implementations**:
  ///- [message]: all platforms
  ///- [sourceOrigin]: all platforms
  ///- [isMainFrame]: all platforms
  ///- [replyProxy]: all platforms
  ///
  ///Use the [CygnusPlatformWebMessageListenerCreationParams.isPropertySupported] method to check if this property is supported at runtime.
  ///{@endtemplate}
  onPostMessage,
}

extension _CygnusPlatformWebMessageListenerCreationParamsPropertySupported
    on CygnusPlatformWebMessageListenerCreationParams {
  static bool isPropertySupported(
    CygnusPlatformWebMessageListenerCreationParamsProperty property, {
    TargetPlatform? platform,
  }) {
    switch (property) {
      case CygnusPlatformWebMessageListenerCreationParamsProperty
          .allowedOriginRules:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [
              TargetPlatform.android,
              TargetPlatform.iOS,
              TargetPlatform.macOS,
              TargetPlatform.linux,
              TargetPlatform.windows,
            ].contains(platform ?? defaultTargetPlatform);
      case CygnusPlatformWebMessageListenerCreationParamsProperty.jsObjectName:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [
              TargetPlatform.android,
              TargetPlatform.iOS,
              TargetPlatform.macOS,
              TargetPlatform.linux,
              TargetPlatform.windows,
            ].contains(platform ?? defaultTargetPlatform);
      case CygnusPlatformWebMessageListenerCreationParamsProperty.onPostMessage:
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

extension _CygnusPlatformWebMessageListenerClassSupported
    on CygnusPlatformWebMessageListener {
  ///{@template cygnus_core.CygnusPlatformWebMessageListener.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView
  ///- iOS WKWebView
  ///- macOS WKWebView
  ///- Linux WPE WebKit
  ///- Windows WebView2
  ///
  ///Use the [CygnusPlatformWebMessageListener.isClassSupported] method to check if this class is supported at runtime.
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

///List of [CygnusPlatformWebMessageListener]'s methods that can be used to check if they are supported or not by the current platform.
enum CygnusPlatformWebMessageListenerMethod {
  ///Can be used to check if the [CygnusPlatformWebMessageListener.dispose] method is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusPlatformWebMessageListener.dispose.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView
  ///- iOS WKWebView
  ///- macOS WKWebView
  ///- Linux WPE WebKit
  ///- Windows WebView2
  ///
  ///Use the [CygnusPlatformWebMessageListener.isMethodSupported] method to check if this method is supported at runtime.
  ///{@endtemplate}
  dispose,
}

extension _CygnusPlatformWebMessageListenerMethodSupported
    on CygnusPlatformWebMessageListener {
  static bool isMethodSupported(
    CygnusPlatformWebMessageListenerMethod method, {
    TargetPlatform? platform,
  }) {
    switch (method) {
      case CygnusPlatformWebMessageListenerMethod.dispose:
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
