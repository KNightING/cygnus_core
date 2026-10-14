// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'platform_inappwebview_controller.dart';

// **************************************************************************
// SupportedPlatformsGenerator
// **************************************************************************

extension _CygnusPlatformWebViewControllerClassSupported
    on CygnusPlatformWebViewController {
  ///{@template cygnus_core.CygnusPlatformWebViewController.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView
  ///- iOS WKWebView
  ///- macOS WKWebView
  ///- Web \<iframe\>
  ///- Windows WebView2
  ///- Linux WPE WebKit
  ///
  ///Use the [CygnusPlatformWebViewController.isClassSupported] method to check if this class is supported at runtime.
  ///{@endtemplate}
  static bool isClassSupported({TargetPlatform? platform}) {
    return kIsWeb && platform == null
        ? true
        : ((kIsWeb && platform != null) || !kIsWeb) &&
              [
                TargetPlatform.android,
                TargetPlatform.iOS,
                TargetPlatform.macOS,
                TargetPlatform.windows,
                TargetPlatform.linux,
              ].contains(platform ?? defaultTargetPlatform);
  }
}

///List of [CygnusPlatformWebViewController]'s properties that can be used to check i they are supported or not by the current platform.
enum CygnusPlatformWebViewControllerProperty {
  ///Can be used to check if the [CygnusPlatformWebViewController.tRexRunnerCss] property is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusPlatformWebViewController.tRexRunnerCss.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView
  ///- iOS WKWebView
  ///- macOS WKWebView
  ///- Web \<iframe\> but requires same origin
  ///- Windows WebView2
  ///- Linux WPE WebKit
  ///
  ///Use the [CygnusPlatformWebViewController.isPropertySupported] method to check if this property is supported at runtime.
  ///{@endtemplate}
  tRexRunnerCss,

  ///Can be used to check if the [CygnusPlatformWebViewController.tRexRunnerHtml] property is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusPlatformWebViewController.tRexRunnerHtml.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView
  ///- iOS WKWebView
  ///- macOS WKWebView
  ///- Web \<iframe\> but requires same origin
  ///- Windows WebView2
  ///- Linux WPE WebKit
  ///
  ///Use the [CygnusPlatformWebViewController.isPropertySupported] method to check if this property is supported at runtime.
  ///{@endtemplate}
  tRexRunnerHtml,

  ///Can be used to check if the [CygnusPlatformWebViewController.webStorage] property is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusPlatformWebViewController.webStorage.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView
  ///- iOS WKWebView
  ///- macOS WKWebView
  ///- Web \<iframe\> but requires same origin
  ///- Windows WebView2
  ///
  ///Use the [CygnusPlatformWebViewController.isPropertySupported] method to check if this property is supported at runtime.
  ///{@endtemplate}
  webStorage,
}

extension _CygnusPlatformWebViewControllerPropertySupported
    on CygnusPlatformWebViewController {
  static bool isPropertySupported(
    CygnusPlatformWebViewControllerProperty property, {
    TargetPlatform? platform,
  }) {
    switch (property) {
      case CygnusPlatformWebViewControllerProperty.tRexRunnerCss:
        return kIsWeb && platform == null
            ? true
            : ((kIsWeb && platform != null) || !kIsWeb) &&
                  [
                    TargetPlatform.android,
                    TargetPlatform.iOS,
                    TargetPlatform.macOS,
                    TargetPlatform.windows,
                    TargetPlatform.linux,
                  ].contains(platform ?? defaultTargetPlatform);
      case CygnusPlatformWebViewControllerProperty.tRexRunnerHtml:
        return kIsWeb && platform == null
            ? true
            : ((kIsWeb && platform != null) || !kIsWeb) &&
                  [
                    TargetPlatform.android,
                    TargetPlatform.iOS,
                    TargetPlatform.macOS,
                    TargetPlatform.windows,
                    TargetPlatform.linux,
                  ].contains(platform ?? defaultTargetPlatform);
      case CygnusPlatformWebViewControllerProperty.webStorage:
        return kIsWeb && platform == null
            ? true
            : ((kIsWeb && platform != null) || !kIsWeb) &&
                  [
                    TargetPlatform.android,
                    TargetPlatform.iOS,
                    TargetPlatform.macOS,
                    TargetPlatform.windows,
                  ].contains(platform ?? defaultTargetPlatform);
    }
  }
}

///List of [CygnusPlatformWebViewController]'s methods that can be used to check if they are supported or not by the current platform.
enum CygnusPlatformWebViewControllerMethod {
  ///Can be used to check if the [CygnusPlatformWebViewController.addDevToolsProtocolEventListener] method is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusPlatformWebViewController.addDevToolsProtocolEventListener.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Windows WebView2 ([Official API - ICoreWebView2DevToolsProtocolEventReceiver.add_DevToolsProtocolEventReceived](https://learn.microsoft.com/en-us/microsoft-edge/webview2/reference/win32/icorewebview2devtoolsprotocoleventreceiver?view=webview2-1.0.2210.55#add_devtoolsprotocoleventreceived))
  ///
  ///**Parameters - Officially Supported Platforms/Implementations**:
  ///- [eventName]: all platforms
  ///- [callback]: all platforms
  ///
  ///Use the [CygnusPlatformWebViewController.isMethodSupported] method to check if this method is supported at runtime.
  ///{@endtemplate}
  addDevToolsProtocolEventListener,

  ///Can be used to check if the [CygnusPlatformWebViewController.addJavaScriptHandler] method is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusPlatformWebViewController.addJavaScriptHandler.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView
  ///- iOS WKWebView
  ///- macOS WKWebView
  ///- Web \<iframe\> but requires same origin
  ///- Windows WebView2
  ///
  ///**Parameters - Officially Supported Platforms/Implementations**:
  ///- [handlerName]: all platforms
  ///- [callback]: all platforms
  ///
  ///Use the [CygnusPlatformWebViewController.isMethodSupported] method to check if this method is supported at runtime.
  ///{@endtemplate}
  addJavaScriptHandler,

  ///Can be used to check if the [CygnusPlatformWebViewController.addUserScript] method is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusPlatformWebViewController.addUserScript.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView
  ///- iOS WKWebView ([Official API - WKUserContentController.addUserScript](https://developer.apple.com/documentation/webkit/wkusercontentcontroller/1537448-adduserscript)):
  ///    - This method will throw an error if the [CygnusPlatformWebViewCreationParams.windowId] has been set. There isn't any way to add/remove user scripts specific to window WebViews. This is a limitation of the native WebKit APIs.
  ///- Linux WPE WebKit ([Official API - webkit_user_content_manager_add_script](https://wpewebkit.org/reference/stable/wpe-webkit-2.0/method.UserContentManager.add_script.html))
  ///- macOS WKWebView ([Official API - WKUserContentController.addUserScript](https://developer.apple.com/documentation/webkit/wkusercontentcontroller/1537448-adduserscript)):
  ///    - This method will throw an error if the [CygnusPlatformWebViewCreationParams.windowId] has been set. There isn't any way to add/remove user scripts specific to window WebViews. This is a limitation of the native WebKit APIs.
  ///- Web \<iframe\> but requires same origin
  ///- Windows WebView2
  ///
  ///**Parameters - Officially Supported Platforms/Implementations**:
  ///- [userScript]: all platforms
  ///
  ///Use the [CygnusPlatformWebViewController.isMethodSupported] method to check if this method is supported at runtime.
  ///{@endtemplate}
  addUserScript,

  ///Can be used to check if the [CygnusPlatformWebViewController.addUserScripts] method is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusPlatformWebViewController.addUserScripts.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView
  ///- iOS WKWebView:
  ///    - This method will throw an error if the [CygnusPlatformWebViewCreationParams.windowId] has been set. There isn't any way to add/remove user scripts specific to window WebViews. This is a limitation of the native WebKit APIs.
  ///- Linux WPE WebKit
  ///- macOS WKWebView:
  ///    - This method will throw an error if the [CygnusPlatformWebViewCreationParams.windowId] has been set. There isn't any way to add/remove user scripts specific to window WebViews. This is a limitation of the native WebKit APIs.
  ///- Web \<iframe\> but requires same origin
  ///- Windows WebView2
  ///
  ///**Parameters - Officially Supported Platforms/Implementations**:
  ///- [userScripts]: all platforms
  ///
  ///Use the [CygnusPlatformWebViewController.isMethodSupported] method to check if this method is supported at runtime.
  ///{@endtemplate}
  addUserScripts,

  ///Can be used to check if the [CygnusPlatformWebViewController.addWebMessageListener] method is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusPlatformWebViewController.addWebMessageListener.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView ([Official API - WebViewCompat.CygnusWebMessageListener](https://developer.android.com/reference/androidx/webkit/WebViewCompat#addWebMessageListener(android.webkit.WebView,%20java.lang.String,%20java.util.Set%3Cjava.lang.String%3E,%20androidx.webkit.WebViewCompat.CygnusWebMessageListener))):
  ///    - This method should only be called if [CygnusWebViewFeature.isFeatureSupported] returns `true` for [CygnusWebViewFeature.WEB_MESSAGE_LISTENER].
  ///- iOS WKWebView:
  ///    - This method is implemented using JavaScript.
  ///- Linux WPE WebKit ([Official API - webkit_user_content_manager_add_script](https://webkitgtk.org/reference/webkit2gtk/stable/method.UserContentManager.add_script.html)):
  ///    - This method is implemented using JavaScript.
  ///- macOS WKWebView:
  ///    - This method is implemented using JavaScript.
  ///- Windows WebView2:
  ///    - This method is implemented using JavaScript.
  ///
  ///**Parameters - Officially Supported Platforms/Implementations**:
  ///- [webMessageListener]: all platforms
  ///
  ///Use the [CygnusPlatformWebViewController.isMethodSupported] method to check if this method is supported at runtime.
  ///{@endtemplate}
  addWebMessageListener,

  ///Can be used to check if the [CygnusPlatformWebViewController.callAsyncJavaScript] method is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusPlatformWebViewController.callAsyncJavaScript.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView 21+
  ///- iOS WKWebView 14.3+ ([Official API - WKWebView.callAsyncJavaScript](https://developer.apple.com/documentation/webkit/wkwebview/3656441-callasyncjavascript))
  ///- macOS WKWebView 11.0+ ([Official API - WKWebView.callAsyncJavaScript](https://developer.apple.com/documentation/webkit/wkwebview/3656441-callasyncjavascript))
  ///- Windows WebView2
  ///- Linux WPE WebKit 2.40+ ([Official API - webkit_web_view_call_async_javascript_function](https://webkitgtk.org/reference/webkit2gtk/stable/method.WebView.call_async_javascript_function.html)):
  ///    - Uses WPE WebKit call_async_javascript_function API which handles JavaScript Promises automatically.
  ///
  ///**Parameters - Officially Supported Platforms/Implementations**:
  ///- [functionBody]: all platforms
  ///- [arguments]: all platforms
  ///- [contentWorld]: all platforms
  ///
  ///Use the [CygnusPlatformWebViewController.isMethodSupported] method to check if this method is supported at runtime.
  ///{@endtemplate}
  callAsyncJavaScript,

  ///Can be used to check if the [CygnusPlatformWebViewController.callDevToolsProtocolMethod] method is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusPlatformWebViewController.callDevToolsProtocolMethod.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Windows WebView2 ([Official API - ICoreWebView2.CallDevToolsProtocolMethod](https://learn.microsoft.com/en-us/microsoft-edge/webview2/reference/win32/icorewebview2?view=webview2-1.0.2210.55#calldevtoolsprotocolmethod))
  ///
  ///**Parameters - Officially Supported Platforms/Implementations**:
  ///- [methodName]: all platforms
  ///- [parameters]: all platforms
  ///
  ///Use the [CygnusPlatformWebViewController.isMethodSupported] method to check if this method is supported at runtime.
  ///{@endtemplate}
  callDevToolsProtocolMethod,

  ///Can be used to check if the [CygnusPlatformWebViewController.canGoBack] method is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusPlatformWebViewController.canGoBack.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView ([Official API - WebView.canGoBack](https://developer.android.com/reference/android/webkit/WebView#canGoBack()))
  ///- iOS WKWebView ([Official API - WKWebView.canGoBack](https://developer.apple.com/documentation/webkit/wkwebview/1414966-cangoback))
  ///- macOS WKWebView ([Official API - WKWebView.canGoBack](https://developer.apple.com/documentation/webkit/wkwebview/1414966-cangoback))
  ///- Windows WebView2 ([Official API - ICoreWebView2.get_CanGoBack](https://learn.microsoft.com/en-us/microsoft-edge/webview2/reference/win32/icorewebview2?view=webview2-1.0.2210.55#get_cangoback))
  ///- Linux WPE WebKit ([Official API - webkit_web_view_can_go_back](https://wpewebkit.org/reference/stable/wpe-webkit-2.0/method.WebView.can_go_back.html))
  ///
  ///Use the [CygnusPlatformWebViewController.isMethodSupported] method to check if this method is supported at runtime.
  ///{@endtemplate}
  canGoBack,

  ///Can be used to check if the [CygnusPlatformWebViewController.canGoBackOrForward] method is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusPlatformWebViewController.canGoBackOrForward.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView ([Official API - WebView.canGoBackOrForward](https://developer.android.com/reference/android/webkit/WebView#canGoBackOrForward(int)))
  ///- iOS WKWebView
  ///- macOS WKWebView
  ///- Linux WPE WebKit
  ///- Windows WebView2
  ///
  ///**Parameters - Officially Supported Platforms/Implementations**:
  ///- [steps]: all platforms
  ///
  ///Use the [CygnusPlatformWebViewController.isMethodSupported] method to check if this method is supported at runtime.
  ///{@endtemplate}
  canGoBackOrForward,

  ///Can be used to check if the [CygnusPlatformWebViewController.canGoForward] method is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusPlatformWebViewController.canGoForward.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView ([Official API - WebView.canGoForward](https://developer.android.com/reference/android/webkit/WebView#canGoForward()))
  ///- iOS WKWebView ([Official API - WKWebView.canGoForward](https://developer.apple.com/documentation/webkit/wkwebview/1414962-cangoforward))
  ///- macOS WKWebView ([Official API - WKWebView.canGoForward](https://developer.apple.com/documentation/webkit/wkwebview/1414962-cangoforward))
  ///- Windows WebView2 ([Official API - ICoreWebView2.get_CanGoForward](https://learn.microsoft.com/en-us/microsoft-edge/webview2/reference/win32/icorewebview2?view=webview2-1.0.2210.55#get_cangoforward))
  ///- Linux WPE WebKit ([Official API - webkit_web_view_can_go_forward](https://wpewebkit.org/reference/stable/wpe-webkit-2.0/method.WebView.can_go_forward.html))
  ///
  ///Use the [CygnusPlatformWebViewController.isMethodSupported] method to check if this method is supported at runtime.
  ///{@endtemplate}
  canGoForward,

  ///Can be used to check if the [CygnusPlatformWebViewController.canScrollHorizontally] method is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusPlatformWebViewController.canScrollHorizontally.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView
  ///- iOS WKWebView
  ///- Linux WPE WebKit:
  ///    - This method is implemented using JavaScript.
  ///- macOS WKWebView:
  ///    - This method is implemented using JavaScript.
  ///- Web \<iframe\> but requires same origin
  ///
  ///Use the [CygnusPlatformWebViewController.isMethodSupported] method to check if this method is supported at runtime.
  ///{@endtemplate}
  canScrollHorizontally,

  ///Can be used to check if the [CygnusPlatformWebViewController.canScrollVertically] method is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusPlatformWebViewController.canScrollVertically.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView
  ///- iOS WKWebView
  ///- Linux WPE WebKit:
  ///    - This method is implemented using JavaScript.
  ///- macOS WKWebView:
  ///    - This method is implemented using JavaScript.
  ///- Web \<iframe\> but requires same origin
  ///
  ///Use the [CygnusPlatformWebViewController.isMethodSupported] method to check if this method is supported at runtime.
  ///{@endtemplate}
  canScrollVertically,

  ///Can be used to check if the [CygnusPlatformWebViewController.clearAllCache] method is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusPlatformWebViewController.clearAllCache.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView
  ///- iOS WKWebView
  ///- macOS WKWebView
  ///- Linux WPE WebKit
  ///
  ///**Parameters - Officially Supported Platforms/Implementations**:
  ///- [includeDiskFiles]: all platforms
  ///
  ///Use the [CygnusPlatformWebViewController.isMethodSupported] method to check if this method is supported at runtime.
  ///{@endtemplate}
  clearAllCache,

  ///Can be used to check if the [CygnusPlatformWebViewController.clearCache] method is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusPlatformWebViewController.clearCache.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView
  ///- iOS WKWebView
  ///- macOS WKWebView
  ///
  ///Use the [CygnusPlatformWebViewController.isMethodSupported] method to check if this method is supported at runtime.
  ///{@endtemplate}
  @Deprecated('Use CygnusWebViewController.clearAllCache instead')
  clearCache,

  ///Can be used to check if the [CygnusPlatformWebViewController.clearClientCertPreferences] method is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusPlatformWebViewController.clearClientCertPreferences.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView 21+ ([Official API - WebView.clearClientCertPreferences](https://developer.android.com/reference/android/webkit/WebView#clearClientCertPreferences(java.lang.Runnable)))
  ///
  ///Use the [CygnusPlatformWebViewController.isMethodSupported] method to check if this method is supported at runtime.
  ///{@endtemplate}
  clearClientCertPreferences,

  ///Can be used to check if the [CygnusPlatformWebViewController.clearFocus] method is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusPlatformWebViewController.clearFocus.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView ([Official API - ViewGroup.clearFocus](https://developer.android.com/reference/android/view/ViewGroup#clearFocus()))
  ///- iOS WKWebView ([Official API - UIResponder.resignFirstResponder](https://developer.apple.com/documentation/uikit/uiresponder/1621097-resignfirstresponder))
  ///- macOS WKWebView ([Official API - NSWindow.makeFirstResponder](https://developer.apple.com/documentation/appkit/nswindow/1419366-makefirstresponder))
  ///- Linux WPE WebKit ([Official API - wpe_view_backend_remove_activity_state](https://wpewebkit.org/reference/stable/wpe-platform-2.0/func.view_backend_remove_activity_state.html)):
  ///    - Removes focused state from WPE backend and blurs active element via JavaScript
  ///
  ///Use the [CygnusPlatformWebViewController.isMethodSupported] method to check if this method is supported at runtime.
  ///{@endtemplate}
  clearFocus,

  ///Can be used to check if the [CygnusPlatformWebViewController.clearFormData] method is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusPlatformWebViewController.clearFormData.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView ([Official API - WebView.clearFormData](https://developer.android.com/reference/android/webkit/WebView#clearFormData()))
  ///
  ///Use the [CygnusPlatformWebViewController.isMethodSupported] method to check if this method is supported at runtime.
  ///{@endtemplate}
  clearFormData,

  ///Can be used to check if the [CygnusPlatformWebViewController.clearHistory] method is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusPlatformWebViewController.clearHistory.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView ([Official API - WebView.clearHistory](https://developer.android.com/reference/android/webkit/WebView#clearHistory()))
  ///
  ///Use the [CygnusPlatformWebViewController.isMethodSupported] method to check if this method is supported at runtime.
  ///{@endtemplate}
  clearHistory,

  ///Can be used to check if the [CygnusPlatformWebViewController.clearMatches] method is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusPlatformWebViewController.clearMatches.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView
  ///- iOS WKWebView
  ///- macOS WKWebView
  ///
  ///Use the [CygnusPlatformWebViewController.isMethodSupported] method to check if this method is supported at runtime.
  ///{@endtemplate}
  @Deprecated('Use CygnusFindInteractionController.clearMatches instead')
  clearMatches,

  ///Can be used to check if the [CygnusPlatformWebViewController.clearSslPreferences] method is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusPlatformWebViewController.clearSslPreferences.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView ([Official API - WebView.clearSslPreferences](https://developer.android.com/reference/android/webkit/WebView#clearSslPreferences()))
  ///- Windows WebView2 ([Official API - ICoreWebView2_3.ClearServerCertificateErrorActions](https://learn.microsoft.com/en-us/microsoft-edge/webview2/reference/win32/icorewebview2_14?view=webview2-1.0.2792.45#clearservercertificateerroractions))
  ///
  ///Use the [CygnusPlatformWebViewController.isMethodSupported] method to check if this method is supported at runtime.
  ///{@endtemplate}
  clearSslPreferences,

