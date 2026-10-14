// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'platform_service_worker_controller.dart';

// **************************************************************************
// SupportedPlatformsGenerator
// **************************************************************************

extension _CygnusPlatformServiceWorkerControllerCreationParamsClassSupported
    on CygnusPlatformServiceWorkerControllerCreationParams {
  ///{@template cygnus_core.CygnusPlatformServiceWorkerControllerCreationParams.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView
  ///
  ///Use the [CygnusPlatformServiceWorkerControllerCreationParams.isClassSupported] method to check if this class is supported at runtime.
  ///{@endtemplate}
  static bool isClassSupported({TargetPlatform? platform}) {
    return ((kIsWeb && platform != null) || !kIsWeb) &&
        [TargetPlatform.android].contains(platform ?? defaultTargetPlatform);
  }
}

extension _CygnusPlatformServiceWorkerControllerClassSupported
    on CygnusPlatformServiceWorkerController {
  ///{@template cygnus_core.CygnusPlatformServiceWorkerController.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView ([Official API - ServiceWorkerControllerCompat](https://developer.android.com/reference/androidx/webkit/ServiceWorkerControllerCompat))
  ///
  ///Use the [CygnusPlatformServiceWorkerController.isClassSupported] method to check if this class is supported at runtime.
  ///{@endtemplate}
  static bool isClassSupported({TargetPlatform? platform}) {
    return ((kIsWeb && platform != null) || !kIsWeb) &&
        [TargetPlatform.android].contains(platform ?? defaultTargetPlatform);
  }
}

///List of [CygnusPlatformServiceWorkerController]'s methods that can be used to check if they are supported or not by the current platform.
enum CygnusPlatformServiceWorkerControllerMethod {
  ///Can be used to check if the [CygnusPlatformServiceWorkerController.getAllowContentAccess] method is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusPlatformServiceWorkerController.getAllowContentAccess.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView ([Official API - ServiceWorkerWebSettingsCompat.getAllowContentAccess](https://developer.android.com/reference/androidx/webkit/ServiceWorkerWebSettingsCompat#getAllowContentAccess()))
  ///
  ///Use the [CygnusPlatformServiceWorkerController.isMethodSupported] method to check if this method is supported at runtime.
  ///{@endtemplate}
  getAllowContentAccess,

  ///Can be used to check if the [CygnusPlatformServiceWorkerController.getAllowFileAccess] method is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusPlatformServiceWorkerController.getAllowFileAccess.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView ([Official API - ServiceWorkerWebSettingsCompat.getAllowFileAccess](https://developer.android.com/reference/androidx/webkit/ServiceWorkerWebSettingsCompat#getAllowFileAccess()))
  ///
  ///Use the [CygnusPlatformServiceWorkerController.isMethodSupported] method to check if this method is supported at runtime.
  ///{@endtemplate}
  getAllowFileAccess,

  ///Can be used to check if the [CygnusPlatformServiceWorkerController.getBlockNetworkLoads] method is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusPlatformServiceWorkerController.getBlockNetworkLoads.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView ([Official API - ServiceWorkerWebSettingsCompat.getBlockNetworkLoads](https://developer.android.com/reference/androidx/webkit/ServiceWorkerWebSettingsCompat#getBlockNetworkLoads()))
  ///
  ///Use the [CygnusPlatformServiceWorkerController.isMethodSupported] method to check if this method is supported at runtime.
  ///{@endtemplate}
  getBlockNetworkLoads,

  ///Can be used to check if the [CygnusPlatformServiceWorkerController.getCacheMode] method is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusPlatformServiceWorkerController.getCacheMode.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView ([Official API - ServiceWorkerWebSettingsCompat.getCacheMode](https://developer.android.com/reference/androidx/webkit/ServiceWorkerWebSettingsCompat#getCacheMode()))
  ///
  ///Use the [CygnusPlatformServiceWorkerController.isMethodSupported] method to check if this method is supported at runtime.
  ///{@endtemplate}
  getCacheMode,

  ///Can be used to check if the [CygnusPlatformServiceWorkerController.setAllowContentAccess] method is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusPlatformServiceWorkerController.setAllowContentAccess.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView ([Official API - ServiceWorkerWebSettingsCompat.setAllowContentAccess](https://developer.android.com/reference/androidx/webkit/ServiceWorkerWebSettingsCompat#setAllowContentAccess(boolean)))
  ///
  ///**Parameters - Officially Supported Platforms/Implementations**:
  ///- [allow]: all platforms
  ///
  ///Use the [CygnusPlatformServiceWorkerController.isMethodSupported] method to check if this method is supported at runtime.
  ///{@endtemplate}
  setAllowContentAccess,

  ///Can be used to check if the [CygnusPlatformServiceWorkerController.setAllowFileAccess] method is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusPlatformServiceWorkerController.setAllowFileAccess.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView ([Official API - ServiceWorkerWebSettingsCompat.setAllowFileAccess](https://developer.android.com/reference/androidx/webkit/ServiceWorkerWebSettingsCompat#setAllowFileAccess(boolean)))
  ///
  ///**Parameters - Officially Supported Platforms/Implementations**:
  ///- [allow]: all platforms
  ///
  ///Use the [CygnusPlatformServiceWorkerController.isMethodSupported] method to check if this method is supported at runtime.
  ///{@endtemplate}
  setAllowFileAccess,

