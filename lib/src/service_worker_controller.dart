import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:cygnus_core/src/platform_interface/flutter_webview_platform_interface.dart';

///{@macro cygnus_core.CygnusPlatformServiceWorkerController}
///
///{@macro cygnus_core.CygnusPlatformServiceWorkerController.supported_platforms}
class CygnusServiceWorkerController {
  ///{@macro cygnus_core.CygnusPlatformServiceWorkerController}
  CygnusServiceWorkerController()
    : this.fromPlatformCreationParams(
        const CygnusPlatformServiceWorkerControllerCreationParams(),
      );

  /// Constructs a [CygnusServiceWorkerController] from creation params for a specific
  /// platform.
  CygnusServiceWorkerController.fromPlatformCreationParams(
    CygnusPlatformServiceWorkerControllerCreationParams params,
  ) : this.fromPlatform(CygnusPlatformServiceWorkerController(params));

  /// Constructs a [CygnusServiceWorkerController] from a specific platform
  /// implementation.
  CygnusServiceWorkerController.fromPlatform(this.platform);

  /// Implementation of [CygnusPlatformServiceWorkerController] for the current platform.
  final CygnusPlatformServiceWorkerController platform;

  static CygnusServiceWorkerController? _instance;

  ///Gets the [CygnusServiceWorkerController] shared instance.
  static CygnusServiceWorkerController instance() {
    if (_instance == null) {
      _instance = CygnusServiceWorkerController();
    }
    return _instance!;
  }

  ///{@macro cygnus_core.CygnusPlatformServiceWorkerController.serviceWorkerClient}
  ///
  ///{@macro cygnus_core.CygnusPlatformServiceWorkerController.serviceWorkerClient.supported_platforms}
  CygnusServiceWorkerClient? get serviceWorkerClient => platform.serviceWorkerClient;

  ///{@macro cygnus_core.CygnusPlatformServiceWorkerController.setServiceWorkerClient}
  ///
  ///{@macro cygnus_core.CygnusPlatformServiceWorkerController.setServiceWorkerClient.supported_platforms}
  setServiceWorkerClient(CygnusServiceWorkerClient? value) =>
      platform.setServiceWorkerClient(value);

  ///{@macro cygnus_core.CygnusPlatformServiceWorkerController.getAllowContentAccess}
  ///
  ///{@macro cygnus_core.CygnusPlatformServiceWorkerController.getAllowContentAccess.supported_platforms}
  static Future<bool> getAllowContentAccess() =>
      CygnusPlatformServiceWorkerController.static().getAllowContentAccess();

  ///{@macro cygnus_core.CygnusPlatformServiceWorkerController.getAllowFileAccess}
  ///
  ///{@macro cygnus_core.CygnusPlatformServiceWorkerController.getAllowFileAccess.supported_platforms}
  static Future<bool> getAllowFileAccess() =>
      CygnusPlatformServiceWorkerController.static().getAllowFileAccess();

  ///{@macro cygnus_core.CygnusPlatformServiceWorkerController.getBlockNetworkLoads}
  ///
  ///{@macro cygnus_core.CygnusPlatformServiceWorkerController.getBlockNetworkLoads.supported_platforms}
  static Future<bool> getBlockNetworkLoads() =>
      CygnusPlatformServiceWorkerController.static().getBlockNetworkLoads();

  ///{@macro cygnus_core.CygnusPlatformServiceWorkerController.getCacheMode}
  ///
  ///{@macro cygnus_core.CygnusPlatformServiceWorkerController.getCacheMode.supported_platforms}
  static Future<CygnusCacheMode?> getCacheMode() =>
      CygnusPlatformServiceWorkerController.static().getCacheMode();

  ///{@macro cygnus_core.CygnusPlatformServiceWorkerController.setAllowContentAccess}
  ///
  ///{@macro cygnus_core.CygnusPlatformServiceWorkerController.setAllowContentAccess.supported_platforms}
  static Future<void> setAllowContentAccess(bool allow) =>
      CygnusPlatformServiceWorkerController.static().setAllowContentAccess(allow);

  ///{@macro cygnus_core.CygnusPlatformServiceWorkerController.setAllowFileAccess}
  ///
  ///{@macro cygnus_core.CygnusPlatformServiceWorkerController.setAllowFileAccess.supported_platforms}
  static Future<void> setAllowFileAccess(bool allow) =>
      CygnusPlatformServiceWorkerController.static().setAllowFileAccess(allow);