  ///Can be used to check if the [CygnusPlatformWebViewController.closeAllMediaPresentations] method is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusPlatformWebViewController.closeAllMediaPresentations.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- iOS WKWebView 14.5+ ([Official API - WKWebView.closeAllMediaPresentations](https://developer.apple.com/documentation/webkit/wkwebview/3752235-closeallmediapresentations))
  ///- macOS WKWebView 11.3+ ([Official API - WKWebView.closeAllMediaPresentations](https://developer.apple.com/documentation/webkit/wkwebview/3752235-closeallmediapresentations))
  ///- Linux WPE WebKit ([Official API - JavaScript Document.exitFullscreen()/exitPictureInPicture()](https://developer.mozilla.org/en-US/docs/Web/API/Document/exitFullscreen)):
  ///    - Uses JavaScript to exit fullscreen and picture-in-picture modes
  ///
  ///Use the [CygnusPlatformWebViewController.isMethodSupported] method to check if this method is supported at runtime.
  ///{@endtemplate}
  closeAllMediaPresentations,

  ///Can be used to check if the [CygnusPlatformWebViewController.createPdf] method is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusPlatformWebViewController.createPdf.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- iOS WKWebView 14.0+ ([Official API - WKWebView.createPdf](https://developer.apple.com/documentation/webkit/wkwebview/3650490-createpdf))
  ///- macOS WKWebView 11.0+ ([Official API - WKWebView.createPdf](https://developer.apple.com/documentation/webkit/wkwebview/3650490-createpdf))
  ///- Windows WebView2 ([Official API - ICoreWebView2_16.PrintToPdfStream](https://learn.microsoft.com/en-us/microsoft-edge/webview2/reference/win32/icorewebview2_16#printtopdfstream))
  ///
  ///**Parameters - Officially Supported Platforms/Implementations**:
  ///- [pdfConfiguration]: all platforms
  ///
  ///Use the [CygnusPlatformWebViewController.isMethodSupported] method to check if this method is supported at runtime.
  ///{@endtemplate}
  createPdf,

  ///Can be used to check if the [CygnusPlatformWebViewController.createWebArchiveData] method is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusPlatformWebViewController.createWebArchiveData.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- iOS WKWebView 14.0+ ([Official API - WKWebView.createWebArchiveData](https://developer.apple.com/documentation/webkit/wkwebview/3650491-createwebarchivedata))
  ///- macOS WKWebView 11.0+ ([Official API - WKWebView.createWebArchiveData](https://developer.apple.com/documentation/webkit/wkwebview/3650491-createwebarchivedata))
  ///
  ///Use the [CygnusPlatformWebViewController.isMethodSupported] method to check if this method is supported at runtime.
  ///{@endtemplate}
  createWebArchiveData,

  ///Can be used to check if the [CygnusPlatformWebViewController.createWebMessageChannel] method is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusPlatformWebViewController.createWebMessageChannel.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView ([Official API - WebViewCompat.createWebMessageChannel](https://developer.android.com/reference/androidx/webkit/WebViewCompat#createWebMessageChannel(android.webkit.WebView))):
  ///    - This method should only be called if [CygnusWebViewFeature.isFeatureSupported] returns `true` for [CygnusWebViewFeature.CREATE_WEB_MESSAGE_CHANNEL].
  ///- iOS WKWebView:
  ///    - This method is implemented using JavaScript.
  ///- macOS WKWebView:
  ///    - This method is implemented using JavaScript.
  ///- Linux WPE WebKit:
  ///    - Implemented via JavaScript MessageChannel API.
  ///- Windows WebView2:
  ///    - Implemented via JavaScript MessageChannel API.
  ///
  ///Use the [CygnusPlatformWebViewController.isMethodSupported] method to check if this method is supported at runtime.
  ///{@endtemplate}
  createWebMessageChannel,

  ///Can be used to check if the [CygnusPlatformWebViewController.disableWebView] method is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusPlatformWebViewController.disableWebView.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView 28+ ([Official API - WebView.disableWebView](https://developer.android.com/reference/android/webkit/WebView#disableWebView()))
  ///
  ///Use the [CygnusPlatformWebViewController.isMethodSupported] method to check if this method is supported at runtime.
  ///{@endtemplate}
  disableWebView,

  ///Can be used to check if the [CygnusPlatformWebViewController.dispose] method is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusPlatformWebViewController.dispose.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView
  ///- iOS WKWebView
  ///- macOS WKWebView
  ///- Web \<iframe\> but requires same origin
  ///- Windows WebView2
  ///
  ///**Parameters - Officially Supported Platforms/Implementations**:
  ///- [isKeepAlive]: all platforms
  ///
  ///Use the [CygnusPlatformWebViewController.isMethodSupported] method to check if this method is supported at runtime.
  ///{@endtemplate}
  dispose,

  ///Can be used to check if the [CygnusPlatformWebViewController.disposeKeepAlive] method is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusPlatformWebViewController.disposeKeepAlive.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView
  ///- iOS WKWebView
  ///- macOS WKWebView
  ///- Windows WebView2
  ///- Linux WPE WebKit
  ///
  ///**Parameters - Officially Supported Platforms/Implementations**:
  ///- [keepAlive]: all platforms
  ///
  ///Use the [CygnusPlatformWebViewController.isMethodSupported] method to check if this method is supported at runtime.
  ///{@endtemplate}
  disposeKeepAlive,

  ///Can be used to check if the [CygnusPlatformWebViewController.enableSlowWholeDocumentDraw] method is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusPlatformWebViewController.enableSlowWholeDocumentDraw.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView 21+ ([Official API - WebView.enableSlowWholeDocumentDraw](https://developer.android.com/reference/android/webkit/WebView#enableSlowWholeDocumentDraw())):
  ///    - This method should be called before any WebViews are created.
  ///
  ///Use the [CygnusPlatformWebViewController.isMethodSupported] method to check if this method is supported at runtime.
  ///{@endtemplate}
  enableSlowWholeDocumentDraw,

  ///Can be used to check if the [CygnusPlatformWebViewController.evaluateJavascript] method is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusPlatformWebViewController.evaluateJavascript.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView ([Official API - WebView.evaluateJavascript](https://developer.android.com/reference/android/webkit/WebView#evaluateJavascript(java.lang.String,%20android.webkit.ValueCallback%3Cjava.lang.String%3E)))
  ///- iOS WKWebView ([Official API - WKWebView.evaluateJavaScript](https://developer.apple.com/documentation/webkit/wkwebview/3656442-evaluatejavascript))
  ///- macOS WKWebView ([Official API - WKWebView.evaluateJavaScript](https://developer.apple.com/documentation/webkit/wkwebview/3656442-evaluatejavascript))
  ///- Web \<iframe\> but requires same origin ([Official API - Window.eval](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/eval))
  ///- Windows WebView2
  ///- Linux WPE WebKit ([Official API - webkit_web_view_evaluate_javascript](https://wpewebkit.org/reference/stable/wpe-webkit-2.0/method.WebView.evaluate_javascript.html))
  ///
  ///**Parameters - Officially Supported Platforms/Implementations**:
  ///- [source]: all platforms
  ///- [contentWorld]:
  ///    - Android WebView
  ///    - iOS WKWebView 14.0+
  ///    - macOS WKWebView 11.0+
  ///    - Windows WebView2
  ///
  ///Use the [CygnusPlatformWebViewController.isMethodSupported] method to check if this method is supported at runtime.
  ///{@endtemplate}
  evaluateJavascript,

  ///Can be used to check if the [CygnusPlatformWebViewController.findAllAsync] method is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusPlatformWebViewController.findAllAsync.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView
  ///- iOS WKWebView
  ///- macOS WKWebView
  ///
  ///**Parameters - Officially Supported Platforms/Implementations**:
  ///- [find]: all platforms
  ///
  ///Use the [CygnusPlatformWebViewController.isMethodSupported] method to check if this method is supported at runtime.
  ///{@endtemplate}
  @Deprecated('Use CygnusFindInteractionController.findAll instead')
  findAllAsync,

  ///Can be used to check if the [CygnusPlatformWebViewController.findNext] method is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusPlatformWebViewController.findNext.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView
  ///- iOS WKWebView
  ///- macOS WKWebView
  ///
  ///**Parameters - Officially Supported Platforms/Implementations**:
  ///- [forward]: all platforms
  ///
  ///Use the [CygnusPlatformWebViewController.isMethodSupported] method to check if this method is supported at runtime.
  ///{@endtemplate}
  @Deprecated('Use CygnusFindInteractionController.findNext instead')
  findNext,

  ///Can be used to check if the [CygnusPlatformWebViewController.getCameraCaptureState] method is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusPlatformWebViewController.getCameraCaptureState.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- iOS WKWebView 15.0+ ([Official API - WKWebView.cameraCaptureState](https://developer.apple.com/documentation/webkit/wkwebview/3763093-cameracapturestate))
  ///- Linux WPE WebKit 2.34+ ([Official API - webkit_web_view_get_camera_capture_state](https://wpewebkit.org/reference/stable/wpe-webkit-2.0/method.WebView.get_camera_capture_state.html))
  ///- macOS WKWebView 12.0+ ([Official API - WKWebView.cameraCaptureState](https://developer.apple.com/documentation/webkit/wkwebview/3763093-cameracapturestate))
  ///
  ///Use the [CygnusPlatformWebViewController.isMethodSupported] method to check if this method is supported at runtime.
  ///{@endtemplate}
  getCameraCaptureState,

  ///Can be used to check if the [CygnusPlatformWebViewController.getCertificate] method is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusPlatformWebViewController.getCertificate.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView ([Official API - WebView.getCertificate](https://developer.android.com/reference/android/webkit/WebView#getCertificate()))
  ///- iOS WKWebView
  ///- macOS WKWebView
  ///- Windows WebView2
  ///- Linux WPE WebKit ([Official API - webkit_web_view_get_tls_info](https://wpewebkit.org/reference/stable/wpe-webkit-2.0/method.WebView.get_tls_info.html))
  ///
  ///Use the [CygnusPlatformWebViewController.isMethodSupported] method to check if this method is supported at runtime.
  ///{@endtemplate}
  getCertificate,

  ///Can be used to check if the [CygnusPlatformWebViewController.getContentHeight] method is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusPlatformWebViewController.getContentHeight.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView ([Official API - WebView.getContentHeight](https://developer.android.com/reference/android/webkit/WebView#getContentHeight()))
  ///- iOS WKWebView ([Official API - UIScrollView.contentSize](https://developer.apple.com/documentation/uikit/uiscrollview/1619399-contentsize))
  ///- macOS WKWebView:
  ///    - This method is implemented using JavaScript.
  ///- Web \<iframe\> but requires same origin ([Official API - Document.documentElement.scrollHeight](https://developer.mozilla.org/en-US/docs/Web/API/Element/scrollHeight))
  ///- Linux WPE WebKit
  ///- Windows WebView2:
  ///    - This method is implemented using JavaScript.
  ///
  ///Use the [CygnusPlatformWebViewController.isMethodSupported] method to check if this method is supported at runtime.
  ///{@endtemplate}
  getContentHeight,

  ///Can be used to check if the [CygnusPlatformWebViewController.getContentWidth] method is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusPlatformWebViewController.getContentWidth.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView:
  ///    - This method is implemented using JavaScript.
  ///- iOS WKWebView ([Official API - UIScrollView.contentSize](https://developer.apple.com/documentation/uikit/uiscrollview/1619399-contentsize))
  ///- macOS WKWebView:
  ///    - This method is implemented using JavaScript.
  ///- Web \<iframe\> but requires same origin ([Official API - Document.documentElement.scrollWidth](https://developer.mozilla.org/en-US/docs/Web/API/Element/scrollWidth))
  ///- Linux WPE WebKit
  ///- Windows WebView2:
  ///    - This method is implemented using JavaScript.
  ///
  ///Use the [CygnusPlatformWebViewController.isMethodSupported] method to check if this method is supported at runtime.
  ///{@endtemplate}
  getContentWidth,

  ///Can be used to check if the [CygnusPlatformWebViewController.getCopyBackForwardList] method is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusPlatformWebViewController.getCopyBackForwardList.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView ([Official API - WebView.copyBackForwardList](https://developer.android.com/reference/android/webkit/WebView#copyBackForwardList()))
  ///- iOS WKWebView ([Official API - WKWebView.backForwardList](https://developer.apple.com/documentation/webkit/wkwebview/1414977-backforwardlist))
  ///- macOS WKWebView ([Official API - WKWebView.backForwardList](https://developer.apple.com/documentation/webkit/wkwebview/1414977-backforwardlist))
  ///- Windows WebView2
  ///- Linux WPE WebKit
  ///
  ///Use the [CygnusPlatformWebViewController.isMethodSupported] method to check if this method is supported at runtime.
  ///{@endtemplate}
  getCopyBackForwardList,

  ///Can be used to check if the [CygnusPlatformWebViewController.getCurrentWebViewPackage] method is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusPlatformWebViewController.getCurrentWebViewPackage.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView 21+ ([Official API - WebViewCompat.getCurrentWebViewPackage](https://developer.android.com/reference/androidx/webkit/WebViewCompat#getCurrentWebViewPackage(android.content.Context)))
  ///
  ///Use the [CygnusPlatformWebViewController.isMethodSupported] method to check if this method is supported at runtime.
  ///{@endtemplate}
  getCurrentWebViewPackage,

  ///Can be used to check if the [CygnusPlatformWebViewController.getDefaultUserAgent] method is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusPlatformWebViewController.getDefaultUserAgent.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView ([Official API - WebSettings.getDefaultUserAgent](https://developer.android.com/reference/android/webkit/WebSettings#getDefaultUserAgent(android.content.Context)))
  ///- iOS WKWebView
  ///- macOS WKWebView
  ///- Web \<iframe\> but requires same origin ([Official API - Navigator.userAgent](https://developer.mozilla.org/en-US/docs/Web/API/Navigator/userAgent))
  ///
  ///Use the [CygnusPlatformWebViewController.isMethodSupported] method to check if this method is supported at runtime.
  ///{@endtemplate}
  getDefaultUserAgent,

  ///Can be used to check if the [CygnusPlatformWebViewController.getFavicon] method is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusPlatformWebViewController.getFavicon.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Windows WebView2 ([Official API - ICoreWebView2_15.GetFavicon](https://learn.microsoft.com/en-us/microsoft-edge/webview2/reference/win32/icorewebview2_15?view=webview2-1.0.2849.39#getfavicon))
  ///
  ///**Parameters - Officially Supported Platforms/Implementations**:
  ///- [url]: all platforms
  ///- [faviconImageFormat]: all platforms
  ///
  ///Use the [CygnusPlatformWebViewController.isMethodSupported] method to check if this method is supported at runtime.
  ///{@endtemplate}
  getFavicon,

  ///Can be used to check if the [CygnusPlatformWebViewController.getFavicons] method is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusPlatformWebViewController.getFavicons.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView
  ///- iOS WKWebView
  ///- macOS WKWebView
  ///- Web \<iframe\> but requires same origin
  ///- Windows WebView2
  ///- Linux WPE WebKit
  ///
  ///Use the [CygnusPlatformWebViewController.isMethodSupported] method to check if this method is supported at runtime.
  ///{@endtemplate}
  getFavicons,

  ///Can be used to check if the [CygnusPlatformWebViewController.getFrameId] method is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusPlatformWebViewController.getFrameId.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Windows WebView2 ([Official API - ICoreWebView2_20.get_FrameId](https://learn.microsoft.com/en-us/microsoft-edge/webview2/reference/win32/icorewebview2_20?view=webview2-1.0.2849.39#get_frameid))
  ///
  ///Use the [CygnusPlatformWebViewController.isMethodSupported] method to check if this method is supported at runtime.
  ///{@endtemplate}
  getFrameId,

  ///Can be used to check if the [CygnusPlatformWebViewController.getHitTestResult] method is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusPlatformWebViewController.getHitTestResult.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView ([Official API - WebView.getHitTestResult](https://developer.android.com/reference/android/webkit/WebView#getHitTestResult()))
  ///- iOS WKWebView:
  ///    - This method is implemented using JavaScript.
  ///- Linux WPE WebKit ([Official API - WebKitHitTestResult](https://webkitgtk.org/reference/webkit2gtk/stable/WebKitHitTestResult.html)):
  ///    - This method uses native WebKitHitTestResult from the mouse-target-changed signal.
  ///
  ///Use the [CygnusPlatformWebViewController.isMethodSupported] method to check if this method is supported at runtime.
  ///{@endtemplate}
  getHitTestResult,

  ///Can be used to check if the [CygnusPlatformWebViewController.getHtml] method is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusPlatformWebViewController.getHtml.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView
  ///- iOS WKWebView
  ///- Linux WPE WebKit:
  ///    - This method is implemented using JavaScript.
  ///- macOS WKWebView
  ///- Web \<iframe\> but requires same origin
  ///- Windows WebView2
  ///
  ///Use the [CygnusPlatformWebViewController.isMethodSupported] method to check if this method is supported at runtime.
  ///{@endtemplate}
  getHtml,

  ///Can be used to check if the [CygnusPlatformWebViewController.getIFrameId] method is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusPlatformWebViewController.getIFrameId.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Web \<iframe\> but requires same origin
  ///
  ///Use the [CygnusPlatformWebViewController.isMethodSupported] method to check if this method is supported at runtime.
  ///{@endtemplate}
  getIFrameId,

  ///Can be used to check if the [CygnusPlatformWebViewController.getJavaScriptBridgeName] method is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusPlatformWebViewController.getJavaScriptBridgeName.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView
  ///- iOS WKWebView
  ///- macOS WKWebView
  ///- Web \<iframe\> but requires same origin
  ///- Windows WebView2
  ///- Linux WPE WebKit
  ///
  ///Use the [CygnusPlatformWebViewController.isMethodSupported] method to check if this method is supported at runtime.
  ///{@endtemplate}
  getJavaScriptBridgeName,

  ///Can be used to check if the [CygnusPlatformWebViewController.getMemoryUsageTargetLevel] method is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusPlatformWebViewController.getMemoryUsageTargetLevel.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Windows WebView2 ([Official API - ICoreWebView2_19.get_MemoryUsageTargetLevel](https://learn.microsoft.com/en-us/microsoft-edge/webview2/reference/win32/icorewebview2_19?view=webview2-1.0.2849.39#get_memoryusagetargetlevel))
  ///
  ///Use the [CygnusPlatformWebViewController.isMethodSupported] method to check if this method is supported at runtime.
  ///{@endtemplate}
  getMemoryUsageTargetLevel,

  ///Can be used to check if the [CygnusPlatformWebViewController.getMetaTags] method is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusPlatformWebViewController.getMetaTags.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView:
  ///    - This method is implemented using JavaScript.
  ///- iOS WKWebView:
  ///    - This method is implemented using JavaScript.
  ///- Linux WPE WebKit:
  ///    - This method is implemented using JavaScript.
  ///- macOS WKWebView:
  ///    - This method is implemented using JavaScript.
  ///- Web \<iframe\> but requires same origin:
  ///    - This method is implemented using JavaScript.
  ///- Windows WebView2:
  ///    - This method is implemented using JavaScript.
  ///
  ///Use the [CygnusPlatformWebViewController.isMethodSupported] method to check if this method is supported at runtime.
  ///{@endtemplate}
  getMetaTags,

  ///Can be used to check if the [CygnusPlatformWebViewController.getMetaThemeColor] method is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusPlatformWebViewController.getMetaThemeColor.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView:
  ///    - This method is implemented using JavaScript.
  ///- iOS WKWebView ([Official API - WKWebView.themeColor](https://developer.apple.com/documentation/webkit/wkwebview/3794258-themecolor)):
  ///    - On iOS < 15.0, this method is implemented using JavaScript.
  ///- Linux WPE WebKit ([Official API - webkit_web_view_get_theme_color](https://wpewebkit.org/reference/stable/wpe-webkit-2.0/method.WebView.get_theme_color.html))
  ///- macOS WKWebView ([Official API - WKWebView.themeColor](https://developer.apple.com/documentation/webkit/wkwebview/3794258-themecolor)):
  ///    - On iOS < 12.0, this method is implemented using JavaScript.
  ///- Web \<iframe\> but requires same origin:
  ///    - This method is implemented using JavaScript.
  ///- Windows WebView2:
  ///    - This method is implemented using JavaScript.
  ///
  ///Use the [CygnusPlatformWebViewController.isMethodSupported] method to check if this method is supported at runtime.
  ///{@endtemplate}
  getMetaThemeColor,

  ///Can be used to check if the [CygnusPlatformWebViewController.getMicrophoneCaptureState] method is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusPlatformWebViewController.getMicrophoneCaptureState.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- iOS WKWebView 15.0+ ([Official API - WKWebView.microphoneCaptureState](https://developer.apple.com/documentation/webkit/wkwebview/3763096-microphonecapturestate))
  ///- Linux WPE WebKit 2.34+ ([Official API - webkit_web_view_get_microphone_capture_state](https://wpewebkit.org/reference/stable/wpe-webkit-2.0/method.WebView.get_microphone_capture_state.html))
  ///- macOS WKWebView 12.0+ ([Official API - WKWebView.microphoneCaptureState](https://developer.apple.com/documentation/webkit/wkwebview/3763096-microphonecapturestate))
  ///
  ///Use the [CygnusPlatformWebViewController.isMethodSupported] method to check if this method is supported at runtime.
  ///{@endtemplate}
  getMicrophoneCaptureState,

