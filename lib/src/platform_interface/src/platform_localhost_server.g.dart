// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'platform_localhost_server.dart';

// **************************************************************************
// SupportedPlatformsGenerator
// **************************************************************************

extension _CygnusPlatformLocalhostServerCreationParamsClassSupported
    on CygnusPlatformLocalhostServerCreationParams {
  ///{@template cygnus_core.CygnusPlatformLocalhostServerCreationParams.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView
  ///- iOS WKWebView
  ///- macOS WKWebView
  ///- Windows WebView2
  ///- Linux WPE WebKit
  ///
  ///Use the [CygnusPlatformLocalhostServerCreationParams.isClassSupported] method to check if this class is supported at runtime.
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

extension _CygnusPlatformLocalhostServerClassSupported
    on CygnusPlatformLocalhostServer {
  ///{@template cygnus_core.CygnusPlatformLocalhostServer.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView
  ///- iOS WKWebView
  ///- macOS WKWebView
  ///- Windows WebView2
  ///- Linux WPE WebKit
  ///
  ///Use the [CygnusPlatformLocalhostServer.isClassSupported] method to check if this class is supported at runtime.
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

///List of [CygnusPlatformLocalhostServer]'s methods that can be used to check if they are supported or not by the current platform.
enum CygnusPlatformLocalhostServerMethod {
  ///Can be used to check if the [CygnusPlatformLocalhostServer.close] method is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusPlatformLocalhostServer.close.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView
  ///- iOS WKWebView
  ///- macOS WKWebView
  ///- Windows WebView2
  ///- Linux WPE WebKit
  ///
  ///Use the [CygnusPlatformLocalhostServer.isMethodSupported] method to check if this method is supported at runtime.
  ///{@endtemplate}
  close,

  ///Can be used to check if the [CygnusPlatformLocalhostServer.isRunning] method is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusPlatformLocalhostServer.isRunning.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView
  ///- iOS WKWebView
  ///- macOS WKWebView
  ///- Windows WebView2
  ///- Linux WPE WebKit
  ///
  ///Use the [CygnusPlatformLocalhostServer.isMethodSupported] method to check if this method is supported at runtime.
  ///{@endtemplate}
  isRunning,

  ///Can be used to check if the [CygnusPlatformLocalhostServer.start] method is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusPlatformLocalhostServer.start.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView
  ///- iOS WKWebView
  ///- macOS WKWebView
  ///- Windows WebView2
  ///- Linux WPE WebKit
  ///
  ///Use the [CygnusPlatformLocalhostServer.isMethodSupported] method to check if this method is supported at runtime.
  ///{@endtemplate}
  start,
}

extension _CygnusPlatformLocalhostServerMethodSupported
    on CygnusPlatformLocalhostServer {
  static bool isMethodSupported(
    CygnusPlatformLocalhostServerMethod method, {
    TargetPlatform? platform,
  }) {
    switch (method) {
      case CygnusPlatformLocalhostServerMethod.close:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [
              TargetPlatform.android,
              TargetPlatform.iOS,
              TargetPlatform.macOS,
              TargetPlatform.windows,
              TargetPlatform.linux,
            ].contains(platform ?? defaultTargetPlatform);
      case CygnusPlatformLocalhostServerMethod.isRunning:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [
              TargetPlatform.android,
              TargetPlatform.iOS,
              TargetPlatform.macOS,
              TargetPlatform.windows,
              TargetPlatform.linux,
            ].contains(platform ?? defaultTargetPlatform);
      case CygnusPlatformLocalhostServerMethod.start:
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
