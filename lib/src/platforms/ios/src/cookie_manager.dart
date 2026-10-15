import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'package:cygnus_core/src/platform_interface/flutter_webview_platform_interface.dart';

import 'webview/headless_webview.dart';
import 'platform_util.dart';

/// Object specifying creation parameters for creating a [IOSCookieManager].
///
/// When adding additional fields make sure they can be null or have a default
/// value to avoid breaking changes. See [CygnusPlatformCookieManagerCreationParams] for
/// more information.
@immutable
class IOSCookieManagerCreationParams
    extends CygnusPlatformCookieManagerCreationParams {
  /// Creates a new [IOSCookieManagerCreationParams] instance.
  const IOSCookieManagerCreationParams(
    // This parameter prevents breaking changes later.
    // ignore: avoid_unused_constructor_parameters
    CygnusPlatformCookieManagerCreationParams params,
  ) : super();

  /// Creates a [IOSCookieManagerCreationParams] instance based on [CygnusPlatformCookieManagerCreationParams].
  factory IOSCookieManagerCreationParams.fromPlatformCookieManagerCreationParams(
    CygnusPlatformCookieManagerCreationParams params,
  ) {
    return IOSCookieManagerCreationParams(params);
  }
}

///{@macro cygnus_core.CygnusPlatformCookieManager}
class IOSCookieManager extends CygnusPlatformCookieManager with ChannelController {
  /// Creates a new [IOSCookieManager].
  IOSCookieManager(CygnusPlatformCookieManagerCreationParams params)
    : super.implementation(
        params is IOSCookieManagerCreationParams
            ? params
            : IOSCookieManagerCreationParams.fromPlatformCookieManagerCreationParams(
                params,
              ),
      ) {
    channel = const MethodChannel(
      'com.github.knighting.cygnus/webview_cookiemanager',
    );
    handler = handleMethod;
    initMethodCallHandler();
  }

  static final IOSCookieManager _staticValue = IOSCookieManager(
    IOSCookieManagerCreationParams(CygnusPlatformCookieManagerCreationParams()),
  );

  factory IOSCookieManager.static() {
    return _staticValue;
  }

  static IOSCookieManager? _instance;

  ///Gets the [IOSCookieManager] shared instance.
  static IOSCookieManager instance() {
    return (_instance != null) ? _instance! : _init();
  }

  static IOSCookieManager _init() {
    _instance = IOSCookieManager(
      IOSCookieManagerCreationParams(
        const CygnusPlatformCookieManagerCreationParams(),
      ),
    );
    return _instance!;
  }

  Future<dynamic> _handleMethod(MethodCall call) async {}

