import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';
import 'package:flutter_inappwebview_internal_annotations/flutter_inappwebview_internal_annotations.dart';
import 'webview_platform.dart';

part 'platform_webview_feature.g.dart';

///{@template cygnus_core.CygnusPlatformWebViewFeatureCreationParams}
/// Object specifying creation parameters for creating a [CygnusPlatformWebViewFeature].
///
/// Platform specific implementations can add additional fields by extending
/// this class.
///{@endtemplate}
///
///{@macro cygnus_core.CygnusPlatformWebViewFeatureCreationParams.supported_platforms}
@SupportedPlatforms(platforms: [AndroidPlatform()])
@immutable
class CygnusPlatformWebViewFeatureCreationParams {
  /// Used by the platform implementation to create a new [CygnusPlatformWebViewFeature].
  const CygnusPlatformWebViewFeatureCreationParams();

  ///{@template cygnus_core.CygnusPlatformWebViewFeatureCreationParams.isClassSupported}
  ///Check if the current class is supported by the [defaultTargetPlatform] or a specific [platform].
  ///{@endtemplate}
  bool isClassSupported({TargetPlatform? platform}) =>
      _CygnusPlatformWebViewFeatureCreationParamsClassSupported.isClassSupported(
        platform: platform,
      );
}

///{@template cygnus_core.CygnusPlatformWebViewFeature}
///Class that represents an Android-specific utility class for checking which WebView Support Library features are supported on the device.
///{@endtemplate}
///
///{@macro cygnus_core.CygnusPlatformWebViewFeature.supported_platforms}
@SupportedPlatforms(platforms: [AndroidPlatform()])
abstract class CygnusPlatformWebViewFeature extends PlatformInterface {
  /// Creates a new [CygnusPlatformWebViewFeature]
  factory CygnusPlatformWebViewFeature(CygnusPlatformWebViewFeatureCreationParams params) {
    assert(
      CygnusWebViewPlatform.instance != null,
      'A platform implementation for `cygnus` has not been set. Please '
      'ensure that an implementation of `CygnusWebViewPlatform` has been set to '
      '`WebViewPlatform.instance` before use. For unit testing, '
      '`WebViewPlatform.instance` can be set with your own test implementation.',
    );
    final CygnusPlatformWebViewFeature webViewFeature = CygnusWebViewPlatform.instance!
        .createPlatformWebViewFeature(params);
    PlatformInterface.verify(webViewFeature, _token);
    return webViewFeature;
  }

  /// Creates a new empty [CygnusPlatformWebViewFeature] to access static methods.
  factory CygnusPlatformWebViewFeature.static() {
    assert(
      CygnusWebViewPlatform.instance != null,
      'A platform implementation for `cygnus` has not been set. Please '
      'ensure that an implementation of `CygnusWebViewPlatform` has been set to '
      '`WebViewPlatform.instance` before use. For unit testing, '
      '`WebViewPlatform.instance` can be set with your own test implementation.',
    );
    final CygnusPlatformWebViewFeature webViewFeatureStatic = CygnusWebViewPlatform
        .instance!
        .createPlatformWebViewFeatureStatic();
    PlatformInterface.verify(webViewFeatureStatic, _token);
    return webViewFeatureStatic;
  }

  /// Used by the platform implementation to create a new
  /// [CygnusPlatformWebViewFeature].
  ///
  /// Should only be used by platform implementations because they can't extend
  /// a class that only contains a factory constructor.
  @protected
  CygnusPlatformWebViewFeature.implementation(this.params) : super(token: _token);

  static final Object _token = Object();

  /// The parameters used to initialize the [CygnusPlatformWebViewFeature].
  final CygnusPlatformWebViewFeatureCreationParams params;

