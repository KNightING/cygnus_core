// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'platform_web_message_channel.dart';

// **************************************************************************
// SupportedPlatformsGenerator
// **************************************************************************

extension _CygnusPlatformWebMessageChannelCreationParamsClassSupported
    on CygnusPlatformWebMessageChannelCreationParams {
  ///{@template cygnus_core.CygnusPlatformWebMessageChannelCreationParams.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView
  ///- iOS WKWebView
  ///- macOS WKWebView
  ///- Linux WPE WebKit:
  ///    - Implemented via JavaScript MessageChannel API.
  ///- Windows WebView2:
  ///    - Implemented via JavaScript MessageChannel API.
  ///
  ///Use the [CygnusPlatformWebMessageChannelCreationParams.isClassSupported] method to check if this class is supported at runtime.
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

///List of [CygnusPlatformWebMessageChannelCreationParams]'s properties that can be used to check i they are supported or not by the current platform.
enum CygnusPlatformWebMessageChannelCreationParamsProperty {
  ///Can be used to check if the [CygnusPlatformWebMessageChannelCreationParams.id] property is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusPlatformWebMessageChannelCreationParams.id.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView
  ///- iOS WKWebView
  ///- macOS WKWebView
  ///- Linux WPE WebKit:
  ///    - Implemented via JavaScript MessageChannel API.
  ///- Windows WebView2:
  ///    - Implemented via JavaScript MessageChannel API.
  ///
  ///Use the [CygnusPlatformWebMessageChannelCreationParams.isPropertySupported] method to check if this property is supported at runtime.
  ///{@endtemplate}
  id,

  ///Can be used to check if the [CygnusPlatformWebMessageChannelCreationParams.port1] property is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusPlatformWebMessageChannelCreationParams.port1.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView
  ///- iOS WKWebView
  ///- macOS WKWebView
  ///- Linux WPE WebKit:
  ///    - Implemented via JavaScript MessageChannel API.
  ///- Windows WebView2:
  ///    - Implemented via JavaScript MessageChannel API.
  ///
  ///Use the [CygnusPlatformWebMessageChannelCreationParams.isPropertySupported] method to check if this property is supported at runtime.
  ///{@endtemplate}
  port1,

  ///Can be used to check if the [CygnusPlatformWebMessageChannelCreationParams.port2] property is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusPlatformWebMessageChannelCreationParams.port2.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView
  ///- iOS WKWebView
  ///- macOS WKWebView
  ///- Linux WPE WebKit:
  ///    - Implemented via JavaScript MessageChannel API.
  ///- Windows WebView2:
  ///    - Implemented via JavaScript MessageChannel API.
  ///
  ///Use the [CygnusPlatformWebMessageChannelCreationParams.isPropertySupported] method to check if this property is supported at runtime.
  ///{@endtemplate}
  port2,
}

extension _CygnusPlatformWebMessageChannelCreationParamsPropertySupported
    on CygnusPlatformWebMessageChannelCreationParams {
  static bool isPropertySupported(
    CygnusPlatformWebMessageChannelCreationParamsProperty property, {
    TargetPlatform? platform,
  }) {
    switch (property) {
      case CygnusPlatformWebMessageChannelCreationParamsProperty.id:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [
              TargetPlatform.android,
              TargetPlatform.iOS,
              TargetPlatform.macOS,
              TargetPlatform.linux,
              TargetPlatform.windows,
            ].contains(platform ?? defaultTargetPlatform);
      case CygnusPlatformWebMessageChannelCreationParamsProperty.port1:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [
              TargetPlatform.android,
              TargetPlatform.iOS,
              TargetPlatform.macOS,
              TargetPlatform.linux,
              TargetPlatform.windows,
            ].contains(platform ?? defaultTargetPlatform);
      case CygnusPlatformWebMessageChannelCreationParamsProperty.port2:
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

extension _CygnusPlatformWebMessageChannelClassSupported
    on CygnusPlatformWebMessageChannel {
  ///{@template cygnus_core.CygnusPlatformWebMessageChannel.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView
  ///- iOS WKWebView
  ///- macOS WKWebView
  ///- Linux WPE WebKit:
  ///    - Implemented via JavaScript MessageChannel API.
  ///- Windows WebView2:
  ///    - Implemented via JavaScript MessageChannel API.
  ///
  ///Use the [CygnusPlatformWebMessageChannel.isClassSupported] method to check if this class is supported at runtime.
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

///List of [CygnusPlatformWebMessageChannel]'s methods that can be used to check if they are supported or not by the current platform.
enum CygnusPlatformWebMessageChannelMethod {
  ///Can be used to check if the [CygnusPlatformWebMessageChannel.dispose] method is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusPlatformWebMessageChannel.dispose.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView
  ///- iOS WKWebView
  ///- macOS WKWebView
  ///- Linux WPE WebKit:
  ///    - Implemented via JavaScript MessageChannel API.
  ///- Windows WebView2:
  ///    - Implemented via JavaScript MessageChannel API.
  ///
  ///Use the [CygnusPlatformWebMessageChannel.isMethodSupported] method to check if this method is supported at runtime.
  ///{@endtemplate}
  dispose,
}

extension _CygnusPlatformWebMessageChannelMethodSupported
    on CygnusPlatformWebMessageChannel {
  static bool isMethodSupported(
    CygnusPlatformWebMessageChannelMethod method, {
    TargetPlatform? platform,
  }) {
    switch (method) {
      case CygnusPlatformWebMessageChannelMethod.dispose:
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
