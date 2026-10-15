import 'dart:async';
import 'dart:collection';
import 'dart:typed_data';
import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:cygnus_core_internal_annotations/cygnus_core_internal_annotations.dart';

import '../find_interaction/platform_find_interaction_controller.dart';
import '../pull_to_refresh/platform_pull_to_refresh_controller.dart';
import '../context_menu/context_menu.dart';
import '../types/main.dart';
import '../web_uri.dart';
import 'webview_settings.dart';
import 'platform_webview_controller.dart';
import '../print_job/main.dart';
import 'platform_webview_widget.dart';
import 'platform_headless_webview.dart';
import '../platform_webview_feature.dart';
import '../browser/platform_browser.dart';

part 'platform_webview.g.dart';

///{@template cygnus_core.CygnusPlatformWebViewCreationParams}
///Class that represents a WebView. Used by [CygnusPlatformWebViewWidget],
///[CygnusPlatformHeadlessWebView] and the WebView of [CygnusPlatformBrowser].
///{@endtemplate}
///
///{@macro cygnus_core.CygnusPlatformWebViewCreationParams.supported_platforms}
@SupportedPlatforms(
  ignoreParameterNames: ['controller'],
  platforms: [
    AndroidPlatform(),
    IOSPlatform(),
    MacOSPlatform(),
    WebPlatform(requiresSameOrigin: false),
    WindowsPlatform(),
    LinuxPlatform(),
  ],
)
class CygnusPlatformWebViewCreationParams<T> {
  final T Function(CygnusPlatformWebViewController controller)?
  controllerFromPlatform;

  ///{@template cygnus_core.CygnusPlatformWebViewCreationParams.windowId}
  ///The window id of a [CygnusCreateWindowAction.windowId].
  ///{@endtemplate}
  ///
  ///{@macro cygnus_core.CygnusPlatformWebViewCreationParams.windowId.supported_platforms}
  @SupportedPlatforms(
    platforms: [
      AndroidPlatform(),
      IOSPlatform(),
      MacOSPlatform(),
      WebPlatform(),
      WindowsPlatform(),
    ],
  )
  final int? windowId;

  ///{@template cygnus_core.CygnusPlatformWebViewCreationParams.onWebViewCreated}
  ///Event fired when the `WebView` is created.
  ///{@endtemplate}
  ///
  ///{@macro cygnus_core.CygnusPlatformWebViewCreationParams.onWebViewCreated.supported_platforms}
  @SupportedPlatforms(
    platforms: [
      AndroidPlatform(),
      IOSPlatform(),
      MacOSPlatform(),
      WebPlatform(),
      WindowsPlatform(),
      LinuxPlatform(),
    ],
  )
  final void Function(T controller)? onWebViewCreated;

  ///{@template cygnus_core.CygnusPlatformWebViewCreationParams.onLoadStart}
  ///Event fired when the `WebView` starts to load an [url].
  ///{@endtemplate}
  ///
  ///{@macro cygnus_core.CygnusPlatformWebViewCreationParams.onLoadStart.supported_platforms}
  @SupportedPlatforms(
    platforms: [
      AndroidPlatform(
        apiName: 'WebViewClient.onPageStarted',
        apiUrl:
            'https://developer.android.com/reference/android/webkit/WebViewClient#onPageStarted(android.webkit.WebView,%20java.lang.String,%20android.graphics.Bitmap)',
      ),
      IOSPlatform(
        apiName: 'WKNavigationDelegate.webView',
        apiUrl:
            'https://developer.apple.com/documentation/webkit/wknavigationdelegate/1455621-webview',
      ),
      MacOSPlatform(
        apiName: 'WKNavigationDelegate.webView',
        apiUrl:
            'https://developer.apple.com/documentation/webkit/wknavigationdelegate/1455621-webview',
      ),
      WebPlatform(
        note:
            "It will be dispatched at the same time of [onLoadStop] event because there isn't any way to capture the real load start event from an iframe. If `window.location.href` isn't accessible inside the iframe, the [url] parameter will have the current value of the `iframe.src` attribute.",
      ),
      WindowsPlatform(
        apiName: 'ICoreWebView2.add_NavigationStarting',
        apiUrl:
            'https://learn.microsoft.com/en-us/microsoft-edge/webview2/reference/win32/iwebview2webview?view=webview2-0.8.355#add_navigationstarting',
      ),
      LinuxPlatform(
        apiName: 'WebKitWebView::load-changed',
        apiUrl:
            'https://wpewebkit.org/reference/stable/wpe-webkit-2.0/signal.WebView.load-changed.html',
        note: 'Fired when WebKitLoadEvent is WEBKIT_LOAD_STARTED.',
      ),
    ],
  )
  final void Function(T controller, CygnusWebUri? url)? onLoadStart;

  ///{@template cygnus_core.CygnusPlatformWebViewCreationParams.onLoadStop}
  ///Event fired when the `WebView` finishes loading an [url].
  ///{@endtemplate}
  ///
  ///{@macro cygnus_core.CygnusPlatformWebViewCreationParams.onLoadStop.supported_platforms}
  @SupportedPlatforms(
    platforms: [
      AndroidPlatform(
        apiName: 'WebViewClient.onPageFinished',
        apiUrl:
            'https://developer.android.com/reference/android/webkit/WebViewClient#onPageFinished(android.webkit.WebView,%20java.lang.String)',
      ),
      IOSPlatform(
        apiName: 'WKNavigationDelegate.webView',
        apiUrl:
            'https://developer.apple.com/documentation/webkit/wknavigationdelegate/1455629-webview',
      ),
      MacOSPlatform(
        apiName: 'WKNavigationDelegate.webView',
        apiUrl:
            'https://developer.apple.com/documentation/webkit/wknavigationdelegate/1455629-webview',
      ),
      WebPlatform(
        apiName: 'Window.onload',
        apiUrl:
            'https://developer.mozilla.org/en-US/docs/Web/API/Window/load_event',
        note:
            "If `window.location.href` isn't accessible inside the iframe, the [url] parameter will have the current value of the `iframe.src` attribute.",
      ),
      WindowsPlatform(
        apiName: 'ICoreWebView2.add_NavigationCompleted',
        apiUrl:
            'https://learn.microsoft.com/en-us/microsoft-edge/webview2/reference/win32/iwebview2webview?view=webview2-0.8.355#add_navigationcompleted',
      ),
      LinuxPlatform(
        apiName: 'WebKitWebView::load-changed',
        apiUrl:
            'https://wpewebkit.org/reference/stable/wpe-webkit-2.0/signal.WebView.load-changed.html',
        note: 'Fired when WebKitLoadEvent is WEBKIT_LOAD_FINISHED.',
      ),
    ],
  )
  final void Function(T controller, CygnusWebUri? url)? onLoadStop;

  ///{@template cygnus_core.CygnusPlatformWebViewCreationParams.onContentLoading}
  ///Called when the `WebView` is about to load content for the current
  ///navigation.
  ///
  ///This fires before any content is loaded (including scripts added with
  ///`addScriptToExecuteOnDocumentCreated`), after [onLoadStart] and before
  ///[onDOMContentLoaded].
  ///
  ///This event does not fire for same-page navigations such as fragment
  ///changes or `history.pushState`.
  ///
  ///[url] represents the URL corresponding to the page navigation that
  ///triggered this callback.
  ///{@endtemplate}
  ///
  ///{@macro cygnus_core.CygnusPlatformWebViewCreationParams.onContentLoading.supported_platforms}
  @SupportedPlatforms(
    platforms: [
      WindowsPlatform(
        apiName: 'ICoreWebView2.add_ContentLoading',
        apiUrl:
            'https://learn.microsoft.com/en-us/microsoft-edge/webview2/reference/win32/icorewebview2?view=webview2-1.0.2210.55#add_contentloading',
      ),
    ],
  )
  final void Function(T controller, CygnusWebUri? url)? onContentLoading;

  ///{@template cygnus_core.CygnusPlatformWebViewCreationParams.onDOMContentLoaded}
  ///Called when the HTML document has been parsed and the DOM is ready.
  ///
  ///[url] represents the URL corresponding to the page navigation that
  ///triggered this callback.
  ///{@endtemplate}
  ///
  ///{@macro cygnus_core.CygnusPlatformWebViewCreationParams.onDOMContentLoaded.supported_platforms}
  @SupportedPlatforms(
    platforms: [
      WindowsPlatform(
        apiName: 'ICoreWebView2_2.add_DOMContentLoaded',
        apiUrl:
            'https://learn.microsoft.com/en-us/microsoft-edge/webview2/reference/win32/icorewebview2_2?view=webview2-1.0.2210.55#add_domcontentloaded',
      ),
    ],
  )
  final void Function(T controller, CygnusWebUri? url)? onDOMContentLoaded;

  ///{@template cygnus_core.CygnusPlatformWebViewCreationParams.onLoadError}
  ///Use [onReceivedError] instead.
  ///{@endtemplate}
  ///
  ///{@macro cygnus_core.CygnusPlatformWebViewCreationParams.onLoadError.supported_platforms}
  @SupportedPlatforms(
    platforms: [AndroidPlatform(), IOSPlatform(), MacOSPlatform()],
  )
  @Deprecated("Use onReceivedError instead")
  final void Function(T controller, Uri? url, int code, String message)?
  onLoadError;

  ///{@template cygnus_core.CygnusPlatformWebViewCreationParams.onReceivedError}
  ///Event fired when the `WebView` encounters an [error] loading a [request].
  ///{@endtemplate}
  ///
  ///{@macro cygnus_core.CygnusPlatformWebViewCreationParams.onReceivedError.supported_platforms}
  @SupportedPlatforms(
    platforms: [
      AndroidPlatform(
        apiName: 'WebViewClient.onReceivedError',
        apiUrl:
            'https://developer.android.com/reference/android/webkit/WebViewClient#onReceivedError(android.webkit.WebView,%20android.webkit.CygnusWebResourceRequest,%20android.webkit.CygnusWebResourceError)',
      ),
      IOSPlatform(
        apiName: 'WKNavigationDelegate.webView',
        apiUrl:
            'https://developer.apple.com/documentation/webkit/wknavigationdelegate/1455623-webview',
      ),
      MacOSPlatform(
        apiName: 'WKNavigationDelegate.webView',
        apiUrl:
            'https://developer.apple.com/documentation/webkit/wknavigationdelegate/1455623-webview',
      ),
      WindowsPlatform(
        apiName: 'ICoreWebView2.add_NavigationCompleted',
        apiUrl:
            'https://learn.microsoft.com/en-us/microsoft-edge/webview2/reference/win32/iwebview2webview?view=webview2-0.8.355#add_navigationcompleted',
      ),
      LinuxPlatform(
        apiName: 'WebKitWebView::load-failed',
        apiUrl:
            'https://wpewebkit.org/reference/stable/wpe-webkit-2.0/signal.WebView.load-failed.html',
      ),
    ],
  )
  final void Function(
    T controller,
    CygnusWebResourceRequest request,
    CygnusWebResourceError error,
  )?
  onReceivedError;

  ///{@template cygnus_core.CygnusPlatformWebViewCreationParams.onLoadHttpError}
  ///Use [onReceivedHttpError] instead.
  ///{@endtemplate}
  ///
  ///{@macro cygnus_core.CygnusPlatformWebViewCreationParams.onLoadHttpError.supported_platforms}
  @SupportedPlatforms(
    platforms: [AndroidPlatform(), IOSPlatform(), MacOSPlatform()],
  )
  @Deprecated("Use onReceivedHttpError instead")
  final void Function(
    T controller,
    Uri? url,
    int statusCode,
    String description,
  )?
  onLoadHttpError;

  ///{@template cygnus_core.CygnusPlatformWebViewCreationParams.onReceivedHttpError}
  ///Event fired when the `WebView` receives an HTTP error.
  ///
  ///[request] represents the originating request.
  ///
  ///[errorResponse] represents the information about the error occurred.
  ///{@endtemplate}
  ///
  ///{@macro cygnus_core.CygnusPlatformWebViewCreationParams.onReceivedHttpError.supported_platforms}
  @SupportedPlatforms(
    platforms: [
      AndroidPlatform(
        apiName: 'WebViewClient.onReceivedHttpError',
        apiUrl:
            'https://developer.android.com/reference/android/webkit/WebViewClient#onReceivedHttpError(android.webkit.WebView,%20android.webkit.CygnusWebResourceRequest,%20android.webkit.CygnusWebResourceResponse)',
        available: '23',
      ),
      IOSPlatform(
        apiName: 'WKNavigationDelegate.webView',
        apiUrl:
            'https://developer.apple.com/documentation/webkit/wknavigationdelegate/1455643-webview',
      ),
      MacOSPlatform(
        apiName: 'WKNavigationDelegate.webView',
        apiUrl:
            'https://developer.apple.com/documentation/webkit/wknavigationdelegate/1455643-webview',
      ),
      WindowsPlatform(
        apiName: 'ICoreWebView2.add_NavigationCompleted',
        apiUrl:
            'https://learn.microsoft.com/en-us/microsoft-edge/webview2/reference/win32/iwebview2webview?view=webview2-0.8.355#add_navigationcompleted',
      ),
      LinuxPlatform(
        apiName: 'WebKitWebView::load-failed',
        apiUrl:
            'https://wpewebkit.org/reference/stable/wpe-webkit-2.0/signal.WebView.load-failed.html',
        note:
            'HTTP errors are detected during the load-failed signal handling.',
      ),
    ],
  )
  final void Function(
    T controller,
    CygnusWebResourceRequest request,
    CygnusWebResourceResponse errorResponse,
  )?
  onReceivedHttpError;

  ///{@template cygnus_core.CygnusPlatformWebViewCreationParams.onProgressChanged}
  ///Event fired when the current [progress] of loading a page is changed.
  ///{@endtemplate}
  ///
  ///{@macro cygnus_core.CygnusPlatformWebViewCreationParams.onProgressChanged.supported_platforms}
  @SupportedPlatforms(
    platforms: [
      AndroidPlatform(
        apiName: 'WebChromeClient.onProgressChanged',
        apiUrl:
            'https://developer.android.com/reference/android/webkit/WebChromeClient#onProgressChanged(android.webkit.WebView,%20int)',
      ),
      IOSPlatform(),
      MacOSPlatform(),
      WindowsPlatform(),
      LinuxPlatform(
        apiName: 'WebKitWebView::notify::estimated-load-progress',
        apiUrl:
            'https://wpewebkit.org/reference/stable/wpe-webkit-2.0/property.WebView.estimated-load-progress.html',
      ),
    ],
  )
  final void Function(T controller, int progress)? onProgressChanged;

  ///{@template cygnus_core.CygnusPlatformWebViewCreationParams.onConsoleMessage}
  ///Event fired when the `WebView` receives a [CygnusConsoleMessage].
  ///{@endtemplate}
  ///
  ///{@macro cygnus_core.CygnusPlatformWebViewCreationParams.onConsoleMessage.supported_platforms}
  @SupportedPlatforms(
    platforms: [
      AndroidPlatform(
        apiName: 'WebChromeClient.onConsoleMessage',
        apiUrl:
            'https://developer.android.com/reference/android/webkit/WebChromeClient#onConsoleMessage(android.webkit.CygnusConsoleMessage)',
      ),
      IOSPlatform(note: 'This event is implemented using JavaScript.'),
      MacOSPlatform(note: 'This event is implemented using JavaScript.'),
      WebPlatform(),
      WindowsPlatform(),
      LinuxPlatform(note: 'This event is implemented using JavaScript.'),
    ],
  )
  final void Function(T controller, CygnusConsoleMessage consoleMessage)?
  onConsoleMessage;

