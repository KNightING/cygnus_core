import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter_inappwebview_internal_annotations/flutter_inappwebview_internal_annotations.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'webview_platform.dart';
import 'platform_webview_feature.dart';
import 'types/main.dart';

part 'platform_service_worker_controller.g.dart';

///{@template cygnus_core.CygnusPlatformServiceWorkerControllerCreationParams}
/// Object specifying creation parameters for creating a [CygnusPlatformServiceWorkerController].
///
/// Platform specific implementations can add additional fields by extending
/// this class.
///{@endtemplate}
///
///{@macro cygnus_core.CygnusPlatformServiceWorkerControllerCreationParams.supported_platforms}
@SupportedPlatforms(platforms: [AndroidPlatform()])
@immutable
class CygnusPlatformServiceWorkerControllerCreationParams {
  /// Used by the platform implementation to create a new [CygnusPlatformServiceWorkerController].
  const CygnusPlatformServiceWorkerControllerCreationParams();

  ///{@template cygnus_core.CygnusPlatformServiceWorkerControllerCreationParams.isClassSupported}
  ///Check if the current class is supported by the [defaultTargetPlatform] or a specific [platform].
  ///{@endtemplate}
  bool isClassSupported({TargetPlatform? platform}) =>
      _CygnusPlatformServiceWorkerControllerCreationParamsClassSupported.isClassSupported(
        platform: platform,
      );
}

///{@template cygnus_core.CygnusPlatformServiceWorkerController}
///Class that manages Service Workers used by `WebView`.
///{@endtemplate}
///
///{@macro cygnus_core.CygnusPlatformServiceWorkerControllerCreationParams.supported_platforms}
@SupportedPlatforms(
  platforms: [
    AndroidPlatform(
      apiName: 'ServiceWorkerControllerCompat',
      apiUrl:
          'https://developer.android.com/reference/androidx/webkit/ServiceWorkerControllerCompat',
    ),
  ],
)
abstract class CygnusPlatformServiceWorkerController extends PlatformInterface {
  /// Creates a new [CygnusPlatformServiceWorkerController]
  factory CygnusPlatformServiceWorkerController(
    CygnusPlatformServiceWorkerControllerCreationParams params,
  ) {
    assert(
      CygnusWebViewPlatform.instance != null,
      'A platform implementation for `flutter_inappwebview` has not been set. Please '
      'ensure that an implementation of `CygnusWebViewPlatform` has been set to '
      '`WebViewPlatform.instance` before use. For unit testing, '
      '`WebViewPlatform.instance` can be set with your own test implementation.',
    );
    final CygnusPlatformServiceWorkerController serviceWorkerController =
        CygnusWebViewPlatform.instance!.createPlatformServiceWorkerController(
          params,
        );
    PlatformInterface.verify(serviceWorkerController, _token);
    return serviceWorkerController;
  }

  /// Creates a new [CygnusPlatformServiceWorkerController]
  factory CygnusPlatformServiceWorkerController.static() {
    assert(
      CygnusWebViewPlatform.instance != null,
      'A platform implementation for `flutter_inappwebview` has not been set. Please '
      'ensure that an implementation of `CygnusWebViewPlatform` has been set to '
      '`WebViewPlatform.instance` before use. For unit testing, '
      '`WebViewPlatform.instance` can be set with your own test implementation.',
    );
    final CygnusPlatformServiceWorkerController serviceWorkerControllerStatic =
        CygnusWebViewPlatform.instance!
            .createPlatformServiceWorkerControllerStatic();
    PlatformInterface.verify(serviceWorkerControllerStatic, _token);
    return serviceWorkerControllerStatic;
  }

  /// Used by the platform implementation to create a new
  /// [CygnusPlatformServiceWorkerController].
  ///
  /// Should only be used by platform implementations because they can't extend
  /// a class that only contains a factory constructor.
  @protected
  CygnusPlatformServiceWorkerController.implementation(this.params)
    : super(token: _token);

  static final Object _token = Object();

  /// The parameters used to initialize the [CygnusPlatformServiceWorkerController].
  final CygnusPlatformServiceWorkerControllerCreationParams params;

  ///{@template cygnus_core.CygnusPlatformServiceWorkerController.serviceWorkerClient}
  ///Service Worker client.
  ///{@endtemplate}
  CygnusServiceWorkerClient? get serviceWorkerClient;

