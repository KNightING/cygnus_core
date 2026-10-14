// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'platform_process_global_config.dart';

// **************************************************************************
// ExchangeableObjectGenerator
// **************************************************************************

///{@template cygnus_core.CygnusProcessGlobalConfigSettings}
///Class that represents the settings used to configure the [CygnusPlatformProcessGlobalConfig].
///{@endtemplate}
///
///{@macro cygnus_core.CygnusProcessGlobalConfigSettings.supported_platforms}
///
///**Officially Supported Platforms/Implementations**:
///- Android WebView ([Official API - CygnusProcessGlobalConfig.apply](https://developer.android.com/reference/androidx/webkit/CygnusProcessGlobalConfig#apply(androidx.webkit.CygnusProcessGlobalConfig)))
class CygnusProcessGlobalConfigSettings {
  ///The directory name suffix to be used for the current process.
  ///Must not contain a path separator and should not be empty.
  ///
  ///Define the directory used to store WebView data for the current process.
  ///The provided suffix will be used when constructing data and cache directory paths.
  ///If this API is not called, no suffix will be used.
  ///Each directory can be used by only one process in the application.
  ///If more than one process in an app wishes to use WebView,
  ///only one process can use the default directory,
  ///and other processes must call this API to define a unique suffix.
  ///
  ///This means that different processes in the same application cannot directly share `WebView`-related data,
  ///since the data directories must be distinct.
  ///Applications that use this API may have to explicitly pass data between processes.
  ///For example, login cookies may have to be copied from one process's cookie jar to the other using [CygnusPlatformCookieManager] if both processes' WebViews are intended to be logged in.
  ///
  ///Most applications should simply ensure that all components of the app that rely
  ///on WebView are in the same process, to avoid needing multiple data directories.
  ///The [CygnusPlatformWebViewController.disableWebView] method can be used to ensure that the other processes do not use WebView by accident in this case.
  ///
  ///{@macro cygnus_core.CygnusProcessGlobalConfigSettings.dataDirectorySuffix.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView:
  ///    - Available only if [CygnusWebViewFeature.STARTUP_FEATURE_SET_DATA_DIRECTORY_SUFFIX] feature is supported.
  String? dataDirectorySuffix;

