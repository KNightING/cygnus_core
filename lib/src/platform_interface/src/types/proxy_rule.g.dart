// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'proxy_rule.dart';

// **************************************************************************
// ExchangeableObjectGenerator
// **************************************************************************

///Class that holds a scheme filter and a proxy URL.
class CygnusProxyRule {
  ///A Boolean that indicates whether or not a proxy configuration allows failover to non-proxied connections.
  ///Failover isn’t allowed by default.
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- iOS WKWebView
  ///- macOS WKWebView
  bool? allowFailover;

  ///Define an array of domains to determine which hosts should not use the proxy.
  ///If the array is empty, no domains are excluded.
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- iOS WKWebView
  ///- macOS WKWebView
  List<String>? excludedDomains;

  ///Define an array of domains to determine which hosts should use the proxy. If the array is empty,
  ///all domains are allowed to use the proxy other than domains listed in [excludedDomains].
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- iOS WKWebView
  ///- macOS WKWebView
  List<String>? matchDomains;

  ///Sets a password to use as authentication for a proxy configuration.
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- iOS WKWebView
  ///- macOS WKWebView
  String? password;

  ///Represents the scheme filter.
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView
  ///- Linux WPE WebKit ([Official API - webkit_network_proxy_settings_add_proxy_for_scheme](https://wpewebkit.org/reference/stable/wpe-webkit-2.0/method.NetworkProxySettings.add_proxy_for_scheme.html)):
  ///    - Linux accepts scheme filters: '*', 'http', 'https', 'socks', 'socks4', 'socks5' (case-insensitive). '*' is treated as the default proxy.
  CygnusProxySchemeFilter? schemeFilter;

  ///Represents the proxy URL.
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView
  ///- iOS WKWebView
  ///- macOS WKWebView
  ///- Linux WPE WebKit
  String url;

  ///Sets a username to use as authentication for a proxy configuration.
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- iOS WKWebView
  ///- macOS WKWebView
  String? username;
  CygnusProxyRule({
    this.allowFailover,
    this.excludedDomains,
    this.matchDomains,
    this.password,
    this.schemeFilter,
    required this.url,
    this.username,
  });

  ///Gets a possible [CygnusProxyRule] instance from a [Map] value.
  static CygnusProxyRule? fromMap(
    Map<String, dynamic>? map, {
    CygnusEnumMethod? enumMethod,
  }) {
    if (map == null) {
      return null;
    }
    final instance = CygnusProxyRule(
      allowFailover: map['allowFailover'],
      excludedDomains: map['excludedDomains'] != null
          ? List<String>.from(map['excludedDomains']!.cast<String>())
          : null,
      matchDomains: map['matchDomains'] != null
          ? List<String>.from(map['matchDomains']!.cast<String>())
          : null,
      password: map['password'],
      schemeFilter: switch (enumMethod ?? CygnusEnumMethod.nativeValue) {
        CygnusEnumMethod.nativeValue => CygnusProxySchemeFilter.fromNativeValue(
          map['schemeFilter'],
        ),
        CygnusEnumMethod.value => CygnusProxySchemeFilter.fromValue(
          map['schemeFilter'],
        ),
        CygnusEnumMethod.name => CygnusProxySchemeFilter.byName(
          map['schemeFilter'],
        ),
      },
      url: map['url'],
      username: map['username'],
    );
    return instance;
  }

  ///Converts instance to a map.
  Map<String, dynamic> toMap({CygnusEnumMethod? enumMethod}) {
    return {
      "allowFailover": allowFailover,
      "excludedDomains": excludedDomains,
      "matchDomains": matchDomains,
      "password": password,
      "schemeFilter": switch (enumMethod ?? CygnusEnumMethod.nativeValue) {
        CygnusEnumMethod.nativeValue => schemeFilter?.toNativeValue(),
        CygnusEnumMethod.value => schemeFilter?.toValue(),
        CygnusEnumMethod.name => schemeFilter?.name(),
      },
      "url": url,
      "username": username,
    };
  }

  ///Converts instance to a map.
  Map<String, dynamic> toJson() {
    return toMap();
  }

  @override
  String toString() {
    return 'CygnusProxyRule{allowFailover: $allowFailover, excludedDomains: $excludedDomains, matchDomains: $matchDomains, password: $password, schemeFilter: $schemeFilter, url: $url, username: $username}';
  }
}