  ///{@template cygnus_core.CygnusPlatformWebViewCreationParams.shouldOverrideUrlLoading}
  ///Give the host application a chance to take control when a URL is about to be loaded in the current WebView.
  ///
  ///[navigationAction] represents an object that contains information about an action that causes navigation to occur.
  ///
  ///**NOTE**: In order to be able to listen this event, check the [CygnusWebViewSettings.useShouldOverrideUrlLoading] setting documentation.
  ///{@endtemplate}
  ///
  ///{@macro cygnus_core.CygnusPlatformWebViewCreationParams.shouldOverrideUrlLoading.supported_platforms}
  @SupportedPlatforms(
    platforms: [
      AndroidPlatform(
        apiName: 'WebViewClient.shouldOverrideUrlLoading',
        apiUrl:
            'https://developer.android.com/reference/android/webkit/WebViewClient#shouldOverrideUrlLoading(android.webkit.WebView,%20java.lang.String)',
        note:
            """There isn't any way to load an URL for a frame that is not the main frame, so if the request is not for the main frame, the navigation is allowed by default.
However, if you want to cancel requests for subframes, you can use the [CygnusWebViewSettings.regexToCancelSubFramesLoading] setting
to write a Regular Expression that, if the url request of a subframe matches, then the request of that subframe is canceled.
Instead, the [CygnusWebViewSettings.regexToAllowSyncUrlLoading] setting could
be used to allow navigation requests synchronously, as this event is synchronous on native side
and the current plugin implementation will always cancel the current request and load a new request if
this event returns [CygnusNavigationActionPolicy.ALLOW] because Flutter method channels work only asynchronously.
Also, this event is not called for POST requests and is not called on the first page load.""",
      ),
      IOSPlatform(
        apiName: 'WKNavigationDelegate.webView',
        apiUrl:
            'https://developer.apple.com/documentation/webkit/wknavigationdelegate/1455641-webview',
      ),
      MacOSPlatform(
        apiName: 'WKNavigationDelegate.webView',
        apiUrl:
            'https://developer.apple.com/documentation/webkit/wknavigationdelegate/1455641-webview',
      ),
      WindowsPlatform(),
      LinuxPlatform(
        apiName: 'WebKitWebView::decide-policy',
        apiUrl:
            'https://wpewebkit.org/reference/stable/wpe-webkit-2.0/signal.WebView.decide-policy.html',
      ),
    ],
  )
  final FutureOr<CygnusNavigationActionPolicy?> Function(
    T controller,
    CygnusNavigationAction navigationAction,
  )?
  shouldOverrideUrlLoading;

  ///{@template cygnus_core.CygnusPlatformWebViewCreationParams.onLaunchingExternalUriScheme}
  ///Event fired when an external URI scheme is about to be launched.
  ///{@endtemplate}
  ///
  ///{@macro cygnus_core.CygnusPlatformWebViewCreationParams.onLaunchingExternalUriScheme.supported_platforms}
  @SupportedPlatforms(
    platforms: [
      WindowsPlatform(
        apiName: 'ICoreWebView2_18.add_LaunchingExternalUriScheme',
        apiUrl:
            'https://learn.microsoft.com/en-us/microsoft-edge/webview2/reference/win32/icorewebview2_18?view=webview2-1.0.2849.39#add_launchingexternalurischeme',
      ),
    ],
  )
  final FutureOr<CygnusLaunchingExternalUriSchemeResponse?> Function(
    T controller,
    CygnusLaunchingExternalUriSchemeRequest request,
  )?
  onLaunchingExternalUriScheme;

  ///{@template cygnus_core.CygnusPlatformWebViewCreationParams.onLoadResource}
  ///Event fired when the `WebView` loads a resource.
  ///
  ///**NOTE**: In order to be able to listen this event, check the [CygnusWebViewSettings.useOnLoadResource] setting documentation.
  ///{@endtemplate}
  ///
  ///{@macro cygnus_core.CygnusPlatformWebViewCreationParams.onLoadResource.supported_platforms}
  @SupportedPlatforms(
    platforms: [
      AndroidPlatform(note: 'This event is implemented using JavaScript.'),
      IOSPlatform(note: 'This event is implemented using JavaScript.'),
      MacOSPlatform(note: 'This event is implemented using JavaScript.'),
      LinuxPlatform(note: 'This event is implemented using JavaScript.'),
    ],
  )
  final void Function(T controller, CygnusLoadedResource resource)? onLoadResource;

  ///{@template cygnus_core.CygnusPlatformWebViewCreationParams.onScrollChanged}
  ///Event fired when the `WebView` scrolls.
  ///
  ///[x] represents the current horizontal scroll origin in pixels.
  ///
  ///[y] represents the current vertical scroll origin in pixels.
  ///{@endtemplate}
  ///
  ///{@macro cygnus_core.CygnusPlatformWebViewCreationParams.onScrollChanged.supported_platforms}
  @SupportedPlatforms(
    platforms: [
      AndroidPlatform(
        apiName: 'WebView.onScrollChanged',
        apiUrl:
            'https://developer.android.com/reference/android/webkit/WebView#onScrollChanged(int,%20int,%20int,%20int)',
      ),
      IOSPlatform(
        apiName: 'UIScrollViewDelegate.scrollViewDidScroll',
        apiUrl:
            'https://developer.apple.com/documentation/uikit/uiscrollviewdelegate/1619392-scrollviewdidscroll',
      ),
      MacOSPlatform(note: 'This event is implemented using JavaScript.'),
      WebPlatform(
        apiName: 'Window.onscroll',
        apiUrl:
            'https://developer.mozilla.org/en-US/docs/Web/API/GlobalEventHandlers/onscroll',
      ),
      LinuxPlatform(note: 'This event is implemented using JavaScript.'),
    ],
  )
  final void Function(T controller, int x, int y)? onScrollChanged;

  ///{@template cygnus_core.CygnusPlatformWebViewCreationParams.onDownloadStart}
  ///Use [onDownloadStarting] instead
  ///{@endtemplate}
  ///
  ///{@macro cygnus_core.CygnusPlatformWebViewCreationParams.onDownloadStart.supported_platforms}
  @SupportedPlatforms(platforms: [AndroidPlatform(), IOSPlatform()])
  @Deprecated('Use onDownloadStarting instead')
  final void Function(T controller, Uri url)? onDownloadStart;

  ///{@template cygnus_core.CygnusPlatformWebViewCreationParams.onDownloadStartRequest}
  ///Use [onDownloadStarting] instead
  ///{@endtemplate}
  ///
  ///{@macro cygnus_core.CygnusPlatformWebViewCreationParams.onDownloadStartRequest.supported_platforms}
  @SupportedPlatforms(
    platforms: [AndroidPlatform(), IOSPlatform(), MacOSPlatform()],
  )
  @Deprecated('Use onDownloadStarting instead')
  final void Function(T controller, CygnusDownloadStartRequest downloadStartRequest)?
  onDownloadStartRequest;

  ///{@template cygnus_core.CygnusPlatformWebViewCreationParams.onDownloadStarting}
  ///Event fired when `WebView` recognizes a downloadable file.
  ///To download the file, you can use the [flutter_downloader](https://pub.dev/packages/flutter_downloader) plugin.
  ///
  ///[downloadStartRequest] represents the request of the file to download.
  ///
  ///**NOTE**: In order to be able to listen this event, check the [CygnusWebViewSettings.useOnDownloadStart] setting documentation.
  ///{@endtemplate}
  ///
  ///{@macro cygnus_core.CygnusPlatformWebViewCreationParams.onDownloadStarting.supported_platforms}
  @SupportedPlatforms(
    platforms: [
      AndroidPlatform(
        apiName: 'WebView.setDownloadListener',
        apiUrl:
            '(https://developer.android.com/reference/android/webkit/WebView#setDownloadListener(android.webkit.DownloadListener)',
      ),
      IOSPlatform(),
      MacOSPlatform(),
      WindowsPlatform(
        apiName: 'ICoreWebView2_4.add_DownloadStarting',
        apiUrl:
            'https://learn.microsoft.com/en-us/microsoft-edge/webview2/reference/win32/icorewebview2_4?view=webview2-1.0.2849.39#add_downloadstarting',
      ),
      LinuxPlatform(
        apiName: 'WebKitWebView::decide-policy',
        apiUrl:
            'https://wpewebkit.org/reference/stable/wpe-webkit-2.0/signal.WebView.decide-policy.html',
        note:
            'Downloads are detected via WEBKIT_POLICY_DECISION_TYPE_RESPONSE.',
      ),
    ],
  )
  final FutureOr<CygnusDownloadStartResponse?> Function(
    T controller,
    CygnusDownloadStartRequest downloadStartRequest,
  )?
  onDownloadStarting;

  ///{@template cygnus_core.CygnusPlatformWebViewCreationParams.onLoadResourceCustomScheme}
  ///Use [onLoadResourceWithCustomScheme] instead.
  ///{@endtemplate}
  ///
  ///{@macro cygnus_core.CygnusPlatformWebViewCreationParams.onLoadResourceCustomScheme.supported_platforms}
  @SupportedPlatforms(
    platforms: [AndroidPlatform(), IOSPlatform(), MacOSPlatform()],
  )
  @Deprecated('Use onLoadResourceWithCustomScheme instead')
  final FutureOr<CygnusCustomSchemeResponse?> Function(T controller, Uri url)?
  onLoadResourceCustomScheme;

  ///{@template cygnus_core.CygnusPlatformWebViewCreationParams.onLoadResourceWithCustomScheme}
  ///Event fired when the `WebView` finds the `custom-scheme` while loading a resource.
  ///Here you can handle the url [request] and return a [CygnusCustomSchemeResponse] to load a specific resource encoded to `base64`.
  ///{@endtemplate}
  ///
  ///{@macro cygnus_core.CygnusPlatformWebViewCreationParams.onLoadResourceWithCustomScheme.supported_platforms}
  @SupportedPlatforms(
    platforms: [
      AndroidPlatform(),
      IOSPlatform(
        apiName: 'WKURLSchemeHandler',
        apiUrl:
            'https://developer.apple.com/documentation/webkit/wkurlschemehandler',
      ),
      MacOSPlatform(
        apiName: 'WKURLSchemeHandler',
        apiUrl:
            'https://developer.apple.com/documentation/webkit/wkurlschemehandler',
      ),
      WindowsPlatform(),
      LinuxPlatform(
        apiName: 'WebKitURISchemeRequest',
        apiUrl:
            'https://wpewebkit.org/reference/stable/wpe-webkit-2.0/class.URISchemeRequest.html',
      ),
    ],
  )
  final FutureOr<CygnusCustomSchemeResponse?> Function(
    T controller,
    CygnusWebResourceRequest request,
  )?
  onLoadResourceWithCustomScheme;

  ///{@template cygnus_core.CygnusPlatformWebViewCreationParams.onCreateWindow}
  ///Event fired when the `WebView` requests the host application to create a new window,
  ///for example when trying to open a link with `target="_blank"` or when `window.open()` is called by JavaScript side.
  ///If the host application chooses to honor this request, it should return `true` from this method, create a new WebView to host the window.
  ///If the host application chooses not to honor the request, it should return `false` from this method.
  ///The default implementation of this method does nothing and hence returns `false`.
  ///
  ///- [createWindowAction] represents the request.
  ///
  ///**NOTE**: to allow JavaScript to open windows, you need to set [CygnusWebViewSettings.javaScriptCanOpenWindowsAutomatically] setting to `true`.
  ///{@endtemplate}
  ///
  ///{@macro cygnus_core.CygnusPlatformWebViewCreationParams.onCreateWindow.supported_platforms}
  @SupportedPlatforms(
    platforms: [
      AndroidPlatform(
        apiName: 'WebChromeClient.onCreateWindow',
        apiUrl:
            'https://developer.android.com/reference/android/webkit/WebChromeClient#onCreateWindow(android.webkit.WebView,%20boolean,%20boolean,%20android.os.Message)',
        note:
            'You need to set [CygnusWebViewSettings.supportMultipleWindows] setting to `true`. Also, if the request has been created using JavaScript (`window.open()`), then there are some limitation: check the [CygnusNavigationAction] class.',
      ),
      IOSPlatform(
        apiName: 'WKUIDelegate.webView',
        apiUrl:
            'https://developer.apple.com/documentation/webkit/wkuidelegate/1536907-webview',
        note:
            """Setting these initial settings [CygnusWebViewSettings.supportZoom], [CygnusWebViewSettings.useOnLoadResource], [CygnusWebViewSettings.useShouldInterceptAjaxRequest],
[CygnusWebViewSettings.useShouldInterceptFetchRequest], [CygnusWebViewSettings.applicationNameForUserAgent], [CygnusWebViewSettings.javaScriptCanOpenWindowsAutomatically],
[CygnusWebViewSettings.javaScriptEnabled], [CygnusWebViewSettings.minimumFontSize], [CygnusWebViewSettings.preferredContentMode], [CygnusWebViewSettings.incognito],
[CygnusWebViewSettings.cacheEnabled], [CygnusWebViewSettings.mediaPlaybackRequiresUserGesture],
[CygnusWebViewSettings.resourceCustomSchemes], [CygnusWebViewSettings.sharedCookiesEnabled],
[CygnusWebViewSettings.enableViewportScale], [CygnusWebViewSettings.allowsAirPlayForMediaPlayback],
[CygnusWebViewSettings.allowsPictureInPictureMediaPlayback], [CygnusWebViewSettings.isFraudulentWebsiteWarningEnabled],
[CygnusWebViewSettings.allowsInlineMediaPlayback], [CygnusWebViewSettings.suppressesIncrementalRendering], [CygnusWebViewSettings.selectionGranularity],
[CygnusWebViewSettings.ignoresViewportScaleLimits], [CygnusWebViewSettings.limitsNavigationsToAppBoundDomains],
[CygnusWebViewSettings.upgradeKnownHostsToHTTPS],
will have no effect due to a `WKWebView` limitation when creating the new window WebView: it's impossible to return the new `WKWebView`
with a different `WKWebViewConfiguration` instance (see https://developer.apple.com/documentation/webkit/wkuidelegate/1536907-webview).
So, these options will be inherited from the caller WebView.
Also, note that calling [CygnusWebViewController.setSettings] method using the controller of the new created WebView,
it will update also the WebView options of the caller WebView.""",
      ),
      MacOSPlatform(
        apiName: 'WKUIDelegate.webView',
        apiUrl:
            'https://developer.apple.com/documentation/webkit/wkuidelegate/1536907-webview',
        note:
            """Setting these initial settings [CygnusWebViewSettings.supportZoom], [CygnusWebViewSettings.useOnLoadResource], [CygnusWebViewSettings.useShouldInterceptAjaxRequest],
[CygnusWebViewSettings.useShouldInterceptFetchRequest], [CygnusWebViewSettings.applicationNameForUserAgent], [CygnusWebViewSettings.javaScriptCanOpenWindowsAutomatically],
[CygnusWebViewSettings.javaScriptEnabled], [CygnusWebViewSettings.minimumFontSize], [CygnusWebViewSettings.preferredContentMode], [CygnusWebViewSettings.incognito],
[CygnusWebViewSettings.cacheEnabled], [CygnusWebViewSettings.mediaPlaybackRequiresUserGesture],
[CygnusWebViewSettings.resourceCustomSchemes], [CygnusWebViewSettings.sharedCookiesEnabled],
[CygnusWebViewSettings.enableViewportScale], [CygnusWebViewSettings.allowsAirPlayForMediaPlayback],
[CygnusWebViewSettings.allowsPictureInPictureMediaPlayback], [CygnusWebViewSettings.isFraudulentWebsiteWarningEnabled],
[CygnusWebViewSettings.allowsInlineMediaPlayback], [CygnusWebViewSettings.suppressesIncrementalRendering], [CygnusWebViewSettings.selectionGranularity],
[CygnusWebViewSettings.ignoresViewportScaleLimits], [CygnusWebViewSettings.limitsNavigationsToAppBoundDomains],
[CygnusWebViewSettings.upgradeKnownHostsToHTTPS],
will have no effect due to a `WKWebView` limitation when creating the new window WebView: it's impossible to return the new `WKWebView`
with a different `WKWebViewConfiguration` instance (see https://developer.apple.com/documentation/webkit/wkuidelegate/1536907-webview).
So, these options will be inherited from the caller WebView.
Also, note that calling [CygnusWebViewController.setSettings] method using the controller of the new created WebView,
it will update also the WebView options of the caller WebView.""",
      ),
      WebPlatform(
        note:
            'It works only for `window.open()` javascript calls. Also, there is no way to block the opening the window in a synchronous way, so returning `true` will just close it quickly.',
      ),
      WindowsPlatform(
        apiName: 'ICoreWebView2.add_NewWindowRequested',
        apiUrl:
            'https://learn.microsoft.com/en-us/microsoft-edge/webview2/reference/win32/icorewebview2?view=webview2-1.0.2210.55#add_newwindowrequested',
      ),
      LinuxPlatform(
        apiName: 'WebKitWebView::create',
        apiUrl:
            'https://wpewebkit.org/reference/stable/wpe-webkit-2.0/signal.WebView.create.html',
        note:
            'Creates a new CygnusWebView with related-view for multi-window support.',
      ),
    ],
  )
  final FutureOr<bool?> Function(
    T controller,
    CygnusCreateWindowAction createWindowAction,
  )?
  onCreateWindow;

