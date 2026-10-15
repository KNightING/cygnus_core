import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:cygnus_core_internal_annotations/cygnus_core_internal_annotations.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'webview/platform_headless_webview.dart';
import 'webview/platform_webview_controller.dart';
import 'webview_platform.dart';
import 'types/main.dart';
import 'web_uri.dart';
import 'webview_environment/platform_webview_environment.dart';

part 'platform_cookie_manager.g.dart';

///{@template cygnus_core.CygnusPlatformCookieManagerCreationParams}
/// Object specifying creation parameters for creating a [CygnusPlatformCookieManager].
///
/// Platform specific implementations can add additional fields by extending
/// this class.
///{@endtemplate}
///
///{@macro cygnus_core.CygnusPlatformCookieManagerCreationParams.supported_platforms}
@SupportedPlatforms(
  platforms: [
    AndroidPlatform(),
    IOSPlatform(),
    LinuxPlatform(),
    MacOSPlatform(),
    WebPlatform(),
    WindowsPlatform(),
  ],
)
@immutable
class CygnusPlatformCookieManagerCreationParams {
  /// Used by the platform implementation to create a new [CygnusPlatformCookieManager].
  const CygnusPlatformCookieManagerCreationParams({this.webViewEnvironment});

  ///{@template cygnus_core.CygnusPlatformCookieManagerCreationParams.webViewEnvironment}
  ///Used to create the [CygnusPlatformCookieManager] using the specified environment.
  ///{@endtemplate}
  ///
  ///{@macro cygnus_core.CygnusPlatformCookieManagerCreationParams.webViewEnvironment.supported_platforms}
  @SupportedPlatforms(platforms: [WindowsPlatform()])
  final CygnusPlatformWebViewEnvironment? webViewEnvironment;

  ///{@template cygnus_core.CygnusPlatformCookieManagerCreationParams.isClassSupported}
  ///Check if the current class is supported by the [defaultTargetPlatform] or a specific [platform].
  ///{@endtemplate}
  bool isClassSupported({TargetPlatform? platform}) =>
      _CygnusPlatformCookieManagerCreationParamsClassSupported.isClassSupported(
        platform: platform,
      );

  ///{@template cygnus_core.CygnusPlatformCookieManagerCreationParams.isPropertySupported}
  ///Check if the given [property] is supported by the [defaultTargetPlatform] or a specific [platform].
  ///{@endtemplate}
  bool isPropertySupported(
    CygnusPlatformCookieManagerCreationParamsProperty property, {
    TargetPlatform? platform,
  }) =>
      _CygnusPlatformCookieManagerCreationParamsPropertySupported.isPropertySupported(
        property,
        platform: platform,
      );
}

///{@template cygnus_core.CygnusPlatformCookieManager}
///Class that implements a singleton object (shared instance) which manages the cookies used by WebView instances.
///{@endtemplate}
///
///{@macro cygnus_core.CygnusPlatformCookieManager.supported_platforms}
@SupportedPlatforms(
  platforms: [
    AndroidPlatform(
      note:
          'It is implemented using [CygnusCookieManager](https://developer.android.com/reference/android/webkit/CygnusCookieManager).',
    ),
    IOSPlatform(
      note:
          """It is implemented using [WKHTTPCookieStore](https://developer.apple.com/documentation/webkit/wkhttpcookiestore).
On iOS below 11.0, it is implemented using JavaScript. See https://developer.mozilla.org/en-US/docs/Web/HTTP/Cookies#restrict_access_to_cookies for JavaScript restrictions.
  """,
    ),
    LinuxPlatform(
      apiName: 'WebKitCookieManager',
      apiUrl:
          'https://wpewebkit.org/reference/stable/wpe-webkit-2.0/class.CygnusCookieManager.html',
      note: 'It is implemented using WebKitCookieManager from WPE WebKit.',
    ),
    MacOSPlatform(
      note:
          'It is implemented using [WKHTTPCookieStore](https://developer.apple.com/documentation/webkit/wkhttpcookiestore).',
    ),
    WebPlatform(
      note: """It is implemented using JavaScript.
See https://developer.mozilla.org/en-US/docs/Web/HTTP/Cookies#restrict_access_to_cookies for JavaScript restrictions.
  """,
    ),
    WindowsPlatform(),
  ],
)
abstract class CygnusPlatformCookieManager extends PlatformInterface {
  /// Creates a new [CygnusPlatformCookieManager]
  factory CygnusPlatformCookieManager(CygnusPlatformCookieManagerCreationParams params) {
    assert(
      CygnusWebViewPlatform.instance != null,
      'A platform implementation for `cygnus` has not been set. Please '
      'ensure that an implementation of `CygnusWebViewPlatform` has been set to '
      '`WebViewPlatform.instance` before use. For unit testing, '
      '`WebViewPlatform.instance` can be set with your own test implementation.',
    );
    final CygnusPlatformCookieManager cookieManager = CygnusWebViewPlatform.instance!
        .createPlatformCookieManager(params);
    PlatformInterface.verify(cookieManager, _token);
    return cookieManager;
  }

