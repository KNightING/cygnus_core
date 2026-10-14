// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'web_authenticate_session_settings.dart';

// **************************************************************************
// ExchangeableObjectGenerator
// **************************************************************************

///Class that represents the settings that can be used for a [CygnusPlatformWebAuthenticationSession].
///
///**Officially Supported Platforms/Implementations**:
///- iOS WKWebView 13.0+
///- macOS WKWebView 10.15+
class CygnusWebAuthenticationSessionSettings {
  ///A Boolean value that indicates whether the session should ask the browser for a private authentication session.
  ///
  ///Set [prefersEphemeralWebBrowserSession] to `true` to request that the browser
  ///doesn’t share cookies or other browsing data between the authentication session and the user’s normal browser session.
  ///Whether the request is honored depends on the user’s default web browser.
  ///Safari always honors the request.
  ///
  ///The value of this property is `false` by default.
  ///
  ///Set this property before you call [CygnusPlatformWebAuthenticationSession.start]. Otherwise it has no effect.
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- iOS WKWebView 13.0+
  ///- macOS WKWebView 10.15+
  bool? prefersEphemeralWebBrowserSession;

  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- iOS WKWebView 13.0+
  ///- macOS WKWebView 10.15+
  CygnusWebAuthenticationSessionSettings({
    this.prefersEphemeralWebBrowserSession = false,
  });

  ///Gets a possible [CygnusWebAuthenticationSessionSettings] instance from a [Map] value.
  static CygnusWebAuthenticationSessionSettings? fromMap(
    Map<String, dynamic>? map, {
    CygnusEnumMethod? enumMethod,
  }) {
    if (map == null) {
      return null;
    }
    final instance = CygnusWebAuthenticationSessionSettings();
    instance.prefersEphemeralWebBrowserSession =
        map['prefersEphemeralWebBrowserSession'];
    return instance;
  }

  ///Check if the given [property] is supported by the [defaultTargetPlatform] or a specific [platform].
  static bool isPropertySupported(
    CygnusWebAuthenticationSessionSettingsProperty property, {
    TargetPlatform? platform,
  }) =>
      _CygnusWebAuthenticationSessionSettingsPropertySupported.isPropertySupported(
        property,
        platform: platform,
      );

  ///Converts instance to a map.
  Map<String, dynamic> toMap({CygnusEnumMethod? enumMethod}) {
    return {
      "prefersEphemeralWebBrowserSession": prefersEphemeralWebBrowserSession,
    };
  }

  ///Converts instance to a map.
  Map<String, dynamic> toJson() {
    return toMap();
  }

  ///Returns a copy of CygnusWebAuthenticationSessionSettings.
  CygnusWebAuthenticationSessionSettings copy() {
    return CygnusWebAuthenticationSessionSettings.fromMap(toMap()) ??
        CygnusWebAuthenticationSessionSettings();
  }

  @override
  String toString() {
    return 'CygnusWebAuthenticationSessionSettings{prefersEphemeralWebBrowserSession: $prefersEphemeralWebBrowserSession}';
  }
}

// **************************************************************************
// SupportedPlatformsGenerator
// **************************************************************************

///List of [CygnusWebAuthenticationSessionSettings]'s properties that can be used to check i they are supported or not by the current platform.
enum CygnusWebAuthenticationSessionSettingsProperty {
  ///Can be used to check if the [CygnusWebAuthenticationSessionSettings.prefersEphemeralWebBrowserSession] property is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusWebAuthenticationSessionSettings.prefersEphemeralWebBrowserSession.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- iOS WKWebView 13.0+
  ///- macOS WKWebView 10.15+
  ///
  ///Use the [CygnusWebAuthenticationSessionSettings.isPropertySupported] method to check if this property is supported at runtime.
  ///{@endtemplate}
  prefersEphemeralWebBrowserSession,
}

extension _CygnusWebAuthenticationSessionSettingsPropertySupported
    on CygnusWebAuthenticationSessionSettings {
  static bool isPropertySupported(
    CygnusWebAuthenticationSessionSettingsProperty property, {
    TargetPlatform? platform,
  }) {
    switch (property) {
      case CygnusWebAuthenticationSessionSettingsProperty
          .prefersEphemeralWebBrowserSession:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [
              TargetPlatform.iOS,
              TargetPlatform.macOS,
            ].contains(platform ?? defaultTargetPlatform);
    }
  }
}
