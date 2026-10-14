import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:cygnus_core/src/platform_interface/flutter_inappwebview_platform_interface.dart';

import 'in_app_webview/in_app_webview_controller.dart';
import 'webview_environment/webview_environment.dart';

///{@macro cygnus_core.CygnusPlatformCookieManager}
///
///{@macro cygnus_core.CygnusPlatformCookieManager.supported_platforms}
class CygnusCookieManager {
  ///{@macro cygnus_core.CygnusPlatformCookieManager}
  ///
  ///{@macro cygnus_core.CygnusPlatformCookieManager.supported_platforms}
  CygnusCookieManager()
    : this.fromPlatformCreationParams(
        const CygnusPlatformCookieManagerCreationParams(),
      );

  /// Constructs a [CygnusCookieManager] from creation params for a specific
  /// platform.
  CygnusCookieManager.fromPlatformCreationParams(
    CygnusPlatformCookieManagerCreationParams params,
  ) : this.fromPlatform(CygnusPlatformCookieManager(params));

  /// Constructs a [CygnusCookieManager] from a specific platform
  /// implementation.
  CygnusCookieManager.fromPlatform(this.platform);

  /// Implementation of [CygnusPlatformCookieManager] for the current platform.
  final CygnusPlatformCookieManager platform;

  ///Use [CygnusCookieManager] instead.
  @Deprecated("Use CygnusCookieManager instead")
  CygnusIOSCookieManager ios = CygnusIOSCookieManager.instance();

  static CygnusCookieManager? _instance;

  ///Gets the [CygnusCookieManager] shared instance.
  ///
  ///[webViewEnvironment] (Supported only on Windows) - Used to create the [CygnusCookieManager] using the specified environment.
  static CygnusCookieManager instance({CygnusWebViewEnvironment? webViewEnvironment}) {
    if (webViewEnvironment == null) {
      if (_instance == null) {
        _instance = CygnusCookieManager();
      }
      return _instance!;
    } else {
      return CygnusCookieManager.fromPlatformCreationParams(
        CygnusPlatformCookieManagerCreationParams(
          webViewEnvironment: webViewEnvironment.platform,
        ),
      );
    }
  }

  ///{@macro cygnus_core.CygnusPlatformCookieManager.setCookie}
  ///
  ///{@macro cygnus_core.CygnusPlatformCookieManager.setCookie.supported_platforms}
  Future<bool> setCookie({
    required CygnusWebUri url,
    required String name,
    required String value,
    String path = "/",
    String? domain,
    int? expiresDate,
    int? maxAge,
    bool? isSecure,
    bool? isHttpOnly,
    CygnusHTTPCookieSameSitePolicy? sameSite,
    @Deprecated("Use webViewController instead")
    CygnusWebViewController? iosBelow11WebViewController,
    CygnusWebViewController? webViewController,
  }) => platform.setCookie(
    url: url,
    name: name,
    value: value,
    path: path,
    domain: domain,
    expiresDate: expiresDate,
    maxAge: maxAge,
    isSecure: isSecure,
    isHttpOnly: isHttpOnly,
    sameSite: sameSite,
    iosBelow11WebViewController: iosBelow11WebViewController?.platform,
    webViewController: webViewController?.platform,
  );

  ///{@macro cygnus_core.CygnusPlatformCookieManager.getCookies}
  ///
  ///{@macro cygnus_core.CygnusPlatformCookieManager.getCookies.supported_platforms}
  Future<List<CygnusCookie>> getCookies({
    required CygnusWebUri url,
    @Deprecated("Use webViewController instead")
    CygnusWebViewController? iosBelow11WebViewController,
    CygnusWebViewController? webViewController,
  }) => platform.getCookies(
    url: url,
    iosBelow11WebViewController: iosBelow11WebViewController?.platform,
    webViewController: webViewController?.platform,
  );

  ///{@macro cygnus_core.CygnusPlatformCookieManager.getCookie}
  ///
  ///{@macro cygnus_core.CygnusPlatformCookieManager.getCookie.supported_platforms}
  Future<CygnusCookie?> getCookie({
    required CygnusWebUri url,
    required String name,
    @Deprecated("Use webViewController instead")
    CygnusWebViewController? iosBelow11WebViewController,
    CygnusWebViewController? webViewController,
  }) => platform.getCookie(
    url: url,
    name: name,
    iosBelow11WebViewController: iosBelow11WebViewController?.platform,
    webViewController: webViewController?.platform,
  );

