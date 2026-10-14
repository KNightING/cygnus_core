// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'platform_web_storage_manager.dart';

// **************************************************************************
// SupportedPlatformsGenerator
// **************************************************************************

extension _CygnusPlatformWebStorageManagerCreationParamsClassSupported
    on CygnusPlatformWebStorageManagerCreationParams {
  ///{@template cygnus_core.CygnusPlatformWebStorageManagerCreationParams.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView
  ///- iOS WKWebView 9.0+
  ///- Linux WPE WebKit
  ///- macOS WKWebView
  ///
  ///Use the [CygnusPlatformWebStorageManagerCreationParams.isClassSupported] method to check if this class is supported at runtime.
  ///{@endtemplate}
  static bool isClassSupported({TargetPlatform? platform}) {
    return ((kIsWeb && platform != null) || !kIsWeb) &&
        [
          TargetPlatform.android,
          TargetPlatform.iOS,
          TargetPlatform.linux,
          TargetPlatform.macOS,
        ].contains(platform ?? defaultTargetPlatform);
  }
}

extension _CygnusPlatformWebStorageManagerClassSupported
    on CygnusPlatformWebStorageManager {
  ///{@template cygnus_core.CygnusPlatformWebStorageManager.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView ([Official API - CygnusWebStorage](https://developer.android.com/reference/android/webkit/CygnusWebStorage.html))
  ///- iOS WKWebView 9.0+ ([Official API - WKWebsiteDataStore](https://developer.apple.com/documentation/webkit/wkwebsitedatastore))
  ///- Linux WPE WebKit ([Official API - WebKitWebsiteDataManager](https://wpewebkit.org/reference/stable/wpe-webkit-2.0/class.WebsiteDataManager.html))
  ///- macOS WKWebView ([Official API - WKWebsiteDataStore](https://developer.apple.com/documentation/webkit/wkwebsitedatastore))
  ///
  ///Use the [CygnusPlatformWebStorageManager.isClassSupported] method to check if this class is supported at runtime.
  ///{@endtemplate}
  static bool isClassSupported({TargetPlatform? platform}) {
    return ((kIsWeb && platform != null) || !kIsWeb) &&
        [
          TargetPlatform.android,
          TargetPlatform.iOS,
          TargetPlatform.linux,
          TargetPlatform.macOS,
        ].contains(platform ?? defaultTargetPlatform);
  }
}

///List of [CygnusPlatformWebStorageManager]'s methods that can be used to check if they are supported or not by the current platform.
enum CygnusPlatformWebStorageManagerMethod {
  ///Can be used to check if the [CygnusPlatformWebStorageManager.deleteAllData] method is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusPlatformWebStorageManager.deleteAllData.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView ([Official API - CygnusWebStorage.deleteAllData](https://developer.android.com/reference/android/webkit/CygnusWebStorage#deleteAllData()))
  ///
  ///Use the [CygnusPlatformWebStorageManager.isMethodSupported] method to check if this method is supported at runtime.
  ///{@endtemplate}
  deleteAllData,

  ///Can be used to check if the [CygnusPlatformWebStorageManager.deleteOrigin] method is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusPlatformWebStorageManager.deleteOrigin.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView ([Official API - CygnusWebStorage.deleteOrigin](https://developer.android.com/reference/android/webkit/CygnusWebStorage#deleteOrigin(java.lang.String)))
  ///
  ///**Parameters - Officially Supported Platforms/Implementations**:
  ///- [origin]: all platforms
  ///
  ///Use the [CygnusPlatformWebStorageManager.isMethodSupported] method to check if this method is supported at runtime.
  ///{@endtemplate}
  deleteOrigin,

  ///Can be used to check if the [CygnusPlatformWebStorageManager.fetchDataRecords] method is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusPlatformWebStorageManager.fetchDataRecords.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- iOS WKWebView 9.0+ ([Official API - WKWebsiteDataStore.fetchDataRecords](https://developer.apple.com/documentation/webkit/wkwebsitedatastore/1532932-fetchdatarecords))
  ///- Linux WPE WebKit ([Official API - webkit_website_data_manager_fetch](https://wpewebkit.org/reference/stable/wpe-webkit-2.0/method.WebsiteDataManager.fetch.html))
  ///- macOS WKWebView ([Official API - WKWebsiteDataStore.fetchDataRecords](https://developer.apple.com/documentation/webkit/wkwebsitedatastore/1532932-fetchdatarecords))
  ///
  ///**Parameters - Officially Supported Platforms/Implementations**:
  ///- [dataTypes]: all platforms
  ///
  ///Use the [CygnusPlatformWebStorageManager.isMethodSupported] method to check if this method is supported at runtime.
  ///{@endtemplate}
  fetchDataRecords,

  ///Can be used to check if the [CygnusPlatformWebStorageManager.getOrigins] method is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusPlatformWebStorageManager.getOrigins.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView ([Official API - CygnusWebStorage.getOrigins](https://developer.android.com/reference/android/webkit/CygnusWebStorage#getOrigins(android.webkit.ValueCallback%3Cjava.util.Map%3E)))
  ///
  ///Use the [CygnusPlatformWebStorageManager.isMethodSupported] method to check if this method is supported at runtime.
  ///{@endtemplate}
  getOrigins,