  ///Set the base directories that `WebView` will use for the current process.
  ///If this method is not used, `WebView` uses the default base paths defined by the Android framework.
  ///
  ///WebView will create and use a subdirectory under each of the base paths supplied to this method.
  ///
  ///This method can be used in conjunction with setDataDirectorySuffix.
  ///A different subdirectory is created for each suffix.
  ///
  ///The base paths must be absolute paths.
  ///
  ///The data directory must not be under the Android cache directory,
  ///as Android may delete cache files when disk space is low and WebView may not function properly if this occurs.
  ///Refer to [this link](https://developer.android.com/training/data-storage/app-specific#internal-remove-cache).
  ///
  ///If the specified directories already exist then they must be readable and writable by the current process.
  ///If they do not already exist, `WebView` will attempt to create them during initialization, along with any missing parent directories.
  ///In such a case, the directory in which `WebView` creates missing directories must be readable and writable by the current process.
  ///
  ///{@macro cygnus_core.CygnusProcessGlobalConfigSettings.directoryBasePaths.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView:
  ///    - Available only if [CygnusWebViewFeature.STARTUP_FEATURE_SET_DIRECTORY_BASE_PATHS] feature is supported.
  CygnusProcessGlobalConfigDirectoryBasePaths? directoryBasePaths;

  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView ([Official API - CygnusProcessGlobalConfig.apply](https://developer.android.com/reference/androidx/webkit/CygnusProcessGlobalConfig#apply(androidx.webkit.CygnusProcessGlobalConfig)))
  CygnusProcessGlobalConfigSettings({
    this.dataDirectorySuffix,
    this.directoryBasePaths,
  });

  ///Gets a possible [CygnusProcessGlobalConfigSettings] instance from a [Map] value.
  static CygnusProcessGlobalConfigSettings? fromMap(
    Map<String, dynamic>? map, {
    CygnusEnumMethod? enumMethod,
  }) {
    if (map == null) {
      return null;
    }
    final instance = CygnusProcessGlobalConfigSettings(
      dataDirectorySuffix: map['dataDirectorySuffix'],
      directoryBasePaths: CygnusProcessGlobalConfigDirectoryBasePaths.fromMap(
        map['directoryBasePaths']?.cast<String, dynamic>(),
        enumMethod: enumMethod,
      ),
    );
    return instance;
  }

  ///{@template cygnus_core.CygnusProcessGlobalConfigSettings.isClassSupported}
  ///Check if the current class is supported by the [defaultTargetPlatform] or a specific [platform].
  ///{@endtemplate}
  static bool isClassSupported({TargetPlatform? platform}) =>
      _CygnusProcessGlobalConfigSettingsClassSupported.isClassSupported(
        platform: platform,
      );

  ///{@template cygnus_core.CygnusProcessGlobalConfigSettings.isPropertySupported}
  ///Check if the current class is supported by the [defaultTargetPlatform] or a specific [platform].
  ///{@endtemplate}
  static bool isPropertySupported(
    CygnusProcessGlobalConfigSettingsProperty property, {
    TargetPlatform? platform,
  }) => _CygnusProcessGlobalConfigSettingsPropertySupported.isPropertySupported(
    property,
    platform: platform,
  );

  ///Converts instance to a map.
  Map<String, dynamic> toMap({CygnusEnumMethod? enumMethod}) {
    return {
      "dataDirectorySuffix": dataDirectorySuffix,
      "directoryBasePaths": directoryBasePaths?.toMap(enumMethod: enumMethod),
    };
  }

  ///Converts instance to a map.
  Map<String, dynamic> toJson() {
    return toMap();
  }

  ///Returns a copy of CygnusProcessGlobalConfigSettings.
  CygnusProcessGlobalConfigSettings copy() {
    return CygnusProcessGlobalConfigSettings.fromMap(toMap()) ??
        CygnusProcessGlobalConfigSettings();
  }

  @override
  String toString() {
    return 'CygnusProcessGlobalConfigSettings{dataDirectorySuffix: $dataDirectorySuffix, directoryBasePaths: $directoryBasePaths}';
  }
}

///Class that represents the settings used to configure the [CygnusProcessGlobalConfigSettings.directoryBasePaths].
///
///**Officially Supported Platforms/Implementations**:
///- Android native WebView ([Official API - ProxyConfig](https://developer.android.com/reference/androidx/webkit/ProxyConfig))
class CygnusProcessGlobalConfigDirectoryBasePaths {
  ///The absolute base path for the WebView cache directory.
  String cacheDirectoryBasePath;

  ///The absolute base path for the WebView data directory.
  String dataDirectoryBasePath;
  CygnusProcessGlobalConfigDirectoryBasePaths({
    required this.cacheDirectoryBasePath,
    required this.dataDirectoryBasePath,
  });

  ///Gets a possible [CygnusProcessGlobalConfigDirectoryBasePaths] instance from a [Map] value.
  static CygnusProcessGlobalConfigDirectoryBasePaths? fromMap(
    Map<String, dynamic>? map, {
    CygnusEnumMethod? enumMethod,
  }) {
    if (map == null) {
      return null;
    }
    final instance = CygnusProcessGlobalConfigDirectoryBasePaths(
      cacheDirectoryBasePath: map['cacheDirectoryBasePath'],
      dataDirectoryBasePath: map['dataDirectoryBasePath'],
    );
    return instance;
  }

  ///Converts instance to a map.
  Map<String, dynamic> toMap({CygnusEnumMethod? enumMethod}) {
    return {
      "cacheDirectoryBasePath": cacheDirectoryBasePath,
      "dataDirectoryBasePath": dataDirectoryBasePath,
    };
  }

  ///Converts instance to a map.
  Map<String, dynamic> toJson() {
    return toMap();
  }

  @override
  String toString() {
    return 'CygnusProcessGlobalConfigDirectoryBasePaths{cacheDirectoryBasePath: $cacheDirectoryBasePath, dataDirectoryBasePath: $dataDirectoryBasePath}';
  }
}

// **************************************************************************
// SupportedPlatformsGenerator
// **************************************************************************

extension _CygnusPlatformProcessGlobalConfigCreationParamsClassSupported
    on CygnusPlatformProcessGlobalConfigCreationParams {
  ///{@template cygnus_core.CygnusPlatformProcessGlobalConfigCreationParams.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView
  ///
  ///Use the [CygnusPlatformProcessGlobalConfigCreationParams.isClassSupported] method to check if this class is supported at runtime.
  ///{@endtemplate}
  static bool isClassSupported({TargetPlatform? platform}) {
    return ((kIsWeb && platform != null) || !kIsWeb) &&
        [TargetPlatform.android].contains(platform ?? defaultTargetPlatform);
  }
}

extension _CygnusPlatformProcessGlobalConfigClassSupported
    on CygnusPlatformProcessGlobalConfig {
  ///{@template cygnus_core.CygnusPlatformProcessGlobalConfig.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView ([Official API - CygnusProcessGlobalConfig](https://developer.android.com/reference/androidx/webkit/CygnusProcessGlobalConfig))
  ///
  ///Use the [CygnusPlatformProcessGlobalConfig.isClassSupported] method to check if this class is supported at runtime.
  ///{@endtemplate}
  static bool isClassSupported({TargetPlatform? platform}) {
    return ((kIsWeb && platform != null) || !kIsWeb) &&
        [TargetPlatform.android].contains(platform ?? defaultTargetPlatform);
  }
}

///List of [CygnusPlatformProcessGlobalConfig]'s methods that can be used to check if they are supported or not by the current platform.
enum CygnusPlatformProcessGlobalConfigMethod {
  ///Can be used to check if the [CygnusPlatformProcessGlobalConfig.apply] method is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusPlatformProcessGlobalConfig.apply.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView ([Official API - CygnusProcessGlobalConfig.apply](https://developer.android.com/reference/androidx/webkit/CygnusProcessGlobalConfig#apply(androidx.webkit.CygnusProcessGlobalConfig)))
  ///
  ///**Parameters - Officially Supported Platforms/Implementations**:
  ///- [settings]: all platforms
  ///
  ///Use the [CygnusPlatformProcessGlobalConfig.isMethodSupported] method to check if this method is supported at runtime.
  ///{@endtemplate}
  apply,
}

extension _CygnusPlatformProcessGlobalConfigMethodSupported
    on CygnusPlatformProcessGlobalConfig {
  static bool isMethodSupported(
    CygnusPlatformProcessGlobalConfigMethod method, {
    TargetPlatform? platform,
  }) {
    switch (method) {
      case CygnusPlatformProcessGlobalConfigMethod.apply:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [
              TargetPlatform.android,
            ].contains(platform ?? defaultTargetPlatform);
    }
  }
}

extension _CygnusProcessGlobalConfigSettingsClassSupported
    on CygnusProcessGlobalConfigSettings {
  ///{@template cygnus_core.CygnusProcessGlobalConfigSettings.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView ([Official API - CygnusProcessGlobalConfig.apply](https://developer.android.com/reference/androidx/webkit/CygnusProcessGlobalConfig#apply(androidx.webkit.CygnusProcessGlobalConfig)))
  ///
  ///Use the [CygnusProcessGlobalConfigSettings.isClassSupported] method to check if this class is supported at runtime.
  ///{@endtemplate}
  static bool isClassSupported({TargetPlatform? platform}) {
    return ((kIsWeb && platform != null) || !kIsWeb) &&
        [TargetPlatform.android].contains(platform ?? defaultTargetPlatform);
  }
}

///List of [CygnusProcessGlobalConfigSettings]'s properties that can be used to check i they are supported or not by the current platform.
enum CygnusProcessGlobalConfigSettingsProperty {
  ///Can be used to check if the [CygnusProcessGlobalConfigSettings.dataDirectorySuffix] property is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusProcessGlobalConfigSettings.dataDirectorySuffix.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView:
  ///    - Available only if [CygnusWebViewFeature.STARTUP_FEATURE_SET_DATA_DIRECTORY_SUFFIX] feature is supported.
  ///
  ///Use the [CygnusProcessGlobalConfigSettings.isPropertySupported] method to check if this property is supported at runtime.
  ///{@endtemplate}
  dataDirectorySuffix,

  ///Can be used to check if the [CygnusProcessGlobalConfigSettings.directoryBasePaths] property is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusProcessGlobalConfigSettings.directoryBasePaths.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView:
  ///    - Available only if [CygnusWebViewFeature.STARTUP_FEATURE_SET_DIRECTORY_BASE_PATHS] feature is supported.
  ///
  ///Use the [CygnusProcessGlobalConfigSettings.isPropertySupported] method to check if this property is supported at runtime.
  ///{@endtemplate}
  directoryBasePaths,
}

extension _CygnusProcessGlobalConfigSettingsPropertySupported
    on CygnusProcessGlobalConfigSettings {
  static bool isPropertySupported(
    CygnusProcessGlobalConfigSettingsProperty property, {
    TargetPlatform? platform,
  }) {
    switch (property) {
      case CygnusProcessGlobalConfigSettingsProperty.dataDirectorySuffix:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [
              TargetPlatform.android,
            ].contains(platform ?? defaultTargetPlatform);
      case CygnusProcessGlobalConfigSettingsProperty.directoryBasePaths:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [
              TargetPlatform.android,
            ].contains(platform ?? defaultTargetPlatform);
    }
  }
}
