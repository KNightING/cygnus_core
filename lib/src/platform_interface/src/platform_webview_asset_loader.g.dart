// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'platform_webview_asset_loader.dart';

// **************************************************************************
// ExchangeableObjectGenerator
// **************************************************************************

///{@template cygnus_core.CygnusWebViewAssetLoader}
///Helper class to load local files including application's static assets and resources using http(s):// URLs inside a `WebView` class.
///Loading local files using web-like URLs instead of `file://` is desirable as it is compatible with the Same-Origin policy.
///
///For more context about application's assets and resources and how to normally access them please refer to
///[Android Developer Docs: App resources overview](https://developer.android.com/guide/topics/resources/providing-resources).
///
///Using http(s):// URLs to access local resources may conflict with a real website.
///This means that local files should only be hosted on domains your organization owns
///(at paths reserved for this purpose) or the default domain reserved for this: `appassets.androidplatform.net`.
///{@endtemplate}
///
///{@macro cygnus_core.CygnusWebViewAssetLoader.supported_platforms}
///
///**Officially Supported Platforms/Implementations**:
///- Android WebView
class CygnusWebViewAssetLoader {
  ///An unused domain reserved for Android applications to intercept requests for app assets.
  ///
  ///It is used by default unless the user specified a different domain.
  static final String DEFAULT_DOMAIN = "appassets.androidplatform.net";

  ///Set the domain under which app assets can be accessed. The default domain is `appassets.androidplatform.net`.
  String? domain;

  ///Allow using the HTTP scheme in addition to HTTPS. The default is to not allow HTTP.
  bool? httpAllowed;

  ///List of registered path handlers.
  ///
  ///[CygnusWebViewAssetLoader] will try Path Handlers in the order they're registered,
  ///and will use whichever is the first to return a non-null.
  List<CygnusPlatformPathHandler>? pathHandlers;

  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView
  CygnusWebViewAssetLoader({this.domain, this.httpAllowed, this.pathHandlers});

  ///Gets a possible [CygnusWebViewAssetLoader] instance from a [Map] value.
  static CygnusWebViewAssetLoader? fromMap(
    Map<String, dynamic>? map, {
    CygnusEnumMethod? enumMethod,
  }) {
    if (map == null) {
      return null;
    }
    final instance = CygnusWebViewAssetLoader(
      domain: map['domain'],
      httpAllowed: map['httpAllowed'],
      pathHandlers: map['pathHandlers'] != null
          ? List<CygnusPlatformPathHandler>.from(
              map['pathHandlers'].map((e) => e),
            )
          : null,
    );
    return instance;
  }

  ///Converts instance to a map.
  Map<String, dynamic> toMap({CygnusEnumMethod? enumMethod}) {
    return {
      "domain": domain,
      "httpAllowed": httpAllowed,
      "pathHandlers": pathHandlers
          ?.map((e) => e.toMap(enumMethod: enumMethod))
          .toList(),
    };
  }

  ///Converts instance to a map.
  Map<String, dynamic> toJson() {
    return toMap();
  }

  ///Returns a copy of CygnusWebViewAssetLoader.
  CygnusWebViewAssetLoader copy() {
    return CygnusWebViewAssetLoader.fromMap(toMap()) ??
        CygnusWebViewAssetLoader();
  }

  @override
  String toString() {
    return 'CygnusWebViewAssetLoader{domain: $domain, httpAllowed: $httpAllowed, pathHandlers: $pathHandlers}';
  }
}

// **************************************************************************
// SupportedPlatformsGenerator
// **************************************************************************

extension _CygnusPlatformPathHandlerCreationParamsClassSupported
    on CygnusPlatformPathHandlerCreationParams {
  ///{@template cygnus_core.CygnusPlatformPathHandlerCreationParams.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView
  ///
  ///Use the [CygnusPlatformPathHandlerCreationParams.isClassSupported] method to check if this class is supported at runtime.
  ///{@endtemplate}
  static bool isClassSupported({TargetPlatform? platform}) {
    return ((kIsWeb && platform != null) || !kIsWeb) &&
        [TargetPlatform.android].contains(platform ?? defaultTargetPlatform);
  }
}

extension _CygnusPlatformAssetsPathHandlerCreationParamsClassSupported
    on CygnusPlatformAssetsPathHandlerCreationParams {
  ///{@template cygnus_core.CygnusPlatformAssetsPathHandlerCreationParams.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView
  ///
  ///Use the [CygnusPlatformAssetsPathHandlerCreationParams.isClassSupported] method to check if this class is supported at runtime.
  ///{@endtemplate}
  static bool isClassSupported({TargetPlatform? platform}) {
    return ((kIsWeb && platform != null) || !kIsWeb) &&
        [TargetPlatform.android].contains(platform ?? defaultTargetPlatform);
  }
}

