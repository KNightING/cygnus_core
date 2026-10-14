// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'platform_web_authenticate_session.dart';

// **************************************************************************
// SupportedPlatformsGenerator
// **************************************************************************

extension _CygnusPlatformWebAuthenticationSessionCreationParamsClassSupported
    on CygnusPlatformWebAuthenticationSessionCreationParams {
  ///{@template cygnus_core.CygnusPlatformWebAuthenticationSessionCreationParams.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- iOS WKWebView 11.0+
  ///- macOS WKWebView 10.15+
  ///
  ///Use the [CygnusPlatformWebAuthenticationSessionCreationParams.isClassSupported] method to check if this class is supported at runtime.
  ///{@endtemplate}
  static bool isClassSupported({TargetPlatform? platform}) {
    return ((kIsWeb && platform != null) || !kIsWeb) &&
        [
          TargetPlatform.iOS,
          TargetPlatform.macOS,
        ].contains(platform ?? defaultTargetPlatform);
  }
}

extension _CygnusPlatformWebAuthenticationSessionClassSupported
    on CygnusPlatformWebAuthenticationSession {
  ///{@template cygnus_core.CygnusPlatformWebAuthenticationSession.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- iOS WKWebView 11.0+
  ///- macOS WKWebView 10.15+
  ///
  ///Use the [CygnusPlatformWebAuthenticationSession.isClassSupported] method to check if this class is supported at runtime.
  ///{@endtemplate}
  static bool isClassSupported({TargetPlatform? platform}) {
    return ((kIsWeb && platform != null) || !kIsWeb) &&
        [
          TargetPlatform.iOS,
          TargetPlatform.macOS,
        ].contains(platform ?? defaultTargetPlatform);
  }
}

///List of [CygnusPlatformWebAuthenticationSession]'s properties that can be used to check i they are supported or not by the current platform.
enum CygnusPlatformWebAuthenticationSessionProperty {
  ///Can be used to check if the [CygnusPlatformWebAuthenticationSession.callbackURLScheme] property is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusPlatformWebAuthenticationSession.callbackURLScheme.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- iOS WKWebView
  ///- macOS WKWebView
  ///
  ///Use the [CygnusPlatformWebAuthenticationSession.isPropertySupported] method to check if this property is supported at runtime.
  ///{@endtemplate}
  callbackURLScheme,

  ///Can be used to check if the [CygnusPlatformWebAuthenticationSession.id] property is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusPlatformWebAuthenticationSession.id.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- iOS WKWebView
  ///- macOS WKWebView
  ///
  ///Use the [CygnusPlatformWebAuthenticationSession.isPropertySupported] method to check if this property is supported at runtime.
  ///{@endtemplate}
  id,

  ///Can be used to check if the [CygnusPlatformWebAuthenticationSession.initialSettings] property is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusPlatformWebAuthenticationSession.initialSettings.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- iOS WKWebView
  ///- macOS WKWebView
  ///
  ///Use the [CygnusPlatformWebAuthenticationSession.isPropertySupported] method to check if this property is supported at runtime.
  ///{@endtemplate}
  initialSettings,

  ///Can be used to check if the [CygnusPlatformWebAuthenticationSession.onComplete] property is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusPlatformWebAuthenticationSession.onComplete.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- iOS WKWebView
  ///- macOS WKWebView
  ///
  ///**Parameters - Officially Supported Platforms/Implementations**:
  ///- [url]: all platforms
  ///- [error]: all platforms
  ///
  ///Use the [CygnusPlatformWebAuthenticationSession.isPropertySupported] method to check if this property is supported at runtime.
  ///{@endtemplate}
  onComplete,

  ///Can be used to check if the [CygnusPlatformWebAuthenticationSession.url] property is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusPlatformWebAuthenticationSession.url.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- iOS WKWebView
  ///- macOS WKWebView
  ///
  ///Use the [CygnusPlatformWebAuthenticationSession.isPropertySupported] method to check if this property is supported at runtime.
  ///{@endtemplate}
  url,
}

extension _CygnusPlatformWebAuthenticationSessionPropertySupported
    on CygnusPlatformWebAuthenticationSession {
  static bool isPropertySupported(
    CygnusPlatformWebAuthenticationSessionProperty property, {
    TargetPlatform? platform,
  }) {
    switch (property) {
      case CygnusPlatformWebAuthenticationSessionProperty.callbackURLScheme:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [
              TargetPlatform.iOS,
              TargetPlatform.macOS,
            ].contains(platform ?? defaultTargetPlatform);
      case CygnusPlatformWebAuthenticationSessionProperty.id:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [
              TargetPlatform.iOS,
              TargetPlatform.macOS,
            ].contains(platform ?? defaultTargetPlatform);
      case CygnusPlatformWebAuthenticationSessionProperty.initialSettings:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [
              TargetPlatform.iOS,
              TargetPlatform.macOS,
            ].contains(platform ?? defaultTargetPlatform);
      case CygnusPlatformWebAuthenticationSessionProperty.onComplete:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [
              TargetPlatform.iOS,
              TargetPlatform.macOS,
            ].contains(platform ?? defaultTargetPlatform);
      case CygnusPlatformWebAuthenticationSessionProperty.url:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [
              TargetPlatform.iOS,
              TargetPlatform.macOS,
            ].contains(platform ?? defaultTargetPlatform);
    }
  }
}

