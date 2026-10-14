import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter_inappwebview_internal_annotations/flutter_inappwebview_internal_annotations.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'inappwebview_platform.dart';
import 'platform_webview_feature.dart';
import 'types/enum_method.dart';
import 'types/proxy_rule.dart';

part 'platform_proxy_controller.g.dart';

///{@template cygnus_core.CygnusPlatformProxyControllerCreationParams}
/// Object specifying creation parameters for creating a [CygnusPlatformProxyController].
///
/// Platform specific implementations can add additional fields by extending
/// this class.
///{@endtemplate}
///
///{@macro cygnus_core.CygnusPlatformProxyControllerCreationParams.supported_platforms}
@SupportedPlatforms(
  platforms: [
    AndroidPlatform(),
    IOSPlatform(),
    MacOSPlatform(),
    LinuxPlatform(),
  ],
)
@immutable
class CygnusPlatformProxyControllerCreationParams {
  /// Used by the platform implementation to create a new [CygnusPlatformProxyController].
  const CygnusPlatformProxyControllerCreationParams();

  ///{@template cygnus_core.CygnusPlatformProxyControllerCreationParams.isClassSupported}
  ///Check if the current class is supported by the [defaultTargetPlatform] or a specific [platform].
  ///{@endtemplate}
  bool isClassSupported({TargetPlatform? platform}) =>
      _CygnusPlatformProxyControllerCreationParamsClassSupported.isClassSupported(
        platform: platform,
      );
}

///{@template cygnus_core.CygnusPlatformProxyController}
///Manages setting and clearing a process-specific override for the WebView system-wide proxy settings that govern network requests made by `WebView`.
///
///`WebView` may make network requests in order to fetch content that is not otherwise read from the file system or provided directly by application code.
///In this case by default the system-wide network proxy settings are used to redirect requests to appropriate proxy servers.
///
///In the rare case that it is necessary for an application to explicitly specify its proxy configuration,
///this API may be used to explicitly specify the proxy rules that govern WebView initiated network requests.
///{@endtemplate}
///
///{@macro cygnus_core.CygnusPlatformProxyController.supported_platforms}
@SupportedPlatforms(
  platforms: [
    AndroidPlatform(
      apiName: 'CygnusProxyController',
      apiUrl:
          'https://developer.android.com/reference/androidx/webkit/CygnusProxyController',
    ),
    IOSPlatform(
      apiName: 'WKWebsiteDataStore.proxyConfigurations',
      apiUrl:
          'https://developer.apple.com/documentation/webkit/wkwebsitedatastore/4264546-proxyconfigurations',
      available: '17.0',
    ),
    MacOSPlatform(
      apiName: 'WKWebsiteDataStore.proxyConfigurations',
      apiUrl:
          'https://developer.apple.com/documentation/webkit/wkwebsitedatastore/4264546-proxyconfigurations',
      available: '14.0',
    ),
    LinuxPlatform(
      apiName: 'WebKitNetworkProxySettings',
      apiUrl:
          'https://wpewebkit.org/reference/stable/wpe-webkit-2.0/struct.NetworkProxySettings.html',
    ),
  ],
)
abstract class CygnusPlatformProxyController extends PlatformInterface {
  /// Creates a new [CygnusPlatformProxyController]
  factory CygnusPlatformProxyController(
    CygnusPlatformProxyControllerCreationParams params,
  ) {
    assert(
      CygnusWebViewPlatform.instance != null,
      'A platform implementation for `flutter_inappwebview` has not been set. Please '
      'ensure that an implementation of `CygnusWebViewPlatform` has been set to '
      '`WebViewPlatform.instance` before use. For unit testing, '
      '`WebViewPlatform.instance` can be set with your own test implementation.',
    );
    final CygnusPlatformProxyController proxyController = CygnusWebViewPlatform
        .instance!
        .createPlatformProxyController(params);
    PlatformInterface.verify(proxyController, _token);
    return proxyController;
  }

  /// Creates a new [CygnusPlatformProxyController] to access static methods.
  factory CygnusPlatformProxyController.static() {
    assert(
      CygnusWebViewPlatform.instance != null,
      'A platform implementation for `flutter_inappwebview` has not been set. Please '
      'ensure that an implementation of `CygnusWebViewPlatform` has been set to '
      '`CygnusWebViewPlatform.instance` before use. For unit testing, '
      '`CygnusWebViewPlatform.instance` can be set with your own test implementation.',
    );
    final CygnusPlatformProxyController proxyControllerStatic = CygnusWebViewPlatform
        .instance!
        .createPlatformProxyControllerStatic();
    PlatformInterface.verify(proxyControllerStatic, _token);
    return proxyControllerStatic;
  }

  /// Used by the platform implementation to create a new
  /// [CygnusPlatformProxyController].
  ///
  /// Should only be used by platform implementations because they can't extend
  /// a class that only contains a factory constructor.
  @protected
  CygnusPlatformProxyController.implementation(this.params) : super(token: _token);

  static final Object _token = Object();