  ///{@template cygnus_core.CygnusPlatformWebViewFeature.isFeatureSupported}
  ///Return whether a feature is supported at run-time. On devices running Android version `Build.VERSION_CODES.LOLLIPOP` and higher,
  ///this will check whether a feature is supported, depending on the combination of the desired feature, the Android version of device,
  ///and the WebView APK on the device. If running on a device with a lower API level, this will always return `false`.
  ///
  ///**Note**: This method is different from [isStartupFeatureSupported] and this
  ///method only accepts certain features.
  ///Please verify that the correct feature checking method is used for a particular feature.
  ///
  ///**Note**: If this method returns `false`, it is not safe to invoke the methods
  ///requiring the desired feature.
  ///Furthermore, if this method returns `false` for a particular feature, any callback guarded by that feature will not be invoked.
  ///{@endtemplate}
  ///
  ///{@macro cygnus_core.CygnusPlatformWebViewFeature.isFeatureSupported.supported_platforms}
  @SupportedPlatforms(
    platforms: [
      AndroidPlatform(
        apiName: 'CygnusWebViewFeature.isFeatureSupported',
        apiUrl:
            'https://developer.android.com/reference/androidx/webkit/CygnusWebViewFeature#isFeatureSupported(java.lang.String)',
      ),
    ],
  )
  Future<bool> isFeatureSupported(CygnusWebViewFeature feature) {
    throw UnimplementedError(
      'isFeatureSupported is not implemented on the current platform',
    );
  }

  ///{@template cygnus_core.CygnusPlatformWebViewFeature.isStartupFeatureSupported}
  ///Return whether a startup feature is supported at run-time.
  ///On devices running Android version `Build.VERSION_CODES.LOLLIPOP` and higher,
  ///this will check whether a startup feature is supported,
  ///depending on the combination of the desired feature,
  ///the Android version of device, and the WebView APK on the device.
  ///If running on a device with a lower API level, this will always return `false`.
  ///
  ///**Note**: This method is different from [isFeatureSupported] and this method only accepts startup features.
  ///Please verify that the correct feature checking method is used for a particular feature.
  ///
  ///**Note**: If this method returns `false`, it is not safe to invoke the methods requiring the desired feature.
  ///Furthermore, if this method returns `false` for a particular feature,
  ///any callback guarded by that feature will not be invoked.
  ///{@endtemplate}
  ///
  ///{@macro cygnus_core.CygnusPlatformWebViewFeature.isStartupFeatureSupported.supported_platforms}
  @SupportedPlatforms(
    platforms: [
      AndroidPlatform(
        apiName: 'CygnusWebViewFeature.isStartupFeatureSupported',
        apiUrl:
            'https://developer.android.com/reference/androidx/webkit/CygnusWebViewFeature#isStartupFeatureSupported(android.content.Context,java.lang.String)',
      ),
    ],
  )
  Future<bool> isStartupFeatureSupported(CygnusWebViewFeature startupFeature) {
    throw UnimplementedError(
      'isStartupFeatureSupported is not implemented on the current platform',
    );
  }

  ///{@macro cygnus_core.CygnusPlatformWebViewFeatureCreationParams.isClassSupported}
  bool isClassSupported({TargetPlatform? platform}) =>
      params.isClassSupported(platform: platform);

  ///{@template cygnus_core.CygnusPlatformWebViewFeature.isMethodSupported}
  ///Check if the given [method] is supported by the [defaultTargetPlatform] or a specific [platform].
  ///{@endtemplate}
  bool isMethodSupported(
    CygnusPlatformWebViewFeatureMethod method, {
    TargetPlatform? platform,
  }) => _CygnusPlatformWebViewFeatureMethodSupported.isMethodSupported(
    method,
    platform: platform,
  );
}

///{@macro cygnus_core.CygnusPlatformWebViewFeature}
@ExchangeableEnum()
class CygnusWebViewFeature_ {
  // ignore: unused_field
  final String _value;

  const CygnusWebViewFeature_._internal(this._value);

  @ExchangeableObjectMethod(ignore: true)
  String toNativeValue() => _value;

  ///Feature for [isFeatureSupported]. This feature covers [CygnusWebViewController.createWebMessageChannel].
  static const CREATE_WEB_MESSAGE_CHANNEL = const CygnusWebViewFeature_._internal(
    "CREATE_WEB_MESSAGE_CHANNEL",
  );

