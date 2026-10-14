// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'platform_proxy_controller.dart';

// **************************************************************************
// ExchangeableObjectGenerator
// **************************************************************************

///{@template cygnus_core.CygnusProxySettings}
///Class that represents the settings used to configure the [CygnusPlatformProxyController].
///{@endtemplate}
///
///{@macro cygnus_core.CygnusProxySettings.supported_platforms}
///
///**Officially Supported Platforms/Implementations**:
///- Android WebView ([Official API - ProxyConfig](https://developer.android.com/reference/androidx/webkit/ProxyConfig))
///- iOS WKWebView 17.0+ ([Official API - ProxyConfiguration](https://developer.apple.com/documentation/network/proxyconfiguration))
///- macOS WKWebView 14.0+ ([Official API - ProxyConfiguration](https://developer.apple.com/documentation/network/proxyconfiguration))
///- Linux WPE WebKit ([Official API - WebKitNetworkProxySettings](https://wpewebkit.org/reference/stable/wpe-webkit-2.0/struct.NetworkProxySettings.html))
class CygnusProxySettings {
  ///List of bypass rules.
  ///
  ///A bypass rule describes URLs that should skip proxy override settings and make a direct connection instead. These can be URLs or IP addresses. Wildcards are accepted.
  ///For instance, the rule "*example.com" would mean that requests to "http://example.com" and "www.example.com" would not be directed to any proxy,
  ///instead, would be made directly to the origin specified by the URL.
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView
  ///- Linux WPE WebKit ([Official API - webkit_network_proxy_settings_new (ignore_hosts)](https://wpewebkit.org/reference/stable/wpe-webkit-2.0/ctor.NetworkProxySettings.new.html)):
  ///    - Mapped to ignore_hosts; bypass rules are passed as host patterns to WebKitNetworkProxySettings.
  List<String> bypassRules;

  ///Hostnames without a period in them (and that are not IP literals) will skip proxy settings and be connected to directly instead. Examples: `"abc"`, `"local"`, `"some-domain"`.
  ///
  ///Hostnames with a trailing dot are not considered simple by this definition.
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView
  bool? bypassSimpleHostnames;

  ///List of scheme filters.
  ///
  ///URLs that match these scheme filters are connected to directly instead of using a proxy server.
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView
  List<String> directs;

  ///List of proxy rules to be used for all URLs. Additional rules have decreasing precedence.
  ///
  ///Proxy is a string in the format `[scheme://]host[:port]`.
  ///Scheme is optional, if present must be `HTTP`, `HTTPS` or [SOCKS](https://tools.ietf.org/html/rfc1928) and defaults to `HTTP`.
  ///Host is one of an IPv6 literal with brackets, an IPv4 literal or one or more labels separated by a period.
  ///Port number is optional and defaults to `80` for `HTTP`, `443` for `HTTPS` and `1080` for `SOCKS`.
  ///
  ///The correct syntax for hosts is defined by [RFC 3986](https://tools.ietf.org/html/rfc3986#section-3.2.2).
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView
  ///- iOS WKWebView
  ///- macOS WKWebView
  ///- Linux WPE WebKit
  List<CygnusProxyRule> proxyRules;