  /// The parameters used to initialize the [CygnusPlatformProxyController].
  final CygnusPlatformProxyControllerCreationParams params;

  ///{@template cygnus_core.CygnusPlatformProxyController.setProxyOverride}
  ///Sets [CygnusProxySettings] which will be used by all `WebView`s in the app.
  ///URLs that match patterns in the bypass list will not be directed to any proxy.
  ///Instead, the request will be made directly to the origin specified by the URL.
  ///Network connections are not guaranteed to immediately use the new proxy setting; wait for the method to return before loading a page.
  ///{@endtemplate}
  ///
  ///{@macro cygnus_core.CygnusPlatformProxyController.setProxyOverride.supported_platforms}
  @SupportedPlatforms(
    platforms: [
      AndroidPlatform(
        apiName: 'CygnusProxyController.setProxyOverride',
        apiUrl:
            'https://developer.android.com/reference/androidx/webkit/CygnusProxyController#setProxyOverride(androidx.webkit.ProxyConfig,%20java.util.concurrent.Executor,%20java.lang.Runnable)',
      ),
      IOSPlatform(
        apiName: 'WKWebsiteDataStore.proxyConfigurations',
        apiUrl:
            'https://developer.apple.com/documentation/webkit/wkwebsitedatastore/4264546-proxyconfigurations',
        available: '17.0',
      ),
      MacOSPlatform(
        apiName: 'WKWebsiteDataStore.proxyConfigurations',
        apiUrl:
            'https://developer.apple.com/documentation/webkit/wkwebsitedatastore/4264546-proxyconfigurations',
        available: '14.0',
      ),
      LinuxPlatform(
        apiName: 'webkit_network_session_set_proxy_settings',
        apiUrl:
            'https://wpewebkit.org/reference/stable/wpe-webkit-2.0/method.NetworkSession.set_proxy_settings.html',
      ),
    ],
  )
  Future<void> setProxyOverride({required CygnusProxySettings settings}) {
    throw UnimplementedError(
      'setProxyOverride is not implemented on the current platform',
    );
  }

  ///{@template cygnus_core.CygnusPlatformProxyController.clearProxyOverride}
  ///Clears the proxy settings.
  ///Network connections are not guaranteed to immediately use the new proxy setting;
  ///wait for the method to return before loading a page.
  ///{@endtemplate}
  ///
  ///{@macro cygnus_core.CygnusPlatformProxyController.clearProxyOverride.supported_platforms}
  @SupportedPlatforms(
    platforms: [
      AndroidPlatform(
        apiName: 'CygnusProxyController.clearProxyOverride',
        apiUrl:
            'https://developer.android.com/reference/androidx/webkit/CygnusProxyController#clearProxyOverride(java.util.concurrent.Executor,%20java.lang.Runnable)',
      ),
      IOSPlatform(
        apiName: 'WKWebsiteDataStore.proxyConfigurations',
        apiUrl:
            'https://developer.apple.com/documentation/webkit/wkwebsitedatastore/4264546-proxyconfigurations',
        available: '17.0',
      ),
      MacOSPlatform(
        apiName: 'WKWebsiteDataStore.proxyConfigurations',
        apiUrl:
            'https://developer.apple.com/documentation/webkit/wkwebsitedatastore/4264546-proxyconfigurations',
        available: '14.0',
      ),
      LinuxPlatform(
        apiName: 'webkit_network_session_set_proxy_settings',
        apiUrl:
            'https://wpewebkit.org/reference/stable/wpe-webkit-2.0/method.NetworkSession.set_proxy_settings.html',
      ),
    ],
  )
  Future<void> clearProxyOverride() {
    throw UnimplementedError(
      'clearProxyOverride is not implemented on the current platform',
    );
  }

  ///{@macro cygnus_core.CygnusPlatformProxyControllerCreationParams.isClassSupported}
  bool isClassSupported({TargetPlatform? platform}) =>
      params.isClassSupported(platform: platform);

  ///{@template cygnus_core.CygnusPlatformProxyController.isMethodSupported}
  ///Check if the given [method] is supported by the [defaultTargetPlatform] or a specific [platform].
  ///{@endtemplate}
  bool isMethodSupported(
    CygnusPlatformProxyControllerMethod method, {
    TargetPlatform? platform,
  }) => _CygnusPlatformProxyControllerMethodSupported.isMethodSupported(
    method,
    platform: platform,
  );
}

