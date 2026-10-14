// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'platform_web_storage.dart';

// **************************************************************************
// SupportedPlatformsGenerator
// **************************************************************************

extension _CygnusPlatformWebStorageCreationParamsClassSupported
    on CygnusPlatformWebStorageCreationParams {
  ///{@template cygnus_core.CygnusPlatformWebStorageCreationParams.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView
  ///- iOS WKWebView
  ///- macOS WKWebView
  ///- Web \<iframe\> but requires same origin
  ///- Windows WebView2
  ///- Linux WPE WebKit
  ///
  ///Use the [CygnusPlatformWebStorageCreationParams.isClassSupported] method to check if this class is supported at runtime.
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

///List of [CygnusPlatformWebStorageCreationParams]'s properties that can be used to check i they are supported or not by the current platform.
enum CygnusPlatformWebStorageCreationParamsProperty {
  ///Can be used to check if the [CygnusPlatformWebStorageCreationParams.localStorage] property is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusPlatformWebStorageCreationParams.localStorage.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView
  ///- iOS WKWebView
  ///- macOS WKWebView
  ///- Web \<iframe\> but requires same origin
  ///- Windows WebView2
  ///- Linux WPE WebKit
  ///
  ///Use the [CygnusPlatformWebStorageCreationParams.isPropertySupported] method to check if this property is supported at runtime.
  ///{@endtemplate}
  localStorage,

  ///Can be used to check if the [CygnusPlatformWebStorageCreationParams.sessionStorage] property is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusPlatformWebStorageCreationParams.sessionStorage.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView
  ///- iOS WKWebView
  ///- macOS WKWebView
  ///- Web \<iframe\> but requires same origin
  ///- Windows WebView2
  ///- Linux WPE WebKit
  ///
  ///Use the [CygnusPlatformWebStorageCreationParams.isPropertySupported] method to check if this property is supported at runtime.
  ///{@endtemplate}
  sessionStorage,
}

extension _CygnusPlatformWebStorageCreationParamsPropertySupported
    on CygnusPlatformWebStorageCreationParams {
  static bool isPropertySupported(
    CygnusPlatformWebStorageCreationParamsProperty property, {
    TargetPlatform? platform,
  }) {
    switch (property) {
      case CygnusPlatformWebStorageCreationParamsProperty.localStorage:
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
      case CygnusPlatformWebStorageCreationParamsProperty.sessionStorage:
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
}

extension _CygnusPlatformWebStorageClassSupported on CygnusPlatformWebStorage {
  ///{@template cygnus_core.CygnusPlatformWebStorage.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView
  ///- iOS WKWebView
  ///- macOS WKWebView
  ///- Web \<iframe\> but requires same origin
  ///- Windows WebView2
  ///- Linux WPE WebKit
  ///
  ///Use the [CygnusPlatformWebStorage.isClassSupported] method to check if this class is supported at runtime.
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

///List of [CygnusPlatformWebStorage]'s properties that can be used to check i they are supported or not by the current platform.
enum CygnusPlatformWebStorageProperty {
  ///Can be used to check if the [CygnusPlatformWebStorage.localStorage] property is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusPlatformWebStorage.localStorage.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView
  ///- iOS WKWebView
  ///- macOS WKWebView
  ///- Web \<iframe\> but requires same origin
  ///- Windows WebView2
  ///- Linux WPE WebKit
  ///
  ///Use the [CygnusPlatformWebStorage.isPropertySupported] method to check if this property is supported at runtime.
  ///{@endtemplate}
  localStorage,

  ///Can be used to check if the [CygnusPlatformWebStorage.sessionStorage] property is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusPlatformWebStorage.sessionStorage.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView
  ///- iOS WKWebView
  ///- macOS WKWebView
  ///- Web \<iframe\> but requires same origin
  ///- Windows WebView2
  ///- Linux WPE WebKit
  ///
  ///Use the [CygnusPlatformWebStorage.isPropertySupported] method to check if this property is supported at runtime.
  ///{@endtemplate}
  sessionStorage,
}

extension _CygnusPlatformWebStoragePropertySupported
    on CygnusPlatformWebStorage {
  static bool isPropertySupported(
    CygnusPlatformWebStorageProperty property, {
    TargetPlatform? platform,
  }) {
    switch (property) {
      case CygnusPlatformWebStorageProperty.localStorage:
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
      case CygnusPlatformWebStorageProperty.sessionStorage:
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
}

///List of [CygnusPlatformWebStorage]'s methods that can be used to check if they are supported or not by the current platform.
enum CygnusPlatformWebStorageMethod {
  ///Can be used to check if the [CygnusPlatformWebStorage.dispose] method is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusPlatformWebStorage.dispose.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView
  ///- iOS WKWebView
  ///- macOS WKWebView
  ///- Web \<iframe\> but requires same origin
  ///- Windows WebView2
  ///- Linux WPE WebKit
  ///
  ///Use the [CygnusPlatformWebStorage.isMethodSupported] method to check if this method is supported at runtime.
  ///{@endtemplate}
  dispose,
}

extension _CygnusPlatformWebStorageMethodSupported on CygnusPlatformWebStorage {
  static bool isMethodSupported(
    CygnusPlatformWebStorageMethod method, {
    TargetPlatform? platform,
  }) {
    switch (method) {
      case CygnusPlatformWebStorageMethod.dispose:
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
}

extension _CygnusPlatformStorageCreationParamsClassSupported
    on CygnusPlatformStorageCreationParams {
  ///{@template cygnus_core.CygnusPlatformStorageCreationParams.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView
  ///- iOS WKWebView
  ///- macOS WKWebView
  ///- Web \<iframe\> but requires same origin
  ///- Windows WebView2
  ///- Linux WPE WebKit
  ///
  ///Use the [CygnusPlatformStorageCreationParams.isClassSupported] method to check if this class is supported at runtime.
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

///List of [CygnusPlatformStorageCreationParams]'s properties that can be used to check i they are supported or not by the current platform.
enum CygnusPlatformStorageCreationParamsProperty {
  ///Can be used to check if the [CygnusPlatformStorageCreationParams.controller] property is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusPlatformStorageCreationParams.controller.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView
  ///- iOS WKWebView
  ///- macOS WKWebView
  ///- Web \<iframe\> but requires same origin
  ///- Windows WebView2
  ///- Linux WPE WebKit
  ///
  ///Use the [CygnusPlatformStorageCreationParams.isPropertySupported] method to check if this property is supported at runtime.
  ///{@endtemplate}
  controller,

  ///Can be used to check if the [CygnusPlatformStorageCreationParams.webStorageType] property is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusPlatformStorageCreationParams.webStorageType.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView
  ///- iOS WKWebView
  ///- macOS WKWebView
  ///- Web \<iframe\> but requires same origin
  ///- Windows WebView2
  ///- Linux WPE WebKit
  ///
  ///Use the [CygnusPlatformStorageCreationParams.isPropertySupported] method to check if this property is supported at runtime.
  ///{@endtemplate}
  webStorageType,
}

extension _CygnusPlatformStorageCreationParamsPropertySupported
    on CygnusPlatformStorageCreationParams {
  static bool isPropertySupported(
    CygnusPlatformStorageCreationParamsProperty property, {
    TargetPlatform? platform,
  }) {
    switch (property) {
      case CygnusPlatformStorageCreationParamsProperty.controller:
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
      case CygnusPlatformStorageCreationParamsProperty.webStorageType:
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
}

extension _CygnusPlatformLocalStorageCreationParamsClassSupported
    on CygnusPlatformLocalStorageCreationParams {
  ///{@template cygnus_core.CygnusPlatformLocalStorageCreationParams.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView
  ///- iOS WKWebView
  ///- macOS WKWebView
  ///- Web \<iframe\> but requires same origin
  ///- Windows WebView2
  ///- Linux WPE WebKit
  ///
  ///Use the [CygnusPlatformLocalStorageCreationParams.isClassSupported] method to check if this class is supported at runtime.
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

extension _CygnusPlatformLocalStorageClassSupported
    on CygnusPlatformLocalStorage {
  ///{@template cygnus_core.CygnusPlatformLocalStorage.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView
  ///- iOS WKWebView
  ///- macOS WKWebView
  ///- Web \<iframe\> but requires same origin
  ///- Windows WebView2
  ///- Linux WPE WebKit
  ///
  ///Use the [CygnusPlatformLocalStorage.isClassSupported] method to check if this class is supported at runtime.
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

///List of [CygnusPlatformLocalStorage]'s methods that can be used to check if they are supported or not by the current platform.
enum CygnusPlatformLocalStorageMethod {
  ///Can be used to check if the [CygnusPlatformLocalStorage.clear] method is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusPlatformLocalStorage.clear.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView
  ///- iOS WKWebView
  ///- macOS WKWebView
  ///- Web \<iframe\> but requires same origin
  ///- Windows WebView2
  ///- Linux WPE WebKit
  ///
  ///Use the [CygnusPlatformLocalStorage.isMethodSupported] method to check if this method is supported at runtime.
  ///{@endtemplate}
  clear,

  ///Can be used to check if the [CygnusPlatformLocalStorage.dispose] method is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusPlatformLocalStorage.dispose.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView
  ///- iOS WKWebView
  ///- macOS WKWebView
  ///- Web \<iframe\> but requires same origin
  ///- Windows WebView2
  ///- Linux WPE WebKit
  ///
  ///Use the [CygnusPlatformLocalStorage.isMethodSupported] method to check if this method is supported at runtime.
  ///{@endtemplate}
  dispose,

  ///Can be used to check if the [CygnusPlatformLocalStorage.getItem] method is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusPlatformLocalStorage.getItem.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView
  ///- iOS WKWebView
  ///- macOS WKWebView
  ///- Web \<iframe\> but requires same origin
  ///- Windows WebView2
  ///- Linux WPE WebKit
  ///
  ///**Parameters - Officially Supported Platforms/Implementations**:
  ///- [key]: all platforms
  ///
  ///Use the [CygnusPlatformLocalStorage.isMethodSupported] method to check if this method is supported at runtime.
  ///{@endtemplate}
  getItem,

  ///Can be used to check if the [CygnusPlatformLocalStorage.getItems] method is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusPlatformLocalStorage.getItems.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView
  ///- iOS WKWebView
  ///- macOS WKWebView
  ///- Web \<iframe\> but requires same origin
  ///- Windows WebView2
  ///- Linux WPE WebKit
  ///
  ///Use the [CygnusPlatformLocalStorage.isMethodSupported] method to check if this method is supported at runtime.
  ///{@endtemplate}
  getItems,

  ///Can be used to check if the [CygnusPlatformLocalStorage.key] method is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusPlatformLocalStorage.key.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView
  ///- iOS WKWebView
  ///- macOS WKWebView
  ///- Web \<iframe\> but requires same origin
  ///- Windows WebView2
  ///- Linux WPE WebKit
  ///
  ///**Parameters - Officially Supported Platforms/Implementations**:
  ///- [index]: all platforms
  ///
  ///Use the [CygnusPlatformLocalStorage.isMethodSupported] method to check if this method is supported at runtime.
  ///{@endtemplate}
  key,

  ///Can be used to check if the [CygnusPlatformLocalStorage.length] method is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusPlatformLocalStorage.length.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView
  ///- iOS WKWebView
  ///- macOS WKWebView
  ///- Web \<iframe\> but requires same origin
  ///- Windows WebView2
  ///- Linux WPE WebKit
  ///
  ///Use the [CygnusPlatformLocalStorage.isMethodSupported] method to check if this method is supported at runtime.
  ///{@endtemplate}
  length,

  ///Can be used to check if the [CygnusPlatformLocalStorage.removeItem] method is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusPlatformLocalStorage.removeItem.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView
  ///- iOS WKWebView
  ///- macOS WKWebView
  ///- Web \<iframe\> but requires same origin
  ///- Windows WebView2
  ///- Linux WPE WebKit
  ///
  ///**Parameters - Officially Supported Platforms/Implementations**:
  ///- [key]: all platforms
  ///
  ///Use the [CygnusPlatformLocalStorage.isMethodSupported] method to check if this method is supported at runtime.
  ///{@endtemplate}
  removeItem,

  ///Can be used to check if the [CygnusPlatformLocalStorage.setItem] method is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusPlatformLocalStorage.setItem.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView
  ///- iOS WKWebView
  ///- macOS WKWebView
  ///- Web \<iframe\> but requires same origin
  ///- Windows WebView2
  ///- Linux WPE WebKit
  ///
  ///**Parameters - Officially Supported Platforms/Implementations**:
  ///- [key]: all platforms
  ///- [value]: all platforms
  ///
  ///Use the [CygnusPlatformLocalStorage.isMethodSupported] method to check if this method is supported at runtime.
  ///{@endtemplate}
  setItem,
}

extension _CygnusPlatformLocalStorageMethodSupported
    on CygnusPlatformLocalStorage {
  static bool isMethodSupported(
    CygnusPlatformLocalStorageMethod method, {
    TargetPlatform? platform,
  }) {
    switch (method) {
      case CygnusPlatformLocalStorageMethod.clear:
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
      case CygnusPlatformLocalStorageMethod.dispose:
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
      case CygnusPlatformLocalStorageMethod.getItem:
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
      case CygnusPlatformLocalStorageMethod.getItems:
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
      case CygnusPlatformLocalStorageMethod.key:
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
      case CygnusPlatformLocalStorageMethod.length:
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
      case CygnusPlatformLocalStorageMethod.removeItem:
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
      case CygnusPlatformLocalStorageMethod.setItem:
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
}

extension _CygnusPlatformSessionStorageCreationParamsClassSupported
    on CygnusPlatformSessionStorageCreationParams {
  ///{@template cygnus_core.CygnusPlatformSessionStorageCreationParams.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView
  ///- iOS WKWebView
  ///- macOS WKWebView
  ///- Web \<iframe\> but requires same origin
  ///- Windows WebView2
  ///- Linux WPE WebKit
  ///
  ///Use the [CygnusPlatformSessionStorageCreationParams.isClassSupported] method to check if this class is supported at runtime.
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

extension _CygnusPlatformSessionStorageClassSupported
    on CygnusPlatformSessionStorage {
  ///{@template cygnus_core.CygnusPlatformSessionStorage.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView
  ///- iOS WKWebView
  ///- macOS WKWebView
  ///- Web \<iframe\> but requires same origin
  ///- Windows WebView2
  ///- Linux WPE WebKit
  ///
  ///Use the [CygnusPlatformSessionStorage.isClassSupported] method to check if this class is supported at runtime.
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

///List of [CygnusPlatformSessionStorage]'s methods that can be used to check if they are supported or not by the current platform.
enum CygnusPlatformSessionStorageMethod {
  ///Can be used to check if the [CygnusPlatformSessionStorage.clear] method is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusPlatformSessionStorage.clear.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView
  ///- iOS WKWebView
  ///- macOS WKWebView
  ///- Web \<iframe\> but requires same origin
  ///- Windows WebView2
  ///- Linux WPE WebKit
  ///
  ///Use the [CygnusPlatformSessionStorage.isMethodSupported] method to check if this method is supported at runtime.
  ///{@endtemplate}
  clear,

  ///Can be used to check if the [CygnusPlatformSessionStorage.dispose] method is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusPlatformSessionStorage.dispose.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView
  ///- iOS WKWebView
  ///- macOS WKWebView
  ///- Web \<iframe\> but requires same origin
  ///- Windows WebView2
  ///- Linux WPE WebKit
  ///
  ///Use the [CygnusPlatformSessionStorage.isMethodSupported] method to check if this method is supported at runtime.
  ///{@endtemplate}
  dispose,

  ///Can be used to check if the [CygnusPlatformSessionStorage.getItem] method is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusPlatformSessionStorage.getItem.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView
  ///- iOS WKWebView
  ///- macOS WKWebView
  ///- Web \<iframe\> but requires same origin
  ///- Windows WebView2
  ///- Linux WPE WebKit
  ///
  ///**Parameters - Officially Supported Platforms/Implementations**:
  ///- [key]: all platforms
  ///
  ///Use the [CygnusPlatformSessionStorage.isMethodSupported] method to check if this method is supported at runtime.
  ///{@endtemplate}
  getItem,

  ///Can be used to check if the [CygnusPlatformSessionStorage.getItems] method is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusPlatformSessionStorage.getItems.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView
  ///- iOS WKWebView
  ///- macOS WKWebView
  ///- Web \<iframe\> but requires same origin
  ///- Windows WebView2
  ///- Linux WPE WebKit
  ///
  ///Use the [CygnusPlatformSessionStorage.isMethodSupported] method to check if this method is supported at runtime.
  ///{@endtemplate}
  getItems,

  ///Can be used to check if the [CygnusPlatformSessionStorage.key] method is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusPlatformSessionStorage.key.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView
  ///- iOS WKWebView
  ///- macOS WKWebView
  ///- Web \<iframe\> but requires same origin
  ///- Windows WebView2
  ///- Linux WPE WebKit
  ///
  ///**Parameters - Officially Supported Platforms/Implementations**:
  ///- [index]: all platforms
  ///
  ///Use the [CygnusPlatformSessionStorage.isMethodSupported] method to check if this method is supported at runtime.
  ///{@endtemplate}
  key,

  ///Can be used to check if the [CygnusPlatformSessionStorage.length] method is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusPlatformSessionStorage.length.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView
  ///- iOS WKWebView
  ///- macOS WKWebView
  ///- Web \<iframe\> but requires same origin
  ///- Windows WebView2
  ///- Linux WPE WebKit
  ///
  ///Use the [CygnusPlatformSessionStorage.isMethodSupported] method to check if this method is supported at runtime.
  ///{@endtemplate}
  length,

  ///Can be used to check if the [CygnusPlatformSessionStorage.removeItem] method is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusPlatformSessionStorage.removeItem.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView
  ///- iOS WKWebView
  ///- macOS WKWebView
  ///- Web \<iframe\> but requires same origin
  ///- Windows WebView2
  ///- Linux WPE WebKit
  ///
  ///**Parameters - Officially Supported Platforms/Implementations**:
  ///- [key]: all platforms
  ///
  ///Use the [CygnusPlatformSessionStorage.isMethodSupported] method to check if this method is supported at runtime.
  ///{@endtemplate}
  removeItem,

  ///Can be used to check if the [CygnusPlatformSessionStorage.setItem] method is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusPlatformSessionStorage.setItem.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView
  ///- iOS WKWebView
  ///- macOS WKWebView
  ///- Web \<iframe\> but requires same origin
  ///- Windows WebView2
  ///- Linux WPE WebKit
  ///
  ///**Parameters - Officially Supported Platforms/Implementations**:
  ///- [key]: all platforms
  ///- [value]: all platforms
  ///
  ///Use the [CygnusPlatformSessionStorage.isMethodSupported] method to check if this method is supported at runtime.
  ///{@endtemplate}
  setItem,
}

extension _CygnusPlatformSessionStorageMethodSupported
    on CygnusPlatformSessionStorage {
  static bool isMethodSupported(
    CygnusPlatformSessionStorageMethod method, {
    TargetPlatform? platform,
  }) {
    switch (method) {
      case CygnusPlatformSessionStorageMethod.clear:
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
      case CygnusPlatformSessionStorageMethod.dispose:
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
      case CygnusPlatformSessionStorageMethod.getItem:
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
      case CygnusPlatformSessionStorageMethod.getItems:
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
      case CygnusPlatformSessionStorageMethod.key:
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
      case CygnusPlatformSessionStorageMethod.length:
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
      case CygnusPlatformSessionStorageMethod.removeItem:
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
      case CygnusPlatformSessionStorageMethod.setItem:
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
}