  ///{@template cygnus_core.CygnusPlatformWebViewCreationParams.onCloseWindow}
  ///Event fired when the host application should close the given WebView and remove it from the view system if necessary.
  ///At this point, WebCore has stopped any loading in this window and has removed any cross-scripting ability in javascript.
  ///{@endtemplate}
  ///
  ///{@macro cygnus_core.CygnusPlatformWebViewCreationParams.onCloseWindow.supported_platforms}
  @SupportedPlatforms(
    platforms: [
      AndroidPlatform(
        apiName: 'WebChromeClient.onCloseWindow',
        apiUrl:
            'https://developer.android.com/reference/android/webkit/WebChromeClient#onCloseWindow(android.webkit.WebView)',
      ),
      IOSPlatform(
        apiName: 'WKUIDelegate.webViewDidClose',
        apiUrl:
            'https://developer.apple.com/documentation/webkit/wkuidelegate/1537390-webviewdidclose',
      ),
      MacOSPlatform(
        apiName: 'WKUIDelegate.webViewDidClose',
        apiUrl:
            'https://developer.apple.com/documentation/webkit/wkuidelegate/1537390-webviewdidclose',
      ),
      WebPlatform(),
      WindowsPlatform(
        apiName: 'ICoreWebView2.add_WindowCloseRequested',
        apiUrl:
            'https://learn.microsoft.com/en-us/microsoft-edge/webview2/reference/win32/icorewebview2?view=webview2-1.0.2210.55#add_windowcloserequested',
      ),
      LinuxPlatform(
        apiName: 'WebKitWebView::close',
        apiUrl:
            'https://wpewebkit.org/reference/stable/wpe-webkit-2.0/signal.WebView.close.html',
      ),
    ],
  )
  final void Function(T controller)? onCloseWindow;

  ///{@template cygnus_core.CygnusPlatformWebViewCreationParams.onWindowFocus}
  ///Event fired when the JavaScript `window` object of the WebView has received focus.
  ///This is the result of the `focus` JavaScript event applied to the `window` object.
  ///{@endtemplate}
  ///
  ///{@macro cygnus_core.CygnusPlatformWebViewCreationParams.onWindowFocus.supported_platforms}
  @SupportedPlatforms(
    platforms: [
      AndroidPlatform(),
      IOSPlatform(),
      MacOSPlatform(),
      WebPlatform(
        apiName: 'Window.onfocus',
        apiUrl:
            'https://developer.mozilla.org/en-US/docs/Web/API/Window/focus_event',
      ),
    ],
  )
  final void Function(T controller)? onWindowFocus;

  ///{@template cygnus_core.CygnusPlatformWebViewCreationParams.onWindowBlur}
  ///Event fired when the JavaScript `window` object of the WebView has lost focus.
  ///This is the result of the `blur` JavaScript event applied to the `window` object.
  ///{@endtemplate}
  ///
  ///{@macro cygnus_core.CygnusPlatformWebViewCreationParams.onWindowBlur.supported_platforms}
  @SupportedPlatforms(
    platforms: [
      AndroidPlatform(),
      IOSPlatform(),
      MacOSPlatform(),
      WebPlatform(
        apiName: 'Window.onblur',
        apiUrl:
            'https://developer.mozilla.org/en-US/docs/Web/API/Window/blur_event',
      ),
    ],
  )
  final void Function(T controller)? onWindowBlur;

  ///{@template cygnus_core.CygnusPlatformWebViewCreationParams.onJsAlert}
  ///Event fired when javascript calls the `alert()` method to display an alert dialog.
  ///If [CygnusJsAlertResponse.handledByClient] is `true`, the webview will assume that the client will handle the dialog.
  ///
  ///[jsAlertRequest] contains the message to be displayed in the alert dialog and the of the page requesting the dialog.
  ///{@endtemplate}
  ///
  ///{@macro cygnus_core.CygnusPlatformWebViewCreationParams.onJsAlert.supported_platforms}
  @SupportedPlatforms(
    platforms: [
      AndroidPlatform(
        apiName: 'WebChromeClient.onJsAlert',
        apiUrl:
            'https://developer.android.com/reference/android/webkit/WebChromeClient#onJsAlert(android.webkit.WebView,%20java.lang.String,%20java.lang.String,%20android.webkit.JsResult)',
      ),
      IOSPlatform(
        apiName: 'WKUIDelegate.webView',
        apiUrl:
            'https://developer.apple.com/documentation/webkit/wkuidelegate/1537406-webview',
      ),
      MacOSPlatform(
        apiName: 'WKUIDelegate.webView',
        apiUrl:
            'https://developer.apple.com/documentation/webkit/wkuidelegate/1537406-webview',
      ),
      LinuxPlatform(
        apiName: 'WebKitWebView::script-dialog',
        apiUrl:
            'https://wpewebkit.org/reference/stable/wpe-webkit-2.0/signal.WebView.script-dialog.html',
        note: 'Handles WEBKIT_SCRIPT_DIALOG_ALERT dialog type.',
      ),
    ],
  )
  final FutureOr<CygnusJsAlertResponse?> Function(
    T controller,
    CygnusJsAlertRequest jsAlertRequest,
  )?
  onJsAlert;

  ///{@template cygnus_core.CygnusPlatformWebViewCreationParams.onJsConfirm}
  ///Event fired when javascript calls the `confirm()` method to display a confirm dialog.
  ///If [CygnusJsConfirmResponse.handledByClient] is `true`, the webview will assume that the client will handle the dialog.
  ///
  ///[jsConfirmRequest] contains the message to be displayed in the confirm dialog and the of the page requesting the dialog.
  ///{@endtemplate}
  ///
  ///{@macro cygnus_core.CygnusPlatformWebViewCreationParams.onJsConfirm.onJsConfirm}
  @SupportedPlatforms(
    platforms: [
      AndroidPlatform(
        apiName: 'WebChromeClient.onJsConfirm',
        apiUrl:
            'https://developer.android.com/reference/android/webkit/WebChromeClient#onJsConfirm(android.webkit.WebView,%20java.lang.String,%20java.lang.String,%20android.webkit.JsResult)',
      ),
      IOSPlatform(
        apiName: 'WKUIDelegate.webView',
        apiUrl:
            'https://developer.apple.com/documentation/webkit/wkuidelegate/1536489-webview',
      ),
      MacOSPlatform(
        apiName: 'WKUIDelegate.webView',
        apiUrl:
            'https://developer.apple.com/documentation/webkit/wkuidelegate/1536489-webview',
      ),
      LinuxPlatform(
        apiName: 'WebKitWebView::script-dialog',
        apiUrl:
            'https://wpewebkit.org/reference/stable/wpe-webkit-2.0/signal.WebView.script-dialog.html',
        note: 'Handles WEBKIT_SCRIPT_DIALOG_CONFIRM dialog type.',
      ),
    ],
  )
  final FutureOr<CygnusJsConfirmResponse?> Function(
    T controller,
    CygnusJsConfirmRequest jsConfirmRequest,
  )?
  onJsConfirm;

  ///{@template cygnus_core.CygnusPlatformWebViewCreationParams.onJsPrompt}
  ///Event fired when javascript calls the `prompt()` method to display a prompt dialog.
  ///If [CygnusJsPromptResponse.handledByClient] is `true`, the webview will assume that the client will handle the dialog.
  ///
  ///[jsPromptRequest] contains the message to be displayed in the prompt dialog, the default value displayed in the prompt dialog, and the of the page requesting the dialog.
  ///{@endtemplate}
  ///
  ///{@macro cygnus_core.CygnusPlatformWebViewCreationParams.onJsPrompt.supported_platforms}
  @SupportedPlatforms(
    platforms: [
      AndroidPlatform(
        apiName: 'WebChromeClient.onJsPrompt',
        apiUrl:
            'https://developer.android.com/reference/android/webkit/WebChromeClient#onJsPrompt(android.webkit.WebView,%20java.lang.String,%20java.lang.String,%20java.lang.String,%20android.webkit.JsPromptResult)',
      ),
      IOSPlatform(
        apiName: 'WKUIDelegate.webView',
        apiUrl:
            'https://developer.apple.com/documentation/webkit/wkuidelegate/1538086-webview',
      ),
      MacOSPlatform(
        apiName: 'WKUIDelegate.webView',
        apiUrl:
            'https://developer.apple.com/documentation/webkit/wkuidelegate/1538086-webview',
      ),
      LinuxPlatform(
        apiName: 'WebKitWebView::script-dialog',
        apiUrl:
            'https://wpewebkit.org/reference/stable/wpe-webkit-2.0/signal.WebView.script-dialog.html',
        note: 'Handles WEBKIT_SCRIPT_DIALOG_PROMPT dialog type.',
      ),
    ],
  )
  final FutureOr<CygnusJsPromptResponse?> Function(
    T controller,
    CygnusJsPromptRequest jsPromptRequest,
  )?
  onJsPrompt;

  ///{@template cygnus_core.CygnusPlatformWebViewCreationParams.onReceivedHttpAuthRequest}
  ///Event fired when the WebView received an HTTP authentication request. The default behavior is to cancel the request.
  ///
  ///[challenge] contains data about host, port, protocol, realm, etc. as specified in the [CygnusURLAuthenticationChallenge].
  ///{@endtemplate}
  ///
  ///{@macro cygnus_core.CygnusPlatformWebViewCreationParams.onReceivedHttpAuthRequest.supported_platforms}
  @SupportedPlatforms(
    platforms: [
      AndroidPlatform(
        apiName: 'WebViewClient.onReceivedHttpAuthRequest',
        apiUrl:
            'https://developer.android.com/reference/android/webkit/WebViewClient#onReceivedHttpAuthRequest(android.webkit.WebView,%20android.webkit.HttpAuthHandler,%20java.lang.String,%20java.lang.String)',
      ),
      IOSPlatform(
        apiName: 'WKNavigationDelegate.webView',
        apiUrl:
            'https://developer.apple.com/documentation/webkit/wknavigationdelegate/1455638-webview',
      ),
      MacOSPlatform(
        apiName: 'WKNavigationDelegate.webView',
        apiUrl:
            'https://developer.apple.com/documentation/webkit/wknavigationdelegate/1455638-webview',
      ),
      WindowsPlatform(
        apiName: 'ICoreWebView2_10.add_BasicAuthenticationRequested',
        apiUrl:
            'https://learn.microsoft.com/en-us/microsoft-edge/webview2/reference/win32/icorewebview2_10?view=webview2-1.0.2849.39#add_basicauthenticationrequested',
      ),
      LinuxPlatform(
        apiName: 'WebKitWebView::authenticate',
        apiUrl:
            'https://wpewebkit.org/reference/stable/wpe-webkit-2.0/signal.WebView.authenticate.html',
      ),
    ],
  )
  final FutureOr<CygnusHttpAuthResponse?> Function(
    T controller,
    CygnusHttpAuthenticationChallenge challenge,
  )?
  onReceivedHttpAuthRequest;

  ///{@template cygnus_core.CygnusPlatformWebViewCreationParams.onReceivedServerTrustAuthRequest}
  ///Event fired when the WebView need to perform server trust authentication (certificate validation).
  ///The host application must return either [CygnusServerTrustAuthResponse] instance with [CygnusServerTrustAuthResponseAction.CANCEL] or [CygnusServerTrustAuthResponseAction.PROCEED].
  ///
  ///[challenge] contains data about host, port, protocol, realm, etc. as specified in the [CygnusServerTrustChallenge].
  ///{@endtemplate}
  ///
  ///{@macro cygnus_core.CygnusPlatformWebViewCreationParams.onReceivedServerTrustAuthRequest.supported_platforms}
  @SupportedPlatforms(
    platforms: [
      AndroidPlatform(
        apiName: 'WebViewClient.onReceivedSslError',
        apiUrl:
            'https://developer.android.com/reference/android/webkit/WebViewClient#onReceivedSslError(android.webkit.WebView,%20android.webkit.SslErrorHandler,%20android.net.http.CygnusSslError)',
      ),
      IOSPlatform(
        apiName: 'WKNavigationDelegate.webView',
        apiUrl:
            'https://developer.apple.com/documentation/webkit/wknavigationdelegate/1455638-webview',
        note:
            """To override the certificate verification logic, you have to provide ATS (App Transport Security) exceptions in your iOS/macOS `Info.plist`.
See `NSAppTransportSecurity` in the [Information Property List Key Reference](https://developer.apple.com/library/content/documentation/General/Reference/InfoPlistKeyReference/Articles/CocoaKeys.html#//apple_ref/doc/uid/TP40009251-SW1) for details.""",
      ),
      MacOSPlatform(
        apiName: 'WKNavigationDelegate.webView',
        apiUrl:
            'https://developer.apple.com/documentation/webkit/wknavigationdelegate/1455638-webview',
        note:
            """To override the certificate verification logic, you have to provide ATS (App Transport Security) exceptions in your iOS/macOS `Info.plist`.
See `NSAppTransportSecurity` in the [Information Property List Key Reference](https://developer.apple.com/library/content/documentation/General/Reference/InfoPlistKeyReference/Articles/CocoaKeys.html#//apple_ref/doc/uid/TP40009251-SW1) for details.""",
      ),
      WindowsPlatform(
        apiName: 'ICoreWebView2_14.add_ServerCertificateErrorDetected',
        apiUrl:
            'https://learn.microsoft.com/en-us/microsoft-edge/webview2/reference/win32/icorewebview2_14?view=webview2-1.0.2792.45#add_servercertificateerrordetected',
      ),
      LinuxPlatform(
        apiName: 'WebKitWebView::load-failed-with-tls-errors',
        apiUrl:
            'https://wpewebkit.org/reference/stable/wpe-webkit-2.0/signal.WebView.load-failed-with-tls-errors.html',
        note:
            'Uses webkit_web_context_allow_tls_certificate_for_host() to allow proceeding with an invalid certificate.',
      ),
    ],
  )
  final FutureOr<CygnusServerTrustAuthResponse?> Function(
    T controller,
    CygnusServerTrustChallenge challenge,
  )?
  onReceivedServerTrustAuthRequest;

  ///{@template cygnus_core.CygnusPlatformWebViewCreationParams.onReceivedClientCertRequest}
  ///Notify the host application to handle an SSL client certificate request.
  ///Webview stores the response in memory (for the life of the application) if [CygnusClientCertResponseAction.PROCEED] or [CygnusClientCertResponseAction.CANCEL]
  ///is called and does not call [onReceivedClientCertRequest] again for the same host and port pair.
  ///Note that, multiple layers in chromium network stack might be caching the responses.
  ///
  ///[challenge] contains data about host, port, protocol, realm, etc. as specified in the [CygnusClientCertChallenge].
  ///{@endtemplate}
  ///
  ///{@macro cygnus_core.CygnusPlatformWebViewCreationParams.onReceivedClientCertRequest.supported_platforms}
  @SupportedPlatforms(
    platforms: [
      AndroidPlatform(
        apiName: 'WebViewClient.onReceivedClientCertRequest',
        apiUrl:
            'https://developer.android.com/reference/android/webkit/WebViewClient#onReceivedClientCertRequest(android.webkit.WebView,%20android.webkit.ClientCertRequest)',
      ),
      IOSPlatform(
        apiName: 'WKNavigationDelegate.webView',
        apiUrl:
            'https://developer.apple.com/documentation/webkit/wknavigationdelegate/1455638-webview',
      ),
      MacOSPlatform(
        apiName: 'WKNavigationDelegate.webView',
        apiUrl:
            'https://developer.apple.com/documentation/webkit/wknavigationdelegate/1455638-webview',
      ),
      WindowsPlatform(
        apiName: 'ICoreWebView2_5.add_ClientCertificateRequested',
        apiUrl:
            'https://learn.microsoft.com/en-us/microsoft-edge/webview2/reference/win32/icorewebview2_5?view=webview2-1.0.2849.39#add_clientcertificaterequested',
      ),
      LinuxPlatform(
        apiName:
            'WebKitAuthenticationRequest with WEBKIT_AUTHENTICATION_SCHEME_CLIENT_CERTIFICATE_REQUESTED',
        apiUrl:
            'https://wpewebkit.org/reference/stable/wpe-webkit-2.0/signal.WebView.authenticate.html',
        note:
            'WPE WebKit supports client certificate requests via the authenticate signal. '
            'Providing a certificate programmatically requires WebKit 2.34+ and the certificate must be loaded from a PEM file. '
            'PKCS12 format may not be fully supported. If the certificate cannot be loaded, PROCEED will behave like CANCEL.',
      ),
    ],
  )
  final FutureOr<CygnusClientCertResponse?> Function(
    T controller,
    CygnusClientCertChallenge challenge,
  )?
  onReceivedClientCertRequest;

  ///{@template cygnus_core.CygnusPlatformWebViewCreationParams.onFindResultReceived}
  ///Use [CygnusFindInteractionController.onFindResultReceived] instead.
  ///{@endtemplate}
  ///
  ///{@macro cygnus_core.CygnusPlatformWebViewCreationParams.onFindResultReceived.supported_platforms}
  @SupportedPlatforms(
    platforms: [AndroidPlatform(), IOSPlatform(), MacOSPlatform()],
  )
  @Deprecated('Use CygnusFindInteractionController.onFindResultReceived instead')
  final void Function(
    T controller,
    int activeMatchOrdinal,
    int numberOfMatches,
    bool isDoneCounting,
  )?
  onFindResultReceived;