  ///Feature for [isFeatureSupported]. This feature covers [CygnusWebViewSettings.disabledActionModeMenuItems].
  static const DISABLED_ACTION_MODE_MENU_ITEMS =
      const CygnusWebViewFeature_._internal("DISABLED_ACTION_MODE_MENU_ITEMS");

  ///Feature for [isFeatureSupported]. This feature covers [CygnusWebViewSettings.forceDark].
  static const FORCE_DARK = const CygnusWebViewFeature_._internal("FORCE_DARK");

  ///Feature for [isFeatureSupported]. This feature covers [CygnusWebViewSettings.forceDarkStrategy].
  static const FORCE_DARK_STRATEGY = const CygnusWebViewFeature_._internal(
    "FORCE_DARK_STRATEGY",
  );

  ///
  static const GET_WEB_CHROME_CLIENT = const CygnusWebViewFeature_._internal(
    "GET_WEB_CHROME_CLIENT",
  );

  ///
  static const GET_WEB_VIEW_CLIENT = const CygnusWebViewFeature_._internal(
    "GET_WEB_VIEW_CLIENT",
  );

  ///
  static const GET_WEB_VIEW_RENDERER = const CygnusWebViewFeature_._internal(
    "GET_WEB_VIEW_RENDERER",
  );

  ///
  static const MULTI_PROCESS = const CygnusWebViewFeature_._internal("MULTI_PROCESS");

  ///Feature for [isFeatureSupported]. This feature covers [CygnusWebViewSettings.offscreenPreRaster].
  static const OFF_SCREEN_PRERASTER = const CygnusWebViewFeature_._internal(
    "OFF_SCREEN_PRERASTER",
  );

  ///Feature for [isFeatureSupported]. This feature covers [CygnusWebViewController.postWebMessage].
  static const POST_WEB_MESSAGE = const CygnusWebViewFeature_._internal(
    "POST_WEB_MESSAGE",
  );

  ///Feature for [isFeatureSupported]. This feature covers [CygnusProxyController.setProxyOverride] and [CygnusProxyController.clearProxyOverride].
  static const PROXY_OVERRIDE = const CygnusWebViewFeature_._internal(
    "PROXY_OVERRIDE",
  );

  ///Feature for [isFeatureSupported]. This feature covers [CygnusProxySettings.reverseBypassEnabled].
  static const PROXY_OVERRIDE_REVERSE_BYPASS = const CygnusWebViewFeature_._internal(
    "PROXY_OVERRIDE_REVERSE_BYPASS",
  );

  ///
  static const RECEIVE_HTTP_ERROR = const CygnusWebViewFeature_._internal(
    "RECEIVE_HTTP_ERROR",
  );

  ///
  static const RECEIVE_WEB_RESOURCE_ERROR = const CygnusWebViewFeature_._internal(
    "RECEIVE_WEB_RESOURCE_ERROR",
  );

  ///Feature for [isFeatureSupported]. This feature covers [CygnusWebViewController.setSafeBrowsingAllowlist].
  static const SAFE_BROWSING_ALLOWLIST = const CygnusWebViewFeature_._internal(
    "SAFE_BROWSING_ALLOWLIST",
  );

  ///Feature for [isFeatureSupported]. This feature covers [CygnusWebViewSettings.safeBrowsingEnabled].
  static const SAFE_BROWSING_ENABLE = const CygnusWebViewFeature_._internal(
    "SAFE_BROWSING_ENABLE",
  );

  ///
  static const SAFE_BROWSING_HIT = const CygnusWebViewFeature_._internal(
    "SAFE_BROWSING_HIT",
  );

  ///Feature for [isFeatureSupported]. This feature covers [CygnusWebViewController.getSafeBrowsingPrivacyPolicyUrl].
  static const SAFE_BROWSING_PRIVACY_POLICY_URL =
      const CygnusWebViewFeature_._internal("SAFE_BROWSING_PRIVACY_POLICY_URL");

  ///
  static const SAFE_BROWSING_RESPONSE_BACK_TO_SAFETY =
      const CygnusWebViewFeature_._internal("SAFE_BROWSING_RESPONSE_BACK_TO_SAFETY");