  ///Can be used to check if the [CygnusPlatformServiceWorkerController.setBlockNetworkLoads] method is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusPlatformServiceWorkerController.setBlockNetworkLoads.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView ([Official API - ServiceWorkerWebSettingsCompat.setBlockNetworkLoads](https://developer.android.com/reference/androidx/webkit/ServiceWorkerWebSettingsCompat#setBlockNetworkLoads(boolean)))
  ///
  ///**Parameters - Officially Supported Platforms/Implementations**:
  ///- [flag]: all platforms
  ///
  ///Use the [CygnusPlatformServiceWorkerController.isMethodSupported] method to check if this method is supported at runtime.
  ///{@endtemplate}
  setBlockNetworkLoads,

  ///Can be used to check if the [CygnusPlatformServiceWorkerController.setCacheMode] method is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusPlatformServiceWorkerController.setCacheMode.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView ([Official API - ServiceWorkerWebSettingsCompat.setCacheMode](https://developer.android.com/reference/androidx/webkit/ServiceWorkerWebSettingsCompat#setCacheMode(int)))
  ///
  ///**Parameters - Officially Supported Platforms/Implementations**:
  ///- [mode]: all platforms
  ///
  ///Use the [CygnusPlatformServiceWorkerController.isMethodSupported] method to check if this method is supported at runtime.
  ///{@endtemplate}
  setCacheMode,

  ///Can be used to check if the [CygnusPlatformServiceWorkerController.setServiceWorkerClient] method is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusPlatformServiceWorkerController.setServiceWorkerClient.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView ([Official API - ServiceWorkerControllerCompat.setServiceWorkerClient](https://developer.android.com/reference/androidx/webkit/ServiceWorkerControllerCompat#setServiceWorkerClient(androidx.webkit.ServiceWorkerClientCompat)))
  ///
  ///**Parameters - Officially Supported Platforms/Implementations**:
  ///- [value]: all platforms
  ///
  ///Use the [CygnusPlatformServiceWorkerController.isMethodSupported] method to check if this method is supported at runtime.
  ///{@endtemplate}
  setServiceWorkerClient,
}

extension _CygnusPlatformServiceWorkerControllerMethodSupported
    on CygnusPlatformServiceWorkerController {
  static bool isMethodSupported(
    CygnusPlatformServiceWorkerControllerMethod method, {
    TargetPlatform? platform,
  }) {
    switch (method) {
      case CygnusPlatformServiceWorkerControllerMethod.getAllowContentAccess:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [
              TargetPlatform.android,
            ].contains(platform ?? defaultTargetPlatform);
      case CygnusPlatformServiceWorkerControllerMethod.getAllowFileAccess:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [
              TargetPlatform.android,
            ].contains(platform ?? defaultTargetPlatform);
      case CygnusPlatformServiceWorkerControllerMethod.getBlockNetworkLoads:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [
              TargetPlatform.android,
            ].contains(platform ?? defaultTargetPlatform);
      case CygnusPlatformServiceWorkerControllerMethod.getCacheMode:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [
              TargetPlatform.android,
            ].contains(platform ?? defaultTargetPlatform);
      case CygnusPlatformServiceWorkerControllerMethod.setAllowContentAccess:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [
              TargetPlatform.android,
            ].contains(platform ?? defaultTargetPlatform);
      case CygnusPlatformServiceWorkerControllerMethod.setAllowFileAccess:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [
              TargetPlatform.android,
            ].contains(platform ?? defaultTargetPlatform);
      case CygnusPlatformServiceWorkerControllerMethod.setBlockNetworkLoads:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [
              TargetPlatform.android,
            ].contains(platform ?? defaultTargetPlatform);
      case CygnusPlatformServiceWorkerControllerMethod.setCacheMode:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [
              TargetPlatform.android,
            ].contains(platform ?? defaultTargetPlatform);
      case CygnusPlatformServiceWorkerControllerMethod.setServiceWorkerClient:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [
              TargetPlatform.android,
            ].contains(platform ?? defaultTargetPlatform);
    }
  }
}

extension _CygnusServiceWorkerClientClassSupported
    on CygnusServiceWorkerClient {
  ///{@template cygnus_core.CygnusServiceWorkerClient.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView ([Official API - ServiceWorkerClientCompat](https://developer.android.com/reference/androidx/webkit/ServiceWorkerClientCompat))
  ///
  ///Use the [CygnusServiceWorkerClient.isClassSupported] method to check if this class is supported at runtime.
  ///{@endtemplate}
  static bool isClassSupported({TargetPlatform? platform}) {
    return ((kIsWeb && platform != null) || !kIsWeb) &&
        [TargetPlatform.android].contains(platform ?? defaultTargetPlatform);
  }
}

///List of [CygnusServiceWorkerClient]'s properties that can be used to check i they are supported or not by the current platform.
enum CygnusServiceWorkerClientProperty {
  ///Can be used to check if the [CygnusServiceWorkerClient.shouldInterceptRequest] property is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusServiceWorkerClient.shouldInterceptRequest.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView ([Official API - ServiceWorkerClientCompat.shouldInterceptRequest](https://developer.android.com/reference/androidx/webkit/ServiceWorkerClientCompat#shouldInterceptRequest(android.webkit.CygnusWebResourceRequest)))
  ///
  ///**Parameters - Officially Supported Platforms/Implementations**:
  ///- [request]: all platforms
  ///
  ///Use the [CygnusServiceWorkerClient.isPropertySupported] method to check if this property is supported at runtime.
  ///{@endtemplate}
  shouldInterceptRequest,
}

extension _CygnusServiceWorkerClientPropertySupported
    on CygnusServiceWorkerClient {
  static bool isPropertySupported(
    CygnusServiceWorkerClientProperty property, {
    TargetPlatform? platform,
  }) {
    switch (property) {
      case CygnusServiceWorkerClientProperty.shouldInterceptRequest:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [
              TargetPlatform.android,
            ].contains(platform ?? defaultTargetPlatform);
    }
  }
}