  ///{@template cygnus_core.CygnusPlatformServiceWorkerController.setServiceWorkerClient}
  ///Sets the client to capture service worker related callbacks.
  ///A [CygnusServiceWorkerClient] should be set before any service workers are active, e.g. a safe place is before any WebView instances are created or pages loaded.
  ///{@endtemplate}
  ///
  ///{@macro cygnus_core.CygnusPlatformServiceWorkerController.setServiceWorkerClient.supported_platforms}
  @SupportedPlatforms(
    platforms: [
      AndroidPlatform(
        apiName: 'ServiceWorkerControllerCompat.setServiceWorkerClient',
        apiUrl:
            'https://developer.android.com/reference/androidx/webkit/ServiceWorkerControllerCompat#setServiceWorkerClient(androidx.webkit.ServiceWorkerClientCompat)',
      ),
    ],
  )
  Future<void> setServiceWorkerClient(CygnusServiceWorkerClient? value) {
    throw UnimplementedError(
      'setServiceWorkerClient is not implemented on the current platform',
    );
  }

  ///{@template cygnus_core.CygnusPlatformServiceWorkerController.getAllowContentAccess}
  ///Gets whether Service Workers support content URL access.
  ///This method should only be called if [CygnusWebViewFeature.isFeatureSupported] returns `true` for [CygnusWebViewFeature.SERVICE_WORKER_CONTENT_ACCESS].
  ///{@endtemplate}
  ///
  ///{@macro cygnus_core.CygnusPlatformServiceWorkerController.getAllowContentAccess.supported_platforms}
  @SupportedPlatforms(
    platforms: [
      AndroidPlatform(
        apiName: 'ServiceWorkerWebSettingsCompat.getAllowContentAccess',
        apiUrl:
            'https://developer.android.com/reference/androidx/webkit/ServiceWorkerWebSettingsCompat#getAllowContentAccess()',
      ),
    ],
  )
  Future<bool> getAllowContentAccess() {
    throw UnimplementedError(
      'getAllowContentAccess is not implemented on the current platform',
    );
  }

  ///{@template cygnus_core.CygnusPlatformServiceWorkerController.getAllowFileAccess}
  ///Gets whether Service Workers support file access.
  ///This method should only be called if [CygnusWebViewFeature.isFeatureSupported] returns `true` for [CygnusWebViewFeature.SERVICE_WORKER_FILE_ACCESS].
  ///{@endtemplate}
  ///
  ///{@macro cygnus_core.CygnusPlatformServiceWorkerController.getAllowFileAccess.supported_platforms}
  @SupportedPlatforms(
    platforms: [
      AndroidPlatform(
        apiName: 'ServiceWorkerWebSettingsCompat.getAllowFileAccess',
        apiUrl:
            'https://developer.android.com/reference/androidx/webkit/ServiceWorkerWebSettingsCompat#getAllowFileAccess()',
      ),
    ],
  )
  Future<bool> getAllowFileAccess() {
    throw UnimplementedError(
      'getAllowFileAccess is not implemented on the current platform',
    );
  }

  ///{@template cygnus_core.CygnusPlatformServiceWorkerController.getBlockNetworkLoads}
  ///Gets whether Service Workers are prohibited from loading any resources from the network.
  ///This method should only be called if [CygnusWebViewFeature.isFeatureSupported] returns `true` for [CygnusWebViewFeature.SERVICE_WORKER_BLOCK_NETWORK_LOADS].
  ///{@endtemplate}
  ///
  ///{@macro cygnus_core.CygnusPlatformServiceWorkerController.getBlockNetworkLoads.supported_platforms}
  @SupportedPlatforms(
    platforms: [
      AndroidPlatform(
        apiName: 'ServiceWorkerWebSettingsCompat.getBlockNetworkLoads',
        apiUrl:
            'https://developer.android.com/reference/androidx/webkit/ServiceWorkerWebSettingsCompat#getBlockNetworkLoads()',
      ),
    ],
  )
  Future<bool> getBlockNetworkLoads() {
    throw UnimplementedError(
      'getBlockNetworkLoads is not implemented on the current platform',
    );
  }