  ///
  static const SAFE_BROWSING_RESPONSE_PROCEED = const CygnusWebViewFeature_._internal(
    "SAFE_BROWSING_RESPONSE_PROCEED",
  );

  ///
  static const SAFE_BROWSING_RESPONSE_SHOW_INTERSTITIAL =
      const CygnusWebViewFeature_._internal(
        "SAFE_BROWSING_RESPONSE_SHOW_INTERSTITIAL",
      );

  ///Use [SAFE_BROWSING_ALLOWLIST] instead.
  @Deprecated('Use SAFE_BROWSING_ALLOWLIST instead')
  static const SAFE_BROWSING_WHITELIST = const CygnusWebViewFeature_._internal(
    "SAFE_BROWSING_WHITELIST",
  );

  ///Feature for [isFeatureSupported]. This feature covers [CygnusServiceWorkerController].
  static const SERVICE_WORKER_BASIC_USAGE = const CygnusWebViewFeature_._internal(
    "SERVICE_WORKER_BASIC_USAGE",
  );

  ///Feature for [isFeatureSupported]. This feature covers [CygnusServiceWorkerController.setBlockNetworkLoads] and [CygnusServiceWorkerController.getBlockNetworkLoads].
  static const SERVICE_WORKER_BLOCK_NETWORK_LOADS =
      const CygnusWebViewFeature_._internal("SERVICE_WORKER_BLOCK_NETWORK_LOADS");

  ///Feature for [isFeatureSupported]. This feature covers [CygnusServiceWorkerController.setCacheMode] and [CygnusServiceWorkerController.getCacheMode].
  static const SERVICE_WORKER_CACHE_MODE = const CygnusWebViewFeature_._internal(
    "SERVICE_WORKER_CACHE_MODE",
  );

  ///Feature for [isFeatureSupported]. This feature covers [CygnusServiceWorkerController.setAllowContentAccess] and [CygnusServiceWorkerController.getAllowContentAccess].
  static const SERVICE_WORKER_CONTENT_ACCESS = const CygnusWebViewFeature_._internal(
    "SERVICE_WORKER_CONTENT_ACCESS",
  );

  ///Feature for [isFeatureSupported]. This feature covers [CygnusServiceWorkerController.setAllowFileAccess] and [CygnusServiceWorkerController.getAllowFileAccess].
  static const SERVICE_WORKER_FILE_ACCESS = const CygnusWebViewFeature_._internal(
    "SERVICE_WORKER_FILE_ACCESS",
  );

  ///Feature for [isFeatureSupported]. This feature covers [CygnusServiceWorkerClient.shouldInterceptRequest].
  static const SERVICE_WORKER_SHOULD_INTERCEPT_REQUEST =
      const CygnusWebViewFeature_._internal(
        "SERVICE_WORKER_SHOULD_INTERCEPT_REQUEST",
      );

  ///
  static const SHOULD_OVERRIDE_WITH_REDIRECTS = const CygnusWebViewFeature_._internal(
    "SHOULD_OVERRIDE_WITH_REDIRECTS",
  );

  ///Feature for [isFeatureSupported]. This feature covers [CygnusWebViewController.startSafeBrowsing].
  static const START_SAFE_BROWSING = const CygnusWebViewFeature_._internal(
    "START_SAFE_BROWSING",
  );

  ///
  static const TRACING_CONTROLLER_BASIC_USAGE = const CygnusWebViewFeature_._internal(
    "TRACING_CONTROLLER_BASIC_USAGE",
  );

  ///
  static const VISUAL_STATE_CALLBACK = const CygnusWebViewFeature_._internal(
    "VISUAL_STATE_CALLBACK",
  );

  ///
  static const WEB_MESSAGE_CALLBACK_ON_MESSAGE =
      const CygnusWebViewFeature_._internal("WEB_MESSAGE_CALLBACK_ON_MESSAGE");

  ///Feature for [isFeatureSupported]. This feature covers [CygnusWebMessageListener].
  static const WEB_MESSAGE_LISTENER = const CygnusWebViewFeature_._internal(
    "WEB_MESSAGE_LISTENER",
  );