  ///{@macro cygnus_core.CygnusPlatformServiceWorkerController.setBlockNetworkLoads}
  ///
  ///{@macro cygnus_core.CygnusPlatformServiceWorkerController.setBlockNetworkLoads.supported_platforms}
  static Future<void> setBlockNetworkLoads(bool flag) =>
      CygnusPlatformServiceWorkerController.static().setBlockNetworkLoads(flag);

  ///{@macro cygnus_core.CygnusPlatformServiceWorkerController.setCacheMode}
  ///
  ///{@macro cygnus_core.CygnusPlatformServiceWorkerController.setCacheMode.supported_platforms}
  static Future<void> setCacheMode(CygnusCacheMode mode) =>
      CygnusPlatformServiceWorkerController.static().setCacheMode(mode);

  ///{@macro cygnus_core.CygnusPlatformServiceWorkerControllerCreationParams.isClassSupported}
  static bool isClassSupported({TargetPlatform? platform}) =>
      CygnusPlatformServiceWorkerController.static().isClassSupported(
        platform: platform,
      );

  ///{@macro cygnus_core.CygnusPlatformServiceWorkerController.isMethodSupported}
  static bool isMethodSupported(
    CygnusPlatformServiceWorkerControllerMethod method, {
    TargetPlatform? platform,
  }) => CygnusPlatformServiceWorkerController.static().isMethodSupported(
    method,
    platform: platform,
  );
}

///Class that represents an Android-specific class that manages Service Workers used by `WebView`.
///
///**NOTE**: available on Android 24+.
///
///**Official Android API**: https://developer.android.com/reference/androidx/webkit/ServiceWorkerControllerCompat
///
///Use [CygnusServiceWorkerController] instead.
@Deprecated("Use CygnusServiceWorkerController instead")
class CygnusAndroidServiceWorkerController {
  static CygnusAndroidServiceWorkerController? _instance;

  CygnusAndroidServiceWorkerClient? _serviceWorkerClient;

  CygnusAndroidServiceWorkerClient? get serviceWorkerClient => _serviceWorkerClient;

  ///Gets the [CygnusAndroidServiceWorkerController] shared instance.
  static CygnusAndroidServiceWorkerController instance() {
    return (_instance != null) ? _instance! : _init();
  }

  static CygnusAndroidServiceWorkerController _init() {
    _instance = CygnusAndroidServiceWorkerController();
    return _instance!;
  }

  @Deprecated("Use setServiceWorkerClient instead")
  set serviceWorkerClient(CygnusAndroidServiceWorkerClient? value) {
    setServiceWorkerClient(value);
  }

  ///Sets the service worker client
  setServiceWorkerClient(CygnusAndroidServiceWorkerClient? value) async {
    await CygnusServiceWorkerController.instance().setServiceWorkerClient(
      value != null
          ? CygnusServiceWorkerClient(
              shouldInterceptRequest: value.shouldInterceptRequest,
            )
          : null,
    );
    _serviceWorkerClient = value;
  }

  ///Gets whether Service Workers support content URL access.
  ///This method should only be called if [CygnusAndroidWebViewFeature.isFeatureSupported] returns `true` for [CygnusAndroidWebViewFeature.SERVICE_WORKER_CONTENT_ACCESS].
  ///
  ///**NOTE**: available on Android 24+.
  ///
  ///**Official Android API**: https://developer.android.com/reference/androidx/webkit/ServiceWorkerWebSettingsCompat#getAllowContentAccess()
  static Future<bool> getAllowContentAccess() async {
    return await CygnusServiceWorkerController.getAllowContentAccess();
  }

  ///Gets whether Service Workers support file access.
  ///This method should only be called if [CygnusAndroidWebViewFeature.isFeatureSupported] returns `true` for [CygnusAndroidWebViewFeature.SERVICE_WORKER_FILE_ACCESS].
  ///
  ///**NOTE**: available on Android 24+.
  ///
  ///**Official Android API**: https://developer.android.com/reference/androidx/webkit/ServiceWorkerWebSettingsCompat#getAllowFileAccess()
  static Future<bool> getAllowFileAccess() async {
    return await CygnusServiceWorkerController.getAllowFileAccess();
  }

  ///Gets whether Service Workers are prohibited from loading any resources from the network.
  ///This method should only be called if [CygnusAndroidWebViewFeature.isFeatureSupported] returns `true` for [CygnusAndroidWebViewFeature.SERVICE_WORKER_BLOCK_NETWORK_LOADS].
  ///
  ///**NOTE**: available on Android 24+.
  ///
  ///**Official Android API**: https://developer.android.com/reference/androidx/webkit/ServiceWorkerWebSettingsCompat#getBlockNetworkLoads()
  static Future<bool> getBlockNetworkLoads() async {
    return await CygnusServiceWorkerController.getBlockNetworkLoads();
  }