///List of [CygnusPlatformWebAuthenticationSession]'s methods that can be used to check if they are supported or not by the current platform.
enum CygnusPlatformWebAuthenticationSessionMethod {
  ///Can be used to check if the [CygnusPlatformWebAuthenticationSession.canStart] method is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusPlatformWebAuthenticationSession.canStart.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- iOS WKWebView ([Official API - ASWebAuthenticationSession.canStart](https://developer.apple.com/documentation/authenticationservices/aswebauthenticationsession/3516277-canstart))
  ///- macOS WKWebView ([Official API - ASWebAuthenticationSession.canStart](https://developer.apple.com/documentation/authenticationservices/aswebauthenticationsession/3516277-canstart))
  ///
  ///Use the [CygnusPlatformWebAuthenticationSession.isMethodSupported] method to check if this method is supported at runtime.
  ///{@endtemplate}
  canStart,

  ///Can be used to check if the [CygnusPlatformWebAuthenticationSession.cancel] method is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusPlatformWebAuthenticationSession.cancel.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- iOS WKWebView ([Official API - ASWebAuthenticationSession.cancel](https://developer.apple.com/documentation/authenticationservices/aswebauthenticationsession/2990951-cancel))
  ///- macOS WKWebView ([Official API - ASWebAuthenticationSession.cancel](https://developer.apple.com/documentation/authenticationservices/aswebauthenticationsession/2990951-cancel))
  ///
  ///Use the [CygnusPlatformWebAuthenticationSession.isMethodSupported] method to check if this method is supported at runtime.
  ///{@endtemplate}
  cancel,

  ///Can be used to check if the [CygnusPlatformWebAuthenticationSession.create] method is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusPlatformWebAuthenticationSession.create.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- iOS WKWebView
  ///- macOS WKWebView
  ///
  ///**Parameters - Officially Supported Platforms/Implementations**:
  ///- [url]: all platforms
  ///- [callbackURLScheme]: all platforms
  ///- [onComplete]: all platforms
  ///- [initialSettings]: all platforms
  ///
  ///Use the [CygnusPlatformWebAuthenticationSession.isMethodSupported] method to check if this method is supported at runtime.
  ///{@endtemplate}
  create,

  ///Can be used to check if the [CygnusPlatformWebAuthenticationSession.dispose] method is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusPlatformWebAuthenticationSession.dispose.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- iOS WKWebView
  ///- macOS WKWebView
  ///
  ///Use the [CygnusPlatformWebAuthenticationSession.isMethodSupported] method to check if this method is supported at runtime.
  ///{@endtemplate}
  dispose,

  ///Can be used to check if the [CygnusPlatformWebAuthenticationSession.isAvailable] method is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusPlatformWebAuthenticationSession.isAvailable.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- iOS WKWebView
  ///- macOS WKWebView
  ///
  ///Use the [CygnusPlatformWebAuthenticationSession.isMethodSupported] method to check if this method is supported at runtime.
  ///{@endtemplate}
  isAvailable,

  ///Can be used to check if the [CygnusPlatformWebAuthenticationSession.start] method is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusPlatformWebAuthenticationSession.start.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- iOS WKWebView ([Official API - ASWebAuthenticationSession.start](https://developer.apple.com/documentation/authenticationservices/aswebauthenticationsession/2990953-start))
  ///- macOS WKWebView ([Official API - ASWebAuthenticationSession.start](https://developer.apple.com/documentation/authenticationservices/aswebauthenticationsession/2990953-start))
  ///
  ///Use the [CygnusPlatformWebAuthenticationSession.isMethodSupported] method to check if this method is supported at runtime.
  ///{@endtemplate}
  start,
}

extension _CygnusPlatformWebAuthenticationSessionMethodSupported
    on CygnusPlatformWebAuthenticationSession {
  static bool isMethodSupported(
    CygnusPlatformWebAuthenticationSessionMethod method, {
    TargetPlatform? platform,
  }) {
    switch (method) {
      case CygnusPlatformWebAuthenticationSessionMethod.canStart:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [
              TargetPlatform.iOS,
              TargetPlatform.macOS,
            ].contains(platform ?? defaultTargetPlatform);
      case CygnusPlatformWebAuthenticationSessionMethod.cancel:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [
              TargetPlatform.iOS,
              TargetPlatform.macOS,
            ].contains(platform ?? defaultTargetPlatform);
      case CygnusPlatformWebAuthenticationSessionMethod.create:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [
              TargetPlatform.iOS,
              TargetPlatform.macOS,
            ].contains(platform ?? defaultTargetPlatform);
      case CygnusPlatformWebAuthenticationSessionMethod.dispose:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [
              TargetPlatform.iOS,
              TargetPlatform.macOS,
            ].contains(platform ?? defaultTargetPlatform);
      case CygnusPlatformWebAuthenticationSessionMethod.isAvailable:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [
              TargetPlatform.iOS,
              TargetPlatform.macOS,
            ].contains(platform ?? defaultTargetPlatform);
      case CygnusPlatformWebAuthenticationSessionMethod.start:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [
              TargetPlatform.iOS,
              TargetPlatform.macOS,
            ].contains(platform ?? defaultTargetPlatform);
    }
  }
}
