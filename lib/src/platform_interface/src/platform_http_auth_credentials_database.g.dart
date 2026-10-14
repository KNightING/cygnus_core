// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'platform_http_auth_credentials_database.dart';

// **************************************************************************
// SupportedPlatformsGenerator
// **************************************************************************

extension _CygnusPlatformHttpAuthCredentialDatabaseCreationParamsClassSupported
    on CygnusPlatformHttpAuthCredentialDatabaseCreationParams {
  ///{@template cygnus_core.CygnusPlatformHttpAuthCredentialDatabaseCreationParams.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView
  ///- iOS WKWebView
  ///- macOS WKWebView
  ///- Linux WPE WebKit
  ///
  ///Use the [CygnusPlatformHttpAuthCredentialDatabaseCreationParams.isClassSupported] method to check if this class is supported at runtime.
  ///{@endtemplate}
  static bool isClassSupported({TargetPlatform? platform}) {
    return ((kIsWeb && platform != null) || !kIsWeb) &&
        [
          TargetPlatform.android,
          TargetPlatform.iOS,
          TargetPlatform.macOS,
          TargetPlatform.linux,
        ].contains(platform ?? defaultTargetPlatform);
  }
}

extension _CygnusPlatformHttpAuthCredentialDatabaseClassSupported
    on CygnusPlatformHttpAuthCredentialDatabase {
  ///{@template cygnus_core.CygnusPlatformHttpAuthCredentialDatabase.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView:
  ///    - It has a custom implementation using `android.database.sqlite.SQLiteDatabase` because [WebViewDatabase](https://developer.android.com/reference/android/webkit/WebViewDatabase) doesn't offer the same functionalities as iOS/macOS `URLCredentialStorage`.
  ///- iOS WKWebView:
  ///    - It is implemented using the [URLCredentialStorage](https://developer.apple.com/documentation/foundation/urlcredentialstorage) class.
  ///- macOS WKWebView:
  ///    - It is implemented using the [URLCredentialStorage](https://developer.apple.com/documentation/foundation/urlcredentialstorage) class.
  ///- Linux WPE WebKit:
  ///    - Implemented using libsecret for secure credential storage in the system keyring (gnome-keyring, KDE Wallet, etc.).
  ///
  ///Use the [CygnusPlatformHttpAuthCredentialDatabase.isClassSupported] method to check if this class is supported at runtime.
  ///{@endtemplate}
  static bool isClassSupported({TargetPlatform? platform}) {
    return ((kIsWeb && platform != null) || !kIsWeb) &&
        [
          TargetPlatform.android,
          TargetPlatform.iOS,
          TargetPlatform.macOS,
          TargetPlatform.linux,
        ].contains(platform ?? defaultTargetPlatform);
  }
}

///List of [CygnusPlatformHttpAuthCredentialDatabase]'s methods that can be used to check if they are supported or not by the current platform.
enum CygnusPlatformHttpAuthCredentialDatabaseMethod {
  ///Can be used to check if the [CygnusPlatformHttpAuthCredentialDatabase.clearAllAuthCredentials] method is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusPlatformHttpAuthCredentialDatabase.clearAllAuthCredentials.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView
  ///- iOS WKWebView
  ///- macOS WKWebView
  ///- Linux WPE WebKit
  ///
  ///Use the [CygnusPlatformHttpAuthCredentialDatabase.isMethodSupported] method to check if this method is supported at runtime.
  ///{@endtemplate}
  clearAllAuthCredentials,

  ///Can be used to check if the [CygnusPlatformHttpAuthCredentialDatabase.getAllAuthCredentials] method is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusPlatformHttpAuthCredentialDatabase.getAllAuthCredentials.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView
  ///- iOS WKWebView ([Official API - URLCredentialStorage.allCredentials](https://developer.apple.com/documentation/foundation/urlcredentialstorage/1413859-allcredentials))
  ///- macOS WKWebView ([Official API - URLCredentialStorage.allCredentials](https://developer.apple.com/documentation/foundation/urlcredentialstorage/1413859-allcredentials))
  ///- Linux WPE WebKit:
  ///    - Implemented using libsecret for secure storage.
  ///
  ///Use the [CygnusPlatformHttpAuthCredentialDatabase.isMethodSupported] method to check if this method is supported at runtime.
  ///{@endtemplate}
  getAllAuthCredentials,

  ///Can be used to check if the [CygnusPlatformHttpAuthCredentialDatabase.getHttpAuthCredentials] method is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusPlatformHttpAuthCredentialDatabase.getHttpAuthCredentials.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView
  ///- iOS WKWebView
  ///- macOS WKWebView
  ///- Linux WPE WebKit
  ///
  ///**Parameters - Officially Supported Platforms/Implementations**:
  ///- [protectionSpace]: all platforms
  ///
  ///Use the [CygnusPlatformHttpAuthCredentialDatabase.isMethodSupported] method to check if this method is supported at runtime.
  ///{@endtemplate}
  getHttpAuthCredentials,