  ///By default, certain hostnames implicitly bypass the proxy if they are link-local IPs, or localhost addresses.
  ///For instance hostnames matching any of (non-exhaustive list):
  ///- localhost
  ///- *.localhost
  ///- [::1]
  ///- 127.0.0.1/8
  ///- 169.254/16
  ///- [FE80::]/10
  ///Set this to `true` to override the default behavior and force localhost and link-local URLs to be sent through the proxy.
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView
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
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView
  bool reverseBypassEnabled;

  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView ([Official API - ProxyConfig](https://developer.android.com/reference/androidx/webkit/ProxyConfig))
  ///- iOS WKWebView 17.0+ ([Official API - ProxyConfiguration](https://developer.apple.com/documentation/network/proxyconfiguration))
  ///- macOS WKWebView 14.0+ ([Official API - ProxyConfiguration](https://developer.apple.com/documentation/network/proxyconfiguration))
  ///- Linux WPE WebKit ([Official API - WebKitNetworkProxySettings](https://wpewebkit.org/reference/stable/wpe-webkit-2.0/struct.NetworkProxySettings.html))
  CygnusProxySettings({
    this.bypassRules = const [],
    this.bypassSimpleHostnames,
    this.directs = const [],
    this.proxyRules = const [],
    this.removeImplicitRules,
    this.reverseBypassEnabled = false,
  });

  ///Gets a possible [CygnusProxySettings] instance from a [Map] value.
  static CygnusProxySettings? fromMap(
    Map<String, dynamic>? map, {
    CygnusEnumMethod? enumMethod,
  }) {
    if (map == null) {
      return null;
    }
    final instance = CygnusProxySettings(
      bypassSimpleHostnames: map['bypassSimpleHostnames'],
      removeImplicitRules: map['removeImplicitRules'],
    );
    if (map['bypassRules'] != null) {
      instance.bypassRules = List<String>.from(
        map['bypassRules']!.cast<String>(),
      );
    }
    if (map['directs'] != null) {
      instance.directs = List<String>.from(map['directs']!.cast<String>());
    }
    if (map['proxyRules'] != null) {
      instance.proxyRules = List<CygnusProxyRule>.from(
        map['proxyRules'].map(
          (e) => CygnusProxyRule.fromMap(
            e?.cast<String, dynamic>(),
            enumMethod: enumMethod,
          )!,
        ),
      );
    }
    if (map['reverseBypassEnabled'] != null) {
      instance.reverseBypassEnabled = map['reverseBypassEnabled'];
    }
    return instance;
  }

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

  ///Converts instance to a map.
  Map<String, dynamic> toMap({CygnusEnumMethod? enumMethod}) {
    return {
      "bypassRules": bypassRules,
      "bypassSimpleHostnames": bypassSimpleHostnames,
      "directs": directs,
      "proxyRules": proxyRules
          .map((e) => e.toMap(enumMethod: enumMethod))
          .toList(),
      "removeImplicitRules": removeImplicitRules,
      "reverseBypassEnabled": reverseBypassEnabled,
    };
  }

  ///Converts instance to a map.
  Map<String, dynamic> toJson() {
    return toMap();
  }

  ///Returns a copy of CygnusProxySettings.
  CygnusProxySettings copy() {
    return CygnusProxySettings.fromMap(toMap()) ?? CygnusProxySettings();
  }

  @override
  String toString() {
    return 'CygnusProxySettings{bypassRules: $bypassRules, bypassSimpleHostnames: $bypassSimpleHostnames, directs: $directs, proxyRules: $proxyRules, removeImplicitRules: $removeImplicitRules, reverseBypassEnabled: $reverseBypassEnabled}';
  }
}

// **************************************************************************
// SupportedPlatformsGenerator
// **************************************************************************

extension _CygnusPlatformProxyControllerCreationParamsClassSupported
    on CygnusPlatformProxyControllerCreationParams {
  ///{@template cygnus_core.CygnusPlatformProxyControllerCreationParams.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView
  ///- iOS WKWebView
  ///- macOS WKWebView
  ///- Linux WPE WebKit
  ///
  ///Use the [CygnusPlatformProxyControllerCreationParams.isClassSupported] method to check if this class is supported at runtime.
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

extension _CygnusPlatformProxyControllerClassSupported
    on CygnusPlatformProxyController {
  ///{@template cygnus_core.CygnusPlatformProxyController.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView ([Official API - CygnusProxyController](https://developer.android.com/reference/androidx/webkit/CygnusProxyController))
  ///- iOS WKWebView 17.0+ ([Official API - WKWebsiteDataStore.proxyConfigurations](https://developer.apple.com/documentation/webkit/wkwebsitedatastore/4264546-proxyconfigurations))
  ///- macOS WKWebView 14.0+ ([Official API - WKWebsiteDataStore.proxyConfigurations](https://developer.apple.com/documentation/webkit/wkwebsitedatastore/4264546-proxyconfigurations))
  ///- Linux WPE WebKit ([Official API - WebKitNetworkProxySettings](https://wpewebkit.org/reference/stable/wpe-webkit-2.0/struct.NetworkProxySettings.html))
  ///
  ///Use the [CygnusPlatformProxyController.isClassSupported] method to check if this class is supported at runtime.
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

///List of [CygnusPlatformProxyController]'s methods that can be used to check if they are supported or not by the current platform.
enum CygnusPlatformProxyControllerMethod {
  ///Can be used to check if the [CygnusPlatformProxyController.clearProxyOverride] method is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusPlatformProxyController.clearProxyOverride.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView ([Official API - CygnusProxyController.clearProxyOverride](https://developer.android.com/reference/androidx/webkit/CygnusProxyController#clearProxyOverride(java.util.concurrent.Executor,%20java.lang.Runnable)))
  ///- iOS WKWebView 17.0+ ([Official API - WKWebsiteDataStore.proxyConfigurations](https://developer.apple.com/documentation/webkit/wkwebsitedatastore/4264546-proxyconfigurations))
  ///- macOS WKWebView 14.0+ ([Official API - WKWebsiteDataStore.proxyConfigurations](https://developer.apple.com/documentation/webkit/wkwebsitedatastore/4264546-proxyconfigurations))
  ///- Linux WPE WebKit ([Official API - webkit_network_session_set_proxy_settings](https://wpewebkit.org/reference/stable/wpe-webkit-2.0/method.NetworkSession.set_proxy_settings.html))
  ///
  ///Use the [CygnusPlatformProxyController.isMethodSupported] method to check if this method is supported at runtime.
  ///{@endtemplate}
  clearProxyOverride,

  ///Can be used to check if the [CygnusPlatformProxyController.setProxyOverride] method is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusPlatformProxyController.setProxyOverride.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView ([Official API - CygnusProxyController.setProxyOverride](https://developer.android.com/reference/androidx/webkit/CygnusProxyController#setProxyOverride(androidx.webkit.ProxyConfig,%20java.util.concurrent.Executor,%20java.lang.Runnable)))
  ///- iOS WKWebView 17.0+ ([Official API - WKWebsiteDataStore.proxyConfigurations](https://developer.apple.com/documentation/webkit/wkwebsitedatastore/4264546-proxyconfigurations))
  ///- macOS WKWebView 14.0+ ([Official API - WKWebsiteDataStore.proxyConfigurations](https://developer.apple.com/documentation/webkit/wkwebsitedatastore/4264546-proxyconfigurations))
  ///- Linux WPE WebKit ([Official API - webkit_network_session_set_proxy_settings](https://wpewebkit.org/reference/stable/wpe-webkit-2.0/method.NetworkSession.set_proxy_settings.html))
  ///
  ///**Parameters - Officially Supported Platforms/Implementations**:
  ///- [settings]: all platforms
  ///
  ///Use the [CygnusPlatformProxyController.isMethodSupported] method to check if this method is supported at runtime.
  ///{@endtemplate}
  setProxyOverride,
}

extension _CygnusPlatformProxyControllerMethodSupported
    on CygnusPlatformProxyController {
  static bool isMethodSupported(
    CygnusPlatformProxyControllerMethod method, {
    TargetPlatform? platform,
  }) {
    switch (method) {
      case CygnusPlatformProxyControllerMethod.clearProxyOverride:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [
              TargetPlatform.android,
              TargetPlatform.iOS,
              TargetPlatform.macOS,
              TargetPlatform.linux,
            ].contains(platform ?? defaultTargetPlatform);
      case CygnusPlatformProxyControllerMethod.setProxyOverride:
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

extension _CygnusProxySettingsClassSupported on CygnusProxySettings {
  ///{@template cygnus_core.CygnusProxySettings.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView ([Official API - ProxyConfig](https://developer.android.com/reference/androidx/webkit/ProxyConfig))
  ///- iOS WKWebView 17.0+ ([Official API - ProxyConfiguration](https://developer.apple.com/documentation/network/proxyconfiguration))
  ///- macOS WKWebView 14.0+ ([Official API - ProxyConfiguration](https://developer.apple.com/documentation/network/proxyconfiguration))
  ///- Linux WPE WebKit ([Official API - WebKitNetworkProxySettings](https://wpewebkit.org/reference/stable/wpe-webkit-2.0/struct.NetworkProxySettings.html))
  ///
  ///Use the [CygnusProxySettings.isClassSupported] method to check if this class is supported at runtime.
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

///List of [CygnusProxySettings]'s properties that can be used to check i they are supported or not by the current platform.
enum CygnusProxySettingsProperty {
  ///Can be used to check if the [CygnusProxySettings.bypassRules] property is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusProxySettings.bypassRules.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView
  ///- Linux WPE WebKit ([Official API - webkit_network_proxy_settings_new (ignore_hosts)](https://wpewebkit.org/reference/stable/wpe-webkit-2.0/ctor.NetworkProxySettings.new.html)):
  ///    - Mapped to ignore_hosts; bypass rules are passed as host patterns to WebKitNetworkProxySettings.
  ///
  ///Use the [CygnusProxySettings.isPropertySupported] method to check if this property is supported at runtime.
  ///{@endtemplate}
  bypassRules,

  ///Can be used to check if the [CygnusProxySettings.bypassSimpleHostnames] property is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusProxySettings.bypassSimpleHostnames.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView
  ///
  ///Use the [CygnusProxySettings.isPropertySupported] method to check if this property is supported at runtime.
  ///{@endtemplate}
  bypassSimpleHostnames,

  ///Can be used to check if the [CygnusProxySettings.directs] property is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusProxySettings.directs.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView
  ///
  ///Use the [CygnusProxySettings.isPropertySupported] method to check if this property is supported at runtime.
  ///{@endtemplate}
  directs,

  ///Can be used to check if the [CygnusProxySettings.proxyRules] property is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusProxySettings.proxyRules.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView
  ///- iOS WKWebView
  ///- macOS WKWebView
  ///- Linux WPE WebKit
  ///
  ///Use the [CygnusProxySettings.isPropertySupported] method to check if this property is supported at runtime.
  ///{@endtemplate}
  proxyRules,

  ///Can be used to check if the [CygnusProxySettings.removeImplicitRules] property is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusProxySettings.removeImplicitRules.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView
  ///
  ///Use the [CygnusProxySettings.isPropertySupported] method to check if this property is supported at runtime.
  ///{@endtemplate}
  removeImplicitRules,

  ///Can be used to check if the [CygnusProxySettings.reverseBypassEnabled] property is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusProxySettings.reverseBypassEnabled.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView
  ///
  ///Use the [CygnusProxySettings.isPropertySupported] method to check if this property is supported at runtime.
  ///{@endtemplate}
  reverseBypassEnabled,
}

extension _CygnusProxySettingsPropertySupported on CygnusProxySettings {
  static bool isPropertySupported(
    CygnusProxySettingsProperty property, {
    TargetPlatform? platform,
  }) {
    switch (property) {
      case CygnusProxySettingsProperty.bypassRules:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [
              TargetPlatform.android,
              TargetPlatform.linux,
            ].contains(platform ?? defaultTargetPlatform);
      case CygnusProxySettingsProperty.bypassSimpleHostnames:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [
              TargetPlatform.android,
            ].contains(platform ?? defaultTargetPlatform);
      case CygnusProxySettingsProperty.directs:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [
              TargetPlatform.android,
            ].contains(platform ?? defaultTargetPlatform);
      case CygnusProxySettingsProperty.proxyRules:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [
              TargetPlatform.android,
              TargetPlatform.iOS,
              TargetPlatform.macOS,
              TargetPlatform.linux,
            ].contains(platform ?? defaultTargetPlatform);
      case CygnusProxySettingsProperty.removeImplicitRules:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [
              TargetPlatform.android,
            ].contains(platform ?? defaultTargetPlatform);
      case CygnusProxySettingsProperty.reverseBypassEnabled:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [
              TargetPlatform.android,
            ].contains(platform ?? defaultTargetPlatform);
    }
  }
}