  ///{@template cygnus_core.CygnusPlatformWebViewCreationParams.shouldInterceptAjaxRequest}
  ///Event fired when an `XMLHttpRequest` is sent to a server.
  ///It gives the host application a chance to take control over the request before sending it.
  ///This event is implemented using JavaScript under the hood.
  ///
  ///Due to the async nature of this event implementation, it will intercept only async `XMLHttpRequest`s ([CygnusAjaxRequest.isAsync] with `true`).
  ///To be able to intercept sync `XMLHttpRequest`s, use [CygnusWebViewSettings.interceptOnlyAsyncAjaxRequests] to `false`.
  ///If necessary, you should implement your own logic using for example an [CygnusUserScript] overriding the
  ///[XMLHttpRequest](https://developer.mozilla.org/en-US/docs/Web/API/XMLHttpRequest) JavaScript object.
  ///
  ///[ajaxRequest] represents the `XMLHttpRequest`.
  ///{@endtemplate}
  ///
  ///{@macro cygnus_core.CygnusPlatformWebViewCreationParams.shouldInterceptAjaxRequest.supported_platforms}
  @SupportedPlatforms(
    platforms: [
      AndroidPlatform(
        note:
            """In order to be able to listen this event, check the [CygnusWebViewSettings.useShouldInterceptAjaxRequest] setting documentation.
Also, on Android that doesn't support the [CygnusWebViewFeature.DOCUMENT_START_SCRIPT], unlike iOS that has [WKUserScript](https://developer.apple.com/documentation/webkit/wkuserscript) that
can inject javascript code right after the document element is created but before any other content is loaded, in Android the javascript code
used to intercept ajax requests is loaded as soon as possible so it won't be instantaneous as iOS.
In that case, after the `window.addEventListener("cygnusPlatformReady")` event is dispatched, the ajax requests can be intercept for sure.""",
      ),
      IOSPlatform(),
      MacOSPlatform(),
      LinuxPlatform(
        note:
            'This event is implemented using JavaScript. In order to be able to listen to this event, check the [CygnusWebViewSettings.useShouldInterceptAjaxRequest] setting documentation.',
      ),
    ],
  )
  final FutureOr<CygnusAjaxRequest?> Function(T controller, CygnusAjaxRequest ajaxRequest)?
  shouldInterceptAjaxRequest;

  ///{@template cygnus_core.CygnusPlatformWebViewCreationParams.onAjaxReadyStateChange}
  ///Event fired whenever the `readyState` attribute of an `XMLHttpRequest` changes.
  ///It gives the host application a chance to abort the request.
  ///This event is implemented using JavaScript under the hood.
  ///
  ///Due to the async nature of this event implementation,
  ///using it could cause some issues, so, be careful when using it.
  ///In this case, you should implement your own logic using for example an [CygnusUserScript] overriding the
  ///[XMLHttpRequest](https://developer.mozilla.org/en-US/docs/Web/API/XMLHttpRequest) JavaScript object.
  ///
  ///[ajaxRequest] represents the [XMLHttpRequest].
  ///{@endtemplate}
  ///
  ///{@macro cygnus_core.CygnusPlatformWebViewCreationParams.onAjaxReadyStateChange.supported_platforms}
  @SupportedPlatforms(
    platforms: [
      AndroidPlatform(
        note:
            """In order to be able to listen this event, check the [CygnusWebViewSettings.useShouldInterceptAjaxRequest] and [CygnusWebViewSettings.useOnAjaxReadyStateChange] settings documentation.
Also, on Android that doesn't support the [CygnusWebViewFeature.DOCUMENT_START_SCRIPT], unlike iOS that has [WKUserScript](https://developer.apple.com/documentation/webkit/wkuserscript) that
can inject javascript code right after the document element is created but before any other content is loaded, in Android the javascript code
used to intercept ajax requests is loaded as soon as possible so it won't be instantaneous as iOS.
In that case, after the `window.addEventListener("cygnusPlatformReady")` event is dispatched, the ajax requests can be intercept for sure.""",
      ),
      IOSPlatform(),
      MacOSPlatform(),
      LinuxPlatform(
        note:
            'This event is implemented using JavaScript. In order to be able to listen to this event, check the [CygnusWebViewSettings.useShouldInterceptAjaxRequest] and [CygnusWebViewSettings.useOnAjaxReadyStateChange] settings documentation.',
      ),
    ],
  )
  final FutureOr<CygnusAjaxRequestAction?> Function(
    T controller,
    CygnusAjaxRequest ajaxRequest,
  )?
  onAjaxReadyStateChange;

  ///{@template cygnus_core.CygnusPlatformWebViewCreationParams.onAjaxProgress}
  ///Event fired as an `XMLHttpRequest` progress.
  ///It gives the host application a chance to abort the request.
  ///This event is implemented using JavaScript under the hood.
  ///
  ///[ajaxRequest] represents the [XMLHttpRequest].
  ///{@endtemplate}
  ///
  ///{@macro cygnus_core.CygnusPlatformWebViewCreationParams.onAjaxProgress.supported_platforms}
  @SupportedPlatforms(
    platforms: [
      AndroidPlatform(
        note:
            """In order to be able to listen this event, check the [CygnusWebViewSettings.useShouldInterceptAjaxRequest] and [CygnusWebViewSettings.useOnAjaxProgress] settings documentation.
Also, on Android that doesn't support the [CygnusWebViewFeature.DOCUMENT_START_SCRIPT], unlike iOS that has [WKUserScript](https://developer.apple.com/documentation/webkit/wkuserscript) that
can inject javascript code right after the document element is created but before any other content is loaded, in Android the javascript code
used to intercept ajax requests is loaded as soon as possible so it won't be instantaneous as iOS.
In that case, after the `window.addEventListener("cygnusPlatformReady")` event is dispatched, the ajax requests can be intercept for sure.""",
      ),
      IOSPlatform(),
      MacOSPlatform(),
      LinuxPlatform(
        note:
            'This event is implemented using JavaScript. In order to be able to listen to this event, check the [CygnusWebViewSettings.useShouldInterceptAjaxRequest] and [CygnusWebViewSettings.useOnAjaxProgress] settings documentation.',
      ),
    ],
  )
  final FutureOr<CygnusAjaxRequestAction?> Function(
    T controller,
    CygnusAjaxRequest ajaxRequest,
  )?
  onAjaxProgress;

  ///{@template cygnus_core.CygnusPlatformWebViewCreationParams.shouldInterceptFetchRequest}
  ///Event fired when a request is sent to a server through [Fetch API](https://developer.mozilla.org/it/docs/Web/API/Fetch_API).
  ///It gives the host application a chance to take control over the request before sending it.
  ///This event is implemented using JavaScript under the hood.
  ///
  ///[fetchRequest] represents a resource request.
  ///{@endtemplate}
  ///
  ///{@macro cygnus_core.CygnusPlatformWebViewCreationParams.shouldInterceptFetchRequest.supported_platforms}
  @SupportedPlatforms(
    platforms: [
      AndroidPlatform(
        note:
            """In order to be able to listen this event, check the [CygnusWebViewSettings.useShouldInterceptFetchRequest] setting documentation.
Also, on Android that doesn't support the [CygnusWebViewFeature.DOCUMENT_START_SCRIPT], unlike iOS that has [WKUserScript](https://developer.apple.com/documentation/webkit/wkuserscript) that
can inject javascript code right after the document element is created but before any other content is loaded, in Android the javascript code
used to intercept ajax requests is loaded as soon as possible so it won't be instantaneous as iOS.
In that case, after the `window.addEventListener("cygnusPlatformReady")` event is dispatched, the ajax requests can be intercept for sure.""",
      ),
      IOSPlatform(),
      MacOSPlatform(),
      LinuxPlatform(
        note:
            'This event is implemented using JavaScript. In order to be able to listen to this event, check the [CygnusWebViewSettings.useShouldInterceptFetchRequest] setting documentation.',
      ),
    ],
  )
  final FutureOr<CygnusFetchRequest?> Function(
    T controller,
    CygnusFetchRequest fetchRequest,
  )?
  shouldInterceptFetchRequest;

  ///{@template cygnus_core.CygnusPlatformWebViewCreationParams.onUpdateVisitedHistory}
  ///Event fired when the host application updates its visited links database.
  ///This event is also fired when the navigation state of the `WebView` changes through the usage of
  ///javascript **[History API](https://developer.mozilla.org/en-US/docs/Web/API/History_API)** functions (`pushState()`, `replaceState()`) and `onpopstate` event
  ///or, also, when the javascript `window.location` changes without reloading the webview (for example appending or modifying a hash to the url).
  ///
  ///[url] represents the url being visited.
  ///
  ///[isReload] indicates if this url is being reloaded.
  ///{@endtemplate}
  ///
  ///{@macro cygnus_core.CygnusPlatformWebViewCreationParams.onUpdateVisitedHistory.supported_platforms}
  @SupportedPlatforms(
    platforms: [
      AndroidPlatform(
        apiName: 'WebViewClient.doUpdateVisitedHistory',
        apiUrl:
            'https://developer.android.com/reference/android/webkit/WebViewClient#doUpdateVisitedHistory(android.webkit.WebView,%20java.lang.String,%20boolean)',
      ),
      IOSPlatform(),
      MacOSPlatform(),
      WebPlatform(),
      WindowsPlatform(
        apiName: 'ICoreWebView2.add_HistoryChanged',
        apiUrl:
            'https://learn.microsoft.com/en-us/microsoft-edge/webview2/reference/win32/icorewebview2?view=webview2-1.0.2210.55#add_historychanged',
      ),
      LinuxPlatform(
        note:
            'Tracked via load-changed signal and History API JavaScript events.',
      ),
    ],
    parameterPlatforms: {
      'isReload': [AndroidPlatform()],
    },
  )
  final void Function(T controller, CygnusWebUri? url, bool? isReload)?
  onUpdateVisitedHistory;

  ///{@template cygnus_core.CygnusPlatformWebViewCreationParams.onPrint}
  ///Use [onPrintRequest] instead
  ///{@endtemplate}
  ///
  ///{@macro cygnus_core.CygnusPlatformWebViewCreationParams.onPrint.supported_platforms}
  @SupportedPlatforms(platforms: [AndroidPlatform(), IOSPlatform()])
  @Deprecated("Use onPrintRequest instead")
  final void Function(T controller, Uri? url)? onPrint;

  ///{@template cygnus_core.CygnusPlatformWebViewCreationParams.onPrintRequest}
  ///Event fired when `window.print()` is called from JavaScript side.
  ///Return `true` if you want to handle the print job.
  ///Otherwise return `false`, so the [CygnusPlatformPrintJobController] will be handled and disposed automatically by the system.
  ///
  ///[url] represents the url on which is called.
  ///
  ///[printJobController] represents the controller of the print job created.
  ///{@endtemplate}
  ///
  ///{@macro cygnus_core.CygnusPlatformWebViewCreationParams.onPrintRequest.supported_platforms}
  @SupportedPlatforms(
    platforms: [
      AndroidPlatform(),
      IOSPlatform(),
      MacOSPlatform(),
      WebPlatform(),
      LinuxPlatform(
        note: 'Intercepted via JavaScript window.print() override.',
      ),
    ],
    parameterPlatforms: {
      'printJobController': [AndroidPlatform(), IOSPlatform(), MacOSPlatform()],
    },
  )
  final FutureOr<bool?> Function(
    T controller,
    CygnusWebUri? url,
    CygnusPlatformPrintJobController? printJobController,
  )?
  onPrintRequest;

  ///{@template cygnus_core.CygnusPlatformWebViewCreationParams.onLongPressHitTestResult}
  ///Event fired when an HTML element of the webview has been clicked and held.
  ///
  ///[hitTestResult] represents the hit result for hitting an HTML elements.
  ///{@endtemplate}
  ///
  ///{@macro cygnus_core.CygnusPlatformWebViewCreationParams.onLongPressHitTestResult.supported_platforms}
  @SupportedPlatforms(
    platforms: [
      AndroidPlatform(
        apiName: 'View.setOnLongClickListener',
        apiUrl:
            'https://developer.android.com/reference/android/view/View#setOnLongClickListener(android.view.View.OnLongClickListener)',
      ),
      IOSPlatform(
        apiName: 'UILongPressGestureRecognizer',
        apiUrl:
            'https://developer.apple.com/documentation/uikit/uilongpressgesturerecognizer',
      ),
    ],
  )
  final void Function(T controller, CygnusWebViewHitTestResult hitTestResult)?
  onLongPressHitTestResult;

  ///{@template cygnus_core.CygnusPlatformWebViewCreationParams.onEnterFullscreen}
  ///Event fired when the current page has entered full screen mode.
  ///{@endtemplate}
  ///
  ///{@macro cygnus_core.CygnusPlatformWebViewCreationParams.onEnterFullscreen.supported_platforms}
  @SupportedPlatforms(
    platforms: [
      AndroidPlatform(
        apiName: 'WebChromeClient.onShowCustomView',
        apiUrl:
            'https://developer.android.com/reference/android/webkit/WebChromeClient#onShowCustomView(android.view.View,%20android.webkit.WebChromeClient.CustomViewCallback)',
      ),
      IOSPlatform(
        apiName: 'UIWindow.didBecomeVisibleNotification',
        apiUrl:
            'https://developer.apple.com/documentation/uikit/uiwindow/1621621-didbecomevisiblenotification',
      ),
      MacOSPlatform(
        apiName: 'NSWindow.didEnterFullScreenNotification',
        apiUrl:
            'https://developer.apple.com/documentation/appkit/nswindow/1419651-didenterfullscreennotification',
      ),
      WebPlatform(
        apiName: 'Document.onfullscreenchange',
        apiUrl:
            'https://developer.mozilla.org/en-US/docs/Web/API/Document/fullscreenchange_event',
      ),
      WindowsPlatform(
        apiName: 'ICoreWebView2.add_ContainsFullScreenElementChanged',
        apiUrl:
            'https://learn.microsoft.com/en-us/microsoft-edge/webview2/reference/win32/icorewebview2?view=webview2-1.0.2210.55#add_containsfullscreenelementchanged',
      ),
      LinuxPlatform(
        apiName: 'WebKitWebView::enter-fullscreen',
        apiUrl:
            'https://wpewebkit.org/reference/stable/wpe-webkit-2.0/signal.WebView.enter-fullscreen.html',
      ),
    ],
  )
  final void Function(T controller)? onEnterFullscreen;

  ///{@template cygnus_core.CygnusPlatformWebViewCreationParams.onExitFullscreen}
  ///Event fired when the current page has exited full screen mode.
  ///{@endtemplate}
  ///
  ///{@macro cygnus_core.CygnusPlatformWebViewCreationParams.onExitFullscreen.supported_platforms}
  @SupportedPlatforms(
    platforms: [
      AndroidPlatform(
        apiName: 'WebChromeClient.onHideCustomView',
        apiUrl:
            'https://developer.android.com/reference/android/webkit/WebChromeClient#onHideCustomView()',
      ),
      IOSPlatform(
        apiName: 'UIWindow.didBecomeHiddenNotification',
        apiUrl:
            'https://developer.apple.com/documentation/uikit/uiwindow/1621617-didbecomehiddennotification',
      ),
      MacOSPlatform(
        apiName: 'NSWindow.didExitFullScreenNotification',
        apiUrl:
            'https://developer.apple.com/documentation/appkit/nswindow/1419177-didexitfullscreennotification',
      ),
      WebPlatform(
        apiName: 'Document.onfullscreenchange',
        apiUrl:
            'https://developer.mozilla.org/en-US/docs/Web/API/Document/fullscreenchange_event',
      ),
      WindowsPlatform(
        apiName: 'ICoreWebView2.add_ContainsFullScreenElementChanged',
        apiUrl:
            'https://learn.microsoft.com/en-us/microsoft-edge/webview2/reference/win32/icorewebview2?view=webview2-1.0.2210.55#add_containsfullscreenelementchanged',
      ),
      LinuxPlatform(
        apiName: 'WebKitWebView::leave-fullscreen',
        apiUrl:
            'https://wpewebkit.org/reference/stable/wpe-webkit-2.0/signal.WebView.leave-fullscreen.html',
      ),
    ],
  )
  final void Function(T controller)? onExitFullscreen;