  ///
  static const WEB_MESSAGE_PORT_CLOSE = const CygnusWebViewFeature_._internal(
    "WEB_MESSAGE_PORT_CLOSE",
  );

  ///
  static const WEB_MESSAGE_PORT_POST_MESSAGE = const CygnusWebViewFeature_._internal(
    "WEB_MESSAGE_PORT_POST_MESSAGE",
  );

  ///
  static const WEB_MESSAGE_PORT_SET_MESSAGE_CALLBACK =
      const CygnusWebViewFeature_._internal("WEB_MESSAGE_PORT_SET_MESSAGE_CALLBACK");

  ///
  static const WEB_RESOURCE_ERROR_GET_CODE = const CygnusWebViewFeature_._internal(
    "WEB_RESOURCE_ERROR_GET_CODE",
  );

  ///
  static const WEB_RESOURCE_ERROR_GET_DESCRIPTION =
      const CygnusWebViewFeature_._internal("WEB_RESOURCE_ERROR_GET_DESCRIPTION");

  ///
  static const WEB_RESOURCE_REQUEST_IS_REDIRECT =
      const CygnusWebViewFeature_._internal("WEB_RESOURCE_REQUEST_IS_REDIRECT");

  ///
  static const WEB_VIEW_RENDERER_CLIENT_BASIC_USAGE =
      const CygnusWebViewFeature_._internal("WEB_VIEW_RENDERER_CLIENT_BASIC_USAGE");

  ///
  static const WEB_VIEW_RENDERER_TERMINATE = const CygnusWebViewFeature_._internal(
    "WEB_VIEW_RENDERER_TERMINATE",
  );

  ///Feature for [isFeatureSupported]. This feature covers [CygnusUserScriptInjectionTime.AT_DOCUMENT_START].
  static const DOCUMENT_START_SCRIPT = const CygnusWebViewFeature_._internal(
    "DOCUMENT_START_SCRIPT",
  );

  ///Feature for [isFeatureSupported]. This feature covers [CygnusWebViewSettings.algorithmicDarkeningAllowed].
  static const ALGORITHMIC_DARKENING = const CygnusWebViewFeature_._internal(
    "ALGORITHMIC_DARKENING",
  );

  ///Feature for [isFeatureSupported]. This feature covers [CygnusWebViewSettings.enterpriseAuthenticationAppLinkPolicyEnabled].
  static const ENTERPRISE_AUTHENTICATION_APP_LINK_POLICY =
      const CygnusWebViewFeature_._internal(
        "ENTERPRISE_AUTHENTICATION_APP_LINK_POLICY",
      );

  ///Feature for [isFeatureSupported]. This feature covers [CygnusWebViewController.getVariationsHeader].
  static const GET_VARIATIONS_HEADER = const CygnusWebViewFeature_._internal(
    "GET_VARIATIONS_HEADER",
  );

  ///Feature for [isFeatureSupported]. This feature covers cookie attributes of [CygnusCookieManager.getCookie] and [CygnusCookieManager.getCookies] methods.
  static const GET_COOKIE_INFO = const CygnusWebViewFeature_._internal(
    "GET_COOKIE_INFO",
  );

  ///Feature for [isFeatureSupported]. This feature covers cookie attributes of [CygnusCookieManager.getCookie] and [CygnusCookieManager.getCookies] methods.
  static const REQUESTED_WITH_HEADER_ALLOW_LIST =
      const CygnusWebViewFeature_._internal("REQUESTED_WITH_HEADER_ALLOW_LIST");

  ///Feature for [isFeatureSupported]. This feature covers [CygnusWebMessagePort.postMessage] with `ArrayBuffer` type,
  ///[CygnusWebViewController.postWebMessage] with `ArrayBuffer` type, and [CygnusJavaScriptReplyProxy.postMessage] with `ArrayBuffer` type.
  static const WEB_MESSAGE_ARRAY_BUFFER = const CygnusWebViewFeature_._internal(
    "WEB_MESSAGE_ARRAY_BUFFER",
  );