  ///Can be used to check if the [CygnusPlatformWebViewController.getOptions] method is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusPlatformWebViewController.getOptions.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView
  ///- iOS WKWebView
  ///- macOS WKWebView
  ///- Web \<iframe\> but requires same origin
  ///- Windows WebView2
  ///
  ///Use the [CygnusPlatformWebViewController.isMethodSupported] method to check if this method is supported at runtime.
  ///{@endtemplate}
  @Deprecated('Use getSettings instead')
  getOptions,

  ///Can be used to check if the [CygnusPlatformWebViewController.getOriginalUrl] method is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusPlatformWebViewController.getOriginalUrl.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView ([Official API - WebView.getOriginalUrl](https://developer.android.com/reference/android/webkit/WebView#getOriginalUrl()))
  ///- iOS WKWebView
  ///- Linux WPE WebKit ([Official API - webkit_web_view_get_uri](https://wpewebkit.org/reference/stable/wpe-webkit-2.0/method.WebView.get_uri.html)):
  ///    - Returns the current URL. WPE WebKit does not distinguish between original and current URL.
  ///- macOS WKWebView
  ///- Web \<iframe\> but requires same origin:
  ///    - It will return the current value of the `iframe.src` attribute.
  ///- Windows WebView2:
  ///    - Returns the current URL. WebView2 does not distinguish between original and current URL.
  ///
  ///Use the [CygnusPlatformWebViewController.isMethodSupported] method to check if this method is supported at runtime.
  ///{@endtemplate}
  getOriginalUrl,

  ///Can be used to check if the [CygnusPlatformWebViewController.getProgress] method is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusPlatformWebViewController.getProgress.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView ([Official API - WebView.getProgress](https://developer.android.com/reference/android/webkit/WebView#getProgress()))
  ///- iOS WKWebView ([Official API - WKWebView.estimatedProgress](https://developer.apple.com/documentation/webkit/wkwebview/1415007-estimatedprogress))
  ///- macOS WKWebView ([Official API - WKWebView.estimatedProgress](https://developer.apple.com/documentation/webkit/wkwebview/1415007-estimatedprogress))
  ///- Linux WPE WebKit ([Official API - webkit_web_view_get_estimated_load_progress](https://wpewebkit.org/reference/stable/wpe-webkit-2.0/method.WebView.get_estimated_load_progress.html))
  ///- Windows WebView2:
  ///    - Progress is tracked through navigation events: NavigationStarting (0), ContentLoading (33), DOMContentLoaded (66), NavigationCompleted (100).
  ///
  ///Use the [CygnusPlatformWebViewController.isMethodSupported] method to check if this method is supported at runtime.
  ///{@endtemplate}
  getProgress,

  ///Can be used to check if the [CygnusPlatformWebViewController.getSafeBrowsingPrivacyPolicyUrl] method is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusPlatformWebViewController.getSafeBrowsingPrivacyPolicyUrl.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView ([Official API - WebViewCompat.getSafeBrowsingPrivacyPolicyUrl](https://developer.android.com/reference/androidx/webkit/WebViewCompat#getSafeBrowsingPrivacyPolicyUrl())):
  ///    - This method should only be called if [CygnusWebViewFeature.isFeatureSupported] returns `true` for [CygnusWebViewFeature.SAFE_BROWSING_PRIVACY_POLICY_URL].
  ///
  ///Use the [CygnusPlatformWebViewController.isMethodSupported] method to check if this method is supported at runtime.
  ///{@endtemplate}
  getSafeBrowsingPrivacyPolicyUrl,

  ///Can be used to check if the [CygnusPlatformWebViewController.getScale] method is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusPlatformWebViewController.getScale.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView
  ///- iOS WKWebView
  ///- macOS WKWebView
  ///
  ///Use the [CygnusPlatformWebViewController.isMethodSupported] method to check if this method is supported at runtime.
  ///{@endtemplate}
  @Deprecated('Use getZoomScale instead')
  getScale,

  ///Can be used to check if the [CygnusPlatformWebViewController.getScreenScale] method is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusPlatformWebViewController.getScreenScale.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Linux WPE WebKit ([Official API - wpe_screen_get_scale](https://wpewebkit.org/reference/stable/wpe-platform-1.0/method.Screen.get_scale.html))
  ///
  ///Use the [CygnusPlatformWebViewController.isMethodSupported] method to check if this method is supported at runtime.
  ///{@endtemplate}
  getScreenScale,

  ///Can be used to check if the [CygnusPlatformWebViewController.getScrollX] method is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusPlatformWebViewController.getScrollX.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView ([Official API - View.getScrollX](https://developer.android.com/reference/android/view/View#getScrollX()))
  ///- iOS WKWebView ([Official API - UIScrollView.contentOffset](https://developer.apple.com/documentation/uikit/uiscrollview/1619404-contentoffset))
  ///- macOS WKWebView:
  ///    - This method is implemented using JavaScript.
  ///- Linux WPE WebKit
  ///- Web \<iframe\> but requires same origin ([Official API - Window.scrollX](https://developer.mozilla.org/en-US/docs/Web/API/Window/scrollX))
  ///- Windows WebView2:
  ///    - This method is implemented using JavaScript.
  ///
  ///Use the [CygnusPlatformWebViewController.isMethodSupported] method to check if this method is supported at runtime.
  ///{@endtemplate}
  getScrollX,

  ///Can be used to check if the [CygnusPlatformWebViewController.getScrollY] method is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusPlatformWebViewController.getScrollY.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView ([Official API - View.getScrollY](https://developer.android.com/reference/android/view/View#getScrollY()))
  ///- iOS WKWebView ([Official API - UIScrollView.contentOffset](https://developer.apple.com/documentation/uikit/uiscrollview/1619404-contentoffset))
  ///- macOS WKWebView:
  ///    - This method is implemented using JavaScript.
  ///- Linux WPE WebKit
  ///- Web \<iframe\> but requires same origin ([Official API - Window.scrollY](https://developer.mozilla.org/en-US/docs/Web/API/Window/scrollY))
  ///- Windows WebView2:
  ///    - This method is implemented using JavaScript.
  ///
  ///Use the [CygnusPlatformWebViewController.isMethodSupported] method to check if this method is supported at runtime.
  ///{@endtemplate}
  getScrollY,

  ///Can be used to check if the [CygnusPlatformWebViewController.getSelectedText] method is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusPlatformWebViewController.getSelectedText.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView:
  ///    - This method is implemented using JavaScript.
  ///- iOS WKWebView:
  ///    - This method is implemented using JavaScript.
  ///- Linux WPE WebKit:
  ///    - This method is implemented using JavaScript.
  ///- macOS WKWebView:
  ///    - This method is implemented using JavaScript.
  ///- Web \<iframe\> but requires same origin:
  ///    - This method is implemented using JavaScript.
  ///
  ///Use the [CygnusPlatformWebViewController.isMethodSupported] method to check if this method is supported at runtime.
  ///{@endtemplate}
  getSelectedText,

  ///Can be used to check if the [CygnusPlatformWebViewController.getSettings] method is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusPlatformWebViewController.getSettings.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView
  ///- iOS WKWebView
  ///- Linux WPE WebKit
  ///- macOS WKWebView
  ///- Web \<iframe\> but requires same origin
  ///- Windows WebView2
  ///
  ///Use the [CygnusPlatformWebViewController.isMethodSupported] method to check if this method is supported at runtime.
  ///{@endtemplate}
  getSettings,

  ///Can be used to check if the [CygnusPlatformWebViewController.getTRexRunnerCss] method is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusPlatformWebViewController.getTRexRunnerCss.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView
  ///- iOS WKWebView
  ///- macOS WKWebView
  ///- Web \<iframe\> but requires same origin
  ///- Windows WebView2
  ///
  ///Use the [CygnusPlatformWebViewController.isMethodSupported] method to check if this method is supported at runtime.
  ///{@endtemplate}
  @Deprecated('Use tRexRunnerCss instead')
  getTRexRunnerCss,

  ///Can be used to check if the [CygnusPlatformWebViewController.getTRexRunnerHtml] method is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusPlatformWebViewController.getTRexRunnerHtml.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView
  ///- iOS WKWebView
  ///- macOS WKWebView
  ///- Web \<iframe\> but requires same origin
  ///- Windows WebView2
  ///
  ///Use the [CygnusPlatformWebViewController.isMethodSupported] method to check if this method is supported at runtime.
  ///{@endtemplate}
  @Deprecated('Use tRexRunnerHtml instead')
  getTRexRunnerHtml,

  ///Can be used to check if the [CygnusPlatformWebViewController.getTargetRefreshRate] method is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusPlatformWebViewController.getTargetRefreshRate.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Linux WPE WebKit
  ///
  ///Use the [CygnusPlatformWebViewController.isMethodSupported] method to check if this method is supported at runtime.
  ///{@endtemplate}
  getTargetRefreshRate,

  ///Can be used to check if the [CygnusPlatformWebViewController.getTitle] method is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusPlatformWebViewController.getTitle.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView ([Official API - WebView.getTitle](https://developer.android.com/reference/android/webkit/WebView#getTitle()))
  ///- iOS WKWebView ([Official API - WKWebView.title](https://developer.apple.com/documentation/webkit/wkwebview/1415015-title))
  ///- macOS WKWebView ([Official API - WKWebView.title](https://developer.apple.com/documentation/webkit/wkwebview/1415015-title))
  ///- Web \<iframe\> but requires same origin
  ///- Windows WebView2 ([Official API - ICoreWebView2.get_DocumentTitle](https://learn.microsoft.com/en-us/microsoft-edge/webview2/reference/win32/icorewebview2?view=webview2-1.0.2210.55#get_documenttitle))
  ///- Linux WPE WebKit ([Official API - webkit_web_view_get_title](https://wpewebkit.org/reference/stable/wpe-webkit-2.0/method.WebView.get_title.html))
  ///
  ///Use the [CygnusPlatformWebViewController.isMethodSupported] method to check if this method is supported at runtime.
  ///{@endtemplate}
  getTitle,

  ///Can be used to check if the [CygnusPlatformWebViewController.getUrl] method is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusPlatformWebViewController.getUrl.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView ([Official API - WebView.getUrl](https://developer.android.com/reference/android/webkit/WebView#getUrl()))
  ///- iOS WKWebView ([Official API - WKWebView.url](https://developer.apple.com/documentation/webkit/wkwebview/1415005-url))
  ///- macOS WKWebView ([Official API - WKWebView.url](https://developer.apple.com/documentation/webkit/wkwebview/1415005-url))
  ///- Web \<iframe\> but requires same origin:
  ///    - If `window.location.href` isn't accessible inside the iframe, it will return the current value of the `iframe.src` attribute.
  ///- Windows WebView2 ([Official API - ICoreWebView2.get_Source](https://learn.microsoft.com/en-us/microsoft-edge/webview2/reference/win32/icorewebview2?view=webview2-1.0.2210.55#get_source))
  ///- Linux WPE WebKit ([Official API - webkit_web_view_get_uri](https://wpewebkit.org/reference/stable/wpe-webkit-2.0/method.WebView.get_uri.html))
  ///
  ///Use the [CygnusPlatformWebViewController.isMethodSupported] method to check if this method is supported at runtime.
  ///{@endtemplate}
  getUrl,

  ///Can be used to check if the [CygnusPlatformWebViewController.getVariationsHeader] method is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusPlatformWebViewController.getVariationsHeader.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView ([Official API - WebViewCompat.getVariationsHeader](https://developer.android.com/reference/androidx/webkit/WebViewCompat#getVariationsHeader())):
  ///    - This method should only be called if [CygnusWebViewFeature.isFeatureSupported] returns `true` for [CygnusWebViewFeature.GET_VARIATIONS_HEADER].
  ///
  ///Use the [CygnusPlatformWebViewController.isMethodSupported] method to check if this method is supported at runtime.
  ///{@endtemplate}
  getVariationsHeader,

  ///Can be used to check if the [CygnusPlatformWebViewController.getViewId] method is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusPlatformWebViewController.getViewId.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView
  ///- iOS WKWebView
  ///- macOS WKWebView
  ///- Web \<iframe\> but requires same origin
  ///- Windows WebView2
  ///
  ///Use the [CygnusPlatformWebViewController.isMethodSupported] method to check if this method is supported at runtime.
  ///{@endtemplate}
  getViewId,

  ///Can be used to check if the [CygnusPlatformWebViewController.getZoomScale] method is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusPlatformWebViewController.getZoomScale.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView
  ///- iOS WKWebView ([Official API - UIScrollView.zoomScale](https://developer.apple.com/documentation/uikit/uiscrollview/1619419-zoomscale))
  ///- Linux WPE WebKit ([Official API - webkit_web_view_get_zoom_level](https://wpewebkit.org/reference/stable/wpe-webkit-2.0/method.WebView.get_zoom_level.html))
  ///- Windows WebView2 ([Official API - ICoreWebView2Controller.get_ZoomFactor](https://learn.microsoft.com/en-us/microsoft-edge/webview2/reference/win32/icorewebview2controller?view=webview2-1.0.2849.39#get_zoomfactor))
  ///
  ///Use the [CygnusPlatformWebViewController.isMethodSupported] method to check if this method is supported at runtime.
  ///{@endtemplate}
  getZoomScale,

  ///Can be used to check if the [CygnusPlatformWebViewController.goBack] method is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusPlatformWebViewController.goBack.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView ([Official API - WebView.goBack](https://developer.android.com/reference/android/webkit/WebView#goBack()))
  ///- iOS WKWebView ([Official API - WKWebView.goBack](https://developer.apple.com/documentation/webkit/wkwebview/1414952-goback))
  ///- macOS WKWebView ([Official API - WKWebView.goBack](https://developer.apple.com/documentation/webkit/wkwebview/1414952-goback))
  ///- Web \<iframe\> but requires same origin ([Official API - History.back](https://developer.mozilla.org/en-US/docs/Web/API/History/back))
  ///- Windows WebView2 ([Official API - ICoreWebView2.GoBack](https://learn.microsoft.com/en-us/microsoft-edge/webview2/reference/win32/icorewebview2?view=webview2-1.0.2210.55#goback))
  ///- Linux WPE WebKit ([Official API - webkit_web_view_go_back](https://wpewebkit.org/reference/stable/wpe-webkit-2.0/method.WebView.go_back.html))
  ///
  ///Use the [CygnusPlatformWebViewController.isMethodSupported] method to check if this method is supported at runtime.
  ///{@endtemplate}
  goBack,

  ///Can be used to check if the [CygnusPlatformWebViewController.goBackOrForward] method is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusPlatformWebViewController.goBackOrForward.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView ([Official API - WebView.goBackOrForward](https://developer.android.com/reference/android/webkit/WebView#goBackOrForward(int)))
  ///- iOS WKWebView ([Official API - WKWebView.go](https://developer.apple.com/documentation/webkit/wkwebview/1414991-go))
  ///- macOS WKWebView ([Official API - WKWebView.go](https://developer.apple.com/documentation/webkit/wkwebview/1414991-go))
  ///- Web \<iframe\> but requires same origin ([Official API - History.go](https://developer.mozilla.org/en-US/docs/Web/API/History/go))
  ///- Windows WebView2
  ///- Linux WPE WebKit
  ///
  ///**Parameters - Officially Supported Platforms/Implementations**:
  ///- [steps]: all platforms
  ///
  ///Use the [CygnusPlatformWebViewController.isMethodSupported] method to check if this method is supported at runtime.
  ///{@endtemplate}
  goBackOrForward,

  ///Can be used to check if the [CygnusPlatformWebViewController.goForward] method is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusPlatformWebViewController.goForward.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView ([Official API - WebView.goForward](https://developer.android.com/reference/android/webkit/WebView#goForward()))
  ///- iOS WKWebView ([Official API - WKWebView.goForward](https://developer.apple.com/documentation/webkit/wkwebview/1414993-goforward))
  ///- macOS WKWebView ([Official API - WKWebView.goForward](https://developer.apple.com/documentation/webkit/wkwebview/1414993-goforward))
  ///- Web \<iframe\> but requires same origin ([Official API - History.forward](https://developer.mozilla.org/en-US/docs/Web/API/History/forward))
  ///- Windows WebView2 ([Official API - ICoreWebView2.GoForward](https://learn.microsoft.com/en-us/microsoft-edge/webview2/reference/win32/icorewebview2?view=webview2-1.0.2210.55#goforward))
  ///- Linux WPE WebKit ([Official API - webkit_web_view_go_forward](https://wpewebkit.org/reference/stable/wpe-webkit-2.0/method.WebView.go_forward.html))
  ///
  ///Use the [CygnusPlatformWebViewController.isMethodSupported] method to check if this method is supported at runtime.
  ///{@endtemplate}
  goForward,

  ///Can be used to check if the [CygnusPlatformWebViewController.goTo] method is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusPlatformWebViewController.goTo.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView
  ///- iOS WKWebView
  ///- macOS WKWebView
  ///- Web \<iframe\> but requires same origin
  ///- Windows WebView2
  ///
  ///**Parameters - Officially Supported Platforms/Implementations**:
  ///- [historyItem]: all platforms
  ///
  ///Use the [CygnusPlatformWebViewController.isMethodSupported] method to check if this method is supported at runtime.
  ///{@endtemplate}
  goTo,

  ///Can be used to check if the [CygnusPlatformWebViewController.handlesURLScheme] method is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusPlatformWebViewController.handlesURLScheme.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- iOS WKWebView 11.0+ ([Official API - WKWebView.handlesURLScheme](https://developer.apple.com/documentation/webkit/wkwebview/2875370-handlesurlscheme))
  ///- macOS WKWebView 10.13+ ([Official API - WKWebView.handlesURLScheme](https://developer.apple.com/documentation/webkit/wkwebview/2875370-handlesurlscheme))
  ///- Linux WPE WebKit:
  ///    - Returns true for built-in schemes (http, https, file, ftp, data, blob, about, javascript).
  ///
  ///**Parameters - Officially Supported Platforms/Implementations**:
  ///- [urlScheme]: all platforms
  ///
  ///Use the [CygnusPlatformWebViewController.isMethodSupported] method to check if this method is supported at runtime.
  ///{@endtemplate}
  handlesURLScheme,

  ///Can be used to check if the [CygnusPlatformWebViewController.hasJavaScriptHandler] method is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusPlatformWebViewController.hasJavaScriptHandler.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView
  ///- iOS WKWebView
  ///- macOS WKWebView
  ///- Web \<iframe\> but requires same origin
  ///- Windows WebView2
  ///
  ///**Parameters - Officially Supported Platforms/Implementations**:
  ///- [handlerName]: all platforms
  ///
  ///Use the [CygnusPlatformWebViewController.isMethodSupported] method to check if this method is supported at runtime.
  ///{@endtemplate}
  hasJavaScriptHandler,

  ///Can be used to check if the [CygnusPlatformWebViewController.hasOnlySecureContent] method is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusPlatformWebViewController.hasOnlySecureContent.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- iOS WKWebView ([Official API - WKWebView.hasOnlySecureContent](https://developer.apple.com/documentation/webkit/wkwebview/1415002-hasonlysecurecontent))
  ///- macOS WKWebView ([Official API - WKWebView.hasOnlySecureContent](https://developer.apple.com/documentation/webkit/wkwebview/1415002-hasonlysecurecontent))
  ///
  ///Use the [CygnusPlatformWebViewController.isMethodSupported] method to check if this method is supported at runtime.
  ///{@endtemplate}
  hasOnlySecureContent,

  ///Can be used to check if the [CygnusPlatformWebViewController.hasUserScript] method is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusPlatformWebViewController.hasUserScript.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView
  ///- iOS WKWebView
  ///- macOS WKWebView
  ///- Web \<iframe\> but requires same origin
  ///- Windows WebView2
  ///
  ///**Parameters - Officially Supported Platforms/Implementations**:
  ///- [userScript]: all platforms
  ///
  ///Use the [CygnusPlatformWebViewController.isMethodSupported] method to check if this method is supported at runtime.
  ///{@endtemplate}
  hasUserScript,

  ///Can be used to check if the [CygnusPlatformWebViewController.hasWebMessageListener] method is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusPlatformWebViewController.hasWebMessageListener.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView
  ///- iOS WKWebView
  ///- Linux WPE WebKit
  ///- macOS WKWebView
  ///
  ///**Parameters - Officially Supported Platforms/Implementations**:
  ///- [webMessageListener]: all platforms
  ///
  ///Use the [CygnusPlatformWebViewController.isMethodSupported] method to check if this method is supported at runtime.
  ///{@endtemplate}
  hasWebMessageListener,