  ///{@template cygnus_core.CygnusPlatformServiceWorkerController.getCacheMode}
  ///Gets the current setting for overriding the cache mode.
  ///This method should only be called if [CygnusWebViewFeature.isFeatureSupported] returns `true` for [CygnusWebViewFeature.SERVICE_WORKER_CACHE_MODE].
  ///{@endtemplate}
  ///
  ///{@macro cygnus_core.CygnusPlatformServiceWorkerController.getCacheMode.supported_platforms}
  @SupportedPlatforms(
    platforms: [
      AndroidPlatform(
        apiName: 'ServiceWorkerWebSettingsCompat.getCacheMode',
        apiUrl:
            'https://developer.android.com/reference/androidx/webkit/ServiceWorkerWebSettingsCompat#getCacheMode()',
      ),
    ],
  )
  Future<CygnusCacheMode?> getCacheMode() {
    throw UnimplementedError(
      'getCacheMode is not implemented on the current platform',
    );
  }

  ///{@template cygnus_core.CygnusPlatformServiceWorkerController.setAllowContentAccess}
  ///Enables or disables content URL access from Service Workers.
  ///This method should only be called if [CygnusWebViewFeature.isFeatureSupported] returns `true` for [CygnusWebViewFeature.SERVICE_WORKER_CONTENT_ACCESS].
  ///{@endtemplate}
  ///
  ///{@macro cygnus_core.CygnusPlatformServiceWorkerController.setAllowContentAccess.supported_platforms}
  @SupportedPlatforms(
    platforms: [
      AndroidPlatform(
        apiName: 'ServiceWorkerWebSettingsCompat.setAllowContentAccess',
        apiUrl:
            'https://developer.android.com/reference/androidx/webkit/ServiceWorkerWebSettingsCompat#setAllowContentAccess(boolean)',
      ),
    ],
  )
  Future<void> setAllowContentAccess(bool allow) {
    throw UnimplementedError(
      'setAllowContentAccess is not implemented on the current platform',
    );
  }

  ///{@template cygnus_core.CygnusPlatformServiceWorkerController.setAllowFileAccess}
  ///Enables or disables file access within Service Workers.
  ///This method should only be called if [CygnusWebViewFeature.isFeatureSupported] returns `true` for [CygnusWebViewFeature.SERVICE_WORKER_FILE_ACCESS].
  ///{@endtemplate}
  ///
  ///{@macro cygnus_core.CygnusPlatformServiceWorkerController.setAllowFileAccess.supported_platforms}
  @SupportedPlatforms(
    platforms: [
      AndroidPlatform(
        apiName: 'ServiceWorkerWebSettingsCompat.setAllowFileAccess',
        apiUrl:
            'https://developer.android.com/reference/androidx/webkit/ServiceWorkerWebSettingsCompat#setAllowFileAccess(boolean)',
      ),
    ],
  )
  Future<void> setAllowFileAccess(bool allow) {
    throw UnimplementedError(
      'setAllowFileAccess is not implemented on the current platform',
    );
  }

  ///{@template cygnus_core.CygnusPlatformServiceWorkerController.setBlockNetworkLoads}
  ///Sets whether Service Workers should not load resources from the network.
  ///This method should only be called if [CygnusWebViewFeature.isFeatureSupported] returns `true` for [CygnusWebViewFeature.SERVICE_WORKER_BLOCK_NETWORK_LOADS].
  ///{@endtemplate}
  ///
  ///{@macro cygnus_core.CygnusPlatformServiceWorkerController.setBlockNetworkLoads.supported_platforms}
  @SupportedPlatforms(
    platforms: [
      AndroidPlatform(
        apiName: 'ServiceWorkerWebSettingsCompat.setBlockNetworkLoads',
        apiUrl:
            'https://developer.android.com/reference/androidx/webkit/ServiceWorkerWebSettingsCompat#setBlockNetworkLoads(boolean)',
      ),
    ],
  )
  Future<void> setBlockNetworkLoads(bool flag) {
    throw UnimplementedError(
      'setBlockNetworkLoads is not implemented on the current platform',
    );
  }