  /// Creates a new [CygnusPlatformCookieManager] to access static methods.
  factory CygnusPlatformCookieManager.static() {
    assert(
      CygnusWebViewPlatform.instance != null,
      'A platform implementation for `cygnus` has not been set. Please '
      'ensure that an implementation of `CygnusWebViewPlatform` has been set to '
      '`CygnusWebViewPlatform.instance` before use. For unit testing, '
      '`CygnusWebViewPlatform.instance` can be set with your own test implementation.',
    );
    final CygnusPlatformCookieManager cookieManagerStatic = CygnusWebViewPlatform
        .instance!
        .createPlatformCookieManagerStatic();
    PlatformInterface.verify(cookieManagerStatic, _token);
    return cookieManagerStatic;
  }

  /// Used by the platform implementation to create a new
  /// [CygnusPlatformCookieManager].
  ///
  /// Should only be used by platform implementations because they can't extend
  /// a class that only contains a factory constructor.
  @protected
  CygnusPlatformCookieManager.implementation(this.params) : super(token: _token);

  static final Object _token = Object();

  /// The parameters used to initialize the [CygnusPlatformCookieManager].
  final CygnusPlatformCookieManagerCreationParams params;

  ///{@template cygnus_core.CygnusPlatformCookieManager.setCookie}
  ///Sets a cookie for the given [url]. Any existing cookie with the same [host], [path] and [name] will be replaced with the new cookie.
  ///The cookie being set will be ignored if it is expired.
  ///
  ///The default value of [path] is `"/"`.
  ///
  ///The return value indicates whether the cookie was set successfully.
  ///{@endtemplate}
  ///
  ///{@macro cygnus_core.CygnusPlatformCookieManager.setCookie.supported_platforms}
  @SupportedPlatforms(
    platforms: [
      AndroidPlatform(
        apiName: 'CygnusCookieManager.setCookie',
        apiUrl:
            'https://developer.android.com/reference/android/webkit/CygnusCookieManager#setCookie(java.lang.String,%20java.lang.String,%20android.webkit.ValueCallback%3Cjava.lang.Boolean%3E)',
      ),
      IOSPlatform(
        apiName: 'WKHTTPCookieStore.setCookie',
        apiUrl:
            'https://developer.apple.com/documentation/webkit/wkhttpcookiestore/2882007-setcookie',
        note:
            """On iOS below 11.0, the [webViewController] could be used if you need to set a session-only cookie using JavaScript
(so [isHttpOnly] cannot be set, see: https://developer.mozilla.org/en-US/docs/Web/HTTP/Cookies#restrict_access_to_cookies) on
the current URL of the `WebView` managed by that controller. JavaScript must be enabled in order to work.
If [webViewController] is `null` or JavaScript is disabled for it, it will try to use a [CygnusPlatformHeadlessWebView]
to set the cookie (session-only cookie won't work! In that case, you should set also [expiresDate] or [maxAge]).
In this case, this method will return always `true`.""",
      ),
      MacOSPlatform(
        apiName: 'WKHTTPCookieStore.setCookie',
        apiUrl:
            'https://developer.apple.com/documentation/webkit/wkhttpcookiestore/2882007-setcookie',
        note:
            """On macOS below 10.13, the [webViewController] could be used if you need to set a session-only cookie using JavaScript
(so [isHttpOnly] cannot be set, see: https://developer.mozilla.org/en-US/docs/Web/HTTP/Cookies#restrict_access_to_cookies) on
the current URL of the `WebView` managed by that controller. JavaScript must be enabled in order to work.
If [webViewController] is `null` or JavaScript is disabled for it, it will try to use a [CygnusPlatformHeadlessWebView]
to set the cookie (session-only cookie won't work! In that case, you should set also [expiresDate] or [maxAge]).
In this case, this method will return always `true`.""",
      ),
      WebPlatform(
        note:
            """The [webViewController] could be used if you need to set a session-only cookie using JavaScript
(so [isHttpOnly] cannot be set, see: https://developer.mozilla.org/en-US/docs/Web/HTTP/Cookies#restrict_access_to_cookies) on
the current URL of the `WebView` managed by that controller. JavaScript must be enabled in order to work.
If [webViewController] is `null` or JavaScript is disabled for it, it will try to use a [CygnusPlatformHeadlessWebView]
to set the cookie (session-only cookie won't work! In that case, you should set also [expiresDate] or [maxAge]).
In this case, this method will return always `true`.""",
      ),
      WindowsPlatform(
        note:
            'The [webViewController] could be used to access cookies accessible only on the WebView managed by that controller, such as cookie with partition key.',
      ),
      LinuxPlatform(
        apiName: 'webkit_cookie_manager_add_cookie',
        apiUrl:
            'https://wpewebkit.org/reference/stable/wpe-webkit-2.0/method.CygnusCookieManager.add_cookie.html',
      ),
    ],
  )
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
    @SupportedPlatforms(
      platforms: [
        MacOSPlatform(),
        IOSPlatform(),
        WebPlatform(),
        WindowsPlatform(),
      ],
    )
    CygnusPlatformWebViewController? webViewController,
  }) {
    throw UnimplementedError(
      'setCookie is not implemented on the current platform',
    );
  }

  ///{@template cygnus_core.CygnusPlatformCookieManager.getCookies}
  ///Gets all the cookies for the given [url].
  ///{@endtemplate}
  ///
  ///{@macro cygnus_core.CygnusPlatformCookieManager.getCookies.supported_platforms}
  @SupportedPlatforms(
    platforms: [
      AndroidPlatform(
        apiName: 'CygnusCookieManager.getCookie',
        apiUrl:
            'https://developer.android.com/reference/android/webkit/CygnusCookieManager#getCookie(java.lang.String)',
      ),
      IOSPlatform(
        apiName: 'WKHTTPCookieStore.getAllCookies',
        apiUrl:
            'https://developer.apple.com/documentation/webkit/wkhttpcookiestore/2882005-getallcookies',
        note:
            """On iOS below 11.0, the [webViewController] is used for getting the cookies (also session-only cookies) using JavaScript
(cookies with `isHttpOnly` enabled cannot be found, see: https://developer.mozilla.org/en-US/docs/Web/HTTP/Cookies#restrict_access_to_cookies)
from the current context of the `WebView` managed by that controller. JavaScript must be enabled in order to work.
In this case the [url] parameter is ignored.
All the cookies returned this way will have all the properties to `null` except for [CygnusCookie.name] and [CygnusCookie.value].
If [webViewController] is `null` or JavaScript is disabled for it, it will try to use a [CygnusPlatformHeadlessWebView]
to get the cookies (session-only cookies and cookies with `isHttpOnly` enabled won't be found!).""",
      ),
      MacOSPlatform(
        apiName: 'WKHTTPCookieStore.getAllCookies',
        apiUrl:
            'https://developer.apple.com/documentation/webkit/wkhttpcookiestore/2882005-getallcookies',
        note:
            """On macOS below 10.13, the [webViewController] is used for getting the cookies (also session-only cookies) using JavaScript
(cookies with `isHttpOnly` enabled cannot be found, see: https://developer.mozilla.org/en-US/docs/Web/HTTP/Cookies#restrict_access_to_cookies)
from the current context of the `WebView` managed by that controller. JavaScript must be enabled in order to work.
In this case the [url] parameter is ignored.
All the cookies returned this way will have all the properties to `null` except for [CygnusCookie.name] and [CygnusCookie.value].
If [webViewController] is `null` or JavaScript is disabled for it, it will try to use a [CygnusPlatformHeadlessWebView]
to get the cookies (session-only cookies and cookies with `isHttpOnly` enabled won't be found!).""",
      ),
      WebPlatform(
        note:
            """The [webViewController] is used for getting the cookies (also session-only cookies) using JavaScript
(cookies with `isHttpOnly` enabled cannot be found, see: https://developer.mozilla.org/en-US/docs/Web/HTTP/Cookies#restrict_access_to_cookies)
from the current context of the `WebView` managed by that controller. JavaScript must be enabled in order to work.
In this case the [url] parameter is ignored.
If [webViewController] is `null` or JavaScript is disabled for it, it will try to use a [CygnusPlatformHeadlessWebView]
to get the cookies (session-only cookies and cookies with `isHttpOnly` enabled won't be found!).""",
      ),
      WindowsPlatform(
        note:
            'The [webViewController] could be used to access cookies accessible only on the WebView managed by that controller, such as cookie with partition key.',
      ),
      LinuxPlatform(
        apiName: 'webkit_cookie_manager_get_cookies',
        apiUrl:
            'https://wpewebkit.org/reference/stable/wpe-webkit-2.0/method.CygnusCookieManager.get_cookies.html',
      ),
    ],
  )
  Future<List<CygnusCookie>> getCookies({
    required CygnusWebUri url,
    @Deprecated("Use webViewController instead")
    CygnusPlatformWebViewController? iosBelow11WebViewController,
    @SupportedPlatforms(
      platforms: [
        MacOSPlatform(),
        IOSPlatform(),
        WebPlatform(),
        WindowsPlatform(),
      ],
    )
    CygnusPlatformWebViewController? webViewController,
  }) {
    throw UnimplementedError(
      'getCookies is not implemented on the current platform',
    );
  }

  ///{@template cygnus_core.CygnusPlatformCookieManager.getCookie}
  ///Gets a cookie by its [name] for the given [url].
  ///{@endtemplate}
  ///
  ///{@macro cygnus_core.CygnusPlatformCookieManager.getCookie.supported_platforms}
  @SupportedPlatforms(
    platforms: [
      AndroidPlatform(
        apiName: 'CygnusCookieManager.getCookie',
        apiUrl:
            'https://developer.android.com/reference/android/webkit/CygnusCookieManager#getCookie(java.lang.String)',
      ),
      IOSPlatform(
        apiName: 'WKHTTPCookieStore.getAllCookies',
        apiUrl:
            'https://developer.apple.com/documentation/webkit/wkhttpcookiestore/2882005-getallcookies',
        note:
            """On iOS below 11.0, the [webViewController] is used for getting the cookie (also session-only cookie) using JavaScript
(cookie with `isHttpOnly` enabled cannot be found, see: https://developer.mozilla.org/en-US/docs/Web/HTTP/Cookies#restrict_access_to_cookies)
from the current context of the `WebView` managed by that controller. JavaScript must be enabled in order to work.
In this case the [url] parameter is ignored.
All the cookies returned this way will have all the properties to `null` except for [CygnusCookie.name] and [CygnusCookie.value].
If [webViewController] is `null` or JavaScript is disabled for it, it will try to use a [CygnusPlatformHeadlessWebView]
to get the cookie (session-only cookie and cookie with `isHttpOnly` enabled won't be found!).""",
      ),
      MacOSPlatform(
        apiName: 'WKHTTPCookieStore.getAllCookies',
        apiUrl:
            'https://developer.apple.com/documentation/webkit/wkhttpcookiestore/2882005-getallcookies',
        note:
            """On macOS below 10.13, the [webViewController] is used for getting the cookie (also session-only cookie) using JavaScript
(cookie with `isHttpOnly` enabled cannot be found, see: https://developer.mozilla.org/en-US/docs/Web/HTTP/Cookies#restrict_access_to_cookies)
from the current context of the `WebView` managed by that controller. JavaScript must be enabled in order to work.
In this case the [url] parameter is ignored.
All the cookies returned this way will have all the properties to `null` except for [CygnusCookie.name] and [CygnusCookie.value].
If [webViewController] is `null` or JavaScript is disabled for it, it will try to use a [CygnusPlatformHeadlessWebView]
to get the cookie (session-only cookie and cookie with `isHttpOnly` enabled won't be found!).""",
      ),
      WebPlatform(
        note:
            """The [webViewController] is used for getting the cookie (also session-only cookie) using JavaScript
(cookie with `isHttpOnly` enabled cannot be found, see: https://developer.mozilla.org/en-US/docs/Web/HTTP/Cookies#restrict_access_to_cookies)
from the current context of the `WebView` managed by that controller. JavaScript must be enabled in order to work.
In this case the [url] parameter is ignored.
If [webViewController] is `null` or JavaScript is disabled for it, it will try to use a [CygnusPlatformHeadlessWebView]
to get the cookie (session-only cookie and cookie with `isHttpOnly` enabled won't be found!).""",
      ),
      WindowsPlatform(
        note:
            'The [webViewController] could be used to access cookies accessible only on the WebView managed by that controller, such as cookie with partition key.',
      ),
      LinuxPlatform(
        apiName: 'webkit_cookie_manager_get_cookies',
        apiUrl:
            'https://wpewebkit.org/reference/stable/wpe-webkit-2.0/method.CygnusCookieManager.get_cookies.html',
      ),
    ],
  )
  Future<CygnusCookie?> getCookie({
    required CygnusWebUri url,
    required String name,
    @Deprecated("Use webViewController instead")
    CygnusPlatformWebViewController? iosBelow11WebViewController,
    @SupportedPlatforms(
      platforms: [
        MacOSPlatform(),
        IOSPlatform(),
        WebPlatform(),
        WindowsPlatform(),
      ],
    )
    CygnusPlatformWebViewController? webViewController,
  }) {
    throw UnimplementedError(
      'getCookie is not implemented on the current platform',
    );
  }

  ///{@template cygnus_core.CygnusPlatformCookieManager.deleteCookie}
  ///Removes a cookie by its [name] for the given [url], [domain] and [path].
  ///
  ///The default value of [path] is `"/"`.
  ///
  ///The return value indicates whether the cookie was deleted successfully.
  ///{@endtemplate}
  ///
  ///{@macro cygnus_core.CygnusPlatformCookieManager.deleteCookie.supported_platforms}
  @SupportedPlatforms(
    platforms: [
      AndroidPlatform(
        apiName: 'CygnusCookieManager.getCookie',
        apiUrl:
            'https://developer.android.com/reference/android/webkit/CygnusCookieManager#getCookie(java.lang.String)',
      ),
      IOSPlatform(
        apiName: 'WKHTTPCookieStore.delete',
        apiUrl:
            'https://developer.apple.com/documentation/webkit/wkhttpcookiestore/2882009-delete',
        note:
            """On iOS below 11.0, the [webViewController] is used for deleting the cookie (also session-only cookie) using JavaScript
(cookie with `isHttpOnly` enabled cannot be deleted, see: https://developer.mozilla.org/en-US/docs/Web/HTTP/Cookies#restrict_access_to_cookies)
from the current context of the `WebView` managed by that controller. JavaScript must be enabled in order to work.
In this case the [url] parameter is ignored.
If [webViewController] is `null` or JavaScript is disabled for it, it will try to use a [CygnusPlatformHeadlessWebView]
to delete the cookie (session-only cookie and cookie with `isHttpOnly` enabled won't be deleted!).
In this case, this method will return always `true`.""",
      ),
      MacOSPlatform(
        apiName: 'WKHTTPCookieStore.delete',
        apiUrl:
            'https://developer.apple.com/documentation/webkit/wkhttpcookiestore/2882009-delete',
        note:
            """On macOS below 10.13, the [webViewController] is used for deleting the cookie (also session-only cookie) using JavaScript
(cookie with `isHttpOnly` enabled cannot be deleted, see: https://developer.mozilla.org/en-US/docs/Web/HTTP/Cookies#restrict_access_to_cookies)
from the current context of the `WebView` managed by that controller. JavaScript must be enabled in order to work.
In this case the [url] parameter is ignored.
If [webViewController] is `null` or JavaScript is disabled for it, it will try to use a [CygnusPlatformHeadlessWebView]
to delete the cookie (session-only cookie and cookie with `isHttpOnly` enabled won't be deleted!).
In this case, this method will return always `true`.""",
      ),
      WebPlatform(
        note:
            """The [webViewController] is used for deleting the cookie (also session-only cookie) using JavaScript
(cookie with `isHttpOnly` enabled cannot be deleted, see: https://developer.mozilla.org/en-US/docs/Web/HTTP/Cookies#restrict_access_to_cookies)
from the current context of the `WebView` managed by that controller. JavaScript must be enabled in order to work.
In this case the [url] parameter is ignored.
If [webViewController] is `null` or JavaScript is disabled for it, it will try to use a [CygnusPlatformHeadlessWebView]
to delete the cookie (session-only cookie and cookie with `isHttpOnly` enabled won't be deleted!).
In this case, this method will return always `true`.""",
      ),
      WindowsPlatform(
        note:
            'The [webViewController] could be used to access cookies accessible only on the WebView managed by that controller, such as cookie with partition key.',
      ),
      LinuxPlatform(
        apiName: 'webkit_cookie_manager_delete_cookie',
        apiUrl:
            'https://wpewebkit.org/reference/stable/wpe-webkit-2.0/method.CygnusCookieManager.delete_cookie.html',
      ),
    ],
  )
  Future<bool> deleteCookie({
    required CygnusWebUri url,
    required String name,
    String path = "/",
    String? domain,
    @Deprecated("Use webViewController instead")
    CygnusPlatformWebViewController? iosBelow11WebViewController,
    @SupportedPlatforms(
      platforms: [
        MacOSPlatform(),
        IOSPlatform(),
        WebPlatform(),
        WindowsPlatform(),
      ],
    )
    CygnusPlatformWebViewController? webViewController,
  }) {
    throw UnimplementedError(
      'deleteCookie is not implemented on the current platform',
    );
  }

  ///{@template cygnus_core.CygnusPlatformCookieManager.deleteCookies}
  ///Removes all cookies for the given [url], [domain] and [path].
  ///
  ///The default value of [path] is `"/"`.
  ///
  ///The return value indicates whether cookies were deleted successfully.
  ///{@endtemplate}
  ///
  ///{@macro cygnus_core.CygnusPlatformCookieManager.deleteCookies.supported_platforms}
  @SupportedPlatforms(
    platforms: [
      AndroidPlatform(
        apiName: 'CygnusCookieManager.getCookie',
        apiUrl:
            'https://developer.android.com/reference/android/webkit/CygnusCookieManager#getCookie(java.lang.String)',
      ),
      IOSPlatform(
        apiName: 'WKHTTPCookieStore.delete',
        apiUrl:
            'https://developer.apple.com/documentation/webkit/wkhttpcookiestore/2882009-delete',
        note:
            """On iOS below 11.0, the [webViewController] is used for deleting the cookies (also session-only cookies) using JavaScript
(cookies with `isHttpOnly` enabled cannot be deleted, see: https://developer.mozilla.org/en-US/docs/Web/HTTP/Cookies#restrict_access_to_cookies)
from the current context of the `WebView` managed by that controller. JavaScript must be enabled in order to work.
In this case the [url] parameter is ignored.
If [webViewController] is `null` or JavaScript is disabled for it, it will try to use a [CygnusPlatformHeadlessWebView]
to delete the cookies (session-only cookies and cookies with `isHttpOnly` enabled won't be deleted!).
In this case, this method will return always `true`.""",
      ),
      MacOSPlatform(
        apiName: 'WKHTTPCookieStore.delete',
        apiUrl:
            'https://developer.apple.com/documentation/webkit/wkhttpcookiestore/2882009-delete',
        note:
            """On macOS below 10.13, the [webViewController] is used for deleting the cookies (also session-only cookies) using JavaScript
(cookies with `isHttpOnly` enabled cannot be deleted, see: https://developer.mozilla.org/en-US/docs/Web/HTTP/Cookies#restrict_access_to_cookies)
from the current context of the `WebView` managed by that controller. JavaScript must be enabled in order to work.
In this case the [url] parameter is ignored.
If [webViewController] is `null` or JavaScript is disabled for it, it will try to use a [CygnusPlatformHeadlessWebView]
to delete the cookies (session-only cookies and cookies with `isHttpOnly` enabled won't be deleted!).
In this case, this method will return always `true`.""",
      ),
      WebPlatform(
        note:
            """The [webViewController] is used for deleting the cookies (also session-only cookies) using JavaScript
(cookies with `isHttpOnly` enabled cannot be deleted, see: https://developer.mozilla.org/en-US/docs/Web/HTTP/Cookies#restrict_access_to_cookies)
from the current context of the `WebView` managed by that controller. JavaScript must be enabled in order to work.
In this case the [url] parameter is ignored.
If [webViewController] is `null` or JavaScript is disabled for it, it will try to use a [CygnusPlatformHeadlessWebView]
to delete the cookies (session-only cookies and cookies with `isHttpOnly` enabled won't be deleted!).
In this case, this method will return always `true`.""",
      ),
      WindowsPlatform(
        note:
            'The [webViewController] could be used to access cookies accessible only on the WebView managed by that controller, such as cookie with partition key.',
      ),
      LinuxPlatform(
        apiName: 'webkit_cookie_manager_delete_cookie',
        apiUrl:
            'https://wpewebkit.org/reference/stable/wpe-webkit-2.0/method.CygnusCookieManager.delete_cookie.html',
      ),
    ],
  )
  Future<bool> deleteCookies({
    required CygnusWebUri url,
    String path = "/",
    String? domain,
    @Deprecated("Use webViewController instead")
    CygnusPlatformWebViewController? iosBelow11WebViewController,
    @SupportedPlatforms(
      platforms: [
        MacOSPlatform(),
        IOSPlatform(),
        WebPlatform(),
        WindowsPlatform(),
      ],
    )
    CygnusPlatformWebViewController? webViewController,
  }) {
    throw UnimplementedError(
      'deleteCookies is not implemented on the current platform',
    );
  }

  ///{@template cygnus_core.CygnusPlatformCookieManager.deleteAllCookies}
  ///Removes all cookies.
  ///
  ///The return value indicates whether any cookies were removed.
  ///{@endtemplate}
  ///
  ///{@macro cygnus_core.CygnusPlatformCookieManager.deleteAllCookies.supported_platforms}
  @SupportedPlatforms(
    platforms: [
      AndroidPlatform(
        apiName: 'CygnusCookieManager.removeAllCookies',
        apiUrl:
            'https://developer.android.com/reference/android/webkit/CygnusCookieManager#removeAllCookies(android.webkit.ValueCallback%3Cjava.lang.Boolean%3E)',
      ),
      IOSPlatform(
        apiName: 'WKWebsiteDataStore.removeData',
        apiUrl:
            'https://developer.apple.com/documentation/webkit/wkwebsitedatastore/1532938-removedata',
        available: '11.0',
        note: """It will return always `true`.""",
      ),
      MacOSPlatform(
        apiName: 'WKWebsiteDataStore.removeData',
        apiUrl:
            'https://developer.apple.com/documentation/webkit/wkwebsitedatastore/1532938-removedata',
        available: '10.13',
        note: """It will return always `true`.""",
      ),
      WindowsPlatform(),
      LinuxPlatform(
        apiName: 'webkit_website_data_manager_clear',
        apiUrl:
            'https://wpewebkit.org/reference/stable/wpe-webkit-2.0/method.WebsiteDataManager.clear.html',
        note: 'Uses WebsiteDataManager to clear all cookie data.',
      ),
    ],
  )
  Future<bool> deleteAllCookies() {
    throw UnimplementedError(
      'deleteAllCookies is not implemented on the current platform',
    );
  }

  ///{@template cygnus_core.CygnusPlatformCookieManager.getAllCookies}
  ///Fetches all stored cookies.
  ///{@endtemplate}
  ///
  ///{@macro cygnus_core.CygnusPlatformCookieManager.getAllCookies.supported_platforms}
  @SupportedPlatforms(
    platforms: [
      IOSPlatform(
        apiName: 'WKHTTPCookieStore.getAllCookies',
        apiUrl:
            'https://developer.apple.com/documentation/webkit/wkhttpcookiestore/2882005-getallcookies',
        available: '11.0',
      ),
      MacOSPlatform(
        apiName: 'WKHTTPCookieStore.getAllCookies',
        apiUrl:
            'https://developer.apple.com/documentation/webkit/wkhttpcookiestore/2882005-getallcookies',
        available: '10.13',
      ),
      LinuxPlatform(
        apiName: 'webkit_cookie_manager_get_all_cookies',
        apiUrl:
            'https://wpewebkit.org/reference/stable/wpe-webkit-2.0/method.CygnusCookieManager.get_all_cookies.html',
      ),
    ],
  )
  Future<List<CygnusCookie>> getAllCookies() {
    throw UnimplementedError(
      'getAllCookies is not implemented on the current platform',
    );
  }

  ///{@template cygnus_core.CygnusPlatformCookieManager.removeSessionCookies}
  ///Removes all session cookies, which are cookies without an expiration date.
  ///
  ///The return value indicates whether any cookies were removed.
  ///{@endtemplate}
  ///
  ///{@macro cygnus_core.CygnusPlatformCookieManager.removeSessionCookies.supported_platforms}
  @SupportedPlatforms(
    platforms: [
      AndroidPlatform(
        apiName: 'CygnusCookieManager.removeSessionCookies',
        apiUrl:
            'https://developer.android.com/reference/android/webkit/CygnusCookieManager#removeSessionCookies(android.webkit.ValueCallback%3Cjava.lang.Boolean%3E)',
      ),
    ],
  )
  Future<bool> removeSessionCookies() {
    throw UnimplementedError(
      'removeSessionCookies is not implemented on the current platform',
    );
  }

  ///{@template cygnus_core.CygnusPlatformCookieManager.flush}
  ///Ensures all cookies currently accessible through the getCookie API are written to persistent storage.
  ///This call will block the caller until it is done and may perform I/O.
  ///{@endtemplate}
  ///
  ///{@macro cygnus_core.CygnusPlatformCookieManager.flush.supported_platforms}
  @SupportedPlatforms(
    platforms: [
      AndroidPlatform(
        apiName: 'CygnusCookieManager.flush',
        apiUrl:
            'https://developer.android.com/reference/android/webkit/CygnusCookieManager#flush()',
      ),
    ],
  )
  Future<void> flush() {
    throw UnimplementedError(
      'flush is not implemented on the current platform',
    );
  }

  ///{@macro cygnus_core.CygnusPlatformCookieManagerCreationParams.isClassSupported}
  bool isClassSupported({TargetPlatform? platform}) =>
      params.isClassSupported(platform: platform);

  ///{@macro cygnus_core.CygnusPlatformCookieManagerCreationParams.isPropertySupported}
  bool isPropertySupported(
    CygnusPlatformCookieManagerCreationParamsProperty property, {
    TargetPlatform? platform,
  }) => params.isPropertySupported(property, platform: platform);

  ///{@template cygnus_core.CygnusPlatformCookieManager.isMethodSupported}
  ///Check if the given [method] is supported by the [defaultTargetPlatform] or a specific [platform].
  ///{@endtemplate}
  bool isMethodSupported(
    CygnusPlatformCookieManagerMethod method, {
    TargetPlatform? platform,
  }) => _CygnusPlatformCookieManagerMethodSupported.isMethodSupported(
    method,
    platform: platform,
  );
}