  ///Can be used to check if the [CygnusPlatformWebStorageManager.getQuotaForOrigin] method is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusPlatformWebStorageManager.getQuotaForOrigin.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView ([Official API - CygnusWebStorage.getQuotaForOrigin](https://developer.android.com/reference/android/webkit/CygnusWebStorage#getQuotaForOrigin(java.lang.String,%20android.webkit.ValueCallback%3Cjava.lang.Long%3E)))
  ///
  ///**Parameters - Officially Supported Platforms/Implementations**:
  ///- [origin]: all platforms
  ///
  ///Use the [CygnusPlatformWebStorageManager.isMethodSupported] method to check if this method is supported at runtime.
  ///{@endtemplate}
  getQuotaForOrigin,

  ///Can be used to check if the [CygnusPlatformWebStorageManager.getUsageForOrigin] method is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusPlatformWebStorageManager.getUsageForOrigin.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView ([Official API - CygnusWebStorage.getUsageForOrigin](https://developer.android.com/reference/android/webkit/CygnusWebStorage#getUsageForOrigin(java.lang.String,%20android.webkit.ValueCallback%3Cjava.lang.Long%3E)))
  ///
  ///**Parameters - Officially Supported Platforms/Implementations**:
  ///- [origin]: all platforms
  ///
  ///Use the [CygnusPlatformWebStorageManager.isMethodSupported] method to check if this method is supported at runtime.
  ///{@endtemplate}
  getUsageForOrigin,

  ///Can be used to check if the [CygnusPlatformWebStorageManager.removeDataFor] method is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusPlatformWebStorageManager.removeDataFor.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- iOS WKWebView 9.0+ ([Official API - WKWebsiteDataStore.removeData](https://developer.apple.com/documentation/webkit/wkwebsitedatastore/1532936-removedata))
  ///- Linux WPE WebKit ([Official API - webkit_website_data_manager_remove](https://wpewebkit.org/reference/stable/wpe-webkit-2.0/method.WebsiteDataManager.remove.html))
  ///- macOS WKWebView ([Official API - WKWebsiteDataStore.removeData](https://developer.apple.com/documentation/webkit/wkwebsitedatastore/1532936-removedata))
  ///
  ///**Parameters - Officially Supported Platforms/Implementations**:
  ///- [dataTypes]: all platforms
  ///- [dataRecords]: all platforms
  ///
  ///Use the [CygnusPlatformWebStorageManager.isMethodSupported] method to check if this method is supported at runtime.
  ///{@endtemplate}
  removeDataFor,

  ///Can be used to check if the [CygnusPlatformWebStorageManager.removeDataModifiedSince] method is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusPlatformWebStorageManager.removeDataModifiedSince.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- iOS WKWebView 9.0+ ([Official API - WKWebsiteDataStore.removeData](https://developer.apple.com/documentation/webkit/wkwebsitedatastore/1532938-removedata))
  ///- Linux WPE WebKit ([Official API - webkit_website_data_manager_clear](https://wpewebkit.org/reference/stable/wpe-webkit-2.0/method.WebsiteDataManager.clear.html))
  ///- macOS WKWebView ([Official API - WKWebsiteDataStore.removeData](https://developer.apple.com/documentation/webkit/wkwebsitedatastore/1532938-removedata))
  ///
  ///**Parameters - Officially Supported Platforms/Implementations**:
  ///- [dataTypes]: all platforms
  ///- [date]: all platforms
  ///
  ///Use the [CygnusPlatformWebStorageManager.isMethodSupported] method to check if this method is supported at runtime.
  ///{@endtemplate}
  removeDataModifiedSince,
}

extension _CygnusPlatformWebStorageManagerMethodSupported
    on CygnusPlatformWebStorageManager {
  static bool isMethodSupported(
    CygnusPlatformWebStorageManagerMethod method, {
    TargetPlatform? platform,
  }) {
    switch (method) {
      case CygnusPlatformWebStorageManagerMethod.deleteAllData:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [
              TargetPlatform.android,
            ].contains(platform ?? defaultTargetPlatform);
      case CygnusPlatformWebStorageManagerMethod.deleteOrigin:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [
              TargetPlatform.android,
            ].contains(platform ?? defaultTargetPlatform);
      case CygnusPlatformWebStorageManagerMethod.fetchDataRecords:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [
              TargetPlatform.iOS,
              TargetPlatform.linux,
              TargetPlatform.macOS,
            ].contains(platform ?? defaultTargetPlatform);
      case CygnusPlatformWebStorageManagerMethod.getOrigins:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [
              TargetPlatform.android,
            ].contains(platform ?? defaultTargetPlatform);
      case CygnusPlatformWebStorageManagerMethod.getQuotaForOrigin:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [
              TargetPlatform.android,
            ].contains(platform ?? defaultTargetPlatform);
      case CygnusPlatformWebStorageManagerMethod.getUsageForOrigin:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [
              TargetPlatform.android,
            ].contains(platform ?? defaultTargetPlatform);
      case CygnusPlatformWebStorageManagerMethod.removeDataFor:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [
              TargetPlatform.iOS,
              TargetPlatform.linux,
              TargetPlatform.macOS,
            ].contains(platform ?? defaultTargetPlatform);
      case CygnusPlatformWebStorageManagerMethod.removeDataModifiedSince:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [
              TargetPlatform.iOS,
              TargetPlatform.linux,
              TargetPlatform.macOS,
            ].contains(platform ?? defaultTargetPlatform);
    }
  }
}