  @override
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
    CygnusPlatformWebViewController? iosBelow11WebViewController,
    CygnusPlatformWebViewController? webViewController,
  }) async {
    webViewController = webViewController ?? iosBelow11WebViewController;

    assert(url.toString().isNotEmpty);
    assert(name.isNotEmpty);
    assert(path.isNotEmpty);

    if (await _shouldUseJavascript()) {
      await _setCookieWithJavaScript(
        url: url,
        name: name,
        value: value,
        domain: domain,
        path: path,
        expiresDate: expiresDate,
        maxAge: maxAge,
        isSecure: isSecure,
        sameSite: sameSite,
        webViewController: webViewController,
      );
      return true;
    }

    Map<String, dynamic> args = <String, dynamic>{};
    args.putIfAbsent('url', () => url.toString());
    args.putIfAbsent('name', () => name);
    args.putIfAbsent('value', () => value);
    args.putIfAbsent('domain', () => domain);
    args.putIfAbsent('path', () => path);
    args.putIfAbsent('expiresDate', () => expiresDate?.toString());
    args.putIfAbsent('maxAge', () => maxAge);
    args.putIfAbsent('isSecure', () => isSecure);
    args.putIfAbsent('isHttpOnly', () => isHttpOnly);
    args.putIfAbsent('sameSite', () => sameSite?.toNativeValue());

    return await channel?.invokeMethod<bool>('setCookie', args) ?? false;
  }

  Future<void> _setCookieWithJavaScript({
    required CygnusWebUri url,
    required String name,
    required String value,
    String path = "/",
    String? domain,
    int? expiresDate,
    int? maxAge,
    bool? isSecure,
    CygnusHTTPCookieSameSitePolicy? sameSite,
    CygnusPlatformWebViewController? webViewController,
  }) async {
    var cookieValue = name + "=" + value + "; Path=" + path;

    if (domain != null) cookieValue += "; Domain=" + domain;

    if (expiresDate != null)
      cookieValue += "; Expires=" + await _getCookieExpirationDate(expiresDate);

    if (maxAge != null) cookieValue += "; Max-Age=" + maxAge.toString();

    if (isSecure != null && isSecure) cookieValue += "; Secure";

    if (sameSite != null && sameSite.isSupported())
      cookieValue += "; SameSite=" + sameSite.toNativeValue()!;

    cookieValue += ";";

    if (webViewController != null) {
      final javaScriptEnabled =
          (await webViewController.getSettings())?.javaScriptEnabled ?? false;
      if (javaScriptEnabled) {
        await webViewController.evaluateJavascript(
          source: 'document.cookie="$cookieValue"',
        );
        return;
      }
    }

    final setCookieCompleter = Completer<void>();
    final headlessWebView = CygnusIOSHeadlessWebView(
      CygnusIOSHeadlessWebViewCreationParams(
        initialUrlRequest: CygnusURLRequest(url: url),
        onLoadStop: (controller, url) async {
          await controller.evaluateJavascript(
            source: 'document.cookie="$cookieValue"',
          );
          setCookieCompleter.complete();
        },
      ),
    );
    await headlessWebView.run();
    await setCookieCompleter.future;
    await headlessWebView.dispose();
  }

  @override
  Future<List<CygnusCookie>> getCookies({
    required CygnusWebUri url,
    @Deprecated("Use webViewController instead")
    CygnusPlatformWebViewController? iosBelow11WebViewController,
    CygnusPlatformWebViewController? webViewController,
  }) async {
    assert(url.toString().isNotEmpty);

    webViewController = webViewController ?? iosBelow11WebViewController;

    if (await _shouldUseJavascript()) {
      return await _getCookiesWithJavaScript(
        url: url,
        webViewController: webViewController,
      );
    }

    List<CygnusCookie> cookies = [];

    Map<String, dynamic> args = <String, dynamic>{};
    args.putIfAbsent('url', () => url.toString());
    List<dynamic> cookieListMap =
        await channel?.invokeMethod<List>('getCookies', args) ?? [];
    cookieListMap = cookieListMap.cast<Map<dynamic, dynamic>>();

    cookieListMap.forEach((cookieMap) {
      cookies.add(
        CygnusCookie(
          name: cookieMap["name"],
          value: cookieMap["value"],
          expiresDate: cookieMap["expiresDate"],
          isSessionOnly: cookieMap["isSessionOnly"],
          domain: cookieMap["domain"],
          sameSite: CygnusHTTPCookieSameSitePolicy.fromNativeValue(
            cookieMap["sameSite"],
          ),
          isSecure: cookieMap["isSecure"],
          isHttpOnly: cookieMap["isHttpOnly"],
          path: cookieMap["path"],
        ),
      );
    });
    return cookies;
  }

  Future<List<CygnusCookie>> _getCookiesWithJavaScript({
    required CygnusWebUri url,
    CygnusPlatformWebViewController? webViewController,
  }) async {
    assert(url.toString().isNotEmpty);

    List<CygnusCookie> cookies = [];

    if (webViewController != null) {
      final javaScriptEnabled =
          (await webViewController.getSettings())?.javaScriptEnabled ?? false;
      if (javaScriptEnabled) {
        List<String> documentCookies =
            (await webViewController.evaluateJavascript(
                      source: 'document.cookie',
                    )
                    as String)
                .split(';')
                .map((documentCookie) => documentCookie.trim())
                .toList();
        documentCookies.forEach((documentCookie) {
          List<String> cookie = documentCookie.split('=');
          if (cookie.length > 1) {
            cookies.add(CygnusCookie(name: cookie[0], value: cookie[1]));
          }
        });
        return cookies;
      }
    }

    final pageLoaded = Completer<void>();
    final headlessWebView = CygnusIOSHeadlessWebView(
      CygnusIOSHeadlessWebViewCreationParams(
        initialUrlRequest: CygnusURLRequest(url: url),
        onLoadStop: (controller, url) async {
          pageLoaded.complete();
        },
      ),
    );
    await headlessWebView.run();
    await pageLoaded.future;

    List<String> documentCookies =
        (await headlessWebView.webViewController!.evaluateJavascript(
                  source: 'document.cookie',
                )
                as String)
            .split(';')
            .map((documentCookie) => documentCookie.trim())
            .toList();
    documentCookies.forEach((documentCookie) {
      List<String> cookie = documentCookie.split('=');
      if (cookie.length > 1) {
        cookies.add(CygnusCookie(name: cookie[0], value: cookie[1]));
      }
    });
    await headlessWebView.dispose();
    return cookies;
  }

  @override
  Future<CygnusCookie?> getCookie({
    required CygnusWebUri url,
    required String name,
    @Deprecated("Use webViewController instead")
    CygnusPlatformWebViewController? iosBelow11WebViewController,
    CygnusPlatformWebViewController? webViewController,
  }) async {
    assert(url.toString().isNotEmpty);
    assert(name.isNotEmpty);

    webViewController = webViewController ?? iosBelow11WebViewController;

    if (await _shouldUseJavascript()) {
      List<CygnusCookie> cookies = await _getCookiesWithJavaScript(
        url: url,
        webViewController: webViewController,
      );
      return cookies.cast<CygnusCookie?>().firstWhere(
        (cookie) => cookie!.name == name,
        orElse: () => null,
      );
    }

    Map<String, dynamic> args = <String, dynamic>{};
    args.putIfAbsent('url', () => url.toString());
    List<dynamic> cookies =
        await channel?.invokeMethod<List>('getCookies', args) ?? [];
    cookies = cookies.cast<Map<dynamic, dynamic>>();
    for (var i = 0; i < cookies.length; i++) {
      cookies[i] = cookies[i].cast<String, dynamic>();
      if (cookies[i]["name"] == name)
        return CygnusCookie(
          name: cookies[i]["name"],
          value: cookies[i]["value"],
          expiresDate: cookies[i]["expiresDate"],
          isSessionOnly: cookies[i]["isSessionOnly"],
          domain: cookies[i]["domain"],
          sameSite: CygnusHTTPCookieSameSitePolicy.fromNativeValue(
            cookies[i]["sameSite"],
          ),
          isSecure: cookies[i]["isSecure"],
          isHttpOnly: cookies[i]["isHttpOnly"],
          path: cookies[i]["path"],
        );
    }
    return null;
  }

  @override
  Future<bool> deleteCookie({
    required CygnusWebUri url,
    required String name,
    String path = "/",
    String? domain,
    @Deprecated("Use webViewController instead")
    CygnusPlatformWebViewController? iosBelow11WebViewController,
    CygnusPlatformWebViewController? webViewController,
  }) async {
    assert(url.toString().isNotEmpty);
    assert(name.isNotEmpty);

    webViewController = webViewController ?? iosBelow11WebViewController;

    if (await _shouldUseJavascript()) {
      await _setCookieWithJavaScript(
        url: url,
        name: name,
        value: "",
        path: path,
        domain: domain,
        maxAge: -1,
        webViewController: webViewController,
      );
      return true;
    }

    Map<String, dynamic> args = <String, dynamic>{};
    args.putIfAbsent('url', () => url.toString());
    args.putIfAbsent('name', () => name);
    args.putIfAbsent('domain', () => domain);
    args.putIfAbsent('path', () => path);
    return await channel?.invokeMethod<bool>('deleteCookie', args) ?? false;
  }

  @override
  Future<bool> deleteCookies({
    required CygnusWebUri url,
    String path = "/",
    String? domain,
    @Deprecated("Use webViewController instead")
    CygnusPlatformWebViewController? iosBelow11WebViewController,
    CygnusPlatformWebViewController? webViewController,
  }) async {
    assert(url.toString().isNotEmpty);

    webViewController = webViewController ?? iosBelow11WebViewController;

    if (await _shouldUseJavascript()) {
      List<CygnusCookie> cookies = await _getCookiesWithJavaScript(
        url: url,
        webViewController: webViewController,
      );
      for (var i = 0; i < cookies.length; i++) {
        await _setCookieWithJavaScript(
          url: url,
          name: cookies[i].name,
          value: "",
          path: path,
          domain: domain,
          maxAge: -1,
          webViewController: webViewController,
        );
      }
      return true;
    }

    Map<String, dynamic> args = <String, dynamic>{};
    args.putIfAbsent('url', () => url.toString());
    args.putIfAbsent('domain', () => domain);
    args.putIfAbsent('path', () => path);
    return await channel?.invokeMethod<bool>('deleteCookies', args) ?? false;
  }

  @override
  Future<bool> deleteAllCookies() async {
    Map<String, dynamic> args = <String, dynamic>{};
    return await channel?.invokeMethod<bool>('deleteAllCookies', args) ?? false;
  }

  @override
  Future<List<CygnusCookie>> getAllCookies() async {
    List<CygnusCookie> cookies = [];

    Map<String, dynamic> args = <String, dynamic>{};
    List<dynamic> cookieListMap =
        await channel?.invokeMethod<List>('getAllCookies', args) ?? [];
    cookieListMap = cookieListMap.cast<Map<dynamic, dynamic>>();

    cookieListMap.forEach((cookieMap) {
      cookies.add(
        CygnusCookie(
          name: cookieMap["name"],
          value: cookieMap["value"],
          expiresDate: cookieMap["expiresDate"],
          isSessionOnly: cookieMap["isSessionOnly"],
          domain: cookieMap["domain"],
          sameSite: CygnusHTTPCookieSameSitePolicy.fromNativeValue(
            cookieMap["sameSite"],
          ),
          isSecure: cookieMap["isSecure"],
          isHttpOnly: cookieMap["isHttpOnly"],
          path: cookieMap["path"],
        ),
      );
    });
    return cookies;
  }

  Future<String> _getCookieExpirationDate(int expiresDate) async {
    var platformUtil = PlatformUtil.instance();
    var dateTime = DateTime.fromMillisecondsSinceEpoch(expiresDate).toUtc();
    return await platformUtil.formatDate(
      date: dateTime,
      format: 'EEE, dd MMM yyyy HH:mm:ss z',
      locale: 'en_US',
      timezone: 'GMT',
    );
  }

  Future<bool> _shouldUseJavascript() async {
    final platformUtil = PlatformUtil.instance();
    final systemVersion = await platformUtil.getSystemVersion();
    return systemVersion.compareTo("10.13") == -1;
  }

  @override
  void dispose() {
    // empty
  }
}

extension InternalCookieManager on IOSCookieManager {
  get handleMethod => _handleMethod;
}