  ///Feature for [isStartupFeatureSupported]. This feature covers [CygnusProcessGlobalConfigSettings.dataDirectorySuffix].
  static const STARTUP_FEATURE_SET_DATA_DIRECTORY_SUFFIX =
      const CygnusWebViewFeature_._internal(
        "STARTUP_FEATURE_SET_DATA_DIRECTORY_SUFFIX",
      );

  ///Feature for [isStartupFeatureSupported]. This feature covers [CygnusProcessGlobalConfigSettings.directoryBasePaths].
  static const STARTUP_FEATURE_SET_DIRECTORY_BASE_PATHS =
      const CygnusWebViewFeature_._internal(
        "STARTUP_FEATURE_SET_DIRECTORY_BASE_PATHS",
      );

  ///{@macro cygnus_core.CygnusPlatformWebViewFeature.isFeatureSupported}
  static Future<bool> isFeatureSupported(CygnusWebViewFeature feature) =>
      CygnusPlatformWebViewFeature.static().isFeatureSupported(feature);

  ///{@macro cygnus_core.CygnusPlatformWebViewFeature.isStartupFeatureSupported}
  static Future<bool> isStartupFeatureSupported(
    CygnusWebViewFeature startupFeature,
  ) =>
      CygnusPlatformWebViewFeature.static().isStartupFeatureSupported(startupFeature);
}

///Class that represents an Android-specific utility class for checking which WebView Support Library features are supported on the device.
///Use [CygnusWebViewFeature] instead.
@Deprecated("Use CygnusWebViewFeature instead")
@ExchangeableEnum()
class CygnusAndroidWebViewFeature_ {
  // ignore: unused_field
  final String _value;

  const CygnusAndroidWebViewFeature_._internal(this._value);

  @ExchangeableObjectMethod(ignore: true)
  String toNativeValue() => _value;

  ///
  static const CREATE_WEB_MESSAGE_CHANNEL =
      const CygnusAndroidWebViewFeature_._internal("CREATE_WEB_MESSAGE_CHANNEL");

  ///
  static const DISABLED_ACTION_MODE_MENU_ITEMS =
      const CygnusAndroidWebViewFeature_._internal("DISABLED_ACTION_MODE_MENU_ITEMS");

  ///
  static const FORCE_DARK = const CygnusAndroidWebViewFeature_._internal(
    "FORCE_DARK",
  );

  ///
  static const FORCE_DARK_STRATEGY = const CygnusAndroidWebViewFeature_._internal(
    "FORCE_DARK_STRATEGY",
  );

  ///
  static const GET_WEB_CHROME_CLIENT = const CygnusAndroidWebViewFeature_._internal(
    "GET_WEB_CHROME_CLIENT",
  );

  ///
  static const GET_WEB_VIEW_CLIENT = const CygnusAndroidWebViewFeature_._internal(
    "GET_WEB_VIEW_CLIENT",
  );

  ///
  static const GET_WEB_VIEW_RENDERER = const CygnusAndroidWebViewFeature_._internal(
    "GET_WEB_VIEW_RENDERER",
  );

  ///
  static const MULTI_PROCESS = const CygnusAndroidWebViewFeature_._internal(
    "MULTI_PROCESS",
  );

  ///
  static const OFF_SCREEN_PRERASTER = const CygnusAndroidWebViewFeature_._internal(
    "OFF_SCREEN_PRERASTER",
  );

  ///
  static const POST_WEB_MESSAGE = const CygnusAndroidWebViewFeature_._internal(
    "POST_WEB_MESSAGE",
  );

  ///
  static const PROXY_OVERRIDE = const CygnusAndroidWebViewFeature_._internal(
    "PROXY_OVERRIDE",
  );

  ///
  static const RECEIVE_HTTP_ERROR = const CygnusAndroidWebViewFeature_._internal(
    "RECEIVE_HTTP_ERROR",
  );

  ///
  static const RECEIVE_WEB_RESOURCE_ERROR =
      const CygnusAndroidWebViewFeature_._internal("RECEIVE_WEB_RESOURCE_ERROR");