  ///Can be used to check if the [CygnusPlatformWebViewController.hideInputMethod] method is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusPlatformWebViewController.hideInputMethod.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView ([Official API - InputMethodManager.hideSoftInputFromWindow](https://developer.android.com/reference/android/view/inputmethod/InputMethodManager#hideSoftInputFromWindow(android.os.IBinder,%20int)))
  ///- iOS WKWebView ([Official API - UIView.endEditing](https://developer.apple.com/documentation/uikit/uiview/1619630-endediting))
  ///
  ///Use the [CygnusPlatformWebViewController.isMethodSupported] method to check if this method is supported at runtime.
  ///{@endtemplate}
  hideInputMethod,

  ///Can be used to check if the [CygnusPlatformWebViewController.injectCSSCode] method is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusPlatformWebViewController.injectCSSCode.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView
  ///- iOS WKWebView
  ///- Linux WPE WebKit:
  ///    - This method is implemented using JavaScript.
  ///- macOS WKWebView
  ///- Web \<iframe\> but requires same origin
  ///- Windows WebView2:
  ///    - This method is implemented using JavaScript.
  ///
  ///**Parameters - Officially Supported Platforms/Implementations**:
  ///- [source]: all platforms
  ///
  ///Use the [CygnusPlatformWebViewController.isMethodSupported] method to check if this method is supported at runtime.
  ///{@endtemplate}
  injectCSSCode,

  ///Can be used to check if the [CygnusPlatformWebViewController.injectCSSFileFromAsset] method is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusPlatformWebViewController.injectCSSFileFromAsset.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView
  ///- iOS WKWebView
  ///- macOS WKWebView
  ///- Web \<iframe\> but requires same origin
  ///
  ///**Parameters - Officially Supported Platforms/Implementations**:
  ///- [assetFilePath]: all platforms
  ///
  ///Use the [CygnusPlatformWebViewController.isMethodSupported] method to check if this method is supported at runtime.
  ///{@endtemplate}
  injectCSSFileFromAsset,

  ///Can be used to check if the [CygnusPlatformWebViewController.injectCSSFileFromUrl] method is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusPlatformWebViewController.injectCSSFileFromUrl.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView
  ///- iOS WKWebView
  ///- Linux WPE WebKit:
  ///    - This method is implemented using JavaScript.
  ///- macOS WKWebView
  ///- Web \<iframe\> but requires same origin
  ///- Windows WebView2:
  ///    - This method is implemented using JavaScript.
  ///
  ///**Parameters - Officially Supported Platforms/Implementations**:
  ///- [urlFile]: all platforms
  ///- [cssLinkHtmlTagAttributes]: all platforms
  ///
  ///Use the [CygnusPlatformWebViewController.isMethodSupported] method to check if this method is supported at runtime.
  ///{@endtemplate}
  injectCSSFileFromUrl,

  ///Can be used to check if the [CygnusPlatformWebViewController.injectJavascriptFileFromAsset] method is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusPlatformWebViewController.injectJavascriptFileFromAsset.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView
  ///- iOS WKWebView
  ///- macOS WKWebView
  ///- Web \<iframe\> but requires same origin
  ///- Windows WebView2
  ///
  ///**Parameters - Officially Supported Platforms/Implementations**:
  ///- [assetFilePath]: all platforms
  ///
  ///Use the [CygnusPlatformWebViewController.isMethodSupported] method to check if this method is supported at runtime.
  ///{@endtemplate}
  injectJavascriptFileFromAsset,

  ///Can be used to check if the [CygnusPlatformWebViewController.injectJavascriptFileFromUrl] method is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusPlatformWebViewController.injectJavascriptFileFromUrl.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView
  ///- iOS WKWebView
  ///- Linux WPE WebKit:
  ///    - This method is implemented using JavaScript.
  ///- macOS WKWebView
  ///- Web \<iframe\> but requires same origin
  ///
  ///**Parameters - Officially Supported Platforms/Implementations**:
  ///- [urlFile]: all platforms
  ///- [scriptHtmlTagAttributes]: all platforms
  ///
  ///Use the [CygnusPlatformWebViewController.isMethodSupported] method to check if this method is supported at runtime.
  ///{@endtemplate}
  injectJavascriptFileFromUrl,

  ///Can be used to check if the [CygnusPlatformWebViewController.isInFullscreen] method is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusPlatformWebViewController.isInFullscreen.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView
  ///- iOS WKWebView
  ///- macOS WKWebView
  ///- Linux WPE WebKit
  ///
  ///Use the [CygnusPlatformWebViewController.isMethodSupported] method to check if this method is supported at runtime.
  ///{@endtemplate}
  isInFullscreen,

  ///Can be used to check if the [CygnusPlatformWebViewController.isInterfaceSupported] method is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusPlatformWebViewController.isInterfaceSupported.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Windows WebView2
  ///
  ///**Parameters - Officially Supported Platforms/Implementations**:
  ///- [interface]: all platforms
  ///
  ///Use the [CygnusPlatformWebViewController.isMethodSupported] method to check if this method is supported at runtime.
  ///{@endtemplate}
  isInterfaceSupported,

  ///Can be used to check if the [CygnusPlatformWebViewController.isLoading] method is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusPlatformWebViewController.isLoading.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView
  ///- iOS WKWebView
  ///- Linux WPE WebKit ([Official API - webkit_web_view_is_loading](https://wpewebkit.org/reference/stable/wpe-webkit-2.0/method.WebView.is_loading.html))
  ///- macOS WKWebView
  ///- Web \<iframe\>
  ///- Windows WebView2
  ///
  ///Use the [CygnusPlatformWebViewController.isMethodSupported] method to check if this method is supported at runtime.
  ///{@endtemplate}
  isLoading,

  ///Can be used to check if the [CygnusPlatformWebViewController.isMultiProcessEnabled] method is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusPlatformWebViewController.isMultiProcessEnabled.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView ([Official API - WebViewCompat.isMultiProcessEnabled](https://developer.android.com/reference/androidx/webkit/WebViewCompat#isMultiProcessEnabled())):
  ///    - This method should only be called if [CygnusWebViewFeature.isFeatureSupported] returns `true` for [CygnusWebViewFeature.MULTI_PROCESS].
  ///
  ///Use the [CygnusPlatformWebViewController.isMethodSupported] method to check if this method is supported at runtime.
  ///{@endtemplate}
  isMultiProcessEnabled,

  ///Can be used to check if the [CygnusPlatformWebViewController.isMuted] method is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusPlatformWebViewController.isMuted.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Linux WPE WebKit 2.30+ ([Official API - webkit_web_view_get_is_muted](https://wpewebkit.org/reference/stable/wpe-webkit-2.0/method.WebView.get_is_muted.html))
  ///
  ///Use the [CygnusPlatformWebViewController.isMethodSupported] method to check if this method is supported at runtime.
  ///{@endtemplate}
  isMuted,

  ///Can be used to check if the [CygnusPlatformWebViewController.isPlayingAudio] method is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusPlatformWebViewController.isPlayingAudio.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Linux WPE WebKit 2.8+ ([Official API - webkit_web_view_is_playing_audio](https://wpewebkit.org/reference/stable/wpe-webkit-2.0/method.WebView.is_playing_audio.html))
  ///
  ///Use the [CygnusPlatformWebViewController.isMethodSupported] method to check if this method is supported at runtime.
  ///{@endtemplate}
  isPlayingAudio,

  ///Can be used to check if the [CygnusPlatformWebViewController.isSecureContext] method is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusPlatformWebViewController.isSecureContext.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView 21+:
  ///    - This method is implemented using JavaScript.
  ///- iOS WKWebView:
  ///    - This method is implemented using JavaScript.
  ///- Linux WPE WebKit:
  ///    - This method is implemented using JavaScript.
  ///- macOS WKWebView:
  ///    - This method is implemented using JavaScript.
  ///- Web \<iframe\> but requires same origin ([Official API - Window.isSecureContext](https://developer.mozilla.org/en-US/docs/Web/API/Window/isSecureContext))
  ///- Windows WebView2:
  ///    - This method is implemented using JavaScript.
  ///
  ///Use the [CygnusPlatformWebViewController.isMethodSupported] method to check if this method is supported at runtime.
  ///{@endtemplate}
  isSecureContext,

  ///Can be used to check if the [CygnusPlatformWebViewController.isVisible] method is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusPlatformWebViewController.isVisible.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Linux WPE WebKit ([Official API - wpe_view_get_visible](https://wpewebkit.org/reference/stable/wpe-platform-1.0/method.View.get_visible.html))
  ///
  ///Use the [CygnusPlatformWebViewController.isMethodSupported] method to check if this method is supported at runtime.
  ///{@endtemplate}
  isVisible,

  ///Can be used to check if the [CygnusPlatformWebViewController.loadData] method is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusPlatformWebViewController.loadData.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView ([Official API - WebView.loadDataWithBaseURL](https://developer.android.com/reference/android/webkit/WebView#loadDataWithBaseURL(java.lang.String,%20java.lang.String,%20java.lang.String,%20java.lang.String,%20java.lang.String)))
  ///- iOS WKWebView ([Official API - WKWebView.loadHTMLString](https://developer.apple.com/documentation/webkit/wkwebview/1415004-loadhtmlstring)):
  ///    - or [Official API - WKWebView.load](https://developer.apple.com/documentation/webkit/wkwebview/1415011-load)
  ///- macOS WKWebView ([Official API - WKWebView.loadHTMLString](https://developer.apple.com/documentation/webkit/wkwebview/1415004-loadhtmlstring)):
  ///    - or [Official API - WKWebView.load](https://developer.apple.com/documentation/webkit/wkwebview/1415011-load)
  ///- Web \<iframe\> but requires same origin
  ///- Windows WebView2 ([Official API - ICoreWebView2.NavigateToString](https://learn.microsoft.com/en-us/microsoft-edge/webview2/reference/win32/icorewebview2?view=webview2-1.0.2210.55#navigatetostring))
  ///- Linux WPE WebKit ([Official API - webkit_web_view_load_html](https://wpewebkit.org/reference/stable/wpe-webkit-2.0/method.WebView.load_html.html))
  ///
  ///**Parameters - Officially Supported Platforms/Implementations**:
  ///- [data]: all platforms
  ///- [mimeType]:
  ///    - Android WebView
  ///    - iOS WKWebView
  ///    - macOS WKWebView
  ///    - Web \<iframe\> but requires same origin
  ///- [encoding]:
  ///    - Android WebView
  ///    - iOS WKWebView
  ///    - macOS WKWebView
  ///- [baseUrl]:
  ///    - Android WebView
  ///    - iOS WKWebView
  ///    - macOS WKWebView
  ///- [historyUrl]:
  ///    - Android WebView
  ///- [allowingReadAccessTo]:
  ///    - iOS WKWebView
  ///    - macOS WKWebView
  ///
  ///Use the [CygnusPlatformWebViewController.isMethodSupported] method to check if this method is supported at runtime.
  ///{@endtemplate}
  loadData,

  ///Can be used to check if the [CygnusPlatformWebViewController.loadFile] method is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusPlatformWebViewController.loadFile.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView ([Official API - WebView.loadUrl](https://developer.android.com/reference/android/webkit/WebView#loadUrl(java.lang.String)))
  ///- iOS WKWebView ([Official API - WKWebView.load](https://developer.apple.com/documentation/webkit/wkwebview/1414954-load))
  ///- macOS WKWebView ([Official API - WKWebView.load](https://developer.apple.com/documentation/webkit/wkwebview/1414954-load))
  ///- Web \<iframe\> but requires same origin
  ///- Windows WebView2 ([Official API - ICoreWebView2.Navigate](https://learn.microsoft.com/en-us/microsoft-edge/webview2/reference/win32/icorewebview2?view=webview2-1.0.2210.55#navigate))
  ///- Linux WPE WebKit ([Official API - webkit_web_view_load_uri](https://wpewebkit.org/reference/stable/wpe-webkit-2.0/method.WebView.load_uri.html))
  ///
  ///**Parameters - Officially Supported Platforms/Implementations**:
  ///- [assetFilePath]: all platforms
  ///
  ///Use the [CygnusPlatformWebViewController.isMethodSupported] method to check if this method is supported at runtime.
  ///{@endtemplate}
  loadFile,

  ///Can be used to check if the [CygnusPlatformWebViewController.loadSimulatedRequest] method is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusPlatformWebViewController.loadSimulatedRequest.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- iOS WKWebView 15.0+ ([Official API - WKWebView.loadSimulatedRequest(_:response:responseData:)](https://developer.apple.com/documentation/webkit/wkwebview/3763094-loadsimulatedrequest)):
  ///    - or [Official API - WKWebView.loadSimulatedRequest(_:responseHTML:)](https://developer.apple.com/documentation/webkit/wkwebview/3763095-loadsimulatedrequest)
  ///- macOS WKWebView 12.0+ ([Official API - WKWebView.loadSimulatedRequest(_:response:responseData:)](https://developer.apple.com/documentation/webkit/wkwebview/3763094-loadsimulatedrequest)):
  ///    - or [Official API - WKWebView.loadSimulatedRequest(_:responseHTML:)](https://developer.apple.com/documentation/webkit/wkwebview/3763095-loadsimulatedrequest)
  ///
  ///**Parameters - Officially Supported Platforms/Implementations**:
  ///- [urlRequest]: all platforms
  ///- [data]: all platforms
  ///- [urlResponse]: all platforms
  ///
  ///Use the [CygnusPlatformWebViewController.isMethodSupported] method to check if this method is supported at runtime.
  ///{@endtemplate}
  loadSimulatedRequest,

  ///Can be used to check if the [CygnusPlatformWebViewController.loadUrl] method is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusPlatformWebViewController.loadUrl.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView ([Official API - WebView.loadUrl](https://developer.android.com/reference/android/webkit/WebView#loadUrl(java.lang.String))):
  ///    - If method is "POST", [Official API - WebView.postUrl](https://developer.android.com/reference/android/webkit/WebView#postUrl(java.lang.String,%20byte[])). Also, when loading an URL Request using "POST" method, headers are ignored.
  ///- iOS WKWebView ([Official API - WKWebView.load](https://developer.apple.com/documentation/webkit/wkwebview/1414954-load)):
  ///    - If [allowingReadAccessTo] is used, [Official API - WKWebView.loadFileURL](https://developer.apple.com/documentation/webkit/wkwebview/1414973-loadfileurl)
  ///- macOS WKWebView ([Official API - WKWebView.load](https://developer.apple.com/documentation/webkit/wkwebview/1414954-load)):
  ///    - If [allowingReadAccessTo] is used, [Official API - WKWebView.loadFileURL](https://developer.apple.com/documentation/webkit/wkwebview/1414973-loadfileurl)
  ///- Web \<iframe\> but requires same origin:
  ///    - If method is "GET" and headers are empty, it will change the `src` of the iframe. For all other cases it will try to create an XMLHttpRequest and load the result inside the iframe.
  ///- Windows WebView2 ([Official API - ICoreWebView2_2.NavigateWithWebResourceRequest](https://learn.microsoft.com/en-us/microsoft-edge/webview2/reference/win32/icorewebview2_2?view=webview2-1.0.2210.55#navigatewithwebresourcerequest))
  ///- Linux WPE WebKit ([Official API - webkit_web_view_load_uri](https://wpewebkit.org/reference/stable/wpe-webkit-2.0/method.WebView.load_uri.html))
  ///
  ///**Parameters - Officially Supported Platforms/Implementations**:
  ///- [urlRequest]: all platforms
  ///- [allowingReadAccessTo]:
  ///    - iOS WKWebView
  ///    - macOS WKWebView
  ///
  ///Use the [CygnusPlatformWebViewController.isMethodSupported] method to check if this method is supported at runtime.
  ///{@endtemplate}
  loadUrl,

  ///Can be used to check if the [CygnusPlatformWebViewController.openDevTools] method is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusPlatformWebViewController.openDevTools.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Windows WebView2 ([Official API - ICoreWebView2.OpenDevToolsWindow](https://learn.microsoft.com/en-us/microsoft-edge/webview2/reference/win32/icorewebview2?view=webview2-1.0.2210.55#opendevtoolswindow))
  ///
  ///Use the [CygnusPlatformWebViewController.isMethodSupported] method to check if this method is supported at runtime.
  ///{@endtemplate}
  openDevTools,

  ///Can be used to check if the [CygnusPlatformWebViewController.pageDown] method is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusPlatformWebViewController.pageDown.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView ([Official API - WebView.pageDown](https://developer.android.com/reference/android/webkit/WebView#pageDown(boolean)))
  ///
  ///**Parameters - Officially Supported Platforms/Implementations**:
  ///- [bottom]: all platforms
  ///
  ///Use the [CygnusPlatformWebViewController.isMethodSupported] method to check if this method is supported at runtime.
  ///{@endtemplate}
  pageDown,

  ///Can be used to check if the [CygnusPlatformWebViewController.pageUp] method is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusPlatformWebViewController.pageUp.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView ([Official API - WebView.pageUp](https://developer.android.com/reference/android/webkit/WebView#pageUp(boolean)))
  ///
  ///**Parameters - Officially Supported Platforms/Implementations**:
  ///- [top]: all platforms
  ///
  ///Use the [CygnusPlatformWebViewController.isMethodSupported] method to check if this method is supported at runtime.
  ///{@endtemplate}
  pageUp,

  ///Can be used to check if the [CygnusPlatformWebViewController.pause] method is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusPlatformWebViewController.pause.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView ([Official API - WebView.onPause](https://developer.android.com/reference/android/webkit/WebView#onPause()))
  ///- Windows WebView2 ([Official API - ICoreWebView2_3.TrySuspend](https://learn.microsoft.com/en-us/microsoft-edge/webview2/reference/win32/icorewebview2_3?view=webview2-1.0.2792.45#trysuspend))
  ///
  ///Use the [CygnusPlatformWebViewController.isMethodSupported] method to check if this method is supported at runtime.
  ///{@endtemplate}
  pause,

  ///Can be used to check if the [CygnusPlatformWebViewController.pauseAllMediaPlayback] method is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusPlatformWebViewController.pauseAllMediaPlayback.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- iOS WKWebView 15.0+ ([Official API - WKWebView.pauseAllMediaPlayback](https://developer.apple.com/documentation/webkit/wkwebview/3752240-pauseallmediaplayback))
  ///- macOS WKWebView 12.0+ ([Official API - WKWebView.pauseAllMediaPlayback](https://developer.apple.com/documentation/webkit/wkwebview/3752240-pauseallmediaplayback))
  ///- Linux WPE WebKit ([Official API - JavaScript HTMLMediaElement.pause()](https://developer.mozilla.org/en-US/docs/Web/API/HTMLMediaElement/pause)):
  ///    - Uses JavaScript to pause all audio and video elements
  ///
  ///Use the [CygnusPlatformWebViewController.isMethodSupported] method to check if this method is supported at runtime.
  ///{@endtemplate}
  pauseAllMediaPlayback,

  ///Can be used to check if the [CygnusPlatformWebViewController.pauseTimers] method is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusPlatformWebViewController.pauseTimers.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView ([Official API - WebView.pauseTimers](https://developer.android.com/reference/android/webkit/WebView#pauseTimers()))
  ///- iOS WKWebView:
  ///    - This method is implemented using JavaScript and it is restricted to just this WebView.
  ///- macOS WKWebView:
  ///    - This method is implemented using JavaScript and it is restricted to just this WebView.
  ///
  ///Use the [CygnusPlatformWebViewController.isMethodSupported] method to check if this method is supported at runtime.
  ///{@endtemplate}
  pauseTimers,

  ///Can be used to check if the [CygnusPlatformWebViewController.postUrl] method is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusPlatformWebViewController.postUrl.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView ([Official API - WebView.postUrl](https://developer.android.com/reference/android/webkit/WebView#postUrl(java.lang.String,%20byte[])))
  ///- iOS WKWebView
  ///- macOS WKWebView
  ///- Web \<iframe\> but requires same origin:
  ///    - It will try to create an XMLHttpRequest and load the result inside the iframe.
  ///- Windows WebView2
  ///- Linux WPE WebKit:
  ///    - Uses JavaScript to create an XMLHttpRequest and load the result.
  ///
  ///**Parameters - Officially Supported Platforms/Implementations**:
  ///- [url]: all platforms
  ///- [postData]: all platforms
  ///
  ///Use the [CygnusPlatformWebViewController.isMethodSupported] method to check if this method is supported at runtime.
  ///{@endtemplate}
  postUrl,