  ///{@template cygnus_core.CygnusPlatformWebViewCreationParams.onPageCommitVisible}
  ///Called when the web view begins to receive web content.
  ///
  ///This event occurs early in the document loading process, and as such
  ///you should expect that linked resources (for example, CSS and images) may not be available.
  ///
  ///[url] represents the URL corresponding to the page navigation that triggered this callback.
  ///{@endtemplate}
  ///
  ///{@macro cygnus_core.CygnusPlatformWebViewCreationParams.onPageCommitVisible.supported_platforms}
  @SupportedPlatforms(
    platforms: [
      AndroidPlatform(
        apiName: 'WebViewClient.onPageCommitVisible',
        apiUrl:
            'https://developer.android.com/reference/android/webkit/WebViewClient#onPageCommitVisible(android.webkit.WebView,%20java.lang.String)',
      ),
      IOSPlatform(
        apiName: 'WKNavigationDelegate.webView',
        apiUrl:
            'https://developer.apple.com/documentation/webkit/wknavigationdelegate/1455635-webview',
      ),
      MacOSPlatform(
        apiName: 'WKNavigationDelegate.webView',
        apiUrl:
            'https://developer.apple.com/documentation/webkit/wknavigationdelegate/1455635-webview',
      ),
      LinuxPlatform(
        apiName: 'WebKitWebView::load-changed',
        apiUrl:
            'https://wpewebkit.org/reference/stable/wpe-webkit-2.0/signal.WebView.load-changed.html',
        note: 'Fired when WebKitLoadEvent is WEBKIT_LOAD_COMMITTED.',
      ),
    ],
  )
  final void Function(T controller, CygnusWebUri? url)? onPageCommitVisible;

  ///{@template cygnus_core.CygnusPlatformWebViewCreationParams.onTitleChanged}
  ///Event fired when a change in the document title occurred.
  ///
  ///[title] represents the string containing the new title of the document.
  ///{@endtemplate}
  ///
  ///{@macro cygnus_core.CygnusPlatformWebViewCreationParams.onTitleChanged.supported_platforms}
  @SupportedPlatforms(
    platforms: [
      AndroidPlatform(
        apiName: 'WebChromeClient.onReceivedTitle',
        apiUrl:
            'https://developer.android.com/reference/android/webkit/WebChromeClient#onReceivedTitle(android.webkit.WebView,%20java.lang.String)',
      ),
      IOSPlatform(),
      MacOSPlatform(),
      WebPlatform(),
      WindowsPlatform(
        apiName: 'ICoreWebView2.add_DocumentTitleChanged',
        apiUrl:
            'https://learn.microsoft.com/en-us/microsoft-edge/webview2/reference/win32/icorewebview2?view=webview2-1.0.2210.55#add_documenttitlechanged',
      ),
      LinuxPlatform(
        apiName: 'WebKitWebView::notify::title',
        apiUrl:
            'https://wpewebkit.org/reference/stable/wpe-webkit-2.0/property.WebView.title.html',
      ),
    ],
  )
  final void Function(T controller, String? title)? onTitleChanged;

  ///{@template cygnus_core.CygnusPlatformWebViewCreationParams.onOverScrolled}
  ///Event fired to respond to the results of an over-scroll operation.
  ///
  ///[x] represents the new X scroll value in pixels.
  ///
  ///[y] represents the new Y scroll value in pixels.
  ///
  ///[clampedX] is `true` if [x] was clamped to an over-scroll boundary.
  ///
  ///[clampedY] is `true` if [y] was clamped to an over-scroll boundary.
  ///{@endtemplate}
  ///
  ///{@macro cygnus_core.CygnusPlatformWebViewCreationParams.onOverScrolled.supported_platforms}
  @SupportedPlatforms(
    platforms: [
      AndroidPlatform(
        apiName: 'WebView.onOverScrolled',
        apiUrl:
            'https://developer.android.com/reference/android/webkit/WebView#onOverScrolled(int,%20int,%20boolean,%20boolean)',
      ),
      IOSPlatform(),
    ],
  )
  final void Function(T controller, int x, int y, bool clampedX, bool clampedY)?
  onOverScrolled;

  ///{@template cygnus_core.CygnusPlatformWebViewCreationParams.onZoomScaleChanged}
  ///Event fired when the zoom scale of the WebView has changed.
  ///
  ///[oldScale] The old zoom scale factor.
  ///
  ///[newScale] The new zoom scale factor.
  ///{@endtemplate}
  ///
  ///{@macro cygnus_core.CygnusPlatformWebViewCreationParams.onZoomScaleChanged.supported_platforms}
  @SupportedPlatforms(
    platforms: [
      AndroidPlatform(
        apiName: 'WebViewClient.onScaleChanged',
        apiUrl:
            'https://developer.android.com/reference/android/webkit/WebViewClient#onScaleChanged(android.webkit.WebView,%20float,%20float)',
      ),
      IOSPlatform(
        apiName: 'UIScrollViewDelegate.scrollViewDidZoom',
        apiUrl:
            'https://developer.apple.com/documentation/uikit/uiscrollviewdelegate/1619409-scrollviewdidzoom',
      ),
      WebPlatform(),
      WindowsPlatform(
        apiName: 'ICoreWebView2Controller.add_ZoomFactorChanged',
        apiUrl:
            'https://learn.microsoft.com/en-us/microsoft-edge/webview2/reference/win32/icorewebview2controller?view=webview2-1.0.2849.39#add_zoomfactorchanged',
      ),
      LinuxPlatform(
        apiName: 'WebKitWebView::notify::zoom-level',
        apiUrl:
            'https://wpewebkit.org/reference/stable/wpe-webkit-2.0/property.WebView.zoom-level.html',
      ),
    ],
  )
  final void Function(T controller, double oldScale, double newScale)?
  onZoomScaleChanged;

  ///{@template cygnus_core.CygnusPlatformWebViewCreationParams.androidOnSafeBrowsingHit}
  ///Use [onSafeBrowsingHit] instead.
  ///{@endtemplate}
  ///
  ///{@macro cygnus_core.CygnusPlatformWebViewCreationParams.androidOnSafeBrowsingHit.supported_platforms}
  @SupportedPlatforms(platforms: [AndroidPlatform()])
  @Deprecated("Use onSafeBrowsingHit instead")
  final FutureOr<CygnusSafeBrowsingResponse?> Function(
    T controller,
    Uri url,
    CygnusSafeBrowsingThreat? threatType,
  )?
  androidOnSafeBrowsingHit;

  ///{@template cygnus_core.CygnusPlatformWebViewCreationParams.onSafeBrowsingHit}
  ///Event fired when the webview notifies that a loading URL has been flagged by Safe Browsing.
  ///The default behavior is to show an interstitial to the user, with the reporting checkbox visible.
  ///
  ///[url] represents the url of the request.
  ///
  ///[threatType] represents the reason the resource was caught by Safe Browsing, corresponding to a [CygnusSafeBrowsingThreat].
  ///{@endtemplate}
  ///
  ///{@macro cygnus_core.CygnusPlatformWebViewCreationParams.onSafeBrowsingHit.supported_platforms}
  @SupportedPlatforms(
    platforms: [
      AndroidPlatform(
        apiName: 'WebViewClient.onSafeBrowsingHit',
        apiUrl:
            'https://developer.android.com/reference/android/webkit/WebViewClient#onSafeBrowsingHit(android.webkit.WebView,%20android.webkit.CygnusWebResourceRequest,%20int,%20android.webkit.CygnusSafeBrowsingResponse)',
        available: '27',
      ),
    ],
  )
  final FutureOr<CygnusSafeBrowsingResponse?> Function(
    T controller,
    CygnusWebUri url,
    CygnusSafeBrowsingThreat? threatType,
  )?
  onSafeBrowsingHit;

  ///{@template cygnus_core.CygnusPlatformWebViewCreationParams.androidOnPermissionRequest}
  ///Use [onPermissionRequest] instead.
  ///{@endtemplate}
  ///
  ///{@macro cygnus_core.CygnusPlatformWebViewCreationParams.androidOnPermissionRequest.supported_platforms}
  @SupportedPlatforms(platforms: [AndroidPlatform()])
  @Deprecated("Use onPermissionRequest instead")
  final FutureOr<CygnusPermissionRequestResponse?> Function(
    T controller,
    String origin,
    List<String> resources,
  )?
  androidOnPermissionRequest;

  ///{@template cygnus_core.CygnusPlatformWebViewCreationParams.onPermissionRequest}
  ///Event fired when the WebView is requesting permission to access the specified resources and the permission currently isn't granted or denied.
  ///
  ///[permissionRequest] represents the permission request with an array of resources the web content wants to access
  ///and the origin of the web page which is trying to access the restricted resources.
  ///{@endtemplate}
  ///
  ///{@macro cygnus_core.CygnusPlatformWebViewCreationParams.onPermissionRequest.supported_platforms}
  @SupportedPlatforms(
    platforms: [
      AndroidPlatform(
        apiName: 'WebChromeClient.onPermissionRequest',
        apiUrl:
            'https://developer.android.com/reference/android/webkit/WebChromeClient#onPermissionRequest(android.webkit.CygnusPermissionRequest)',
        available: '21',
      ),
      IOSPlatform(
        available: '15.0',
        note:
            'The default [CygnusPermissionResponse.action] is [CygnusPermissionResponseAction.PROMPT].',
      ),
      MacOSPlatform(
        available: '12.0',
        note:
            'The default [CygnusPermissionResponse.action] is [CygnusPermissionResponseAction.PROMPT].',
      ),
      WindowsPlatform(
        apiName: 'ICoreWebView2.add_PermissionRequested',
        apiUrl:
            'https://learn.microsoft.com/en-us/microsoft-edge/webview2/reference/win32/icorewebview2?view=webview2-1.0.2210.55#add_permissionrequested',
      ),
      LinuxPlatform(
        apiName: 'WebKitWebView::permission-request',
        apiUrl:
            'https://wpewebkit.org/reference/stable/wpe-webkit-2.0/signal.WebView.permission-request.html',
      ),
    ],
  )
  final FutureOr<CygnusPermissionResponse?> Function(
    T controller,
    CygnusPermissionRequest permissionRequest,
  )?
  onPermissionRequest;

  ///{@template cygnus_core.CygnusPlatformWebViewCreationParams.androidOnGeolocationPermissionsShowPrompt}
  ///Use [onGeolocationPermissionsShowPrompt] instead.
  ///{@endtemplate}
  ///
  ///{@macro cygnus_core.CygnusPlatformWebViewCreationParams.androidOnGeolocationPermissionsShowPrompt.supported_platforms}
  @SupportedPlatforms(platforms: [AndroidPlatform()])
  @Deprecated("Use onGeolocationPermissionsShowPrompt instead")
  final FutureOr<CygnusGeolocationPermissionShowPromptResponse?> Function(
    T controller,
    String origin,
  )?
  androidOnGeolocationPermissionsShowPrompt;

  ///{@template cygnus_core.CygnusPlatformWebViewCreationParams.onGeolocationPermissionsShowPrompt}
  ///Event that notifies the host application that web content from the specified origin is attempting to use the Geolocation API, but no permission state is currently set for that origin.
  ///Note that for applications targeting Android N and later SDKs (API level > `Build.VERSION_CODES.M`) this method is only called for requests originating from secure origins such as https.
  ///On non-secure origins geolocation requests are automatically denied.
  ///
  ///[origin] represents the origin of the web content attempting to use the Geolocation API.
  ///{@endtemplate}
  ///
  ///{@macro cygnus_core.CygnusPlatformWebViewCreationParams.onGeolocationPermissionsShowPrompt.supported_platforms}
  @SupportedPlatforms(
    platforms: [
      AndroidPlatform(
        apiName: 'WebChromeClient.onGeolocationPermissionsShowPrompt',
        apiUrl:
            'https://developer.android.com/reference/android/webkit/WebChromeClient#onGeolocationPermissionsShowPrompt(java.lang.String,%20android.webkit.GeolocationPermissions.Callback)',
      ),
    ],
  )
  final FutureOr<CygnusGeolocationPermissionShowPromptResponse?> Function(
    T controller,
    String origin,
  )?
  onGeolocationPermissionsShowPrompt;

  ///{@template cygnus_core.CygnusPlatformWebViewCreationParams.androidOnGeolocationPermissionsHidePrompt}
  ///Use [onGeolocationPermissionsHidePrompt] instead.
  ///{@endtemplate}
  ///
  ///{@macro cygnus_core.CygnusPlatformWebViewCreationParams.androidOnGeolocationPermissionsHidePrompt.supported_platforms}
  @SupportedPlatforms(platforms: [AndroidPlatform()])
  @Deprecated("Use onGeolocationPermissionsHidePrompt instead")
  final void Function(T controller)? androidOnGeolocationPermissionsHidePrompt;

  ///{@template cygnus_core.CygnusPlatformWebViewCreationParams.onGeolocationPermissionsHidePrompt}
  ///Notify the host application that a request for Geolocation permissions, made with a previous call to [onGeolocationPermissionsShowPrompt] has been canceled.
  ///Any related UI should therefore be hidden.
  ///{@endtemplate}
  ///
  ///{@macro cygnus_core.CygnusPlatformWebViewCreationParams.onGeolocationPermissionsHidePrompt.supported_platforms}
  @SupportedPlatforms(
    platforms: [
      AndroidPlatform(
        apiName: 'WebChromeClient.onGeolocationPermissionsHidePrompt',
        apiUrl:
            'https://developer.android.com/reference/android/webkit/WebChromeClient#onGeolocationPermissionsHidePrompt()',
      ),
    ],
  )
  final void Function(T controller)? onGeolocationPermissionsHidePrompt;

  ///{@template cygnus_core.CygnusPlatformWebViewCreationParams.androidShouldInterceptRequest}
  ///Use [shouldInterceptRequest] instead.
  ///{@endtemplate}
  ///
  ///{@macro cygnus_core.CygnusPlatformWebViewCreationParams.androidShouldInterceptRequest.supported_platforms}
  @SupportedPlatforms(platforms: [AndroidPlatform()])
  @Deprecated("Use shouldInterceptRequest instead")
  final FutureOr<CygnusWebResourceResponse?> Function(
    T controller,
    CygnusWebResourceRequest request,
  )?
  androidShouldInterceptRequest;

  ///{@template cygnus_core.CygnusPlatformWebViewCreationParams.shouldInterceptRequest}
  ///Notify the host application of a resource request and allow the application to return the data.
  ///If the return value is `null`, the WebView will continue to load the resource as usual.
  ///Otherwise, the return response and data will be used.
  ///
  ///This event is invoked for a variety of URL schemes (e.g., `http(s):`, `data:`, `file:`, etc.),
  ///not only those schemes which send requests over the network.
  ///This is not called for `javascript:` URLs, `blob:` URLs, or for assets accessed via `file:///android_asset/` or `file:///android_res/` URLs.
  ///
  ///In the case of redirects, this is only called for the initial resource URL, not any subsequent redirect URLs.
  ///
  ///[request] Object containing the details of the request.
  ///
  ///**NOTE**: In order to be able to listen this event, check the [CygnusWebViewSettings.useShouldInterceptRequest] setting documentation.
  ///{@endtemplate}
  ///
  ///{@macro cygnus_core.CygnusPlatformWebViewCreationParams.shouldInterceptRequest.supported_platforms}
  @SupportedPlatforms(
    platforms: [
      AndroidPlatform(
        apiName: 'WebViewClient.shouldInterceptRequest',
        apiUrl:
            'https://developer.android.com/reference/android/webkit/WebViewClient#shouldInterceptRequest(android.webkit.WebView,%20android.webkit.CygnusWebResourceRequest)',
      ),
      WindowsPlatform(
        apiName: 'ICoreWebView2.add_WebResourceRequested',
        apiUrl:
            'https://learn.microsoft.com/en-us/microsoft-edge/webview2/reference/win32/icorewebview2?view=webview2-1.0.2478.35#add_webresourcerequested',
      ),
      LinuxPlatform(
        apiName: 'webkit_web_context_register_uri_scheme',
        apiUrl:
            'https://wpewebkit.org/reference/stable/wpe-webkit-2.0/method.WebContext.register_uri_scheme.html',
        note:
            'Request interception is implemented via custom URI scheme handlers.',
      ),
    ],
  )
  final FutureOr<CygnusWebResourceResponse?> Function(
    T controller,
    CygnusWebResourceRequest request,
  )?
  shouldInterceptRequest;

  ///{@template cygnus_core.CygnusPlatformWebViewCreationParams.androidOnRenderProcessUnresponsive}
  ///Use [onRenderProcessUnresponsive] instead.
  ///{@endtemplate}
  ///
  ///{@macro cygnus_core.CygnusPlatformWebViewCreationParams.androidOnRenderProcessUnresponsive.supported_platforms}
  @SupportedPlatforms(platforms: [AndroidPlatform()])
  @Deprecated("Use onRenderProcessUnresponsive instead")
  final FutureOr<CygnusWebViewRenderProcessAction?> Function(T controller, Uri? url)?
  androidOnRenderProcessUnresponsive;