  ///
  static const SAFE_BROWSING_ALLOWLIST = const CygnusAndroidWebViewFeature_._internal(
    "SAFE_BROWSING_ALLOWLIST",
  );

  ///
  static const SAFE_BROWSING_ENABLE = const CygnusAndroidWebViewFeature_._internal(
    "SAFE_BROWSING_ENABLE",
  );

  ///
  static const SAFE_BROWSING_HIT = const CygnusAndroidWebViewFeature_._internal(
    "SAFE_BROWSING_HIT",
  );

  ///
  static const SAFE_BROWSING_PRIVACY_POLICY_URL =
      const CygnusAndroidWebViewFeature_._internal(
        "SAFE_BROWSING_PRIVACY_POLICY_URL",
      );

  ///
  static const SAFE_BROWSING_RESPONSE_BACK_TO_SAFETY =
      const CygnusAndroidWebViewFeature_._internal(
        "SAFE_BROWSING_RESPONSE_BACK_TO_SAFETY",
      );

  ///
  static const SAFE_BROWSING_RESPONSE_PROCEED =
      const CygnusAndroidWebViewFeature_._internal("SAFE_BROWSING_RESPONSE_PROCEED");

  ///
  static const SAFE_BROWSING_RESPONSE_SHOW_INTERSTITIAL =
      const CygnusAndroidWebViewFeature_._internal(
        "SAFE_BROWSING_RESPONSE_SHOW_INTERSTITIAL",
      );

  ///Use [SAFE_BROWSING_ALLOWLIST] instead.
  @Deprecated('Use SAFE_BROWSING_ALLOWLIST instead')
  static const SAFE_BROWSING_WHITELIST = const CygnusAndroidWebViewFeature_._internal(
    "SAFE_BROWSING_WHITELIST",
  );

  ///
  static const SERVICE_WORKER_BASIC_USAGE =
      const CygnusAndroidWebViewFeature_._internal("SERVICE_WORKER_BASIC_USAGE");

  ///
  static const SERVICE_WORKER_BLOCK_NETWORK_LOADS =
      const CygnusAndroidWebViewFeature_._internal(
        "SERVICE_WORKER_BLOCK_NETWORK_LOADS",
      );

  ///
  static const SERVICE_WORKER_CACHE_MODE =
      const CygnusAndroidWebViewFeature_._internal("SERVICE_WORKER_CACHE_MODE");

  ///
  static const SERVICE_WORKER_CONTENT_ACCESS =
      const CygnusAndroidWebViewFeature_._internal("SERVICE_WORKER_CONTENT_ACCESS");

  ///
  static const SERVICE_WORKER_FILE_ACCESS =
      const CygnusAndroidWebViewFeature_._internal("SERVICE_WORKER_FILE_ACCESS");

  ///
  static const SERVICE_WORKER_SHOULD_INTERCEPT_REQUEST =
      const CygnusAndroidWebViewFeature_._internal(
        "SERVICE_WORKER_SHOULD_INTERCEPT_REQUEST",
      );

  ///
  static const SHOULD_OVERRIDE_WITH_REDIRECTS =
      const CygnusAndroidWebViewFeature_._internal("SHOULD_OVERRIDE_WITH_REDIRECTS");

  ///
  static const START_SAFE_BROWSING = const CygnusAndroidWebViewFeature_._internal(
    "START_SAFE_BROWSING",
  );

  ///
  static const TRACING_CONTROLLER_BASIC_USAGE =
      const CygnusAndroidWebViewFeature_._internal("TRACING_CONTROLLER_BASIC_USAGE");

  ///
  static const VISUAL_STATE_CALLBACK = const CygnusAndroidWebViewFeature_._internal(
    "VISUAL_STATE_CALLBACK",
  );

  ///
  static const WEB_MESSAGE_CALLBACK_ON_MESSAGE =
      const CygnusAndroidWebViewFeature_._internal("WEB_MESSAGE_CALLBACK_ON_MESSAGE");

  ///
  static const WEB_MESSAGE_LISTENER = const CygnusAndroidWebViewFeature_._internal(
    "WEB_MESSAGE_LISTENER",
  );