  ///{@macro cygnus_core.CygnusPlatformCookieManager.deleteCookie}
  ///
  ///{@macro cygnus_core.CygnusPlatformCookieManager.deleteCookie.supported_platforms}
  Future<bool> deleteCookie({
    required CygnusWebUri url,
    required String name,
    String path = "/",
    String? domain,
    @Deprecated("Use webViewController instead")
    CygnusWebViewController? iosBelow11WebViewController,
    CygnusWebViewController? webViewController,
  }) => platform.deleteCookie(
    url: url,
    name: name,
    path: path,
    domain: domain,
    iosBelow11WebViewController: iosBelow11WebViewController?.platform,
    webViewController: webViewController?.platform,
  );

  ///{@macro cygnus_core.CygnusPlatformCookieManager.deleteCookies}
  ///
  ///{@macro cygnus_core.CygnusPlatformCookieManager.deleteCookies.supported_platforms}
  Future<bool> deleteCookies({
    required CygnusWebUri url,
    String path = "/",
    String? domain,
    @Deprecated("Use webViewController instead")
    CygnusWebViewController? iosBelow11WebViewController,
    CygnusWebViewController? webViewController,
  }) => platform.deleteCookies(
    url: url,
    path: path,
    domain: domain,
    iosBelow11WebViewController: iosBelow11WebViewController?.platform,
    webViewController: webViewController?.platform,
  );

  ///{@macro cygnus_core.CygnusPlatformCookieManager.deleteAllCookies}
  ///
  ///{@macro cygnus_core.CygnusPlatformCookieManager.deleteAllCookies.supported_platforms}
  Future<bool> deleteAllCookies() => platform.deleteAllCookies();

  ///{@macro cygnus_core.CygnusPlatformCookieManager.getAllCookies}
  ///
  ///{@macro cygnus_core.CygnusPlatformCookieManager.getAllCookies.supported_platforms}
  Future<List<CygnusCookie>> getAllCookies() => platform.getAllCookies();

  ///{@macro cygnus_core.CygnusPlatformCookieManager.removeSessionCookies}
  ///
  ///{@macro cygnus_core.CygnusPlatformCookieManager.removeSessionCookies.supported_platforms}
  Future<bool> removeSessionCookies() => platform.removeSessionCookies();

  ///{@macro cygnus_core.CygnusPlatformCookieManager.flush}
  ///
  ///{@macro cygnus_core.CygnusPlatformCookieManager.flush.supported_platforms}
  Future<void> flush() => platform.flush();

  ///{@macro cygnus_core.CygnusPlatformCookieManagerCreationParams.isClassSupported}
  static bool isClassSupported({TargetPlatform? platform}) =>
      CygnusPlatformCookieManager.static().isClassSupported(platform: platform);

  ///{@macro cygnus_core.CygnusPlatformCookieManagerCreationParams.isPropertySupported}
  static bool isPropertySupported(
    CygnusPlatformCookieManagerCreationParamsProperty property, {
    TargetPlatform? platform,
  }) => CygnusPlatformCookieManager.static().isPropertySupported(
    property,
    platform: platform,
  );

  ///{@macro cygnus_core.CygnusPlatformCookieManager.isMethodSupported}
  static bool isMethodSupported(
    CygnusPlatformCookieManagerMethod method, {
    TargetPlatform? platform,
  }) => CygnusPlatformCookieManager.static().isMethodSupported(
    method,
    platform: platform,
  );
}

///Class that contains only iOS-specific methods of [CygnusCookieManager].
///Use [CygnusCookieManager] instead.
@Deprecated("Use CygnusCookieManager instead")
class CygnusIOSCookieManager {
  static CygnusIOSCookieManager? _instance;

  ///Gets the [CygnusIOSCookieManager] shared instance.
  static CygnusIOSCookieManager instance() {
    return (_instance != null) ? _instance! : _init();
  }

  CygnusIOSCookieManager._();

  static CygnusIOSCookieManager _init() {
    _instance = CygnusIOSCookieManager._();
    return _instance!;
  }

  ///Fetches all stored cookies.
  ///
  ///**NOTE**: available on iOS 11.0+.
  ///
  ///**Official iOS API**: https://developer.apple.com/documentation/webkit/wkhttpcookiestore/2882005-getallcookies
  Future<List<CygnusCookie>> getAllCookies() async {
    return CygnusCookieManager.instance().getAllCookies();
  }
}