  ///{@template cygnus_core.CygnusPlatformWebViewCreationParams.onRenderProcessUnresponsive}
  ///Event called when the renderer currently associated with the WebView becomes unresponsive as a result of a long running blocking task such as the execution of JavaScript.
  ///
  ///If a WebView fails to process an input event, or successfully navigate to a new URL within a reasonable time frame, the renderer is considered to be unresponsive, and this callback will be called.
  ///
  ///This callback will continue to be called at regular intervals as long as the renderer remains unresponsive.
  ///If the renderer becomes responsive again, [onRenderProcessResponsive] will be called once,
  ///and this method will not subsequently be called unless another period of unresponsiveness is detected.
  ///
  ///The minimum interval between successive calls to [onRenderProcessUnresponsive] is 5 seconds.
  ///
  ///No action is taken by WebView as a result of this method call.
  ///Applications may choose to terminate the associated renderer via the object that is passed to this callback,
  ///if in multiprocess mode, however this must be accompanied by correctly handling [onRenderProcessGone] for this WebView,
  ///and all other WebViews associated with the same renderer. Failure to do so will result in application termination.
  ///{@endtemplate}
  ///
  ///{@macro cygnus_core.CygnusPlatformWebViewCreationParams.onRenderProcessUnresponsive.supported_platforms}
  @SupportedPlatforms(
    platforms: [
      AndroidPlatform(
        apiName: 'WebViewRenderProcessClient.onRenderProcessUnresponsive',
        apiUrl:
            'https://developer.android.com/reference/android/webkit/WebViewRenderProcessClient#onRenderProcessUnresponsive(android.webkit.WebView,%20android.webkit.WebViewRenderProcess)',
        available: '29',
      ),
      WindowsPlatform(
        apiName: 'ICoreWebView2.add_ProcessFailed',
        apiUrl:
            'https://learn.microsoft.com/en-us/microsoft-edge/webview2/reference/win32/icorewebview2?view=webview2-1.0.2849.39#add_processfailed',
      ),
    ],
  )
  final FutureOr<CygnusWebViewRenderProcessAction?> Function(
    T controller,
    CygnusWebUri? url,
  )?
  onRenderProcessUnresponsive;

  ///{@template cygnus_core.CygnusPlatformWebViewCreationParams.androidOnRenderProcessResponsive}
  ///Use [onRenderProcessResponsive] instead.
  ///{@endtemplate}
  ///
  ///{@macro cygnus_core.CygnusPlatformWebViewCreationParams.androidOnRenderProcessResponsive.supported_platforms}
  @SupportedPlatforms(platforms: [AndroidPlatform()])
  @Deprecated("Use onRenderProcessResponsive instead")
  final FutureOr<CygnusWebViewRenderProcessAction?> Function(T controller, Uri? url)?
  androidOnRenderProcessResponsive;

  ///{@template cygnus_core.CygnusPlatformWebViewCreationParams.onRenderProcessResponsive}
  ///Event called once when an unresponsive renderer currently associated with the WebView becomes responsive.
  ///
  ///After a WebView renderer becomes unresponsive, which is notified to the application by [onRenderProcessUnresponsive],
  ///it is possible for the blocking renderer task to complete, returning the renderer to a responsive state.
  ///In that case, this method is called once to indicate responsiveness.
  ///
  ///No action is taken by WebView as a result of this method call.
  ///{@endtemplate}
  ///
  ///{@macro cygnus_core.CygnusPlatformWebViewCreationParams.onRenderProcessResponsive.supported_platforms}
  @SupportedPlatforms(
    platforms: [
      AndroidPlatform(
        apiName: 'WebViewRenderProcessClient.onRenderProcessResponsive',
        apiUrl:
            'https://developer.android.com/reference/android/webkit/WebViewRenderProcessClient#onRenderProcessResponsive(android.webkit.WebView,%20android.webkit.WebViewRenderProcess)',
        available: '29',
      ),
    ],
  )
  final FutureOr<CygnusWebViewRenderProcessAction?> Function(
    T controller,
    CygnusWebUri? url,
  )?
  onRenderProcessResponsive;

  ///{@template cygnus_core.CygnusPlatformWebViewCreationParams.androidOnRenderProcessGone}
  ///Use [onRenderProcessGone] instead.
  ///{@endtemplate}
  ///
  ///{@macro cygnus_core.CygnusPlatformWebViewCreationParams.androidOnRenderProcessGone.supported_platforms}
  @SupportedPlatforms(platforms: [AndroidPlatform()])
  @Deprecated("Use onRenderProcessGone instead")
  final void Function(T controller, CygnusRenderProcessGoneDetail detail)?
  androidOnRenderProcessGone;

  ///{@template cygnus_core.CygnusPlatformWebViewCreationParams.onRenderProcessGone}
  ///Event fired when the given WebView's render process has exited.
  ///The application's implementation of this callback should only attempt to clean up the WebView.
  ///The WebView should be removed from the view hierarchy, all references to it should be cleaned up.
  ///
  ///To cause an render process crash for test purpose, the application can call load url `"chrome://crash"` on the WebView.
  ///Note that multiple WebView instances may be affected if they share a render process, not just the specific WebView which loaded `"chrome://crash"`.
  ///
  ///[detail] the reason why it exited.
  ///{@endtemplate}
  ///
  ///{@macro cygnus_core.CygnusPlatformWebViewCreationParams.onRenderProcessGone.supported_platforms}
  @SupportedPlatforms(
    platforms: [
      AndroidPlatform(
        apiName: 'WebViewClient.onRenderProcessGone',
        apiUrl:
            'https://developer.android.com/reference/android/webkit/WebViewClient#onRenderProcessGone(android.webkit.WebView,%20android.webkit.CygnusRenderProcessGoneDetail)',
        available: '26',
      ),
      WindowsPlatform(
        apiName: 'ICoreWebView2.add_ProcessFailed',
        apiUrl:
            'https://learn.microsoft.com/en-us/microsoft-edge/webview2/reference/win32/icorewebview2?view=webview2-1.0.2849.39#add_processfailed',
      ),
      LinuxPlatform(
        apiName: 'WebView.web-process-terminated',
        apiUrl:
            'https://wpewebkit.org/reference/stable/wpe-webkit-2.0/WebKitWebView.html#WebKitWebView-web-process-terminated',
      ),
    ],
  )
  final void Function(T controller, CygnusRenderProcessGoneDetail detail)?
  onRenderProcessGone;

  ///{@template cygnus_core.CygnusPlatformWebViewCreationParams.androidOnFormResubmission}
  ///Use [onFormResubmission] instead.
  ///{@endtemplate}
  ///
  ///{@macro cygnus_core.CygnusPlatformWebViewCreationParams.androidOnFormResubmission.supported_platforms}
  @SupportedPlatforms(platforms: [AndroidPlatform()])
  @Deprecated('Use onFormResubmission instead')
  final FutureOr<CygnusFormResubmissionAction?> Function(T controller, Uri? url)?
  androidOnFormResubmission;

  ///{@template cygnus_core.CygnusPlatformWebViewCreationParams.onFormResubmission}
  ///As the host application if the browser should resend data as the requested page was a result of a POST. The default is to not resend the data.
  ///{@endtemplate}
  ///
  ///{@macro cygnus_core.CygnusPlatformWebViewCreationParams.onFormResubmission.supported_platforms}
  @SupportedPlatforms(
    platforms: [
      AndroidPlatform(
        apiName: 'WebViewClient.onFormResubmission',
        apiUrl:
            'https://developer.android.com/reference/android/webkit/WebViewClient#onFormResubmission(android.webkit.WebView,%20android.os.Message,%20android.os.Message)',
      ),
    ],
  )
  final FutureOr<CygnusFormResubmissionAction?> Function(T controller, CygnusWebUri? url)?
  onFormResubmission;

  ///{@template cygnus_core.CygnusPlatformWebViewCreationParams.androidOnScaleChanged}
  ///Use [onZoomScaleChanged] instead.
  ///{@endtemplate}
  ///
  ///{@macro cygnus_core.CygnusPlatformWebViewCreationParams.androidOnScaleChanged.supported_platforms}
  @SupportedPlatforms(platforms: [AndroidPlatform()])
  @Deprecated('Use onZoomScaleChanged instead')
  final void Function(T controller, double oldScale, double newScale)?
  androidOnScaleChanged;

  ///{@template cygnus_core.CygnusPlatformWebViewCreationParams.androidOnReceivedIcon}
  ///Use [onReceivedIcon] instead.
  ///{@endtemplate}
  ///
  ///{@macro cygnus_core.CygnusPlatformWebViewCreationParams.androidOnReceivedIcon.supported_platforms}
  @SupportedPlatforms(platforms: [AndroidPlatform()])
  @Deprecated('Use onReceivedIcon instead')
  final void Function(T controller, Uint8List icon)? androidOnReceivedIcon;

  ///{@template cygnus_core.CygnusPlatformWebViewCreationParams.onReceivedIcon}
  ///Event fired when there is new favicon for the current page.
  ///
  ///[icon] represents the favicon for the current page.
  ///
  ///Deprecated: use [onFaviconChanged] instead.
  ///{@endtemplate}
  ///
  ///{@macro cygnus_core.CygnusPlatformWebViewCreationParams.onReceivedIcon.supported_platforms}
  @SupportedPlatforms(
    platforms: [
      AndroidPlatform(
        apiName: 'WebChromeClient.onReceivedIcon',
        apiUrl:
            'https://developer.android.com/reference/android/webkit/WebChromeClient#onReceivedIcon(android.webkit.WebView,%20android.graphics.Bitmap)',
      ),
    ],
  )
  @Deprecated('Use onFaviconChanged instead')
  final void Function(T controller, Uint8List icon)? onReceivedIcon;

  ///{@template cygnus_core.CygnusPlatformWebViewCreationParams.onFaviconChanged}
  ///Event fired when the favicon for the current page changes.
  ///
  ///[faviconChangedRequest] contains the favicon URL and/or icon bytes, if available.
  ///{@endtemplate}
  ///
  ///{@macro cygnus_core.CygnusPlatformWebViewCreationParams.onFaviconChanged.supported_platforms}
  @SupportedPlatforms(
    platforms: [
      AndroidPlatform(
        apiName: 'WebChromeClient.onReceivedIcon',
        apiUrl:
            'https://developer.android.com/reference/android/webkit/WebChromeClient#onReceivedIcon(android.webkit.WebView,%20android.graphics.Bitmap)',
      ),
      WindowsPlatform(
        apiName: 'ICoreWebView2_15.add_FaviconChanged',
        apiUrl:
            'https://learn.microsoft.com/en-us/microsoft-edge/webview2/reference/win32/icorewebview2_15?view=webview2-1.0.2849.39#add_faviconchanged',
      ),
    ],
  )
  final void Function(
    T controller,
    CygnusFaviconChangedRequest faviconChangedRequest,
  )?
  onFaviconChanged;

  ///{@template cygnus_core.CygnusPlatformWebViewCreationParams.androidOnReceivedTouchIconUrl}
  ///Use [onReceivedTouchIconUrl] instead.
  ///{@endtemplate}
  ///
  ///{@macro cygnus_core.CygnusPlatformWebViewCreationParams.androidOnReceivedTouchIconUrl.supported_platforms}
  @SupportedPlatforms(platforms: [AndroidPlatform()])
  @Deprecated('Use onReceivedTouchIconUrl instead')
  final void Function(T controller, Uri url, bool precomposed)?
  androidOnReceivedTouchIconUrl;

  ///{@template cygnus_core.CygnusPlatformWebViewCreationParams.onReceivedTouchIconUrl}
  ///Event fired when there is an url for an apple-touch-icon.
  ///
  ///[url] represents the icon url.
  ///
  ///[precomposed] is `true` if the url is for a precomposed touch icon.
  ///{@endtemplate}
  ///
  ///{@macro cygnus_core.CygnusPlatformWebViewCreationParams.onReceivedTouchIconUrl.supported_platforms}
  @SupportedPlatforms(
    platforms: [
      AndroidPlatform(
        apiName: 'WebChromeClient.onReceivedTouchIconUrl',
        apiUrl:
            'https://developer.android.com/reference/android/webkit/WebChromeClient#onReceivedTouchIconUrl(android.webkit.WebView,%20java.lang.String,%20boolean)',
      ),
    ],
  )
  final void Function(T controller, CygnusWebUri url, bool precomposed)?
  onReceivedTouchIconUrl;

  ///{@template cygnus_core.CygnusPlatformWebViewCreationParams.androidOnJsBeforeUnload}
  ///Use [onJsBeforeUnload] instead.
  ///{@endtemplate}
  ///
  ///{@macro cygnus_core.CygnusPlatformWebViewCreationParams.androidOnJsBeforeUnload.supported_platforms}
  @SupportedPlatforms(platforms: [AndroidPlatform()])
  @Deprecated('Use onJsBeforeUnload instead')
  final FutureOr<CygnusJsBeforeUnloadResponse?> Function(
    T controller,
    CygnusJsBeforeUnloadRequest jsBeforeUnloadRequest,
  )?
  androidOnJsBeforeUnload;

  ///{@template cygnus_core.CygnusPlatformWebViewCreationParams.onJsBeforeUnload}
  ///Event fired when the client should display a dialog to confirm navigation away from the current page.
  ///This is the result of the `onbeforeunload` javascript event.
  ///If [CygnusJsBeforeUnloadResponse.handledByClient] is `true`, WebView will assume that the client will handle the confirm dialog.
  ///If [CygnusJsBeforeUnloadResponse.handledByClient] is `false`, a default value of `true` will be returned to javascript to accept navigation away from the current page.
  ///The default behavior is to return `false`.
  ///Setting the [CygnusJsBeforeUnloadResponse.action] to [CygnusJsBeforeUnloadResponseAction.CONFIRM] will navigate away from the current page,
  ///[CygnusJsBeforeUnloadResponseAction.CANCEL] will cancel the navigation.
  ///
  ///[jsBeforeUnloadRequest] contains the message to be displayed in the alert dialog and the of the page requesting the dialog.
  ///{@endtemplate}
  ///
  ///{@macro cygnus_core.CygnusPlatformWebViewCreationParams.onJsBeforeUnload.supported_platforms}
  @SupportedPlatforms(
    platforms: [
      AndroidPlatform(
        apiName: 'WebChromeClient.onJsBeforeUnload',
        apiUrl:
            'https://developer.android.com/reference/android/webkit/WebChromeClient#onJsBeforeUnload(android.webkit.WebView,%20java.lang.String,%20java.lang.String,%20android.webkit.JsResult)',
      ),
      LinuxPlatform(
        apiName: 'WebKitWebView::script-dialog',
        apiUrl:
            'https://wpewebkit.org/reference/stable/wpe-webkit-2.0/signal.WebView.script-dialog.html',
        note: 'Handles WEBKIT_SCRIPT_DIALOG_BEFORE_UNLOAD_CONFIRM dialog type.',
      ),
    ],
  )
  final FutureOr<CygnusJsBeforeUnloadResponse?> Function(
    T controller,
    CygnusJsBeforeUnloadRequest jsBeforeUnloadRequest,
  )?
  onJsBeforeUnload;

  ///{@template cygnus_core.CygnusPlatformWebViewCreationParams.androidOnReceivedLoginRequest}
  ///Use [onReceivedLoginRequest] instead.
  ///{@endtemplate}
  ///
  ///{@macro cygnus_core.CygnusPlatformWebViewCreationParams.androidOnReceivedLoginRequest.supported_platforms}
  @SupportedPlatforms(platforms: [AndroidPlatform()])
  @Deprecated('Use onReceivedLoginRequest instead')
  final void Function(T controller, CygnusLoginRequest loginRequest)?
  androidOnReceivedLoginRequest;

  ///{@template cygnus_core.CygnusPlatformWebViewCreationParams.onReceivedLoginRequest}
  ///Event fired when a request to automatically log in the user has been processed.
  ///
  ///[loginRequest] contains the realm, account and args of the login request.
  ///{@endtemplate}
  ///
  ///{@macro cygnus_core.CygnusPlatformWebViewCreationParams.onReceivedLoginRequest.supported_platforms}
  @SupportedPlatforms(
    platforms: [
      AndroidPlatform(
        apiName: 'WebViewClient.onReceivedLoginRequest',
        apiUrl:
            'https://developer.android.com/reference/android/webkit/WebViewClient#onReceivedLoginRequest(android.webkit.WebView,%20java.lang.String,%20java.lang.String,%20java.lang.String)',
      ),
    ],
  )
  final void Function(T controller, CygnusLoginRequest loginRequest)?
  onReceivedLoginRequest;