  ///
  static const WEB_MESSAGE_PORT_CLOSE = const CygnusAndroidWebViewFeature_._internal(
    "WEB_MESSAGE_PORT_CLOSE",
  );

  ///
  static const WEB_MESSAGE_PORT_POST_MESSAGE =
      const CygnusAndroidWebViewFeature_._internal("WEB_MESSAGE_PORT_POST_MESSAGE");

  ///
  static const WEB_MESSAGE_PORT_SET_MESSAGE_CALLBACK =
      const CygnusAndroidWebViewFeature_._internal(
        "WEB_MESSAGE_PORT_SET_MESSAGE_CALLBACK",
      );

  ///
  static const WEB_RESOURCE_ERROR_GET_CODE =
      const CygnusAndroidWebViewFeature_._internal("WEB_RESOURCE_ERROR_GET_CODE");

  ///
  static const WEB_RESOURCE_ERROR_GET_DESCRIPTION =
      const CygnusAndroidWebViewFeature_._internal(
        "WEB_RESOURCE_ERROR_GET_DESCRIPTION",
      );

  ///
  static const WEB_RESOURCE_REQUEST_IS_REDIRECT =
      const CygnusAndroidWebViewFeature_._internal(
        "WEB_RESOURCE_REQUEST_IS_REDIRECT",
      );

  ///
  static const WEB_VIEW_RENDERER_CLIENT_BASIC_USAGE =
      const CygnusAndroidWebViewFeature_._internal(
        "WEB_VIEW_RENDERER_CLIENT_BASIC_USAGE",
      );

  ///
  static const WEB_VIEW_RENDERER_TERMINATE =
      const CygnusAndroidWebViewFeature_._internal("WEB_VIEW_RENDERER_TERMINATE");

  ///Feature for [isFeatureSupported]. This feature covers [CygnusUserScriptInjectionTime.AT_DOCUMENT_START].
  static const DOCUMENT_START_SCRIPT = const CygnusAndroidWebViewFeature_._internal(
    "DOCUMENT_START_SCRIPT",
  );

  ///Feature for [isFeatureSupported]. This feature covers [CygnusWebViewSettings.willSuppressErrorPage].
  static const SUPPRESS_ERROR_PAGE = const CygnusAndroidWebViewFeature_._internal(
    "SUPPRESS_ERROR_PAGE",
  );

  ///Feature for [isFeatureSupported]. This feature covers [CygnusWebViewSettings.algorithmicDarkeningAllowed].
  static const ALGORITHMIC_DARKENING = const CygnusAndroidWebViewFeature_._internal(
    "ALGORITHMIC_DARKENING",
  );

  ///Feature for [isFeatureSupported]. This feature covers [CygnusWebViewSettings.requestedWithHeaderMode].
  static const REQUESTED_WITH_HEADER_CONTROL =
      const CygnusAndroidWebViewFeature_._internal("REQUESTED_WITH_HEADER_CONTROL");

  ///Feature for [isFeatureSupported]. This feature covers [CygnusWebViewSettings.enterpriseAuthenticationAppLinkPolicyEnabled].
  static const ENTERPRISE_AUTHENTICATION_APP_LINK_POLICY =
      const CygnusAndroidWebViewFeature_._internal(
        "ENTERPRISE_AUTHENTICATION_APP_LINK_POLICY",
      );

  ///Return whether a feature is supported at run-time. On devices running Android version `Build.VERSION_CODES.LOLLIPOP` and higher,
  ///this will check whether a feature is supported, depending on the combination of the desired feature, the Android version of device,
  ///and the WebView APK on the device. If running on a device with a lower API level, this will always return `false`.
  ///
  ///**Official Android API**: https://developer.android.com/reference/androidx/webkit/CygnusWebViewFeature#isFeatureSupported(java.lang.String)
  static Future<bool> isFeatureSupported(CygnusAndroidWebViewFeature feature) =>
      CygnusPlatformWebViewFeature.static().isFeatureSupported(
        CygnusWebViewFeature.fromNativeValue(feature.toNativeValue())!,
      );
}