  ///Gets the current setting for overriding the cache mode.
  ///This method should only be called if [CygnusAndroidWebViewFeature.isFeatureSupported] returns `true` for [CygnusAndroidWebViewFeature.SERVICE_WORKER_CACHE_MODE].
  ///
  ///**NOTE**: available on Android 24+.
  ///
  ///**Official Android API**: https://developer.android.com/reference/androidx/webkit/ServiceWorkerWebSettingsCompat#getCacheMode()
  static Future<CygnusAndroidCacheMode?> getCacheMode() async {
    return CygnusAndroidCacheMode.fromNativeValue(
      (await CygnusServiceWorkerController.getCacheMode())?.toNativeValue(),
    );
  }

  ///Enables or disables content URL access from Service Workers.
  ///This method should only be called if [CygnusAndroidWebViewFeature.isFeatureSupported] returns `true` for [CygnusAndroidWebViewFeature.SERVICE_WORKER_CONTENT_ACCESS].
  ///
  ///**NOTE**: available on Android 24+.
  ///
  ///**Official Android API**: https://developer.android.com/reference/androidx/webkit/ServiceWorkerWebSettingsCompat#setAllowContentAccess(boolean)
  static Future<void> setAllowContentAccess(bool allow) async {
    await CygnusServiceWorkerController.setAllowContentAccess(allow);
  }

  ///Enables or disables file access within Service Workers.
  ///This method should only be called if [CygnusAndroidWebViewFeature.isFeatureSupported] returns `true` for [CygnusAndroidWebViewFeature.SERVICE_WORKER_FILE_ACCESS].
  ///
  ///**NOTE**: available on Android 24+.
  ///
  ///**Official Android API**: https://developer.android.com/reference/androidx/webkit/ServiceWorkerWebSettingsCompat#setAllowFileAccess(boolean)
  static Future<void> setAllowFileAccess(bool allow) async {
    await CygnusServiceWorkerController.setAllowFileAccess(allow);
  }

  ///Sets whether Service Workers should not load resources from the network.
  ///This method should only be called if [CygnusAndroidWebViewFeature.isFeatureSupported] returns `true` for [CygnusAndroidWebViewFeature.SERVICE_WORKER_BLOCK_NETWORK_LOADS].
  ///
  ///**NOTE**: available on Android 24+.
  ///
  ///**Official Android API**: https://developer.android.com/reference/androidx/webkit/ServiceWorkerWebSettingsCompat#setBlockNetworkLoads(boolean)
  static Future<void> setBlockNetworkLoads(bool flag) async {
    await CygnusServiceWorkerController.setBlockNetworkLoads(flag);
  }

  ///Overrides the way the cache is used.
  ///This method should only be called if [CygnusAndroidWebViewFeature.isFeatureSupported] returns `true` for [CygnusAndroidWebViewFeature.SERVICE_WORKER_CACHE_MODE].
  ///
  ///**NOTE**: available on Android 24+.
  ///
  ///**Official Android API**: https://developer.android.com/reference/androidx/webkit/ServiceWorkerWebSettingsCompat#setCacheMode(int)
  static Future<void> setCacheMode(CygnusAndroidCacheMode mode) async {
    await CygnusServiceWorkerController.setCacheMode(
      CygnusCacheMode.fromNativeValue(mode.toNativeValue())!,
    );
  }
}

///Class that represents an Android-specific class for clients to capture Service Worker related callbacks.
///
///**NOTE**: available on Android 24+.
///
///**Official Android API**: https://developer.android.com/reference/androidx/webkit/ServiceWorkerClientCompat
///Use [CygnusServiceWorkerClient] instead.
@Deprecated("Use CygnusServiceWorkerClient instead")
class CygnusAndroidServiceWorkerClient {
  ///Notify the host application of a resource request and allow the application to return the data.
  ///If the return value is `null`, the Service Worker will continue to load the resource as usual.
  ///Otherwise, the return response and data will be used.
  ///
  ///This method is called only if [CygnusAndroidWebViewFeature.SERVICE_WORKER_SHOULD_INTERCEPT_REQUEST] is supported.
  ///You can check whether that flag is supported using [CygnusAndroidWebViewFeature.isFeatureSupported].
  ///
  ///[request] represents an object containing the details of the request.
  ///
  ///**NOTE**: available on Android 24+.
  final Future<CygnusWebResourceResponse?> Function(CygnusWebResourceRequest request)?
  shouldInterceptRequest;

  CygnusAndroidServiceWorkerClient({this.shouldInterceptRequest});
}