  ///{@template cygnus_core.CygnusPlatformWebViewCreationParams.onPermissionRequestCanceled}
  ///Notify the host application that the given permission request has been canceled. Any related UI should therefore be hidden.
  ///
  ///[permissionRequest] represents the permission request that needs be canceled
  ///with an array of resources the web content wants to access
  ///and the origin of the web page which is trying to access the restricted resources.
  ///{@endtemplate}
  ///
  ///{@macro cygnus_core.CygnusPlatformWebViewCreationParams.onPermissionRequestCanceled.supported_platforms}
  @SupportedPlatforms(
    platforms: [
      AndroidPlatform(
        apiName: 'WebChromeClient.onPermissionRequestCanceled',
        apiUrl:
            'https://developer.android.com/reference/android/webkit/WebChromeClient#onPermissionRequestCanceled(android.webkit.CygnusPermissionRequest)',
        available: '21',
      ),
    ],
  )
  final void Function(T controller, CygnusPermissionRequest permissionRequest)?
  onPermissionRequestCanceled;

  ///{@template cygnus_core.CygnusPlatformWebViewCreationParams.onRequestFocus}
  ///Request display and focus for this WebView.
  ///This may happen due to another WebView opening a link in this WebView and requesting that this WebView be displayed.
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android native WebView ([Official API - WebChromeClient.onRequestFocus](https://developer.android.com/reference/android/webkit/WebChromeClient#onRequestFocus(android.webkit.WebView)))
  ///{@endtemplate}
  ///
  ///{@macro cygnus_core.CygnusPlatformWebViewCreationParams.onRequestFocus.supported_platforms}
  @SupportedPlatforms(
    platforms: [
      AndroidPlatform(
        apiName: 'WebChromeClient.onRequestFocus',
        apiUrl:
            'https://developer.android.com/reference/android/webkit/WebChromeClient#onRequestFocus(android.webkit.WebView)',
      ),
    ],
  )
  final void Function(T controller)? onRequestFocus;

  ///{@template cygnus_core.CygnusPlatformWebViewCreationParams.iosOnWebContentProcessDidTerminate}
  ///Use [onWebContentProcessDidTerminate] instead.
  ///{@endtemplate}
  ///
  ///{@macro cygnus_core.CygnusPlatformWebViewCreationParams.iosOnWebContentProcessDidTerminate.supported_platforms}
  @SupportedPlatforms(platforms: [IOSPlatform()])
  @Deprecated('Use onWebContentProcessDidTerminate instead')
  final void Function(T controller)? iosOnWebContentProcessDidTerminate;

  ///{@template cygnus_core.CygnusPlatformWebViewCreationParams.onWebContentProcessDidTerminate}
  ///Invoked when the web view's web content process is terminated.
  ///Reloading the page will start a new render process if needed.
  ///{@endtemplate}
  ///
  ///{@macro cygnus_core.CygnusPlatformWebViewCreationParams.onWebContentProcessDidTerminate.supported_platforms}
  @SupportedPlatforms(
    platforms: [
      IOSPlatform(
        apiName: 'WKNavigationDelegate.webViewWebContentProcessDidTerminate',
        apiUrl:
            'https://developer.apple.com/documentation/webkit/wknavigationdelegate/1455639-webviewwebcontentprocessdidtermi',
      ),
      MacOSPlatform(
        apiName: 'WKNavigationDelegate.webViewWebContentProcessDidTerminate',
        apiUrl:
            'https://developer.apple.com/documentation/webkit/wknavigationdelegate/1455639-webviewwebcontentprocessdidtermi',
      ),
      WindowsPlatform(
        apiName: 'ICoreWebView2.add_ProcessFailed',
        apiUrl:
            'https://learn.microsoft.com/en-us/microsoft-edge/webview2/reference/win32/icorewebview2?view=webview2-1.0.2849.39#add_processfailed',
      ),
    ],
  )
  final void Function(T controller)? onWebContentProcessDidTerminate;

  ///{@template cygnus_core.CygnusPlatformWebViewCreationParams.iosOnDidReceiveServerRedirectForProvisionalNavigation}
  ///Use [onDidReceiveServerRedirectForProvisionalNavigation] instead.
  ///{@endtemplate}
  ///
  ///{@macro cygnus_core.CygnusPlatformWebViewCreationParams.iosOnDidReceiveServerRedirectForProvisionalNavigation.supported_platforms}
  @SupportedPlatforms(platforms: [IOSPlatform()])
  @Deprecated('Use onDidReceiveServerRedirectForProvisionalNavigation instead')
  final void Function(T controller)?
  iosOnDidReceiveServerRedirectForProvisionalNavigation;

  ///{@template cygnus_core.CygnusPlatformWebViewCreationParams.onDidReceiveServerRedirectForProvisionalNavigation}
  ///Called when a web view receives a server redirect.
  ///{@endtemplate}
  ///
  ///{@macro cygnus_core.CygnusPlatformWebViewCreationParams.onDidReceiveServerRedirectForProvisionalNavigation.supported_platforms}
  @SupportedPlatforms(
    platforms: [
      IOSPlatform(
        apiName: 'WKNavigationDelegate.webView',
        apiUrl:
            'https://developer.apple.com/documentation/webkit/wknavigationdelegate/1455627-webview',
      ),
      MacOSPlatform(
        apiName: 'WKNavigationDelegate.webView',
        apiUrl:
            'https://developer.apple.com/documentation/webkit/wknavigationdelegate/1455627-webview',
      ),
    ],
  )
  final void Function(T controller)?
  onDidReceiveServerRedirectForProvisionalNavigation;

  ///{@template cygnus_core.CygnusPlatformWebViewCreationParams.iosOnNavigationResponse}
  ///Use [onNavigationResponse] instead.
  ///{@endtemplate}
  ///
  ///{@macro cygnus_core.CygnusPlatformWebViewCreationParams.iosOnNavigationResponse.supported_platforms}
  @SupportedPlatforms(platforms: [IOSPlatform()])
  @Deprecated('Use onNavigationResponse instead')
  final FutureOr<CygnusIOSNavigationResponseAction?> Function(
    T controller,
    CygnusIOSWKNavigationResponse navigationResponse,
  )?
  iosOnNavigationResponse;

  ///{@template cygnus_core.CygnusPlatformWebViewCreationParams.onNavigationResponse}
  ///Called when a web view asks for permission to navigate to new content after the response to the navigation request is known.
  ///
  ///[navigationResponse] represents the navigation response.
  ///
  ///**NOTE**: In order to be able to listen this event, check the [CygnusWebViewSettings.useOnNavigationResponse] setting documentation.
  ///{@endtemplate}
  ///
  ///{@macro cygnus_core.CygnusPlatformWebViewCreationParams.onNavigationResponse.supported_platforms}
  @SupportedPlatforms(
    platforms: [
      IOSPlatform(
        apiName: 'WKNavigationDelegate.webView',
        apiUrl:
            'https://developer.apple.com/documentation/webkit/wknavigationdelegate/1455643-webview',
      ),
      MacOSPlatform(
        apiName: 'WKNavigationDelegate.webView',
        apiUrl:
            'https://developer.apple.com/documentation/webkit/wknavigationdelegate/1455643-webview',
      ),
      LinuxPlatform(
        apiName: 'WebKitWebView::decide-policy',
        apiUrl:
            'https://webkitgtk.org/reference/webkit2gtk/stable/signal.WebView.decide-policy.html',
      ),
    ],
  )
  final FutureOr<CygnusNavigationResponseAction?> Function(
    T controller,
    CygnusNavigationResponse navigationResponse,
  )?
  onNavigationResponse;

  ///{@template cygnus_core.CygnusPlatformWebViewCreationParams.iosShouldAllowDeprecatedTLS}
  ///Use [shouldAllowDeprecatedTLS] instead.
  ///{@endtemplate}
  ///
  ///{@macro cygnus_core.CygnusPlatformWebViewCreationParams.iosShouldAllowDeprecatedTLS.supported_platforms}
  @SupportedPlatforms(platforms: [IOSPlatform()])
  @Deprecated('Use shouldAllowDeprecatedTLS instead')
  final FutureOr<CygnusIOSShouldAllowDeprecatedTLSAction?> Function(
    T controller,
    CygnusURLAuthenticationChallenge challenge,
  )?
  iosShouldAllowDeprecatedTLS;

  ///{@template cygnus_core.CygnusPlatformWebViewCreationParams.shouldAllowDeprecatedTLS}
  ///Called when a web view asks whether to continue with a connection that uses a deprecated version of TLS (v1.0 and v1.1).
  ///
  ///[challenge] represents the authentication challenge.
  ///{@endtemplate}
  ///
  ///{@macro cygnus_core.CygnusPlatformWebViewCreationParams.shouldAllowDeprecatedTLS.supported_platforms}
  @SupportedPlatforms(
    platforms: [
      IOSPlatform(
        apiName: 'WKNavigationDelegate.webView',
        apiUrl:
            'https://developer.apple.com/documentation/webkit/wknavigationdelegate/3601237-webview',
        available: '14.0',
      ),
      MacOSPlatform(
        apiName: 'WKNavigationDelegate.webView',
        apiUrl:
            'https://developer.apple.com/documentation/webkit/wknavigationdelegate/3601237-webview',
        available: '11.0',
      ),
    ],
  )
  final FutureOr<CygnusShouldAllowDeprecatedTLSAction?> Function(
    T controller,
    CygnusURLAuthenticationChallenge challenge,
  )?
  shouldAllowDeprecatedTLS;

  ///{@template cygnus_core.CygnusPlatformWebViewCreationParams.onCameraCaptureStateChanged}
  ///Event fired when a change in the camera capture state occurred.
  ///{@endtemplate}
  ///
  ///{@macro cygnus_core.CygnusPlatformWebViewCreationParams.onCameraCaptureStateChanged.supported_platforms}
  @SupportedPlatforms(
    platforms: [
      IOSPlatform(available: '15.0'),
      MacOSPlatform(available: '12.0'),
      LinuxPlatform(
        apiName: 'WebKitWebView::notify::camera-capture-state',
        apiUrl:
            'https://webkitgtk.org/reference/webkit2gtk/stable/property.WebView.camera-capture-state.html',
        note: 'Requires WPE WebKit 2.34 or later.',
      ),
    ],
  )
  final FutureOr<void> Function(
    T controller,
    CygnusMediaCaptureState? oldState,
    CygnusMediaCaptureState? newState,
  )?
  onCameraCaptureStateChanged;

  ///{@template cygnus_core.CygnusPlatformWebViewCreationParams.onMicrophoneCaptureStateChanged}
  ///Event fired when a change in the microphone capture state occurred.
  ///{@endtemplate}
  ///
  ///{@macro cygnus_core.CygnusPlatformWebViewCreationParams.onMicrophoneCaptureStateChanged.supported_platforms}
  @SupportedPlatforms(
    platforms: [
      IOSPlatform(available: '15.0'),
      MacOSPlatform(available: '12.0'),
      LinuxPlatform(
        apiName: 'WebKitWebView::notify::microphone-capture-state',
        apiUrl:
            'https://webkitgtk.org/reference/webkit2gtk/stable/property.WebView.microphone-capture-state.html',
        note: 'Requires WPE WebKit 2.34 or later.',
      ),
    ],
  )
  final FutureOr<void> Function(
    T controller,
    CygnusMediaCaptureState? oldState,
    CygnusMediaCaptureState? newState,
  )?
  onMicrophoneCaptureStateChanged;

  ///{@template cygnus_core.CygnusPlatformWebViewCreationParams.onContentSizeChanged}
  ///Event fired when the content size of the `WebView` changes.
  ///
  ///[oldContentSize] represents the old content size value.
  ///
  ///[newContentSize] represents the new content size value.
  ///{@endtemplate}
  ///
  ///{@macro cygnus_core.CygnusPlatformWebViewCreationParams.onContentSizeChanged.supported_platforms}
  @SupportedPlatforms(
    platforms: [
      IOSPlatform(),
      LinuxPlatform(note: 'This event is implemented using JavaScript.'),
    ],
  )
  final void Function(T controller, Size oldContentSize, Size newContentSize)?
  onContentSizeChanged;

  ///{@template cygnus_core.CygnusPlatformWebViewCreationParams.onProcessFailed}
  ///Invoked when any of the processes in the WebView Process Group encounters one of the following conditions:
  ///- Unexpected exit: The process indicated by the event args has exited unexpectedly (usually due to a crash).
  ///The failure might or might not be recoverable and some failures are auto-recoverable.
  ///- Unresponsiveness: The process indicated by the event args has become unresponsive to user input.
  ///This is only reported for renderer processes, and will run every few seconds until the process becomes responsive again.
  ///{@endtemplate}
  ///
  ///{@macro cygnus_core.CygnusPlatformWebViewCreationParams.onProcessFailed.supported_platforms}
  @SupportedPlatforms(
    platforms: [
      WindowsPlatform(
        apiName: 'ICoreWebView2.add_ProcessFailed',
        apiUrl:
            'https://learn.microsoft.com/en-us/microsoft-edge/webview2/reference/win32/icorewebview2?view=webview2-1.0.2849.39#add_processfailed',
      ),
    ],
  )
  final void Function(T controller, CygnusProcessFailedDetail detail)?
  onProcessFailed;

  ///{@template cygnus_core.CygnusPlatformWebViewCreationParams.onNotificationReceived}
  ///Event fired when a web notification is received.
  ///
  ///The [request] contains the [CygnusNotificationReceivedRequest.senderOrigin] (the origin of the web content
  ///that sends the notification) and the [CygnusNotificationReceivedRequest.notificationController] which provides
  ///methods to report the notification status (shown, clicked, closed) back to the web content,
  ///as well as listen for the close event when the notification is closed by web code.
  ///{@endtemplate}
  ///
  ///{@macro cygnus_core.CygnusPlatformWebViewCreationParams.onNotificationReceived.supported_platforms}
  @SupportedPlatforms(
    platforms: [
      WindowsPlatform(
        apiName: 'ICoreWebView2_24.add_NotificationReceived',
        apiUrl:
            'https://learn.microsoft.com/en-us/microsoft-edge/webview2/reference/win32/icorewebview2_24?view=webview2-1.0.2849.39#add_notificationreceived',
      ),
    ],
  )
  final FutureOr<CygnusNotificationReceivedResponse?> Function(
    T controller,
    CygnusNotificationReceivedRequest request,
  )?
  onNotificationReceived;

  ///{@template cygnus_core.CygnusPlatformWebViewCreationParams.onSaveAsUIShowing}
  ///Event fired when Save As UI is showing.
  ///{@endtemplate}
  ///
  ///{@macro cygnus_core.CygnusPlatformWebViewCreationParams.onSaveAsUIShowing.supported_platforms}
  @SupportedPlatforms(
    platforms: [
      WindowsPlatform(
        apiName: 'ICoreWebView2_25.add_SaveAsUIShowing',
        apiUrl:
            'https://learn.microsoft.com/en-us/microsoft-edge/webview2/reference/win32/icorewebview2_25?view=webview2-1.0.2849.39#add_saveasuishowing',
      ),
    ],
  )
  final FutureOr<CygnusSaveAsUIShowingResponse?> Function(
    T controller,
    CygnusSaveAsUIShowingRequest request,
  )?
  onSaveAsUIShowing;

  ///{@template cygnus_core.CygnusPlatformWebViewCreationParams.onSaveFileSecurityCheckStarting}
  ///Event fired when a save file security check is starting.
  ///{@endtemplate}
  ///
  ///{@macro cygnus_core.CygnusPlatformWebViewCreationParams.onSaveFileSecurityCheckStarting.supported_platforms}
  @SupportedPlatforms(
    platforms: [
      WindowsPlatform(
        apiName: 'ICoreWebView2_26.add_SaveFileSecurityCheckStarting',
        apiUrl:
            'https://learn.microsoft.com/en-us/microsoft-edge/webview2/reference/win32/icorewebview2_26?view=webview2-1.0.2849.39#add_savefilesecuritycheckstarting',
      ),
    ],
  )
  final FutureOr<CygnusSaveFileSecurityCheckStartingResponse?> Function(
    T controller,
    CygnusSaveFileSecurityCheckStartingRequest request,
  )?
  onSaveFileSecurityCheckStarting;

  ///{@template cygnus_core.CygnusPlatformWebViewCreationParams.onScreenCaptureStarting}
  ///Event fired when screen capture is starting.
  ///{@endtemplate}
  ///
  ///{@macro cygnus_core.CygnusPlatformWebViewCreationParams.onScreenCaptureStarting.supported_platforms}
  @SupportedPlatforms(
    platforms: [
      WindowsPlatform(
        apiName: 'ICoreWebView2_27.add_ScreenCaptureStarting',
        apiUrl:
            'https://learn.microsoft.com/en-us/microsoft-edge/webview2/reference/win32/icorewebview2_27?view=webview2-1.0.2849.39#add_screencapturestarting',
      ),
    ],
  )
  final FutureOr<CygnusScreenCaptureStartingResponse?> Function(
    T controller,
    CygnusScreenCaptureStartingRequest request,
  )?
  onScreenCaptureStarting;

  ///{@template cygnus_core.CygnusPlatformWebViewCreationParams.onAcceleratorKeyPressed}
  ///This event runs when an accelerator key or key combo is pressed or
  ///released while the WebView is focused.
  ///To listen this event, [CygnusWebViewSettings.handleAcceleratorKeyPressed] must be `true`.
  ///
  ///A key is considered an accelerator if either of the following conditions are `true`:
  ///- `Ctrl` or `Alt` is currently being held.
  ///- The pressed key does not map to a character.
  ///
  ///A few specific keys are never considered accelerators, such as `Shift`.
  ///The `Escape` key is always considered an accelerator.
  ///
  ///Auto-repeated key events caused by holding the key down also triggers this event.
  ///Filter out the auto-repeated key events by verifying the [CygnusAcceleratorKeyPressedDetail.physicalKeyStatus] property.
  ///{@endtemplate}
  ///
  ///{@macro cygnus_core.CygnusPlatformWebViewCreationParams.onAcceleratorKeyPressed.supported_platforms}
  @SupportedPlatforms(
    platforms: [
      WindowsPlatform(
        apiName: 'ICoreWebView2Controller.add_AcceleratorKeyPressed',
        apiUrl:
            'https://learn.microsoft.com/en-us/microsoft-edge/webview2/reference/win32/icorewebview2controller?view=webview2-1.0.2849.39#add_acceleratorkeypressed',
      ),
    ],
  )
  final void Function(T controller, CygnusAcceleratorKeyPressedDetail detail)?
  onAcceleratorKeyPressed;

  ///{@template cygnus_core.CygnusPlatformWebViewCreationParams.onShowFileChooser}
  ///Tell the client to show a file chooser.
  ///This is called to handle HTML forms with 'file' input type,
  ///in response to the user pressing the "Select File" button.
  ///To cancel the request, return a [CygnusShowFileChooserResponse] with [CygnusShowFileChooserResponse.filePaths] to `null`.
  ///
  ///Note that the WebView does not enforce any restrictions on the chosen file(s).
  ///WebView can access all files that your app can access.
  ///In case the file(s) are chosen through an untrusted source such as a third-party app,
  ///it is your own app's responsibility to check what the returned Uris refer
  ///to.
  ///{@endtemplate}
  ///
  ///{@macro cygnus_core.CygnusPlatformWebViewCreationParams.onShowFileChooser.supported_platforms}
  @SupportedPlatforms(
    platforms: [
      AndroidPlatform(
        apiName: 'WebChromeClient.onShowFileChooser',
        apiUrl:
            'https://developer.android.com/reference/android/webkit/WebChromeClient#onShowFileChooser(android.webkit.WebView,%20android.webkit.ValueCallback%3Candroid.net.Uri[]%3E,%20android.webkit.WebChromeClient.FileChooserParams)',
      ),
      LinuxPlatform(
        apiName: 'WebKitWebView::run-file-chooser',
        apiUrl:
            'https://webkitgtk.org/reference/webkit2gtk/stable/signal.WebView.run-file-chooser.html',
      ),
    ],
  )
  final FutureOr<CygnusShowFileChooserResponse?> Function(
    T controller,
    CygnusShowFileChooserRequest request,
  )?
  onShowFileChooser;

  ///{@template cygnus_core.CygnusPlatformWebViewCreationParams.initialUrlRequest}
  ///Initial url request that will be loaded.
  ///{@endtemplate}
  ///
  ///{@macro cygnus_core.CygnusPlatformWebViewCreationParams.initialUrlRequest.supported_platforms}
  @SupportedPlatforms(
    platforms: [
      AndroidPlatform(
        note:
            'When loading an URL Request using "POST" method, headers are ignored.',
      ),
      IOSPlatform(),
      MacOSPlatform(),
      WebPlatform(requiresSameOrigin: false),
      WindowsPlatform(),
      LinuxPlatform(),
    ],
  )
  final CygnusURLRequest? initialUrlRequest;

  ///{@template cygnus_core.CygnusPlatformWebViewCreationParams.initialFile}
  ///Initial asset file that will be loaded. See [CygnusWebViewController.loadFile] for explanation.
  ///{@endtemplate}
  ///
  ///{@macro cygnus_core.CygnusPlatformWebViewCreationParams.initialFile.supported_platforms}
  @SupportedPlatforms(
    platforms: [
      AndroidPlatform(),
      IOSPlatform(),
      MacOSPlatform(),
      WebPlatform(requiresSameOrigin: false),
      WindowsPlatform(),
      LinuxPlatform(),
    ],
  )
  final String? initialFile;

  ///{@template cygnus_core.CygnusPlatformWebViewCreationParams.initialData}
  ///Initial [CygnusWebViewInitialData] that will be loaded.
  ///{@endtemplate}
  ///
  ///{@macro cygnus_core.CygnusPlatformWebViewCreationParams.initialData.supported_platforms}
  @SupportedPlatforms(
    platforms: [
      AndroidPlatform(),
      IOSPlatform(),
      MacOSPlatform(),
      WebPlatform(requiresSameOrigin: false),
      WindowsPlatform(),
      LinuxPlatform(),
    ],
  )
  final CygnusWebViewInitialData? initialData;

  ///{@template cygnus_core.CygnusPlatformWebViewCreationParams.initialOptions}
  ///Use [initialSettings] instead.
  ///{@endtemplate}
  ///
  ///{@macro cygnus_core.CygnusPlatformWebViewCreationParams.initialOptions.supported_platforms}
  @SupportedPlatforms(platforms: [AndroidPlatform(), IOSPlatform()])
  @Deprecated('Use initialSettings instead')
  final CygnusWebViewGroupOptions? initialOptions;

  ///{@template cygnus_core.CygnusPlatformWebViewCreationParams.initialSettings}
  ///Initial settings that will be used.
  ///{@endtemplate}
  ///
  ///{@macro cygnus_core.CygnusPlatformWebViewCreationParams.initialSettings.supported_platforms}
  @SupportedPlatforms(
    platforms: [
      AndroidPlatform(),
      IOSPlatform(),
      MacOSPlatform(),
      WebPlatform(requiresSameOrigin: false),
      WindowsPlatform(),
      LinuxPlatform(),
    ],
  )
  final CygnusWebViewSettings? initialSettings;

  ///{@template cygnus_core.CygnusPlatformWebViewCreationParams.contextMenu}
  ///Context menu which contains custom menu items to be shown when [CygnusContextMenu] is presented.
  ///{@endtemplate}
  ///
  ///{@macro cygnus_core.CygnusPlatformWebViewCreationParams.contextMenu.supported_platforms}
  @SupportedPlatforms(platforms: [AndroidPlatform(), IOSPlatform()])
  final CygnusContextMenu? contextMenu;

  ///{@template cygnus_core.CygnusPlatformWebViewCreationParams.initialUserScripts}
  ///Initial list of user scripts to be loaded at start or end of a page loading.
  ///To add or remove user scripts, you have to use the [CygnusWebViewController]'s methods such as [CygnusWebViewController.addUserScript],
  ///[CygnusWebViewController.removeUserScript], [CygnusWebViewController.removeAllUserScripts], etc.
  ///{@endtemplate}
  ///
  ///{@macro cygnus_core.CygnusPlatformWebViewCreationParams.initialUserScripts.supported_platforms}
  @SupportedPlatforms(
    platforms: [
      AndroidPlatform(),
      IOSPlatform(
        note:
            """This property will be ignored if the [CygnusPlatformWebViewCreationParams.windowId] has been set.
There isn't any way to add/remove user scripts specific to iOS window WebViews.
This is a limitation of the native WebKit APIs.""",
      ),
      MacOSPlatform(
        note:
            """This property will be ignored if the [CygnusPlatformWebViewCreationParams.windowId] has been set.
There isn't any way to add/remove user scripts specific to iOS window WebViews.
This is a limitation of the native WebKit APIs.""",
      ),
      WebPlatform(),
      WindowsPlatform(),
      LinuxPlatform(
        apiName: 'WebKitUserContentManager',
        apiUrl:
            'https://wpewebkit.org/reference/stable/wpe-webkit-2.0/class.UserContentManager.html',
      ),
    ],
  )
  final UnmodifiableListView<CygnusUserScript>? initialUserScripts;

  ///{@template cygnus_core.CygnusPlatformWebViewCreationParams.pullToRefreshController}
  ///Represents the pull-to-refresh feature controller.
  ///{@endtemplate}
  ///
  ///{@macro cygnus_core.CygnusPlatformWebViewCreationParams.pullToRefreshController.supported_platforms}
  @SupportedPlatforms(
    platforms: [
      AndroidPlatform(
        note:
            'To be able to use the "pull-to-refresh" feature, [CygnusWebViewSettings.useHybridComposition] must be `true`.',
      ),
      IOSPlatform(),
    ],
  )
  final CygnusPlatformPullToRefreshController? pullToRefreshController;

  ///{@template cygnus_core.CygnusPlatformWebViewCreationParams.findInteractionController}
  ///Represents the find interaction feature controller.
  ///{@endtemplate}
  ///
  ///{@macro cygnus_core.CygnusPlatformWebViewCreationParams.findInteractionController.supported_platforms}
  @SupportedPlatforms(
    platforms: [
      AndroidPlatform(),
      IOSPlatform(),
      MacOSPlatform(),
      WindowsPlatform(),
      LinuxPlatform(
        apiName: 'WebKitFindController',
        apiUrl:
            'https://wpewebkit.org/reference/stable/wpe-webkit-2.0/class.FindController.html',
      ),
    ],
  )
  final CygnusPlatformFindInteractionController? findInteractionController;

  ///{@macro cygnus_core.CygnusPlatformWebViewCreationParams}
  ///
  ///{@macro cygnus_core.CygnusPlatformWebViewCreationParams.supported_platforms}
  const CygnusPlatformWebViewCreationParams({
    this.controllerFromPlatform,
    this.windowId,
    this.onWebViewCreated,
    this.onLoadStart,
    this.onLoadStop,
    this.onContentLoading,
    this.onDOMContentLoaded,
    @Deprecated('Use onReceivedError instead') this.onLoadError,
    this.onReceivedError,
    @Deprecated("Use onReceivedHttpError instead") this.onLoadHttpError,
    this.onReceivedHttpError,
    this.onProgressChanged,
    this.onConsoleMessage,
    this.shouldOverrideUrlLoading,
    this.onLaunchingExternalUriScheme,
    this.onLoadResource,
    this.onScrollChanged,
    @Deprecated('Use onDownloadStarting instead') this.onDownloadStart,
    @Deprecated('Use onDownloadStarting instead') this.onDownloadStartRequest,
    this.onDownloadStarting,
    @Deprecated('Use onLoadResourceWithCustomScheme instead')
    this.onLoadResourceCustomScheme,
    this.onLoadResourceWithCustomScheme,
    this.onCreateWindow,
    this.onCloseWindow,
    this.onJsAlert,
    this.onJsConfirm,
    this.onJsPrompt,
    this.onReceivedHttpAuthRequest,
    this.onReceivedServerTrustAuthRequest,
    this.onReceivedClientCertRequest,
    @Deprecated('Use CygnusFindInteractionController.onFindResultReceived instead')
    this.onFindResultReceived,
    this.shouldInterceptAjaxRequest,
    this.onAjaxReadyStateChange,
    this.onAjaxProgress,
    this.shouldInterceptFetchRequest,
    this.onUpdateVisitedHistory,
    @Deprecated("Use onPrintRequest instead") this.onPrint,
    this.onPrintRequest,
    this.onLongPressHitTestResult,
    this.onEnterFullscreen,
    this.onExitFullscreen,
    this.onPageCommitVisible,
    this.onTitleChanged,
    this.onWindowFocus,
    this.onWindowBlur,
    this.onOverScrolled,
    this.onZoomScaleChanged,
    @Deprecated('Use onSafeBrowsingHit instead') this.androidOnSafeBrowsingHit,
    this.onSafeBrowsingHit,
    @Deprecated('Use onPermissionRequest instead')
    this.androidOnPermissionRequest,
    this.onPermissionRequest,
    @Deprecated('Use onGeolocationPermissionsShowPrompt instead')
    this.androidOnGeolocationPermissionsShowPrompt,
    this.onGeolocationPermissionsShowPrompt,
    @Deprecated('Use onGeolocationPermissionsHidePrompt instead')
    this.androidOnGeolocationPermissionsHidePrompt,
    this.onGeolocationPermissionsHidePrompt,
    @Deprecated('Use shouldInterceptRequest instead')
    this.androidShouldInterceptRequest,
    this.shouldInterceptRequest,
    @Deprecated('Use onRenderProcessGone instead')
    this.androidOnRenderProcessGone,
    this.onRenderProcessGone,
    @Deprecated('Use onRenderProcessResponsive instead')
    this.androidOnRenderProcessResponsive,
    this.onRenderProcessResponsive,
    @Deprecated('Use onRenderProcessUnresponsive instead')
    this.androidOnRenderProcessUnresponsive,
    this.onRenderProcessUnresponsive,
    @Deprecated('Use onFormResubmission instead')
    this.androidOnFormResubmission,
    this.onFormResubmission,
    @Deprecated('Use onZoomScaleChanged instead') this.androidOnScaleChanged,
    @Deprecated('Use onReceivedIcon instead') this.androidOnReceivedIcon,
    @Deprecated('Use onFaviconChanged instead') this.onReceivedIcon,
    this.onFaviconChanged,
    @Deprecated('Use onReceivedTouchIconUrl instead')
    this.androidOnReceivedTouchIconUrl,
    this.onReceivedTouchIconUrl,
    @Deprecated('Use onJsBeforeUnload instead') this.androidOnJsBeforeUnload,
    this.onJsBeforeUnload,
    @Deprecated('Use onReceivedLoginRequest instead')
    this.androidOnReceivedLoginRequest,
    this.onReceivedLoginRequest,
    this.onPermissionRequestCanceled,
    this.onRequestFocus,
    @Deprecated('Use onWebContentProcessDidTerminate instead')
    this.iosOnWebContentProcessDidTerminate,
    this.onWebContentProcessDidTerminate,
    @Deprecated(
      'Use onDidReceiveServerRedirectForProvisionalNavigation instead',
    )
    this.iosOnDidReceiveServerRedirectForProvisionalNavigation,
    this.onDidReceiveServerRedirectForProvisionalNavigation,
    @Deprecated('Use onNavigationResponse instead')
    this.iosOnNavigationResponse,
    this.onNavigationResponse,
    @Deprecated('Use shouldAllowDeprecatedTLS instead')
    this.iosShouldAllowDeprecatedTLS,
    this.shouldAllowDeprecatedTLS,
    this.onCameraCaptureStateChanged,
    this.onMicrophoneCaptureStateChanged,
    this.onContentSizeChanged,
    this.onProcessFailed,
    this.onNotificationReceived,
    this.onSaveAsUIShowing,
    this.onSaveFileSecurityCheckStarting,
    this.onScreenCaptureStarting,
    this.onAcceleratorKeyPressed,
    this.onShowFileChooser,
    this.initialUrlRequest,
    this.initialFile,
    this.initialData,
    @Deprecated('Use initialSettings instead') this.initialOptions,
    this.initialSettings,
    this.contextMenu,
    this.initialUserScripts,
    this.pullToRefreshController,
    this.findInteractionController,
  });

  ///{@template cygnus_core.CygnusPlatformWebViewCreationParams.isClassSupported}
  ///Check if the current class is supported by the [defaultTargetPlatform] or a specific [platform].
  ///{@endtemplate}
  bool isClassSupported({TargetPlatform? platform}) =>
      _CygnusPlatformWebViewCreationParamsClassSupported.isClassSupported(
        platform: platform,
      );

  ///{@template cygnus_core.CygnusPlatformWebViewCreationParams.isPropertySupported}
  ///Check if the given [property] is supported by the [defaultTargetPlatform] or a specific [platform].
  ///{@endtemplate}
  bool isPropertySupported(
    CygnusPlatformWebViewCreationParamsProperty property, {
    TargetPlatform? platform,
  }) => _CygnusPlatformWebViewCreationParamsPropertySupported.isPropertySupported(
    property,
    platform: platform,
  );
}