  ///Can be used to check if the [CygnusPlatformWebViewController.postWebMessage] method is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusPlatformWebViewController.postWebMessage.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView ([Official API - WebView.postWebMessage](https://developer.android.com/reference/androidx/webkit/WebViewCompat#postWebMessage(android.webkit.WebView,%20androidx.webkit.WebMessageCompat,%20android.net.Uri))):
  ///    - This method should only be called if [CygnusWebViewFeature.isFeatureSupported] returns `true` for [CygnusWebViewFeature.POST_WEB_MESSAGE].
  ///- iOS WKWebView:
  ///    - This method is implemented using JavaScript.
  ///- macOS WKWebView:
  ///    - This method is implemented using JavaScript.
  ///- Linux WPE WebKit:
  ///    - Implemented via JavaScript MessageChannel API.
  ///- Windows WebView2:
  ///    - Implemented via JavaScript MessageChannel API.
  ///
  ///**Parameters - Officially Supported Platforms/Implementations**:
  ///- [message]: all platforms
  ///- [targetOrigin]: all platforms
  ///
  ///Use the [CygnusPlatformWebViewController.isMethodSupported] method to check if this method is supported at runtime.
  ///{@endtemplate}
  postWebMessage,

  ///Can be used to check if the [CygnusPlatformWebViewController.printCurrentPage] method is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusPlatformWebViewController.printCurrentPage.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView ([Official API - PrintManager.print](https://developer.android.com/reference/android/print/PrintManager#print(java.lang.String,%20android.print.PrintDocumentAdapter,%20android.print.PrintAttributes)))
  ///- iOS WKWebView ([Official API - UIPrintInteractionController.present](https://developer.apple.com/documentation/uikit/uiprintinteractioncontroller/1618149-present))
  ///- macOS WKWebView ([Official API - WKWebView.printOperation](https://developer.apple.com/documentation/webkit/wkwebview/3516861-printoperation)):
  ///    - If macOS version is less than 11.0, it will use [Official API - NSView.printView](https://developer.apple.com/documentation/appkit/nsview/1483705-printview).
  ///- Web \<iframe\> but requires same origin ([Official API - Window.print](https://developer.mozilla.org/en-US/docs/Web/API/Window/print)):
  ///    - [CygnusPlatformPrintJobController] is always `null`.
  ///- Windows WebView2 ([Official API - ICoreWebView2_16.Print](https://learn.microsoft.com/en-us/microsoft-edge/webview2/reference/win32/icorewebview2_16?view=webview2-1.0.2849.39#print))
  ///
  ///**Parameters - Officially Supported Platforms/Implementations**:
  ///- [settings]: all platforms
  ///
  ///Use the [CygnusPlatformWebViewController.isMethodSupported] method to check if this method is supported at runtime.
  ///{@endtemplate}
  printCurrentPage,

  ///Can be used to check if the [CygnusPlatformWebViewController.reload] method is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusPlatformWebViewController.reload.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView ([Official API - WebView.reload](https://developer.android.com/reference/android/webkit/WebView#reload()))
  ///- iOS WKWebView ([Official API - WKWebView.reload](https://developer.apple.com/documentation/webkit/wkwebview/1414969-reload))
  ///- macOS WKWebView ([Official API - WKWebView.reload](https://developer.apple.com/documentation/webkit/wkwebview/1414969-reload))
  ///- Web \<iframe\> but requires same origin ([Official API - Location.reload](https://developer.mozilla.org/en-US/docs/Web/API/Location/reload)):
  ///    - if `window.location.reload()` is not accessible inside the iframe, it will reload using the iframe `src` attribute.
  ///- Windows WebView2 ([Official API - ICoreWebView2.Reload](https://learn.microsoft.com/en-us/microsoft-edge/webview2/reference/win32/icorewebview2?view=webview2-1.0.2210.55#reload))
  ///- Linux WPE WebKit ([Official API - webkit_web_view_reload](https://wpewebkit.org/reference/stable/wpe-webkit-2.0/method.WebView.reload.html))
  ///
  ///Use the [CygnusPlatformWebViewController.isMethodSupported] method to check if this method is supported at runtime.
  ///{@endtemplate}
  reload,

  ///Can be used to check if the [CygnusPlatformWebViewController.reloadFromOrigin] method is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusPlatformWebViewController.reloadFromOrigin.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- iOS WKWebView ([Official API - WKWebView.reloadFromOrigin](https://developer.apple.com/documentation/webkit/wkwebview/1414956-reloadfromorigin))
  ///- macOS WKWebView ([Official API - WKWebView.reloadFromOrigin](https://developer.apple.com/documentation/webkit/wkwebview/1414956-reloadfromorigin))
  ///- Linux WPE WebKit ([Official API - webkit_web_view_reload_bypass_cache](https://wpewebkit.org/reference/stable/wpe-webkit-2.0/method.WebView.reload_bypass_cache.html))
  ///
  ///Use the [CygnusPlatformWebViewController.isMethodSupported] method to check if this method is supported at runtime.
  ///{@endtemplate}
  reloadFromOrigin,

  ///Can be used to check if the [CygnusPlatformWebViewController.removeAllUserScripts] method is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusPlatformWebViewController.removeAllUserScripts.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView
  ///- iOS WKWebView ([Official API - WKUserContentController.removeAllUserScripts](https://developer.apple.com/documentation/webkit/wkusercontentcontroller/1536540-removealluserscripts)):
  ///    - This method will throw an error if the [CygnusPlatformWebViewCreationParams.windowId] has been set. There isn't any way to add/remove user scripts specific to window WebViews. This is a limitation of the native WebKit APIs.
  ///- Linux WPE WebKit ([Official API - webkit_user_content_manager_remove_all_scripts](https://wpewebkit.org/reference/stable/wpe-webkit-2.0/method.UserContentManager.remove_all_scripts.html))
  ///- macOS WKWebView ([Official API - WKUserContentController.removeAllUserScripts](https://developer.apple.com/documentation/webkit/wkusercontentcontroller/1536540-removealluserscripts)):
  ///    - This method will throw an error if the [CygnusPlatformWebViewCreationParams.windowId] has been set. There isn't any way to add/remove user scripts specific to window WebViews. This is a limitation of the native WebKit APIs.
  ///- Web \<iframe\> but requires same origin
  ///- Windows WebView2
  ///
  ///Use the [CygnusPlatformWebViewController.isMethodSupported] method to check if this method is supported at runtime.
  ///{@endtemplate}
  removeAllUserScripts,

  ///Can be used to check if the [CygnusPlatformWebViewController.removeDevToolsProtocolEventListener] method is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusPlatformWebViewController.removeDevToolsProtocolEventListener.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Windows WebView2 ([Official API - ICoreWebView2DevToolsProtocolEventReceiver.remove_DevToolsProtocolEventReceived](https://learn.microsoft.com/en-us/microsoft-edge/webview2/reference/win32/icorewebview2devtoolsprotocoleventreceiver?view=webview2-1.0.2210.55#remove_devtoolsprotocoleventreceived))
  ///
  ///**Parameters - Officially Supported Platforms/Implementations**:
  ///- [eventName]: all platforms
  ///
  ///Use the [CygnusPlatformWebViewController.isMethodSupported] method to check if this method is supported at runtime.
  ///{@endtemplate}
  removeDevToolsProtocolEventListener,

  ///Can be used to check if the [CygnusPlatformWebViewController.removeJavaScriptHandler] method is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusPlatformWebViewController.removeJavaScriptHandler.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView
  ///- iOS WKWebView
  ///- macOS WKWebView
  ///- Web \<iframe\> but requires same origin
  ///- Windows WebView2
  ///
  ///**Parameters - Officially Supported Platforms/Implementations**:
  ///- [handlerName]: all platforms
  ///
  ///Use the [CygnusPlatformWebViewController.isMethodSupported] method to check if this method is supported at runtime.
  ///{@endtemplate}
  removeJavaScriptHandler,

  ///Can be used to check if the [CygnusPlatformWebViewController.removeUserScript] method is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusPlatformWebViewController.removeUserScript.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView
  ///- iOS WKWebView:
  ///    - This method will throw an error if the [CygnusPlatformWebViewCreationParams.windowId] has been set. There isn't any way to add/remove user scripts specific to window WebViews. This is a limitation of the native WebKit APIs.
  ///- Linux WPE WebKit
  ///- macOS WKWebView:
  ///    - This method will throw an error if the [CygnusPlatformWebViewCreationParams.windowId] has been set. There isn't any way to add/remove user scripts specific to window WebViews. This is a limitation of the native WebKit APIs.
  ///- Web \<iframe\> but requires same origin
  ///- Windows WebView2
  ///
  ///**Parameters - Officially Supported Platforms/Implementations**:
  ///- [userScript]: all platforms
  ///
  ///Use the [CygnusPlatformWebViewController.isMethodSupported] method to check if this method is supported at runtime.
  ///{@endtemplate}
  removeUserScript,

  ///Can be used to check if the [CygnusPlatformWebViewController.removeUserScripts] method is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusPlatformWebViewController.removeUserScripts.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView
  ///- iOS WKWebView:
  ///    - This method will throw an error if the [CygnusPlatformWebViewCreationParams.windowId] has been set. There isn't any way to add/remove user scripts specific to window WebViews. This is a limitation of the native WebKit APIs.
  ///- Linux WPE WebKit
  ///- macOS WKWebView:
  ///    - This method will throw an error if the [CygnusPlatformWebViewCreationParams.windowId] has been set. There isn't any way to add/remove user scripts specific to window WebViews. This is a limitation of the native WebKit APIs.
  ///- Web \<iframe\> but requires same origin
  ///- Windows WebView2
  ///
  ///**Parameters - Officially Supported Platforms/Implementations**:
  ///- [userScripts]: all platforms
  ///
  ///Use the [CygnusPlatformWebViewController.isMethodSupported] method to check if this method is supported at runtime.
  ///{@endtemplate}
  removeUserScripts,

  ///Can be used to check if the [CygnusPlatformWebViewController.removeUserScriptsByGroupName] method is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusPlatformWebViewController.removeUserScriptsByGroupName.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView
  ///- iOS WKWebView:
  ///    - This method will throw an error if the [CygnusPlatformWebViewCreationParams.windowId] has been set. There isn't any way to add/remove user scripts specific to window WebViews. This is a limitation of the native WebKit APIs.
  ///- Linux WPE WebKit
  ///- macOS WKWebView:
  ///    - This method will throw an error if the [CygnusPlatformWebViewCreationParams.windowId] has been set. There isn't any way to add/remove user scripts specific to window WebViews. This is a limitation of the native WebKit APIs.
  ///- Web \<iframe\> but requires same origin
  ///- Windows WebView2
  ///
  ///**Parameters - Officially Supported Platforms/Implementations**:
  ///- [groupName]: all platforms
  ///
  ///Use the [CygnusPlatformWebViewController.isMethodSupported] method to check if this method is supported at runtime.
  ///{@endtemplate}
  removeUserScriptsByGroupName,

  ///Can be used to check if the [CygnusPlatformWebViewController.requestEnterFullscreen] method is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusPlatformWebViewController.requestEnterFullscreen.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Linux WPE WebKit
  ///
  ///Use the [CygnusPlatformWebViewController.isMethodSupported] method to check if this method is supported at runtime.
  ///{@endtemplate}
  requestEnterFullscreen,

  ///Can be used to check if the [CygnusPlatformWebViewController.requestExitFullscreen] method is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusPlatformWebViewController.requestExitFullscreen.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Linux WPE WebKit
  ///
  ///Use the [CygnusPlatformWebViewController.isMethodSupported] method to check if this method is supported at runtime.
  ///{@endtemplate}
  requestExitFullscreen,

  ///Can be used to check if the [CygnusPlatformWebViewController.requestFocus] method is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusPlatformWebViewController.requestFocus.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView ([Official API - WebView.requestFocus](https://developer.android.com/reference/android/webkit/WebView#requestFocus(int,%20android.graphics.Rect)))
  ///- iOS WKWebView ([Official API - UIResponder.becomeFirstResponder](https://developer.apple.com/documentation/uikit/uiresponder/1621113-becomefirstresponder))
  ///- macOS WKWebView ([Official API - NSWindow.makeFirstResponder](https://developer.apple.com/documentation/appkit/nswindow/1419366-makefirstresponder))
  ///- Linux WPE WebKit ([Official API - wpe_view_backend_add_activity_state](https://wpewebkit.org/reference/stable/wpe-platform-2.0/func.view_backend_add_activity_state.html)):
  ///    - Adds focused state to WPE backend
  ///
  ///**Parameters - Officially Supported Platforms/Implementations**:
  ///- [direction]:
  ///    - Android WebView
  ///- [previouslyFocusedRect]:
  ///    - Android WebView
  ///
  ///Use the [CygnusPlatformWebViewController.isMethodSupported] method to check if this method is supported at runtime.
  ///{@endtemplate}
  requestFocus,

  ///Can be used to check if the [CygnusPlatformWebViewController.requestFocusNodeHref] method is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusPlatformWebViewController.requestFocusNodeHref.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView ([Official API - WebView.requestFocusNodeHref](https://developer.android.com/reference/android/webkit/WebView#requestFocusNodeHref(android.os.Message)))
  ///- iOS WKWebView:
  ///    - This method is implemented using JavaScript.
  ///
  ///Use the [CygnusPlatformWebViewController.isMethodSupported] method to check if this method is supported at runtime.
  ///{@endtemplate}
  requestFocusNodeHref,

  ///Can be used to check if the [CygnusPlatformWebViewController.requestImageRef] method is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusPlatformWebViewController.requestImageRef.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView ([Official API - WebView.requestImageRef](https://developer.android.com/reference/android/webkit/WebView#requestImageRef(android.os.Message)))
  ///- iOS WKWebView:
  ///    - This method is implemented using JavaScript.
  ///
  ///Use the [CygnusPlatformWebViewController.isMethodSupported] method to check if this method is supported at runtime.
  ///{@endtemplate}
  requestImageRef,

  ///Can be used to check if the [CygnusPlatformWebViewController.requestMediaPlaybackState] method is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusPlatformWebViewController.requestMediaPlaybackState.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- iOS WKWebView 15.0+ ([Official API - WKWebView.requestMediaPlaybackState](https://developer.apple.com/documentation/webkit/wkwebview/3752241-requestmediaplaybackstate))
  ///- macOS WKWebView 12.0+ ([Official API - WKWebView.requestMediaPlaybackState](https://developer.apple.com/documentation/webkit/wkwebview/3752241-requestmediaplaybackstate))
  ///- Linux WPE WebKit ([Official API - JavaScript HTMLMediaElement.paused](https://developer.mozilla.org/en-US/docs/Web/API/HTMLMediaElement/paused)):
  ///    - Uses JavaScript to query media playback state
  ///
  ///Use the [CygnusPlatformWebViewController.isMethodSupported] method to check if this method is supported at runtime.
  ///{@endtemplate}
  requestMediaPlaybackState,

  ///Can be used to check if the [CygnusPlatformWebViewController.requestPointerLock] method is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusPlatformWebViewController.requestPointerLock.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Linux WPE WebKit
  ///
  ///Use the [CygnusPlatformWebViewController.isMethodSupported] method to check if this method is supported at runtime.
  ///{@endtemplate}
  requestPointerLock,

  ///Can be used to check if the [CygnusPlatformWebViewController.requestPointerUnlock] method is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusPlatformWebViewController.requestPointerUnlock.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Linux WPE WebKit
  ///
  ///Use the [CygnusPlatformWebViewController.isMethodSupported] method to check if this method is supported at runtime.
  ///{@endtemplate}
  requestPointerUnlock,

  ///Can be used to check if the [CygnusPlatformWebViewController.restoreState] method is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusPlatformWebViewController.restoreState.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView ([Official API - WebView.restoreState](https://developer.android.com/reference/android/webkit/WebView#restoreState(android.os.Bundle))):
  ///    - This method doesn't restore the display data for this WebView.
  ///- iOS WKWebView 15.0+ ([Official API - WKWebView.interactionState](https://developer.apple.com/documentation/webkit/wkwebview/3752236-interactionstate))
  ///- macOS WKWebView 12.0+ ([Official API - WKWebView.interactionState](https://developer.apple.com/documentation/webkit/wkwebview/3752236-interactionstate))
  ///- Linux WPE WebKit
  ///
  ///**Parameters - Officially Supported Platforms/Implementations**:
  ///- [state]: all platforms
  ///
  ///Use the [CygnusPlatformWebViewController.isMethodSupported] method to check if this method is supported at runtime.
  ///{@endtemplate}
  restoreState,

  ///Can be used to check if the [CygnusPlatformWebViewController.resume] method is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusPlatformWebViewController.resume.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView ([Official API - WebView.onResume](https://developer.android.com/reference/android/webkit/WebView#onResume()))
  ///- Windows WebView2 ([Official API - ICoreWebView2_3.Resume](https://learn.microsoft.com/en-us/microsoft-edge/webview2/reference/win32/icorewebview2_3?view=webview2-1.0.2792.45#resume))
  ///
  ///Use the [CygnusPlatformWebViewController.isMethodSupported] method to check if this method is supported at runtime.
  ///{@endtemplate}
  resume,

  ///Can be used to check if the [CygnusPlatformWebViewController.resumeTimers] method is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusPlatformWebViewController.resumeTimers.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView ([Official API - WebView.resumeTimers](https://developer.android.com/reference/android/webkit/WebView#resumeTimers()))
  ///- iOS WKWebView:
  ///    - This method is implemented using JavaScript and it is restricted to just this WebView.
  ///- macOS WKWebView:
  ///    - This method is implemented using JavaScript and it is restricted to just this WebView.
  ///
  ///Use the [CygnusPlatformWebViewController.isMethodSupported] method to check if this method is supported at runtime.
  ///{@endtemplate}
  resumeTimers,

  ///Can be used to check if the [CygnusPlatformWebViewController.saveState] method is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusPlatformWebViewController.saveState.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView ([Official API - WebView.saveState](https://developer.android.com/reference/android/webkit/WebView#saveState(android.os.Bundle))):
  ///    - This method doesn't store the display data for this WebView.
  ///- iOS WKWebView 15.0+ ([Official API - WKWebView.interactionState](https://developer.apple.com/documentation/webkit/wkwebview/3752236-interactionstate))
  ///- macOS WKWebView 12.0+ ([Official API - WKWebView.interactionState](https://developer.apple.com/documentation/webkit/wkwebview/3752236-interactionstate))
  ///- Linux WPE WebKit
  ///
  ///Use the [CygnusPlatformWebViewController.isMethodSupported] method to check if this method is supported at runtime.
  ///{@endtemplate}
  saveState,

  ///Can be used to check if the [CygnusPlatformWebViewController.saveWebArchive] method is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusPlatformWebViewController.saveWebArchive.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView ([Official API - WebView.saveWebArchive](https://developer.android.com/reference/android/webkit/WebView#saveWebArchive(java.lang.String,%20boolean,%20android.webkit.ValueCallback%3Cjava.lang.String%3E))):
  ///    - If [autoname] is `false`, the [filePath] must ends with the [CygnusWebArchiveFormat.MHT] file extension.
  ///- iOS WKWebView 14.0+:
  ///    - If [autoname] is `false`, the [filePath] must ends with the [CygnusWebArchiveFormat.WEBARCHIVE] file extension.
  ///- Linux WPE WebKit ([Official API - webkit_web_view_save_to_file](https://wpewebkit.org/reference/stable/wpe-webkit-2.0/method.WebView.save_to_file.html)):
  ///    - If [autoname] is `false`, the [filePath] must ends with the [CygnusWebArchiveFormat.MHT] file extension.
  ///- macOS WKWebView 11.0+:
  ///    - If [autoname] is `false`, the [filePath] must ends with the [CygnusWebArchiveFormat.WEBARCHIVE] file extension.
  ///
  ///**Parameters - Officially Supported Platforms/Implementations**:
  ///- [filePath]: all platforms
  ///- [autoname]: all platforms
  ///
  ///Use the [CygnusPlatformWebViewController.isMethodSupported] method to check if this method is supported at runtime.
  ///{@endtemplate}
  saveWebArchive,

  ///Can be used to check if the [CygnusPlatformWebViewController.scrollBy] method is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusPlatformWebViewController.scrollBy.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView ([Official API - View.scrollBy](https://developer.android.com/reference/android/view/View#scrollBy(int,%20int)))
  ///- iOS WKWebView ([Official API - UIScrollView.setContentOffset](https://developer.apple.com/documentation/uikit/uiscrollview/1619400-setcontentoffset))
  ///- macOS WKWebView:
  ///    - This method is implemented using JavaScript.
  ///- Linux WPE WebKit
  ///- Web \<iframe\> but requires same origin ([Official API - Window.scrollBy](https://developer.mozilla.org/en-US/docs/Web/API/Window/scrollBy))
  ///- Windows WebView2:
  ///    - This method is implemented using JavaScript.
  ///
  ///**Parameters - Officially Supported Platforms/Implementations**:
  ///- [x]: all platforms
  ///- [y]: all platforms
  ///- [animated]: all platforms
  ///
  ///Use the [CygnusPlatformWebViewController.isMethodSupported] method to check if this method is supported at runtime.
  ///{@endtemplate}
  scrollBy,