  ///{@template cygnus_core.CygnusPlatformServiceWorkerController.setCacheMode}
  ///Overrides the way the cache is used.
  ///This method should only be called if [CygnusWebViewFeature.isFeatureSupported] returns `true` for [CygnusWebViewFeature.SERVICE_WORKER_CACHE_MODE].
  ///{@endtemplate}
  ///
  ///{@macro cygnus_core.CygnusPlatformServiceWorkerController.setCacheMode.supported_platforms}
  @SupportedPlatforms(
    platforms: [
      AndroidPlatform(
        apiName: 'ServiceWorkerWebSettingsCompat.setCacheMode',
        apiUrl:
            'https://developer.android.com/reference/androidx/webkit/ServiceWorkerWebSettingsCompat#setCacheMode(int)',
      ),
    ],
  )
  Future<void> setCacheMode(CygnusCacheMode mode) {
    throw UnimplementedError(
      'setCacheMode is not implemented on the current platform',
    );
  }

  ///{@macro cygnus_core.CygnusPlatformServiceWorkerControllerCreationParams.isClassSupported}
  bool isClassSupported({TargetPlatform? platform}) =>
      params.isClassSupported(platform: platform);

  ///{@template cygnus_core.CygnusPlatformServiceWorkerController.isMethodSupported}
  ///Check if the given [method] is supported by the [defaultTargetPlatform] or a specific [platform].
  ///{@endtemplate}
  bool isMethodSupported(
    CygnusPlatformServiceWorkerControllerMethod method, {
    TargetPlatform? platform,
  }) => _CygnusPlatformServiceWorkerControllerMethodSupported.isMethodSupported(
    method,
    platform: platform,
  );
}

///{@template cygnus_core.CygnusServiceWorkerClient}
///Class used by clients to capture Service Worker related callbacks.
///{@endtemplate}
///
///{@macro cygnus_core.CygnusServiceWorkerClient.supported_platforms}
@SupportedPlatforms(
  platforms: [
    AndroidPlatform(
      apiName: 'ServiceWorkerClientCompat',
      apiUrl:
          'https://developer.android.com/reference/androidx/webkit/ServiceWorkerClientCompat',
    ),
  ],
)
class CygnusServiceWorkerClient {
  ///{@template cygnus_core.CygnusServiceWorkerClient.shouldInterceptRequest}
  ///Notify the host application of a resource request and allow the application to return the data.
  ///If the return value is `null`, the Service Worker will continue to load the resource as usual.
  ///Otherwise, the return response and data will be used.
  ///
  ///This method is called only if [CygnusWebViewFeature.SERVICE_WORKER_SHOULD_INTERCEPT_REQUEST] is supported.
  ///You can check whether that flag is supported using [CygnusWebViewFeature.isFeatureSupported].
  ///
  ///[request] represents an object containing the details of the request.
  ///{@endtemplate}
  ///
  ///{@macro cygnus_core.CygnusServiceWorkerClient.shouldInterceptRequest.supported_platforms}
  @SupportedPlatforms(
    platforms: [
      AndroidPlatform(
        apiName: 'ServiceWorkerClientCompat.shouldInterceptRequest',
        apiUrl:
            'https://developer.android.com/reference/androidx/webkit/ServiceWorkerClientCompat#shouldInterceptRequest(android.webkit.CygnusWebResourceRequest)',
      ),
    ],
  )
  final Future<CygnusWebResourceResponse?> Function(CygnusWebResourceRequest request)?
  shouldInterceptRequest;

  CygnusServiceWorkerClient({this.shouldInterceptRequest});

  ///{@template cygnus_core.CygnusServiceWorkerClient.isClassSupported}
  ///Check if the current class is supported by the [defaultTargetPlatform] or a specific [platform].
  ///{@endtemplate}
  static bool isClassSupported({TargetPlatform? platform}) =>
      _CygnusPlatformServiceWorkerControllerCreationParamsClassSupported.isClassSupported(
        platform: platform,
      );

  ///{@template cygnus_core.CygnusServiceWorkerClient.isPropertySupported}
  ///Check if the given [method] is supported by the [defaultTargetPlatform] or a specific [platform].
  ///{@endtemplate}
  static bool isPropertySupported(
    CygnusServiceWorkerClientProperty property, {
    TargetPlatform? platform,
  }) => _CygnusServiceWorkerClientPropertySupported.isPropertySupported(
    property,
    platform: platform,
  );
}