  ///Can be used to check if the [CygnusPlatformHttpAuthCredentialDatabase.removeHttpAuthCredential] method is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusPlatformHttpAuthCredentialDatabase.removeHttpAuthCredential.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView
  ///- iOS WKWebView ([Official API - URLCredentialStorage.remove](https://developer.apple.com/documentation/foundation/urlcredentialstorage/1408664-remove))
  ///- macOS WKWebView ([Official API - URLCredentialStorage.remove](https://developer.apple.com/documentation/foundation/urlcredentialstorage/1408664-remove))
  ///- Linux WPE WebKit:
  ///    - Implemented using libsecret for secure storage.
  ///
  ///**Parameters - Officially Supported Platforms/Implementations**:
  ///- [protectionSpace]: all platforms
  ///- [credential]: all platforms
  ///
  ///Use the [CygnusPlatformHttpAuthCredentialDatabase.isMethodSupported] method to check if this method is supported at runtime.
  ///{@endtemplate}
  removeHttpAuthCredential,

  ///Can be used to check if the [CygnusPlatformHttpAuthCredentialDatabase.removeHttpAuthCredentials] method is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusPlatformHttpAuthCredentialDatabase.removeHttpAuthCredentials.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView
  ///- iOS WKWebView
  ///- macOS WKWebView
  ///- Linux WPE WebKit
  ///
  ///**Parameters - Officially Supported Platforms/Implementations**:
  ///- [protectionSpace]: all platforms
  ///
  ///Use the [CygnusPlatformHttpAuthCredentialDatabase.isMethodSupported] method to check if this method is supported at runtime.
  ///{@endtemplate}
  removeHttpAuthCredentials,

  ///Can be used to check if the [CygnusPlatformHttpAuthCredentialDatabase.setHttpAuthCredential] method is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusPlatformHttpAuthCredentialDatabase.setHttpAuthCredential.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView
  ///- iOS WKWebView ([Official API - URLCredentialStorage.set](https://developer.apple.com/documentation/foundation/urlcredentialstorage/1407227-set))
  ///- macOS WKWebView ([Official API - URLCredentialStorage.set](https://developer.apple.com/documentation/foundation/urlcredentialstorage/1407227-set))
  ///- Linux WPE WebKit:
  ///    - Implemented using libsecret for secure storage.
  ///
  ///**Parameters - Officially Supported Platforms/Implementations**:
  ///- [protectionSpace]: all platforms
  ///- [credential]: all platforms
  ///
  ///Use the [CygnusPlatformHttpAuthCredentialDatabase.isMethodSupported] method to check if this method is supported at runtime.
  ///{@endtemplate}
  setHttpAuthCredential,
}

extension _CygnusPlatformHttpAuthCredentialDatabaseMethodSupported
    on CygnusPlatformHttpAuthCredentialDatabase {
  static bool isMethodSupported(
    CygnusPlatformHttpAuthCredentialDatabaseMethod method, {
    TargetPlatform? platform,
  }) {
    switch (method) {
      case CygnusPlatformHttpAuthCredentialDatabaseMethod
          .clearAllAuthCredentials:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [
              TargetPlatform.android,
              TargetPlatform.iOS,
              TargetPlatform.macOS,
              TargetPlatform.linux,
            ].contains(platform ?? defaultTargetPlatform);
      case CygnusPlatformHttpAuthCredentialDatabaseMethod.getAllAuthCredentials:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [
              TargetPlatform.android,
              TargetPlatform.iOS,
              TargetPlatform.macOS,
              TargetPlatform.linux,
            ].contains(platform ?? defaultTargetPlatform);
      case CygnusPlatformHttpAuthCredentialDatabaseMethod
          .getHttpAuthCredentials:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [
              TargetPlatform.android,
              TargetPlatform.iOS,
              TargetPlatform.macOS,
              TargetPlatform.linux,
            ].contains(platform ?? defaultTargetPlatform);
      case CygnusPlatformHttpAuthCredentialDatabaseMethod
          .removeHttpAuthCredential:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [
              TargetPlatform.android,
              TargetPlatform.iOS,
              TargetPlatform.macOS,
              TargetPlatform.linux,
            ].contains(platform ?? defaultTargetPlatform);
      case CygnusPlatformHttpAuthCredentialDatabaseMethod
          .removeHttpAuthCredentials:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [
              TargetPlatform.android,
              TargetPlatform.iOS,
              TargetPlatform.macOS,
              TargetPlatform.linux,
            ].contains(platform ?? defaultTargetPlatform);
      case CygnusPlatformHttpAuthCredentialDatabaseMethod.setHttpAuthCredential:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [
              TargetPlatform.android,
              TargetPlatform.iOS,
              TargetPlatform.macOS,
              TargetPlatform.linux,
            ].contains(platform ?? defaultTargetPlatform);
    }
  }
}