///{@template cygnus_core.CygnusProxySettings}
///Class that represents the settings used to configure the [CygnusPlatformProxyController].
///{@endtemplate}
///
///{@macro cygnus_core.CygnusProxySettings.supported_platforms}
@SupportedPlatforms(
  platforms: [
    AndroidPlatform(
      apiName: 'ProxyConfig',
      apiUrl:
          'https://developer.android.com/reference/androidx/webkit/ProxyConfig',
    ),
    IOSPlatform(
      apiName: 'ProxyConfiguration',
      apiUrl:
          'https://developer.apple.com/documentation/network/proxyconfiguration',
      available: '17.0',
    ),
    MacOSPlatform(
      apiName: 'ProxyConfiguration',
      apiUrl:
          'https://developer.apple.com/documentation/network/proxyconfiguration',
      available: '14.0',
    ),
    LinuxPlatform(
      apiName: 'WebKitNetworkProxySettings',
      apiUrl:
          'https://wpewebkit.org/reference/stable/wpe-webkit-2.0/struct.NetworkProxySettings.html',
    ),
  ],
)
@ExchangeableObject(copyMethod: true)
class CygnusProxySettings_ {
  ///List of bypass rules.
  ///
  ///A bypass rule describes URLs that should skip proxy override settings and make a direct connection instead. These can be URLs or IP addresses. Wildcards are accepted.
  ///For instance, the rule "*example.com" would mean that requests to "http://example.com" and "www.example.com" would not be directed to any proxy,
  ///instead, would be made directly to the origin specified by the URL.
  @SupportedPlatforms(
    platforms: [
      AndroidPlatform(),
      LinuxPlatform(
        apiName: 'webkit_network_proxy_settings_new (ignore_hosts)',
        apiUrl:
            'https://wpewebkit.org/reference/stable/wpe-webkit-2.0/ctor.NetworkProxySettings.new.html',
        note:
            'Mapped to ignore_hosts; bypass rules are passed as host patterns to WebKitNetworkProxySettings.',
      ),
    ],
  )
  List<String> bypassRules;

  ///List of scheme filters.
  ///
  ///URLs that match these scheme filters are connected to directly instead of using a proxy server.
  @SupportedPlatforms(platforms: [AndroidPlatform()])
  List<String> directs;

  ///List of proxy rules to be used for all URLs. Additional rules have decreasing precedence.
  ///
  ///Proxy is a string in the format `[scheme://]host[:port]`.
  ///Scheme is optional, if present must be `HTTP`, `HTTPS` or [SOCKS](https://tools.ietf.org/html/rfc1928) and defaults to `HTTP`.
  ///Host is one of an IPv6 literal with brackets, an IPv4 literal or one or more labels separated by a period.
  ///Port number is optional and defaults to `80` for `HTTP`, `443` for `HTTPS` and `1080` for `SOCKS`.
  ///
  ///The correct syntax for hosts is defined by [RFC 3986](https://tools.ietf.org/html/rfc3986#section-3.2.2).
  @SupportedPlatforms(
    platforms: [
      AndroidPlatform(),
      IOSPlatform(),
      MacOSPlatform(),
      LinuxPlatform(),
    ],
  )
  List<CygnusProxyRule_> proxyRules;

  ///Hostnames without a period in them (and that are not IP literals) will skip proxy settings and be connected to directly instead. Examples: `"abc"`, `"local"`, `"some-domain"`.
  ///
  ///Hostnames with a trailing dot are not considered simple by this definition.
  @SupportedPlatforms(platforms: [AndroidPlatform()])
  bool? bypassSimpleHostnames;

  ///By default, certain hostnames implicitly bypass the proxy if they are link-local IPs, or localhost addresses.
  ///For instance hostnames matching any of (non-exhaustive list):
  ///- localhost
  ///- *.localhost
  ///- [::1]
  ///- 127.0.0.1/8
  ///- 169.254/16
  ///- [FE80::]/10
  ///Set this to `true` to override the default behavior and force localhost and link-local URLs to be sent through the proxy.
  @SupportedPlatforms(platforms: [AndroidPlatform()])
  bool? removeImplicitRules;

  ///Reverse the bypass list.
  ///
  ///The default value is `false`, in which case all URLs will use proxy settings except the ones in the bypass list, which will be connected to directly instead.
  ///
  ///If set to `true`, then only URLs in the bypass list will use these proxy settings, and all other URLs will be connected to directly.
  ///
  ///Use [bypassRules] to add bypass rules.
  ///
  ///**NOTE**: available only if [CygnusWebViewFeature.PROXY_OVERRIDE_REVERSE_BYPASS] feature is supported.
  @SupportedPlatforms(platforms: [AndroidPlatform()])
  bool reverseBypassEnabled;

  CygnusProxySettings_({
    this.bypassRules = const [],
    this.directs = const [],
    this.proxyRules = const [],
    this.bypassSimpleHostnames,
    this.removeImplicitRules,
    this.reverseBypassEnabled = false,
  });

  ///{@template cygnus_core.CygnusProxySettings.isClassSupported}
  ///Check if the current class is supported by the [defaultTargetPlatform] or a specific [platform].
  ///{@endtemplate}
  static bool isClassSupported({TargetPlatform? platform}) =>
      _CygnusProxySettingsClassSupported.isClassSupported(platform: platform);

  ///{@template cygnus_core.CygnusProxySettings.isPropertySupported}
  ///Check if the current class is supported by the [defaultTargetPlatform] or a specific [platform].
  ///{@endtemplate}
  static bool isPropertySupported(
    CygnusProxySettingsProperty property, {
    TargetPlatform? platform,
  }) => _CygnusProxySettingsPropertySupported.isPropertySupported(
    property,
    platform: platform,
  );
}