  ///Can be used to check if the [CygnusPlatformWebViewController.scrollTo] method is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusPlatformWebViewController.scrollTo.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView ([Official API - View.scrollTo](https://developer.android.com/reference/android/webkit/WebView#scrollTo(int,%20int)))
  ///- iOS WKWebView ([Official API - UIScrollView.setContentOffset](https://developer.apple.com/documentation/uikit/uiscrollview/1619400-setcontentoffset))
  ///- macOS WKWebView:
  ///    - This method is implemented using JavaScript.
  ///- Linux WPE WebKit
  ///- Web \<iframe\> but requires same origin ([Official API - Window.scrollTo](https://developer.mozilla.org/en-US/docs/Web/API/Window/scrollTo))
  ///- Windows WebView2:
  ///    - This method is implemented using JavaScript.
  ///
  ///**Parameters - Officially Supported Platforms/Implementations**:
  ///- [x]: all platforms
  ///- [y]: all platforms
  ///- [animated]: all platforms
  ///
  ///Use the [CygnusPlatformWebViewController.isMethodSupported] method to check if this method is supported at runtime.
  ///{@endtemplate}
  scrollTo,

  ///Can be used to check if the [CygnusPlatformWebViewController.setAllMediaPlaybackSuspended] method is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusPlatformWebViewController.setAllMediaPlaybackSuspended.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- iOS WKWebView 15.0+ ([Official API - WKWebView.setAllMediaPlaybackSuspended](https://developer.apple.com/documentation/webkit/wkwebview/3752242-setallmediaplaybacksuspended))
  ///- macOS WKWebView 12.0+ ([Official API - WKWebView.setAllMediaPlaybackSuspended](https://developer.apple.com/documentation/webkit/wkwebview/3752242-setallmediaplaybacksuspended))
  ///- Linux WPE WebKit ([Official API - JavaScript HTMLMediaElement.pause()/play()](https://developer.mozilla.org/en-US/docs/Web/API/HTMLMediaElement)):
  ///    - Uses JavaScript to suspend/resume all media elements
  ///
  ///**Parameters - Officially Supported Platforms/Implementations**:
  ///- [suspended]: all platforms
  ///
  ///Use the [CygnusPlatformWebViewController.isMethodSupported] method to check if this method is supported at runtime.
  ///{@endtemplate}
  setAllMediaPlaybackSuspended,

  ///Can be used to check if the [CygnusPlatformWebViewController.setCameraCaptureState] method is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusPlatformWebViewController.setCameraCaptureState.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- iOS WKWebView 15.0+ ([Official API - WKWebView.setCameraCaptureState](https://developer.apple.com/documentation/webkit/wkwebview/3763097-setcameracapturestate))
  ///- Linux WPE WebKit 2.34+ ([Official API - webkit_web_view_set_camera_capture_state](https://wpewebkit.org/reference/stable/wpe-webkit-2.0/method.WebView.set_camera_capture_state.html)):
  ///    - Once state is set to NONE, it cannot be changed back. The page can request capture again using the mediaDevices API.
  ///- macOS WKWebView 12.0+ ([Official API - WKWebView.setCameraCaptureState](https://developer.apple.com/documentation/webkit/wkwebview/3763097-setcameracapturestate))
  ///
  ///**Parameters - Officially Supported Platforms/Implementations**:
  ///- [state]: all platforms
  ///
  ///Use the [CygnusPlatformWebViewController.isMethodSupported] method to check if this method is supported at runtime.
  ///{@endtemplate}
  setCameraCaptureState,

  ///Can be used to check if the [CygnusPlatformWebViewController.setContextMenu] method is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusPlatformWebViewController.setContextMenu.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView
  ///- iOS WKWebView
  ///
  ///**Parameters - Officially Supported Platforms/Implementations**:
  ///- [contextMenu]: all platforms
  ///
  ///Use the [CygnusPlatformWebViewController.isMethodSupported] method to check if this method is supported at runtime.
  ///{@endtemplate}
  setContextMenu,

  ///Can be used to check if the [CygnusPlatformWebViewController.setInputMethodEnabled] method is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusPlatformWebViewController.setInputMethodEnabled.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- iOS WKWebView ([Official API - UIResponder.inputView](https://developer.apple.com/documentation/uikit/uiresponder/1621092-inputview))
  ///
  ///**Parameters - Officially Supported Platforms/Implementations**:
  ///- [enabled]: all platforms
  ///
  ///Use the [CygnusPlatformWebViewController.isMethodSupported] method to check if this method is supported at runtime.
  ///{@endtemplate}
  setInputMethodEnabled,

  ///Can be used to check if the [CygnusPlatformWebViewController.setJavaScriptBridgeName] method is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusPlatformWebViewController.setJavaScriptBridgeName.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView
  ///- iOS WKWebView
  ///- macOS WKWebView
  ///- Web \<iframe\> but requires same origin
  ///- Windows WebView2
  ///- Linux WPE WebKit
  ///
  ///**Parameters - Officially Supported Platforms/Implementations**:
  ///- [bridgeName]: all platforms
  ///
  ///Use the [CygnusPlatformWebViewController.isMethodSupported] method to check if this method is supported at runtime.
  ///{@endtemplate}
  setJavaScriptBridgeName,

  ///Can be used to check if the [CygnusPlatformWebViewController.setMemoryUsageTargetLevel] method is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusPlatformWebViewController.setMemoryUsageTargetLevel.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Windows WebView2 ([Official API - ICoreWebView2_19.put_MemoryUsageTargetLevel](https://learn.microsoft.com/en-us/microsoft-edge/webview2/reference/win32/icorewebview2_19?view=webview2-1.0.2849.39#put_memoryusagetargetlevel))
  ///
  ///**Parameters - Officially Supported Platforms/Implementations**:
  ///- [level]: all platforms
  ///
  ///Use the [CygnusPlatformWebViewController.isMethodSupported] method to check if this method is supported at runtime.
  ///{@endtemplate}
  setMemoryUsageTargetLevel,

  ///Can be used to check if the [CygnusPlatformWebViewController.setMicrophoneCaptureState] method is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusPlatformWebViewController.setMicrophoneCaptureState.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- iOS WKWebView 15.0+ ([Official API - WKWebView.setMicrophoneCaptureState](https://developer.apple.com/documentation/webkit/wkwebview/3763098-setmicrophonecapturestate))
  ///- Linux WPE WebKit 2.34+ ([Official API - webkit_web_view_set_microphone_capture_state](https://wpewebkit.org/reference/stable/wpe-webkit-2.0/method.WebView.set_microphone_capture_state.html)):
  ///    - Once state is set to NONE, it cannot be changed back. The page can request capture again using the mediaDevices API.
  ///- macOS WKWebView 12.0+ ([Official API - WKWebView.setMicrophoneCaptureState](https://developer.apple.com/documentation/webkit/wkwebview/3763098-setmicrophonecapturestate))
  ///
  ///**Parameters - Officially Supported Platforms/Implementations**:
  ///- [state]: all platforms
  ///
  ///Use the [CygnusPlatformWebViewController.isMethodSupported] method to check if this method is supported at runtime.
  ///{@endtemplate}
  setMicrophoneCaptureState,

  ///Can be used to check if the [CygnusPlatformWebViewController.setMuted] method is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusPlatformWebViewController.setMuted.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Linux WPE WebKit 2.30+ ([Official API - webkit_web_view_set_is_muted](https://wpewebkit.org/reference/stable/wpe-webkit-2.0/method.WebView.set_is_muted.html))
  ///
  ///**Parameters - Officially Supported Platforms/Implementations**:
  ///- [muted]: all platforms
  ///
  ///Use the [CygnusPlatformWebViewController.isMethodSupported] method to check if this method is supported at runtime.
  ///{@endtemplate}
  setMuted,

  ///Can be used to check if the [CygnusPlatformWebViewController.setOptions] method is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusPlatformWebViewController.setOptions.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView
  ///- iOS WKWebView
  ///- macOS WKWebView
  ///- Web \<iframe\> but requires same origin
  ///- Windows WebView2
  ///
  ///**Parameters - Officially Supported Platforms/Implementations**:
  ///- [options]: all platforms
  ///
  ///Use the [CygnusPlatformWebViewController.isMethodSupported] method to check if this method is supported at runtime.
  ///{@endtemplate}
  @Deprecated('Use setSettings instead')
  setOptions,

  ///Can be used to check if the [CygnusPlatformWebViewController.setSafeBrowsingAllowlist] method is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusPlatformWebViewController.setSafeBrowsingAllowlist.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView ([Official API - WebViewCompat.setSafeBrowsingAllowlist](https://developer.android.com/reference/androidx/webkit/WebViewCompat#setSafeBrowsingAllowlist(java.util.Set%3Cjava.lang.String%3E,%20android.webkit.ValueCallback%3Cjava.lang.Boolean%3E))):
  ///    - This method should only be called if [CygnusWebViewFeature.isFeatureSupported] returns `true` for [CygnusWebViewFeature.SAFE_BROWSING_ALLOWLIST].
  ///
  ///**Parameters - Officially Supported Platforms/Implementations**:
  ///- [hosts]: all platforms
  ///
  ///Use the [CygnusPlatformWebViewController.isMethodSupported] method to check if this method is supported at runtime.
  ///{@endtemplate}
  setSafeBrowsingAllowlist,

  ///Can be used to check if the [CygnusPlatformWebViewController.setSafeBrowsingWhitelist] method is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusPlatformWebViewController.setSafeBrowsingWhitelist.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView
  ///
  ///**Parameters - Officially Supported Platforms/Implementations**:
  ///- [hosts]: all platforms
  ///
  ///Use the [CygnusPlatformWebViewController.isMethodSupported] method to check if this method is supported at runtime.
  ///{@endtemplate}
  @Deprecated('Use setSafeBrowsingAllowlist instead')
  setSafeBrowsingWhitelist,

  ///Can be used to check if the [CygnusPlatformWebViewController.setScreenScale] method is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusPlatformWebViewController.setScreenScale.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Linux WPE WebKit ([Official API - wpe_screen_set_scale](https://wpewebkit.org/reference/stable/wpe-platform-1.0/method.Screen.set_scale.html))
  ///
  ///**Parameters - Officially Supported Platforms/Implementations**:
  ///- [scale]: all platforms
  ///
  ///Use the [CygnusPlatformWebViewController.isMethodSupported] method to check if this method is supported at runtime.
  ///{@endtemplate}
  setScreenScale,

  ///Can be used to check if the [CygnusPlatformWebViewController.setSettings] method is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusPlatformWebViewController.setSettings.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView
  ///- iOS WKWebView
  ///- Linux WPE WebKit
  ///- macOS WKWebView
  ///- Web \<iframe\> but requires same origin
  ///- Windows WebView2
  ///
  ///**Parameters - Officially Supported Platforms/Implementations**:
  ///- [settings]: all platforms
  ///
  ///Use the [CygnusPlatformWebViewController.isMethodSupported] method to check if this method is supported at runtime.
  ///{@endtemplate}
  setSettings,

  ///Can be used to check if the [CygnusPlatformWebViewController.setTargetRefreshRate] method is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusPlatformWebViewController.setTargetRefreshRate.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Linux WPE WebKit
  ///
  ///**Parameters - Officially Supported Platforms/Implementations**:
  ///- [rate]: all platforms
  ///
  ///Use the [CygnusPlatformWebViewController.isMethodSupported] method to check if this method is supported at runtime.
  ///{@endtemplate}
  setTargetRefreshRate,

  ///Can be used to check if the [CygnusPlatformWebViewController.setVisible] method is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusPlatformWebViewController.setVisible.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Linux WPE WebKit
  ///
  ///**Parameters - Officially Supported Platforms/Implementations**:
  ///- [visible]: all platforms
  ///
  ///Use the [CygnusPlatformWebViewController.isMethodSupported] method to check if this method is supported at runtime.
  ///{@endtemplate}
  setVisible,

  ///Can be used to check if the [CygnusPlatformWebViewController.setWebContentsDebuggingEnabled] method is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusPlatformWebViewController.setWebContentsDebuggingEnabled.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView ([Official API - WebView.setWebContentsDebuggingEnabled](https://developer.android.com/reference/android/webkit/WebView#setWebContentsDebuggingEnabled(boolean)))
  ///
  ///**Parameters - Officially Supported Platforms/Implementations**:
  ///- [debuggingEnabled]: all platforms
  ///
  ///Use the [CygnusPlatformWebViewController.isMethodSupported] method to check if this method is supported at runtime.
  ///{@endtemplate}
  setWebContentsDebuggingEnabled,

  ///Can be used to check if the [CygnusPlatformWebViewController.showInputMethod] method is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusPlatformWebViewController.showInputMethod.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView ([Official API - InputMethodManager.showSoftInput](https://developer.android.com/reference/android/view/inputmethod/InputMethodManager#showSoftInput(android.view.View,%20int)))
  ///
  ///Use the [CygnusPlatformWebViewController.isMethodSupported] method to check if this method is supported at runtime.
  ///{@endtemplate}
  showInputMethod,

  ///Can be used to check if the [CygnusPlatformWebViewController.showSaveAsUI] method is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusPlatformWebViewController.showSaveAsUI.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Windows WebView2 ([Official API - ICoreWebView2_25.ShowSaveAsUI](https://learn.microsoft.com/en-us/microsoft-edge/webview2/reference/win32/icorewebview2_25?view=webview2-1.0.2849.39#showsaveasui))
  ///
  ///Use the [CygnusPlatformWebViewController.isMethodSupported] method to check if this method is supported at runtime.
  ///{@endtemplate}
  showSaveAsUI,

  ///Can be used to check if the [CygnusPlatformWebViewController.startSafeBrowsing] method is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusPlatformWebViewController.startSafeBrowsing.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView ([Official API - WebView.startSafeBrowsing](https://developer.android.com/reference/android/webkit/WebView#startSafeBrowsing(android.content.Context,%20android.webkit.ValueCallback%3Cjava.lang.Boolean%3E))):
  ///    - This method should only be called if [CygnusWebViewFeature.isFeatureSupported] returns `true` for [CygnusWebViewFeature.START_SAFE_BROWSING].
  ///
  ///Use the [CygnusPlatformWebViewController.isMethodSupported] method to check if this method is supported at runtime.
  ///{@endtemplate}
  startSafeBrowsing,

  ///Can be used to check if the [CygnusPlatformWebViewController.stopLoading] method is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusPlatformWebViewController.stopLoading.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView ([Official API - WebView.stopLoading](https://developer.android.com/reference/android/webkit/WebView#stopLoading()))
  ///- iOS WKWebView ([Official API - WKWebView.stopLoading](https://developer.apple.com/documentation/webkit/wkwebview/1414981-stoploading))
  ///- macOS WKWebView ([Official API - WKWebView.stopLoading](https://developer.apple.com/documentation/webkit/wkwebview/1414981-stoploading))
  ///- Web \<iframe\> but requires same origin ([Official API - Window.stop](https://developer.mozilla.org/en-US/docs/Web/API/Window/stop))
  ///- Windows WebView2 ([Official API - ICoreWebView2.Stop](https://learn.microsoft.com/en-us/microsoft-edge/webview2/reference/win32/icorewebview2?view=webview2-1.0.2210.55#stop))
  ///- Linux WPE WebKit ([Official API - webkit_web_view_stop_loading](https://wpewebkit.org/reference/stable/wpe-webkit-2.0/method.WebView.stop_loading.html))
  ///
  ///Use the [CygnusPlatformWebViewController.isMethodSupported] method to check if this method is supported at runtime.
  ///{@endtemplate}
  stopLoading,

  ///Can be used to check if the [CygnusPlatformWebViewController.takeScreenshot] method is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusPlatformWebViewController.takeScreenshot.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView:
  ///    - To be able to take screenshots outside the visible viewport, you must call [CygnusPlatformWebViewController.enableSlowWholeDocumentDraw] before any WebViews are created.
  ///- iOS WKWebView 11.0+ ([Official API - WKWebView.takeSnapshot](https://developer.apple.com/documentation/webkit/wkwebview/2873260-takesnapshot))
  ///- macOS WKWebView 10.13+ ([Official API - WKWebView.takeSnapshot](https://developer.apple.com/documentation/webkit/wkwebview/2873260-takesnapshot))
  ///- Windows WebView2
  ///- Linux WPE WebKit
  ///
  ///**Parameters - Officially Supported Platforms/Implementations**:
  ///- [screenshotConfiguration]: all platforms
  ///
  ///Use the [CygnusPlatformWebViewController.isMethodSupported] method to check if this method is supported at runtime.
  ///{@endtemplate}
  takeScreenshot,

  ///Can be used to check if the [CygnusPlatformWebViewController.terminateWebProcess] method is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusPlatformWebViewController.terminateWebProcess.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Linux WPE WebKit 2.34+ ([Official API - webkit_web_view_terminate_web_process](https://wpewebkit.org/reference/stable/wpe-webkit-2.0/method.WebView.terminate_web_process.html))
  ///
  ///Use the [CygnusPlatformWebViewController.isMethodSupported] method to check if this method is supported at runtime.
  ///{@endtemplate}
  terminateWebProcess,

  ///Can be used to check if the [CygnusPlatformWebViewController.zoomBy] method is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusPlatformWebViewController.zoomBy.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView 21+ ([Official API - WebView.zoomBy](https://developer.android.com/reference/android/webkit/WebView#zoomBy(float)))
  ///- iOS WKWebView ([Official API - UIScrollView.setZoomScale](https://developer.apple.com/documentation/uikit/uiscrollview/1619412-setzoomscale))
  ///- Linux WPE WebKit ([Official API - webkit_web_view_set_zoom_level](https://wpewebkit.org/reference/stable/wpe-webkit-2.0/method.WebView.set_zoom_level.html))
  ///
  ///**Parameters - Officially Supported Platforms/Implementations**:
  ///- [zoomFactor]: all platforms
  ///- [animated]:
  ///    - iOS WKWebView
  ///
  ///Use the [CygnusPlatformWebViewController.isMethodSupported] method to check if this method is supported at runtime.
  ///{@endtemplate}
  zoomBy,

  ///Can be used to check if the [CygnusPlatformWebViewController.zoomIn] method is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusPlatformWebViewController.zoomIn.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView ([Official API - WebView.zoomIn](https://developer.android.com/reference/android/webkit/WebView#zoomIn()))
  ///
  ///Use the [CygnusPlatformWebViewController.isMethodSupported] method to check if this method is supported at runtime.
  ///{@endtemplate}
  zoomIn,

  ///Can be used to check if the [CygnusPlatformWebViewController.zoomOut] method is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusPlatformWebViewController.zoomOut.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView ([Official API - WebView.zoomOut](https://developer.android.com/reference/android/webkit/WebView#zoomOut()))
  ///
  ///Use the [CygnusPlatformWebViewController.isMethodSupported] method to check if this method is supported at runtime.
  ///{@endtemplate}
  zoomOut,
}

