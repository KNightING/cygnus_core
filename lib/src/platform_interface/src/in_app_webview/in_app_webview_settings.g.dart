// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'in_app_webview_settings.dart';

// **************************************************************************
// ExchangeableObjectGenerator
// **************************************************************************

///{@template cygnus_core.CygnusWebViewSettings}
///This class represents all the WebView settings available.
///{@endtemplate}
///
///**Officially Supported Platforms/Implementations**:
///- Android WebView
///- iOS WKWebView
///- macOS WKWebView
///- Web \<iframe\>
///- Windows WebView2
class CygnusWebViewSettings {
  ///A Boolean value indicating whether the WebView ignores an accessibility request to invert its colors.
  ///The default value is `false`.
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- iOS WKWebView 11.0+ ([Official API - UIView.accessibilityIgnoresInvertColors](https://developer.apple.com/documentation/uikit/uiview/2865843-accessibilityignoresinvertcolors))
  bool? accessibilityIgnoresInvertColors;

  ///Control whether algorithmic darkening is allowed.
  ///
  ///WebView always sets the media query `prefers-color-scheme` according to the app's theme attribute `isLightTheme`,
  ///i.e. `prefers-color-scheme` is light if `isLightTheme` is `true` or not specified, otherwise it is `dark`.
  ///This means that the web content's light or dark style will be applied automatically to match the app's theme if the content supports it.
  ///
  ///Algorithmic darkening is disallowed by default.
  ///
  ///If the app's theme is dark and it allows algorithmic darkening,
  ///WebView will attempt to darken web content using an algorithm,
  ///if the content doesn't define its own dark styles and doesn't explicitly disable darkening.
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView 29+ ([Official API - WebSettingsCompat.setAlgorithmicDarkeningAllowed](https://developer.android.com/reference/androidx/webkit/WebSettingsCompat#setAlgorithmicDarkeningAllowed(android.webkit.WebSettings,boolean))):
  ///    - available on Android only if [CygnusWebViewFeature.ALGORITHMIC_DARKENING] feature is supported.
  bool? algorithmicDarkeningAllowed;

  ///Set to `true` to allow audio playing when the app goes in background or the screen is locked or another app is opened.
  ///However, there will be no controls in the notification bar or on the lockscreen.
  ///Also, make sure to not call [CygnusPlatformWebViewController.pause], otherwise it will stop audio playing.
  ///The default value is `false`.
  ///
  ///**IMPORTANT NOTE**: if you use this setting, your app could be rejected by the Google Play Store.
  ///For example, if you allow background playing of YouTube videos, which is a violation of the YouTube API Terms of Service.
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView
  bool? allowBackgroundAudioPlaying;

  ///Enables or disables content URL access within WebView. Content URL access allows WebView to load content from a content provider installed in the system. The default value is `true`.
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView ([Official API - WebSettings.setAllowContentAccess](https://developer.android.com/reference/android/webkit/WebSettings?hl=en#setAllowContentAccess(boolean)))
  bool? allowContentAccess;

  ///Enables or disables file access within WebView. Note that this enables or disables file system access only.
  ///Assets and resources are still accessible using `file:///android_asset` and `file:///android_res`. The default value is `true`.
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView ([Official API - WebSettings.setAllowFileAccess](https://developer.android.com/reference/android/webkit/WebSettings?hl=en#setAllowFileAccess(boolean)))
  bool? allowFileAccess;

  ///Sets whether cross-origin requests in the context of a file scheme URL should be allowed to access content from other file scheme URLs.
  ///Note that some accesses such as image HTML elements don't follow same-origin rules and aren't affected by this setting.
  ///
  ///Don't enable this setting if you open files that may be created or altered by external sources.
  ///Enabling this setting allows malicious scripts loaded in a `file://` context to access arbitrary local files including WebView cookies and app private data.
  ///
  ///Note that the value of this setting is ignored if the value of [allowUniversalAccessFromFileURLs] is `true`.
  ///
  ///The default value is `false`.
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView ([Official API - WebSettings.setAllowFileAccessFromFileURLs](https://developer.android.com/reference/android/webkit/WebSettings?hl=en#setAllowFileAccessFromFileURLs(boolean)))
  ///- iOS WKWebView
  ///- macOS WKWebView
  ///- Linux WPE WebKit 2.10+ ([Official API - WebKitSettings.allow-file-access-from-file-urls](https://wpewebkit.org/reference/stable/wpe-webkit-2.0/property.Settings.allow-file-access-from-file-urls.html))
  bool? allowFileAccessFromFileURLs;

  ///Sets whether modal dialogs are allowed.
  ///When enabled, modal dialogs (such as `window.showModalDialog()`) are allowed.
  ///
  ///The default value is `false`.
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Linux WPE WebKit ([Official API - WebKitSettings.allow-modal-dialogs](https://wpewebkit.org/reference/stable/wpe-webkit-2.0/property.Settings.allow-modal-dialogs.html))
  bool? allowModalDialogs;

  ///Sets whether top-level navigation to data: URLs is allowed.
  ///When disabled, navigating to data: URLs in the top frame is blocked.
  ///
  ///The default value is `false`.
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Linux WPE WebKit 2.28+ ([Official API - WebKitSettings.allow-top-navigation-to-data-urls](https://wpewebkit.org/reference/stable/wpe-webkit-2.0/property.Settings.allow-top-navigation-to-data-urls.html)):
  ///    - Requires WPE WebKit 2.28 or later
  bool? allowTopNavigationToDataUrls;

  ///Sets whether cross-origin requests in the context of a file scheme URL should be allowed to access content from any origin.
  ///This includes access to content from other file scheme URLs or web contexts.
  ///Note that some access such as image HTML elements doesn't follow same-origin rules and isn't affected by this setting.
  ///
  ///Don't enable this setting if you open files that may be created or altered by external sources.
  ///Enabling this setting allows malicious scripts loaded in a `file://` context to launch cross-site scripting attacks,
  ///either accessing arbitrary local files including WebView cookies, app private data or even credentials used on arbitrary web sites.
  ///
  ///The default value is `false`.
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView ([Official API - WebSettings.setAllowUniversalAccessFromFileURLs](https://developer.android.com/reference/android/webkit/WebSettings?hl=en#setAllowUniversalAccessFromFileURLs(boolean)))
  ///- iOS WKWebView
  ///- macOS WKWebView
  ///- Linux WPE WebKit 2.14+ ([Official API - WebKitSettings.allow-universal-access-from-file-urls](https://wpewebkit.org/reference/stable/wpe-webkit-2.0/property.Settings.allow-universal-access-from-file-urls.html))
  bool? allowUniversalAccessFromFileURLs;

  ///Used in combination with [CygnusPlatformWebViewCreationParams.initialUrlRequest] or [CygnusPlatformWebViewCreationParams.initialData] (using the `file://` scheme), it represents the URL from which to read the web content.
  ///This URL must be a file-based URL (using the `file://` scheme).
  ///Specify the same value as the [CygnusURLRequest.url] if you are using it with the [CygnusPlatformWebViewCreationParams.initialUrlRequest] parameter or
  ///the [CygnusWebViewInitialData.baseUrl] if you are using it with the [CygnusPlatformWebViewCreationParams.initialData] parameter to prevent WebView from reading any other content.
  ///Specify a directory to give WebView permission to read additional files in the specified directory.
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- iOS WKWebView
  ///- macOS WKWebView
  CygnusWebUri? allowingReadAccessTo;

  ///Set to `true` to allow AirPlay. The default value is `true`.
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- iOS WKWebView ([Official API - WKWebViewConfiguration.allowsAirPlayForMediaPlayback](https://developer.apple.com/documentation/webkit/wkwebviewconfiguration/1395673-allowsairplayformediaplayback))
  ///- macOS WKWebView ([Official API - WKWebViewConfiguration.allowsAirPlayForMediaPlayback](https://developer.apple.com/documentation/webkit/wkwebviewconfiguration/1395673-allowsairplayformediaplayback))
  bool? allowsAirPlayForMediaPlayback;

  ///Set to `true` to allow the horizontal swipe gestures trigger back-forward list navigations.
  ///
  ///**NOTE for Windows**: Swiping down to refresh is off by default and not exposed via API currently,
  ///it requires the "--pull-to-refresh" option to be included in
  ///the additional browser arguments to be configured.
  ///(See [CygnusWebViewEnvironmentSettings.additionalBrowserArguments].).
  ///When set to `false`, the end user cannot swipe to navigate or pull to refresh.
  ///This API only affects the overscrolling navigation functionality and has
  ///no effect on the scrolling interaction used to explore the web content shown in WebView2.
  ///Disabling/Enabling [allowsBackForwardNavigationGestures] takes effect after the next navigation.
  ///
  ///The default value is `true`.
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- iOS WKWebView ([Official API - WKWebView.allowsBackForwardNavigationGestures](https://developer.apple.com/documentation/webkit/wkwebview/1414995-allowsbackforwardnavigationgestu))
  ///- macOS WKWebView ([Official API - WKWebView.allowsBackForwardNavigationGestures](https://developer.apple.com/documentation/webkit/wkwebview/1414995-allowsbackforwardnavigationgestu))
  ///- Windows WebView2 1.0.992.28+ ([Official API - ICoreWebView2Settings6.put_IsSwipeNavigationEnabled](https://learn.microsoft.com/en-us/microsoft-edge/webview2/reference/win32/icorewebview2settings6?view=webview2-1.0.2849.39#put_isswipenavigationenabled))
  bool? allowsBackForwardNavigationGestures;

  ///Set to `true` to allow HTML5 media playback to appear inline within the screen layout, using browser-supplied controls rather than native controls.
  ///For this to work, add the `webkit-playsinline` attribute to any `<video>` elements. The default value is `false`.
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- iOS WKWebView ([Official API - WKWebViewConfiguration.allowsInlineMediaPlayback](https://developer.apple.com/documentation/webkit/wkwebviewconfiguration/1614793-allowsinlinemediaplayback))
  ///- Linux WPE WebKit ([Official API - WebKitSettings.media-playback-allows-inline](https://wpewebkit.org/reference/stable/wpe-webkit-2.0/property.Settings.media-playback-allows-inline.html))
  bool? allowsInlineMediaPlayback;

  ///Set to `true` to allow that pressing on a link displays a preview of the destination for the link. The default value is `true`.
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- iOS WKWebView ([Official API - WKWebView.allowsLinkPreview](https://developer.apple.com/documentation/webkit/wkwebview/1415000-allowslinkpreview))
  ///- macOS WKWebView ([Official API - WKWebView.allowsLinkPreview](https://developer.apple.com/documentation/webkit/wkwebview/1415000-allowslinkpreview))
  bool? allowsLinkPreview;

  ///Set to `true` to allow HTML5 videos play picture-in-picture. The default value is `true`.
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- iOS WKWebView ([Official API - WKWebViewConfiguration.allowsPictureInPictureMediaPlayback](https://developer.apple.com/documentation/webkit/wkwebviewconfiguration/1614792-allowspictureinpicturemediaplayb))
  bool? allowsPictureInPictureMediaPlayback;

  ///The view’s alpha value. The value of this property is a floating-point number
  ///in the range 0.0 to 1.0, where 0.0 represents totally transparent and 1.0 represents totally opaque.
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView ([Official API - View.setAlpha](https://developer.android.com/reference/android/view/View#setAlpha(float)))
  ///- iOS WKWebView ([Official API - UIView.alpha](https://developer.apple.com/documentation/uikit/uiview/1622417-alpha))
  ///- macOS WKWebView ([Official API - NSView.alphaValue](https://developer.apple.com/documentation/appkit/nsview/1483560-alphavalue))
  double? alpha;

  ///A Boolean value that determines whether bouncing always occurs when horizontal scrolling reaches the end of the content view.
  ///If this property is set to `true` and [CygnusWebViewSettings.disallowOverScroll] is `false`,
  ///horizontal dragging is allowed even if the content is smaller than the bounds of the scroll view.
  ///The default value is `false`.
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- iOS WKWebView ([Official API - UIScrollView.alwaysBounceHorizontal](https://developer.apple.com/documentation/uikit/uiscrollview/1619393-alwaysbouncehorizontal))
  bool? alwaysBounceHorizontal;

  ///A Boolean value that determines whether bouncing always occurs when vertical scrolling reaches the end of the content.
  ///If this property is set to `true` and [CygnusWebViewSettings.disallowOverScroll] is `false`,
  ///vertical dragging is allowed even if the content is smaller than the bounds of the scroll view.
  ///The default value is `false`.
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- iOS WKWebView ([Official API - UIScrollView.alwaysBounceVertical](https://developer.apple.com/documentation/uikit/uiscrollview/1619383-alwaysbouncevertical))
  bool? alwaysBounceVertical;

  ///How the WebView is composited with the Flutter UI.
  ///
  ///**Leaving this unset picks the mode automatically**: Hybrid Composition++ wherever it is
  ///actually available, Texture Layer Hybrid Composition everywhere else. Set it explicitly to
  ///pin one mode -- [CygnusAndroidCompositionMode.TEXTURE_LAYER_HYBRID_COMPOSITION] is the way to opt
  ///out of HCPP.
  ///
  ///This supersedes the deprecated [useHybridComposition]. When this is non-null it wins;
  ///when it is null and [useHybridComposition] is `true` the WebView still gets
  ///[CygnusAndroidCompositionMode.HYBRID_COMPOSITION], so existing code keeps its behaviour.
  ///
  ///Because the composition mode is fixed when the platform view is created, the automatic
  ///choice waits for the one-off support check to answer before creating the WebView. That
  ///delays the very first WebView of a session by a single platform channel round trip;
  ///subsequent ones use the cached answer and are not delayed. Pinning a mode explicitly skips
  ///the wait entirely.
  ///
  ///Only applies to the [CygnusPlatformWebViewWidget] — [CygnusPlatformBrowser] and
  ///[CygnusPlatformHeadlessWebView] do not go through a platform view, so composition mode
  ///has no meaning for them.
  ///
  ///Can only be set through the initial settings: the composition mode is fixed when the
  ///platform view is created and cannot be changed afterwards.
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView:
  ///    - [CygnusAndroidCompositionMode.HYBRID_COMPOSITION_PLUS_PLUS] additionally requires API 34+, Impeller running on Vulkan, and the embedding application to opt in -- a plugin cannot turn it on for the application. Apps opt in with the `io.flutter.embedding.android.EnableHcpp` manifest meta-data (used by release builds) or `flutter run --enable-hcpp` during development. When any requirement is missing it falls back to [CygnusAndroidCompositionMode.TEXTURE_LAYER_HYBRID_COMPOSITION].
  CygnusAndroidCompositionMode? androidCompositionMode;

  ///Sets the path to the Application Caches files. In order for the Application Caches API to be enabled, this option must be set a path to which the application can write.
  ///This option is used one time: repeated calls are ignored.
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView (Official API - WebSettings.setAppCachePath)
  String? appCachePath;

  ///Set to `true` to enable Apple Pay API for the `WebView` at its first page load or on the next page load (using [CygnusPlatformWebViewController.setOptions]). The default value is `false`.
  ///
  ///**IMPORTANT NOTE**: As written in the official [Safari 13 Release Notes](https://developer.apple.com/documentation/safari-release-notes/safari-13-release-notes#Payment-Request-API),
  ///it won't work if any script injection APIs are used (such as [CygnusPlatformWebViewController.evaluateJavascript] or [CygnusUserScript]).
  ///So, when this attribute is `true`, all the methods, options, and events implemented using JavaScript won't be called or won't do anything and the result will always be `null`.
  ///
  ///Methods affected:
  ///- [CygnusPlatformWebViewController.addUserScript]
  ///- [CygnusPlatformWebViewController.addUserScripts]
  ///- [CygnusPlatformWebViewController.removeUserScript]
  ///- [CygnusPlatformWebViewController.removeUserScripts]
  ///- [CygnusPlatformWebViewController.removeAllUserScripts]
  ///- [CygnusPlatformWebViewController.evaluateJavascript]
  ///- [CygnusPlatformWebViewController.callAsyncJavaScript]
  ///- [CygnusPlatformWebViewController.injectJavascriptFileFromUrl]
  ///- [CygnusPlatformWebViewController.injectJavascriptFileFromAsset]
  ///- [CygnusPlatformWebViewController.injectCSSCode]
  ///- [CygnusPlatformWebViewController.injectCSSFileFromUrl]
  ///- [CygnusPlatformWebViewController.injectCSSFileFromAsset]
  ///- [CygnusPlatformWebViewController.findAllAsync]
  ///- [CygnusPlatformWebViewController.findNext]
  ///- [CygnusPlatformWebViewController.clearMatches]
  ///- [CygnusPlatformWebViewController.pauseTimers]
  ///- [CygnusPlatformWebViewController.getSelectedText]
  ///- [CygnusPlatformWebViewController.getHitTestResult]
  ///- [CygnusPlatformWebViewController.requestFocusNodeHref]
  ///- [CygnusPlatformWebViewController.requestImageRef]
  ///- [CygnusPlatformWebViewController.postWebMessage]
  ///- [CygnusPlatformWebViewController.createWebMessageChannel]
  ///- [CygnusPlatformWebViewController.addWebMessageListener]
  ///
  ///Settings affected:
  ///- [CygnusPlatformWebViewCreationParams.initialUserScripts]
  ///- [CygnusWebViewSettings.supportZoom]
  ///- [CygnusWebViewSettings.useOnLoadResource]
  ///- [CygnusWebViewSettings.useShouldInterceptAjaxRequest]
  ///- [CygnusWebViewSettings.useShouldInterceptFetchRequest]
  ///- [CygnusWebViewSettings.enableViewportScale]
  ///
  ///Events affected:
  ///- the `hitTestResult` argument of [CygnusPlatformWebViewCreationParams.onLongPressHitTestResult] will be empty
  ///- the `hitTestResult` argument of [CygnusContextMenu.onCreateContextMenu] will be empty
  ///- [CygnusPlatformWebViewCreationParams.onLoadResource]
  ///- [CygnusPlatformWebViewCreationParams.shouldInterceptAjaxRequest]
  ///- [CygnusPlatformWebViewCreationParams.onAjaxReadyStateChange]
  ///- [CygnusPlatformWebViewCreationParams.onAjaxProgress]
  ///- [CygnusPlatformWebViewCreationParams.shouldInterceptFetchRequest]
  ///- [CygnusPlatformWebViewCreationParams.onConsoleMessage]
  ///- [CygnusPlatformWebViewCreationParams.onPrintRequest]
  ///- [CygnusPlatformWebViewCreationParams.onWindowFocus]
  ///- [CygnusPlatformWebViewCreationParams.onWindowBlur]
  ///- [CygnusPlatformWebViewCreationParams.onFindResultReceived]
  ///- [CygnusFindInteractionController.onFindResultReceived]
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- iOS WKWebView 13.0+
  bool? applePayAPIEnabled;

  ///Append to the existing user-agent. Setting userAgent will override this.
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView
  ///- iOS WKWebView ([Official API - WKWebViewConfiguration.applicationNameForUserAgent](https://developer.apple.com/documentation/webkit/wkwebviewconfiguration/1395665-applicationnameforuseragent))
  ///- macOS WKWebView ([Official API - WKWebViewConfiguration.applicationNameForUserAgent](https://developer.apple.com/documentation/webkit/wkwebviewconfiguration/1395665-applicationnameforuseragent))
  String? applicationNameForUserAgent;

  ///Configures whether the scroll indicator insets are automatically adjusted by the system.
  ///The default value is `false`.
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- iOS WKWebView 13.0+ ([Official API - UIScrollView.automaticallyAdjustsScrollIndicatorInsets](https://developer.apple.com/documentation/uikit/uiscrollview/3198043-automaticallyadjustsscrollindica))
  bool? automaticallyAdjustsScrollIndicatorInsets;

  ///Sets whether the WebView should not load image resources from the network (resources accessed via http and https URI schemes). The default value is `false`.
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView ([Official API - WebSettings.setBlockNetworkImage](https://developer.android.com/reference/android/webkit/WebSettings#setBlockNetworkImage(boolean)))
  bool? blockNetworkImage;

  ///Sets whether the WebView should not load resources from the network. The default value is `false`.
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView ([Official API - WebSettings.setBlockNetworkLoads](https://developer.android.com/reference/android/webkit/WebSettings#setBlockNetworkLoads(boolean)))
  bool? blockNetworkLoads;

  ///When this setting is set to `false`, it disables all accelerator keys
  ///that access features specific to a web browser, including but not limited to:
  ///- Ctrl-F and F3 for Find on Page
  ///- Ctrl-P for Print
  ///- Ctrl-R and F5 for Reload
  ///- Ctrl-Plus and Ctrl-Minus for zooming
  ///- Ctrl-Shift-C and F12 for DevTools
  ///Special keys for browser functions, such as Back, Forward, and Search
  ///It does not disable accelerator keys related to movement and text editing, such as:
  ///- Home, End, Page Up, and Page Down
  ///- Ctrl-X, Ctrl-C, Ctrl-V
  ///- Ctrl-A for Select All
  ///- Ctrl-Z for Undo
  ///
  ///The default value is `true`.
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Windows WebView2 1.0.864.35+ ([Official API - ICoreWebView2Settings3.put_IsBuiltInErrorPageEnabled](https://learn.microsoft.com/en-us/microsoft-edge/webview2/reference/win32/icorewebview2settings3?view=webview2-1.0.2849.39#put_arebrowseracceleratorkeysenabled))
  bool? browserAcceleratorKeysEnabled;

  ///Set to `true` if the WebView should use its built-in zoom mechanisms. The default value is `true`.
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView ([Official API - WebSettings.setBuiltInZoomControls](https://developer.android.com/reference/android/webkit/WebSettings?hl=en#setBuiltInZoomControls(boolean)))
  bool? builtInZoomControls;

  ///Sets whether WebView should use browser caching. The default value is `true`.
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView
  ///- iOS WKWebView
  ///- macOS WKWebView
  bool? cacheEnabled;

  ///Overrides the way the cache is used. The way the cache is used is based on the navigation type. For a normal page load, the cache is checked and content is re-validated as needed.
  ///When navigating back, content is not revalidated, instead the content is just retrieved from the cache. The default value is [CygnusCacheMode.LOAD_DEFAULT].
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView ([Official API - WebSettings.setCacheMode](https://developer.android.com/reference/android/webkit/WebSettings#setCacheMode(int)))
  CygnusCacheMode? cacheMode;

  ///Use [CygnusPlatformWebViewController.clearAllCache] instead.
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView
  ///- iOS WKWebView
  ///- macOS WKWebView
  @Deprecated('Use CygnusWebViewController.clearAllCache instead')
  bool? clearCache;

  ///Use [CygnusPlatformCookieManager.removeSessionCookies] instead.
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView
  @Deprecated('Use CygnusCookieManager.removeSessionCookies instead')
  bool? clearSessionCache;

  ///List of [CygnusContentBlocker] that are a set of rules used to block content in the browser window.
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView
  ///- iOS WKWebView 11.0+
  ///- macOS WKWebView 10.13+
  ///- Linux WPE WebKit ([Official API - WebKitUserContentFilter](https://wpewebkit.org/reference/stable/wpe-webkit-2.0/class.UserContentFilter.html))
  List<CygnusContentBlocker>? contentBlockers;

  ///Configures how safe area insets are added to the adjusted content inset.
  ///The default value is [CygnusScrollViewContentInsetAdjustmentBehavior.NEVER].
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- iOS WKWebView 11.0+ ([Official API - UIScrollView.contentInsetAdjustmentBehavior](https://developer.apple.com/documentation/uikit/uiscrollview/2902261-contentinsetadjustmentbehavior))
  CygnusScrollViewContentInsetAdjustmentBehavior?
  contentInsetAdjustmentBehavior;

  ///Sets the CORS allowlist for this WebView.
  ///
  ///URI patterns must be of the form `[protocol]://[host]:[port]`, where each
  ///component may contain the wildcard character (`*`) to match zero or more
  ///characters. All three components are required.
  ///
  ///Disabling CORS checks permits resources from other origins to load
  ///allowlisted resources. It does NOT permit the allowlisted resources
  ///to load resources from other origins.
  ///
  ///Setting to `null` or an empty list clears the allowlist.
  ///
  ///Example patterns:
  ///- `https://example.com:*` - All ports on example.com over HTTPS
  ///- `*://api.myservice.com:*` - Any protocol on api.myservice.com
  ///- `https://*.example.com:443` - HTTPS port 443 on any subdomain
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Linux WPE WebKit 2.34+ ([Official API - webkit_web_view_set_cors_allowlist](https://wpewebkit.org/reference/stable/wpe-webkit-2.0/method.WebView.set_cors_allowlist.html)):
  ///    - Pattern format: [protocol]://[host]:[port]. All three components are required.
  List<String>? corsAllowlist;

  ///Sets the cursive font family name. The default value is `"cursive"`.
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView ([Official API - WebSettings.setCursiveFontFamily](https://developer.android.com/reference/android/webkit/WebSettings#setCursiveFontFamily(java.lang.String)))
  ///- Linux WPE WebKit ([Official API - WebKitSettings.cursive-font-family](https://wpewebkit.org/reference/stable/wpe-webkit-2.0/property.Settings.cursive-font-family.html))
  String? cursiveFontFamily;

  ///Sets the cursor blink time in milliseconds.
  ///This controls how frequently the text cursor blinks in input fields.
  ///
  ///This is a WPE Platform setting that affects the entire display.
  ///
  ///The default value is `null` (uses system default, typically 1200ms).
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Linux WPE WebKit ([Official API - WPESettings.cursor-blink-time](https://wpewebkit.org/reference/stable/wpe-platform-2.0/class.Settings.html)):
  ///    - This is a WPE Platform display-level setting. Value is in milliseconds.
  int? cursorBlinkTime;

  ///Sets whether dark mode is enabled for web content.
  ///When enabled, websites that support the `prefers-color-scheme: dark` CSS media query
  ///will render in dark mode.
  ///
  ///This is a WPE Platform setting that affects the entire display.
  ///
  ///The default value is `null` (follows system default).
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Linux WPE WebKit ([Official API - WPESettings.dark-mode](https://wpewebkit.org/reference/stable/wpe-platform-2.0/class.Settings.html)):
  ///    - This is a WPE Platform display-level setting that affects all WebViews.
  bool? darkMode;

  ///Specifying a dataDetectoryTypes value adds interactivity to web content that matches the value.
  ///For example, Safari adds a link to “apple.com” in the text “Visit apple.com” if the dataDetectorTypes property is set to [CygnusDataDetectorTypes.LINK].
  ///The default value is [CygnusDataDetectorTypes.NONE].
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- iOS WKWebView 10+ ([Official API - WKWebViewConfiguration.dataDetectorTypes](https://developer.apple.com/documentation/webkit/wkwebviewconfiguration/1641937-datadetectortypes))
  List<CygnusDataDetectorTypes>? dataDetectorTypes;

  ///Set to `true` if you want the database storage API is enabled. The default value is `true`.
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView ([Official API - WebSettings.setDatabaseEnabled](https://developer.android.com/reference/android/webkit/WebSettings?hl=en#setDatabaseEnabled(boolean)))
  ///- Linux WPE WebKit ([Official API - WebKitSettings.enable-html5-database](https://wpewebkit.org/reference/stable/wpe-webkit-2.0/property.Settings.enable-html5-database.html))
  bool? databaseEnabled;

  ///A [CygnusScrollViewDecelerationRate] value that determines the rate of deceleration after the user lifts their finger.
  ///The default value is [CygnusScrollViewDecelerationRate.NORMAL].
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- iOS WKWebView ([Official API - UIScrollView.decelerationRate](https://developer.apple.com/documentation/uikit/uiscrollview/1619438-decelerationrate))
  CygnusScrollViewDecelerationRate? decelerationRate;

  ///Sets the default fixed font size. The default value is `16`.
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView ([Official API - WebSettings.setDefaultFixedFontSize](https://developer.android.com/reference/android/webkit/WebSettings#setDefaultFixedFontSize(int)))
  ///- Linux WPE WebKit ([Official API - WebKitSettings.default-monospace-font-size](https://wpewebkit.org/reference/stable/wpe-webkit-2.0/property.Settings.default-monospace-font-size.html))
  int? defaultFixedFontSize;

  ///Sets the default font size. The default value is `16`.
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView ([Official API - WebSettings.setDefaultFontSize](https://developer.android.com/reference/android/webkit/WebSettings#setDefaultFontSize(int)))
  ///- Linux WPE WebKit ([Official API - WebKitSettings.default-font-size](https://wpewebkit.org/reference/stable/wpe-webkit-2.0/property.Settings.default-font-size.html))
  int? defaultFontSize;

  ///Sets the default text encoding name to use when decoding html pages. The default value is `"UTF-8"`.
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView ([Official API - WebSettings.setDefaultTextEncodingName](https://developer.android.com/reference/android/webkit/WebSettings#setDefaultTextEncodingName(java.lang.String)))
  ///- Linux WPE WebKit ([Official API - WebKitSettings.default-charset](https://wpewebkit.org/reference/stable/wpe-webkit-2.0/property.Settings.default-charset.html))
  String? defaultTextEncodingName;

  ///When not playing, video elements are represented by a 'poster' image.
  ///The image to use can be specified by the poster attribute of the video tag in HTML.
  ///If the attribute is absent, then a default poster will be used.
  ///This property allows the WebView to provide that default image.
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView
  Uint8List? defaultVideoPoster;

  ///Sets whether animations are disabled for accessibility.
  ///When enabled, CSS animations and transitions may be reduced or disabled
  ///for users with motion sensitivity.
  ///
  ///This is a WPE Platform setting that affects the entire display.
  ///
  ///The default value is `null` (follows system default).
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Linux WPE WebKit ([Official API - WPESettings.disable-animations](https://wpewebkit.org/reference/stable/wpe-platform-2.0/class.Settings.html)):
  ///    - This is a WPE Platform display-level setting for accessibility.
  bool? disableAnimations;

  ///Set to `true` to disable context menu. The default value is `false`.
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView
  ///- iOS WKWebView
  ///- Web \<iframe\> but requires same origin
  ///- Windows WebView2 ([Official API - ICoreWebView2Settings.put_AreDefaultContextMenusEnabled](https://learn.microsoft.com/en-us/microsoft-edge/webview2/reference/win32/icorewebview2settings?view=webview2-1.0.2210.55#put_aredefaultcontextmenusenabled))
  bool? disableContextMenu;

  ///Sets whether the default Android WebView’s internal error page should be suppressed or displayed for bad navigations.
  ///`true` means suppressed (not shown), `false` means it will be displayed. The default value is `false`.
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView
  ///- Windows WebView2 ([Official API - ICoreWebView2Settings.put_IsBuiltInErrorPageEnabled](https://learn.microsoft.com/en-us/microsoft-edge/webview2/reference/win32/icorewebview2settings?view=webview2-1.0.2849.39#put_isbuiltinerrorpageenabled))
  bool? disableDefaultErrorPage;

  ///Set to `true` to disable horizontal scroll. The default value is `false`.
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView
  ///- iOS WKWebView
  ///- Web \<iframe\> but requires same origin
  bool? disableHorizontalScroll;

  ///Set to `true` to disable the [inputAccessoryView](https://developer.apple.com/documentation/uikit/uiresponder/1621119-inputaccessoryview) above system keyboard.
  ///The default value is `false`.
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- iOS WKWebView
  bool? disableInputAccessoryView;

  ///Set to `true` to disable the context menu (copy, select, etc.) that is shown when the user emits a long press event on a HTML link.
  ///This is implemented using also JavaScript, so it must be enabled or it won't work.
  ///The default value is `false`.
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- iOS WKWebView
  bool? disableLongPressContextMenuOnLinks;

  ///Set to `true` to disable vertical scroll. The default value is `false`.
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView
  ///- iOS WKWebView
  ///- Web \<iframe\> but requires same origin
  bool? disableVerticalScroll;

  ///Disables web security. When disabled, same-origin policy is not enforced.
  ///
  ///**NOTE**: Setting this to `true` is extremely dangerous and should only be used for testing.
  ///
  ///The default value is `false`.
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Linux WPE WebKit 2.40+ ([Official API - WebKitSettings.disable-web-security](https://wpewebkit.org/reference/stable/wpe-webkit-2.0/property.Settings.disable-web-security.html)):
  ///    - Requires WPE WebKit 2.40 or later
  bool? disableWebSecurity;

  ///Disables the action mode menu items according to menuItems flag.
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView 24+ ([Official API - WebSettings.setDisabledActionModeMenuItems](https://developer.android.com/reference/android/webkit/WebSettings#setDisabledActionModeMenuItems(int)))
  CygnusActionModeMenuItem? disabledActionModeMenuItems;

  ///Set to `true` to disable the bouncing of the WebView when the scrolling has reached an edge of the content. The default value is `false`.
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- iOS WKWebView
  bool? disallowOverScroll;

  ///Set to `true` if the WebView should display on-screen zoom controls when using the built-in zoom mechanisms. The default value is `false`.
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView ([Official API - WebSettings.setDisplayZoomControls](https://developer.android.com/reference/android/webkit/WebSettings?hl=en#setDisplayZoomControls(boolean)))
  bool? displayZoomControls;

  ///Set to `true` if you want the DOM storage API is enabled. The default value is `true`.
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView ([Official API - WebSettings.setDomStorageEnabled](https://developer.android.com/reference/android/webkit/WebSettings?hl=en#setDomStorageEnabled(boolean)))
  ///- Linux WPE WebKit ([Official API - WebKitSettings.enable-html5-local-storage](https://wpewebkit.org/reference/stable/wpe-webkit-2.0/property.Settings.enable-html5-local-storage.html))
  bool? domStorageEnabled;

  ///Sets the double-click distance threshold in pixels.
  ///Two clicks within this distance are considered a double-click.
  ///
  ///This is a WPE Platform setting that affects the entire display.
  ///
  ///The default value is `null` (uses system default, typically 5 pixels).
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Linux WPE WebKit ([Official API - WPESettings.double-click-distance](https://wpewebkit.org/reference/stable/wpe-platform-2.0/class.Settings.html)):
  ///    - This is a WPE Platform display-level setting. Value is in pixels.
  int? doubleClickDistance;

  ///Sets the double-click time threshold in milliseconds.
  ///Two clicks within this time are considered a double-click.
  ///
  ///This is a WPE Platform setting that affects the entire display.
  ///
  ///The default value is `null` (uses system default, typically 400ms).
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Linux WPE WebKit ([Official API - WPESettings.double-click-time](https://wpewebkit.org/reference/stable/wpe-platform-2.0/class.Settings.html)):
  ///    - This is a WPE Platform display-level setting. Value is in milliseconds.
  int? doubleClickTime;

  ///Sets the drag threshold in pixels.
  ///The pointer must move at least this many pixels to start a drag operation.
  ///
  ///This is a WPE Platform setting that affects the entire display.
  ///
  ///The default value is `null` (uses system default, typically 8 pixels).
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Linux WPE WebKit ([Official API - WPESettings.drag-threshold](https://wpewebkit.org/reference/stable/wpe-platform-2.0/class.Settings.html)):
  ///    - This is a WPE Platform display-level setting. Value is in pixels.
  int? dragThreshold;

  ///Sets whether compositing indicators are drawn.
  ///When enabled, visual indicators are shown for compositing layers.
  ///This is primarily useful for debugging rendering performance.
  ///
  ///The default value is `false`.
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Linux WPE WebKit ([Official API - WebKitSettings.draw-compositing-indicators](https://wpewebkit.org/reference/stable/wpe-webkit-2.0/property.Settings.draw-compositing-indicators.html))
  bool? drawCompositingIndicators;

  ///Sets whether 2D canvas hardware acceleration is enabled.
  ///When enabled, 2D canvas operations are accelerated using the GPU.
  ///
  ///The default value is `false`.
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Linux WPE WebKit 2.46+ ([Official API - WebKitSettings.enable-2d-canvas-acceleration](https://wpewebkit.org/reference/stable/wpe-webkit-2.0/property.Settings.enable-2d-canvas-acceleration.html)):
  ///    - Requires WPE WebKit 2.46 or later
  bool? enable2DCanvasAcceleration;

  ///Sets whether caret browsing mode is enabled.
  ///Caret browsing mode allows users to navigate through web pages using the keyboard,
  ///with a visible caret (text cursor) that can be moved through the content.
  ///
  ///The default value is `false`.
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Linux WPE WebKit ([Official API - WebKitSettings.enable-caret-browsing](https://wpewebkit.org/reference/stable/wpe-webkit-2.0/property.Settings.enable-caret-browsing.html))
  bool? enableCaretBrowsing;

  ///Sets whether Encrypted Media Extensions (EME) are enabled.
  ///EME provides APIs for playing protected (DRM) content.
  ///
  ///The default value is `true` (since WPE WebKit 2.38).
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Linux WPE WebKit 2.20+ ([Official API - WebKitSettings.enable-encrypted-media](https://wpewebkit.org/reference/stable/wpe-webkit-2.0/property.Settings.enable-encrypted-media.html)):
  ///    - Requires WPE WebKit 2.20 or later
  bool? enableEncryptedMedia;

  ///Sets whether JavaScript markup (<script> tags) is enabled.
  ///When disabled, scripts embedded in HTML will not be executed.
  ///
  ///The default value is `true`.
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Linux WPE WebKit 2.24+ ([Official API - WebKitSettings.enable-javascript-markup](https://wpewebkit.org/reference/stable/wpe-webkit-2.0/property.Settings.enable-javascript-markup.html)):
  ///    - Requires WPE WebKit 2.24 or later
  bool? enableJavaScriptMarkup;

  ///Sets whether media (audio/video) is enabled.
  ///When disabled, media elements will not be able to play.
  ///
  ///The default value is `true`.
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Linux WPE WebKit 2.26+ ([Official API - WebKitSettings.enable-media](https://wpewebkit.org/reference/stable/wpe-webkit-2.0/property.Settings.enable-media.html)):
  ///    - Requires WPE WebKit 2.26 or later
  bool? enableMedia;

  ///Sets whether the Media Capabilities API is enabled.
  ///The Media Capabilities API provides information about the decoding abilities of the device.
  ///
  ///The default value is `true`.
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Linux WPE WebKit 2.22+ ([Official API - WebKitSettings.enable-media-capabilities](https://wpewebkit.org/reference/stable/wpe-webkit-2.0/property.Settings.enable-media-capabilities.html)):
  ///    - Requires WPE WebKit 2.22 or later
  bool? enableMediaCapabilities;

  ///Sets whether mock capture devices are enabled.
  ///When enabled, the browser will use mock devices for getUserMedia() instead of real hardware.
  ///This is useful for testing.
  ///
  ///The default value is `false`.
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Linux WPE WebKit 2.24+ ([Official API - WebKitSettings.enable-mock-capture-devices](https://wpewebkit.org/reference/stable/wpe-webkit-2.0/property.Settings.enable-mock-capture-devices.html)):
  ///    - Requires WPE WebKit 2.24 or later
  bool? enableMockCaptureDevices;

  ///Sets whether the page cache is enabled.
  ///The page cache allows for faster back/forward navigation by keeping pages in memory.
  ///
  ///The default value is `true`.
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Linux WPE WebKit ([Official API - WebKitSettings.enable-page-cache](https://wpewebkit.org/reference/stable/wpe-webkit-2.0/property.Settings.enable-page-cache.html))
  bool? enablePageCache;

  ///Sets whether text areas are resizable.
  ///When enabled, text areas can be resized by the user.
  ///
  ///The default value is `true`.
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Linux WPE WebKit ([Official API - WebKitSettings.enable-resizable-text-areas](https://wpewebkit.org/reference/stable/wpe-webkit-2.0/property.Settings.enable-resizable-text-areas.html))
  bool? enableResizableTextAreas;

  ///Sets whether smooth scrolling is enabled.
  ///When enabled, scrolling animations are smooth instead of jumping instantly.
  ///
  ///The default value is `true`.
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Linux WPE WebKit ([Official API - WebKitSettings.enable-smooth-scrolling](https://wpewebkit.org/reference/stable/wpe-webkit-2.0/property.Settings.enable-smooth-scrolling.html))
  bool? enableSmoothScrolling;

  ///Sets whether spatial navigation is enabled.
  ///Spatial navigation allows users to navigate between focusable elements
  ///using arrow keys instead of Tab.
  ///
  ///The default value is `false`.
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Linux WPE WebKit ([Official API - WebKitSettings.enable-spatial-navigation](https://wpewebkit.org/reference/stable/wpe-webkit-2.0/property.Settings.enable-spatial-navigation.html))
  bool? enableSpatialNavigation;

  ///Sets whether tab key can be used to navigate to links.
  ///When enabled, pressing Tab will focus on links in the page.
  ///
  ///The default value is `true`.
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Linux WPE WebKit ([Official API - WebKitSettings.enable-tabs-to-links](https://wpewebkit.org/reference/stable/wpe-webkit-2.0/property.Settings.enable-tabs-to-links.html))
  bool? enableTabsToLinks;

  ///Set to `true` to allow a viewport meta tag to either disable or restrict the range of user scaling. The default value is `false`.
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- iOS WKWebView
  ///- macOS WKWebView
  bool? enableViewportScale;

  ///Enables WebRTC support for real-time communication features.
  ///
  ///The default value is `true`.
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Linux WPE WebKit 2.38+ ([Official API - WebKitSettings.enable-webrtc](https://wpewebkit.org/reference/stable/wpe-webkit-2.0/property.Settings.enable-webrtc.html)):
  ///    - Requires WPE WebKit 2.38 or later
  bool? enableWebRTC;

  ///Sets whether console messages are written to stdout.
  ///When enabled, console messages from the web page will be written to the standard output.
  ///This is useful for debugging purposes.
  ///
  ///The default value is `false`.
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Linux WPE WebKit ([Official API - WebKitSettings.enable-write-console-messages-to-stdout](https://wpewebkit.org/reference/stable/wpe-webkit-2.0/property.Settings.enable-write-console-messages-to-stdout.html))
  bool? enableWriteConsoleMessagesToStdout;

  ///Sets whether EnterpriseAuthenticationAppLinkPolicy if set by admin is allowed to have any
  ///effect on WebView.
  ///
  ///EnterpriseAuthenticationAppLinkPolicy in WebView allows admins to specify authentication
  ///urls. When WebView is redirected to authentication url, and an app on the device has
  ///registered as the default handler for the url, that app is launched.
  ///
  ///The default value is `true`.
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView:
  ///    - available on Android only if [CygnusWebViewFeature.ENTERPRISE_AUTHENTICATION_APP_LINK_POLICY] feature is supported.
  bool? enterpriseAuthenticationAppLinkPolicyEnabled;

  ///Sets the fantasy font family name. The default value is `"fantasy"`.
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView ([Official API - WebSettings.setFantasyFontFamily](https://developer.android.com/reference/android/webkit/WebSettings#setFantasyFontFamily(java.lang.String)))
  ///- Linux WPE WebKit ([Official API - WebKitSettings.fantasy-font-family](https://wpewebkit.org/reference/stable/wpe-webkit-2.0/property.Settings.fantasy-font-family.html))
  String? fantasyFontFamily;

  ///Sets the fixed font family name. The default value is `"monospace"`.
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView ([Official API - WebSettings.setFixedFontFamily](https://developer.android.com/reference/android/webkit/WebSettings#setFixedFontFamily(java.lang.String)))
  ///- Linux WPE WebKit ([Official API - WebKitSettings.monospace-font-family](https://wpewebkit.org/reference/stable/wpe-webkit-2.0/property.Settings.monospace-font-family.html))
  String? fixedFontFamily;

  ///Sets whether font antialiasing is enabled.
  ///When enabled, fonts are rendered with antialiasing for smoother edges.
  ///
  ///This is a WPE Platform setting that affects the entire display.
  ///
  ///The default value is `null` (follows system default).
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Linux WPE WebKit ([Official API - WPESettings.font-antialias](https://wpewebkit.org/reference/stable/wpe-platform-2.0/class.Settings.html)):
  ///    - This is a WPE Platform display-level setting for font rendering.
  bool? fontAntialias;

  ///Sets the font DPI (dots per inch) for text rendering.
  ///This affects the size at which fonts are rendered.
  ///
  ///This is a WPE Platform setting that affects the entire display.
  ///
  ///The default value is `null` (uses system default, typically 96.0).
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Linux WPE WebKit ([Official API - WPESettings.font-dpi](https://wpewebkit.org/reference/stable/wpe-platform-2.0/class.Settings.html)):
  ///    - This is a WPE Platform display-level setting. Default is typically 96.0 DPI.
  double? fontDPI;

  ///Sets the font hinting style.
  ///Hinting adjusts font outlines to improve rendering at small sizes.
  ///
  ///This is a WPE Platform setting that affects the entire display.
  ///
  ///The default value is `null` (follows system default).
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Linux WPE WebKit ([Official API - WPESettings.font-hinting-style](https://wpewebkit.org/reference/stable/wpe-platform-2.0/class.Settings.html)):
  ///    - This is a WPE Platform display-level setting for font rendering.
  CygnusFontHintingStyle? fontHintingStyle;

  ///Sets the font subpixel layout for LCD rendering.
  ///This determines how subpixel rendering is performed based on the
  ///physical arrangement of the display's RGB subpixels.
  ///
  ///This is a WPE Platform setting that affects the entire display.
  ///
  ///The default value is `null` (follows system default).
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Linux WPE WebKit ([Official API - WPESettings.font-subpixel-layout](https://wpewebkit.org/reference/stable/wpe-platform-2.0/class.Settings.html)):
  ///    - This is a WPE Platform display-level setting for font rendering.
  CygnusFontSubpixelLayout? fontSubpixelLayout;

  ///Use [algorithmicDarkeningAllowed] instead.
  ///
  ///Set the force dark mode for this WebView. The default value is [CygnusForceDark.OFF].
  ///
  ///Deprecated - The "force dark" model previously implemented by WebView was complex and didn't
  ///interoperate well with current Web standards for `prefers-color-scheme` and `color-scheme`.
  ///In apps with `targetSdkVersion` ≥ `android.os.Build.VERSION_CODES.TIRAMISU` this API is a no-op and
  ///WebView will always use the dark style defined by web content authors if the app's theme is dark.
  ///To customize the behavior, refer to [algorithmicDarkeningAllowed].
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView 29+ ([Official API - WebSettings.setForceDark](https://developer.android.com/reference/android/webkit/WebSettings#setForceDark(int)))
  @Deprecated('Use algorithmicDarkeningAllowed instead')
  CygnusForceDark? forceDark;

  ///Use [algorithmicDarkeningAllowed] instead.
  ///
  ///Set how WebView content should be darkened.
  ///The default value is [CygnusForceDarkStrategy.PREFER_WEB_THEME_OVER_USER_AGENT_DARKENING].
  ///
  ///Deprecated - The "force dark" model previously implemented by WebView was complex and didn't
  ///interoperate well with current Web standards for `prefers-color-scheme` and `color-scheme`.
  ///In apps with `targetSdkVersion` ≥ `android.os.Build.VERSION_CODES.TIRAMISU` this API is a no-op and
  ///WebView will always use the dark style defined by web content authors if the app's theme is dark.
  ///To customize the behavior, refer to [algorithmicDarkeningAllowed].
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView ([Official API - WebSettingsCompat.setForceDarkStrategy](https://developer.android.com/reference/androidx/webkit/WebSettingsCompat#setForceDarkStrategy(android.webkit.WebSettings,int))):
  ///    - it will take effect only if [CygnusWebViewFeature.isFeatureSupported] returns `true` for [CygnusWebViewFeature.FORCE_DARK_STRATEGY].
  @Deprecated('Use algorithmicDarkeningAllowed instead')
  CygnusForceDarkStrategy? forceDarkStrategy;

  ///Specifies whether autofill for information like names, street and email addresses, phone numbers, and arbitrary input is enabled.
  ///
  ///This excludes password and credit card information.
  ///When [generalAutofillEnabled] is `false`, no suggestions appear, and no new information is saved.
  ///When [generalAutofillEnabled] is `true`, information is saved, suggestions appear
  ///and clicking on one will populate the form fields.
  ///It will take effect immediately after setting.
  ///
  ///The default value is `true`.
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Windows WebView2 1.0.902.49+ ([Official API - ICoreWebView2Settings4.put_IsGeneralAutofillEnabled](https://learn.microsoft.com/en-us/microsoft-edge/webview2/reference/win32/icorewebview2settings4?view=webview2-1.0.2849.39#put_isgeneralautofillenabled))
  bool? generalAutofillEnabled;

  ///Sets whether Geolocation is enabled. The default is `true`.
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView ([Official API - WebSettings.setGeolocationEnabled](https://developer.android.com/reference/android/webkit/WebSettings?hl=en#setGeolocationEnabled(boolean))):
  ///    - Please note that in order for the Geolocation API to be usable by a page in the WebView, the following requirements must be met: - an application must have permission to access the device location, see [Manifest.permission.ACCESS_COARSE_LOCATION](https://developer.android.com/reference/android/Manifest.permission#ACCESS_COARSE_LOCATION), [Manifest.permission.ACCESS_FINE_LOCATION](https://developer.android.com/reference/android/Manifest.permission#ACCESS_FINE_LOCATION); - an application must provide an implementation of the [CygnusPlatformWebViewCreationParams.onGeolocationPermissionsShowPrompt] callback to receive notifications that a page is requesting access to location via the JavaScript Geolocation API.
  bool? geolocationEnabled;

  ///A Boolean value that determines whether to listen and handle the
  ///[CygnusPlatformWebViewCreationParams.onAcceleratorKeyPressed] event.
  ///
  ///The default value is `false`.
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Windows WebView2
  bool? handleAcceleratorKeyPressed;

  ///Boolean value to enable Hardware Acceleration in the WebView.
  ///The default value is `true`.
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView ([Official API - WebView.setLayerType](https://developer.android.com/reference/android/webkit/WebView#setLayerType(int,%20android.graphics.Paint)))
  bool? hardwareAcceleration;

  ///This property is used to customize the PDF toolbar items.
  ///
  ///By default, it is [CygnusPdfToolbarItems.NONE] and so it displays all of the items.
  ///Changes to this property apply to all CoreWebView2s in the same environment and using the same profile.
  ///Changes to this setting apply only after the next navigation.
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Windows WebView2 1.0.1185.39+ ([Official API - ICoreWebView2Settings7.put_HiddenPdfToolbarItems](https://learn.microsoft.com/en-us/microsoft-edge/webview2/reference/win32/icorewebview2settings7?view=webview2-1.0.2849.39#put_hiddenpdftoolbaritems))
  CygnusPdfToolbarItems? hiddenPdfToolbarItems;

  ///Define whether the horizontal scrollbar should be drawn or not. The default value is `true`.
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView ([Official API - View.setHorizontalScrollBarEnabled](https://developer.android.com/reference/android/view/View#setHorizontalScrollBarEnabled(boolean)))
  ///- iOS WKWebView ([Official API - UIScrollView.showsHorizontalScrollIndicator](https://developer.apple.com/documentation/uikit/uiscrollview/1619380-showshorizontalscrollindicator))
  ///- Web \<iframe\> but requires same origin:
  ///    - It must have the same value of [verticalScrollBarEnabled] to take effect.
  bool? horizontalScrollBarEnabled;

  ///Sets the horizontal scrollbar thumb color.
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView 29+ ([Official API - View.setHorizontalScrollbarThumbDrawable](https://developer.android.com/reference/android/view/View#setHorizontalScrollbarThumbDrawable(android.graphics.drawable.Drawable)))
  Color? horizontalScrollbarThumbColor;

  ///Sets the horizontal scrollbar track color.
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView 29+ ([Official API - View.setHorizontalScrollbarTrackDrawable](https://developer.android.com/reference/android/view/View#setHorizontalScrollbarTrackDrawable(android.graphics.drawable.Drawable)))
  Color? horizontalScrollbarTrackColor;

  ///Specifies a feature policy for the `<iframe>`.
  ///The policy defines what features are available to the `<iframe>` based on the origin of the request
  ///(e.g. access to the microphone, camera, battery, web-share API, etc.).
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Web \<iframe\> ([Official API - iframe.allow](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/iframe#attr-allow))
  String? iframeAllow;

  ///Set to true if the `<iframe>` can activate fullscreen mode by calling the `requestFullscreen()` method.
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Web \<iframe\> ([Official API - iframe.allowfullscreen](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/iframe#attr-allowfullscreen))
  bool? iframeAllowFullscreen;

  ///A string that reflects the `aria-hidden` HTML attribute, indicating whether the element is exposed to an accessibility API.
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Web \<iframe\> ([Official API - iframe.ariaHidden](https://developer.mozilla.org/en-US/docs/Web/Accessibility/ARIA/Attributes/aria-hidden))
  String? iframeAriaHidden;

  ///A Content Security Policy enforced for the embedded resource.
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Web \<iframe\> ([Official API - iframe.csp](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/iframe#attr-csp))
  String? iframeCsp;

  ///A string that reflects the `name` HTML attribute, containing a name by which to refer to the frame.
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Web \<iframe\> ([Official API - iframe.name](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/iframe#attr-name))
  String? iframeName;

  ///A string that reflects the `referrerpolicy` HTML attribute indicating which referrer to use when fetching the linked resource.
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Web \<iframe\> ([Official API - iframe.referrerpolicy](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/iframe#attr-referrerpolicy))
  CygnusReferrerPolicy? iframeReferrerPolicy;

  ///A string that reflects the `role` HTML attribute, containing a WAI-ARIA role for the element.
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Web \<iframe\> ([Official API - iframe.role](https://developer.mozilla.org/en-US/docs/Web/Accessibility/ARIA/Roles))
  String? iframeRole;

  ///Applies extra restrictions to the content in the frame.
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Web \<iframe\> ([Official API - iframe.sandbox](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/iframe#attr-sandbox))
  Set<CygnusSandbox>? iframeSandbox;

  ///Set to `true` if you want that the WebView should always allow scaling of the webpage, regardless of the author's intent.
  ///The ignoresViewportScaleLimits property overrides the `user-scalable` HTML property in a webpage. The default value is `false`.
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- iOS WKWebView ([Official API - WKWebViewConfiguration.ignoresViewportScaleLimits](https://developer.apple.com/documentation/webkit/wkwebviewconfiguration/2274633-ignoresviewportscalelimits))
  bool? ignoresViewportScaleLimits;

  ///Set to `true` to open a browser window with incognito mode. The default value is `false`.
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView:
  ///    - setting this to `true`, it will clear all the cookies of all WebView instances, because there isn't any way to make the website data store non-persistent for the specific WebView instance such as on iOS.
  ///- iOS WKWebView
  ///- macOS WKWebView
  ///- Windows WebView2 ([Official API - ICoreWebView2ControllerOptions.put_IsInPrivateModeEnabled](https://learn.microsoft.com/en-us/microsoft-edge/webview2/reference/win32/icorewebview2controlleroptions?view=webview2-1.0.2792.45#put_isinprivatemodeenabled))
  ///- Linux WPE WebKit ([Official API - webkit_network_session_new_ephemeral](https://wpewebkit.org/reference/stable/wpe-webkit-2.0/ctor.NetworkSession.new_ephemeral.html))
  bool? incognito;

  ///Sets the initial scale for this WebView. 0 means default. The behavior for the default scale depends on the state of [useWideViewPort] and [loadWithOverviewMode].
  ///If the content fits into the WebView control by width, then the zoom is set to 100%. For wide content, the behavior depends on the state of [loadWithOverviewMode].
  ///If its value is true, the content will be zoomed out to be fit by width into the WebView control, otherwise not.
  ///If initial scale is greater than 0, WebView starts with this value as initial scale.
  ///Please note that unlike the scale properties in the viewport meta tag, this method doesn't take the screen density into account.
  ///The default is `0`.
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView ([Official API - WebView.setInitialScale](https://developer.android.com/reference/android/webkit/WebView#setInitialScale(int)))
  int? initialScale;

  ///Set to `false` to be able to listen to also sync `XMLHttpRequest`s at the
  ///[CygnusPlatformWebViewCreationParams.shouldInterceptAjaxRequest] event.
  ///
  ///**NOTE**: Using `false` will cause the `XMLHttpRequest.send()` method for sync
  ///requests to not wait on the JavaScript code the response synchronously,
  ///as if it was an async `XMLHttpRequest`.
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView
  ///- iOS WKWebView
  ///- macOS WKWebView
  bool? interceptOnlyAsyncAjaxRequests;

  ///A Boolean value that determines whether scrolling is disabled in a particular direction.
  ///If this property is `false`, scrolling is permitted in both horizontal and vertical directions.
  ///If this property is `true` and the user begins dragging in one general direction (horizontally or vertically),
  ///the scroll view disables scrolling in the other direction.
  ///If the drag direction is diagonal, then scrolling will not be locked and the user can drag in any direction until the drag completes.
  ///The default value is `false`.
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- iOS WKWebView ([Official API - UIScrollView.isDirectionalLockEnabled](https://developer.apple.com/documentation/uikit/uiscrollview/1619390-isdirectionallockenabled))
  bool? isDirectionalLockEnabled;

  ///Sets whether fullscreen API is enabled or not.
  ///
  ///The default value is `true`.
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- iOS WKWebView 15.4+ ([Official API - WKPreferences.isElementFullscreenEnabled](https://developer.apple.com/documentation/webkit/wkpreferences/3917769-iselementfullscreenenabled))
  ///- macOS WKWebView 12.3+ ([Official API - WKPreferences.isElementFullscreenEnabled](https://developer.apple.com/documentation/webkit/wkpreferences/3917769-iselementfullscreenenabled))
  ///- Linux WPE WebKit ([Official API - WebKitSettings.enable-fullscreen](https://wpewebkit.org/reference/stable/wpe-webkit-2.0/property.Settings.enable-fullscreen.html))
  bool? isElementFullscreenEnabled;

  ///Sets whether the web view's built-in find interaction native UI is enabled or not.
  ///
  ///The default value is `false`.
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- iOS WKWebView 16.0+ ([Official API - WKWebView.isFindInteractionEnabled](https://developer.apple.com/documentation/webkit/wkwebview/4002044-isfindinteractionenabled/))
  bool? isFindInteractionEnabled;

  ///A Boolean value indicating whether warnings should be shown for suspected fraudulent content such as phishing or malware.
  ///According to the official documentation, this feature is currently available in the following region: China.
  ///The default value is `true`.
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- iOS WKWebView 13.0+ ([Official API - WKPreferences.isFraudulentWebsiteWarningEnabled](https://developer.apple.com/documentation/webkit/wkpreferences/3335219-isfraudulentwebsitewarningenable))
  ///- macOS WKWebView 10.15+ ([Official API - WKPreferences.isFraudulentWebsiteWarningEnabled](https://developer.apple.com/documentation/webkit/wkpreferences/3335219-isfraudulentwebsitewarningenable))
  bool? isFraudulentWebsiteWarningEnabled;

  ///Controls whether this WebView is inspectable in Web Inspector.
  ///
  ///The default value is `false`.
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- iOS WKWebView 16.4+ ([Official API - WKWebView.isInspectable](https://developer.apple.com/documentation/webkit/wkwebview/4111163-isinspectable))
  ///- macOS WKWebView 13.3+ ([Official API - WKWebView.isInspectable](https://developer.apple.com/documentation/webkit/wkwebview/4111163-isinspectable))
  ///- Windows WebView2 ([Official API - ICoreWebView2Settings.put_AreDevToolsEnabled](https://learn.microsoft.com/en-us/microsoft-edge/webview2/reference/win32/icorewebview2settings?view=webview2-1.0.2210.55#put_aredevtoolsenabled))
  bool? isInspectable;

  ///A Boolean value that determines whether paging is enabled for the scroll view.
  ///If the value of this property is true, the scroll view stops on multiples of the scroll view’s bounds when the user scrolls.
  ///The default value is `false`.
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- iOS WKWebView ([Official API - UIScrollView.isPagingEnabled](https://developer.apple.com/documentation/uikit/uiscrollview/1619432-ispagingenabled))
  bool? isPagingEnabled;

  ///A Boolean value indicating whether WebKit will apply built-in workarounds (quirks)
  ///to improve compatibility with certain known websites. You can disable site-specific quirks
  ///to help test your website without these workarounds. The default value is `true`.
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- iOS WKWebView 15.4+ ([Official API - WKPreferences.isSiteSpecificQuirksModeEnabled](https://developer.apple.com/documentation/webkit/wkpreferences/3916069-issitespecificquirksmodeenabled))
  ///- macOS WKWebView 12.3+ ([Official API - WKPreferences.isSiteSpecificQuirksModeEnabled](https://developer.apple.com/documentation/webkit/wkpreferences/3916069-issitespecificquirksmodeenabled))
  bool? isSiteSpecificQuirksModeEnabled;

  ///A Boolean value indicating whether text interaction is enabled or not.
  ///The default value is `true`.
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- iOS WKWebView 15.0+ ([Official API - WKPreferences.isTextInteractionEnabled](https://developer.apple.com/documentation/webkit/wkpreferences/3727362-istextinteractionenabled))
  ///- macOS WKWebView 11.3+ ([Official API - WKPreferences.isTextInteractionEnabled](https://developer.apple.com/documentation/webkit/wkpreferences/3727362-istextinteractionenabled))
  bool? isTextInteractionEnabled;

  ///A Boolean value that determines whether user events are ignored and removed from the event queue.
  ///
  ///The default value is `true`.
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView
  ///- iOS WKWebView ([Official API - UIView.isUserInteractionEnabled](https://developer.apple.com/documentation/uikit/uiview/1622577-isuserinteractionenabled))
  bool? isUserInteractionEnabled;

  ///Sets whether Intelligent Tracking Prevention (ITP) is enabled.
  ///
  ///When ITP is enabled, resource load statistics are collected and used to decide
  ///whether to allow or block third-party cookies and prevent user tracking.
  ///This is similar to Safari's tracking prevention feature.
  ///
  ///**IMPORTANT NOTE**: When ITP is enabled, the cookie accept policy
  ///`WEBKIT_COOKIE_POLICY_ACCEPT_NO_THIRD_PARTY` is ignored and
  ///`WEBKIT_COOKIE_POLICY_ACCEPT_ALWAYS` is used instead.
  ///
  ///This is a session-level setting that should be set during WebView initialization.
  ///
  ///The default value is `false`.
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Linux WPE WebKit 2.40+ ([Official API - webkit_network_session_set_itp_enabled](https://wpewebkit.org/reference/stable/wpe-webkit-2.0/method.NetworkSession.set_itp_enabled.html)):
  ///    - This is a session-level setting. When enabled, ACCEPT_NO_THIRD_PARTY cookie policy is overridden to ACCEPT_ALWAYS.
  bool? itpEnabled;

  ///Set to `false` to disable the JavaScript Bridge completely.
  ///This will affect also all the internal plugin [CygnusUserScript]s
  ///that are using the JavaScript Bridge to work.
  ///
  ///**NOTE**: setting or changing this value after the WebView has been created won't have any effect.
  ///It should be set when initializing the WebView through [CygnusPlatformWebViewCreationParams.initialSettings] parameter.
  ///
  ///The default value is `true`.
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView
  ///- iOS WKWebView
  ///- macOS WKWebView
  ///- Windows WebView2
  ///- Web \<iframe\> but requires same origin
  bool? javaScriptBridgeEnabled;

  ///Set to `true` to allow the JavaScript Bridge only on the main frame.
  ///If [pluginScriptsForMainFrameOnly] is present, then this value will override
  ///it only for the JavaScript Bridge internal plugin.
  ///
  ///**NOTE**: setting or changing this value after the WebView has been created won't have any effect.
  ///It should be set when initializing the WebView through [CygnusPlatformWebViewCreationParams.initialSettings] parameter.
  ///
  ///The default value is `false`.
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView
  ///- iOS WKWebView
  ///- macOS WKWebView
  ///- Windows WebView2
  bool? javaScriptBridgeForMainFrameOnly;

  ///A [Set] of patterns that will be used to match the allowed origins where
  ///the JavaScript Bridge could be used.
  ///If [pluginScriptsOriginAllowList] is present, then this value will override
  ///it only for the JavaScript Bridge internal plugin.
  ///Adding `'*'` as an allowed origin or setting this to `null`, it means it will allow every origin.
  ///Instead, an empty [Set] will block every origin and, in this case,
  ///it will force the behaviour of the [javaScriptBridgeEnabled] parameter,
  ///as it was set to `false`.
  ///
  ///**NOTE**: setting or changing this value after the WebView has been created won't have any effect.
  ///It should be set when initializing the WebView through [CygnusPlatformWebViewCreationParams.initialSettings] parameter.
  ///
  ///**NOTE for Android**: each origin pattern MUST follow the table rule of [CygnusPlatformWebViewController.addWebMessageListener].
  ///
  ///**NOTE for iOS, macOS, Windows**: each origin pattern will be used as a
  ///Regular Expression Pattern that will be used on JavaScript side using [RegExp](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/RegExp).
  ///
  ///The default value is `null` and will allow every origin.
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView
  ///- iOS WKWebView
  ///- macOS WKWebView
  ///- Windows WebView2
  ///- Web \<iframe\> but requires same origin
  Set<String>? javaScriptBridgeOriginAllowList;

  ///Sets whether JavaScript can access the clipboard.
  ///When enabled, JavaScript can read from and write to the system clipboard.
  ///
  ///The default value is `false`.
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Linux WPE WebKit ([Official API - WebKitSettings.javascript-can-access-clipboard](https://wpewebkit.org/reference/stable/wpe-webkit-2.0/property.Settings.javascript-can-access-clipboard.html))
  bool? javaScriptCanAccessClipboard;

  ///Set to `true` to allow JavaScript open windows without user interaction. The default value is `false`.
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView ([Official API - WebSettings.setJavaScriptCanOpenWindowsAutomatically](https://developer.android.com/reference/android/webkit/WebSettings?hl=en#setJavaScriptCanOpenWindowsAutomatically(boolean)))
  ///- iOS WKWebView ([Official API - WKPreferences.javaScriptCanOpenWindowsAutomatically](https://developer.apple.com/documentation/webkit/wkpreferences/1536573-javascriptcanopenwindowsautomati/))
  ///- macOS WKWebView ([Official API - WKPreferences.javaScriptCanOpenWindowsAutomatically](https://developer.apple.com/documentation/webkit/wkpreferences/1536573-javascriptcanopenwindowsautomati/))
  ///- Web \<iframe\> but requires same origin
  bool? javaScriptCanOpenWindowsAutomatically;

  ///Set to `true` to enable JavaScript. The default value is `true`.
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView ([Official API - WebSettings.setJavaScriptEnabled](https://developer.android.com/reference/android/webkit/WebSettings?hl=en#setJavaScriptEnabled(boolean)))
  ///- iOS WKWebView ([Official API - WKWebpagePreferences.allowsContentJavaScript](https://developer.apple.com/documentation/webkit/wkwebpagepreferences/3552422-allowscontentjavascript/))
  ///- macOS WKWebView ([Official API - WKWebpagePreferences.allowsContentJavaScript](https://developer.apple.com/documentation/webkit/wkwebpagepreferences/3552422-allowscontentjavascript/))
  ///- Web \<iframe\>
  ///- Windows WebView2 ([Official API - ICoreWebView2Settings.put_IsScriptEnabled](https://learn.microsoft.com/en-us/microsoft-edge/webview2/reference/win32/icorewebview2settings?view=webview2-1.0.2210.55#put_isscriptenabled))
  bool? javaScriptEnabled;

  ///Set to `true` to allow to execute the JavaScript Handlers only on the main frame.
  ///This will affect also the internal JavaScript Handlers used by the plugin itself.
  ///The default value is `false`.
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView
  ///- iOS WKWebView
  ///- macOS WKWebView
  ///- Windows WebView2
  bool? javaScriptHandlersForMainFrameOnly;

  ///A [Set] of Regular Expression Patterns that will be used on native side to match the allowed origins
  ///that are able to execute the JavaScript Handlers defined for the current WebView.
  ///This will affect also the internal JavaScript Handlers used by the plugin itself.
  ///
  ///An empty [Set] will block every origin.
  ///
  ///The default value is `null` and will allow every origin.
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView
  ///- iOS WKWebView
  ///- macOS WKWebView
  ///- Windows WebView2
  ///- Web \<iframe\> but requires same origin
  Set<String>? javaScriptHandlersOriginAllowList;

  ///Sets the key repeat delay in milliseconds.
  ///This is the time a key must be held before it starts repeating.
  ///
  ///This is a WPE Platform setting that affects the entire display.
  ///
  ///The default value is `null` (uses system default, typically 400ms).
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Linux WPE WebKit ([Official API - WPESettings.key-repeat-delay](https://wpewebkit.org/reference/stable/wpe-platform-2.0/class.Settings.html)):
  ///    - This is a WPE Platform display-level setting. Value is in milliseconds.
  int? keyRepeatDelay;

  ///Sets the key repeat interval in milliseconds.
  ///This is the time between repeated key events when a key is held down.
  ///
  ///This is a WPE Platform setting that affects the entire display.
  ///
  ///The default value is `null` (uses system default, typically 80ms).
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Linux WPE WebKit ([Official API - WPESettings.key-repeat-interval](https://wpewebkit.org/reference/stable/wpe-platform-2.0/class.Settings.html)):
  ///    - This is a WPE Platform display-level setting. Value is in milliseconds.
  int? keyRepeatInterval;

  ///Set to `false` to stop the plugin keeping the focused input element visible when the
  ///soft keyboard opens. The default value is `true`.
  ///
  ///**The two platforms reach that outcome through different mechanisms.** The guarantee
  ///the option makes -- the app writes no keyboard-handling code of its own -- is the same
  ///on both, but what the plugin actually does is not, so do not carry conclusions across.
  ///
  ///**Android: suppress and shift.** The plugin consumes the IME window insets before they
  ///reach the WebView. That stops Chromium from running its own
  ///`ScrollFocusedEditableIntoView`, which otherwise competes with any avoidance the app
  ///performs and produces a doubled-then-reset jump. The plugin then performs the shift
  ///itself, so it is the only actor.
  ///
  ///**iOS: leave WebKit alone and complete it.** WebKit already reveals the focused field
  ///correctly, and there is no public API to suppress it, so the plugin does not try. It
  ///supplies the two pieces WebKit leaves out: the keyboard inset is kept in place so the
  ///document has room to scroll (without it a short page cannot scroll at all and the field
  ///stays covered), and the scroll position captured when the keyboard appeared is restored
  ///when it hides -- WebKit never undoes its own scroll, leaving the page displaced.
  ///Measured on iPad / iOS 26: the page was left scrolled by 204px and 265px across two
  ///dismissal paths.
  ///
  ///Consequently `visualViewport` **keeps reporting the keyboard on iOS** (see the Android
  ///note below, which does not apply there), and the WebView itself is never moved.
  ///
  ///With this enabled the app no longer needs to shift the WebView widget itself, nor build
  ///its own JS-to-native bridge reporting the focused element position.
  ///
  ///**Set `Scaffold.resizeToAvoidBottomInset` to `false` as well.** The plugin cannot do it
  ///for you: that resize is Flutter framework layout driven by the engine's `viewInsets`,
  ///a separate channel from the Android `View` insets this option intercepts, so it cannot
  ///be suppressed from below.
  ///
  ///It is worth doing. Leaving it at its default `true` still works -- the field is kept
  ///visible either way -- but the framework then relayouts the WebView on every frame of the
  ///keyboard animation. Measured over five keyboard cycles on a 1080x2400 device:
  ///
  ///| Scaffold resize | janky frames | 95th percentile |
  ///|---|---|---|
  ///| `true` (default) | 4.41% | 19ms |
  ///| `false` | 0.00% | 10ms |
  ///
  ///Those numbers cover the Flutter layer only; under hybrid composition the WebView renders
  ///into its own surface, which `gfxinfo` does not measure.
  ///
  ///**On iOS, only pair it with `false` from 17.2 up (see the version requirements below).**
  ///Below that the plugin does nothing there, so an unconditional
  ///`resizeToAvoidBottomInset: false` leaves *no* actor performing avoidance: the framework
  ///has been told to stand down and the plugin never stood up. The focused field is then
  ///simply covered by the keyboard -- a worse outcome than not using this option at all, and
  ///a silent one, since nothing throws. Either leave `resizeToAvoidBottomInset` at its
  ///default `true` on those versions or set it from the OS version. Android carries no such
  ///caveat: the option works on every version the plugin supports.
  ///
  ///When this option is `false` the plugin does not install the insets listener at all, so
  ///behaviour is identical to not having this option.
  ///
  ///On Android it works on every supported version, but through two different mechanisms.
  ///From API 30 the keyboard height is read from the distinct IME inset type, frame by frame
  ///through the insets animation. Below that no such type exists, and the window insets that
  ///would carry it are consumed by the Flutter embedding before reaching the WebView, so the
  ///height comes from the framework instead -- the Dart side of the plugin observes
  ///`didChangeMetrics` and forwards `FlutterView.viewInsets.bottom`, which also fires per
  ///frame. The other half of the mechanism differs as well: below API 30 Chromium does not
  ///react to the keyboard, so nothing is suppressed and the plugin only performs the shift.
  ///On iOS it requires 17.2 or above, which is where the plugin observes the keyboard
  ///notifications this option builds on.
  ///
  ///**Android only -- can only be enabled through the initial settings.** Turning it on
  ///later through `setSettings` is ignored and logs a warning. The script that reports the
  ///focused element is registered while the WebView is being prepared, and reloading only
  ///re-injects scripts that were already registered, so it cannot be added afterwards.
  ///Applying only the inset interception would silence Chromium with nothing left to move
  ///the field into view, which is worse than leaving the option off. Turning it *off* at
  ///runtime does work and restores the original behaviour.
  ///
  ///**Android only -- affects `visualViewport` in the page.** The WebView is never told the
  ///keyboard is there: from API 30 because the plugin consumes the IME insets, and below
  ///that because they do not reach it in the first place (measured on API 29, the system
  ///window and stable bottoms both stay 0 for the whole keyboard cycle). Either way,
  ///`window.visualViewport` keeps reporting the same `height` and `offsetTop` while the
  ///keyboard is open. Page code that detects the keyboard by watching `visualViewport`
  ///shrink will silently stop detecting it -- no error, it simply never fires. Native text
  ///selection handles, the selection toolbar and `<select>` popups are unaffected: the
  ///system positions those from the real IME state, not from the insets delivered to this
  ///View.
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView
  ///- iOS WKWebView
  bool? keyboardAvoidance;

  ///Sets the underlying layout algorithm. This will cause a re-layout of the WebView.
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView ([Official API - WebSettings.setLayoutAlgorithm](https://developer.android.com/reference/android/webkit/WebSettings?hl=en#setLayoutAlgorithm(android.webkit.WebSettings.CygnusLayoutAlgorithm)))
  CygnusLayoutAlgorithm? layoutAlgorithm;

  ///A Boolean value that indicates whether the web view limits navigation to pages within the app’s domain.
  ///Check [App-Bound Domains](https://webkit.org/blog/10882/app-bound-domains/) for more details.
  ///The default value is `false`.
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- iOS WKWebView 14.0+ ([Official API - WKWebViewConfiguration.limitsNavigationsToAppBoundDomains](https://developer.apple.com/documentation/webkit/wkwebviewconfiguration/3585117-limitsnavigationstoappbounddomai))
  ///- macOS WKWebView 11.0+ ([Official API - WKWebViewConfiguration.limitsNavigationsToAppBoundDomains](https://developer.apple.com/documentation/webkit/wkwebviewconfiguration/3585117-limitsnavigationstoappbounddomai))
  bool? limitsNavigationsToAppBoundDomains;

  ///Sets whether the WebView loads pages in overview mode, that is, zooms out the content to fit on screen by width.
  ///This setting is taken into account when the content width is greater than the width of the WebView control, for example, when [useWideViewPort] is enabled.
  ///The default value is `false`.
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView ([Official API - WebSettings.setLoadWithOverviewMode](https://developer.android.com/reference/android/webkit/WebSettings?hl=en#setLoadWithOverviewMode(boolean)))
  bool? loadWithOverviewMode;

  ///Sets whether the WebView should load image resources. Note that this method controls loading of all images, including those embedded using the data URI scheme.
  ///Note that if the value of this setting is changed from false to true, all images resources referenced by content currently displayed by the WebView are loaded automatically.
  ///The default value is `true`.
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView ([Official API - WebSettings.setLoadsImagesAutomatically](https://developer.android.com/reference/android/webkit/WebSettings?hl=en#setLoadsImagesAutomatically(boolean)))
  ///- Linux WPE WebKit ([Official API - WebKitSettings.auto-load-images](https://wpewebkit.org/reference/stable/wpe-webkit-2.0/property.Settings.auto-load-images.html))
  bool? loadsImagesAutomatically;

  ///Set maximum viewport inset to the largest inset a webpage may experience in your app's maximally expanded UI configuration.
  ///Values must be either zero or positive. It must be larger than [minimumViewportInset].
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- iOS WKWebView 15.5+ ([Official API - WKWebView.setMinimumViewportInset](https://developer.apple.com/documentation/webkit/wkwebview/3974127-setminimumviewportinset/))
  EdgeInsets? maximumViewportInset;

  ///A floating-point value that specifies the maximum scale factor that can be applied to the scroll view's content.
  ///This value determines how large the content can be scaled.
  ///It must be greater than the minimum zoom scale for zooming to be enabled.
  ///The default value is `1.0`.
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- iOS WKWebView ([Official API - UIScrollView.maximumZoomScale](https://developer.apple.com/documentation/uikit/uiscrollview/1619408-maximumzoomscale))
  double? maximumZoomScale;

  ///Sets the media content types that require hardware support.
  ///This is a comma-separated list of media content types.
  ///
  ///The default value is `null` (uses system default).
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Linux WPE WebKit 2.30+ ([Official API - WebKitSettings.media-content-types-requiring-hardware-support](https://wpewebkit.org/reference/stable/wpe-webkit-2.0/property.Settings.media-content-types-requiring-hardware-support.html)):
  ///    - Requires WPE WebKit 2.30 or later
  String? mediaContentTypesRequiringHardwareSupport;

  ///Set to `true` to prevent HTML5 audio or video from autoplaying. The default value is `true`.
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView ([Official API - WebSettings.setMediaPlaybackRequiresUserGesture](https://developer.android.com/reference/android/webkit/WebSettings?hl=en#setMediaPlaybackRequiresUserGesture(boolean)))
  ///- iOS WKWebView ([Official API - WKWebViewConfiguration.mediaTypesRequiringUserActionForPlayback](https://developer.apple.com/documentation/webkit/wkwebviewconfiguration/1851524-mediatypesrequiringuseractionfor))
  ///- macOS WKWebView 10.12+ ([Official API - WKWebViewConfiguration.mediaTypesRequiringUserActionForPlayback](https://developer.apple.com/documentation/webkit/wkwebviewconfiguration/1851524-mediatypesrequiringuseractionfor))
  bool? mediaPlaybackRequiresUserGesture;

  ///The media type for the contents of the web view.
  ///When the value of this property is `null`, the web view derives the current media type from the CSS media property of its content.
  ///If you assign a value other than `null` to this property, the web view uses the value you provide instead.
  ///The default value of this property is `null`.
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- iOS WKWebView 14.0+ ([Official API - WKWebView.mediaType](https://developer.apple.com/documentation/webkit/wkwebview/3516410-mediatype))
  ///- macOS WKWebView 11.0+ ([Official API - WKWebView.mediaType](https://developer.apple.com/documentation/webkit/wkwebview/3516410-mediatype))
  String? mediaType;

  ///Sets the minimum font size. The default value is `8` for Android, `0` for iOS.
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView ([Official API - WebSettings.setMinimumFontSize](https://developer.android.com/reference/android/webkit/WebSettings?hl=en#setMinimumFontSize(int)))
  ///- iOS WKWebView ([Official API - WKPreferences.minimumFontSize](https://developer.apple.com/documentation/webkit/wkpreferences/1537155-minimumfontsize/))
  ///- macOS WKWebView ([Official API - WKPreferences.minimumFontSize](https://developer.apple.com/documentation/webkit/wkpreferences/1537155-minimumfontsize/))
  int? minimumFontSize;

  ///Sets the minimum logical font size. The default is `8`.
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView ([Official API - WebSettings.setMinimumLogicalFontSize](https://developer.android.com/reference/android/webkit/WebSettings?hl=en#setMinimumLogicalFontSize(int)))
  int? minimumLogicalFontSize;

  ///Set minimum viewport inset to the smallest inset a webpage may experience in your app's maximally collapsed UI configuration.
  ///Values must be either zero or positive. It must be smaller than [maximumViewportInset].
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- iOS WKWebView 15.5+ ([Official API - WKWebView.setMinimumViewportInset](https://developer.apple.com/documentation/webkit/wkwebview/3974127-setminimumviewportinset/))
  EdgeInsets? minimumViewportInset;

  ///A floating-point value that specifies the minimum scale factor that can be applied to the scroll view's content.
  ///This value determines how small the content can be scaled.
  ///The default value is `1.0`.
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- iOS WKWebView ([Official API - UIScrollView.minimumZoomScale](https://developer.apple.com/documentation/uikit/uiscrollview/1619428-minimumzoomscale))
  double? minimumZoomScale;

  ///Configures the WebView's behavior when a secure origin attempts to load a resource from an insecure origin.
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView 21+ ([Official API - WebSettings.setMixedContentMode](https://developer.android.com/reference/android/webkit/WebSettings?hl=en#setMixedContentMode(int)))
  CygnusMixedContentMode? mixedContentMode;

  ///Tells the WebView whether it needs to set a node. The default value is `true`.
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView ([Official API - WebSettings.setNeedInitialFocus](https://developer.android.com/reference/android/webkit/WebSettings?hl=en#setNeedInitialFocus(boolean)))
  bool? needInitialFocus;

  ///Informs WebView of the network state.
  ///This is used to set the JavaScript property `window.navigator.isOnline` and generates the online/offline event as specified in HTML5, sec. 5.7.7.
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView ([Official API - WebView.setNetworkAvailable](https://developer.android.com/reference/android/webkit/WebView#setNetworkAvailable(boolean)))
  bool? networkAvailable;

  ///Enables web pages to use the `app-region` CSS style.
  ///
  ///Disabling/Enabling the [nonClientRegionSupportEnabled] takes effect after the next navigation.
  ///
  ///When this property is `true`, then all the non-client region features will be enabled:
  ///Draggable Regions will be enabled, they are regions on a webpage that are marked with the CSS attribute `app-region: drag/no-drag`.
  ///When set to drag, these regions will be treated like the window's title bar,
  ///supporting dragging of the entire WebView and its host app window;
  ///the system menu shows upon right click, and a double click will trigger maximizing/restoration of the window size.
  ///
  ///When set to `false`, all non-client region support will be disabled.
  ///The `app-region` CSS style will be ignored on web pages.
  ///
  ///The default value is `false`.
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Windows WebView2 1.0.2420.47+ ([Official API - ICoreWebView2Settings9.put_IsNonClientRegionSupportEnabled](https://learn.microsoft.com/en-us/microsoft-edge/webview2/reference/win32/icorewebview2settings9?view=webview2-1.0.2849.39#put_isnonclientregionsupportenabled))
  bool? nonClientRegionSupportEnabled;

  ///Sets whether this WebView should raster tiles when it is offscreen but attached to a window.
  ///Turning this on can avoid rendering artifacts when animating an offscreen WebView on-screen.
  ///Offscreen WebViews in this mode use more memory. The default value is `false`.
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView 23+ ([Official API - WebSettings.setOffscreenPreRaster](https://developer.android.com/reference/android/webkit/WebSettings?hl=en#setOffscreenPreRaster(boolean)))
  bool? offscreenPreRaster;

  ///Sets the WebView's over-scroll mode.
  ///Setting the over-scroll mode of a WebView will have an effect only if the WebView is capable of scrolling.
  ///The default value is [CygnusOverScrollMode.IF_CONTENT_SCROLLS].
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView ([Official API - View.setOverScrollMode](https://developer.android.com/reference/android/view/View#setOverScrollMode(int)))
  CygnusOverScrollMode? overScrollMode;

  ///The scale factor by which the web view scales content relative to its bounds.
  ///The default value of this property is `1.0`, which displays the content without any scaling.
  ///Changing the value of this property is equivalent to setting the CSS `zoom` property on all page content.
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- iOS WKWebView 14.0+ ([Official API - WKWebView.pageZoom](https://developer.apple.com/documentation/webkit/wkwebview/3516411-pagezoom))
  ///- macOS WKWebView 11.0+ ([Official API - WKWebView.pageZoom](https://developer.apple.com/documentation/webkit/wkwebview/3516411-pagezoom))
  double? pageZoom;

  ///Specifies whether autosave for password information is enabled.
  ///
  ///The [passwordAutosaveEnabled] property behaves independently of the IsGeneralAutofillEnabled property.
  ///When [passwordAutosaveEnabled] is `false`, no new password data is saved and no Save/Update Password prompts are displayed.
  ///However, if there was password data already saved before disabling this setting, then that password
  ///information is auto-populated, suggestions are shown and clicking on one will populate the fields.
  ///When [passwordAutosaveEnabled] is `true`, password information is auto-populated,
  ///suggestions are shown and clicking on one will populate the fields,
  ///new data is saved, and a Save/Update Password prompt is displayed.
  ///It will take effect immediately after setting.
  ///
  ///The default value is `false`.
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Windows WebView2 1.0.902.49+ ([Official API - ICoreWebView2Settings4.put_IsPasswordAutosaveEnabled](https://learn.microsoft.com/en-us/microsoft-edge/webview2/reference/win32/icorewebview2settings4?view=webview2-1.0.2849.39#put_ispasswordautosaveenabled))
  bool? passwordAutosaveEnabled;

  ///Sets the pictograph font family name.
  ///The pictograph font family is used for rendering pictograph characters (emoji).
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Linux WPE WebKit ([Official API - WebKitSettings.pictograph-font-family](https://wpewebkit.org/reference/stable/wpe-webkit-2.0/property.Settings.pictograph-font-family.html))
  String? pictographFontFamily;

  ///Pinch-zoom, referred to as "Page Scale" zoom, is performed as a post-rendering step,
  ///it changes the page scale factor property and scales the surface the web page
  ///is rendered onto when user performs a pinch zooming action.
  ///
  ///It does not change the layout but rather changes the viewport and clips the
  ///web content, the content outside of the viewport isn't visible onscreen and users can't reach this content using mouse.
  ///
  ///The [pinchZoomEnabled] property enables or disables the ability of the end user
  ///to use a pinching motion on touch input enabled devices to scale the web content in the WebView2.
  ///When set to `false`, the end user cannot pinch zoom after the next navigation.
  ///Disabling/Enabling [pinchZoomEnabled] only affects the end user's ability to
  ///use pinch motions and does not change the page scale factor.
  ///This API only affects the Page Scale zoom and has no effect on the existing
  ///browser zoom properties or other end user mechanisms for zooming.
  ///
  ///The default value is `true`.
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Windows WebView2 1.0.902.49+ ([Official API - ICoreWebView2Settings5.put_IsPinchZoomEnabled](https://learn.microsoft.com/en-us/microsoft-edge/webview2/reference/win32/icorewebview2settings5?view=webview2-1.0.2849.39#put_ispinchzoomenabled))
  bool? pinchZoomEnabled;

  ///Set to `true` to allow internal plugin [CygnusUserScript]s only on the main frame.
  ///
  ///**NOTE**: If [javaScriptBridgeForMainFrameOnly] is not present, this value will affect also the JavaScript Bridge internal plugin.
  ///Also, setting or changing this value after the WebView has been created won't have any effect.
  ///It should be set when initializing the WebView through [CygnusPlatformWebViewCreationParams.initialSettings] parameter.
  ///
  ///The default value is `false`.
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView
  ///- iOS WKWebView
  ///- macOS WKWebView
  ///- Windows WebView2
  bool? pluginScriptsForMainFrameOnly;

  ///A [Set] of patterns that will be used to match the allowed origins
  ///that are able to load all the internal plugin [CygnusUserScript]s used by the plugin itself.
  ///Adding `'*'` as an allowed origin or setting this to `null`, it means it will allow every origin.
  ///Instead, an empty [Set] will block every origin.
  ///
  ///**NOTE**: If [javaScriptBridgeOriginAllowList] is not present, this value will affect also the JavaScript Bridge internal plugin.
  ///Also, setting or changing this value after the WebView has been created won't have any effect.
  ///It should be set when initializing the WebView through [CygnusPlatformWebViewCreationParams.initialSettings] parameter.
  ///
  ///**NOTE for Android**: each origin pattern MUST follow the table rule of [CygnusPlatformWebViewController.addWebMessageListener].
  ///
  ///**NOTE for iOS, macOS, Windows**: each origin pattern will be used as a
  ///Regular Expression Pattern that will be used on JavaScript side using [RegExp](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/RegExp).
  ///
  ///The default value is `null` and will allow every origin.
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView
  ///- iOS WKWebView
  ///- macOS WKWebView
  ///- Windows WebView2
  Set<String>? pluginScriptsOriginAllowList;

  ///Sets the content mode that the WebView needs to use when loading and rendering a webpage. The default value is [CygnusUserPreferredContentMode.RECOMMENDED].
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView
  ///- iOS WKWebView 13.0+ ([Official API - WKWebpagePreferences.preferredContentMode](https://developer.apple.com/documentation/webkit/wkwebpagepreferences/3194426-preferredcontentmode/))
  ///- macOS WKWebView 10.15+ ([Official API - WKWebpagePreferences.preferredContentMode](https://developer.apple.com/documentation/webkit/wkwebpagepreferences/3194426-preferredcontentmode/))
  CygnusUserPreferredContentMode? preferredContentMode;

  ///Regular expression used on native side by the [CygnusPlatformWebViewCreationParams.shouldOverrideUrlLoading]
  ///event to allow navigation requests synchronously.
  ///If the url request match the regular expression, then the request is allowed automatically,
  ///and the [CygnusPlatformWebViewCreationParams.shouldOverrideUrlLoading] event will not be fired.
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView
  String? regexToAllowSyncUrlLoading;

  ///Regular expression used on native side by the [CygnusPlatformWebViewCreationParams.shouldOverrideUrlLoading]
  ///event to cancel navigation requests for frames that are not the main frame.
  ///If the url request of a sub-frame matches the regular expression, then the request of that sub-frame is canceled.
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView
  String? regexToCancelSubFramesLoading;

  ///Sets the renderer priority policy for this WebView.
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView ([Official API - WebView.setRendererPriorityPolicy](https://developer.android.com/reference/android/webkit/WebView#setRendererPriorityPolicy(int,%20boolean)))
  CygnusRendererPriorityPolicy? rendererPriorityPolicy;

  ///[reputationCheckingRequired] is used to control whether SmartScreen enabled or not.
  ///
  ///SmartScreen helps webviews identify reported phishing and malware websites and also helps users make informed decisions about downloads.
  ///SmartScreen is enabled or disabled for all CoreWebView2s using the same user data folder.
  ///If [reputationCheckingRequired] is true for any CoreWebView2 using the same user data folder, then SmartScreen is enabled.
  ///If [reputationCheckingRequired] is false for all CoreWebView2 using the same user data folder, then SmartScreen is disabled.
  ///When it is changed, the change will be applied to all WebViews using the same user data folder on the next navigation or download.
  ///If the newly created CoreWebview2 does not set SmartScreen to `false`,
  ///when navigating(Such as Navigate(), LoadDataUrl(), ExecuteScript(), etc.), the default value will be applied to all CoreWebview2 using the same user data folder.
  ///SmartScreen of WebView2 apps can be controlled by Windows system setting "SmartScreen for Microsoft Edge", specially,
  ///for WebView2 in Windows Store apps, SmartScreen is controlled by another Windows system setting "SmartScreen for Microsoft Store apps".
  ///When the Windows setting is enabled, the SmartScreen operates under the control of the [reputationCheckingRequired].
  ///When the Windows setting is disabled, the SmartScreen will be disabled regardless of the [reputationCheckingRequired] value set in WebView2 apps.
  ///In other words, under this circumstance the value of [reputationCheckingRequired] will be saved but overridden by system setting.
  ///Upon re-enabling the Windows setting, the CoreWebview2 will reference the [reputationCheckingRequired] to determine the SmartScreen status.
  ///
  ///The default value is `true`.
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Windows WebView2 1.0.1722.45+ ([Official API - ICoreWebView2Settings8.put_IsReputationCheckingRequired](https://learn.microsoft.com/en-us/microsoft-edge/webview2/reference/win32/icorewebview2settings8?view=webview2-1.0.2849.39#put_isreputationcheckingrequired))
  bool? reputationCheckingRequired;

  ///Set an allow-list of origins to receive the X-Requested-With HTTP header from the WebView owning the passed [CygnusWebViewSettings].
  ///
  ///Historically, this header was sent on all requests from WebView, containing the app package name of the embedding app. Depending on the version of installed WebView, this may no longer be the case, as the header was deprecated in late 2022, and its use discontinued.
  ///
  ///Apps can use this method to restore the legacy behavior for servers that still rely on the deprecated header, but it should not be used to identify the webview to first-party servers under the control of the app developer.
  ///
  ///The format of the strings in the allow-list follows the origin rules of [CygnusPlatformWebViewController.addWebMessageListener].
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView ([Official API - WebSettingsCompat.setRequestedWithHeaderOriginAllowList](https://developer.android.com/reference/androidx/webkit/WebSettingsCompat#setRequestedWithHeaderOriginAllowList(android.webkit.WebSettings,java.util.Set%3Cjava.lang.String%3E))):
  ///    - available on Android only if [CygnusWebViewFeature.REQUESTED_WITH_HEADER_ALLOW_LIST] feature is supported.
  Set<String>? requestedWithHeaderOriginAllowList;

  ///List of custom schemes that the WebView must handle. Use the [CygnusPlatformWebViewCreationParams.onLoadResourceWithCustomScheme] event to intercept resource requests with custom scheme.
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView
  ///- iOS WKWebView 11.0+
  ///- macOS WKWebView 10.13+
  List<String>? resourceCustomSchemes;

  ///Sets whether Safe Browsing is enabled. Safe Browsing allows WebView to protect against malware and phishing attacks by verifying the links.
  ///Safe Browsing is enabled by default for devices which support it.
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView 26+ ([Official API - WebSettings.setSafeBrowsingEnabled](https://developer.android.com/reference/android/webkit/WebSettings?hl=en#setSafeBrowsingEnabled(boolean)))
  bool? safeBrowsingEnabled;

  ///Sets the sans-serif font family name. The default value is `"sans-serif"`.
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView ([Official API - WebSettings.setSansSerifFontFamily](https://developer.android.com/reference/android/webkit/WebSettings?hl=en#setSansSerifFontFamily(java.lang.String)))
  ///- Linux WPE WebKit ([Official API - WebKitSettings.sans-serif-font-family](https://wpewebkit.org/reference/stable/wpe-webkit-2.0/property.Settings.sans-serif-font-family.html))
  String? sansSerifFontFamily;

  ///Sets whether the WebView should save form data. In Android O, the platform has implemented a fully functional Autofill feature to store form data.
  ///Therefore, the Webview form data save feature is disabled. Note that the feature will continue to be supported on older versions of Android as before.
  ///The default value is `true`.
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView ([Official API - WebSettings.setSaveFormData](https://developer.android.com/reference/android/webkit/WebSettings?hl=en#setSaveFormData(boolean)))
  @Deprecated('')
  bool? saveFormData;

  ///Defines the delay in milliseconds that a scrollbar waits before fade out.
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView ([Official API - View.setScrollBarDefaultDelayBeforeFade](https://developer.android.com/reference/android/view/View#setScrollBarDefaultDelayBeforeFade(int)))
  int? scrollBarDefaultDelayBeforeFade;

  ///Defines the scrollbar fade duration in milliseconds.
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView ([Official API - View.setScrollBarFadeDuration](https://developer.android.com/reference/android/view/View#setScrollBarFadeDuration(int)))
  int? scrollBarFadeDuration;

  ///Specifies the style of the scrollbars. The scrollbars can be overlaid or inset.
  ///When inset, they add to the padding of the view. And the scrollbars can be drawn inside the padding area or on the edge of the view.
  ///For example, if a view has a background drawable and you want to draw the scrollbars inside the padding specified by the drawable,
  ///you can use SCROLLBARS_INSIDE_OVERLAY or SCROLLBARS_INSIDE_INSET. If you want them to appear at the edge of the view, ignoring the padding,
  ///then you can use SCROLLBARS_OUTSIDE_OVERLAY or SCROLLBARS_OUTSIDE_INSET.
  ///The default value is [CygnusScrollBarStyle.SCROLLBARS_INSIDE_OVERLAY].
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView ([Official API - WebView.setScrollBarStyle](https://developer.android.com/reference/android/webkit/WebView#setScrollBarStyle(int)))
  CygnusScrollBarStyle? scrollBarStyle;

  ///The multiplier applied to the scroll amount for the WebView.
  ///
  ///This value determines how much the content will scroll in response to user input.
  ///A higher value means faster scrolling, while a lower value means slower scrolling.
  ///
  ///**Applies to wheel input only.** Trackpad gestures are handed to the WebView as a touch
  ///contact and never pass through this: their scroll distance follows the actual movement of
  ///the fingers, and scaling it would misreport how fast they moved, distorting the momentum
  ///the browser derives from it.
  ///
  ///The default value is `1`.
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Windows WebView2
  int? scrollMultiplier;

  ///Defines whether scrollbars will fade when the view is not scrolling.
  ///The default value is `true`.
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView ([Official API - View.setScrollbarFadingEnabled](https://developer.android.com/reference/android/view/View#setScrollbarFadingEnabled(boolean)))
  bool? scrollbarFadingEnabled;

  ///A Boolean value that controls whether the scroll-to-top gesture is enabled.
  ///The scroll-to-top gesture is a tap on the status bar. When a user makes this gesture,
  ///the system asks the scroll view closest to the status bar to scroll to the top.
  ///The default value is `true`.
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- iOS WKWebView ([Official API - UIScrollView.scrollsToTop](https://developer.apple.com/documentation/uikit/uiscrollview/1619421-scrollstotop))
  bool? scrollsToTop;

  ///The level of granularity with which the user can interactively select content in the web view.
  ///The default value is [CygnusSelectionGranularity.DYNAMIC].
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- iOS WKWebView ([Official API - WKWebViewConfiguration.selectionGranularity](https://developer.apple.com/documentation/webkit/wkwebviewconfiguration/1614756-selectiongranularity))
  CygnusSelectionGranularity? selectionGranularity;

  ///Sets the serif font family name. The default value is `"sans-serif"`.
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView ([Official API - WebSettings.setSerifFontFamily](https://developer.android.com/reference/android/webkit/WebSettings?hl=en#setSerifFontFamily(java.lang.String)))
  ///- Linux WPE WebKit ([Official API - WebKitSettings.serif-font-family](https://wpewebkit.org/reference/stable/wpe-webkit-2.0/property.Settings.serif-font-family.html))
  String? serifFontFamily;

  ///Set `true` if shared cookies from `HTTPCookieStorage.shared` should used for every load request in the WebView.
  ///The default value is `false`.
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- iOS WKWebView 11.0+
  ///- macOS WKWebView 10.13+
  bool? sharedCookiesEnabled;

  ///A Boolean value that indicates whether to include any background color or graphics when printing content.
  ///
  ///The default value is `false`.
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- iOS WKWebView 16.4+ ([Official API - WKWebView.shouldPrintBackgrounds](https://developer.apple.com/documentation/webkit/wkpreferences/4104043-shouldprintbackgrounds))
  ///- macOS WKWebView 13.3+ ([Official API - WKWebView.shouldPrintBackgrounds](https://developer.apple.com/documentation/webkit/wkpreferences/4104043-shouldprintbackgrounds))
  bool? shouldPrintBackgrounds;

  ///Sets the standard font family name. The default value is `"sans-serif"`.
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView ([Official API - WebSettings.setStandardFontFamily](https://developer.android.com/reference/android/webkit/WebSettings?hl=en#setStandardFontFamily(java.lang.String)))
  ///- Linux WPE WebKit ([Official API - WebKitSettings.default-font-family](https://wpewebkit.org/reference/stable/wpe-webkit-2.0/property.Settings.default-font-family.html))
  String? standardFontFamily;

  ///Specifies whether the status bar is displayed.
  ///
  ///The status bar is usually displayed in the lower left of the WebView and
  ///shows things such as the URI of a link when the user hovers over it and other information.
  ///The status bar UI can be altered by web content and should not be considered secure.
  ///
  ///The default value is `true`.
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Windows WebView2 ([Official API - ICoreWebView2Settings.put_IsStatusBarEnabled](https://learn.microsoft.com/en-us/microsoft-edge/webview2/reference/win32/icorewebview2settings?view=webview2-1.0.2849.39#put_isstatusbarenabled))
  bool? statusBarEnabled;

  ///Sets whether the WebView supports multiple windows.
  ///If set to `true`, [CygnusPlatformWebViewCreationParams.onCreateWindow] event must be implemented by the host application. The default value is `false`.
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView ([Official API - WebSettings.setSupportMultipleWindows](https://developer.android.com/reference/android/webkit/WebSettings?hl=en#setSupportMultipleWindows(boolean)))
  bool? supportMultipleWindows;

  ///Set to `false` if the WebView should not support zooming using its on-screen zoom controls and gestures. The default value is `true`.
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView ([Official API - WebSettings.setSupportZoom](https://developer.android.com/reference/android/webkit/WebSettings?hl=en#setSupportZoom(boolean)))
  ///- iOS WKWebView
  ///- macOS WKWebView
  ///- Windows WebView2 ([Official API - ICoreWebView2Settings.put_IsZoomControlEnabled](https://learn.microsoft.com/en-us/microsoft-edge/webview2/reference/win32/icorewebview2settings?view=webview2-1.0.2210.55#put_iszoomcontrolenabled))
  bool? supportZoom;

  ///Set to `true` if you want the WebView suppresses content rendering until it is fully loaded into memory. The default value is `false`.
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- iOS WKWebView ([Official API - WKWebViewConfiguration.suppressesIncrementalRendering](https://developer.apple.com/documentation/webkit/wkwebviewconfiguration/1395663-suppressesincrementalrendering))
  ///- macOS WKWebView ([Official API - WKWebViewConfiguration.suppressesIncrementalRendering](https://developer.apple.com/documentation/webkit/wkwebviewconfiguration/1395663-suppressesincrementalrendering))
  bool? suppressesIncrementalRendering;

  ///Sets the text zoom of the page in percent. The default value is `100`.
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView ([Official API - WebSettings.setTextZoom](https://developer.android.com/reference/android/webkit/WebSettings?hl=en#setTextZoom(int)))
  int? textZoom;

  ///Boolean value to enable third party cookies in the WebView.
  ///Used on Android Lollipop and above only as third party cookies are enabled by default on Android Kitkat and below and on iOS.
  ///The default value is `true`.
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView 21+ ([Official API - CygnusCookieManager.setAcceptThirdPartyCookies](https://developer.android.com/reference/android/webkit/CygnusCookieManager#setAcceptThirdPartyCookies(android.webkit.WebView,%20boolean)))
  bool? thirdPartyCookiesEnabled;

  ///Set to `true` to make the background of the WebView transparent. If your app has a dark theme, this can prevent a white flash on initialization. The default value is `false`.
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView
  ///- iOS WKWebView
  ///- macOS WKWebView 12.0+
  ///- Windows WebView2 1.0.774.44+ ([Official API - ICoreWebView2Controller2.put_DefaultBackgroundColor](https://learn.microsoft.com/en-us/microsoft-edge/webview2/reference/win32/icorewebview2controller2?view=webview2-1.0.2210.55#put_defaultbackgroundcolor))
  bool? transparentBackground;

  ///The color the web view displays behind the active page, visible when the user scrolls beyond the bounds of the page.
  ///
  ///The web view derives the default value of this property from the content of the page,
  ///using the background colors of the `<html>` and `<body>` elements with the background color of the web view.
  ///To override the default color, set this property to a new color.
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- iOS WKWebView 15.0+ ([Official API - WKWebView.underPageBackgroundColor](https://developer.apple.com/documentation/webkit/wkwebview/3850574-underpagebackgroundcolor))
  ///- macOS WKWebView 12.0+ ([Official API - WKWebView.underPageBackgroundColor](https://developer.apple.com/documentation/webkit/wkwebview/3850574-underpagebackgroundcolor))
  Color? underPageBackgroundColor;

  ///A Boolean value indicating whether HTTP requests to servers known to support HTTPS should be automatically upgraded to HTTPS requests.
  ///The default value is `true`.
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- iOS WKWebView 15.0+ ([Official API - WKWebViewConfiguration.upgradeKnownHostsToHTTPS](https://developer.apple.com/documentation/webkit/wkwebviewconfiguration/3752243-upgradeknownhoststohttps))
  ///- macOS WKWebView 11.3+ ([Official API - WKWebViewConfiguration.upgradeKnownHostsToHTTPS](https://developer.apple.com/documentation/webkit/wkwebviewconfiguration/3752243-upgradeknownhoststohttps))
  bool? upgradeKnownHostsToHTTPS;

  ///Set to `true` to render the WebView through Flutter Hybrid Composition instead of the
  ///cheaper Texture Layer Hybrid Composition. The default value is `false`.
  ///Hybrid Composition is supported starting with Flutter v1.20+.
  ///
  ///This flag cannot express Hybrid Composition++. Prefer [androidCompositionMode], which
  ///covers all three modes; this one is kept so existing code keeps working.
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView:
  ///    - It is recommended to use Hybrid Composition only on Android 10+ for a release app, as it can cause framerate drops on animations in Android 9 and lower (see [Hybrid-Composition#performance](https://github.com/flutter/flutter/wiki/Hybrid-Composition#performance)).
  @Deprecated('Use androidCompositionMode instead')
  bool? useHybridComposition;

  ///Set to `true` to be able to listen at the [CygnusPlatformWebViewCreationParams.onAjaxProgress] event.
  ///Also, [useShouldInterceptAjaxRequest] must be set to `true` to take effect.
  ///
  ///Due to the async nature of [CygnusPlatformWebViewCreationParams.onAjaxProgress] event implementation,
  ///using it could cause some issues, so, be careful when using it.
  ///In this case, you should implement your own logic using for example an [CygnusUserScript] overriding the
  ///[XMLHttpRequest](https://developer.mozilla.org/en-US/docs/Web/API/XMLHttpRequest) JavaScript object.
  ///
  ///If the [CygnusPlatformWebViewCreationParams.onAjaxProgress] event is implemented and this value is `null`,
  ///it will be automatically inferred as `true`, otherwise, the default value is `false`.
  ///This logic will not be applied for [CygnusPlatformBrowser], where you must set the value manually.
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView
  ///- iOS WKWebView
  ///- macOS WKWebView
  bool? useOnAjaxProgress;

  ///Set to `true` to be able to listen at the [CygnusPlatformWebViewCreationParams.onAjaxReadyStateChange] event.
  ///Also, [useShouldInterceptAjaxRequest] must be set to `true` to take effect.
  ///
  ///Due to the async nature of [CygnusPlatformWebViewCreationParams.onAjaxReadyStateChange] event implementation,
  ///using it could cause some issues, so, be careful when using it.
  ///In this case, you should implement your own logic using for example an [CygnusUserScript] overriding the
  ///[XMLHttpRequest](https://developer.mozilla.org/en-US/docs/Web/API/XMLHttpRequest) JavaScript object.
  ///
  ///If the [CygnusPlatformWebViewCreationParams.onAjaxReadyStateChange] event is implemented and this value is `null`,
  ///it will be automatically inferred as `true`, otherwise, the default value is `false`.
  ///This logic will not be applied for [CygnusPlatformBrowser], where you must set the value manually.
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView
  ///- iOS WKWebView
  ///- macOS WKWebView
  bool? useOnAjaxReadyStateChange;

  ///Set to `true` to be able to listen at the [CygnusPlatformWebViewCreationParams.onDownloadStartRequest] event.
  ///
  ///If the [CygnusPlatformWebViewCreationParams.onDownloadStartRequest] event is implemented and this value is `null`,
  ///it will be automatically inferred as `true`, otherwise, the default value is `false`.
  ///This logic will not be applied for [CygnusPlatformBrowser], where you must set the value manually.
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView
  ///- iOS WKWebView
  ///- macOS WKWebView
  bool? useOnDownloadStart;

  ///Set to `true` to be able to listen at the [CygnusPlatformWebViewCreationParams.onLoadResource] event.
  ///
  ///If the [CygnusPlatformWebViewCreationParams.onLoadResource] event is implemented and this value is `null`,
  ///it will be automatically inferred as `true`, otherwise, the default value is `false`.
  ///This logic will not be applied for [CygnusPlatformBrowser], where you must set the value manually.
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView
  ///- iOS WKWebView
  ///- macOS WKWebView
  ///- Linux WPE WebKit
  bool? useOnLoadResource;

  ///Set to `true` to be able to listen to the [CygnusPlatformWebViewCreationParams.onNavigationResponse] event.
  ///
  ///If the [CygnusPlatformWebViewCreationParams.onNavigationResponse] event is implemented and this value is `null`,
  ///it will be automatically inferred as `true`, otherwise, the default value is `false`.
  ///This logic will not be applied for [CygnusPlatformBrowser], where you must set the value manually.
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- iOS WKWebView
  ///- macOS WKWebView
  bool? useOnNavigationResponse;

  ///Set to `true` to be able to listen at the [CygnusPlatformWebViewCreationParams.onRenderProcessGone] event.
  ///
  ///If the [CygnusPlatformWebViewCreationParams.onRenderProcessGone] event is implemented and this value is `null`,
  ///it will be automatically inferred as `true`, otherwise, the default value is `false`.
  ///This logic will not be applied for [CygnusPlatformBrowser], where you must set the value manually.
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView
  bool? useOnRenderProcessGone;

  ///Set to `true` to be able to listen at the [CygnusPlatformWebViewCreationParams.onShowFileChooser] event.
  ///
  ///If the [CygnusPlatformWebViewCreationParams.onShowFileChooser] event is implemented and this value is `null`,
  ///it will be automatically inferred as `true`, otherwise, the default value is `false`.
  ///This logic will not be applied for [CygnusPlatformBrowser], where you must set the value manually.
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView
  bool? useOnShowFileChooser;

  ///Set to `true` to be able to listen at the [CygnusPlatformWebViewCreationParams.shouldInterceptAjaxRequest] event.
  ///
  ///Due to the async nature of [CygnusPlatformWebViewCreationParams.shouldInterceptAjaxRequest] event implementation,
  ///it will intercept only async `XMLHttpRequest`s ([CygnusAjaxRequest.isAsync] with `true`).
  ///To be able to intercept sync `XMLHttpRequest`s, use [CygnusWebViewSettings.interceptOnlyAsyncAjaxRequests] to `false`.
  ///If necessary, you should implement your own logic using for example an [CygnusUserScript] overriding the
  ///[XMLHttpRequest](https://developer.mozilla.org/en-US/docs/Web/API/XMLHttpRequest) JavaScript object.
  ///
  ///If the [CygnusPlatformWebViewCreationParams.shouldInterceptAjaxRequest] event is implemented and this value is `null`,
  ///it will be automatically inferred as `true`, otherwise, the default value is `false`.
  ///This logic will not be applied for [CygnusPlatformBrowser], where you must set the value manually.
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView
  ///- iOS WKWebView
  ///- macOS WKWebView
  bool? useShouldInterceptAjaxRequest;

  ///Set to `true` to be able to listen at the [CygnusPlatformWebViewCreationParams.shouldInterceptFetchRequest] event.
  ///
  ///If the [CygnusPlatformWebViewCreationParams.shouldInterceptFetchRequest] event is implemented and this value is `null`,
  ///it will be automatically inferred as `true`, otherwise, the default value is `false`.
  ///This logic will not be applied for [CygnusPlatformBrowser], where you must set the value manually.
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView
  ///- iOS WKWebView
  ///- macOS WKWebView
  bool? useShouldInterceptFetchRequest;

  ///Set to `true` to be able to listen at the [CygnusPlatformWebViewCreationParams.shouldInterceptRequest] event.
  ///
  ///If the [CygnusPlatformWebViewCreationParams.shouldInterceptRequest] event is implemented and this value is `null`,
  ///it will be automatically inferred as `true`, otherwise, the default value is `false`.
  ///This logic will not be applied for [CygnusPlatformBrowser], where you must set the value manually.
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView
  bool? useShouldInterceptRequest;

  ///Set to `true` to be able to listen at the [CygnusPlatformWebViewCreationParams.shouldOverrideUrlLoading] event.
  ///
  ///If the [CygnusPlatformWebViewCreationParams.shouldOverrideUrlLoading] event is implemented and this value is `null`,
  ///it will be automatically inferred as `true`, otherwise, the default value is `false`.
  ///This logic will not be applied for [CygnusPlatformBrowser], where you must set the value manually.
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView
  ///- iOS WKWebView
  ///- macOS WKWebView
  ///- Windows WebView2
  bool? useShouldOverrideUrlLoading;

  ///Set to `true` if the WebView should enable support for the "viewport" HTML meta tag or should use a wide viewport.
  ///When the value of the setting is false, the layout width is always set to the width of the WebView control in device-independent (CSS) pixels.
  ///When the value is true and the page contains the viewport meta tag, the value of the width specified in the tag is used.
  ///If the page does not contain the tag or does not provide a width, then a wide viewport will be used. The default value is `true`.
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView ([Official API - WebSettings.setUseWideViewPort](https://developer.android.com/reference/android/webkit/WebSettings?hl=en#setUseWideViewPort(boolean)))
  bool? useWideViewPort;

  ///Sets the user-agent for the WebView.
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView ([Official API - WebSettings.setUserAgentString](https://developer.android.com/reference/android/webkit/WebSettings?hl=en#setUserAgentString(java.lang.String)))
  ///- iOS WKWebView ([Official API - WKWebView.customUserAgent](https://developer.apple.com/documentation/webkit/wkwebview/1414950-customuseragent))
  ///- macOS WKWebView ([Official API - WKWebView.customUserAgent](https://developer.apple.com/documentation/webkit/wkwebview/1414950-customuseragent))
  ///- Windows WebView2 ([Official API - ICoreWebView2Settings2.put_UserAgent](https://learn.microsoft.com/en-us/microsoft-edge/webview2/reference/win32/icorewebview2settings2?view=webview2-1.0.2210.55#put_useragent))
  String? userAgent;

  ///Define whether the vertical scrollbar should be drawn or not. The default value is `true`.
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView ([Official API - View.setVerticalScrollBarEnabled](https://developer.android.com/reference/android/view/View#setVerticalScrollBarEnabled(boolean)))
  ///- iOS WKWebView ([Official API - UIScrollView.showsVerticalScrollIndicator](https://developer.apple.com/documentation/uikit/uiscrollview/1619405-showsverticalscrollindicator/))
  ///- Web \<iframe\> but requires same origin:
  ///    - It must have the same value of [horizontalScrollBarEnabled] to take effect.
  bool? verticalScrollBarEnabled;

  ///Sets the position of the vertical scroll bar.
  ///The default value is [CygnusVerticalScrollbarPosition.SCROLLBAR_POSITION_DEFAULT].
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView ([Official API - View.setVerticalScrollbarPosition](https://developer.android.com/reference/android/view/View#setVerticalScrollbarPosition(int)))
  CygnusVerticalScrollbarPosition? verticalScrollbarPosition;

  ///Sets the vertical scrollbar thumb color.
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView 29+ ([Official API - View.setVerticalScrollbarThumbDrawable](https://developer.android.com/reference/android/view/View#setVerticalScrollbarThumbDrawable(android.graphics.drawable.Drawable)))
  Color? verticalScrollbarThumbColor;

  ///Sets the vertical scrollbar track color.
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView 29+ ([Official API - View.setVerticalScrollbarTrackDrawable](https://developer.android.com/reference/android/view/View#setVerticalScrollbarTrackDrawable(android.graphics.drawable.Drawable)))
  Color? verticalScrollbarTrackColor;

  ///Sets the range of UDP ports for WebRTC connections.
  ///
  ///The format is "minPort:maxPort", for example "10000:10100".
  ///
  ///The default value is `null` (uses system default).
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Linux WPE WebKit 2.48+ ([Official API - WebKitSettings.webrtc-udp-ports-range](https://wpewebkit.org/reference/stable/wpe-webkit-2.0/property.Settings.webrtc-udp-ports-range.html)):
  ///    - Requires WPE WebKit 2.48 or later. Format: 'minPort:maxPort'
  String? webRTCUdpPortsRange;

  ///Use a [CygnusWebViewAssetLoader] instance to load local files including application's static assets and resources using http(s):// URLs.
  ///Loading local files using web-like URLs instead of `file://` is desirable as it is compatible with the Same-Origin policy.
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView
  CygnusWebViewAssetLoader? webViewAssetLoader;

  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView
  ///- iOS WKWebView
  ///- macOS WKWebView
  ///- Web \<iframe\>
  ///- Windows WebView2
  CygnusWebViewSettings({
    this.useShouldOverrideUrlLoading,
    this.useOnLoadResource,
    this.useOnDownloadStart,
    @Deprecated("Use CygnusWebViewController.clearAllCache instead")
    this.clearCache = false,
    this.userAgent = "",
    this.applicationNameForUserAgent = "",
    this.javaScriptEnabled = true,
    this.javaScriptCanOpenWindowsAutomatically = false,
    this.mediaPlaybackRequiresUserGesture = true,
    this.minimumFontSize,
    this.verticalScrollBarEnabled = true,
    this.horizontalScrollBarEnabled = true,
    this.resourceCustomSchemes = const [],
    this.contentBlockers = const [],
    this.preferredContentMode = CygnusUserPreferredContentMode.RECOMMENDED,
    this.useShouldInterceptAjaxRequest,
    this.useOnAjaxReadyStateChange,
    this.useOnAjaxProgress,
    this.interceptOnlyAsyncAjaxRequests = true,
    this.useShouldInterceptFetchRequest,
    this.incognito = false,
    this.cacheEnabled = true,
    this.transparentBackground = false,
    this.disableVerticalScroll = false,
    this.disableHorizontalScroll = false,
    this.disableContextMenu = false,
    this.supportZoom = true,
    this.allowFileAccessFromFileURLs = false,
    this.allowUniversalAccessFromFileURLs = false,
    this.textZoom,
    @Deprecated("Use CygnusCookieManager.removeSessionCookies instead")
    this.clearSessionCache = false,
    this.builtInZoomControls = true,
    this.displayZoomControls = false,
    this.databaseEnabled = true,
    this.domStorageEnabled = true,
    this.useWideViewPort = true,
    this.safeBrowsingEnabled = true,
    this.mixedContentMode,
    this.allowContentAccess = true,
    this.allowFileAccess = true,
    this.appCachePath,
    this.blockNetworkImage = false,
    this.blockNetworkLoads = false,
    this.cacheMode = CygnusCacheMode.LOAD_DEFAULT,
    this.cursiveFontFamily = "cursive",
    this.defaultFixedFontSize = 16,
    this.defaultFontSize = 16,
    this.defaultTextEncodingName = "UTF-8",
    this.disabledActionModeMenuItems,
    this.fantasyFontFamily = "fantasy",
    this.fixedFontFamily = "monospace",
    @Deprecated("Use algorithmicDarkeningAllowed instead") this.forceDark,
    @Deprecated("Use algorithmicDarkeningAllowed instead")
    this.forceDarkStrategy,
    this.geolocationEnabled = true,
    this.layoutAlgorithm,
    this.loadWithOverviewMode = true,
    this.loadsImagesAutomatically = true,
    this.minimumLogicalFontSize = 8,
    this.needInitialFocus = true,
    this.offscreenPreRaster = false,
    this.sansSerifFontFamily = "sans-serif",
    this.serifFontFamily = "sans-serif",
    this.standardFontFamily = "sans-serif",
    @Deprecated('') this.saveFormData = true,
    this.thirdPartyCookiesEnabled = true,
    this.hardwareAcceleration = true,
    this.initialScale = 0,
    this.supportMultipleWindows = false,
    this.regexToCancelSubFramesLoading,
    this.regexToAllowSyncUrlLoading,
    this.useHybridComposition = false,
    this.androidCompositionMode,
    this.keyboardAvoidance = true,
    this.useShouldInterceptRequest,
    this.useOnRenderProcessGone,
    this.overScrollMode = CygnusOverScrollMode.IF_CONTENT_SCROLLS,
    this.networkAvailable,
    this.scrollBarStyle = CygnusScrollBarStyle.SCROLLBARS_INSIDE_OVERLAY,
    this.verticalScrollbarPosition =
        CygnusVerticalScrollbarPosition.SCROLLBAR_POSITION_DEFAULT,
    this.scrollBarDefaultDelayBeforeFade,
    this.scrollbarFadingEnabled = true,
    this.scrollBarFadeDuration,
    this.rendererPriorityPolicy,
    this.disableDefaultErrorPage = false,
    this.verticalScrollbarThumbColor,
    this.verticalScrollbarTrackColor,
    this.horizontalScrollbarThumbColor,
    this.horizontalScrollbarTrackColor,
    this.algorithmicDarkeningAllowed = false,
    this.enterpriseAuthenticationAppLinkPolicyEnabled = true,
    this.defaultVideoPoster,
    this.requestedWithHeaderOriginAllowList,
    this.disallowOverScroll = false,
    this.enableViewportScale = false,
    this.suppressesIncrementalRendering = false,
    this.allowsAirPlayForMediaPlayback = true,
    this.allowsBackForwardNavigationGestures = true,
    this.allowsLinkPreview = true,
    this.ignoresViewportScaleLimits = false,
    this.allowsInlineMediaPlayback = false,
    this.allowsPictureInPictureMediaPlayback = true,
    this.isFraudulentWebsiteWarningEnabled = true,
    this.selectionGranularity = CygnusSelectionGranularity.DYNAMIC,
    this.dataDetectorTypes = const [CygnusDataDetectorTypes.NONE],
    this.sharedCookiesEnabled = false,
    this.automaticallyAdjustsScrollIndicatorInsets = false,
    this.accessibilityIgnoresInvertColors = false,
    this.decelerationRate = CygnusScrollViewDecelerationRate.NORMAL,
    this.alwaysBounceVertical = false,
    this.alwaysBounceHorizontal = false,
    this.scrollsToTop = true,
    this.isPagingEnabled = false,
    this.maximumZoomScale = 1.0,
    this.minimumZoomScale = 1.0,
    this.contentInsetAdjustmentBehavior =
        CygnusScrollViewContentInsetAdjustmentBehavior.NEVER,
    this.isDirectionalLockEnabled = false,
    this.mediaType,
    this.pageZoom = 1.0,
    this.limitsNavigationsToAppBoundDomains = false,
    this.useOnNavigationResponse,
    this.applePayAPIEnabled = false,
    this.allowingReadAccessTo,
    this.disableLongPressContextMenuOnLinks = false,
    this.disableInputAccessoryView = false,
    this.underPageBackgroundColor,
    this.isTextInteractionEnabled = true,
    this.isSiteSpecificQuirksModeEnabled = true,
    this.upgradeKnownHostsToHTTPS = true,
    this.isElementFullscreenEnabled = true,
    this.isFindInteractionEnabled = false,
    this.minimumViewportInset,
    this.maximumViewportInset,
    this.isInspectable = false,
    this.shouldPrintBackgrounds = false,
    this.allowBackgroundAudioPlaying = false,
    this.webViewAssetLoader,
    this.javaScriptHandlersOriginAllowList,
    this.javaScriptHandlersForMainFrameOnly,
    this.javaScriptBridgeEnabled = true,
    this.javaScriptBridgeOriginAllowList,
    this.javaScriptBridgeForMainFrameOnly,
    this.pluginScriptsOriginAllowList,
    this.pluginScriptsForMainFrameOnly = false,
    this.scrollMultiplier = 1,
    this.statusBarEnabled = true,
    this.browserAcceleratorKeysEnabled = true,
    this.generalAutofillEnabled = true,
    this.passwordAutosaveEnabled = false,
    this.pinchZoomEnabled = true,
    this.hiddenPdfToolbarItems = CygnusPdfToolbarItems.NONE,
    this.reputationCheckingRequired = true,
    this.nonClientRegionSupportEnabled = false,
    this.isUserInteractionEnabled = true,
    this.handleAcceleratorKeyPressed = false,
    this.alpha,
    this.useOnShowFileChooser,
    this.iframeAllow,
    this.iframeAllowFullscreen,
    this.iframeSandbox,
    this.iframeReferrerPolicy,
    this.iframeName,
    this.iframeCsp,
    this.iframeRole,
    this.iframeAriaHidden,
    this.enableWriteConsoleMessagesToStdout = false,
    this.enableSmoothScrolling = true,
    this.enableCaretBrowsing = false,
    this.enablePageCache = true,
    this.drawCompositingIndicators = false,
    this.enableResizableTextAreas = true,
    this.enableTabsToLinks = true,
    this.enableSpatialNavigation = false,
    this.pictographFontFamily,
    this.corsAllowlist,
    this.itpEnabled = false,
    this.darkMode,
    this.disableAnimations,
    this.fontAntialias,
    this.fontHintingStyle,
    this.fontSubpixelLayout,
    this.fontDPI,
    this.cursorBlinkTime,
    this.doubleClickDistance,
    this.doubleClickTime,
    this.dragThreshold,
    this.keyRepeatDelay,
    this.keyRepeatInterval,
    this.javaScriptCanAccessClipboard = false,
    this.allowModalDialogs = false,
    this.disableWebSecurity = false,
    this.enableWebRTC = true,
    this.webRTCUdpPortsRange,
    this.enableMedia = true,
    this.enableEncryptedMedia = true,
    this.enableMediaCapabilities = true,
    this.enableMockCaptureDevices = false,
    this.mediaContentTypesRequiringHardwareSupport,
    this.enableJavaScriptMarkup = true,
    this.enable2DCanvasAcceleration = false,
    this.allowTopNavigationToDataUrls = false,
  }) {
    if (this.minimumFontSize == null)
      this.minimumFontSize = Util.isAndroid ? 8 : 0;
    assert(
      this.resourceCustomSchemes == null ||
          (this.resourceCustomSchemes != null &&
              !this.resourceCustomSchemes!.contains("http") &&
              !this.resourceCustomSchemes!.contains("https")),
    );
    assert(
      allowingReadAccessTo == null || allowingReadAccessTo!.isScheme("file"),
    );
    assert(
      (minimumViewportInset == null && maximumViewportInset == null) ||
          minimumViewportInset != null &&
              maximumViewportInset != null &&
              minimumViewportInset!.isNonNegative &&
              maximumViewportInset!.isNonNegative &&
              minimumViewportInset!.vertical <=
                  maximumViewportInset!.vertical &&
              minimumViewportInset!.horizontal <=
                  maximumViewportInset!.horizontal,
      "minimumViewportInset cannot be larger than maximumViewportInset",
    );
  }

  ///Gets a possible [CygnusWebViewSettings] instance from a [Map] value.
  static CygnusWebViewSettings? fromMap(
    Map<String, dynamic>? map, {
    CygnusEnumMethod? enumMethod,
  }) {
    if (map == null) {
      return null;
    }
    final instance = CygnusWebViewSettings(
      allowingReadAccessTo: map['allowingReadAccessTo'] != null
          ? CygnusWebUri(map['allowingReadAccessTo'])
          : null,
      alpha: map['alpha'],
      androidCompositionMode: switch (enumMethod ??
          CygnusEnumMethod.nativeValue) {
        CygnusEnumMethod.nativeValue =>
          CygnusAndroidCompositionMode.fromNativeValue(
            map['androidCompositionMode'],
          ),
        CygnusEnumMethod.value => CygnusAndroidCompositionMode.fromValue(
          map['androidCompositionMode'],
        ),
        CygnusEnumMethod.name => CygnusAndroidCompositionMode.byName(
          map['androidCompositionMode'],
        ),
      },
      appCachePath: map['appCachePath'],
      corsAllowlist: map['corsAllowlist'] != null
          ? List<String>.from(map['corsAllowlist']!.cast<String>())
          : null,
      cursorBlinkTime: map['cursorBlinkTime'],
      darkMode: map['darkMode'],
      defaultVideoPoster: map['defaultVideoPoster'] != null
          ? Uint8List.fromList(map['defaultVideoPoster'].cast<int>())
          : null,
      disableAnimations: map['disableAnimations'],
      disabledActionModeMenuItems: switch (enumMethod ??
          CygnusEnumMethod.nativeValue) {
        CygnusEnumMethod.nativeValue =>
          CygnusActionModeMenuItem.fromNativeValue(
            map['disabledActionModeMenuItems'],
          ),
        CygnusEnumMethod.value => CygnusActionModeMenuItem.fromValue(
          map['disabledActionModeMenuItems'],
        ),
        CygnusEnumMethod.name => CygnusActionModeMenuItem.byName(
          map['disabledActionModeMenuItems'],
        ),
      },
      doubleClickDistance: map['doubleClickDistance'],
      doubleClickTime: map['doubleClickTime'],
      dragThreshold: map['dragThreshold'],
      fontAntialias: map['fontAntialias'],
      fontDPI: map['fontDPI'],
      fontHintingStyle: switch (enumMethod ?? CygnusEnumMethod.nativeValue) {
        CygnusEnumMethod.nativeValue => CygnusFontHintingStyle.fromNativeValue(
          map['fontHintingStyle'],
        ),
        CygnusEnumMethod.value => CygnusFontHintingStyle.fromValue(
          map['fontHintingStyle'],
        ),
        CygnusEnumMethod.name => CygnusFontHintingStyle.byName(
          map['fontHintingStyle'],
        ),
      },
      fontSubpixelLayout: switch (enumMethod ?? CygnusEnumMethod.nativeValue) {
        CygnusEnumMethod.nativeValue =>
          CygnusFontSubpixelLayout.fromNativeValue(map['fontSubpixelLayout']),
        CygnusEnumMethod.value => CygnusFontSubpixelLayout.fromValue(
          map['fontSubpixelLayout'],
        ),
        CygnusEnumMethod.name => CygnusFontSubpixelLayout.byName(
          map['fontSubpixelLayout'],
        ),
      },
      forceDark: switch (enumMethod ?? CygnusEnumMethod.nativeValue) {
        CygnusEnumMethod.nativeValue => CygnusForceDark.fromNativeValue(
          map['forceDark'],
        ),
        CygnusEnumMethod.value => CygnusForceDark.fromValue(map['forceDark']),
        CygnusEnumMethod.name => CygnusForceDark.byName(map['forceDark']),
      },
      forceDarkStrategy: switch (enumMethod ?? CygnusEnumMethod.nativeValue) {
        CygnusEnumMethod.nativeValue => CygnusForceDarkStrategy.fromNativeValue(
          map['forceDarkStrategy'],
        ),
        CygnusEnumMethod.value => CygnusForceDarkStrategy.fromValue(
          map['forceDarkStrategy'],
        ),
        CygnusEnumMethod.name => CygnusForceDarkStrategy.byName(
          map['forceDarkStrategy'],
        ),
      },
      horizontalScrollbarThumbColor:
          map['horizontalScrollbarThumbColor'] != null
          ? UtilColor.fromStringRepresentation(
              map['horizontalScrollbarThumbColor'],
            )
          : null,
      horizontalScrollbarTrackColor:
          map['horizontalScrollbarTrackColor'] != null
          ? UtilColor.fromStringRepresentation(
              map['horizontalScrollbarTrackColor'],
            )
          : null,
      iframeAllow: map['iframeAllow'],
      iframeAllowFullscreen: map['iframeAllowFullscreen'],
      iframeAriaHidden: map['iframeAriaHidden'],
      iframeCsp: map['iframeCsp'],
      iframeName: map['iframeName'],
      iframeReferrerPolicy: switch (enumMethod ??
          CygnusEnumMethod.nativeValue) {
        CygnusEnumMethod.nativeValue => CygnusReferrerPolicy.fromNativeValue(
          map['iframeReferrerPolicy'],
        ),
        CygnusEnumMethod.value => CygnusReferrerPolicy.fromValue(
          map['iframeReferrerPolicy'],
        ),
        CygnusEnumMethod.name => CygnusReferrerPolicy.byName(
          map['iframeReferrerPolicy'],
        ),
      },
      iframeRole: map['iframeRole'],
      iframeSandbox: map['iframeSandbox'] != null
          ? Set<CygnusSandbox>.from(
              map['iframeSandbox'].map(
                (e) => switch (enumMethod ?? CygnusEnumMethod.nativeValue) {
                  CygnusEnumMethod.nativeValue => CygnusSandbox.fromNativeValue(
                    e,
                  ),
                  CygnusEnumMethod.value => CygnusSandbox.fromValue(e),
                  CygnusEnumMethod.name => CygnusSandbox.byName(e),
                }!,
              ),
            )
          : null,
      javaScriptBridgeForMainFrameOnly: map['javaScriptBridgeForMainFrameOnly'],
      javaScriptBridgeOriginAllowList:
          map['javaScriptBridgeOriginAllowList'] != null
          ? Set<String>.from(
              map['javaScriptBridgeOriginAllowList']!.cast<String>(),
            )
          : null,
      javaScriptHandlersForMainFrameOnly:
          map['javaScriptHandlersForMainFrameOnly'],
      javaScriptHandlersOriginAllowList:
          map['javaScriptHandlersOriginAllowList'] != null
          ? Set<String>.from(
              map['javaScriptHandlersOriginAllowList']!.cast<String>(),
            )
          : null,
      keyRepeatDelay: map['keyRepeatDelay'],
      keyRepeatInterval: map['keyRepeatInterval'],
      layoutAlgorithm: switch (enumMethod ?? CygnusEnumMethod.nativeValue) {
        CygnusEnumMethod.nativeValue => CygnusLayoutAlgorithm.fromNativeValue(
          map['layoutAlgorithm'],
        ),
        CygnusEnumMethod.value => CygnusLayoutAlgorithm.fromValue(
          map['layoutAlgorithm'],
        ),
        CygnusEnumMethod.name => CygnusLayoutAlgorithm.byName(
          map['layoutAlgorithm'],
        ),
      },
      maximumViewportInset: MapEdgeInsets.fromMap(
        map['maximumViewportInset']?.cast<String, dynamic>(),
      ),
      mediaContentTypesRequiringHardwareSupport:
          map['mediaContentTypesRequiringHardwareSupport'],
      mediaType: map['mediaType'],
      minimumFontSize: map['minimumFontSize'],
      minimumViewportInset: MapEdgeInsets.fromMap(
        map['minimumViewportInset']?.cast<String, dynamic>(),
      ),
      mixedContentMode: switch (enumMethod ?? CygnusEnumMethod.nativeValue) {
        CygnusEnumMethod.nativeValue => CygnusMixedContentMode.fromNativeValue(
          map['mixedContentMode'],
        ),
        CygnusEnumMethod.value => CygnusMixedContentMode.fromValue(
          map['mixedContentMode'],
        ),
        CygnusEnumMethod.name => CygnusMixedContentMode.byName(
          map['mixedContentMode'],
        ),
      },
      networkAvailable: map['networkAvailable'],
      pictographFontFamily: map['pictographFontFamily'],
      pluginScriptsOriginAllowList: map['pluginScriptsOriginAllowList'] != null
          ? Set<String>.from(
              map['pluginScriptsOriginAllowList']!.cast<String>(),
            )
          : null,
      regexToAllowSyncUrlLoading: map['regexToAllowSyncUrlLoading'],
      regexToCancelSubFramesLoading: map['regexToCancelSubFramesLoading'],
      rendererPriorityPolicy: CygnusRendererPriorityPolicy.fromMap(
        map['rendererPriorityPolicy']?.cast<String, dynamic>(),
        enumMethod: enumMethod,
      ),
      requestedWithHeaderOriginAllowList:
          map['requestedWithHeaderOriginAllowList'] != null
          ? Set<String>.from(
              map['requestedWithHeaderOriginAllowList']!.cast<String>(),
            )
          : null,
      scrollBarDefaultDelayBeforeFade: map['scrollBarDefaultDelayBeforeFade'],
      scrollBarFadeDuration: map['scrollBarFadeDuration'],
      textZoom: map['textZoom'],
      underPageBackgroundColor: map['underPageBackgroundColor'] != null
          ? UtilColor.fromStringRepresentation(map['underPageBackgroundColor'])
          : null,
      useOnAjaxProgress: map['useOnAjaxProgress'],
      useOnAjaxReadyStateChange: map['useOnAjaxReadyStateChange'],
      useOnDownloadStart: map['useOnDownloadStart'],
      useOnLoadResource: map['useOnLoadResource'],
      useOnNavigationResponse: map['useOnNavigationResponse'],
      useOnRenderProcessGone: map['useOnRenderProcessGone'],
      useOnShowFileChooser: map['useOnShowFileChooser'],
      useShouldInterceptAjaxRequest: map['useShouldInterceptAjaxRequest'],
      useShouldInterceptFetchRequest: map['useShouldInterceptFetchRequest'],
      useShouldInterceptRequest: map['useShouldInterceptRequest'],
      useShouldOverrideUrlLoading: map['useShouldOverrideUrlLoading'],
      verticalScrollbarThumbColor: map['verticalScrollbarThumbColor'] != null
          ? UtilColor.fromStringRepresentation(
              map['verticalScrollbarThumbColor'],
            )
          : null,
      verticalScrollbarTrackColor: map['verticalScrollbarTrackColor'] != null
          ? UtilColor.fromStringRepresentation(
              map['verticalScrollbarTrackColor'],
            )
          : null,
      webRTCUdpPortsRange: map['webRTCUdpPortsRange'],
      webViewAssetLoader: CygnusWebViewAssetLoader.fromMap(
        map['webViewAssetLoader']?.cast<String, dynamic>(),
        enumMethod: enumMethod,
      ),
    );
    instance.accessibilityIgnoresInvertColors =
        map['accessibilityIgnoresInvertColors'];
    instance.algorithmicDarkeningAllowed = map['algorithmicDarkeningAllowed'];
    instance.allowBackgroundAudioPlaying = map['allowBackgroundAudioPlaying'];
    instance.allowContentAccess = map['allowContentAccess'];
    instance.allowFileAccess = map['allowFileAccess'];
    instance.allowFileAccessFromFileURLs = map['allowFileAccessFromFileURLs'];
    instance.allowModalDialogs = map['allowModalDialogs'];
    instance.allowTopNavigationToDataUrls = map['allowTopNavigationToDataUrls'];
    instance.allowUniversalAccessFromFileURLs =
        map['allowUniversalAccessFromFileURLs'];
    instance.allowsAirPlayForMediaPlayback =
        map['allowsAirPlayForMediaPlayback'];
    instance.allowsBackForwardNavigationGestures =
        map['allowsBackForwardNavigationGestures'];
    instance.allowsInlineMediaPlayback = map['allowsInlineMediaPlayback'];
    instance.allowsLinkPreview = map['allowsLinkPreview'];
    instance.allowsPictureInPictureMediaPlayback =
        map['allowsPictureInPictureMediaPlayback'];
    instance.alwaysBounceHorizontal = map['alwaysBounceHorizontal'];
    instance.alwaysBounceVertical = map['alwaysBounceVertical'];
    instance.applePayAPIEnabled = map['applePayAPIEnabled'];
    instance.applicationNameForUserAgent = map['applicationNameForUserAgent'];
    instance.automaticallyAdjustsScrollIndicatorInsets =
        map['automaticallyAdjustsScrollIndicatorInsets'];
    instance.blockNetworkImage = map['blockNetworkImage'];
    instance.blockNetworkLoads = map['blockNetworkLoads'];
    instance.browserAcceleratorKeysEnabled =
        map['browserAcceleratorKeysEnabled'];
    instance.builtInZoomControls = map['builtInZoomControls'];
    instance.cacheEnabled = map['cacheEnabled'];
    instance.cacheMode = switch (enumMethod ?? CygnusEnumMethod.nativeValue) {
      CygnusEnumMethod.nativeValue => CygnusCacheMode.fromNativeValue(
        map['cacheMode'],
      ),
      CygnusEnumMethod.value => CygnusCacheMode.fromValue(map['cacheMode']),
      CygnusEnumMethod.name => CygnusCacheMode.byName(map['cacheMode']),
    };
    instance.clearCache = map['clearCache'];
    instance.clearSessionCache = map['clearSessionCache'];
    instance.contentBlockers = _deserializeContentBlockers(
      map['contentBlockers'],
      enumMethod: enumMethod,
    );
    instance.contentInsetAdjustmentBehavior = switch (enumMethod ??
        CygnusEnumMethod.nativeValue) {
      CygnusEnumMethod.nativeValue =>
        CygnusScrollViewContentInsetAdjustmentBehavior.fromNativeValue(
          map['contentInsetAdjustmentBehavior'],
        ),
      CygnusEnumMethod.value =>
        CygnusScrollViewContentInsetAdjustmentBehavior.fromValue(
          map['contentInsetAdjustmentBehavior'],
        ),
      CygnusEnumMethod.name =>
        CygnusScrollViewContentInsetAdjustmentBehavior.byName(
          map['contentInsetAdjustmentBehavior'],
        ),
    };
    instance.cursiveFontFamily = map['cursiveFontFamily'];
    instance.dataDetectorTypes = map['dataDetectorTypes'] != null
        ? List<CygnusDataDetectorTypes>.from(
            map['dataDetectorTypes'].map(
              (e) => switch (enumMethod ?? CygnusEnumMethod.nativeValue) {
                CygnusEnumMethod.nativeValue =>
                  CygnusDataDetectorTypes.fromNativeValue(e),
                CygnusEnumMethod.value => CygnusDataDetectorTypes.fromValue(e),
                CygnusEnumMethod.name => CygnusDataDetectorTypes.byName(e),
              }!,
            ),
          )
        : null;
    instance.databaseEnabled = map['databaseEnabled'];
    instance.decelerationRate = switch (enumMethod ??
        CygnusEnumMethod.nativeValue) {
      CygnusEnumMethod.nativeValue =>
        CygnusScrollViewDecelerationRate.fromNativeValue(
          map['decelerationRate'],
        ),
      CygnusEnumMethod.value => CygnusScrollViewDecelerationRate.fromValue(
        map['decelerationRate'],
      ),
      CygnusEnumMethod.name => CygnusScrollViewDecelerationRate.byName(
        map['decelerationRate'],
      ),
    };
    instance.defaultFixedFontSize = map['defaultFixedFontSize'];
    instance.defaultFontSize = map['defaultFontSize'];
    instance.defaultTextEncodingName = map['defaultTextEncodingName'];
    instance.disableContextMenu = map['disableContextMenu'];
    instance.disableDefaultErrorPage = map['disableDefaultErrorPage'];
    instance.disableHorizontalScroll = map['disableHorizontalScroll'];
    instance.disableInputAccessoryView = map['disableInputAccessoryView'];
    instance.disableLongPressContextMenuOnLinks =
        map['disableLongPressContextMenuOnLinks'];
    instance.disableVerticalScroll = map['disableVerticalScroll'];
    instance.disableWebSecurity = map['disableWebSecurity'];
    instance.disallowOverScroll = map['disallowOverScroll'];
    instance.displayZoomControls = map['displayZoomControls'];
    instance.domStorageEnabled = map['domStorageEnabled'];
    instance.drawCompositingIndicators = map['drawCompositingIndicators'];
    instance.enable2DCanvasAcceleration = map['enable2DCanvasAcceleration'];
    instance.enableCaretBrowsing = map['enableCaretBrowsing'];
    instance.enableEncryptedMedia = map['enableEncryptedMedia'];
    instance.enableJavaScriptMarkup = map['enableJavaScriptMarkup'];
    instance.enableMedia = map['enableMedia'];
    instance.enableMediaCapabilities = map['enableMediaCapabilities'];
    instance.enableMockCaptureDevices = map['enableMockCaptureDevices'];
    instance.enablePageCache = map['enablePageCache'];
    instance.enableResizableTextAreas = map['enableResizableTextAreas'];
    instance.enableSmoothScrolling = map['enableSmoothScrolling'];
    instance.enableSpatialNavigation = map['enableSpatialNavigation'];
    instance.enableTabsToLinks = map['enableTabsToLinks'];
    instance.enableViewportScale = map['enableViewportScale'];
    instance.enableWebRTC = map['enableWebRTC'];
    instance.enableWriteConsoleMessagesToStdout =
        map['enableWriteConsoleMessagesToStdout'];
    instance.enterpriseAuthenticationAppLinkPolicyEnabled =
        map['enterpriseAuthenticationAppLinkPolicyEnabled'];
    instance.fantasyFontFamily = map['fantasyFontFamily'];
    instance.fixedFontFamily = map['fixedFontFamily'];
    instance.generalAutofillEnabled = map['generalAutofillEnabled'];
    instance.geolocationEnabled = map['geolocationEnabled'];
    instance.handleAcceleratorKeyPressed = map['handleAcceleratorKeyPressed'];
    instance.hardwareAcceleration = map['hardwareAcceleration'];
    instance.hiddenPdfToolbarItems = switch (enumMethod ??
        CygnusEnumMethod.nativeValue) {
      CygnusEnumMethod.nativeValue => CygnusPdfToolbarItems.fromNativeValue(
        map['hiddenPdfToolbarItems'],
      ),
      CygnusEnumMethod.value => CygnusPdfToolbarItems.fromValue(
        map['hiddenPdfToolbarItems'],
      ),
      CygnusEnumMethod.name => CygnusPdfToolbarItems.byName(
        map['hiddenPdfToolbarItems'],
      ),
    };
    instance.horizontalScrollBarEnabled = map['horizontalScrollBarEnabled'];
    instance.ignoresViewportScaleLimits = map['ignoresViewportScaleLimits'];
    instance.incognito = map['incognito'];
    instance.initialScale = map['initialScale'];
    instance.interceptOnlyAsyncAjaxRequests =
        map['interceptOnlyAsyncAjaxRequests'];
    instance.isDirectionalLockEnabled = map['isDirectionalLockEnabled'];
    instance.isElementFullscreenEnabled = map['isElementFullscreenEnabled'];
    instance.isFindInteractionEnabled = map['isFindInteractionEnabled'];
    instance.isFraudulentWebsiteWarningEnabled =
        map['isFraudulentWebsiteWarningEnabled'];
    instance.isInspectable = map['isInspectable'];
    instance.isPagingEnabled = map['isPagingEnabled'];
    instance.isSiteSpecificQuirksModeEnabled =
        map['isSiteSpecificQuirksModeEnabled'];
    instance.isTextInteractionEnabled = map['isTextInteractionEnabled'];
    instance.isUserInteractionEnabled = map['isUserInteractionEnabled'];
    instance.itpEnabled = map['itpEnabled'];
    instance.javaScriptBridgeEnabled = map['javaScriptBridgeEnabled'];
    instance.javaScriptCanAccessClipboard = map['javaScriptCanAccessClipboard'];
    instance.javaScriptCanOpenWindowsAutomatically =
        map['javaScriptCanOpenWindowsAutomatically'];
    instance.javaScriptEnabled = map['javaScriptEnabled'];
    instance.keyboardAvoidance = map['keyboardAvoidance'];
    instance.limitsNavigationsToAppBoundDomains =
        map['limitsNavigationsToAppBoundDomains'];
    instance.loadWithOverviewMode = map['loadWithOverviewMode'];
    instance.loadsImagesAutomatically = map['loadsImagesAutomatically'];
    instance.maximumZoomScale = map['maximumZoomScale'];
    instance.mediaPlaybackRequiresUserGesture =
        map['mediaPlaybackRequiresUserGesture'];
    instance.minimumLogicalFontSize = map['minimumLogicalFontSize'];
    instance.minimumZoomScale = map['minimumZoomScale'];
    instance.needInitialFocus = map['needInitialFocus'];
    instance.nonClientRegionSupportEnabled =
        map['nonClientRegionSupportEnabled'];
    instance.offscreenPreRaster = map['offscreenPreRaster'];
    instance.overScrollMode = switch (enumMethod ??
        CygnusEnumMethod.nativeValue) {
      CygnusEnumMethod.nativeValue => CygnusOverScrollMode.fromNativeValue(
        map['overScrollMode'],
      ),
      CygnusEnumMethod.value => CygnusOverScrollMode.fromValue(
        map['overScrollMode'],
      ),
      CygnusEnumMethod.name => CygnusOverScrollMode.byName(
        map['overScrollMode'],
      ),
    };
    instance.pageZoom = map['pageZoom'];
    instance.passwordAutosaveEnabled = map['passwordAutosaveEnabled'];
    instance.pinchZoomEnabled = map['pinchZoomEnabled'];
    instance.pluginScriptsForMainFrameOnly =
        map['pluginScriptsForMainFrameOnly'];
    instance.preferredContentMode = switch (enumMethod ??
        CygnusEnumMethod.nativeValue) {
      CygnusEnumMethod.nativeValue =>
        CygnusUserPreferredContentMode.fromNativeValue(
          map['preferredContentMode'],
        ),
      CygnusEnumMethod.value => CygnusUserPreferredContentMode.fromValue(
        map['preferredContentMode'],
      ),
      CygnusEnumMethod.name => CygnusUserPreferredContentMode.byName(
        map['preferredContentMode'],
      ),
    };
    instance.reputationCheckingRequired = map['reputationCheckingRequired'];
    instance.resourceCustomSchemes = map['resourceCustomSchemes'] != null
        ? List<String>.from(map['resourceCustomSchemes']!.cast<String>())
        : null;
    instance.safeBrowsingEnabled = map['safeBrowsingEnabled'];
    instance.sansSerifFontFamily = map['sansSerifFontFamily'];
    instance.saveFormData = map['saveFormData'];
    instance.scrollBarStyle = switch (enumMethod ??
        CygnusEnumMethod.nativeValue) {
      CygnusEnumMethod.nativeValue => CygnusScrollBarStyle.fromNativeValue(
        map['scrollBarStyle'],
      ),
      CygnusEnumMethod.value => CygnusScrollBarStyle.fromValue(
        map['scrollBarStyle'],
      ),
      CygnusEnumMethod.name => CygnusScrollBarStyle.byName(
        map['scrollBarStyle'],
      ),
    };
    instance.scrollMultiplier = map['scrollMultiplier'];
    instance.scrollbarFadingEnabled = map['scrollbarFadingEnabled'];
    instance.scrollsToTop = map['scrollsToTop'];
    instance.selectionGranularity = switch (enumMethod ??
        CygnusEnumMethod.nativeValue) {
      CygnusEnumMethod.nativeValue =>
        CygnusSelectionGranularity.fromNativeValue(map['selectionGranularity']),
      CygnusEnumMethod.value => CygnusSelectionGranularity.fromValue(
        map['selectionGranularity'],
      ),
      CygnusEnumMethod.name => CygnusSelectionGranularity.byName(
        map['selectionGranularity'],
      ),
    };
    instance.serifFontFamily = map['serifFontFamily'];
    instance.sharedCookiesEnabled = map['sharedCookiesEnabled'];
    instance.shouldPrintBackgrounds = map['shouldPrintBackgrounds'];
    instance.standardFontFamily = map['standardFontFamily'];
    instance.statusBarEnabled = map['statusBarEnabled'];
    instance.supportMultipleWindows = map['supportMultipleWindows'];
    instance.supportZoom = map['supportZoom'];
    instance.suppressesIncrementalRendering =
        map['suppressesIncrementalRendering'];
    instance.thirdPartyCookiesEnabled = map['thirdPartyCookiesEnabled'];
    instance.transparentBackground = map['transparentBackground'];
    instance.upgradeKnownHostsToHTTPS = map['upgradeKnownHostsToHTTPS'];
    instance.useHybridComposition = map['useHybridComposition'];
    instance.useWideViewPort = map['useWideViewPort'];
    instance.userAgent = map['userAgent'];
    instance.verticalScrollBarEnabled = map['verticalScrollBarEnabled'];
    instance.verticalScrollbarPosition = switch (enumMethod ??
        CygnusEnumMethod.nativeValue) {
      CygnusEnumMethod.nativeValue =>
        CygnusVerticalScrollbarPosition.fromNativeValue(
          map['verticalScrollbarPosition'],
        ),
      CygnusEnumMethod.value => CygnusVerticalScrollbarPosition.fromValue(
        map['verticalScrollbarPosition'],
      ),
      CygnusEnumMethod.name => CygnusVerticalScrollbarPosition.byName(
        map['verticalScrollbarPosition'],
      ),
    };
    return instance;
  }

  ///Check if the given [property] is supported by the [defaultTargetPlatform] or a specific [platform].
  static bool isPropertySupported(
    CygnusWebViewSettingsProperty property, {
    TargetPlatform? platform,
  }) => _CygnusWebViewSettingsPropertySupported.isPropertySupported(
    property,
    platform: platform,
  );

  ///Converts instance to a map.
  Map<String, dynamic> toMap({CygnusEnumMethod? enumMethod}) {
    return {
      "accessibilityIgnoresInvertColors": accessibilityIgnoresInvertColors,
      "algorithmicDarkeningAllowed": algorithmicDarkeningAllowed,
      "allowBackgroundAudioPlaying": allowBackgroundAudioPlaying,
      "allowContentAccess": allowContentAccess,
      "allowFileAccess": allowFileAccess,
      "allowFileAccessFromFileURLs": allowFileAccessFromFileURLs,
      "allowModalDialogs": allowModalDialogs,
      "allowTopNavigationToDataUrls": allowTopNavigationToDataUrls,
      "allowUniversalAccessFromFileURLs": allowUniversalAccessFromFileURLs,
      "allowingReadAccessTo": allowingReadAccessTo?.toString(),
      "allowsAirPlayForMediaPlayback": allowsAirPlayForMediaPlayback,
      "allowsBackForwardNavigationGestures":
          allowsBackForwardNavigationGestures,
      "allowsInlineMediaPlayback": allowsInlineMediaPlayback,
      "allowsLinkPreview": allowsLinkPreview,
      "allowsPictureInPictureMediaPlayback":
          allowsPictureInPictureMediaPlayback,
      "alpha": alpha,
      "alwaysBounceHorizontal": alwaysBounceHorizontal,
      "alwaysBounceVertical": alwaysBounceVertical,
      "androidCompositionMode": switch (enumMethod ??
          CygnusEnumMethod.nativeValue) {
        CygnusEnumMethod.nativeValue => androidCompositionMode?.toNativeValue(),
        CygnusEnumMethod.value => androidCompositionMode?.toValue(),
        CygnusEnumMethod.name => androidCompositionMode?.name(),
      },
      "appCachePath": appCachePath,
      "applePayAPIEnabled": applePayAPIEnabled,
      "applicationNameForUserAgent": applicationNameForUserAgent,
      "automaticallyAdjustsScrollIndicatorInsets":
          automaticallyAdjustsScrollIndicatorInsets,
      "blockNetworkImage": blockNetworkImage,
      "blockNetworkLoads": blockNetworkLoads,
      "browserAcceleratorKeysEnabled": browserAcceleratorKeysEnabled,
      "builtInZoomControls": builtInZoomControls,
      "cacheEnabled": cacheEnabled,
      "cacheMode": switch (enumMethod ?? CygnusEnumMethod.nativeValue) {
        CygnusEnumMethod.nativeValue => cacheMode?.toNativeValue(),
        CygnusEnumMethod.value => cacheMode?.toValue(),
        CygnusEnumMethod.name => cacheMode?.name(),
      },
      "clearCache": clearCache,
      "clearSessionCache": clearSessionCache,
      "contentBlockers": contentBlockers
          ?.map((e) => e.toMap(enumMethod: enumMethod))
          .toList(),
      "contentInsetAdjustmentBehavior": switch (enumMethod ??
          CygnusEnumMethod.nativeValue) {
        CygnusEnumMethod.nativeValue =>
          contentInsetAdjustmentBehavior?.toNativeValue(),
        CygnusEnumMethod.value => contentInsetAdjustmentBehavior?.toValue(),
        CygnusEnumMethod.name => contentInsetAdjustmentBehavior?.name(),
      },
      "corsAllowlist": corsAllowlist,
      "cursiveFontFamily": cursiveFontFamily,
      "cursorBlinkTime": cursorBlinkTime,
      "darkMode": darkMode,
      "dataDetectorTypes": dataDetectorTypes
          ?.map(
            (e) => switch (enumMethod ?? CygnusEnumMethod.nativeValue) {
              CygnusEnumMethod.nativeValue => e.toNativeValue(),
              CygnusEnumMethod.value => e.toValue(),
              CygnusEnumMethod.name => e.name(),
            },
          )
          .toList(),
      "databaseEnabled": databaseEnabled,
      "decelerationRate": switch (enumMethod ?? CygnusEnumMethod.nativeValue) {
        CygnusEnumMethod.nativeValue => decelerationRate?.toNativeValue(),
        CygnusEnumMethod.value => decelerationRate?.toValue(),
        CygnusEnumMethod.name => decelerationRate?.name(),
      },
      "defaultFixedFontSize": defaultFixedFontSize,
      "defaultFontSize": defaultFontSize,
      "defaultTextEncodingName": defaultTextEncodingName,
      "defaultVideoPoster": defaultVideoPoster,
      "disableAnimations": disableAnimations,
      "disableContextMenu": disableContextMenu,
      "disableDefaultErrorPage": disableDefaultErrorPage,
      "disableHorizontalScroll": disableHorizontalScroll,
      "disableInputAccessoryView": disableInputAccessoryView,
      "disableLongPressContextMenuOnLinks": disableLongPressContextMenuOnLinks,
      "disableVerticalScroll": disableVerticalScroll,
      "disableWebSecurity": disableWebSecurity,
      "disabledActionModeMenuItems": switch (enumMethod ??
          CygnusEnumMethod.nativeValue) {
        CygnusEnumMethod.nativeValue =>
          disabledActionModeMenuItems?.toNativeValue(),
        CygnusEnumMethod.value => disabledActionModeMenuItems?.toValue(),
        CygnusEnumMethod.name => disabledActionModeMenuItems?.name(),
      },
      "disallowOverScroll": disallowOverScroll,
      "displayZoomControls": displayZoomControls,
      "domStorageEnabled": domStorageEnabled,
      "doubleClickDistance": doubleClickDistance,
      "doubleClickTime": doubleClickTime,
      "dragThreshold": dragThreshold,
      "drawCompositingIndicators": drawCompositingIndicators,
      "enable2DCanvasAcceleration": enable2DCanvasAcceleration,
      "enableCaretBrowsing": enableCaretBrowsing,
      "enableEncryptedMedia": enableEncryptedMedia,
      "enableJavaScriptMarkup": enableJavaScriptMarkup,
      "enableMedia": enableMedia,
      "enableMediaCapabilities": enableMediaCapabilities,
      "enableMockCaptureDevices": enableMockCaptureDevices,
      "enablePageCache": enablePageCache,
      "enableResizableTextAreas": enableResizableTextAreas,
      "enableSmoothScrolling": enableSmoothScrolling,
      "enableSpatialNavigation": enableSpatialNavigation,
      "enableTabsToLinks": enableTabsToLinks,
      "enableViewportScale": enableViewportScale,
      "enableWebRTC": enableWebRTC,
      "enableWriteConsoleMessagesToStdout": enableWriteConsoleMessagesToStdout,
      "enterpriseAuthenticationAppLinkPolicyEnabled":
          enterpriseAuthenticationAppLinkPolicyEnabled,
      "fantasyFontFamily": fantasyFontFamily,
      "fixedFontFamily": fixedFontFamily,
      "fontAntialias": fontAntialias,
      "fontDPI": fontDPI,
      "fontHintingStyle": switch (enumMethod ?? CygnusEnumMethod.nativeValue) {
        CygnusEnumMethod.nativeValue => fontHintingStyle?.toNativeValue(),
        CygnusEnumMethod.value => fontHintingStyle?.toValue(),
        CygnusEnumMethod.name => fontHintingStyle?.name(),
      },
      "fontSubpixelLayout": switch (enumMethod ??
          CygnusEnumMethod.nativeValue) {
        CygnusEnumMethod.nativeValue => fontSubpixelLayout?.toNativeValue(),
        CygnusEnumMethod.value => fontSubpixelLayout?.toValue(),
        CygnusEnumMethod.name => fontSubpixelLayout?.name(),
      },
      "forceDark": switch (enumMethod ?? CygnusEnumMethod.nativeValue) {
        CygnusEnumMethod.nativeValue => forceDark?.toNativeValue(),
        CygnusEnumMethod.value => forceDark?.toValue(),
        CygnusEnumMethod.name => forceDark?.name(),
      },
      "forceDarkStrategy": switch (enumMethod ?? CygnusEnumMethod.nativeValue) {
        CygnusEnumMethod.nativeValue => forceDarkStrategy?.toNativeValue(),
        CygnusEnumMethod.value => forceDarkStrategy?.toValue(),
        CygnusEnumMethod.name => forceDarkStrategy?.name(),
      },
      "generalAutofillEnabled": generalAutofillEnabled,
      "geolocationEnabled": geolocationEnabled,
      "handleAcceleratorKeyPressed": handleAcceleratorKeyPressed,
      "hardwareAcceleration": hardwareAcceleration,
      "hiddenPdfToolbarItems": switch (enumMethod ??
          CygnusEnumMethod.nativeValue) {
        CygnusEnumMethod.nativeValue => hiddenPdfToolbarItems?.toNativeValue(),
        CygnusEnumMethod.value => hiddenPdfToolbarItems?.toValue(),
        CygnusEnumMethod.name => hiddenPdfToolbarItems?.name(),
      },
      "horizontalScrollBarEnabled": horizontalScrollBarEnabled,
      "horizontalScrollbarThumbColor": horizontalScrollbarThumbColor?.toHex(),
      "horizontalScrollbarTrackColor": horizontalScrollbarTrackColor?.toHex(),
      "iframeAllow": iframeAllow,
      "iframeAllowFullscreen": iframeAllowFullscreen,
      "iframeAriaHidden": iframeAriaHidden,
      "iframeCsp": iframeCsp,
      "iframeName": iframeName,
      "iframeReferrerPolicy": switch (enumMethod ??
          CygnusEnumMethod.nativeValue) {
        CygnusEnumMethod.nativeValue => iframeReferrerPolicy?.toNativeValue(),
        CygnusEnumMethod.value => iframeReferrerPolicy?.toValue(),
        CygnusEnumMethod.name => iframeReferrerPolicy?.name(),
      },
      "iframeRole": iframeRole,
      "iframeSandbox": iframeSandbox
          ?.map(
            (e) => switch (enumMethod ?? CygnusEnumMethod.nativeValue) {
              CygnusEnumMethod.nativeValue => e.toNativeValue(),
              CygnusEnumMethod.value => e.toValue(),
              CygnusEnumMethod.name => e.name(),
            },
          )
          .toList(),
      "ignoresViewportScaleLimits": ignoresViewportScaleLimits,
      "incognito": incognito,
      "initialScale": initialScale,
      "interceptOnlyAsyncAjaxRequests": interceptOnlyAsyncAjaxRequests,
      "isDirectionalLockEnabled": isDirectionalLockEnabled,
      "isElementFullscreenEnabled": isElementFullscreenEnabled,
      "isFindInteractionEnabled": isFindInteractionEnabled,
      "isFraudulentWebsiteWarningEnabled": isFraudulentWebsiteWarningEnabled,
      "isInspectable": isInspectable,
      "isPagingEnabled": isPagingEnabled,
      "isSiteSpecificQuirksModeEnabled": isSiteSpecificQuirksModeEnabled,
      "isTextInteractionEnabled": isTextInteractionEnabled,
      "isUserInteractionEnabled": isUserInteractionEnabled,
      "itpEnabled": itpEnabled,
      "javaScriptBridgeEnabled": javaScriptBridgeEnabled,
      "javaScriptBridgeForMainFrameOnly": javaScriptBridgeForMainFrameOnly,
      "javaScriptBridgeOriginAllowList": javaScriptBridgeOriginAllowList
          ?.toList(),
      "javaScriptCanAccessClipboard": javaScriptCanAccessClipboard,
      "javaScriptCanOpenWindowsAutomatically":
          javaScriptCanOpenWindowsAutomatically,
      "javaScriptEnabled": javaScriptEnabled,
      "javaScriptHandlersForMainFrameOnly": javaScriptHandlersForMainFrameOnly,
      "javaScriptHandlersOriginAllowList": javaScriptHandlersOriginAllowList
          ?.toList(),
      "keyRepeatDelay": keyRepeatDelay,
      "keyRepeatInterval": keyRepeatInterval,
      "keyboardAvoidance": keyboardAvoidance,
      "layoutAlgorithm": switch (enumMethod ?? CygnusEnumMethod.nativeValue) {
        CygnusEnumMethod.nativeValue => layoutAlgorithm?.toNativeValue(),
        CygnusEnumMethod.value => layoutAlgorithm?.toValue(),
        CygnusEnumMethod.name => layoutAlgorithm?.name(),
      },
      "limitsNavigationsToAppBoundDomains": limitsNavigationsToAppBoundDomains,
      "loadWithOverviewMode": loadWithOverviewMode,
      "loadsImagesAutomatically": loadsImagesAutomatically,
      "maximumViewportInset": maximumViewportInset?.toMap(),
      "maximumZoomScale": maximumZoomScale,
      "mediaContentTypesRequiringHardwareSupport":
          mediaContentTypesRequiringHardwareSupport,
      "mediaPlaybackRequiresUserGesture": mediaPlaybackRequiresUserGesture,
      "mediaType": mediaType,
      "minimumFontSize": minimumFontSize,
      "minimumLogicalFontSize": minimumLogicalFontSize,
      "minimumViewportInset": minimumViewportInset?.toMap(),
      "minimumZoomScale": minimumZoomScale,
      "mixedContentMode": switch (enumMethod ?? CygnusEnumMethod.nativeValue) {
        CygnusEnumMethod.nativeValue => mixedContentMode?.toNativeValue(),
        CygnusEnumMethod.value => mixedContentMode?.toValue(),
        CygnusEnumMethod.name => mixedContentMode?.name(),
      },
      "needInitialFocus": needInitialFocus,
      "networkAvailable": networkAvailable,
      "nonClientRegionSupportEnabled": nonClientRegionSupportEnabled,
      "offscreenPreRaster": offscreenPreRaster,
      "overScrollMode": switch (enumMethod ?? CygnusEnumMethod.nativeValue) {
        CygnusEnumMethod.nativeValue => overScrollMode?.toNativeValue(),
        CygnusEnumMethod.value => overScrollMode?.toValue(),
        CygnusEnumMethod.name => overScrollMode?.name(),
      },
      "pageZoom": pageZoom,
      "passwordAutosaveEnabled": passwordAutosaveEnabled,
      "pictographFontFamily": pictographFontFamily,
      "pinchZoomEnabled": pinchZoomEnabled,
      "pluginScriptsForMainFrameOnly": pluginScriptsForMainFrameOnly,
      "pluginScriptsOriginAllowList": pluginScriptsOriginAllowList?.toList(),
      "preferredContentMode": switch (enumMethod ??
          CygnusEnumMethod.nativeValue) {
        CygnusEnumMethod.nativeValue => preferredContentMode?.toNativeValue(),
        CygnusEnumMethod.value => preferredContentMode?.toValue(),
        CygnusEnumMethod.name => preferredContentMode?.name(),
      },
      "regexToAllowSyncUrlLoading": regexToAllowSyncUrlLoading,
      "regexToCancelSubFramesLoading": regexToCancelSubFramesLoading,
      "rendererPriorityPolicy": rendererPriorityPolicy?.toMap(
        enumMethod: enumMethod,
      ),
      "reputationCheckingRequired": reputationCheckingRequired,
      "requestedWithHeaderOriginAllowList": requestedWithHeaderOriginAllowList
          ?.toList(),
      "resourceCustomSchemes": resourceCustomSchemes,
      "safeBrowsingEnabled": safeBrowsingEnabled,
      "sansSerifFontFamily": sansSerifFontFamily,
      "saveFormData": saveFormData,
      "scrollBarDefaultDelayBeforeFade": scrollBarDefaultDelayBeforeFade,
      "scrollBarFadeDuration": scrollBarFadeDuration,
      "scrollBarStyle": switch (enumMethod ?? CygnusEnumMethod.nativeValue) {
        CygnusEnumMethod.nativeValue => scrollBarStyle?.toNativeValue(),
        CygnusEnumMethod.value => scrollBarStyle?.toValue(),
        CygnusEnumMethod.name => scrollBarStyle?.name(),
      },
      "scrollMultiplier": scrollMultiplier,
      "scrollbarFadingEnabled": scrollbarFadingEnabled,
      "scrollsToTop": scrollsToTop,
      "selectionGranularity": switch (enumMethod ??
          CygnusEnumMethod.nativeValue) {
        CygnusEnumMethod.nativeValue => selectionGranularity?.toNativeValue(),
        CygnusEnumMethod.value => selectionGranularity?.toValue(),
        CygnusEnumMethod.name => selectionGranularity?.name(),
      },
      "serifFontFamily": serifFontFamily,
      "sharedCookiesEnabled": sharedCookiesEnabled,
      "shouldPrintBackgrounds": shouldPrintBackgrounds,
      "standardFontFamily": standardFontFamily,
      "statusBarEnabled": statusBarEnabled,
      "supportMultipleWindows": supportMultipleWindows,
      "supportZoom": supportZoom,
      "suppressesIncrementalRendering": suppressesIncrementalRendering,
      "textZoom": textZoom,
      "thirdPartyCookiesEnabled": thirdPartyCookiesEnabled,
      "transparentBackground": transparentBackground,
      "underPageBackgroundColor": underPageBackgroundColor?.toHex(),
      "upgradeKnownHostsToHTTPS": upgradeKnownHostsToHTTPS,
      "useHybridComposition": useHybridComposition,
      "useOnAjaxProgress": useOnAjaxProgress,
      "useOnAjaxReadyStateChange": useOnAjaxReadyStateChange,
      "useOnDownloadStart": useOnDownloadStart,
      "useOnLoadResource": useOnLoadResource,
      "useOnNavigationResponse": useOnNavigationResponse,
      "useOnRenderProcessGone": useOnRenderProcessGone,
      "useOnShowFileChooser": useOnShowFileChooser,
      "useShouldInterceptAjaxRequest": useShouldInterceptAjaxRequest,
      "useShouldInterceptFetchRequest": useShouldInterceptFetchRequest,
      "useShouldInterceptRequest": useShouldInterceptRequest,
      "useShouldOverrideUrlLoading": useShouldOverrideUrlLoading,
      "useWideViewPort": useWideViewPort,
      "userAgent": userAgent,
      "verticalScrollBarEnabled": verticalScrollBarEnabled,
      "verticalScrollbarPosition": switch (enumMethod ??
          CygnusEnumMethod.nativeValue) {
        CygnusEnumMethod.nativeValue =>
          verticalScrollbarPosition?.toNativeValue(),
        CygnusEnumMethod.value => verticalScrollbarPosition?.toValue(),
        CygnusEnumMethod.name => verticalScrollbarPosition?.name(),
      },
      "verticalScrollbarThumbColor": verticalScrollbarThumbColor?.toHex(),
      "verticalScrollbarTrackColor": verticalScrollbarTrackColor?.toHex(),
      "webRTCUdpPortsRange": webRTCUdpPortsRange,
      "webViewAssetLoader": webViewAssetLoader?.toMap(enumMethod: enumMethod),
    };
  }

  ///Converts instance to a map.
  Map<String, dynamic> toJson() {
    return toMap();
  }

  ///Returns a copy of CygnusWebViewSettings.
  CygnusWebViewSettings copy() {
    return CygnusWebViewSettings.fromMap(toMap()) ?? CygnusWebViewSettings();
  }

  @override
  String toString() {
    return 'CygnusWebViewSettings{accessibilityIgnoresInvertColors: $accessibilityIgnoresInvertColors, algorithmicDarkeningAllowed: $algorithmicDarkeningAllowed, allowBackgroundAudioPlaying: $allowBackgroundAudioPlaying, allowContentAccess: $allowContentAccess, allowFileAccess: $allowFileAccess, allowFileAccessFromFileURLs: $allowFileAccessFromFileURLs, allowModalDialogs: $allowModalDialogs, allowTopNavigationToDataUrls: $allowTopNavigationToDataUrls, allowUniversalAccessFromFileURLs: $allowUniversalAccessFromFileURLs, allowingReadAccessTo: $allowingReadAccessTo, allowsAirPlayForMediaPlayback: $allowsAirPlayForMediaPlayback, allowsBackForwardNavigationGestures: $allowsBackForwardNavigationGestures, allowsInlineMediaPlayback: $allowsInlineMediaPlayback, allowsLinkPreview: $allowsLinkPreview, allowsPictureInPictureMediaPlayback: $allowsPictureInPictureMediaPlayback, alpha: $alpha, alwaysBounceHorizontal: $alwaysBounceHorizontal, alwaysBounceVertical: $alwaysBounceVertical, androidCompositionMode: $androidCompositionMode, appCachePath: $appCachePath, applePayAPIEnabled: $applePayAPIEnabled, applicationNameForUserAgent: $applicationNameForUserAgent, automaticallyAdjustsScrollIndicatorInsets: $automaticallyAdjustsScrollIndicatorInsets, blockNetworkImage: $blockNetworkImage, blockNetworkLoads: $blockNetworkLoads, browserAcceleratorKeysEnabled: $browserAcceleratorKeysEnabled, builtInZoomControls: $builtInZoomControls, cacheEnabled: $cacheEnabled, cacheMode: $cacheMode, contentBlockers: $contentBlockers, contentInsetAdjustmentBehavior: $contentInsetAdjustmentBehavior, corsAllowlist: $corsAllowlist, cursiveFontFamily: $cursiveFontFamily, cursorBlinkTime: $cursorBlinkTime, darkMode: $darkMode, dataDetectorTypes: $dataDetectorTypes, databaseEnabled: $databaseEnabled, decelerationRate: $decelerationRate, defaultFixedFontSize: $defaultFixedFontSize, defaultFontSize: $defaultFontSize, defaultTextEncodingName: $defaultTextEncodingName, defaultVideoPoster: $defaultVideoPoster, disableAnimations: $disableAnimations, disableContextMenu: $disableContextMenu, disableDefaultErrorPage: $disableDefaultErrorPage, disableHorizontalScroll: $disableHorizontalScroll, disableInputAccessoryView: $disableInputAccessoryView, disableLongPressContextMenuOnLinks: $disableLongPressContextMenuOnLinks, disableVerticalScroll: $disableVerticalScroll, disableWebSecurity: $disableWebSecurity, disabledActionModeMenuItems: $disabledActionModeMenuItems, disallowOverScroll: $disallowOverScroll, displayZoomControls: $displayZoomControls, domStorageEnabled: $domStorageEnabled, doubleClickDistance: $doubleClickDistance, doubleClickTime: $doubleClickTime, dragThreshold: $dragThreshold, drawCompositingIndicators: $drawCompositingIndicators, enable2DCanvasAcceleration: $enable2DCanvasAcceleration, enableCaretBrowsing: $enableCaretBrowsing, enableEncryptedMedia: $enableEncryptedMedia, enableJavaScriptMarkup: $enableJavaScriptMarkup, enableMedia: $enableMedia, enableMediaCapabilities: $enableMediaCapabilities, enableMockCaptureDevices: $enableMockCaptureDevices, enablePageCache: $enablePageCache, enableResizableTextAreas: $enableResizableTextAreas, enableSmoothScrolling: $enableSmoothScrolling, enableSpatialNavigation: $enableSpatialNavigation, enableTabsToLinks: $enableTabsToLinks, enableViewportScale: $enableViewportScale, enableWebRTC: $enableWebRTC, enableWriteConsoleMessagesToStdout: $enableWriteConsoleMessagesToStdout, enterpriseAuthenticationAppLinkPolicyEnabled: $enterpriseAuthenticationAppLinkPolicyEnabled, fantasyFontFamily: $fantasyFontFamily, fixedFontFamily: $fixedFontFamily, fontAntialias: $fontAntialias, fontDPI: $fontDPI, fontHintingStyle: $fontHintingStyle, fontSubpixelLayout: $fontSubpixelLayout, generalAutofillEnabled: $generalAutofillEnabled, geolocationEnabled: $geolocationEnabled, handleAcceleratorKeyPressed: $handleAcceleratorKeyPressed, hardwareAcceleration: $hardwareAcceleration, hiddenPdfToolbarItems: $hiddenPdfToolbarItems, horizontalScrollBarEnabled: $horizontalScrollBarEnabled, horizontalScrollbarThumbColor: $horizontalScrollbarThumbColor, horizontalScrollbarTrackColor: $horizontalScrollbarTrackColor, iframeAllow: $iframeAllow, iframeAllowFullscreen: $iframeAllowFullscreen, iframeAriaHidden: $iframeAriaHidden, iframeCsp: $iframeCsp, iframeName: $iframeName, iframeReferrerPolicy: $iframeReferrerPolicy, iframeRole: $iframeRole, iframeSandbox: $iframeSandbox, ignoresViewportScaleLimits: $ignoresViewportScaleLimits, incognito: $incognito, initialScale: $initialScale, interceptOnlyAsyncAjaxRequests: $interceptOnlyAsyncAjaxRequests, isDirectionalLockEnabled: $isDirectionalLockEnabled, isElementFullscreenEnabled: $isElementFullscreenEnabled, isFindInteractionEnabled: $isFindInteractionEnabled, isFraudulentWebsiteWarningEnabled: $isFraudulentWebsiteWarningEnabled, isInspectable: $isInspectable, isPagingEnabled: $isPagingEnabled, isSiteSpecificQuirksModeEnabled: $isSiteSpecificQuirksModeEnabled, isTextInteractionEnabled: $isTextInteractionEnabled, isUserInteractionEnabled: $isUserInteractionEnabled, itpEnabled: $itpEnabled, javaScriptBridgeEnabled: $javaScriptBridgeEnabled, javaScriptBridgeForMainFrameOnly: $javaScriptBridgeForMainFrameOnly, javaScriptBridgeOriginAllowList: $javaScriptBridgeOriginAllowList, javaScriptCanAccessClipboard: $javaScriptCanAccessClipboard, javaScriptCanOpenWindowsAutomatically: $javaScriptCanOpenWindowsAutomatically, javaScriptEnabled: $javaScriptEnabled, javaScriptHandlersForMainFrameOnly: $javaScriptHandlersForMainFrameOnly, javaScriptHandlersOriginAllowList: $javaScriptHandlersOriginAllowList, keyRepeatDelay: $keyRepeatDelay, keyRepeatInterval: $keyRepeatInterval, keyboardAvoidance: $keyboardAvoidance, layoutAlgorithm: $layoutAlgorithm, limitsNavigationsToAppBoundDomains: $limitsNavigationsToAppBoundDomains, loadWithOverviewMode: $loadWithOverviewMode, loadsImagesAutomatically: $loadsImagesAutomatically, maximumViewportInset: $maximumViewportInset, maximumZoomScale: $maximumZoomScale, mediaContentTypesRequiringHardwareSupport: $mediaContentTypesRequiringHardwareSupport, mediaPlaybackRequiresUserGesture: $mediaPlaybackRequiresUserGesture, mediaType: $mediaType, minimumFontSize: $minimumFontSize, minimumLogicalFontSize: $minimumLogicalFontSize, minimumViewportInset: $minimumViewportInset, minimumZoomScale: $minimumZoomScale, mixedContentMode: $mixedContentMode, needInitialFocus: $needInitialFocus, networkAvailable: $networkAvailable, nonClientRegionSupportEnabled: $nonClientRegionSupportEnabled, offscreenPreRaster: $offscreenPreRaster, overScrollMode: $overScrollMode, pageZoom: $pageZoom, passwordAutosaveEnabled: $passwordAutosaveEnabled, pictographFontFamily: $pictographFontFamily, pinchZoomEnabled: $pinchZoomEnabled, pluginScriptsForMainFrameOnly: $pluginScriptsForMainFrameOnly, pluginScriptsOriginAllowList: $pluginScriptsOriginAllowList, preferredContentMode: $preferredContentMode, regexToAllowSyncUrlLoading: $regexToAllowSyncUrlLoading, regexToCancelSubFramesLoading: $regexToCancelSubFramesLoading, rendererPriorityPolicy: $rendererPriorityPolicy, reputationCheckingRequired: $reputationCheckingRequired, requestedWithHeaderOriginAllowList: $requestedWithHeaderOriginAllowList, resourceCustomSchemes: $resourceCustomSchemes, safeBrowsingEnabled: $safeBrowsingEnabled, sansSerifFontFamily: $sansSerifFontFamily, scrollBarDefaultDelayBeforeFade: $scrollBarDefaultDelayBeforeFade, scrollBarFadeDuration: $scrollBarFadeDuration, scrollBarStyle: $scrollBarStyle, scrollMultiplier: $scrollMultiplier, scrollbarFadingEnabled: $scrollbarFadingEnabled, scrollsToTop: $scrollsToTop, selectionGranularity: $selectionGranularity, serifFontFamily: $serifFontFamily, sharedCookiesEnabled: $sharedCookiesEnabled, shouldPrintBackgrounds: $shouldPrintBackgrounds, standardFontFamily: $standardFontFamily, statusBarEnabled: $statusBarEnabled, supportMultipleWindows: $supportMultipleWindows, supportZoom: $supportZoom, suppressesIncrementalRendering: $suppressesIncrementalRendering, textZoom: $textZoom, thirdPartyCookiesEnabled: $thirdPartyCookiesEnabled, transparentBackground: $transparentBackground, underPageBackgroundColor: $underPageBackgroundColor, upgradeKnownHostsToHTTPS: $upgradeKnownHostsToHTTPS, useOnAjaxProgress: $useOnAjaxProgress, useOnAjaxReadyStateChange: $useOnAjaxReadyStateChange, useOnDownloadStart: $useOnDownloadStart, useOnLoadResource: $useOnLoadResource, useOnNavigationResponse: $useOnNavigationResponse, useOnRenderProcessGone: $useOnRenderProcessGone, useOnShowFileChooser: $useOnShowFileChooser, useShouldInterceptAjaxRequest: $useShouldInterceptAjaxRequest, useShouldInterceptFetchRequest: $useShouldInterceptFetchRequest, useShouldInterceptRequest: $useShouldInterceptRequest, useShouldOverrideUrlLoading: $useShouldOverrideUrlLoading, useWideViewPort: $useWideViewPort, userAgent: $userAgent, verticalScrollBarEnabled: $verticalScrollBarEnabled, verticalScrollbarPosition: $verticalScrollbarPosition, verticalScrollbarThumbColor: $verticalScrollbarThumbColor, verticalScrollbarTrackColor: $verticalScrollbarTrackColor, webRTCUdpPortsRange: $webRTCUdpPortsRange, webViewAssetLoader: $webViewAssetLoader}';
  }
}

// **************************************************************************
// SupportedPlatformsGenerator
// **************************************************************************

///List of [CygnusWebViewSettings]'s properties that can be used to check i they are supported or not by the current platform.
enum CygnusWebViewSettingsProperty {
  ///Can be used to check if the [CygnusWebViewSettings.accessibilityIgnoresInvertColors] property is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusWebViewSettings.accessibilityIgnoresInvertColors.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- iOS WKWebView 11.0+ ([Official API - UIView.accessibilityIgnoresInvertColors](https://developer.apple.com/documentation/uikit/uiview/2865843-accessibilityignoresinvertcolors))
  ///
  ///Use the [CygnusWebViewSettings.isPropertySupported] method to check if this property is supported at runtime.
  ///{@endtemplate}
  accessibilityIgnoresInvertColors,

  ///Can be used to check if the [CygnusWebViewSettings.algorithmicDarkeningAllowed] property is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusWebViewSettings.algorithmicDarkeningAllowed.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView 29+ ([Official API - WebSettingsCompat.setAlgorithmicDarkeningAllowed](https://developer.android.com/reference/androidx/webkit/WebSettingsCompat#setAlgorithmicDarkeningAllowed(android.webkit.WebSettings,boolean))):
  ///    - available on Android only if [CygnusWebViewFeature.ALGORITHMIC_DARKENING] feature is supported.
  ///
  ///Use the [CygnusWebViewSettings.isPropertySupported] method to check if this property is supported at runtime.
  ///{@endtemplate}
  algorithmicDarkeningAllowed,

  ///Can be used to check if the [CygnusWebViewSettings.allowBackgroundAudioPlaying] property is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusWebViewSettings.allowBackgroundAudioPlaying.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView
  ///
  ///Use the [CygnusWebViewSettings.isPropertySupported] method to check if this property is supported at runtime.
  ///{@endtemplate}
  allowBackgroundAudioPlaying,

  ///Can be used to check if the [CygnusWebViewSettings.allowContentAccess] property is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusWebViewSettings.allowContentAccess.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView ([Official API - WebSettings.setAllowContentAccess](https://developer.android.com/reference/android/webkit/WebSettings?hl=en#setAllowContentAccess(boolean)))
  ///
  ///Use the [CygnusWebViewSettings.isPropertySupported] method to check if this property is supported at runtime.
  ///{@endtemplate}
  allowContentAccess,

  ///Can be used to check if the [CygnusWebViewSettings.allowFileAccess] property is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusWebViewSettings.allowFileAccess.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView ([Official API - WebSettings.setAllowFileAccess](https://developer.android.com/reference/android/webkit/WebSettings?hl=en#setAllowFileAccess(boolean)))
  ///
  ///Use the [CygnusWebViewSettings.isPropertySupported] method to check if this property is supported at runtime.
  ///{@endtemplate}
  allowFileAccess,

  ///Can be used to check if the [CygnusWebViewSettings.allowFileAccessFromFileURLs] property is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusWebViewSettings.allowFileAccessFromFileURLs.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView ([Official API - WebSettings.setAllowFileAccessFromFileURLs](https://developer.android.com/reference/android/webkit/WebSettings?hl=en#setAllowFileAccessFromFileURLs(boolean)))
  ///- iOS WKWebView
  ///- macOS WKWebView
  ///- Linux WPE WebKit 2.10+ ([Official API - WebKitSettings.allow-file-access-from-file-urls](https://wpewebkit.org/reference/stable/wpe-webkit-2.0/property.Settings.allow-file-access-from-file-urls.html))
  ///
  ///Use the [CygnusWebViewSettings.isPropertySupported] method to check if this property is supported at runtime.
  ///{@endtemplate}
  allowFileAccessFromFileURLs,

  ///Can be used to check if the [CygnusWebViewSettings.allowModalDialogs] property is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusWebViewSettings.allowModalDialogs.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Linux WPE WebKit ([Official API - WebKitSettings.allow-modal-dialogs](https://wpewebkit.org/reference/stable/wpe-webkit-2.0/property.Settings.allow-modal-dialogs.html))
  ///
  ///Use the [CygnusWebViewSettings.isPropertySupported] method to check if this property is supported at runtime.
  ///{@endtemplate}
  allowModalDialogs,

  ///Can be used to check if the [CygnusWebViewSettings.allowTopNavigationToDataUrls] property is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusWebViewSettings.allowTopNavigationToDataUrls.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Linux WPE WebKit 2.28+ ([Official API - WebKitSettings.allow-top-navigation-to-data-urls](https://wpewebkit.org/reference/stable/wpe-webkit-2.0/property.Settings.allow-top-navigation-to-data-urls.html)):
  ///    - Requires WPE WebKit 2.28 or later
  ///
  ///Use the [CygnusWebViewSettings.isPropertySupported] method to check if this property is supported at runtime.
  ///{@endtemplate}
  allowTopNavigationToDataUrls,

  ///Can be used to check if the [CygnusWebViewSettings.allowUniversalAccessFromFileURLs] property is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusWebViewSettings.allowUniversalAccessFromFileURLs.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView ([Official API - WebSettings.setAllowUniversalAccessFromFileURLs](https://developer.android.com/reference/android/webkit/WebSettings?hl=en#setAllowUniversalAccessFromFileURLs(boolean)))
  ///- iOS WKWebView
  ///- macOS WKWebView
  ///- Linux WPE WebKit 2.14+ ([Official API - WebKitSettings.allow-universal-access-from-file-urls](https://wpewebkit.org/reference/stable/wpe-webkit-2.0/property.Settings.allow-universal-access-from-file-urls.html))
  ///
  ///Use the [CygnusWebViewSettings.isPropertySupported] method to check if this property is supported at runtime.
  ///{@endtemplate}
  allowUniversalAccessFromFileURLs,

  ///Can be used to check if the [CygnusWebViewSettings.allowingReadAccessTo] property is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusWebViewSettings.allowingReadAccessTo.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- iOS WKWebView
  ///- macOS WKWebView
  ///
  ///Use the [CygnusWebViewSettings.isPropertySupported] method to check if this property is supported at runtime.
  ///{@endtemplate}
  allowingReadAccessTo,

  ///Can be used to check if the [CygnusWebViewSettings.allowsAirPlayForMediaPlayback] property is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusWebViewSettings.allowsAirPlayForMediaPlayback.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- iOS WKWebView ([Official API - WKWebViewConfiguration.allowsAirPlayForMediaPlayback](https://developer.apple.com/documentation/webkit/wkwebviewconfiguration/1395673-allowsairplayformediaplayback))
  ///- macOS WKWebView ([Official API - WKWebViewConfiguration.allowsAirPlayForMediaPlayback](https://developer.apple.com/documentation/webkit/wkwebviewconfiguration/1395673-allowsairplayformediaplayback))
  ///
  ///Use the [CygnusWebViewSettings.isPropertySupported] method to check if this property is supported at runtime.
  ///{@endtemplate}
  allowsAirPlayForMediaPlayback,

  ///Can be used to check if the [CygnusWebViewSettings.allowsBackForwardNavigationGestures] property is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusWebViewSettings.allowsBackForwardNavigationGestures.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- iOS WKWebView ([Official API - WKWebView.allowsBackForwardNavigationGestures](https://developer.apple.com/documentation/webkit/wkwebview/1414995-allowsbackforwardnavigationgestu))
  ///- macOS WKWebView ([Official API - WKWebView.allowsBackForwardNavigationGestures](https://developer.apple.com/documentation/webkit/wkwebview/1414995-allowsbackforwardnavigationgestu))
  ///- Windows WebView2 1.0.992.28+ ([Official API - ICoreWebView2Settings6.put_IsSwipeNavigationEnabled](https://learn.microsoft.com/en-us/microsoft-edge/webview2/reference/win32/icorewebview2settings6?view=webview2-1.0.2849.39#put_isswipenavigationenabled))
  ///
  ///Use the [CygnusWebViewSettings.isPropertySupported] method to check if this property is supported at runtime.
  ///{@endtemplate}
  allowsBackForwardNavigationGestures,

  ///Can be used to check if the [CygnusWebViewSettings.allowsInlineMediaPlayback] property is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusWebViewSettings.allowsInlineMediaPlayback.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- iOS WKWebView ([Official API - WKWebViewConfiguration.allowsInlineMediaPlayback](https://developer.apple.com/documentation/webkit/wkwebviewconfiguration/1614793-allowsinlinemediaplayback))
  ///- Linux WPE WebKit ([Official API - WebKitSettings.media-playback-allows-inline](https://wpewebkit.org/reference/stable/wpe-webkit-2.0/property.Settings.media-playback-allows-inline.html))
  ///
  ///Use the [CygnusWebViewSettings.isPropertySupported] method to check if this property is supported at runtime.
  ///{@endtemplate}
  allowsInlineMediaPlayback,

  ///Can be used to check if the [CygnusWebViewSettings.allowsLinkPreview] property is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusWebViewSettings.allowsLinkPreview.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- iOS WKWebView ([Official API - WKWebView.allowsLinkPreview](https://developer.apple.com/documentation/webkit/wkwebview/1415000-allowslinkpreview))
  ///- macOS WKWebView ([Official API - WKWebView.allowsLinkPreview](https://developer.apple.com/documentation/webkit/wkwebview/1415000-allowslinkpreview))
  ///
  ///Use the [CygnusWebViewSettings.isPropertySupported] method to check if this property is supported at runtime.
  ///{@endtemplate}
  allowsLinkPreview,

  ///Can be used to check if the [CygnusWebViewSettings.allowsPictureInPictureMediaPlayback] property is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusWebViewSettings.allowsPictureInPictureMediaPlayback.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- iOS WKWebView ([Official API - WKWebViewConfiguration.allowsPictureInPictureMediaPlayback](https://developer.apple.com/documentation/webkit/wkwebviewconfiguration/1614792-allowspictureinpicturemediaplayb))
  ///
  ///Use the [CygnusWebViewSettings.isPropertySupported] method to check if this property is supported at runtime.
  ///{@endtemplate}
  allowsPictureInPictureMediaPlayback,

  ///Can be used to check if the [CygnusWebViewSettings.alpha] property is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusWebViewSettings.alpha.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView ([Official API - View.setAlpha](https://developer.android.com/reference/android/view/View#setAlpha(float)))
  ///- iOS WKWebView ([Official API - UIView.alpha](https://developer.apple.com/documentation/uikit/uiview/1622417-alpha))
  ///- macOS WKWebView ([Official API - NSView.alphaValue](https://developer.apple.com/documentation/appkit/nsview/1483560-alphavalue))
  ///
  ///Use the [CygnusWebViewSettings.isPropertySupported] method to check if this property is supported at runtime.
  ///{@endtemplate}
  alpha,

  ///Can be used to check if the [CygnusWebViewSettings.alwaysBounceHorizontal] property is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusWebViewSettings.alwaysBounceHorizontal.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- iOS WKWebView ([Official API - UIScrollView.alwaysBounceHorizontal](https://developer.apple.com/documentation/uikit/uiscrollview/1619393-alwaysbouncehorizontal))
  ///
  ///Use the [CygnusWebViewSettings.isPropertySupported] method to check if this property is supported at runtime.
  ///{@endtemplate}
  alwaysBounceHorizontal,

  ///Can be used to check if the [CygnusWebViewSettings.alwaysBounceVertical] property is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusWebViewSettings.alwaysBounceVertical.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- iOS WKWebView ([Official API - UIScrollView.alwaysBounceVertical](https://developer.apple.com/documentation/uikit/uiscrollview/1619383-alwaysbouncevertical))
  ///
  ///Use the [CygnusWebViewSettings.isPropertySupported] method to check if this property is supported at runtime.
  ///{@endtemplate}
  alwaysBounceVertical,

  ///Can be used to check if the [CygnusWebViewSettings.androidCompositionMode] property is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusWebViewSettings.androidCompositionMode.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView:
  ///    - [CygnusAndroidCompositionMode.HYBRID_COMPOSITION_PLUS_PLUS] additionally requires API 34+, Impeller running on Vulkan, and the embedding application to opt in -- a plugin cannot turn it on for the application. Apps opt in with the `io.flutter.embedding.android.EnableHcpp` manifest meta-data (used by release builds) or `flutter run --enable-hcpp` during development. When any requirement is missing it falls back to [CygnusAndroidCompositionMode.TEXTURE_LAYER_HYBRID_COMPOSITION].
  ///
  ///Use the [CygnusWebViewSettings.isPropertySupported] method to check if this property is supported at runtime.
  ///{@endtemplate}
  androidCompositionMode,

  ///Can be used to check if the [CygnusWebViewSettings.appCachePath] property is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusWebViewSettings.appCachePath.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView (Official API - WebSettings.setAppCachePath)
  ///
  ///Use the [CygnusWebViewSettings.isPropertySupported] method to check if this property is supported at runtime.
  ///{@endtemplate}
  appCachePath,

  ///Can be used to check if the [CygnusWebViewSettings.applePayAPIEnabled] property is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusWebViewSettings.applePayAPIEnabled.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- iOS WKWebView 13.0+
  ///
  ///Use the [CygnusWebViewSettings.isPropertySupported] method to check if this property is supported at runtime.
  ///{@endtemplate}
  applePayAPIEnabled,

  ///Can be used to check if the [CygnusWebViewSettings.applicationNameForUserAgent] property is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusWebViewSettings.applicationNameForUserAgent.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView
  ///- iOS WKWebView ([Official API - WKWebViewConfiguration.applicationNameForUserAgent](https://developer.apple.com/documentation/webkit/wkwebviewconfiguration/1395665-applicationnameforuseragent))
  ///- macOS WKWebView ([Official API - WKWebViewConfiguration.applicationNameForUserAgent](https://developer.apple.com/documentation/webkit/wkwebviewconfiguration/1395665-applicationnameforuseragent))
  ///
  ///Use the [CygnusWebViewSettings.isPropertySupported] method to check if this property is supported at runtime.
  ///{@endtemplate}
  applicationNameForUserAgent,

  ///Can be used to check if the [CygnusWebViewSettings.automaticallyAdjustsScrollIndicatorInsets] property is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusWebViewSettings.automaticallyAdjustsScrollIndicatorInsets.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- iOS WKWebView 13.0+ ([Official API - UIScrollView.automaticallyAdjustsScrollIndicatorInsets](https://developer.apple.com/documentation/uikit/uiscrollview/3198043-automaticallyadjustsscrollindica))
  ///
  ///Use the [CygnusWebViewSettings.isPropertySupported] method to check if this property is supported at runtime.
  ///{@endtemplate}
  automaticallyAdjustsScrollIndicatorInsets,

  ///Can be used to check if the [CygnusWebViewSettings.blockNetworkImage] property is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusWebViewSettings.blockNetworkImage.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView ([Official API - WebSettings.setBlockNetworkImage](https://developer.android.com/reference/android/webkit/WebSettings#setBlockNetworkImage(boolean)))
  ///
  ///Use the [CygnusWebViewSettings.isPropertySupported] method to check if this property is supported at runtime.
  ///{@endtemplate}
  blockNetworkImage,

  ///Can be used to check if the [CygnusWebViewSettings.blockNetworkLoads] property is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusWebViewSettings.blockNetworkLoads.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView ([Official API - WebSettings.setBlockNetworkLoads](https://developer.android.com/reference/android/webkit/WebSettings#setBlockNetworkLoads(boolean)))
  ///
  ///Use the [CygnusWebViewSettings.isPropertySupported] method to check if this property is supported at runtime.
  ///{@endtemplate}
  blockNetworkLoads,

  ///Can be used to check if the [CygnusWebViewSettings.browserAcceleratorKeysEnabled] property is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusWebViewSettings.browserAcceleratorKeysEnabled.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Windows WebView2 1.0.864.35+ ([Official API - ICoreWebView2Settings3.put_IsBuiltInErrorPageEnabled](https://learn.microsoft.com/en-us/microsoft-edge/webview2/reference/win32/icorewebview2settings3?view=webview2-1.0.2849.39#put_arebrowseracceleratorkeysenabled))
  ///
  ///Use the [CygnusWebViewSettings.isPropertySupported] method to check if this property is supported at runtime.
  ///{@endtemplate}
  browserAcceleratorKeysEnabled,

  ///Can be used to check if the [CygnusWebViewSettings.builtInZoomControls] property is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusWebViewSettings.builtInZoomControls.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView ([Official API - WebSettings.setBuiltInZoomControls](https://developer.android.com/reference/android/webkit/WebSettings?hl=en#setBuiltInZoomControls(boolean)))
  ///
  ///Use the [CygnusWebViewSettings.isPropertySupported] method to check if this property is supported at runtime.
  ///{@endtemplate}
  builtInZoomControls,

  ///Can be used to check if the [CygnusWebViewSettings.cacheEnabled] property is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusWebViewSettings.cacheEnabled.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView
  ///- iOS WKWebView
  ///- macOS WKWebView
  ///
  ///Use the [CygnusWebViewSettings.isPropertySupported] method to check if this property is supported at runtime.
  ///{@endtemplate}
  cacheEnabled,

  ///Can be used to check if the [CygnusWebViewSettings.cacheMode] property is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusWebViewSettings.cacheMode.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView ([Official API - WebSettings.setCacheMode](https://developer.android.com/reference/android/webkit/WebSettings#setCacheMode(int)))
  ///
  ///Use the [CygnusWebViewSettings.isPropertySupported] method to check if this property is supported at runtime.
  ///{@endtemplate}
  cacheMode,

  ///Can be used to check if the [CygnusWebViewSettings.clearCache] property is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusWebViewSettings.clearCache.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView
  ///- iOS WKWebView
  ///- macOS WKWebView
  ///
  ///Use the [CygnusWebViewSettings.isPropertySupported] method to check if this property is supported at runtime.
  ///{@endtemplate}
  @Deprecated('Use CygnusWebViewController.clearAllCache instead')
  clearCache,

  ///Can be used to check if the [CygnusWebViewSettings.clearSessionCache] property is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusWebViewSettings.clearSessionCache.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView
  ///
  ///Use the [CygnusWebViewSettings.isPropertySupported] method to check if this property is supported at runtime.
  ///{@endtemplate}
  @Deprecated('Use CygnusCookieManager.removeSessionCookies instead')
  clearSessionCache,

  ///Can be used to check if the [CygnusWebViewSettings.contentBlockers] property is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusWebViewSettings.contentBlockers.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView
  ///- iOS WKWebView 11.0+
  ///- macOS WKWebView 10.13+
  ///- Linux WPE WebKit ([Official API - WebKitUserContentFilter](https://wpewebkit.org/reference/stable/wpe-webkit-2.0/class.UserContentFilter.html))
  ///
  ///Use the [CygnusWebViewSettings.isPropertySupported] method to check if this property is supported at runtime.
  ///{@endtemplate}
  contentBlockers,

  ///Can be used to check if the [CygnusWebViewSettings.contentInsetAdjustmentBehavior] property is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusWebViewSettings.contentInsetAdjustmentBehavior.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- iOS WKWebView 11.0+ ([Official API - UIScrollView.contentInsetAdjustmentBehavior](https://developer.apple.com/documentation/uikit/uiscrollview/2902261-contentinsetadjustmentbehavior))
  ///
  ///Use the [CygnusWebViewSettings.isPropertySupported] method to check if this property is supported at runtime.
  ///{@endtemplate}
  contentInsetAdjustmentBehavior,

  ///Can be used to check if the [CygnusWebViewSettings.corsAllowlist] property is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusWebViewSettings.corsAllowlist.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Linux WPE WebKit 2.34+ ([Official API - webkit_web_view_set_cors_allowlist](https://wpewebkit.org/reference/stable/wpe-webkit-2.0/method.WebView.set_cors_allowlist.html)):
  ///    - Pattern format: [protocol]://[host]:[port]. All three components are required.
  ///
  ///Use the [CygnusWebViewSettings.isPropertySupported] method to check if this property is supported at runtime.
  ///{@endtemplate}
  corsAllowlist,

  ///Can be used to check if the [CygnusWebViewSettings.cursiveFontFamily] property is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusWebViewSettings.cursiveFontFamily.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView ([Official API - WebSettings.setCursiveFontFamily](https://developer.android.com/reference/android/webkit/WebSettings#setCursiveFontFamily(java.lang.String)))
  ///- Linux WPE WebKit ([Official API - WebKitSettings.cursive-font-family](https://wpewebkit.org/reference/stable/wpe-webkit-2.0/property.Settings.cursive-font-family.html))
  ///
  ///Use the [CygnusWebViewSettings.isPropertySupported] method to check if this property is supported at runtime.
  ///{@endtemplate}
  cursiveFontFamily,

  ///Can be used to check if the [CygnusWebViewSettings.cursorBlinkTime] property is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusWebViewSettings.cursorBlinkTime.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Linux WPE WebKit ([Official API - WPESettings.cursor-blink-time](https://wpewebkit.org/reference/stable/wpe-platform-2.0/class.Settings.html)):
  ///    - This is a WPE Platform display-level setting. Value is in milliseconds.
  ///
  ///Use the [CygnusWebViewSettings.isPropertySupported] method to check if this property is supported at runtime.
  ///{@endtemplate}
  cursorBlinkTime,

  ///Can be used to check if the [CygnusWebViewSettings.darkMode] property is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusWebViewSettings.darkMode.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Linux WPE WebKit ([Official API - WPESettings.dark-mode](https://wpewebkit.org/reference/stable/wpe-platform-2.0/class.Settings.html)):
  ///    - This is a WPE Platform display-level setting that affects all WebViews.
  ///
  ///Use the [CygnusWebViewSettings.isPropertySupported] method to check if this property is supported at runtime.
  ///{@endtemplate}
  darkMode,

  ///Can be used to check if the [CygnusWebViewSettings.dataDetectorTypes] property is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusWebViewSettings.dataDetectorTypes.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- iOS WKWebView 10+ ([Official API - WKWebViewConfiguration.dataDetectorTypes](https://developer.apple.com/documentation/webkit/wkwebviewconfiguration/1641937-datadetectortypes))
  ///
  ///Use the [CygnusWebViewSettings.isPropertySupported] method to check if this property is supported at runtime.
  ///{@endtemplate}
  dataDetectorTypes,

  ///Can be used to check if the [CygnusWebViewSettings.databaseEnabled] property is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusWebViewSettings.databaseEnabled.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView ([Official API - WebSettings.setDatabaseEnabled](https://developer.android.com/reference/android/webkit/WebSettings?hl=en#setDatabaseEnabled(boolean)))
  ///- Linux WPE WebKit ([Official API - WebKitSettings.enable-html5-database](https://wpewebkit.org/reference/stable/wpe-webkit-2.0/property.Settings.enable-html5-database.html))
  ///
  ///Use the [CygnusWebViewSettings.isPropertySupported] method to check if this property is supported at runtime.
  ///{@endtemplate}
  databaseEnabled,

  ///Can be used to check if the [CygnusWebViewSettings.decelerationRate] property is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusWebViewSettings.decelerationRate.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- iOS WKWebView ([Official API - UIScrollView.decelerationRate](https://developer.apple.com/documentation/uikit/uiscrollview/1619438-decelerationrate))
  ///
  ///Use the [CygnusWebViewSettings.isPropertySupported] method to check if this property is supported at runtime.
  ///{@endtemplate}
  decelerationRate,

  ///Can be used to check if the [CygnusWebViewSettings.defaultFixedFontSize] property is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusWebViewSettings.defaultFixedFontSize.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView ([Official API - WebSettings.setDefaultFixedFontSize](https://developer.android.com/reference/android/webkit/WebSettings#setDefaultFixedFontSize(int)))
  ///- Linux WPE WebKit ([Official API - WebKitSettings.default-monospace-font-size](https://wpewebkit.org/reference/stable/wpe-webkit-2.0/property.Settings.default-monospace-font-size.html))
  ///
  ///Use the [CygnusWebViewSettings.isPropertySupported] method to check if this property is supported at runtime.
  ///{@endtemplate}
  defaultFixedFontSize,

  ///Can be used to check if the [CygnusWebViewSettings.defaultFontSize] property is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusWebViewSettings.defaultFontSize.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView ([Official API - WebSettings.setDefaultFontSize](https://developer.android.com/reference/android/webkit/WebSettings#setDefaultFontSize(int)))
  ///- Linux WPE WebKit ([Official API - WebKitSettings.default-font-size](https://wpewebkit.org/reference/stable/wpe-webkit-2.0/property.Settings.default-font-size.html))
  ///
  ///Use the [CygnusWebViewSettings.isPropertySupported] method to check if this property is supported at runtime.
  ///{@endtemplate}
  defaultFontSize,

  ///Can be used to check if the [CygnusWebViewSettings.defaultTextEncodingName] property is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusWebViewSettings.defaultTextEncodingName.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView ([Official API - WebSettings.setDefaultTextEncodingName](https://developer.android.com/reference/android/webkit/WebSettings#setDefaultTextEncodingName(java.lang.String)))
  ///- Linux WPE WebKit ([Official API - WebKitSettings.default-charset](https://wpewebkit.org/reference/stable/wpe-webkit-2.0/property.Settings.default-charset.html))
  ///
  ///Use the [CygnusWebViewSettings.isPropertySupported] method to check if this property is supported at runtime.
  ///{@endtemplate}
  defaultTextEncodingName,

  ///Can be used to check if the [CygnusWebViewSettings.defaultVideoPoster] property is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusWebViewSettings.defaultVideoPoster.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView
  ///
  ///Use the [CygnusWebViewSettings.isPropertySupported] method to check if this property is supported at runtime.
  ///{@endtemplate}
  defaultVideoPoster,

  ///Can be used to check if the [CygnusWebViewSettings.disableAnimations] property is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusWebViewSettings.disableAnimations.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Linux WPE WebKit ([Official API - WPESettings.disable-animations](https://wpewebkit.org/reference/stable/wpe-platform-2.0/class.Settings.html)):
  ///    - This is a WPE Platform display-level setting for accessibility.
  ///
  ///Use the [CygnusWebViewSettings.isPropertySupported] method to check if this property is supported at runtime.
  ///{@endtemplate}
  disableAnimations,

  ///Can be used to check if the [CygnusWebViewSettings.disableContextMenu] property is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusWebViewSettings.disableContextMenu.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView
  ///- iOS WKWebView
  ///- Web \<iframe\> but requires same origin
  ///- Windows WebView2 ([Official API - ICoreWebView2Settings.put_AreDefaultContextMenusEnabled](https://learn.microsoft.com/en-us/microsoft-edge/webview2/reference/win32/icorewebview2settings?view=webview2-1.0.2210.55#put_aredefaultcontextmenusenabled))
  ///
  ///Use the [CygnusWebViewSettings.isPropertySupported] method to check if this property is supported at runtime.
  ///{@endtemplate}
  disableContextMenu,

  ///Can be used to check if the [CygnusWebViewSettings.disableDefaultErrorPage] property is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusWebViewSettings.disableDefaultErrorPage.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView
  ///- Windows WebView2 ([Official API - ICoreWebView2Settings.put_IsBuiltInErrorPageEnabled](https://learn.microsoft.com/en-us/microsoft-edge/webview2/reference/win32/icorewebview2settings?view=webview2-1.0.2849.39#put_isbuiltinerrorpageenabled))
  ///
  ///Use the [CygnusWebViewSettings.isPropertySupported] method to check if this property is supported at runtime.
  ///{@endtemplate}
  disableDefaultErrorPage,

  ///Can be used to check if the [CygnusWebViewSettings.disableHorizontalScroll] property is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusWebViewSettings.disableHorizontalScroll.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView
  ///- iOS WKWebView
  ///- Web \<iframe\> but requires same origin
  ///
  ///Use the [CygnusWebViewSettings.isPropertySupported] method to check if this property is supported at runtime.
  ///{@endtemplate}
  disableHorizontalScroll,

  ///Can be used to check if the [CygnusWebViewSettings.disableInputAccessoryView] property is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusWebViewSettings.disableInputAccessoryView.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- iOS WKWebView
  ///
  ///Use the [CygnusWebViewSettings.isPropertySupported] method to check if this property is supported at runtime.
  ///{@endtemplate}
  disableInputAccessoryView,

  ///Can be used to check if the [CygnusWebViewSettings.disableLongPressContextMenuOnLinks] property is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusWebViewSettings.disableLongPressContextMenuOnLinks.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- iOS WKWebView
  ///
  ///Use the [CygnusWebViewSettings.isPropertySupported] method to check if this property is supported at runtime.
  ///{@endtemplate}
  disableLongPressContextMenuOnLinks,

  ///Can be used to check if the [CygnusWebViewSettings.disableVerticalScroll] property is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusWebViewSettings.disableVerticalScroll.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView
  ///- iOS WKWebView
  ///- Web \<iframe\> but requires same origin
  ///
  ///Use the [CygnusWebViewSettings.isPropertySupported] method to check if this property is supported at runtime.
  ///{@endtemplate}
  disableVerticalScroll,

  ///Can be used to check if the [CygnusWebViewSettings.disableWebSecurity] property is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusWebViewSettings.disableWebSecurity.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Linux WPE WebKit 2.40+ ([Official API - WebKitSettings.disable-web-security](https://wpewebkit.org/reference/stable/wpe-webkit-2.0/property.Settings.disable-web-security.html)):
  ///    - Requires WPE WebKit 2.40 or later
  ///
  ///Use the [CygnusWebViewSettings.isPropertySupported] method to check if this property is supported at runtime.
  ///{@endtemplate}
  disableWebSecurity,

  ///Can be used to check if the [CygnusWebViewSettings.disabledActionModeMenuItems] property is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusWebViewSettings.disabledActionModeMenuItems.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView 24+ ([Official API - WebSettings.setDisabledActionModeMenuItems](https://developer.android.com/reference/android/webkit/WebSettings#setDisabledActionModeMenuItems(int)))
  ///
  ///Use the [CygnusWebViewSettings.isPropertySupported] method to check if this property is supported at runtime.
  ///{@endtemplate}
  disabledActionModeMenuItems,

  ///Can be used to check if the [CygnusWebViewSettings.disallowOverScroll] property is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusWebViewSettings.disallowOverScroll.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- iOS WKWebView
  ///
  ///Use the [CygnusWebViewSettings.isPropertySupported] method to check if this property is supported at runtime.
  ///{@endtemplate}
  disallowOverScroll,

  ///Can be used to check if the [CygnusWebViewSettings.displayZoomControls] property is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusWebViewSettings.displayZoomControls.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView ([Official API - WebSettings.setDisplayZoomControls](https://developer.android.com/reference/android/webkit/WebSettings?hl=en#setDisplayZoomControls(boolean)))
  ///
  ///Use the [CygnusWebViewSettings.isPropertySupported] method to check if this property is supported at runtime.
  ///{@endtemplate}
  displayZoomControls,

  ///Can be used to check if the [CygnusWebViewSettings.domStorageEnabled] property is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusWebViewSettings.domStorageEnabled.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView ([Official API - WebSettings.setDomStorageEnabled](https://developer.android.com/reference/android/webkit/WebSettings?hl=en#setDomStorageEnabled(boolean)))
  ///- Linux WPE WebKit ([Official API - WebKitSettings.enable-html5-local-storage](https://wpewebkit.org/reference/stable/wpe-webkit-2.0/property.Settings.enable-html5-local-storage.html))
  ///
  ///Use the [CygnusWebViewSettings.isPropertySupported] method to check if this property is supported at runtime.
  ///{@endtemplate}
  domStorageEnabled,

  ///Can be used to check if the [CygnusWebViewSettings.doubleClickDistance] property is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusWebViewSettings.doubleClickDistance.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Linux WPE WebKit ([Official API - WPESettings.double-click-distance](https://wpewebkit.org/reference/stable/wpe-platform-2.0/class.Settings.html)):
  ///    - This is a WPE Platform display-level setting. Value is in pixels.
  ///
  ///Use the [CygnusWebViewSettings.isPropertySupported] method to check if this property is supported at runtime.
  ///{@endtemplate}
  doubleClickDistance,

  ///Can be used to check if the [CygnusWebViewSettings.doubleClickTime] property is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusWebViewSettings.doubleClickTime.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Linux WPE WebKit ([Official API - WPESettings.double-click-time](https://wpewebkit.org/reference/stable/wpe-platform-2.0/class.Settings.html)):
  ///    - This is a WPE Platform display-level setting. Value is in milliseconds.
  ///
  ///Use the [CygnusWebViewSettings.isPropertySupported] method to check if this property is supported at runtime.
  ///{@endtemplate}
  doubleClickTime,

  ///Can be used to check if the [CygnusWebViewSettings.dragThreshold] property is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusWebViewSettings.dragThreshold.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Linux WPE WebKit ([Official API - WPESettings.drag-threshold](https://wpewebkit.org/reference/stable/wpe-platform-2.0/class.Settings.html)):
  ///    - This is a WPE Platform display-level setting. Value is in pixels.
  ///
  ///Use the [CygnusWebViewSettings.isPropertySupported] method to check if this property is supported at runtime.
  ///{@endtemplate}
  dragThreshold,

  ///Can be used to check if the [CygnusWebViewSettings.drawCompositingIndicators] property is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusWebViewSettings.drawCompositingIndicators.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Linux WPE WebKit ([Official API - WebKitSettings.draw-compositing-indicators](https://wpewebkit.org/reference/stable/wpe-webkit-2.0/property.Settings.draw-compositing-indicators.html))
  ///
  ///Use the [CygnusWebViewSettings.isPropertySupported] method to check if this property is supported at runtime.
  ///{@endtemplate}
  drawCompositingIndicators,

  ///Can be used to check if the [CygnusWebViewSettings.enable2DCanvasAcceleration] property is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusWebViewSettings.enable2DCanvasAcceleration.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Linux WPE WebKit 2.46+ ([Official API - WebKitSettings.enable-2d-canvas-acceleration](https://wpewebkit.org/reference/stable/wpe-webkit-2.0/property.Settings.enable-2d-canvas-acceleration.html)):
  ///    - Requires WPE WebKit 2.46 or later
  ///
  ///Use the [CygnusWebViewSettings.isPropertySupported] method to check if this property is supported at runtime.
  ///{@endtemplate}
  enable2DCanvasAcceleration,

  ///Can be used to check if the [CygnusWebViewSettings.enableCaretBrowsing] property is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusWebViewSettings.enableCaretBrowsing.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Linux WPE WebKit ([Official API - WebKitSettings.enable-caret-browsing](https://wpewebkit.org/reference/stable/wpe-webkit-2.0/property.Settings.enable-caret-browsing.html))
  ///
  ///Use the [CygnusWebViewSettings.isPropertySupported] method to check if this property is supported at runtime.
  ///{@endtemplate}
  enableCaretBrowsing,

  ///Can be used to check if the [CygnusWebViewSettings.enableEncryptedMedia] property is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusWebViewSettings.enableEncryptedMedia.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Linux WPE WebKit 2.20+ ([Official API - WebKitSettings.enable-encrypted-media](https://wpewebkit.org/reference/stable/wpe-webkit-2.0/property.Settings.enable-encrypted-media.html)):
  ///    - Requires WPE WebKit 2.20 or later
  ///
  ///Use the [CygnusWebViewSettings.isPropertySupported] method to check if this property is supported at runtime.
  ///{@endtemplate}
  enableEncryptedMedia,

  ///Can be used to check if the [CygnusWebViewSettings.enableJavaScriptMarkup] property is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusWebViewSettings.enableJavaScriptMarkup.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Linux WPE WebKit 2.24+ ([Official API - WebKitSettings.enable-javascript-markup](https://wpewebkit.org/reference/stable/wpe-webkit-2.0/property.Settings.enable-javascript-markup.html)):
  ///    - Requires WPE WebKit 2.24 or later
  ///
  ///Use the [CygnusWebViewSettings.isPropertySupported] method to check if this property is supported at runtime.
  ///{@endtemplate}
  enableJavaScriptMarkup,

  ///Can be used to check if the [CygnusWebViewSettings.enableMedia] property is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusWebViewSettings.enableMedia.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Linux WPE WebKit 2.26+ ([Official API - WebKitSettings.enable-media](https://wpewebkit.org/reference/stable/wpe-webkit-2.0/property.Settings.enable-media.html)):
  ///    - Requires WPE WebKit 2.26 or later
  ///
  ///Use the [CygnusWebViewSettings.isPropertySupported] method to check if this property is supported at runtime.
  ///{@endtemplate}
  enableMedia,

  ///Can be used to check if the [CygnusWebViewSettings.enableMediaCapabilities] property is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusWebViewSettings.enableMediaCapabilities.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Linux WPE WebKit 2.22+ ([Official API - WebKitSettings.enable-media-capabilities](https://wpewebkit.org/reference/stable/wpe-webkit-2.0/property.Settings.enable-media-capabilities.html)):
  ///    - Requires WPE WebKit 2.22 or later
  ///
  ///Use the [CygnusWebViewSettings.isPropertySupported] method to check if this property is supported at runtime.
  ///{@endtemplate}
  enableMediaCapabilities,

  ///Can be used to check if the [CygnusWebViewSettings.enableMockCaptureDevices] property is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusWebViewSettings.enableMockCaptureDevices.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Linux WPE WebKit 2.24+ ([Official API - WebKitSettings.enable-mock-capture-devices](https://wpewebkit.org/reference/stable/wpe-webkit-2.0/property.Settings.enable-mock-capture-devices.html)):
  ///    - Requires WPE WebKit 2.24 or later
  ///
  ///Use the [CygnusWebViewSettings.isPropertySupported] method to check if this property is supported at runtime.
  ///{@endtemplate}
  enableMockCaptureDevices,

  ///Can be used to check if the [CygnusWebViewSettings.enablePageCache] property is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusWebViewSettings.enablePageCache.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Linux WPE WebKit ([Official API - WebKitSettings.enable-page-cache](https://wpewebkit.org/reference/stable/wpe-webkit-2.0/property.Settings.enable-page-cache.html))
  ///
  ///Use the [CygnusWebViewSettings.isPropertySupported] method to check if this property is supported at runtime.
  ///{@endtemplate}
  enablePageCache,

  ///Can be used to check if the [CygnusWebViewSettings.enableResizableTextAreas] property is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusWebViewSettings.enableResizableTextAreas.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Linux WPE WebKit ([Official API - WebKitSettings.enable-resizable-text-areas](https://wpewebkit.org/reference/stable/wpe-webkit-2.0/property.Settings.enable-resizable-text-areas.html))
  ///
  ///Use the [CygnusWebViewSettings.isPropertySupported] method to check if this property is supported at runtime.
  ///{@endtemplate}
  enableResizableTextAreas,

  ///Can be used to check if the [CygnusWebViewSettings.enableSmoothScrolling] property is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusWebViewSettings.enableSmoothScrolling.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Linux WPE WebKit ([Official API - WebKitSettings.enable-smooth-scrolling](https://wpewebkit.org/reference/stable/wpe-webkit-2.0/property.Settings.enable-smooth-scrolling.html))
  ///
  ///Use the [CygnusWebViewSettings.isPropertySupported] method to check if this property is supported at runtime.
  ///{@endtemplate}
  enableSmoothScrolling,

  ///Can be used to check if the [CygnusWebViewSettings.enableSpatialNavigation] property is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusWebViewSettings.enableSpatialNavigation.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Linux WPE WebKit ([Official API - WebKitSettings.enable-spatial-navigation](https://wpewebkit.org/reference/stable/wpe-webkit-2.0/property.Settings.enable-spatial-navigation.html))
  ///
  ///Use the [CygnusWebViewSettings.isPropertySupported] method to check if this property is supported at runtime.
  ///{@endtemplate}
  enableSpatialNavigation,

  ///Can be used to check if the [CygnusWebViewSettings.enableTabsToLinks] property is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusWebViewSettings.enableTabsToLinks.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Linux WPE WebKit ([Official API - WebKitSettings.enable-tabs-to-links](https://wpewebkit.org/reference/stable/wpe-webkit-2.0/property.Settings.enable-tabs-to-links.html))
  ///
  ///Use the [CygnusWebViewSettings.isPropertySupported] method to check if this property is supported at runtime.
  ///{@endtemplate}
  enableTabsToLinks,

  ///Can be used to check if the [CygnusWebViewSettings.enableViewportScale] property is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusWebViewSettings.enableViewportScale.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- iOS WKWebView
  ///- macOS WKWebView
  ///
  ///Use the [CygnusWebViewSettings.isPropertySupported] method to check if this property is supported at runtime.
  ///{@endtemplate}
  enableViewportScale,

  ///Can be used to check if the [CygnusWebViewSettings.enableWebRTC] property is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusWebViewSettings.enableWebRTC.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Linux WPE WebKit 2.38+ ([Official API - WebKitSettings.enable-webrtc](https://wpewebkit.org/reference/stable/wpe-webkit-2.0/property.Settings.enable-webrtc.html)):
  ///    - Requires WPE WebKit 2.38 or later
  ///
  ///Use the [CygnusWebViewSettings.isPropertySupported] method to check if this property is supported at runtime.
  ///{@endtemplate}
  enableWebRTC,

  ///Can be used to check if the [CygnusWebViewSettings.enableWriteConsoleMessagesToStdout] property is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusWebViewSettings.enableWriteConsoleMessagesToStdout.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Linux WPE WebKit ([Official API - WebKitSettings.enable-write-console-messages-to-stdout](https://wpewebkit.org/reference/stable/wpe-webkit-2.0/property.Settings.enable-write-console-messages-to-stdout.html))
  ///
  ///Use the [CygnusWebViewSettings.isPropertySupported] method to check if this property is supported at runtime.
  ///{@endtemplate}
  enableWriteConsoleMessagesToStdout,

  ///Can be used to check if the [CygnusWebViewSettings.enterpriseAuthenticationAppLinkPolicyEnabled] property is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusWebViewSettings.enterpriseAuthenticationAppLinkPolicyEnabled.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView:
  ///    - available on Android only if [CygnusWebViewFeature.ENTERPRISE_AUTHENTICATION_APP_LINK_POLICY] feature is supported.
  ///
  ///Use the [CygnusWebViewSettings.isPropertySupported] method to check if this property is supported at runtime.
  ///{@endtemplate}
  enterpriseAuthenticationAppLinkPolicyEnabled,

  ///Can be used to check if the [CygnusWebViewSettings.fantasyFontFamily] property is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusWebViewSettings.fantasyFontFamily.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView ([Official API - WebSettings.setFantasyFontFamily](https://developer.android.com/reference/android/webkit/WebSettings#setFantasyFontFamily(java.lang.String)))
  ///- Linux WPE WebKit ([Official API - WebKitSettings.fantasy-font-family](https://wpewebkit.org/reference/stable/wpe-webkit-2.0/property.Settings.fantasy-font-family.html))
  ///
  ///Use the [CygnusWebViewSettings.isPropertySupported] method to check if this property is supported at runtime.
  ///{@endtemplate}
  fantasyFontFamily,

  ///Can be used to check if the [CygnusWebViewSettings.fixedFontFamily] property is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusWebViewSettings.fixedFontFamily.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView ([Official API - WebSettings.setFixedFontFamily](https://developer.android.com/reference/android/webkit/WebSettings#setFixedFontFamily(java.lang.String)))
  ///- Linux WPE WebKit ([Official API - WebKitSettings.monospace-font-family](https://wpewebkit.org/reference/stable/wpe-webkit-2.0/property.Settings.monospace-font-family.html))
  ///
  ///Use the [CygnusWebViewSettings.isPropertySupported] method to check if this property is supported at runtime.
  ///{@endtemplate}
  fixedFontFamily,

  ///Can be used to check if the [CygnusWebViewSettings.fontAntialias] property is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusWebViewSettings.fontAntialias.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Linux WPE WebKit ([Official API - WPESettings.font-antialias](https://wpewebkit.org/reference/stable/wpe-platform-2.0/class.Settings.html)):
  ///    - This is a WPE Platform display-level setting for font rendering.
  ///
  ///Use the [CygnusWebViewSettings.isPropertySupported] method to check if this property is supported at runtime.
  ///{@endtemplate}
  fontAntialias,

  ///Can be used to check if the [CygnusWebViewSettings.fontDPI] property is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusWebViewSettings.fontDPI.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Linux WPE WebKit ([Official API - WPESettings.font-dpi](https://wpewebkit.org/reference/stable/wpe-platform-2.0/class.Settings.html)):
  ///    - This is a WPE Platform display-level setting. Default is typically 96.0 DPI.
  ///
  ///Use the [CygnusWebViewSettings.isPropertySupported] method to check if this property is supported at runtime.
  ///{@endtemplate}
  fontDPI,

  ///Can be used to check if the [CygnusWebViewSettings.fontHintingStyle] property is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusWebViewSettings.fontHintingStyle.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Linux WPE WebKit ([Official API - WPESettings.font-hinting-style](https://wpewebkit.org/reference/stable/wpe-platform-2.0/class.Settings.html)):
  ///    - This is a WPE Platform display-level setting for font rendering.
  ///
  ///Use the [CygnusWebViewSettings.isPropertySupported] method to check if this property is supported at runtime.
  ///{@endtemplate}
  fontHintingStyle,

  ///Can be used to check if the [CygnusWebViewSettings.fontSubpixelLayout] property is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusWebViewSettings.fontSubpixelLayout.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Linux WPE WebKit ([Official API - WPESettings.font-subpixel-layout](https://wpewebkit.org/reference/stable/wpe-platform-2.0/class.Settings.html)):
  ///    - This is a WPE Platform display-level setting for font rendering.
  ///
  ///Use the [CygnusWebViewSettings.isPropertySupported] method to check if this property is supported at runtime.
  ///{@endtemplate}
  fontSubpixelLayout,

  ///Can be used to check if the [CygnusWebViewSettings.forceDark] property is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusWebViewSettings.forceDark.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView 29+ ([Official API - WebSettings.setForceDark](https://developer.android.com/reference/android/webkit/WebSettings#setForceDark(int)))
  ///
  ///Use the [CygnusWebViewSettings.isPropertySupported] method to check if this property is supported at runtime.
  ///{@endtemplate}
  @Deprecated('Use algorithmicDarkeningAllowed instead')
  forceDark,

  ///Can be used to check if the [CygnusWebViewSettings.forceDarkStrategy] property is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusWebViewSettings.forceDarkStrategy.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView ([Official API - WebSettingsCompat.setForceDarkStrategy](https://developer.android.com/reference/androidx/webkit/WebSettingsCompat#setForceDarkStrategy(android.webkit.WebSettings,int))):
  ///    - it will take effect only if [CygnusWebViewFeature.isFeatureSupported] returns `true` for [CygnusWebViewFeature.FORCE_DARK_STRATEGY].
  ///
  ///Use the [CygnusWebViewSettings.isPropertySupported] method to check if this property is supported at runtime.
  ///{@endtemplate}
  @Deprecated('Use algorithmicDarkeningAllowed instead')
  forceDarkStrategy,

  ///Can be used to check if the [CygnusWebViewSettings.generalAutofillEnabled] property is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusWebViewSettings.generalAutofillEnabled.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Windows WebView2 1.0.902.49+ ([Official API - ICoreWebView2Settings4.put_IsGeneralAutofillEnabled](https://learn.microsoft.com/en-us/microsoft-edge/webview2/reference/win32/icorewebview2settings4?view=webview2-1.0.2849.39#put_isgeneralautofillenabled))
  ///
  ///Use the [CygnusWebViewSettings.isPropertySupported] method to check if this property is supported at runtime.
  ///{@endtemplate}
  generalAutofillEnabled,

  ///Can be used to check if the [CygnusWebViewSettings.geolocationEnabled] property is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusWebViewSettings.geolocationEnabled.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView ([Official API - WebSettings.setGeolocationEnabled](https://developer.android.com/reference/android/webkit/WebSettings?hl=en#setGeolocationEnabled(boolean))):
  ///    - Please note that in order for the Geolocation API to be usable by a page in the WebView, the following requirements must be met: - an application must have permission to access the device location, see [Manifest.permission.ACCESS_COARSE_LOCATION](https://developer.android.com/reference/android/Manifest.permission#ACCESS_COARSE_LOCATION), [Manifest.permission.ACCESS_FINE_LOCATION](https://developer.android.com/reference/android/Manifest.permission#ACCESS_FINE_LOCATION); - an application must provide an implementation of the [CygnusPlatformWebViewCreationParams.onGeolocationPermissionsShowPrompt] callback to receive notifications that a page is requesting access to location via the JavaScript Geolocation API.
  ///
  ///Use the [CygnusWebViewSettings.isPropertySupported] method to check if this property is supported at runtime.
  ///{@endtemplate}
  geolocationEnabled,

  ///Can be used to check if the [CygnusWebViewSettings.handleAcceleratorKeyPressed] property is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusWebViewSettings.handleAcceleratorKeyPressed.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Windows WebView2
  ///
  ///Use the [CygnusWebViewSettings.isPropertySupported] method to check if this property is supported at runtime.
  ///{@endtemplate}
  handleAcceleratorKeyPressed,

  ///Can be used to check if the [CygnusWebViewSettings.hardwareAcceleration] property is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusWebViewSettings.hardwareAcceleration.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView ([Official API - WebView.setLayerType](https://developer.android.com/reference/android/webkit/WebView#setLayerType(int,%20android.graphics.Paint)))
  ///
  ///Use the [CygnusWebViewSettings.isPropertySupported] method to check if this property is supported at runtime.
  ///{@endtemplate}
  hardwareAcceleration,

  ///Can be used to check if the [CygnusWebViewSettings.hiddenPdfToolbarItems] property is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusWebViewSettings.hiddenPdfToolbarItems.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Windows WebView2 1.0.1185.39+ ([Official API - ICoreWebView2Settings7.put_HiddenPdfToolbarItems](https://learn.microsoft.com/en-us/microsoft-edge/webview2/reference/win32/icorewebview2settings7?view=webview2-1.0.2849.39#put_hiddenpdftoolbaritems))
  ///
  ///Use the [CygnusWebViewSettings.isPropertySupported] method to check if this property is supported at runtime.
  ///{@endtemplate}
  hiddenPdfToolbarItems,

  ///Can be used to check if the [CygnusWebViewSettings.horizontalScrollBarEnabled] property is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusWebViewSettings.horizontalScrollBarEnabled.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView ([Official API - View.setHorizontalScrollBarEnabled](https://developer.android.com/reference/android/view/View#setHorizontalScrollBarEnabled(boolean)))
  ///- iOS WKWebView ([Official API - UIScrollView.showsHorizontalScrollIndicator](https://developer.apple.com/documentation/uikit/uiscrollview/1619380-showshorizontalscrollindicator))
  ///- Web \<iframe\> but requires same origin:
  ///    - It must have the same value of [verticalScrollBarEnabled] to take effect.
  ///
  ///Use the [CygnusWebViewSettings.isPropertySupported] method to check if this property is supported at runtime.
  ///{@endtemplate}
  horizontalScrollBarEnabled,

  ///Can be used to check if the [CygnusWebViewSettings.horizontalScrollbarThumbColor] property is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusWebViewSettings.horizontalScrollbarThumbColor.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView 29+ ([Official API - View.setHorizontalScrollbarThumbDrawable](https://developer.android.com/reference/android/view/View#setHorizontalScrollbarThumbDrawable(android.graphics.drawable.Drawable)))
  ///
  ///Use the [CygnusWebViewSettings.isPropertySupported] method to check if this property is supported at runtime.
  ///{@endtemplate}
  horizontalScrollbarThumbColor,

  ///Can be used to check if the [CygnusWebViewSettings.horizontalScrollbarTrackColor] property is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusWebViewSettings.horizontalScrollbarTrackColor.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView 29+ ([Official API - View.setHorizontalScrollbarTrackDrawable](https://developer.android.com/reference/android/view/View#setHorizontalScrollbarTrackDrawable(android.graphics.drawable.Drawable)))
  ///
  ///Use the [CygnusWebViewSettings.isPropertySupported] method to check if this property is supported at runtime.
  ///{@endtemplate}
  horizontalScrollbarTrackColor,

  ///Can be used to check if the [CygnusWebViewSettings.iframeAllow] property is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusWebViewSettings.iframeAllow.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Web \<iframe\> ([Official API - iframe.allow](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/iframe#attr-allow))
  ///
  ///Use the [CygnusWebViewSettings.isPropertySupported] method to check if this property is supported at runtime.
  ///{@endtemplate}
  iframeAllow,

  ///Can be used to check if the [CygnusWebViewSettings.iframeAllowFullscreen] property is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusWebViewSettings.iframeAllowFullscreen.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Web \<iframe\> ([Official API - iframe.allowfullscreen](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/iframe#attr-allowfullscreen))
  ///
  ///Use the [CygnusWebViewSettings.isPropertySupported] method to check if this property is supported at runtime.
  ///{@endtemplate}
  iframeAllowFullscreen,

  ///Can be used to check if the [CygnusWebViewSettings.iframeAriaHidden] property is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusWebViewSettings.iframeAriaHidden.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Web \<iframe\> ([Official API - iframe.ariaHidden](https://developer.mozilla.org/en-US/docs/Web/Accessibility/ARIA/Attributes/aria-hidden))
  ///
  ///Use the [CygnusWebViewSettings.isPropertySupported] method to check if this property is supported at runtime.
  ///{@endtemplate}
  iframeAriaHidden,

  ///Can be used to check if the [CygnusWebViewSettings.iframeCsp] property is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusWebViewSettings.iframeCsp.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Web \<iframe\> ([Official API - iframe.csp](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/iframe#attr-csp))
  ///
  ///Use the [CygnusWebViewSettings.isPropertySupported] method to check if this property is supported at runtime.
  ///{@endtemplate}
  iframeCsp,

  ///Can be used to check if the [CygnusWebViewSettings.iframeName] property is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusWebViewSettings.iframeName.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Web \<iframe\> ([Official API - iframe.name](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/iframe#attr-name))
  ///
  ///Use the [CygnusWebViewSettings.isPropertySupported] method to check if this property is supported at runtime.
  ///{@endtemplate}
  iframeName,

  ///Can be used to check if the [CygnusWebViewSettings.iframeReferrerPolicy] property is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusWebViewSettings.iframeReferrerPolicy.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Web \<iframe\> ([Official API - iframe.referrerpolicy](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/iframe#attr-referrerpolicy))
  ///
  ///Use the [CygnusWebViewSettings.isPropertySupported] method to check if this property is supported at runtime.
  ///{@endtemplate}
  iframeReferrerPolicy,

  ///Can be used to check if the [CygnusWebViewSettings.iframeRole] property is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusWebViewSettings.iframeRole.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Web \<iframe\> ([Official API - iframe.role](https://developer.mozilla.org/en-US/docs/Web/Accessibility/ARIA/Roles))
  ///
  ///Use the [CygnusWebViewSettings.isPropertySupported] method to check if this property is supported at runtime.
  ///{@endtemplate}
  iframeRole,

  ///Can be used to check if the [CygnusWebViewSettings.iframeSandbox] property is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusWebViewSettings.iframeSandbox.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Web \<iframe\> ([Official API - iframe.sandbox](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/iframe#attr-sandbox))
  ///
  ///Use the [CygnusWebViewSettings.isPropertySupported] method to check if this property is supported at runtime.
  ///{@endtemplate}
  iframeSandbox,

  ///Can be used to check if the [CygnusWebViewSettings.ignoresViewportScaleLimits] property is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusWebViewSettings.ignoresViewportScaleLimits.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- iOS WKWebView ([Official API - WKWebViewConfiguration.ignoresViewportScaleLimits](https://developer.apple.com/documentation/webkit/wkwebviewconfiguration/2274633-ignoresviewportscalelimits))
  ///
  ///Use the [CygnusWebViewSettings.isPropertySupported] method to check if this property is supported at runtime.
  ///{@endtemplate}
  ignoresViewportScaleLimits,

  ///Can be used to check if the [CygnusWebViewSettings.incognito] property is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusWebViewSettings.incognito.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView:
  ///    - setting this to `true`, it will clear all the cookies of all WebView instances, because there isn't any way to make the website data store non-persistent for the specific WebView instance such as on iOS.
  ///- iOS WKWebView
  ///- macOS WKWebView
  ///- Windows WebView2 ([Official API - ICoreWebView2ControllerOptions.put_IsInPrivateModeEnabled](https://learn.microsoft.com/en-us/microsoft-edge/webview2/reference/win32/icorewebview2controlleroptions?view=webview2-1.0.2792.45#put_isinprivatemodeenabled))
  ///- Linux WPE WebKit ([Official API - webkit_network_session_new_ephemeral](https://wpewebkit.org/reference/stable/wpe-webkit-2.0/ctor.NetworkSession.new_ephemeral.html))
  ///
  ///Use the [CygnusWebViewSettings.isPropertySupported] method to check if this property is supported at runtime.
  ///{@endtemplate}
  incognito,

  ///Can be used to check if the [CygnusWebViewSettings.initialScale] property is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusWebViewSettings.initialScale.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView ([Official API - WebView.setInitialScale](https://developer.android.com/reference/android/webkit/WebView#setInitialScale(int)))
  ///
  ///Use the [CygnusWebViewSettings.isPropertySupported] method to check if this property is supported at runtime.
  ///{@endtemplate}
  initialScale,

  ///Can be used to check if the [CygnusWebViewSettings.interceptOnlyAsyncAjaxRequests] property is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusWebViewSettings.interceptOnlyAsyncAjaxRequests.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView
  ///- iOS WKWebView
  ///- macOS WKWebView
  ///
  ///Use the [CygnusWebViewSettings.isPropertySupported] method to check if this property is supported at runtime.
  ///{@endtemplate}
  interceptOnlyAsyncAjaxRequests,

  ///Can be used to check if the [CygnusWebViewSettings.isDirectionalLockEnabled] property is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusWebViewSettings.isDirectionalLockEnabled.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- iOS WKWebView ([Official API - UIScrollView.isDirectionalLockEnabled](https://developer.apple.com/documentation/uikit/uiscrollview/1619390-isdirectionallockenabled))
  ///
  ///Use the [CygnusWebViewSettings.isPropertySupported] method to check if this property is supported at runtime.
  ///{@endtemplate}
  isDirectionalLockEnabled,

  ///Can be used to check if the [CygnusWebViewSettings.isElementFullscreenEnabled] property is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusWebViewSettings.isElementFullscreenEnabled.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- iOS WKWebView 15.4+ ([Official API - WKPreferences.isElementFullscreenEnabled](https://developer.apple.com/documentation/webkit/wkpreferences/3917769-iselementfullscreenenabled))
  ///- macOS WKWebView 12.3+ ([Official API - WKPreferences.isElementFullscreenEnabled](https://developer.apple.com/documentation/webkit/wkpreferences/3917769-iselementfullscreenenabled))
  ///- Linux WPE WebKit ([Official API - WebKitSettings.enable-fullscreen](https://wpewebkit.org/reference/stable/wpe-webkit-2.0/property.Settings.enable-fullscreen.html))
  ///
  ///Use the [CygnusWebViewSettings.isPropertySupported] method to check if this property is supported at runtime.
  ///{@endtemplate}
  isElementFullscreenEnabled,

  ///Can be used to check if the [CygnusWebViewSettings.isFindInteractionEnabled] property is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusWebViewSettings.isFindInteractionEnabled.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- iOS WKWebView 16.0+ ([Official API - WKWebView.isFindInteractionEnabled](https://developer.apple.com/documentation/webkit/wkwebview/4002044-isfindinteractionenabled/))
  ///
  ///Use the [CygnusWebViewSettings.isPropertySupported] method to check if this property is supported at runtime.
  ///{@endtemplate}
  isFindInteractionEnabled,

  ///Can be used to check if the [CygnusWebViewSettings.isFraudulentWebsiteWarningEnabled] property is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusWebViewSettings.isFraudulentWebsiteWarningEnabled.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- iOS WKWebView 13.0+ ([Official API - WKPreferences.isFraudulentWebsiteWarningEnabled](https://developer.apple.com/documentation/webkit/wkpreferences/3335219-isfraudulentwebsitewarningenable))
  ///- macOS WKWebView 10.15+ ([Official API - WKPreferences.isFraudulentWebsiteWarningEnabled](https://developer.apple.com/documentation/webkit/wkpreferences/3335219-isfraudulentwebsitewarningenable))
  ///
  ///Use the [CygnusWebViewSettings.isPropertySupported] method to check if this property is supported at runtime.
  ///{@endtemplate}
  isFraudulentWebsiteWarningEnabled,

  ///Can be used to check if the [CygnusWebViewSettings.isInspectable] property is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusWebViewSettings.isInspectable.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- iOS WKWebView 16.4+ ([Official API - WKWebView.isInspectable](https://developer.apple.com/documentation/webkit/wkwebview/4111163-isinspectable))
  ///- macOS WKWebView 13.3+ ([Official API - WKWebView.isInspectable](https://developer.apple.com/documentation/webkit/wkwebview/4111163-isinspectable))
  ///- Windows WebView2 ([Official API - ICoreWebView2Settings.put_AreDevToolsEnabled](https://learn.microsoft.com/en-us/microsoft-edge/webview2/reference/win32/icorewebview2settings?view=webview2-1.0.2210.55#put_aredevtoolsenabled))
  ///
  ///Use the [CygnusWebViewSettings.isPropertySupported] method to check if this property is supported at runtime.
  ///{@endtemplate}
  isInspectable,

  ///Can be used to check if the [CygnusWebViewSettings.isPagingEnabled] property is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusWebViewSettings.isPagingEnabled.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- iOS WKWebView ([Official API - UIScrollView.isPagingEnabled](https://developer.apple.com/documentation/uikit/uiscrollview/1619432-ispagingenabled))
  ///
  ///Use the [CygnusWebViewSettings.isPropertySupported] method to check if this property is supported at runtime.
  ///{@endtemplate}
  isPagingEnabled,

  ///Can be used to check if the [CygnusWebViewSettings.isSiteSpecificQuirksModeEnabled] property is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusWebViewSettings.isSiteSpecificQuirksModeEnabled.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- iOS WKWebView 15.4+ ([Official API - WKPreferences.isSiteSpecificQuirksModeEnabled](https://developer.apple.com/documentation/webkit/wkpreferences/3916069-issitespecificquirksmodeenabled))
  ///- macOS WKWebView 12.3+ ([Official API - WKPreferences.isSiteSpecificQuirksModeEnabled](https://developer.apple.com/documentation/webkit/wkpreferences/3916069-issitespecificquirksmodeenabled))
  ///
  ///Use the [CygnusWebViewSettings.isPropertySupported] method to check if this property is supported at runtime.
  ///{@endtemplate}
  isSiteSpecificQuirksModeEnabled,

  ///Can be used to check if the [CygnusWebViewSettings.isTextInteractionEnabled] property is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusWebViewSettings.isTextInteractionEnabled.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- iOS WKWebView 15.0+ ([Official API - WKPreferences.isTextInteractionEnabled](https://developer.apple.com/documentation/webkit/wkpreferences/3727362-istextinteractionenabled))
  ///- macOS WKWebView 11.3+ ([Official API - WKPreferences.isTextInteractionEnabled](https://developer.apple.com/documentation/webkit/wkpreferences/3727362-istextinteractionenabled))
  ///
  ///Use the [CygnusWebViewSettings.isPropertySupported] method to check if this property is supported at runtime.
  ///{@endtemplate}
  isTextInteractionEnabled,

  ///Can be used to check if the [CygnusWebViewSettings.isUserInteractionEnabled] property is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusWebViewSettings.isUserInteractionEnabled.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView
  ///- iOS WKWebView ([Official API - UIView.isUserInteractionEnabled](https://developer.apple.com/documentation/uikit/uiview/1622577-isuserinteractionenabled))
  ///
  ///Use the [CygnusWebViewSettings.isPropertySupported] method to check if this property is supported at runtime.
  ///{@endtemplate}
  isUserInteractionEnabled,

  ///Can be used to check if the [CygnusWebViewSettings.itpEnabled] property is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusWebViewSettings.itpEnabled.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Linux WPE WebKit 2.40+ ([Official API - webkit_network_session_set_itp_enabled](https://wpewebkit.org/reference/stable/wpe-webkit-2.0/method.NetworkSession.set_itp_enabled.html)):
  ///    - This is a session-level setting. When enabled, ACCEPT_NO_THIRD_PARTY cookie policy is overridden to ACCEPT_ALWAYS.
  ///
  ///Use the [CygnusWebViewSettings.isPropertySupported] method to check if this property is supported at runtime.
  ///{@endtemplate}
  itpEnabled,

  ///Can be used to check if the [CygnusWebViewSettings.javaScriptBridgeEnabled] property is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusWebViewSettings.javaScriptBridgeEnabled.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView
  ///- iOS WKWebView
  ///- macOS WKWebView
  ///- Windows WebView2
  ///- Web \<iframe\> but requires same origin
  ///
  ///Use the [CygnusWebViewSettings.isPropertySupported] method to check if this property is supported at runtime.
  ///{@endtemplate}
  javaScriptBridgeEnabled,

  ///Can be used to check if the [CygnusWebViewSettings.javaScriptBridgeForMainFrameOnly] property is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusWebViewSettings.javaScriptBridgeForMainFrameOnly.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView
  ///- iOS WKWebView
  ///- macOS WKWebView
  ///- Windows WebView2
  ///
  ///Use the [CygnusWebViewSettings.isPropertySupported] method to check if this property is supported at runtime.
  ///{@endtemplate}
  javaScriptBridgeForMainFrameOnly,

  ///Can be used to check if the [CygnusWebViewSettings.javaScriptBridgeOriginAllowList] property is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusWebViewSettings.javaScriptBridgeOriginAllowList.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView
  ///- iOS WKWebView
  ///- macOS WKWebView
  ///- Windows WebView2
  ///- Web \<iframe\> but requires same origin
  ///
  ///Use the [CygnusWebViewSettings.isPropertySupported] method to check if this property is supported at runtime.
  ///{@endtemplate}
  javaScriptBridgeOriginAllowList,

  ///Can be used to check if the [CygnusWebViewSettings.javaScriptCanAccessClipboard] property is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusWebViewSettings.javaScriptCanAccessClipboard.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Linux WPE WebKit ([Official API - WebKitSettings.javascript-can-access-clipboard](https://wpewebkit.org/reference/stable/wpe-webkit-2.0/property.Settings.javascript-can-access-clipboard.html))
  ///
  ///Use the [CygnusWebViewSettings.isPropertySupported] method to check if this property is supported at runtime.
  ///{@endtemplate}
  javaScriptCanAccessClipboard,

  ///Can be used to check if the [CygnusWebViewSettings.javaScriptCanOpenWindowsAutomatically] property is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusWebViewSettings.javaScriptCanOpenWindowsAutomatically.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView ([Official API - WebSettings.setJavaScriptCanOpenWindowsAutomatically](https://developer.android.com/reference/android/webkit/WebSettings?hl=en#setJavaScriptCanOpenWindowsAutomatically(boolean)))
  ///- iOS WKWebView ([Official API - WKPreferences.javaScriptCanOpenWindowsAutomatically](https://developer.apple.com/documentation/webkit/wkpreferences/1536573-javascriptcanopenwindowsautomati/))
  ///- macOS WKWebView ([Official API - WKPreferences.javaScriptCanOpenWindowsAutomatically](https://developer.apple.com/documentation/webkit/wkpreferences/1536573-javascriptcanopenwindowsautomati/))
  ///- Web \<iframe\> but requires same origin
  ///
  ///Use the [CygnusWebViewSettings.isPropertySupported] method to check if this property is supported at runtime.
  ///{@endtemplate}
  javaScriptCanOpenWindowsAutomatically,

  ///Can be used to check if the [CygnusWebViewSettings.javaScriptEnabled] property is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusWebViewSettings.javaScriptEnabled.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView ([Official API - WebSettings.setJavaScriptEnabled](https://developer.android.com/reference/android/webkit/WebSettings?hl=en#setJavaScriptEnabled(boolean)))
  ///- iOS WKWebView ([Official API - WKWebpagePreferences.allowsContentJavaScript](https://developer.apple.com/documentation/webkit/wkwebpagepreferences/3552422-allowscontentjavascript/))
  ///- macOS WKWebView ([Official API - WKWebpagePreferences.allowsContentJavaScript](https://developer.apple.com/documentation/webkit/wkwebpagepreferences/3552422-allowscontentjavascript/))
  ///- Web \<iframe\>
  ///- Windows WebView2 ([Official API - ICoreWebView2Settings.put_IsScriptEnabled](https://learn.microsoft.com/en-us/microsoft-edge/webview2/reference/win32/icorewebview2settings?view=webview2-1.0.2210.55#put_isscriptenabled))
  ///
  ///Use the [CygnusWebViewSettings.isPropertySupported] method to check if this property is supported at runtime.
  ///{@endtemplate}
  javaScriptEnabled,

  ///Can be used to check if the [CygnusWebViewSettings.javaScriptHandlersForMainFrameOnly] property is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusWebViewSettings.javaScriptHandlersForMainFrameOnly.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView
  ///- iOS WKWebView
  ///- macOS WKWebView
  ///- Windows WebView2
  ///
  ///Use the [CygnusWebViewSettings.isPropertySupported] method to check if this property is supported at runtime.
  ///{@endtemplate}
  javaScriptHandlersForMainFrameOnly,

  ///Can be used to check if the [CygnusWebViewSettings.javaScriptHandlersOriginAllowList] property is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusWebViewSettings.javaScriptHandlersOriginAllowList.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView
  ///- iOS WKWebView
  ///- macOS WKWebView
  ///- Windows WebView2
  ///- Web \<iframe\> but requires same origin
  ///
  ///Use the [CygnusWebViewSettings.isPropertySupported] method to check if this property is supported at runtime.
  ///{@endtemplate}
  javaScriptHandlersOriginAllowList,

  ///Can be used to check if the [CygnusWebViewSettings.keyRepeatDelay] property is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusWebViewSettings.keyRepeatDelay.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Linux WPE WebKit ([Official API - WPESettings.key-repeat-delay](https://wpewebkit.org/reference/stable/wpe-platform-2.0/class.Settings.html)):
  ///    - This is a WPE Platform display-level setting. Value is in milliseconds.
  ///
  ///Use the [CygnusWebViewSettings.isPropertySupported] method to check if this property is supported at runtime.
  ///{@endtemplate}
  keyRepeatDelay,

  ///Can be used to check if the [CygnusWebViewSettings.keyRepeatInterval] property is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusWebViewSettings.keyRepeatInterval.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Linux WPE WebKit ([Official API - WPESettings.key-repeat-interval](https://wpewebkit.org/reference/stable/wpe-platform-2.0/class.Settings.html)):
  ///    - This is a WPE Platform display-level setting. Value is in milliseconds.
  ///
  ///Use the [CygnusWebViewSettings.isPropertySupported] method to check if this property is supported at runtime.
  ///{@endtemplate}
  keyRepeatInterval,

  ///Can be used to check if the [CygnusWebViewSettings.keyboardAvoidance] property is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusWebViewSettings.keyboardAvoidance.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView
  ///- iOS WKWebView
  ///
  ///Use the [CygnusWebViewSettings.isPropertySupported] method to check if this property is supported at runtime.
  ///{@endtemplate}
  keyboardAvoidance,

  ///Can be used to check if the [CygnusWebViewSettings.layoutAlgorithm] property is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusWebViewSettings.layoutAlgorithm.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView ([Official API - WebSettings.setLayoutAlgorithm](https://developer.android.com/reference/android/webkit/WebSettings?hl=en#setLayoutAlgorithm(android.webkit.WebSettings.CygnusLayoutAlgorithm)))
  ///
  ///Use the [CygnusWebViewSettings.isPropertySupported] method to check if this property is supported at runtime.
  ///{@endtemplate}
  layoutAlgorithm,

  ///Can be used to check if the [CygnusWebViewSettings.limitsNavigationsToAppBoundDomains] property is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusWebViewSettings.limitsNavigationsToAppBoundDomains.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- iOS WKWebView 14.0+ ([Official API - WKWebViewConfiguration.limitsNavigationsToAppBoundDomains](https://developer.apple.com/documentation/webkit/wkwebviewconfiguration/3585117-limitsnavigationstoappbounddomai))
  ///- macOS WKWebView 11.0+ ([Official API - WKWebViewConfiguration.limitsNavigationsToAppBoundDomains](https://developer.apple.com/documentation/webkit/wkwebviewconfiguration/3585117-limitsnavigationstoappbounddomai))
  ///
  ///Use the [CygnusWebViewSettings.isPropertySupported] method to check if this property is supported at runtime.
  ///{@endtemplate}
  limitsNavigationsToAppBoundDomains,

  ///Can be used to check if the [CygnusWebViewSettings.loadWithOverviewMode] property is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusWebViewSettings.loadWithOverviewMode.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView ([Official API - WebSettings.setLoadWithOverviewMode](https://developer.android.com/reference/android/webkit/WebSettings?hl=en#setLoadWithOverviewMode(boolean)))
  ///
  ///Use the [CygnusWebViewSettings.isPropertySupported] method to check if this property is supported at runtime.
  ///{@endtemplate}
  loadWithOverviewMode,

  ///Can be used to check if the [CygnusWebViewSettings.loadsImagesAutomatically] property is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusWebViewSettings.loadsImagesAutomatically.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView ([Official API - WebSettings.setLoadsImagesAutomatically](https://developer.android.com/reference/android/webkit/WebSettings?hl=en#setLoadsImagesAutomatically(boolean)))
  ///- Linux WPE WebKit ([Official API - WebKitSettings.auto-load-images](https://wpewebkit.org/reference/stable/wpe-webkit-2.0/property.Settings.auto-load-images.html))
  ///
  ///Use the [CygnusWebViewSettings.isPropertySupported] method to check if this property is supported at runtime.
  ///{@endtemplate}
  loadsImagesAutomatically,

  ///Can be used to check if the [CygnusWebViewSettings.maximumViewportInset] property is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusWebViewSettings.maximumViewportInset.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- iOS WKWebView 15.5+ ([Official API - WKWebView.setMinimumViewportInset](https://developer.apple.com/documentation/webkit/wkwebview/3974127-setminimumviewportinset/))
  ///
  ///Use the [CygnusWebViewSettings.isPropertySupported] method to check if this property is supported at runtime.
  ///{@endtemplate}
  maximumViewportInset,

  ///Can be used to check if the [CygnusWebViewSettings.maximumZoomScale] property is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusWebViewSettings.maximumZoomScale.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- iOS WKWebView ([Official API - UIScrollView.maximumZoomScale](https://developer.apple.com/documentation/uikit/uiscrollview/1619408-maximumzoomscale))
  ///
  ///Use the [CygnusWebViewSettings.isPropertySupported] method to check if this property is supported at runtime.
  ///{@endtemplate}
  maximumZoomScale,

  ///Can be used to check if the [CygnusWebViewSettings.mediaContentTypesRequiringHardwareSupport] property is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusWebViewSettings.mediaContentTypesRequiringHardwareSupport.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Linux WPE WebKit 2.30+ ([Official API - WebKitSettings.media-content-types-requiring-hardware-support](https://wpewebkit.org/reference/stable/wpe-webkit-2.0/property.Settings.media-content-types-requiring-hardware-support.html)):
  ///    - Requires WPE WebKit 2.30 or later
  ///
  ///Use the [CygnusWebViewSettings.isPropertySupported] method to check if this property is supported at runtime.
  ///{@endtemplate}
  mediaContentTypesRequiringHardwareSupport,

  ///Can be used to check if the [CygnusWebViewSettings.mediaPlaybackRequiresUserGesture] property is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusWebViewSettings.mediaPlaybackRequiresUserGesture.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView ([Official API - WebSettings.setMediaPlaybackRequiresUserGesture](https://developer.android.com/reference/android/webkit/WebSettings?hl=en#setMediaPlaybackRequiresUserGesture(boolean)))
  ///- iOS WKWebView ([Official API - WKWebViewConfiguration.mediaTypesRequiringUserActionForPlayback](https://developer.apple.com/documentation/webkit/wkwebviewconfiguration/1851524-mediatypesrequiringuseractionfor))
  ///- macOS WKWebView 10.12+ ([Official API - WKWebViewConfiguration.mediaTypesRequiringUserActionForPlayback](https://developer.apple.com/documentation/webkit/wkwebviewconfiguration/1851524-mediatypesrequiringuseractionfor))
  ///
  ///Use the [CygnusWebViewSettings.isPropertySupported] method to check if this property is supported at runtime.
  ///{@endtemplate}
  mediaPlaybackRequiresUserGesture,

  ///Can be used to check if the [CygnusWebViewSettings.mediaType] property is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusWebViewSettings.mediaType.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- iOS WKWebView 14.0+ ([Official API - WKWebView.mediaType](https://developer.apple.com/documentation/webkit/wkwebview/3516410-mediatype))
  ///- macOS WKWebView 11.0+ ([Official API - WKWebView.mediaType](https://developer.apple.com/documentation/webkit/wkwebview/3516410-mediatype))
  ///
  ///Use the [CygnusWebViewSettings.isPropertySupported] method to check if this property is supported at runtime.
  ///{@endtemplate}
  mediaType,

  ///Can be used to check if the [CygnusWebViewSettings.minimumFontSize] property is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusWebViewSettings.minimumFontSize.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView ([Official API - WebSettings.setMinimumFontSize](https://developer.android.com/reference/android/webkit/WebSettings?hl=en#setMinimumFontSize(int)))
  ///- iOS WKWebView ([Official API - WKPreferences.minimumFontSize](https://developer.apple.com/documentation/webkit/wkpreferences/1537155-minimumfontsize/))
  ///- macOS WKWebView ([Official API - WKPreferences.minimumFontSize](https://developer.apple.com/documentation/webkit/wkpreferences/1537155-minimumfontsize/))
  ///
  ///Use the [CygnusWebViewSettings.isPropertySupported] method to check if this property is supported at runtime.
  ///{@endtemplate}
  minimumFontSize,

  ///Can be used to check if the [CygnusWebViewSettings.minimumLogicalFontSize] property is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusWebViewSettings.minimumLogicalFontSize.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView ([Official API - WebSettings.setMinimumLogicalFontSize](https://developer.android.com/reference/android/webkit/WebSettings?hl=en#setMinimumLogicalFontSize(int)))
  ///
  ///Use the [CygnusWebViewSettings.isPropertySupported] method to check if this property is supported at runtime.
  ///{@endtemplate}
  minimumLogicalFontSize,

  ///Can be used to check if the [CygnusWebViewSettings.minimumViewportInset] property is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusWebViewSettings.minimumViewportInset.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- iOS WKWebView 15.5+ ([Official API - WKWebView.setMinimumViewportInset](https://developer.apple.com/documentation/webkit/wkwebview/3974127-setminimumviewportinset/))
  ///
  ///Use the [CygnusWebViewSettings.isPropertySupported] method to check if this property is supported at runtime.
  ///{@endtemplate}
  minimumViewportInset,

  ///Can be used to check if the [CygnusWebViewSettings.minimumZoomScale] property is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusWebViewSettings.minimumZoomScale.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- iOS WKWebView ([Official API - UIScrollView.minimumZoomScale](https://developer.apple.com/documentation/uikit/uiscrollview/1619428-minimumzoomscale))
  ///
  ///Use the [CygnusWebViewSettings.isPropertySupported] method to check if this property is supported at runtime.
  ///{@endtemplate}
  minimumZoomScale,

  ///Can be used to check if the [CygnusWebViewSettings.mixedContentMode] property is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusWebViewSettings.mixedContentMode.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView 21+ ([Official API - WebSettings.setMixedContentMode](https://developer.android.com/reference/android/webkit/WebSettings?hl=en#setMixedContentMode(int)))
  ///
  ///Use the [CygnusWebViewSettings.isPropertySupported] method to check if this property is supported at runtime.
  ///{@endtemplate}
  mixedContentMode,

  ///Can be used to check if the [CygnusWebViewSettings.needInitialFocus] property is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusWebViewSettings.needInitialFocus.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView ([Official API - WebSettings.setNeedInitialFocus](https://developer.android.com/reference/android/webkit/WebSettings?hl=en#setNeedInitialFocus(boolean)))
  ///
  ///Use the [CygnusWebViewSettings.isPropertySupported] method to check if this property is supported at runtime.
  ///{@endtemplate}
  needInitialFocus,

  ///Can be used to check if the [CygnusWebViewSettings.networkAvailable] property is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusWebViewSettings.networkAvailable.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView ([Official API - WebView.setNetworkAvailable](https://developer.android.com/reference/android/webkit/WebView#setNetworkAvailable(boolean)))
  ///
  ///Use the [CygnusWebViewSettings.isPropertySupported] method to check if this property is supported at runtime.
  ///{@endtemplate}
  networkAvailable,

  ///Can be used to check if the [CygnusWebViewSettings.nonClientRegionSupportEnabled] property is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusWebViewSettings.nonClientRegionSupportEnabled.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Windows WebView2 1.0.2420.47+ ([Official API - ICoreWebView2Settings9.put_IsNonClientRegionSupportEnabled](https://learn.microsoft.com/en-us/microsoft-edge/webview2/reference/win32/icorewebview2settings9?view=webview2-1.0.2849.39#put_isnonclientregionsupportenabled))
  ///
  ///Use the [CygnusWebViewSettings.isPropertySupported] method to check if this property is supported at runtime.
  ///{@endtemplate}
  nonClientRegionSupportEnabled,

  ///Can be used to check if the [CygnusWebViewSettings.offscreenPreRaster] property is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusWebViewSettings.offscreenPreRaster.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView 23+ ([Official API - WebSettings.setOffscreenPreRaster](https://developer.android.com/reference/android/webkit/WebSettings?hl=en#setOffscreenPreRaster(boolean)))
  ///
  ///Use the [CygnusWebViewSettings.isPropertySupported] method to check if this property is supported at runtime.
  ///{@endtemplate}
  offscreenPreRaster,

  ///Can be used to check if the [CygnusWebViewSettings.overScrollMode] property is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusWebViewSettings.overScrollMode.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView ([Official API - View.setOverScrollMode](https://developer.android.com/reference/android/view/View#setOverScrollMode(int)))
  ///
  ///Use the [CygnusWebViewSettings.isPropertySupported] method to check if this property is supported at runtime.
  ///{@endtemplate}
  overScrollMode,

  ///Can be used to check if the [CygnusWebViewSettings.pageZoom] property is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusWebViewSettings.pageZoom.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- iOS WKWebView 14.0+ ([Official API - WKWebView.pageZoom](https://developer.apple.com/documentation/webkit/wkwebview/3516411-pagezoom))
  ///- macOS WKWebView 11.0+ ([Official API - WKWebView.pageZoom](https://developer.apple.com/documentation/webkit/wkwebview/3516411-pagezoom))
  ///
  ///Use the [CygnusWebViewSettings.isPropertySupported] method to check if this property is supported at runtime.
  ///{@endtemplate}
  pageZoom,

  ///Can be used to check if the [CygnusWebViewSettings.passwordAutosaveEnabled] property is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusWebViewSettings.passwordAutosaveEnabled.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Windows WebView2 1.0.902.49+ ([Official API - ICoreWebView2Settings4.put_IsPasswordAutosaveEnabled](https://learn.microsoft.com/en-us/microsoft-edge/webview2/reference/win32/icorewebview2settings4?view=webview2-1.0.2849.39#put_ispasswordautosaveenabled))
  ///
  ///Use the [CygnusWebViewSettings.isPropertySupported] method to check if this property is supported at runtime.
  ///{@endtemplate}
  passwordAutosaveEnabled,

  ///Can be used to check if the [CygnusWebViewSettings.pictographFontFamily] property is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusWebViewSettings.pictographFontFamily.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Linux WPE WebKit ([Official API - WebKitSettings.pictograph-font-family](https://wpewebkit.org/reference/stable/wpe-webkit-2.0/property.Settings.pictograph-font-family.html))
  ///
  ///Use the [CygnusWebViewSettings.isPropertySupported] method to check if this property is supported at runtime.
  ///{@endtemplate}
  pictographFontFamily,

  ///Can be used to check if the [CygnusWebViewSettings.pinchZoomEnabled] property is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusWebViewSettings.pinchZoomEnabled.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Windows WebView2 1.0.902.49+ ([Official API - ICoreWebView2Settings5.put_IsPinchZoomEnabled](https://learn.microsoft.com/en-us/microsoft-edge/webview2/reference/win32/icorewebview2settings5?view=webview2-1.0.2849.39#put_ispinchzoomenabled))
  ///
  ///Use the [CygnusWebViewSettings.isPropertySupported] method to check if this property is supported at runtime.
  ///{@endtemplate}
  pinchZoomEnabled,

  ///Can be used to check if the [CygnusWebViewSettings.pluginScriptsForMainFrameOnly] property is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusWebViewSettings.pluginScriptsForMainFrameOnly.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView
  ///- iOS WKWebView
  ///- macOS WKWebView
  ///- Windows WebView2
  ///
  ///Use the [CygnusWebViewSettings.isPropertySupported] method to check if this property is supported at runtime.
  ///{@endtemplate}
  pluginScriptsForMainFrameOnly,

  ///Can be used to check if the [CygnusWebViewSettings.pluginScriptsOriginAllowList] property is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusWebViewSettings.pluginScriptsOriginAllowList.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView
  ///- iOS WKWebView
  ///- macOS WKWebView
  ///- Windows WebView2
  ///
  ///Use the [CygnusWebViewSettings.isPropertySupported] method to check if this property is supported at runtime.
  ///{@endtemplate}
  pluginScriptsOriginAllowList,

  ///Can be used to check if the [CygnusWebViewSettings.preferredContentMode] property is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusWebViewSettings.preferredContentMode.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView
  ///- iOS WKWebView 13.0+ ([Official API - WKWebpagePreferences.preferredContentMode](https://developer.apple.com/documentation/webkit/wkwebpagepreferences/3194426-preferredcontentmode/))
  ///- macOS WKWebView 10.15+ ([Official API - WKWebpagePreferences.preferredContentMode](https://developer.apple.com/documentation/webkit/wkwebpagepreferences/3194426-preferredcontentmode/))
  ///
  ///Use the [CygnusWebViewSettings.isPropertySupported] method to check if this property is supported at runtime.
  ///{@endtemplate}
  preferredContentMode,

  ///Can be used to check if the [CygnusWebViewSettings.regexToAllowSyncUrlLoading] property is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusWebViewSettings.regexToAllowSyncUrlLoading.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView
  ///
  ///Use the [CygnusWebViewSettings.isPropertySupported] method to check if this property is supported at runtime.
  ///{@endtemplate}
  regexToAllowSyncUrlLoading,

  ///Can be used to check if the [CygnusWebViewSettings.regexToCancelSubFramesLoading] property is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusWebViewSettings.regexToCancelSubFramesLoading.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView
  ///
  ///Use the [CygnusWebViewSettings.isPropertySupported] method to check if this property is supported at runtime.
  ///{@endtemplate}
  regexToCancelSubFramesLoading,

  ///Can be used to check if the [CygnusWebViewSettings.rendererPriorityPolicy] property is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusWebViewSettings.rendererPriorityPolicy.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView ([Official API - WebView.setRendererPriorityPolicy](https://developer.android.com/reference/android/webkit/WebView#setRendererPriorityPolicy(int,%20boolean)))
  ///
  ///Use the [CygnusWebViewSettings.isPropertySupported] method to check if this property is supported at runtime.
  ///{@endtemplate}
  rendererPriorityPolicy,

  ///Can be used to check if the [CygnusWebViewSettings.reputationCheckingRequired] property is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusWebViewSettings.reputationCheckingRequired.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Windows WebView2 1.0.1722.45+ ([Official API - ICoreWebView2Settings8.put_IsReputationCheckingRequired](https://learn.microsoft.com/en-us/microsoft-edge/webview2/reference/win32/icorewebview2settings8?view=webview2-1.0.2849.39#put_isreputationcheckingrequired))
  ///
  ///Use the [CygnusWebViewSettings.isPropertySupported] method to check if this property is supported at runtime.
  ///{@endtemplate}
  reputationCheckingRequired,

  ///Can be used to check if the [CygnusWebViewSettings.requestedWithHeaderOriginAllowList] property is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusWebViewSettings.requestedWithHeaderOriginAllowList.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView ([Official API - WebSettingsCompat.setRequestedWithHeaderOriginAllowList](https://developer.android.com/reference/androidx/webkit/WebSettingsCompat#setRequestedWithHeaderOriginAllowList(android.webkit.WebSettings,java.util.Set%3Cjava.lang.String%3E))):
  ///    - available on Android only if [CygnusWebViewFeature.REQUESTED_WITH_HEADER_ALLOW_LIST] feature is supported.
  ///
  ///Use the [CygnusWebViewSettings.isPropertySupported] method to check if this property is supported at runtime.
  ///{@endtemplate}
  requestedWithHeaderOriginAllowList,

  ///Can be used to check if the [CygnusWebViewSettings.resourceCustomSchemes] property is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusWebViewSettings.resourceCustomSchemes.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView
  ///- iOS WKWebView 11.0+
  ///- macOS WKWebView 10.13+
  ///
  ///Use the [CygnusWebViewSettings.isPropertySupported] method to check if this property is supported at runtime.
  ///{@endtemplate}
  resourceCustomSchemes,

  ///Can be used to check if the [CygnusWebViewSettings.safeBrowsingEnabled] property is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusWebViewSettings.safeBrowsingEnabled.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView 26+ ([Official API - WebSettings.setSafeBrowsingEnabled](https://developer.android.com/reference/android/webkit/WebSettings?hl=en#setSafeBrowsingEnabled(boolean)))
  ///
  ///Use the [CygnusWebViewSettings.isPropertySupported] method to check if this property is supported at runtime.
  ///{@endtemplate}
  safeBrowsingEnabled,

  ///Can be used to check if the [CygnusWebViewSettings.sansSerifFontFamily] property is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusWebViewSettings.sansSerifFontFamily.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView ([Official API - WebSettings.setSansSerifFontFamily](https://developer.android.com/reference/android/webkit/WebSettings?hl=en#setSansSerifFontFamily(java.lang.String)))
  ///- Linux WPE WebKit ([Official API - WebKitSettings.sans-serif-font-family](https://wpewebkit.org/reference/stable/wpe-webkit-2.0/property.Settings.sans-serif-font-family.html))
  ///
  ///Use the [CygnusWebViewSettings.isPropertySupported] method to check if this property is supported at runtime.
  ///{@endtemplate}
  sansSerifFontFamily,

  ///Can be used to check if the [CygnusWebViewSettings.saveFormData] property is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusWebViewSettings.saveFormData.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView ([Official API - WebSettings.setSaveFormData](https://developer.android.com/reference/android/webkit/WebSettings?hl=en#setSaveFormData(boolean)))
  ///
  ///Use the [CygnusWebViewSettings.isPropertySupported] method to check if this property is supported at runtime.
  ///{@endtemplate}
  @Deprecated('')
  saveFormData,

  ///Can be used to check if the [CygnusWebViewSettings.scrollBarDefaultDelayBeforeFade] property is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusWebViewSettings.scrollBarDefaultDelayBeforeFade.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView ([Official API - View.setScrollBarDefaultDelayBeforeFade](https://developer.android.com/reference/android/view/View#setScrollBarDefaultDelayBeforeFade(int)))
  ///
  ///Use the [CygnusWebViewSettings.isPropertySupported] method to check if this property is supported at runtime.
  ///{@endtemplate}
  scrollBarDefaultDelayBeforeFade,

  ///Can be used to check if the [CygnusWebViewSettings.scrollBarFadeDuration] property is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusWebViewSettings.scrollBarFadeDuration.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView ([Official API - View.setScrollBarFadeDuration](https://developer.android.com/reference/android/view/View#setScrollBarFadeDuration(int)))
  ///
  ///Use the [CygnusWebViewSettings.isPropertySupported] method to check if this property is supported at runtime.
  ///{@endtemplate}
  scrollBarFadeDuration,

  ///Can be used to check if the [CygnusWebViewSettings.scrollBarStyle] property is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusWebViewSettings.scrollBarStyle.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView ([Official API - WebView.setScrollBarStyle](https://developer.android.com/reference/android/webkit/WebView#setScrollBarStyle(int)))
  ///
  ///Use the [CygnusWebViewSettings.isPropertySupported] method to check if this property is supported at runtime.
  ///{@endtemplate}
  scrollBarStyle,

  ///Can be used to check if the [CygnusWebViewSettings.scrollMultiplier] property is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusWebViewSettings.scrollMultiplier.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Windows WebView2
  ///
  ///Use the [CygnusWebViewSettings.isPropertySupported] method to check if this property is supported at runtime.
  ///{@endtemplate}
  scrollMultiplier,

  ///Can be used to check if the [CygnusWebViewSettings.scrollbarFadingEnabled] property is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusWebViewSettings.scrollbarFadingEnabled.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView ([Official API - View.setScrollbarFadingEnabled](https://developer.android.com/reference/android/view/View#setScrollbarFadingEnabled(boolean)))
  ///
  ///Use the [CygnusWebViewSettings.isPropertySupported] method to check if this property is supported at runtime.
  ///{@endtemplate}
  scrollbarFadingEnabled,

  ///Can be used to check if the [CygnusWebViewSettings.scrollsToTop] property is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusWebViewSettings.scrollsToTop.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- iOS WKWebView ([Official API - UIScrollView.scrollsToTop](https://developer.apple.com/documentation/uikit/uiscrollview/1619421-scrollstotop))
  ///
  ///Use the [CygnusWebViewSettings.isPropertySupported] method to check if this property is supported at runtime.
  ///{@endtemplate}
  scrollsToTop,

  ///Can be used to check if the [CygnusWebViewSettings.selectionGranularity] property is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusWebViewSettings.selectionGranularity.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- iOS WKWebView ([Official API - WKWebViewConfiguration.selectionGranularity](https://developer.apple.com/documentation/webkit/wkwebviewconfiguration/1614756-selectiongranularity))
  ///
  ///Use the [CygnusWebViewSettings.isPropertySupported] method to check if this property is supported at runtime.
  ///{@endtemplate}
  selectionGranularity,

  ///Can be used to check if the [CygnusWebViewSettings.serifFontFamily] property is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusWebViewSettings.serifFontFamily.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView ([Official API - WebSettings.setSerifFontFamily](https://developer.android.com/reference/android/webkit/WebSettings?hl=en#setSerifFontFamily(java.lang.String)))
  ///- Linux WPE WebKit ([Official API - WebKitSettings.serif-font-family](https://wpewebkit.org/reference/stable/wpe-webkit-2.0/property.Settings.serif-font-family.html))
  ///
  ///Use the [CygnusWebViewSettings.isPropertySupported] method to check if this property is supported at runtime.
  ///{@endtemplate}
  serifFontFamily,

  ///Can be used to check if the [CygnusWebViewSettings.sharedCookiesEnabled] property is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusWebViewSettings.sharedCookiesEnabled.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- iOS WKWebView 11.0+
  ///- macOS WKWebView 10.13+
  ///
  ///Use the [CygnusWebViewSettings.isPropertySupported] method to check if this property is supported at runtime.
  ///{@endtemplate}
  sharedCookiesEnabled,

  ///Can be used to check if the [CygnusWebViewSettings.shouldPrintBackgrounds] property is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusWebViewSettings.shouldPrintBackgrounds.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- iOS WKWebView 16.4+ ([Official API - WKWebView.shouldPrintBackgrounds](https://developer.apple.com/documentation/webkit/wkpreferences/4104043-shouldprintbackgrounds))
  ///- macOS WKWebView 13.3+ ([Official API - WKWebView.shouldPrintBackgrounds](https://developer.apple.com/documentation/webkit/wkpreferences/4104043-shouldprintbackgrounds))
  ///
  ///Use the [CygnusWebViewSettings.isPropertySupported] method to check if this property is supported at runtime.
  ///{@endtemplate}
  shouldPrintBackgrounds,

  ///Can be used to check if the [CygnusWebViewSettings.standardFontFamily] property is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusWebViewSettings.standardFontFamily.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView ([Official API - WebSettings.setStandardFontFamily](https://developer.android.com/reference/android/webkit/WebSettings?hl=en#setStandardFontFamily(java.lang.String)))
  ///- Linux WPE WebKit ([Official API - WebKitSettings.default-font-family](https://wpewebkit.org/reference/stable/wpe-webkit-2.0/property.Settings.default-font-family.html))
  ///
  ///Use the [CygnusWebViewSettings.isPropertySupported] method to check if this property is supported at runtime.
  ///{@endtemplate}
  standardFontFamily,

  ///Can be used to check if the [CygnusWebViewSettings.statusBarEnabled] property is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusWebViewSettings.statusBarEnabled.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Windows WebView2 ([Official API - ICoreWebView2Settings.put_IsStatusBarEnabled](https://learn.microsoft.com/en-us/microsoft-edge/webview2/reference/win32/icorewebview2settings?view=webview2-1.0.2849.39#put_isstatusbarenabled))
  ///
  ///Use the [CygnusWebViewSettings.isPropertySupported] method to check if this property is supported at runtime.
  ///{@endtemplate}
  statusBarEnabled,

  ///Can be used to check if the [CygnusWebViewSettings.supportMultipleWindows] property is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusWebViewSettings.supportMultipleWindows.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView ([Official API - WebSettings.setSupportMultipleWindows](https://developer.android.com/reference/android/webkit/WebSettings?hl=en#setSupportMultipleWindows(boolean)))
  ///
  ///Use the [CygnusWebViewSettings.isPropertySupported] method to check if this property is supported at runtime.
  ///{@endtemplate}
  supportMultipleWindows,

  ///Can be used to check if the [CygnusWebViewSettings.supportZoom] property is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusWebViewSettings.supportZoom.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView ([Official API - WebSettings.setSupportZoom](https://developer.android.com/reference/android/webkit/WebSettings?hl=en#setSupportZoom(boolean)))
  ///- iOS WKWebView
  ///- macOS WKWebView
  ///- Windows WebView2 ([Official API - ICoreWebView2Settings.put_IsZoomControlEnabled](https://learn.microsoft.com/en-us/microsoft-edge/webview2/reference/win32/icorewebview2settings?view=webview2-1.0.2210.55#put_iszoomcontrolenabled))
  ///
  ///Use the [CygnusWebViewSettings.isPropertySupported] method to check if this property is supported at runtime.
  ///{@endtemplate}
  supportZoom,

  ///Can be used to check if the [CygnusWebViewSettings.suppressesIncrementalRendering] property is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusWebViewSettings.suppressesIncrementalRendering.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- iOS WKWebView ([Official API - WKWebViewConfiguration.suppressesIncrementalRendering](https://developer.apple.com/documentation/webkit/wkwebviewconfiguration/1395663-suppressesincrementalrendering))
  ///- macOS WKWebView ([Official API - WKWebViewConfiguration.suppressesIncrementalRendering](https://developer.apple.com/documentation/webkit/wkwebviewconfiguration/1395663-suppressesincrementalrendering))
  ///
  ///Use the [CygnusWebViewSettings.isPropertySupported] method to check if this property is supported at runtime.
  ///{@endtemplate}
  suppressesIncrementalRendering,

  ///Can be used to check if the [CygnusWebViewSettings.textZoom] property is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusWebViewSettings.textZoom.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView ([Official API - WebSettings.setTextZoom](https://developer.android.com/reference/android/webkit/WebSettings?hl=en#setTextZoom(int)))
  ///
  ///Use the [CygnusWebViewSettings.isPropertySupported] method to check if this property is supported at runtime.
  ///{@endtemplate}
  textZoom,

  ///Can be used to check if the [CygnusWebViewSettings.thirdPartyCookiesEnabled] property is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusWebViewSettings.thirdPartyCookiesEnabled.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView 21+ ([Official API - CygnusCookieManager.setAcceptThirdPartyCookies](https://developer.android.com/reference/android/webkit/CygnusCookieManager#setAcceptThirdPartyCookies(android.webkit.WebView,%20boolean)))
  ///
  ///Use the [CygnusWebViewSettings.isPropertySupported] method to check if this property is supported at runtime.
  ///{@endtemplate}
  thirdPartyCookiesEnabled,

  ///Can be used to check if the [CygnusWebViewSettings.transparentBackground] property is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusWebViewSettings.transparentBackground.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView
  ///- iOS WKWebView
  ///- macOS WKWebView 12.0+
  ///- Windows WebView2 1.0.774.44+ ([Official API - ICoreWebView2Controller2.put_DefaultBackgroundColor](https://learn.microsoft.com/en-us/microsoft-edge/webview2/reference/win32/icorewebview2controller2?view=webview2-1.0.2210.55#put_defaultbackgroundcolor))
  ///
  ///Use the [CygnusWebViewSettings.isPropertySupported] method to check if this property is supported at runtime.
  ///{@endtemplate}
  transparentBackground,

  ///Can be used to check if the [CygnusWebViewSettings.underPageBackgroundColor] property is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusWebViewSettings.underPageBackgroundColor.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- iOS WKWebView 15.0+ ([Official API - WKWebView.underPageBackgroundColor](https://developer.apple.com/documentation/webkit/wkwebview/3850574-underpagebackgroundcolor))
  ///- macOS WKWebView 12.0+ ([Official API - WKWebView.underPageBackgroundColor](https://developer.apple.com/documentation/webkit/wkwebview/3850574-underpagebackgroundcolor))
  ///
  ///Use the [CygnusWebViewSettings.isPropertySupported] method to check if this property is supported at runtime.
  ///{@endtemplate}
  underPageBackgroundColor,

  ///Can be used to check if the [CygnusWebViewSettings.upgradeKnownHostsToHTTPS] property is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusWebViewSettings.upgradeKnownHostsToHTTPS.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- iOS WKWebView 15.0+ ([Official API - WKWebViewConfiguration.upgradeKnownHostsToHTTPS](https://developer.apple.com/documentation/webkit/wkwebviewconfiguration/3752243-upgradeknownhoststohttps))
  ///- macOS WKWebView 11.3+ ([Official API - WKWebViewConfiguration.upgradeKnownHostsToHTTPS](https://developer.apple.com/documentation/webkit/wkwebviewconfiguration/3752243-upgradeknownhoststohttps))
  ///
  ///Use the [CygnusWebViewSettings.isPropertySupported] method to check if this property is supported at runtime.
  ///{@endtemplate}
  upgradeKnownHostsToHTTPS,

  ///Can be used to check if the [CygnusWebViewSettings.useHybridComposition] property is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusWebViewSettings.useHybridComposition.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView:
  ///    - It is recommended to use Hybrid Composition only on Android 10+ for a release app, as it can cause framerate drops on animations in Android 9 and lower (see [Hybrid-Composition#performance](https://github.com/flutter/flutter/wiki/Hybrid-Composition#performance)).
  ///
  ///Use the [CygnusWebViewSettings.isPropertySupported] method to check if this property is supported at runtime.
  ///{@endtemplate}
  @Deprecated('Use androidCompositionMode instead')
  useHybridComposition,

  ///Can be used to check if the [CygnusWebViewSettings.useOnAjaxProgress] property is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusWebViewSettings.useOnAjaxProgress.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView
  ///- iOS WKWebView
  ///- macOS WKWebView
  ///
  ///Use the [CygnusWebViewSettings.isPropertySupported] method to check if this property is supported at runtime.
  ///{@endtemplate}
  useOnAjaxProgress,

  ///Can be used to check if the [CygnusWebViewSettings.useOnAjaxReadyStateChange] property is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusWebViewSettings.useOnAjaxReadyStateChange.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView
  ///- iOS WKWebView
  ///- macOS WKWebView
  ///
  ///Use the [CygnusWebViewSettings.isPropertySupported] method to check if this property is supported at runtime.
  ///{@endtemplate}
  useOnAjaxReadyStateChange,

  ///Can be used to check if the [CygnusWebViewSettings.useOnDownloadStart] property is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusWebViewSettings.useOnDownloadStart.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView
  ///- iOS WKWebView
  ///- macOS WKWebView
  ///
  ///Use the [CygnusWebViewSettings.isPropertySupported] method to check if this property is supported at runtime.
  ///{@endtemplate}
  useOnDownloadStart,

  ///Can be used to check if the [CygnusWebViewSettings.useOnLoadResource] property is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusWebViewSettings.useOnLoadResource.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView
  ///- iOS WKWebView
  ///- macOS WKWebView
  ///- Linux WPE WebKit
  ///
  ///Use the [CygnusWebViewSettings.isPropertySupported] method to check if this property is supported at runtime.
  ///{@endtemplate}
  useOnLoadResource,

  ///Can be used to check if the [CygnusWebViewSettings.useOnNavigationResponse] property is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusWebViewSettings.useOnNavigationResponse.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- iOS WKWebView
  ///- macOS WKWebView
  ///
  ///Use the [CygnusWebViewSettings.isPropertySupported] method to check if this property is supported at runtime.
  ///{@endtemplate}
  useOnNavigationResponse,

  ///Can be used to check if the [CygnusWebViewSettings.useOnRenderProcessGone] property is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusWebViewSettings.useOnRenderProcessGone.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView
  ///
  ///Use the [CygnusWebViewSettings.isPropertySupported] method to check if this property is supported at runtime.
  ///{@endtemplate}
  useOnRenderProcessGone,

  ///Can be used to check if the [CygnusWebViewSettings.useOnShowFileChooser] property is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusWebViewSettings.useOnShowFileChooser.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView
  ///
  ///Use the [CygnusWebViewSettings.isPropertySupported] method to check if this property is supported at runtime.
  ///{@endtemplate}
  useOnShowFileChooser,

  ///Can be used to check if the [CygnusWebViewSettings.useShouldInterceptAjaxRequest] property is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusWebViewSettings.useShouldInterceptAjaxRequest.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView
  ///- iOS WKWebView
  ///- macOS WKWebView
  ///
  ///Use the [CygnusWebViewSettings.isPropertySupported] method to check if this property is supported at runtime.
  ///{@endtemplate}
  useShouldInterceptAjaxRequest,

  ///Can be used to check if the [CygnusWebViewSettings.useShouldInterceptFetchRequest] property is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusWebViewSettings.useShouldInterceptFetchRequest.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView
  ///- iOS WKWebView
  ///- macOS WKWebView
  ///
  ///Use the [CygnusWebViewSettings.isPropertySupported] method to check if this property is supported at runtime.
  ///{@endtemplate}
  useShouldInterceptFetchRequest,

  ///Can be used to check if the [CygnusWebViewSettings.useShouldInterceptRequest] property is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusWebViewSettings.useShouldInterceptRequest.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView
  ///
  ///Use the [CygnusWebViewSettings.isPropertySupported] method to check if this property is supported at runtime.
  ///{@endtemplate}
  useShouldInterceptRequest,

  ///Can be used to check if the [CygnusWebViewSettings.useShouldOverrideUrlLoading] property is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusWebViewSettings.useShouldOverrideUrlLoading.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView
  ///- iOS WKWebView
  ///- macOS WKWebView
  ///- Windows WebView2
  ///
  ///Use the [CygnusWebViewSettings.isPropertySupported] method to check if this property is supported at runtime.
  ///{@endtemplate}
  useShouldOverrideUrlLoading,

  ///Can be used to check if the [CygnusWebViewSettings.useWideViewPort] property is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusWebViewSettings.useWideViewPort.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView ([Official API - WebSettings.setUseWideViewPort](https://developer.android.com/reference/android/webkit/WebSettings?hl=en#setUseWideViewPort(boolean)))
  ///
  ///Use the [CygnusWebViewSettings.isPropertySupported] method to check if this property is supported at runtime.
  ///{@endtemplate}
  useWideViewPort,

  ///Can be used to check if the [CygnusWebViewSettings.userAgent] property is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusWebViewSettings.userAgent.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView ([Official API - WebSettings.setUserAgentString](https://developer.android.com/reference/android/webkit/WebSettings?hl=en#setUserAgentString(java.lang.String)))
  ///- iOS WKWebView ([Official API - WKWebView.customUserAgent](https://developer.apple.com/documentation/webkit/wkwebview/1414950-customuseragent))
  ///- macOS WKWebView ([Official API - WKWebView.customUserAgent](https://developer.apple.com/documentation/webkit/wkwebview/1414950-customuseragent))
  ///- Windows WebView2 ([Official API - ICoreWebView2Settings2.put_UserAgent](https://learn.microsoft.com/en-us/microsoft-edge/webview2/reference/win32/icorewebview2settings2?view=webview2-1.0.2210.55#put_useragent))
  ///
  ///Use the [CygnusWebViewSettings.isPropertySupported] method to check if this property is supported at runtime.
  ///{@endtemplate}
  userAgent,

  ///Can be used to check if the [CygnusWebViewSettings.verticalScrollBarEnabled] property is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusWebViewSettings.verticalScrollBarEnabled.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView ([Official API - View.setVerticalScrollBarEnabled](https://developer.android.com/reference/android/view/View#setVerticalScrollBarEnabled(boolean)))
  ///- iOS WKWebView ([Official API - UIScrollView.showsVerticalScrollIndicator](https://developer.apple.com/documentation/uikit/uiscrollview/1619405-showsverticalscrollindicator/))
  ///- Web \<iframe\> but requires same origin:
  ///    - It must have the same value of [horizontalScrollBarEnabled] to take effect.
  ///
  ///Use the [CygnusWebViewSettings.isPropertySupported] method to check if this property is supported at runtime.
  ///{@endtemplate}
  verticalScrollBarEnabled,

  ///Can be used to check if the [CygnusWebViewSettings.verticalScrollbarPosition] property is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusWebViewSettings.verticalScrollbarPosition.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView ([Official API - View.setVerticalScrollbarPosition](https://developer.android.com/reference/android/view/View#setVerticalScrollbarPosition(int)))
  ///
  ///Use the [CygnusWebViewSettings.isPropertySupported] method to check if this property is supported at runtime.
  ///{@endtemplate}
  verticalScrollbarPosition,

  ///Can be used to check if the [CygnusWebViewSettings.verticalScrollbarThumbColor] property is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusWebViewSettings.verticalScrollbarThumbColor.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView 29+ ([Official API - View.setVerticalScrollbarThumbDrawable](https://developer.android.com/reference/android/view/View#setVerticalScrollbarThumbDrawable(android.graphics.drawable.Drawable)))
  ///
  ///Use the [CygnusWebViewSettings.isPropertySupported] method to check if this property is supported at runtime.
  ///{@endtemplate}
  verticalScrollbarThumbColor,

  ///Can be used to check if the [CygnusWebViewSettings.verticalScrollbarTrackColor] property is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusWebViewSettings.verticalScrollbarTrackColor.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView 29+ ([Official API - View.setVerticalScrollbarTrackDrawable](https://developer.android.com/reference/android/view/View#setVerticalScrollbarTrackDrawable(android.graphics.drawable.Drawable)))
  ///
  ///Use the [CygnusWebViewSettings.isPropertySupported] method to check if this property is supported at runtime.
  ///{@endtemplate}
  verticalScrollbarTrackColor,

  ///Can be used to check if the [CygnusWebViewSettings.webRTCUdpPortsRange] property is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusWebViewSettings.webRTCUdpPortsRange.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Linux WPE WebKit 2.48+ ([Official API - WebKitSettings.webrtc-udp-ports-range](https://wpewebkit.org/reference/stable/wpe-webkit-2.0/property.Settings.webrtc-udp-ports-range.html)):
  ///    - Requires WPE WebKit 2.48 or later. Format: 'minPort:maxPort'
  ///
  ///Use the [CygnusWebViewSettings.isPropertySupported] method to check if this property is supported at runtime.
  ///{@endtemplate}
  webRTCUdpPortsRange,

  ///Can be used to check if the [CygnusWebViewSettings.webViewAssetLoader] property is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusWebViewSettings.webViewAssetLoader.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView
  ///
  ///Use the [CygnusWebViewSettings.isPropertySupported] method to check if this property is supported at runtime.
  ///{@endtemplate}
  webViewAssetLoader,
}

extension _CygnusWebViewSettingsPropertySupported on CygnusWebViewSettings {
  static bool isPropertySupported(
    CygnusWebViewSettingsProperty property, {
    TargetPlatform? platform,
  }) {
    switch (property) {
      case CygnusWebViewSettingsProperty.accessibilityIgnoresInvertColors:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [TargetPlatform.iOS].contains(platform ?? defaultTargetPlatform);
      case CygnusWebViewSettingsProperty.algorithmicDarkeningAllowed:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [
              TargetPlatform.android,
            ].contains(platform ?? defaultTargetPlatform);
      case CygnusWebViewSettingsProperty.allowBackgroundAudioPlaying:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [
              TargetPlatform.android,
            ].contains(platform ?? defaultTargetPlatform);
      case CygnusWebViewSettingsProperty.allowContentAccess:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [
              TargetPlatform.android,
            ].contains(platform ?? defaultTargetPlatform);
      case CygnusWebViewSettingsProperty.allowFileAccess:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [
              TargetPlatform.android,
            ].contains(platform ?? defaultTargetPlatform);
      case CygnusWebViewSettingsProperty.allowFileAccessFromFileURLs:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [
              TargetPlatform.android,
              TargetPlatform.iOS,
              TargetPlatform.macOS,
              TargetPlatform.linux,
            ].contains(platform ?? defaultTargetPlatform);
      case CygnusWebViewSettingsProperty.allowModalDialogs:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [TargetPlatform.linux].contains(platform ?? defaultTargetPlatform);
      case CygnusWebViewSettingsProperty.allowTopNavigationToDataUrls:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [TargetPlatform.linux].contains(platform ?? defaultTargetPlatform);
      case CygnusWebViewSettingsProperty.allowUniversalAccessFromFileURLs:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [
              TargetPlatform.android,
              TargetPlatform.iOS,
              TargetPlatform.macOS,
              TargetPlatform.linux,
            ].contains(platform ?? defaultTargetPlatform);
      case CygnusWebViewSettingsProperty.allowingReadAccessTo:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [
              TargetPlatform.iOS,
              TargetPlatform.macOS,
            ].contains(platform ?? defaultTargetPlatform);
      case CygnusWebViewSettingsProperty.allowsAirPlayForMediaPlayback:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [
              TargetPlatform.iOS,
              TargetPlatform.macOS,
            ].contains(platform ?? defaultTargetPlatform);
      case CygnusWebViewSettingsProperty.allowsBackForwardNavigationGestures:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [
              TargetPlatform.iOS,
              TargetPlatform.macOS,
              TargetPlatform.windows,
            ].contains(platform ?? defaultTargetPlatform);
      case CygnusWebViewSettingsProperty.allowsInlineMediaPlayback:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [
              TargetPlatform.iOS,
              TargetPlatform.linux,
            ].contains(platform ?? defaultTargetPlatform);
      case CygnusWebViewSettingsProperty.allowsLinkPreview:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [
              TargetPlatform.iOS,
              TargetPlatform.macOS,
            ].contains(platform ?? defaultTargetPlatform);
      case CygnusWebViewSettingsProperty.allowsPictureInPictureMediaPlayback:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [TargetPlatform.iOS].contains(platform ?? defaultTargetPlatform);
      case CygnusWebViewSettingsProperty.alpha:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [
              TargetPlatform.android,
              TargetPlatform.iOS,
              TargetPlatform.macOS,
            ].contains(platform ?? defaultTargetPlatform);
      case CygnusWebViewSettingsProperty.alwaysBounceHorizontal:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [TargetPlatform.iOS].contains(platform ?? defaultTargetPlatform);
      case CygnusWebViewSettingsProperty.alwaysBounceVertical:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [TargetPlatform.iOS].contains(platform ?? defaultTargetPlatform);
      case CygnusWebViewSettingsProperty.androidCompositionMode:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [
              TargetPlatform.android,
            ].contains(platform ?? defaultTargetPlatform);
      case CygnusWebViewSettingsProperty.appCachePath:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [
              TargetPlatform.android,
            ].contains(platform ?? defaultTargetPlatform);
      case CygnusWebViewSettingsProperty.applePayAPIEnabled:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [TargetPlatform.iOS].contains(platform ?? defaultTargetPlatform);
      case CygnusWebViewSettingsProperty.applicationNameForUserAgent:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [
              TargetPlatform.android,
              TargetPlatform.iOS,
              TargetPlatform.macOS,
            ].contains(platform ?? defaultTargetPlatform);
      case CygnusWebViewSettingsProperty
          .automaticallyAdjustsScrollIndicatorInsets:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [TargetPlatform.iOS].contains(platform ?? defaultTargetPlatform);
      case CygnusWebViewSettingsProperty.blockNetworkImage:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [
              TargetPlatform.android,
            ].contains(platform ?? defaultTargetPlatform);
      case CygnusWebViewSettingsProperty.blockNetworkLoads:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [
              TargetPlatform.android,
            ].contains(platform ?? defaultTargetPlatform);
      case CygnusWebViewSettingsProperty.browserAcceleratorKeysEnabled:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [
              TargetPlatform.windows,
            ].contains(platform ?? defaultTargetPlatform);
      case CygnusWebViewSettingsProperty.builtInZoomControls:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [
              TargetPlatform.android,
            ].contains(platform ?? defaultTargetPlatform);
      case CygnusWebViewSettingsProperty.cacheEnabled:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [
              TargetPlatform.android,
              TargetPlatform.iOS,
              TargetPlatform.macOS,
            ].contains(platform ?? defaultTargetPlatform);
      case CygnusWebViewSettingsProperty.cacheMode:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [
              TargetPlatform.android,
            ].contains(platform ?? defaultTargetPlatform);
      case CygnusWebViewSettingsProperty.clearCache:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [
              TargetPlatform.android,
              TargetPlatform.iOS,
              TargetPlatform.macOS,
            ].contains(platform ?? defaultTargetPlatform);
      case CygnusWebViewSettingsProperty.clearSessionCache:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [
              TargetPlatform.android,
            ].contains(platform ?? defaultTargetPlatform);
      case CygnusWebViewSettingsProperty.contentBlockers:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [
              TargetPlatform.android,
              TargetPlatform.iOS,
              TargetPlatform.macOS,
              TargetPlatform.linux,
            ].contains(platform ?? defaultTargetPlatform);
      case CygnusWebViewSettingsProperty.contentInsetAdjustmentBehavior:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [TargetPlatform.iOS].contains(platform ?? defaultTargetPlatform);
      case CygnusWebViewSettingsProperty.corsAllowlist:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [TargetPlatform.linux].contains(platform ?? defaultTargetPlatform);
      case CygnusWebViewSettingsProperty.cursiveFontFamily:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [
              TargetPlatform.android,
              TargetPlatform.linux,
            ].contains(platform ?? defaultTargetPlatform);
      case CygnusWebViewSettingsProperty.cursorBlinkTime:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [TargetPlatform.linux].contains(platform ?? defaultTargetPlatform);
      case CygnusWebViewSettingsProperty.darkMode:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [TargetPlatform.linux].contains(platform ?? defaultTargetPlatform);
      case CygnusWebViewSettingsProperty.dataDetectorTypes:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [TargetPlatform.iOS].contains(platform ?? defaultTargetPlatform);
      case CygnusWebViewSettingsProperty.databaseEnabled:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [
              TargetPlatform.android,
              TargetPlatform.linux,
            ].contains(platform ?? defaultTargetPlatform);
      case CygnusWebViewSettingsProperty.decelerationRate:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [TargetPlatform.iOS].contains(platform ?? defaultTargetPlatform);
      case CygnusWebViewSettingsProperty.defaultFixedFontSize:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [
              TargetPlatform.android,
              TargetPlatform.linux,
            ].contains(platform ?? defaultTargetPlatform);
      case CygnusWebViewSettingsProperty.defaultFontSize:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [
              TargetPlatform.android,
              TargetPlatform.linux,
            ].contains(platform ?? defaultTargetPlatform);
      case CygnusWebViewSettingsProperty.defaultTextEncodingName:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [
              TargetPlatform.android,
              TargetPlatform.linux,
            ].contains(platform ?? defaultTargetPlatform);
      case CygnusWebViewSettingsProperty.defaultVideoPoster:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [
              TargetPlatform.android,
            ].contains(platform ?? defaultTargetPlatform);
      case CygnusWebViewSettingsProperty.disableAnimations:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [TargetPlatform.linux].contains(platform ?? defaultTargetPlatform);
      case CygnusWebViewSettingsProperty.disableContextMenu:
        return kIsWeb && platform == null
            ? true
            : ((kIsWeb && platform != null) || !kIsWeb) &&
                  [
                    TargetPlatform.android,
                    TargetPlatform.iOS,
                    TargetPlatform.windows,
                  ].contains(platform ?? defaultTargetPlatform);
      case CygnusWebViewSettingsProperty.disableDefaultErrorPage:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [
              TargetPlatform.android,
              TargetPlatform.windows,
            ].contains(platform ?? defaultTargetPlatform);
      case CygnusWebViewSettingsProperty.disableHorizontalScroll:
        return kIsWeb && platform == null
            ? true
            : ((kIsWeb && platform != null) || !kIsWeb) &&
                  [
                    TargetPlatform.android,
                    TargetPlatform.iOS,
                  ].contains(platform ?? defaultTargetPlatform);
      case CygnusWebViewSettingsProperty.disableInputAccessoryView:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [TargetPlatform.iOS].contains(platform ?? defaultTargetPlatform);
      case CygnusWebViewSettingsProperty.disableLongPressContextMenuOnLinks:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [TargetPlatform.iOS].contains(platform ?? defaultTargetPlatform);
      case CygnusWebViewSettingsProperty.disableVerticalScroll:
        return kIsWeb && platform == null
            ? true
            : ((kIsWeb && platform != null) || !kIsWeb) &&
                  [
                    TargetPlatform.android,
                    TargetPlatform.iOS,
                  ].contains(platform ?? defaultTargetPlatform);
      case CygnusWebViewSettingsProperty.disableWebSecurity:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [TargetPlatform.linux].contains(platform ?? defaultTargetPlatform);
      case CygnusWebViewSettingsProperty.disabledActionModeMenuItems:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [
              TargetPlatform.android,
            ].contains(platform ?? defaultTargetPlatform);
      case CygnusWebViewSettingsProperty.disallowOverScroll:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [TargetPlatform.iOS].contains(platform ?? defaultTargetPlatform);
      case CygnusWebViewSettingsProperty.displayZoomControls:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [
              TargetPlatform.android,
            ].contains(platform ?? defaultTargetPlatform);
      case CygnusWebViewSettingsProperty.domStorageEnabled:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [
              TargetPlatform.android,
              TargetPlatform.linux,
            ].contains(platform ?? defaultTargetPlatform);
      case CygnusWebViewSettingsProperty.doubleClickDistance:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [TargetPlatform.linux].contains(platform ?? defaultTargetPlatform);
      case CygnusWebViewSettingsProperty.doubleClickTime:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [TargetPlatform.linux].contains(platform ?? defaultTargetPlatform);
      case CygnusWebViewSettingsProperty.dragThreshold:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [TargetPlatform.linux].contains(platform ?? defaultTargetPlatform);
      case CygnusWebViewSettingsProperty.drawCompositingIndicators:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [TargetPlatform.linux].contains(platform ?? defaultTargetPlatform);
      case CygnusWebViewSettingsProperty.enable2DCanvasAcceleration:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [TargetPlatform.linux].contains(platform ?? defaultTargetPlatform);
      case CygnusWebViewSettingsProperty.enableCaretBrowsing:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [TargetPlatform.linux].contains(platform ?? defaultTargetPlatform);
      case CygnusWebViewSettingsProperty.enableEncryptedMedia:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [TargetPlatform.linux].contains(platform ?? defaultTargetPlatform);
      case CygnusWebViewSettingsProperty.enableJavaScriptMarkup:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [TargetPlatform.linux].contains(platform ?? defaultTargetPlatform);
      case CygnusWebViewSettingsProperty.enableMedia:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [TargetPlatform.linux].contains(platform ?? defaultTargetPlatform);
      case CygnusWebViewSettingsProperty.enableMediaCapabilities:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [TargetPlatform.linux].contains(platform ?? defaultTargetPlatform);
      case CygnusWebViewSettingsProperty.enableMockCaptureDevices:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [TargetPlatform.linux].contains(platform ?? defaultTargetPlatform);
      case CygnusWebViewSettingsProperty.enablePageCache:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [TargetPlatform.linux].contains(platform ?? defaultTargetPlatform);
      case CygnusWebViewSettingsProperty.enableResizableTextAreas:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [TargetPlatform.linux].contains(platform ?? defaultTargetPlatform);
      case CygnusWebViewSettingsProperty.enableSmoothScrolling:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [TargetPlatform.linux].contains(platform ?? defaultTargetPlatform);
      case CygnusWebViewSettingsProperty.enableSpatialNavigation:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [TargetPlatform.linux].contains(platform ?? defaultTargetPlatform);
      case CygnusWebViewSettingsProperty.enableTabsToLinks:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [TargetPlatform.linux].contains(platform ?? defaultTargetPlatform);
      case CygnusWebViewSettingsProperty.enableViewportScale:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [
              TargetPlatform.iOS,
              TargetPlatform.macOS,
            ].contains(platform ?? defaultTargetPlatform);
      case CygnusWebViewSettingsProperty.enableWebRTC:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [TargetPlatform.linux].contains(platform ?? defaultTargetPlatform);
      case CygnusWebViewSettingsProperty.enableWriteConsoleMessagesToStdout:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [TargetPlatform.linux].contains(platform ?? defaultTargetPlatform);
      case CygnusWebViewSettingsProperty
          .enterpriseAuthenticationAppLinkPolicyEnabled:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [
              TargetPlatform.android,
            ].contains(platform ?? defaultTargetPlatform);
      case CygnusWebViewSettingsProperty.fantasyFontFamily:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [
              TargetPlatform.android,
              TargetPlatform.linux,
            ].contains(platform ?? defaultTargetPlatform);
      case CygnusWebViewSettingsProperty.fixedFontFamily:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [
              TargetPlatform.android,
              TargetPlatform.linux,
            ].contains(platform ?? defaultTargetPlatform);
      case CygnusWebViewSettingsProperty.fontAntialias:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [TargetPlatform.linux].contains(platform ?? defaultTargetPlatform);
      case CygnusWebViewSettingsProperty.fontDPI:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [TargetPlatform.linux].contains(platform ?? defaultTargetPlatform);
      case CygnusWebViewSettingsProperty.fontHintingStyle:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [TargetPlatform.linux].contains(platform ?? defaultTargetPlatform);
      case CygnusWebViewSettingsProperty.fontSubpixelLayout:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [TargetPlatform.linux].contains(platform ?? defaultTargetPlatform);
      case CygnusWebViewSettingsProperty.forceDark:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [
              TargetPlatform.android,
            ].contains(platform ?? defaultTargetPlatform);
      case CygnusWebViewSettingsProperty.forceDarkStrategy:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [
              TargetPlatform.android,
            ].contains(platform ?? defaultTargetPlatform);
      case CygnusWebViewSettingsProperty.generalAutofillEnabled:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [
              TargetPlatform.windows,
            ].contains(platform ?? defaultTargetPlatform);
      case CygnusWebViewSettingsProperty.geolocationEnabled:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [
              TargetPlatform.android,
            ].contains(platform ?? defaultTargetPlatform);
      case CygnusWebViewSettingsProperty.handleAcceleratorKeyPressed:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [
              TargetPlatform.windows,
            ].contains(platform ?? defaultTargetPlatform);
      case CygnusWebViewSettingsProperty.hardwareAcceleration:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [
              TargetPlatform.android,
            ].contains(platform ?? defaultTargetPlatform);
      case CygnusWebViewSettingsProperty.hiddenPdfToolbarItems:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [
              TargetPlatform.windows,
            ].contains(platform ?? defaultTargetPlatform);
      case CygnusWebViewSettingsProperty.horizontalScrollBarEnabled:
        return kIsWeb && platform == null
            ? true
            : ((kIsWeb && platform != null) || !kIsWeb) &&
                  [
                    TargetPlatform.android,
                    TargetPlatform.iOS,
                  ].contains(platform ?? defaultTargetPlatform);
      case CygnusWebViewSettingsProperty.horizontalScrollbarThumbColor:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [
              TargetPlatform.android,
            ].contains(platform ?? defaultTargetPlatform);
      case CygnusWebViewSettingsProperty.horizontalScrollbarTrackColor:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [
              TargetPlatform.android,
            ].contains(platform ?? defaultTargetPlatform);
      case CygnusWebViewSettingsProperty.iframeAllow:
        return kIsWeb && platform == null
            ? true
            : ((kIsWeb && platform != null) || !kIsWeb) &&
                  [].contains(platform ?? defaultTargetPlatform);
      case CygnusWebViewSettingsProperty.iframeAllowFullscreen:
        return kIsWeb && platform == null
            ? true
            : ((kIsWeb && platform != null) || !kIsWeb) &&
                  [].contains(platform ?? defaultTargetPlatform);
      case CygnusWebViewSettingsProperty.iframeAriaHidden:
        return kIsWeb && platform == null
            ? true
            : ((kIsWeb && platform != null) || !kIsWeb) &&
                  [].contains(platform ?? defaultTargetPlatform);
      case CygnusWebViewSettingsProperty.iframeCsp:
        return kIsWeb && platform == null
            ? true
            : ((kIsWeb && platform != null) || !kIsWeb) &&
                  [].contains(platform ?? defaultTargetPlatform);
      case CygnusWebViewSettingsProperty.iframeName:
        return kIsWeb && platform == null
            ? true
            : ((kIsWeb && platform != null) || !kIsWeb) &&
                  [].contains(platform ?? defaultTargetPlatform);
      case CygnusWebViewSettingsProperty.iframeReferrerPolicy:
        return kIsWeb && platform == null
            ? true
            : ((kIsWeb && platform != null) || !kIsWeb) &&
                  [].contains(platform ?? defaultTargetPlatform);
      case CygnusWebViewSettingsProperty.iframeRole:
        return kIsWeb && platform == null
            ? true
            : ((kIsWeb && platform != null) || !kIsWeb) &&
                  [].contains(platform ?? defaultTargetPlatform);
      case CygnusWebViewSettingsProperty.iframeSandbox:
        return kIsWeb && platform == null
            ? true
            : ((kIsWeb && platform != null) || !kIsWeb) &&
                  [].contains(platform ?? defaultTargetPlatform);
      case CygnusWebViewSettingsProperty.ignoresViewportScaleLimits:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [TargetPlatform.iOS].contains(platform ?? defaultTargetPlatform);
      case CygnusWebViewSettingsProperty.incognito:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [
              TargetPlatform.android,
              TargetPlatform.iOS,
              TargetPlatform.macOS,
              TargetPlatform.windows,
              TargetPlatform.linux,
            ].contains(platform ?? defaultTargetPlatform);
      case CygnusWebViewSettingsProperty.initialScale:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [
              TargetPlatform.android,
            ].contains(platform ?? defaultTargetPlatform);
      case CygnusWebViewSettingsProperty.interceptOnlyAsyncAjaxRequests:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [
              TargetPlatform.android,
              TargetPlatform.iOS,
              TargetPlatform.macOS,
            ].contains(platform ?? defaultTargetPlatform);
      case CygnusWebViewSettingsProperty.isDirectionalLockEnabled:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [TargetPlatform.iOS].contains(platform ?? defaultTargetPlatform);
      case CygnusWebViewSettingsProperty.isElementFullscreenEnabled:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [
              TargetPlatform.iOS,
              TargetPlatform.macOS,
              TargetPlatform.linux,
            ].contains(platform ?? defaultTargetPlatform);
      case CygnusWebViewSettingsProperty.isFindInteractionEnabled:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [TargetPlatform.iOS].contains(platform ?? defaultTargetPlatform);
      case CygnusWebViewSettingsProperty.isFraudulentWebsiteWarningEnabled:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [
              TargetPlatform.iOS,
              TargetPlatform.macOS,
            ].contains(platform ?? defaultTargetPlatform);
      case CygnusWebViewSettingsProperty.isInspectable:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [
              TargetPlatform.iOS,
              TargetPlatform.macOS,
              TargetPlatform.windows,
            ].contains(platform ?? defaultTargetPlatform);
      case CygnusWebViewSettingsProperty.isPagingEnabled:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [TargetPlatform.iOS].contains(platform ?? defaultTargetPlatform);
      case CygnusWebViewSettingsProperty.isSiteSpecificQuirksModeEnabled:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [
              TargetPlatform.iOS,
              TargetPlatform.macOS,
            ].contains(platform ?? defaultTargetPlatform);
      case CygnusWebViewSettingsProperty.isTextInteractionEnabled:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [
              TargetPlatform.iOS,
              TargetPlatform.macOS,
            ].contains(platform ?? defaultTargetPlatform);
      case CygnusWebViewSettingsProperty.isUserInteractionEnabled:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [
              TargetPlatform.android,
              TargetPlatform.iOS,
            ].contains(platform ?? defaultTargetPlatform);
      case CygnusWebViewSettingsProperty.itpEnabled:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [TargetPlatform.linux].contains(platform ?? defaultTargetPlatform);
      case CygnusWebViewSettingsProperty.javaScriptBridgeEnabled:
        return kIsWeb && platform == null
            ? true
            : ((kIsWeb && platform != null) || !kIsWeb) &&
                  [
                    TargetPlatform.android,
                    TargetPlatform.iOS,
                    TargetPlatform.macOS,
                    TargetPlatform.windows,
                  ].contains(platform ?? defaultTargetPlatform);
      case CygnusWebViewSettingsProperty.javaScriptBridgeForMainFrameOnly:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [
              TargetPlatform.android,
              TargetPlatform.iOS,
              TargetPlatform.macOS,
              TargetPlatform.windows,
            ].contains(platform ?? defaultTargetPlatform);
      case CygnusWebViewSettingsProperty.javaScriptBridgeOriginAllowList:
        return kIsWeb && platform == null
            ? true
            : ((kIsWeb && platform != null) || !kIsWeb) &&
                  [
                    TargetPlatform.android,
                    TargetPlatform.iOS,
                    TargetPlatform.macOS,
                    TargetPlatform.windows,
                  ].contains(platform ?? defaultTargetPlatform);
      case CygnusWebViewSettingsProperty.javaScriptCanAccessClipboard:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [TargetPlatform.linux].contains(platform ?? defaultTargetPlatform);
      case CygnusWebViewSettingsProperty.javaScriptCanOpenWindowsAutomatically:
        return kIsWeb && platform == null
            ? true
            : ((kIsWeb && platform != null) || !kIsWeb) &&
                  [
                    TargetPlatform.android,
                    TargetPlatform.iOS,
                    TargetPlatform.macOS,
                  ].contains(platform ?? defaultTargetPlatform);
      case CygnusWebViewSettingsProperty.javaScriptEnabled:
        return kIsWeb && platform == null
            ? true
            : ((kIsWeb && platform != null) || !kIsWeb) &&
                  [
                    TargetPlatform.android,
                    TargetPlatform.iOS,
                    TargetPlatform.macOS,
                    TargetPlatform.windows,
                  ].contains(platform ?? defaultTargetPlatform);
      case CygnusWebViewSettingsProperty.javaScriptHandlersForMainFrameOnly:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [
              TargetPlatform.android,
              TargetPlatform.iOS,
              TargetPlatform.macOS,
              TargetPlatform.windows,
            ].contains(platform ?? defaultTargetPlatform);
      case CygnusWebViewSettingsProperty.javaScriptHandlersOriginAllowList:
        return kIsWeb && platform == null
            ? true
            : ((kIsWeb && platform != null) || !kIsWeb) &&
                  [
                    TargetPlatform.android,
                    TargetPlatform.iOS,
                    TargetPlatform.macOS,
                    TargetPlatform.windows,
                  ].contains(platform ?? defaultTargetPlatform);
      case CygnusWebViewSettingsProperty.keyRepeatDelay:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [TargetPlatform.linux].contains(platform ?? defaultTargetPlatform);
      case CygnusWebViewSettingsProperty.keyRepeatInterval:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [TargetPlatform.linux].contains(platform ?? defaultTargetPlatform);
      case CygnusWebViewSettingsProperty.keyboardAvoidance:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [
              TargetPlatform.android,
              TargetPlatform.iOS,
            ].contains(platform ?? defaultTargetPlatform);
      case CygnusWebViewSettingsProperty.layoutAlgorithm:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [
              TargetPlatform.android,
            ].contains(platform ?? defaultTargetPlatform);
      case CygnusWebViewSettingsProperty.limitsNavigationsToAppBoundDomains:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [
              TargetPlatform.iOS,
              TargetPlatform.macOS,
            ].contains(platform ?? defaultTargetPlatform);
      case CygnusWebViewSettingsProperty.loadWithOverviewMode:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [
              TargetPlatform.android,
            ].contains(platform ?? defaultTargetPlatform);
      case CygnusWebViewSettingsProperty.loadsImagesAutomatically:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [
              TargetPlatform.android,
              TargetPlatform.linux,
            ].contains(platform ?? defaultTargetPlatform);
      case CygnusWebViewSettingsProperty.maximumViewportInset:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [TargetPlatform.iOS].contains(platform ?? defaultTargetPlatform);
      case CygnusWebViewSettingsProperty.maximumZoomScale:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [TargetPlatform.iOS].contains(platform ?? defaultTargetPlatform);
      case CygnusWebViewSettingsProperty
          .mediaContentTypesRequiringHardwareSupport:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [TargetPlatform.linux].contains(platform ?? defaultTargetPlatform);
      case CygnusWebViewSettingsProperty.mediaPlaybackRequiresUserGesture:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [
              TargetPlatform.android,
              TargetPlatform.iOS,
              TargetPlatform.macOS,
            ].contains(platform ?? defaultTargetPlatform);
      case CygnusWebViewSettingsProperty.mediaType:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [
              TargetPlatform.iOS,
              TargetPlatform.macOS,
            ].contains(platform ?? defaultTargetPlatform);
      case CygnusWebViewSettingsProperty.minimumFontSize:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [
              TargetPlatform.android,
              TargetPlatform.iOS,
              TargetPlatform.macOS,
            ].contains(platform ?? defaultTargetPlatform);
      case CygnusWebViewSettingsProperty.minimumLogicalFontSize:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [
              TargetPlatform.android,
            ].contains(platform ?? defaultTargetPlatform);
      case CygnusWebViewSettingsProperty.minimumViewportInset:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [TargetPlatform.iOS].contains(platform ?? defaultTargetPlatform);
      case CygnusWebViewSettingsProperty.minimumZoomScale:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [TargetPlatform.iOS].contains(platform ?? defaultTargetPlatform);
      case CygnusWebViewSettingsProperty.mixedContentMode:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [
              TargetPlatform.android,
            ].contains(platform ?? defaultTargetPlatform);
      case CygnusWebViewSettingsProperty.needInitialFocus:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [
              TargetPlatform.android,
            ].contains(platform ?? defaultTargetPlatform);
      case CygnusWebViewSettingsProperty.networkAvailable:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [
              TargetPlatform.android,
            ].contains(platform ?? defaultTargetPlatform);
      case CygnusWebViewSettingsProperty.nonClientRegionSupportEnabled:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [
              TargetPlatform.windows,
            ].contains(platform ?? defaultTargetPlatform);
      case CygnusWebViewSettingsProperty.offscreenPreRaster:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [
              TargetPlatform.android,
            ].contains(platform ?? defaultTargetPlatform);
      case CygnusWebViewSettingsProperty.overScrollMode:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [
              TargetPlatform.android,
            ].contains(platform ?? defaultTargetPlatform);
      case CygnusWebViewSettingsProperty.pageZoom:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [
              TargetPlatform.iOS,
              TargetPlatform.macOS,
            ].contains(platform ?? defaultTargetPlatform);
      case CygnusWebViewSettingsProperty.passwordAutosaveEnabled:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [
              TargetPlatform.windows,
            ].contains(platform ?? defaultTargetPlatform);
      case CygnusWebViewSettingsProperty.pictographFontFamily:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [TargetPlatform.linux].contains(platform ?? defaultTargetPlatform);
      case CygnusWebViewSettingsProperty.pinchZoomEnabled:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [
              TargetPlatform.windows,
            ].contains(platform ?? defaultTargetPlatform);
      case CygnusWebViewSettingsProperty.pluginScriptsForMainFrameOnly:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [
              TargetPlatform.android,
              TargetPlatform.iOS,
              TargetPlatform.macOS,
              TargetPlatform.windows,
            ].contains(platform ?? defaultTargetPlatform);
      case CygnusWebViewSettingsProperty.pluginScriptsOriginAllowList:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [
              TargetPlatform.android,
              TargetPlatform.iOS,
              TargetPlatform.macOS,
              TargetPlatform.windows,
            ].contains(platform ?? defaultTargetPlatform);
      case CygnusWebViewSettingsProperty.preferredContentMode:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [
              TargetPlatform.android,
              TargetPlatform.iOS,
              TargetPlatform.macOS,
            ].contains(platform ?? defaultTargetPlatform);
      case CygnusWebViewSettingsProperty.regexToAllowSyncUrlLoading:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [
              TargetPlatform.android,
            ].contains(platform ?? defaultTargetPlatform);
      case CygnusWebViewSettingsProperty.regexToCancelSubFramesLoading:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [
              TargetPlatform.android,
            ].contains(platform ?? defaultTargetPlatform);
      case CygnusWebViewSettingsProperty.rendererPriorityPolicy:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [
              TargetPlatform.android,
            ].contains(platform ?? defaultTargetPlatform);
      case CygnusWebViewSettingsProperty.reputationCheckingRequired:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [
              TargetPlatform.windows,
            ].contains(platform ?? defaultTargetPlatform);
      case CygnusWebViewSettingsProperty.requestedWithHeaderOriginAllowList:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [
              TargetPlatform.android,
            ].contains(platform ?? defaultTargetPlatform);
      case CygnusWebViewSettingsProperty.resourceCustomSchemes:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [
              TargetPlatform.android,
              TargetPlatform.iOS,
              TargetPlatform.macOS,
            ].contains(platform ?? defaultTargetPlatform);
      case CygnusWebViewSettingsProperty.safeBrowsingEnabled:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [
              TargetPlatform.android,
            ].contains(platform ?? defaultTargetPlatform);
      case CygnusWebViewSettingsProperty.sansSerifFontFamily:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [
              TargetPlatform.android,
              TargetPlatform.linux,
            ].contains(platform ?? defaultTargetPlatform);
      case CygnusWebViewSettingsProperty.saveFormData:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [
              TargetPlatform.android,
            ].contains(platform ?? defaultTargetPlatform);
      case CygnusWebViewSettingsProperty.scrollBarDefaultDelayBeforeFade:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [
              TargetPlatform.android,
            ].contains(platform ?? defaultTargetPlatform);
      case CygnusWebViewSettingsProperty.scrollBarFadeDuration:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [
              TargetPlatform.android,
            ].contains(platform ?? defaultTargetPlatform);
      case CygnusWebViewSettingsProperty.scrollBarStyle:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [
              TargetPlatform.android,
            ].contains(platform ?? defaultTargetPlatform);
      case CygnusWebViewSettingsProperty.scrollMultiplier:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [
              TargetPlatform.windows,
            ].contains(platform ?? defaultTargetPlatform);
      case CygnusWebViewSettingsProperty.scrollbarFadingEnabled:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [
              TargetPlatform.android,
            ].contains(platform ?? defaultTargetPlatform);
      case CygnusWebViewSettingsProperty.scrollsToTop:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [TargetPlatform.iOS].contains(platform ?? defaultTargetPlatform);
      case CygnusWebViewSettingsProperty.selectionGranularity:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [TargetPlatform.iOS].contains(platform ?? defaultTargetPlatform);
      case CygnusWebViewSettingsProperty.serifFontFamily:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [
              TargetPlatform.android,
              TargetPlatform.linux,
            ].contains(platform ?? defaultTargetPlatform);
      case CygnusWebViewSettingsProperty.sharedCookiesEnabled:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [
              TargetPlatform.iOS,
              TargetPlatform.macOS,
            ].contains(platform ?? defaultTargetPlatform);
      case CygnusWebViewSettingsProperty.shouldPrintBackgrounds:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [
              TargetPlatform.iOS,
              TargetPlatform.macOS,
            ].contains(platform ?? defaultTargetPlatform);
      case CygnusWebViewSettingsProperty.standardFontFamily:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [
              TargetPlatform.android,
              TargetPlatform.linux,
            ].contains(platform ?? defaultTargetPlatform);
      case CygnusWebViewSettingsProperty.statusBarEnabled:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [
              TargetPlatform.windows,
            ].contains(platform ?? defaultTargetPlatform);
      case CygnusWebViewSettingsProperty.supportMultipleWindows:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [
              TargetPlatform.android,
            ].contains(platform ?? defaultTargetPlatform);
      case CygnusWebViewSettingsProperty.supportZoom:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [
              TargetPlatform.android,
              TargetPlatform.iOS,
              TargetPlatform.macOS,
              TargetPlatform.windows,
            ].contains(platform ?? defaultTargetPlatform);
      case CygnusWebViewSettingsProperty.suppressesIncrementalRendering:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [
              TargetPlatform.iOS,
              TargetPlatform.macOS,
            ].contains(platform ?? defaultTargetPlatform);
      case CygnusWebViewSettingsProperty.textZoom:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [
              TargetPlatform.android,
            ].contains(platform ?? defaultTargetPlatform);
      case CygnusWebViewSettingsProperty.thirdPartyCookiesEnabled:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [
              TargetPlatform.android,
            ].contains(platform ?? defaultTargetPlatform);
      case CygnusWebViewSettingsProperty.transparentBackground:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [
              TargetPlatform.android,
              TargetPlatform.iOS,
              TargetPlatform.macOS,
              TargetPlatform.windows,
            ].contains(platform ?? defaultTargetPlatform);
      case CygnusWebViewSettingsProperty.underPageBackgroundColor:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [
              TargetPlatform.iOS,
              TargetPlatform.macOS,
            ].contains(platform ?? defaultTargetPlatform);
      case CygnusWebViewSettingsProperty.upgradeKnownHostsToHTTPS:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [
              TargetPlatform.iOS,
              TargetPlatform.macOS,
            ].contains(platform ?? defaultTargetPlatform);
      case CygnusWebViewSettingsProperty.useHybridComposition:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [
              TargetPlatform.android,
            ].contains(platform ?? defaultTargetPlatform);
      case CygnusWebViewSettingsProperty.useOnAjaxProgress:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [
              TargetPlatform.android,
              TargetPlatform.iOS,
              TargetPlatform.macOS,
            ].contains(platform ?? defaultTargetPlatform);
      case CygnusWebViewSettingsProperty.useOnAjaxReadyStateChange:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [
              TargetPlatform.android,
              TargetPlatform.iOS,
              TargetPlatform.macOS,
            ].contains(platform ?? defaultTargetPlatform);
      case CygnusWebViewSettingsProperty.useOnDownloadStart:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [
              TargetPlatform.android,
              TargetPlatform.iOS,
              TargetPlatform.macOS,
            ].contains(platform ?? defaultTargetPlatform);
      case CygnusWebViewSettingsProperty.useOnLoadResource:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [
              TargetPlatform.android,
              TargetPlatform.iOS,
              TargetPlatform.macOS,
              TargetPlatform.linux,
            ].contains(platform ?? defaultTargetPlatform);
      case CygnusWebViewSettingsProperty.useOnNavigationResponse:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [
              TargetPlatform.iOS,
              TargetPlatform.macOS,
            ].contains(platform ?? defaultTargetPlatform);
      case CygnusWebViewSettingsProperty.useOnRenderProcessGone:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [
              TargetPlatform.android,
            ].contains(platform ?? defaultTargetPlatform);
      case CygnusWebViewSettingsProperty.useOnShowFileChooser:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [
              TargetPlatform.android,
            ].contains(platform ?? defaultTargetPlatform);
      case CygnusWebViewSettingsProperty.useShouldInterceptAjaxRequest:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [
              TargetPlatform.android,
              TargetPlatform.iOS,
              TargetPlatform.macOS,
            ].contains(platform ?? defaultTargetPlatform);
      case CygnusWebViewSettingsProperty.useShouldInterceptFetchRequest:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [
              TargetPlatform.android,
              TargetPlatform.iOS,
              TargetPlatform.macOS,
            ].contains(platform ?? defaultTargetPlatform);
      case CygnusWebViewSettingsProperty.useShouldInterceptRequest:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [
              TargetPlatform.android,
            ].contains(platform ?? defaultTargetPlatform);
      case CygnusWebViewSettingsProperty.useShouldOverrideUrlLoading:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [
              TargetPlatform.android,
              TargetPlatform.iOS,
              TargetPlatform.macOS,
              TargetPlatform.windows,
            ].contains(platform ?? defaultTargetPlatform);
      case CygnusWebViewSettingsProperty.useWideViewPort:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [
              TargetPlatform.android,
            ].contains(platform ?? defaultTargetPlatform);
      case CygnusWebViewSettingsProperty.userAgent:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [
              TargetPlatform.android,
              TargetPlatform.iOS,
              TargetPlatform.macOS,
              TargetPlatform.windows,
            ].contains(platform ?? defaultTargetPlatform);
      case CygnusWebViewSettingsProperty.verticalScrollBarEnabled:
        return kIsWeb && platform == null
            ? true
            : ((kIsWeb && platform != null) || !kIsWeb) &&
                  [
                    TargetPlatform.android,
                    TargetPlatform.iOS,
                  ].contains(platform ?? defaultTargetPlatform);
      case CygnusWebViewSettingsProperty.verticalScrollbarPosition:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [
              TargetPlatform.android,
            ].contains(platform ?? defaultTargetPlatform);
      case CygnusWebViewSettingsProperty.verticalScrollbarThumbColor:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [
              TargetPlatform.android,
            ].contains(platform ?? defaultTargetPlatform);
      case CygnusWebViewSettingsProperty.verticalScrollbarTrackColor:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [
              TargetPlatform.android,
            ].contains(platform ?? defaultTargetPlatform);
      case CygnusWebViewSettingsProperty.webRTCUdpPortsRange:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [TargetPlatform.linux].contains(platform ?? defaultTargetPlatform);
      case CygnusWebViewSettingsProperty.webViewAssetLoader:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [
              TargetPlatform.android,
            ].contains(platform ?? defaultTargetPlatform);
    }
  }
}