extension _CygnusPlatformAssetsPathHandlerClassSupported
    on CygnusPlatformAssetsPathHandler {
  ///{@template cygnus_core.CygnusPlatformAssetsPathHandler.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView
  ///
  ///Use the [CygnusPlatformAssetsPathHandler.isClassSupported] method to check if this class is supported at runtime.
  ///{@endtemplate}
  static bool isClassSupported({TargetPlatform? platform}) {
    return ((kIsWeb && platform != null) || !kIsWeb) &&
        [TargetPlatform.android].contains(platform ?? defaultTargetPlatform);
  }
}

extension _CygnusPlatformResourcesPathHandlerCreationParamsClassSupported
    on CygnusPlatformResourcesPathHandlerCreationParams {
  ///{@template cygnus_core.CygnusPlatformResourcesPathHandlerCreationParams.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView
  ///
  ///Use the [CygnusPlatformResourcesPathHandlerCreationParams.isClassSupported] method to check if this class is supported at runtime.
  ///{@endtemplate}
  static bool isClassSupported({TargetPlatform? platform}) {
    return ((kIsWeb && platform != null) || !kIsWeb) &&
        [TargetPlatform.android].contains(platform ?? defaultTargetPlatform);
  }
}

extension _CygnusPlatformResourcesPathHandlerClassSupported
    on CygnusPlatformResourcesPathHandler {
  ///{@template cygnus_core.CygnusPlatformResourcesPathHandler.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView
  ///
  ///Use the [CygnusPlatformResourcesPathHandler.isClassSupported] method to check if this class is supported at runtime.
  ///{@endtemplate}
  static bool isClassSupported({TargetPlatform? platform}) {
    return ((kIsWeb && platform != null) || !kIsWeb) &&
        [TargetPlatform.android].contains(platform ?? defaultTargetPlatform);
  }
}

extension _CygnusPlatformInternalStoragePathHandlerCreationParamsClassSupported
    on CygnusPlatformInternalStoragePathHandlerCreationParams {
  ///{@template cygnus_core.CygnusPlatformInternalStoragePathHandlerCreationParams.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView
  ///
  ///Use the [CygnusPlatformInternalStoragePathHandlerCreationParams.isClassSupported] method to check if this class is supported at runtime.
  ///{@endtemplate}
  static bool isClassSupported({TargetPlatform? platform}) {
    return ((kIsWeb && platform != null) || !kIsWeb) &&
        [TargetPlatform.android].contains(platform ?? defaultTargetPlatform);
  }
}

extension _CygnusPlatformInternalStoragePathHandlerClassSupported
    on CygnusPlatformInternalStoragePathHandler {
  ///{@template cygnus_core.CygnusPlatformInternalStoragePathHandler.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView
  ///
  ///Use the [CygnusPlatformInternalStoragePathHandler.isClassSupported] method to check if this class is supported at runtime.
  ///{@endtemplate}
  static bool isClassSupported({TargetPlatform? platform}) {
    return ((kIsWeb && platform != null) || !kIsWeb) &&
        [TargetPlatform.android].contains(platform ?? defaultTargetPlatform);
  }
}

extension _CygnusPlatformCustomPathHandlerCreationParamsClassSupported
    on CygnusPlatformCustomPathHandlerCreationParams {
  ///{@template cygnus_core.CygnusPlatformCustomPathHandlerCreationParams.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView
  ///
  ///Use the [CygnusPlatformCustomPathHandlerCreationParams.isClassSupported] method to check if this class is supported at runtime.
  ///{@endtemplate}
  static bool isClassSupported({TargetPlatform? platform}) {
    return ((kIsWeb && platform != null) || !kIsWeb) &&
        [TargetPlatform.android].contains(platform ?? defaultTargetPlatform);
  }
}

extension _CygnusPlatformCustomPathHandlerClassSupported
    on CygnusPlatformCustomPathHandler {
  ///{@template cygnus_core.CygnusPlatformCustomPathHandler.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView
  ///
  ///Use the [CygnusPlatformCustomPathHandler.isClassSupported] method to check if this class is supported at runtime.
  ///{@endtemplate}
  static bool isClassSupported({TargetPlatform? platform}) {
    return ((kIsWeb && platform != null) || !kIsWeb) &&
        [TargetPlatform.android].contains(platform ?? defaultTargetPlatform);
  }
}