extension _CygnusPlatformWebViewControllerMethodSupported
    on CygnusPlatformWebViewController {
  static bool isMethodSupported(
    CygnusPlatformWebViewControllerMethod method, {
    TargetPlatform? platform,
  }) {
    switch (method) {
      case CygnusPlatformWebViewControllerMethod
          .addDevToolsProtocolEventListener:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [
              TargetPlatform.windows,
            ].contains(platform ?? defaultTargetPlatform);
      case CygnusPlatformWebViewControllerMethod.addJavaScriptHandler:
        return kIsWeb && platform == null
            ? true
            : ((kIsWeb && platform != null) || !kIsWeb) &&
                  [
                    TargetPlatform.android,
                    TargetPlatform.iOS,
                    TargetPlatform.macOS,
                    TargetPlatform.windows,
                  ].contains(platform ?? defaultTargetPlatform);
      case CygnusPlatformWebViewControllerMethod.addUserScript:
        return kIsWeb && platform == null
            ? true
            : ((kIsWeb && platform != null) || !kIsWeb) &&
                  [
                    TargetPlatform.android,
                    TargetPlatform.iOS,
                    TargetPlatform.linux,
                    TargetPlatform.macOS,
                    TargetPlatform.windows,
                  ].contains(platform ?? defaultTargetPlatform);
      case CygnusPlatformWebViewControllerMethod.addUserScripts:
        return kIsWeb && platform == null
            ? true
            : ((kIsWeb && platform != null) || !kIsWeb) &&
                  [
                    TargetPlatform.android,
                    TargetPlatform.iOS,
                    TargetPlatform.linux,
                    TargetPlatform.macOS,
                    TargetPlatform.windows,
                  ].contains(platform ?? defaultTargetPlatform);
      case CygnusPlatformWebViewControllerMethod.addWebMessageListener:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [
              TargetPlatform.android,
              TargetPlatform.iOS,
              TargetPlatform.linux,
              TargetPlatform.macOS,
              TargetPlatform.windows,
            ].contains(platform ?? defaultTargetPlatform);
      case CygnusPlatformWebViewControllerMethod.callAsyncJavaScript:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [
              TargetPlatform.android,
              TargetPlatform.iOS,
              TargetPlatform.macOS,
              TargetPlatform.windows,
              TargetPlatform.linux,
            ].contains(platform ?? defaultTargetPlatform);
      case CygnusPlatformWebViewControllerMethod.callDevToolsProtocolMethod:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [
              TargetPlatform.windows,
            ].contains(platform ?? defaultTargetPlatform);
      case CygnusPlatformWebViewControllerMethod.canGoBack:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [
              TargetPlatform.android,
              TargetPlatform.iOS,
              TargetPlatform.macOS,
              TargetPlatform.windows,
              TargetPlatform.linux,
            ].contains(platform ?? defaultTargetPlatform);
      case CygnusPlatformWebViewControllerMethod.canGoBackOrForward:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [
              TargetPlatform.android,
              TargetPlatform.iOS,
              TargetPlatform.macOS,
              TargetPlatform.linux,
              TargetPlatform.windows,
            ].contains(platform ?? defaultTargetPlatform);
      case CygnusPlatformWebViewControllerMethod.canGoForward:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [
              TargetPlatform.android,
              TargetPlatform.iOS,
              TargetPlatform.macOS,
              TargetPlatform.windows,
              TargetPlatform.linux,
            ].contains(platform ?? defaultTargetPlatform);
      case CygnusPlatformWebViewControllerMethod.canScrollHorizontally:
        return kIsWeb && platform == null
            ? true
            : ((kIsWeb && platform != null) || !kIsWeb) &&
                  [
                    TargetPlatform.android,
                    TargetPlatform.iOS,
                    TargetPlatform.linux,
                    TargetPlatform.macOS,
                  ].contains(platform ?? defaultTargetPlatform);
      case CygnusPlatformWebViewControllerMethod.canScrollVertically:
        return kIsWeb && platform == null
            ? true
            : ((kIsWeb && platform != null) || !kIsWeb) &&
                  [
                    TargetPlatform.android,
                    TargetPlatform.iOS,
                    TargetPlatform.linux,
                    TargetPlatform.macOS,
                  ].contains(platform ?? defaultTargetPlatform);
      case CygnusPlatformWebViewControllerMethod.clearAllCache:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [
              TargetPlatform.android,
              TargetPlatform.iOS,
              TargetPlatform.macOS,
              TargetPlatform.linux,
            ].contains(platform ?? defaultTargetPlatform);
      case CygnusPlatformWebViewControllerMethod.clearCache:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [
              TargetPlatform.android,
              TargetPlatform.iOS,
              TargetPlatform.macOS,
            ].contains(platform ?? defaultTargetPlatform);
      case CygnusPlatformWebViewControllerMethod.clearClientCertPreferences:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [
              TargetPlatform.android,
            ].contains(platform ?? defaultTargetPlatform);
      case CygnusPlatformWebViewControllerMethod.clearFocus:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [
              TargetPlatform.android,
              TargetPlatform.iOS,
              TargetPlatform.macOS,
              TargetPlatform.linux,
            ].contains(platform ?? defaultTargetPlatform);
      case CygnusPlatformWebViewControllerMethod.clearFormData:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [
              TargetPlatform.android,
            ].contains(platform ?? defaultTargetPlatform);
      case CygnusPlatformWebViewControllerMethod.clearHistory:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [
              TargetPlatform.android,
            ].contains(platform ?? defaultTargetPlatform);
      case CygnusPlatformWebViewControllerMethod.clearMatches:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [
              TargetPlatform.android,
              TargetPlatform.iOS,
              TargetPlatform.macOS,
            ].contains(platform ?? defaultTargetPlatform);
      case CygnusPlatformWebViewControllerMethod.clearSslPreferences:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [
              TargetPlatform.android,
              TargetPlatform.windows,
            ].contains(platform ?? defaultTargetPlatform);
      case CygnusPlatformWebViewControllerMethod.closeAllMediaPresentations:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [
              TargetPlatform.iOS,
              TargetPlatform.macOS,
              TargetPlatform.linux,
            ].contains(platform ?? defaultTargetPlatform);
      case CygnusPlatformWebViewControllerMethod.createPdf:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [
              TargetPlatform.iOS,
              TargetPlatform.macOS,
              TargetPlatform.windows,
            ].contains(platform ?? defaultTargetPlatform);
      case CygnusPlatformWebViewControllerMethod.createWebArchiveData:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [
              TargetPlatform.iOS,
              TargetPlatform.macOS,
            ].contains(platform ?? defaultTargetPlatform);
      case CygnusPlatformWebViewControllerMethod.createWebMessageChannel:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [
              TargetPlatform.android,
              TargetPlatform.iOS,
              TargetPlatform.macOS,
              TargetPlatform.linux,
              TargetPlatform.windows,
            ].contains(platform ?? defaultTargetPlatform);
      case CygnusPlatformWebViewControllerMethod.disableWebView:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [
              TargetPlatform.android,
            ].contains(platform ?? defaultTargetPlatform);
      case CygnusPlatformWebViewControllerMethod.dispose:
        return kIsWeb && platform == null
            ? true
            : ((kIsWeb && platform != null) || !kIsWeb) &&
                  [
                    TargetPlatform.android,
                    TargetPlatform.iOS,
                    TargetPlatform.macOS,
                    TargetPlatform.windows,
                  ].contains(platform ?? defaultTargetPlatform);
      case CygnusPlatformWebViewControllerMethod.disposeKeepAlive:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [
              TargetPlatform.android,
              TargetPlatform.iOS,
              TargetPlatform.macOS,
              TargetPlatform.windows,
              TargetPlatform.linux,
            ].contains(platform ?? defaultTargetPlatform);
      case CygnusPlatformWebViewControllerMethod.enableSlowWholeDocumentDraw:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [
              TargetPlatform.android,
            ].contains(platform ?? defaultTargetPlatform);
      case CygnusPlatformWebViewControllerMethod.evaluateJavascript:
        return kIsWeb && platform == null
            ? true
            : ((kIsWeb && platform != null) || !kIsWeb) &&
                  [
                    TargetPlatform.android,
                    TargetPlatform.iOS,
                    TargetPlatform.macOS,
                    TargetPlatform.windows,
                    TargetPlatform.linux,
                  ].contains(platform ?? defaultTargetPlatform);
      case CygnusPlatformWebViewControllerMethod.findAllAsync:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [
              TargetPlatform.android,
              TargetPlatform.iOS,
              TargetPlatform.macOS,
            ].contains(platform ?? defaultTargetPlatform);
      case CygnusPlatformWebViewControllerMethod.findNext:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [
              TargetPlatform.android,
              TargetPlatform.iOS,
              TargetPlatform.macOS,
            ].contains(platform ?? defaultTargetPlatform);
      case CygnusPlatformWebViewControllerMethod.getCameraCaptureState:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [
              TargetPlatform.iOS,
              TargetPlatform.linux,
              TargetPlatform.macOS,
            ].contains(platform ?? defaultTargetPlatform);
      case CygnusPlatformWebViewControllerMethod.getCertificate:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [
              TargetPlatform.android,
              TargetPlatform.iOS,
              TargetPlatform.macOS,
              TargetPlatform.windows,
              TargetPlatform.linux,
            ].contains(platform ?? defaultTargetPlatform);
      case CygnusPlatformWebViewControllerMethod.getContentHeight:
        return kIsWeb && platform == null
            ? true
            : ((kIsWeb && platform != null) || !kIsWeb) &&
                  [
                    TargetPlatform.android,
                    TargetPlatform.iOS,
                    TargetPlatform.macOS,
                    TargetPlatform.linux,
                    TargetPlatform.windows,
                  ].contains(platform ?? defaultTargetPlatform);
      case CygnusPlatformWebViewControllerMethod.getContentWidth:
        return kIsWeb && platform == null
            ? true
            : ((kIsWeb && platform != null) || !kIsWeb) &&
                  [
                    TargetPlatform.android,
                    TargetPlatform.iOS,
                    TargetPlatform.macOS,
                    TargetPlatform.linux,
                    TargetPlatform.windows,
                  ].contains(platform ?? defaultTargetPlatform);
      case CygnusPlatformWebViewControllerMethod.getCopyBackForwardList:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [
              TargetPlatform.android,
              TargetPlatform.iOS,
              TargetPlatform.macOS,
              TargetPlatform.windows,
              TargetPlatform.linux,
            ].contains(platform ?? defaultTargetPlatform);
      case CygnusPlatformWebViewControllerMethod.getCurrentWebViewPackage:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [
              TargetPlatform.android,
            ].contains(platform ?? defaultTargetPlatform);
      case CygnusPlatformWebViewControllerMethod.getDefaultUserAgent:
        return kIsWeb && platform == null
            ? true
            : ((kIsWeb && platform != null) || !kIsWeb) &&
                  [
                    TargetPlatform.android,
                    TargetPlatform.iOS,
                    TargetPlatform.macOS,
                  ].contains(platform ?? defaultTargetPlatform);
      case CygnusPlatformWebViewControllerMethod.getFavicon:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [
              TargetPlatform.windows,
            ].contains(platform ?? defaultTargetPlatform);
      case CygnusPlatformWebViewControllerMethod.getFavicons:
        return kIsWeb && platform == null
            ? true
            : ((kIsWeb && platform != null) || !kIsWeb) &&
                  [
                    TargetPlatform.android,
                    TargetPlatform.iOS,
                    TargetPlatform.macOS,
                    TargetPlatform.windows,
                    TargetPlatform.linux,
                  ].contains(platform ?? defaultTargetPlatform);
      case CygnusPlatformWebViewControllerMethod.getFrameId:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [
              TargetPlatform.windows,
            ].contains(platform ?? defaultTargetPlatform);
      case CygnusPlatformWebViewControllerMethod.getHitTestResult:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [
              TargetPlatform.android,
              TargetPlatform.iOS,
              TargetPlatform.linux,
            ].contains(platform ?? defaultTargetPlatform);
      case CygnusPlatformWebViewControllerMethod.getHtml:
        return kIsWeb && platform == null
            ? true
            : ((kIsWeb && platform != null) || !kIsWeb) &&
                  [
                    TargetPlatform.android,
                    TargetPlatform.iOS,
                    TargetPlatform.linux,
                    TargetPlatform.macOS,
                    TargetPlatform.windows,
                  ].contains(platform ?? defaultTargetPlatform);
      case CygnusPlatformWebViewControllerMethod.getIFrameId:
        return kIsWeb && platform == null
            ? true
            : ((kIsWeb && platform != null) || !kIsWeb) &&
                  [].contains(platform ?? defaultTargetPlatform);
      case CygnusPlatformWebViewControllerMethod.getJavaScriptBridgeName:
        return kIsWeb && platform == null
            ? true
            : ((kIsWeb && platform != null) || !kIsWeb) &&
                  [
                    TargetPlatform.android,
                    TargetPlatform.iOS,
                    TargetPlatform.macOS,
                    TargetPlatform.windows,
                    TargetPlatform.linux,
                  ].contains(platform ?? defaultTargetPlatform);
      case CygnusPlatformWebViewControllerMethod.getMemoryUsageTargetLevel:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [
              TargetPlatform.windows,
            ].contains(platform ?? defaultTargetPlatform);
      case CygnusPlatformWebViewControllerMethod.getMetaTags:
        return kIsWeb && platform == null
            ? true
            : ((kIsWeb && platform != null) || !kIsWeb) &&
                  [
                    TargetPlatform.android,
                    TargetPlatform.iOS,
                    TargetPlatform.linux,
                    TargetPlatform.macOS,
                    TargetPlatform.windows,
                  ].contains(platform ?? defaultTargetPlatform);
      case CygnusPlatformWebViewControllerMethod.getMetaThemeColor:
        return kIsWeb && platform == null
            ? true
            : ((kIsWeb && platform != null) || !kIsWeb) &&
                  [
                    TargetPlatform.android,
                    TargetPlatform.iOS,
                    TargetPlatform.linux,
                    TargetPlatform.macOS,
                    TargetPlatform.windows,
                  ].contains(platform ?? defaultTargetPlatform);
      case CygnusPlatformWebViewControllerMethod.getMicrophoneCaptureState:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [
              TargetPlatform.iOS,
              TargetPlatform.linux,
              TargetPlatform.macOS,
            ].contains(platform ?? defaultTargetPlatform);
      case CygnusPlatformWebViewControllerMethod.getOptions:
        return kIsWeb && platform == null
            ? true
            : ((kIsWeb && platform != null) || !kIsWeb) &&
                  [
                    TargetPlatform.android,
                    TargetPlatform.iOS,
                    TargetPlatform.macOS,
                    TargetPlatform.windows,
                  ].contains(platform ?? defaultTargetPlatform);
      case CygnusPlatformWebViewControllerMethod.getOriginalUrl:
        return kIsWeb && platform == null
            ? true
            : ((kIsWeb && platform != null) || !kIsWeb) &&
                  [
                    TargetPlatform.android,
                    TargetPlatform.iOS,
                    TargetPlatform.linux,
                    TargetPlatform.macOS,
                    TargetPlatform.windows,
                  ].contains(platform ?? defaultTargetPlatform);
      case CygnusPlatformWebViewControllerMethod.getProgress:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [
              TargetPlatform.android,
              TargetPlatform.iOS,
              TargetPlatform.macOS,
              TargetPlatform.linux,
              TargetPlatform.windows,
            ].contains(platform ?? defaultTargetPlatform);
      case CygnusPlatformWebViewControllerMethod
          .getSafeBrowsingPrivacyPolicyUrl:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [
              TargetPlatform.android,
            ].contains(platform ?? defaultTargetPlatform);
      case CygnusPlatformWebViewControllerMethod.getScale:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [
              TargetPlatform.android,
              TargetPlatform.iOS,
              TargetPlatform.macOS,
            ].contains(platform ?? defaultTargetPlatform);
      case CygnusPlatformWebViewControllerMethod.getScreenScale:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [TargetPlatform.linux].contains(platform ?? defaultTargetPlatform);
      case CygnusPlatformWebViewControllerMethod.getScrollX:
        return kIsWeb && platform == null
            ? true
            : ((kIsWeb && platform != null) || !kIsWeb) &&
                  [
                    TargetPlatform.android,
                    TargetPlatform.iOS,
                    TargetPlatform.macOS,
                    TargetPlatform.linux,
                    TargetPlatform.windows,
                  ].contains(platform ?? defaultTargetPlatform);
      case CygnusPlatformWebViewControllerMethod.getScrollY:
        return kIsWeb && platform == null
            ? true
            : ((kIsWeb && platform != null) || !kIsWeb) &&
                  [
                    TargetPlatform.android,
                    TargetPlatform.iOS,
                    TargetPlatform.macOS,
                    TargetPlatform.linux,
                    TargetPlatform.windows,
                  ].contains(platform ?? defaultTargetPlatform);
      case CygnusPlatformWebViewControllerMethod.getSelectedText:
        return kIsWeb && platform == null
            ? true
            : ((kIsWeb && platform != null) || !kIsWeb) &&
                  [
                    TargetPlatform.android,
                    TargetPlatform.iOS,
                    TargetPlatform.linux,
                    TargetPlatform.macOS,
                  ].contains(platform ?? defaultTargetPlatform);
      case CygnusPlatformWebViewControllerMethod.getSettings:
        return kIsWeb && platform == null
            ? true
            : ((kIsWeb && platform != null) || !kIsWeb) &&
                  [
                    TargetPlatform.android,
                    TargetPlatform.iOS,
                    TargetPlatform.linux,
                    TargetPlatform.macOS,
                    TargetPlatform.windows,
                  ].contains(platform ?? defaultTargetPlatform);
      case CygnusPlatformWebViewControllerMethod.getTRexRunnerCss:
        return kIsWeb && platform == null
            ? true
            : ((kIsWeb && platform != null) || !kIsWeb) &&
                  [
                    TargetPlatform.android,
                    TargetPlatform.iOS,
                    TargetPlatform.macOS,
                    TargetPlatform.windows,
                  ].contains(platform ?? defaultTargetPlatform);
      case CygnusPlatformWebViewControllerMethod.getTRexRunnerHtml:
        return kIsWeb && platform == null
            ? true
            : ((kIsWeb && platform != null) || !kIsWeb) &&
                  [
                    TargetPlatform.android,
                    TargetPlatform.iOS,
                    TargetPlatform.macOS,
                    TargetPlatform.windows,
                  ].contains(platform ?? defaultTargetPlatform);
      case CygnusPlatformWebViewControllerMethod.getTargetRefreshRate:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [TargetPlatform.linux].contains(platform ?? defaultTargetPlatform);
      case CygnusPlatformWebViewControllerMethod.getTitle:
        return kIsWeb && platform == null
            ? true
            : ((kIsWeb && platform != null) || !kIsWeb) &&
                  [
                    TargetPlatform.android,
                    TargetPlatform.iOS,
                    TargetPlatform.macOS,
                    TargetPlatform.windows,
                    TargetPlatform.linux,
                  ].contains(platform ?? defaultTargetPlatform);
      case CygnusPlatformWebViewControllerMethod.getUrl:
        return kIsWeb && platform == null
            ? true
            : ((kIsWeb && platform != null) || !kIsWeb) &&
                  [
                    TargetPlatform.android,
                    TargetPlatform.iOS,
                    TargetPlatform.macOS,
                    TargetPlatform.windows,
                    TargetPlatform.linux,
                  ].contains(platform ?? defaultTargetPlatform);
      case CygnusPlatformWebViewControllerMethod.getVariationsHeader:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [
              TargetPlatform.android,
            ].contains(platform ?? defaultTargetPlatform);
      case CygnusPlatformWebViewControllerMethod.getViewId:
        return kIsWeb && platform == null
            ? true
            : ((kIsWeb && platform != null) || !kIsWeb) &&
                  [
                    TargetPlatform.android,
                    TargetPlatform.iOS,
                    TargetPlatform.macOS,
                    TargetPlatform.windows,
                  ].contains(platform ?? defaultTargetPlatform);
      case CygnusPlatformWebViewControllerMethod.getZoomScale:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [
              TargetPlatform.android,
              TargetPlatform.iOS,
              TargetPlatform.linux,
              TargetPlatform.windows,
            ].contains(platform ?? defaultTargetPlatform);
      case CygnusPlatformWebViewControllerMethod.goBack:
        return kIsWeb && platform == null
            ? true
            : ((kIsWeb && platform != null) || !kIsWeb) &&
                  [
                    TargetPlatform.android,
                    TargetPlatform.iOS,
                    TargetPlatform.macOS,
                    TargetPlatform.windows,
                    TargetPlatform.linux,
                  ].contains(platform ?? defaultTargetPlatform);
      case CygnusPlatformWebViewControllerMethod.goBackOrForward:
        return kIsWeb && platform == null
            ? true
            : ((kIsWeb && platform != null) || !kIsWeb) &&
                  [
                    TargetPlatform.android,
                    TargetPlatform.iOS,
                    TargetPlatform.macOS,
                    TargetPlatform.windows,
                    TargetPlatform.linux,
                  ].contains(platform ?? defaultTargetPlatform);
      case CygnusPlatformWebViewControllerMethod.goForward:
        return kIsWeb && platform == null
            ? true
            : ((kIsWeb && platform != null) || !kIsWeb) &&
                  [
                    TargetPlatform.android,
                    TargetPlatform.iOS,
                    TargetPlatform.macOS,
                    TargetPlatform.windows,
                    TargetPlatform.linux,
                  ].contains(platform ?? defaultTargetPlatform);
      case CygnusPlatformWebViewControllerMethod.goTo:
        return kIsWeb && platform == null
            ? true
            : ((kIsWeb && platform != null) || !kIsWeb) &&
                  [
                    TargetPlatform.android,
                    TargetPlatform.iOS,
                    TargetPlatform.macOS,
                    TargetPlatform.windows,
                  ].contains(platform ?? defaultTargetPlatform);
      case CygnusPlatformWebViewControllerMethod.handlesURLScheme:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [
              TargetPlatform.iOS,
              TargetPlatform.macOS,
              TargetPlatform.linux,
            ].contains(platform ?? defaultTargetPlatform);
      case CygnusPlatformWebViewControllerMethod.hasJavaScriptHandler:
        return kIsWeb && platform == null
            ? true
            : ((kIsWeb && platform != null) || !kIsWeb) &&
                  [
                    TargetPlatform.android,
                    TargetPlatform.iOS,
                    TargetPlatform.macOS,
                    TargetPlatform.windows,
                  ].contains(platform ?? defaultTargetPlatform);
      case CygnusPlatformWebViewControllerMethod.hasOnlySecureContent:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [
              TargetPlatform.iOS,
              TargetPlatform.macOS,
            ].contains(platform ?? defaultTargetPlatform);
      case CygnusPlatformWebViewControllerMethod.hasUserScript:
        return kIsWeb && platform == null
            ? true
            : ((kIsWeb && platform != null) || !kIsWeb) &&
                  [
                    TargetPlatform.android,
                    TargetPlatform.iOS,
                    TargetPlatform.macOS,
                    TargetPlatform.windows,
                  ].contains(platform ?? defaultTargetPlatform);
      case CygnusPlatformWebViewControllerMethod.hasWebMessageListener:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [
              TargetPlatform.android,
              TargetPlatform.iOS,
              TargetPlatform.linux,
              TargetPlatform.macOS,
            ].contains(platform ?? defaultTargetPlatform);
      case CygnusPlatformWebViewControllerMethod.hideInputMethod:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [
              TargetPlatform.android,
              TargetPlatform.iOS,
            ].contains(platform ?? defaultTargetPlatform);
      case CygnusPlatformWebViewControllerMethod.injectCSSCode:
        return kIsWeb && platform == null
            ? true
            : ((kIsWeb && platform != null) || !kIsWeb) &&
                  [
                    TargetPlatform.android,
                    TargetPlatform.iOS,
                    TargetPlatform.linux,
                    TargetPlatform.macOS,
                    TargetPlatform.windows,
                  ].contains(platform ?? defaultTargetPlatform);
      case CygnusPlatformWebViewControllerMethod.injectCSSFileFromAsset:
        return kIsWeb && platform == null
            ? true
            : ((kIsWeb && platform != null) || !kIsWeb) &&
                  [
                    TargetPlatform.android,
                    TargetPlatform.iOS,
                    TargetPlatform.macOS,
                  ].contains(platform ?? defaultTargetPlatform);
      case CygnusPlatformWebViewControllerMethod.injectCSSFileFromUrl:
        return kIsWeb && platform == null
            ? true
            : ((kIsWeb && platform != null) || !kIsWeb) &&
                  [
                    TargetPlatform.android,
                    TargetPlatform.iOS,
                    TargetPlatform.linux,
                    TargetPlatform.macOS,
                    TargetPlatform.windows,
                  ].contains(platform ?? defaultTargetPlatform);
      case CygnusPlatformWebViewControllerMethod.injectJavascriptFileFromAsset:
        return kIsWeb && platform == null
            ? true
            : ((kIsWeb && platform != null) || !kIsWeb) &&
                  [
                    TargetPlatform.android,
                    TargetPlatform.iOS,
                    TargetPlatform.macOS,
                    TargetPlatform.windows,
                  ].contains(platform ?? defaultTargetPlatform);
      case CygnusPlatformWebViewControllerMethod.injectJavascriptFileFromUrl:
        return kIsWeb && platform == null
            ? true
            : ((kIsWeb && platform != null) || !kIsWeb) &&
                  [
                    TargetPlatform.android,
                    TargetPlatform.iOS,
                    TargetPlatform.linux,
                    TargetPlatform.macOS,
                  ].contains(platform ?? defaultTargetPlatform);
      case CygnusPlatformWebViewControllerMethod.isInFullscreen:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [
              TargetPlatform.android,
              TargetPlatform.iOS,
              TargetPlatform.macOS,
              TargetPlatform.linux,
            ].contains(platform ?? defaultTargetPlatform);
      case CygnusPlatformWebViewControllerMethod.isInterfaceSupported:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [
              TargetPlatform.windows,
            ].contains(platform ?? defaultTargetPlatform);
      case CygnusPlatformWebViewControllerMethod.isLoading:
        return kIsWeb && platform == null
            ? true
            : ((kIsWeb && platform != null) || !kIsWeb) &&
                  [
                    TargetPlatform.android,
                    TargetPlatform.iOS,
                    TargetPlatform.linux,
                    TargetPlatform.macOS,
                    TargetPlatform.windows,
                  ].contains(platform ?? defaultTargetPlatform);
      case CygnusPlatformWebViewControllerMethod.isMultiProcessEnabled:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [
              TargetPlatform.android,
            ].contains(platform ?? defaultTargetPlatform);
      case CygnusPlatformWebViewControllerMethod.isMuted:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [TargetPlatform.linux].contains(platform ?? defaultTargetPlatform);
      case CygnusPlatformWebViewControllerMethod.isPlayingAudio:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [TargetPlatform.linux].contains(platform ?? defaultTargetPlatform);
      case CygnusPlatformWebViewControllerMethod.isSecureContext:
        return kIsWeb && platform == null
            ? true
            : ((kIsWeb && platform != null) || !kIsWeb) &&
                  [
                    TargetPlatform.android,
                    TargetPlatform.iOS,
                    TargetPlatform.linux,
                    TargetPlatform.macOS,
                    TargetPlatform.windows,
                  ].contains(platform ?? defaultTargetPlatform);
      case CygnusPlatformWebViewControllerMethod.isVisible:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [TargetPlatform.linux].contains(platform ?? defaultTargetPlatform);
      case CygnusPlatformWebViewControllerMethod.loadData:
        return kIsWeb && platform == null
            ? true
            : ((kIsWeb && platform != null) || !kIsWeb) &&
                  [
                    TargetPlatform.android,
                    TargetPlatform.iOS,
                    TargetPlatform.macOS,
                    TargetPlatform.windows,
                    TargetPlatform.linux,
                  ].contains(platform ?? defaultTargetPlatform);
      case CygnusPlatformWebViewControllerMethod.loadFile:
        return kIsWeb && platform == null
            ? true
            : ((kIsWeb && platform != null) || !kIsWeb) &&
                  [
                    TargetPlatform.android,
                    TargetPlatform.iOS,
                    TargetPlatform.macOS,
                    TargetPlatform.windows,
                    TargetPlatform.linux,
                  ].contains(platform ?? defaultTargetPlatform);
      case CygnusPlatformWebViewControllerMethod.loadSimulatedRequest:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [
              TargetPlatform.iOS,
              TargetPlatform.macOS,
            ].contains(platform ?? defaultTargetPlatform);
      case CygnusPlatformWebViewControllerMethod.loadUrl:
        return kIsWeb && platform == null
            ? true
            : ((kIsWeb && platform != null) || !kIsWeb) &&
                  [
                    TargetPlatform.android,
                    TargetPlatform.iOS,
                    TargetPlatform.macOS,
                    TargetPlatform.windows,
                    TargetPlatform.linux,
                  ].contains(platform ?? defaultTargetPlatform);
      case CygnusPlatformWebViewControllerMethod.openDevTools:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [
              TargetPlatform.windows,
            ].contains(platform ?? defaultTargetPlatform);
      case CygnusPlatformWebViewControllerMethod.pageDown:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [
              TargetPlatform.android,
            ].contains(platform ?? defaultTargetPlatform);
      case CygnusPlatformWebViewControllerMethod.pageUp:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [
              TargetPlatform.android,
            ].contains(platform ?? defaultTargetPlatform);
      case CygnusPlatformWebViewControllerMethod.pause:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [
              TargetPlatform.android,
              TargetPlatform.windows,
            ].contains(platform ?? defaultTargetPlatform);
      case CygnusPlatformWebViewControllerMethod.pauseAllMediaPlayback:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [
              TargetPlatform.iOS,
              TargetPlatform.macOS,
              TargetPlatform.linux,
            ].contains(platform ?? defaultTargetPlatform);
      case CygnusPlatformWebViewControllerMethod.pauseTimers:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [
              TargetPlatform.android,
              TargetPlatform.iOS,
              TargetPlatform.macOS,
            ].contains(platform ?? defaultTargetPlatform);
      case CygnusPlatformWebViewControllerMethod.postUrl:
        return kIsWeb && platform == null
            ? true
            : ((kIsWeb && platform != null) || !kIsWeb) &&
                  [
                    TargetPlatform.android,
                    TargetPlatform.iOS,
                    TargetPlatform.macOS,
                    TargetPlatform.windows,
                    TargetPlatform.linux,
                  ].contains(platform ?? defaultTargetPlatform);
      case CygnusPlatformWebViewControllerMethod.postWebMessage:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [
              TargetPlatform.android,
              TargetPlatform.iOS,
              TargetPlatform.macOS,
              TargetPlatform.linux,
              TargetPlatform.windows,
            ].contains(platform ?? defaultTargetPlatform);
      case CygnusPlatformWebViewControllerMethod.printCurrentPage:
        return kIsWeb && platform == null
            ? true
            : ((kIsWeb && platform != null) || !kIsWeb) &&
                  [
                    TargetPlatform.android,
                    TargetPlatform.iOS,
                    TargetPlatform.macOS,
                    TargetPlatform.windows,
                  ].contains(platform ?? defaultTargetPlatform);
      case CygnusPlatformWebViewControllerMethod.reload:
        return kIsWeb && platform == null
            ? true
            : ((kIsWeb && platform != null) || !kIsWeb) &&
                  [
                    TargetPlatform.android,
                    TargetPlatform.iOS,
                    TargetPlatform.macOS,
                    TargetPlatform.windows,
                    TargetPlatform.linux,
                  ].contains(platform ?? defaultTargetPlatform);
      case CygnusPlatformWebViewControllerMethod.reloadFromOrigin:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [
              TargetPlatform.iOS,
              TargetPlatform.macOS,
              TargetPlatform.linux,
            ].contains(platform ?? defaultTargetPlatform);
      case CygnusPlatformWebViewControllerMethod.removeAllUserScripts:
        return kIsWeb && platform == null
            ? true
            : ((kIsWeb && platform != null) || !kIsWeb) &&
                  [
                    TargetPlatform.android,
                    TargetPlatform.iOS,
                    TargetPlatform.linux,
                    TargetPlatform.macOS,
                    TargetPlatform.windows,
                  ].contains(platform ?? defaultTargetPlatform);
      case CygnusPlatformWebViewControllerMethod
          .removeDevToolsProtocolEventListener:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [
              TargetPlatform.windows,
            ].contains(platform ?? defaultTargetPlatform);
      case CygnusPlatformWebViewControllerMethod.removeJavaScriptHandler:
        return kIsWeb && platform == null
            ? true
            : ((kIsWeb && platform != null) || !kIsWeb) &&
                  [
                    TargetPlatform.android,
                    TargetPlatform.iOS,
                    TargetPlatform.macOS,
                    TargetPlatform.windows,
                  ].contains(platform ?? defaultTargetPlatform);
      case CygnusPlatformWebViewControllerMethod.removeUserScript:
        return kIsWeb && platform == null
            ? true
            : ((kIsWeb && platform != null) || !kIsWeb) &&
                  [
                    TargetPlatform.android,
                    TargetPlatform.iOS,
                    TargetPlatform.linux,
                    TargetPlatform.macOS,
                    TargetPlatform.windows,
                  ].contains(platform ?? defaultTargetPlatform);
      case CygnusPlatformWebViewControllerMethod.removeUserScripts:
        return kIsWeb && platform == null
            ? true
            : ((kIsWeb && platform != null) || !kIsWeb) &&
                  [
                    TargetPlatform.android,
                    TargetPlatform.iOS,
                    TargetPlatform.linux,
                    TargetPlatform.macOS,
                    TargetPlatform.windows,
                  ].contains(platform ?? defaultTargetPlatform);
      case CygnusPlatformWebViewControllerMethod.removeUserScriptsByGroupName:
        return kIsWeb && platform == null
            ? true
            : ((kIsWeb && platform != null) || !kIsWeb) &&
                  [
                    TargetPlatform.android,
                    TargetPlatform.iOS,
                    TargetPlatform.linux,
                    TargetPlatform.macOS,
                    TargetPlatform.windows,
                  ].contains(platform ?? defaultTargetPlatform);
      case CygnusPlatformWebViewControllerMethod.requestEnterFullscreen:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [TargetPlatform.linux].contains(platform ?? defaultTargetPlatform);
      case CygnusPlatformWebViewControllerMethod.requestExitFullscreen:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [TargetPlatform.linux].contains(platform ?? defaultTargetPlatform);
      case CygnusPlatformWebViewControllerMethod.requestFocus:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [
              TargetPlatform.android,
              TargetPlatform.iOS,
              TargetPlatform.macOS,
              TargetPlatform.linux,
            ].contains(platform ?? defaultTargetPlatform);
      case CygnusPlatformWebViewControllerMethod.requestFocusNodeHref:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [
              TargetPlatform.android,
              TargetPlatform.iOS,
            ].contains(platform ?? defaultTargetPlatform);
      case CygnusPlatformWebViewControllerMethod.requestImageRef:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [
              TargetPlatform.android,
              TargetPlatform.iOS,
            ].contains(platform ?? defaultTargetPlatform);
      case CygnusPlatformWebViewControllerMethod.requestMediaPlaybackState:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [
              TargetPlatform.iOS,
              TargetPlatform.macOS,
              TargetPlatform.linux,
            ].contains(platform ?? defaultTargetPlatform);
      case CygnusPlatformWebViewControllerMethod.requestPointerLock:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [TargetPlatform.linux].contains(platform ?? defaultTargetPlatform);
      case CygnusPlatformWebViewControllerMethod.requestPointerUnlock:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [TargetPlatform.linux].contains(platform ?? defaultTargetPlatform);
      case CygnusPlatformWebViewControllerMethod.restoreState:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [
              TargetPlatform.android,
              TargetPlatform.iOS,
              TargetPlatform.macOS,
              TargetPlatform.linux,
            ].contains(platform ?? defaultTargetPlatform);
      case CygnusPlatformWebViewControllerMethod.resume:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [
              TargetPlatform.android,
              TargetPlatform.windows,
            ].contains(platform ?? defaultTargetPlatform);
      case CygnusPlatformWebViewControllerMethod.resumeTimers:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [
              TargetPlatform.android,
              TargetPlatform.iOS,
              TargetPlatform.macOS,
            ].contains(platform ?? defaultTargetPlatform);
      case CygnusPlatformWebViewControllerMethod.saveState:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [
              TargetPlatform.android,
              TargetPlatform.iOS,
              TargetPlatform.macOS,
              TargetPlatform.linux,
            ].contains(platform ?? defaultTargetPlatform);
      case CygnusPlatformWebViewControllerMethod.saveWebArchive:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [
              TargetPlatform.android,
              TargetPlatform.iOS,
              TargetPlatform.linux,
              TargetPlatform.macOS,
            ].contains(platform ?? defaultTargetPlatform);
      case CygnusPlatformWebViewControllerMethod.scrollBy:
        return kIsWeb && platform == null
            ? true
            : ((kIsWeb && platform != null) || !kIsWeb) &&
                  [
                    TargetPlatform.android,
                    TargetPlatform.iOS,
                    TargetPlatform.macOS,
                    TargetPlatform.linux,
                    TargetPlatform.windows,
                  ].contains(platform ?? defaultTargetPlatform);
      case CygnusPlatformWebViewControllerMethod.scrollTo:
        return kIsWeb && platform == null
            ? true
            : ((kIsWeb && platform != null) || !kIsWeb) &&
                  [
                    TargetPlatform.android,
                    TargetPlatform.iOS,
                    TargetPlatform.macOS,
                    TargetPlatform.linux,
                    TargetPlatform.windows,
                  ].contains(platform ?? defaultTargetPlatform);
      case CygnusPlatformWebViewControllerMethod.setAllMediaPlaybackSuspended:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [
              TargetPlatform.iOS,
              TargetPlatform.macOS,
              TargetPlatform.linux,
            ].contains(platform ?? defaultTargetPlatform);
      case CygnusPlatformWebViewControllerMethod.setCameraCaptureState:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [
              TargetPlatform.iOS,
              TargetPlatform.linux,
              TargetPlatform.macOS,
            ].contains(platform ?? defaultTargetPlatform);
      case CygnusPlatformWebViewControllerMethod.setContextMenu:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [
              TargetPlatform.android,
              TargetPlatform.iOS,
            ].contains(platform ?? defaultTargetPlatform);
      case CygnusPlatformWebViewControllerMethod.setInputMethodEnabled:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [TargetPlatform.iOS].contains(platform ?? defaultTargetPlatform);
      case CygnusPlatformWebViewControllerMethod.setJavaScriptBridgeName:
        return kIsWeb && platform == null
            ? true
            : ((kIsWeb && platform != null) || !kIsWeb) &&
                  [
                    TargetPlatform.android,
                    TargetPlatform.iOS,
                    TargetPlatform.macOS,
                    TargetPlatform.windows,
                    TargetPlatform.linux,
                  ].contains(platform ?? defaultTargetPlatform);
      case CygnusPlatformWebViewControllerMethod.setMemoryUsageTargetLevel:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [
              TargetPlatform.windows,
            ].contains(platform ?? defaultTargetPlatform);
      case CygnusPlatformWebViewControllerMethod.setMicrophoneCaptureState:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [
              TargetPlatform.iOS,
              TargetPlatform.linux,
              TargetPlatform.macOS,
            ].contains(platform ?? defaultTargetPlatform);
      case CygnusPlatformWebViewControllerMethod.setMuted:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [TargetPlatform.linux].contains(platform ?? defaultTargetPlatform);
      case CygnusPlatformWebViewControllerMethod.setOptions:
        return kIsWeb && platform == null
            ? true
            : ((kIsWeb && platform != null) || !kIsWeb) &&
                  [
                    TargetPlatform.android,
                    TargetPlatform.iOS,
                    TargetPlatform.macOS,
                    TargetPlatform.windows,
                  ].contains(platform ?? defaultTargetPlatform);
      case CygnusPlatformWebViewControllerMethod.setSafeBrowsingAllowlist:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [
              TargetPlatform.android,
            ].contains(platform ?? defaultTargetPlatform);
      case CygnusPlatformWebViewControllerMethod.setSafeBrowsingWhitelist:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [
              TargetPlatform.android,
            ].contains(platform ?? defaultTargetPlatform);
      case CygnusPlatformWebViewControllerMethod.setScreenScale:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [TargetPlatform.linux].contains(platform ?? defaultTargetPlatform);
      case CygnusPlatformWebViewControllerMethod.setSettings:
        return kIsWeb && platform == null
            ? true
            : ((kIsWeb && platform != null) || !kIsWeb) &&
                  [
                    TargetPlatform.android,
                    TargetPlatform.iOS,
                    TargetPlatform.linux,
                    TargetPlatform.macOS,
                    TargetPlatform.windows,
                  ].contains(platform ?? defaultTargetPlatform);
      case CygnusPlatformWebViewControllerMethod.setTargetRefreshRate:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [TargetPlatform.linux].contains(platform ?? defaultTargetPlatform);
      case CygnusPlatformWebViewControllerMethod.setVisible:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [TargetPlatform.linux].contains(platform ?? defaultTargetPlatform);
      case CygnusPlatformWebViewControllerMethod.setWebContentsDebuggingEnabled:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [
              TargetPlatform.android,
            ].contains(platform ?? defaultTargetPlatform);
      case CygnusPlatformWebViewControllerMethod.showInputMethod:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [
              TargetPlatform.android,
            ].contains(platform ?? defaultTargetPlatform);
      case CygnusPlatformWebViewControllerMethod.showSaveAsUI:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [
              TargetPlatform.windows,
            ].contains(platform ?? defaultTargetPlatform);
      case CygnusPlatformWebViewControllerMethod.startSafeBrowsing:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [
              TargetPlatform.android,
            ].contains(platform ?? defaultTargetPlatform);
      case CygnusPlatformWebViewControllerMethod.stopLoading:
        return kIsWeb && platform == null
            ? true
            : ((kIsWeb && platform != null) || !kIsWeb) &&
                  [
                    TargetPlatform.android,
                    TargetPlatform.iOS,
                    TargetPlatform.macOS,
                    TargetPlatform.windows,
                    TargetPlatform.linux,
                  ].contains(platform ?? defaultTargetPlatform);
      case CygnusPlatformWebViewControllerMethod.takeScreenshot:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [
              TargetPlatform.android,
              TargetPlatform.iOS,
              TargetPlatform.macOS,
              TargetPlatform.windows,
              TargetPlatform.linux,
            ].contains(platform ?? defaultTargetPlatform);
      case CygnusPlatformWebViewControllerMethod.terminateWebProcess:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [TargetPlatform.linux].contains(platform ?? defaultTargetPlatform);
      case CygnusPlatformWebViewControllerMethod.zoomBy:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [
              TargetPlatform.android,
              TargetPlatform.iOS,
              TargetPlatform.linux,
            ].contains(platform ?? defaultTargetPlatform);
      case CygnusPlatformWebViewControllerMethod.zoomIn:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [
              TargetPlatform.android,
            ].contains(platform ?? defaultTargetPlatform);
      case CygnusPlatformWebViewControllerMethod.zoomOut:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [
              TargetPlatform.android,
            ].contains(platform ?? defaultTargetPlatform);
    }
  }
}
