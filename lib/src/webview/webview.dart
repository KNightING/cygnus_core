import 'dart:async';
import 'dart:collection';

import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:cygnus_core/src/platform_interface/flutter_webview_platform_interface.dart';

import '../find_interaction/find_interaction_controller.dart';
import '../pull_to_refresh/main.dart';
import '../pull_to_refresh/pull_to_refresh_controller.dart';
import '../webview_environment/webview_environment.dart';
import 'headless_webview.dart';
import 'webview_controller.dart';

///{@macro cygnus_core.CygnusPlatformWebViewWidget}
///
///{@macro cygnus_core.CygnusPlatformWebViewCreationParams.supported_platforms}
class CygnusWebView extends StatefulWidget {
  /// Constructs a [CygnusWebView].
  ///
  /// See [CygnusWebView.fromPlatformCreationParams] for setting parameters for
  /// a specific platform.
  CygnusWebView.fromPlatformCreationParams({
    Key? key,
    required CygnusPlatformWebViewWidgetCreationParams params,
  }) : this.fromPlatform(
         key: key,
         platform: CygnusPlatformWebViewWidget(params),
       );

  /// Constructs a [CygnusWebView] from a specific platform implementation.
  CygnusWebView.fromPlatform({super.key, required this.platform});

  /// Implementation of [PlatformInAppWebView] for the current platform.
  final CygnusPlatformWebViewWidget platform;

  ///{@macro cygnus_core.CygnusPlatformWebViewWidget}
  ///
  ///{@macro cygnus_core.CygnusPlatformWebViewCreationParams.supported_platforms}
  CygnusWebView({
    Key? key,
    Set<Factory<OneSequenceGestureRecognizer>>? gestureRecognizers,
    int? windowId,
    CygnusHeadlessWebView? headlessWebView,
    CygnusWebViewKeepAlive? keepAlive,
    bool? preventGestureDelay,
    TextDirection? layoutDirection,
    CygnusWebViewEnvironment? webViewEnvironment,
    @Deprecated('Use onGeolocationPermissionsHidePrompt instead')
    void Function(CygnusWebViewController controller)?
    androidOnGeolocationPermissionsHidePrompt,
    @Deprecated('Use onGeolocationPermissionsShowPrompt instead')
    FutureOr<CygnusGeolocationPermissionShowPromptResponse?> Function(
      CygnusWebViewController controller,
      String origin,
    )?
    androidOnGeolocationPermissionsShowPrompt,
    @Deprecated('Use onPermissionRequest instead')
    FutureOr<CygnusPermissionRequestResponse?> Function(
      CygnusWebViewController controller,
      String origin,
      List<String> resources,
    )?
    androidOnPermissionRequest,
    @Deprecated('Use onSafeBrowsingHit instead')
    FutureOr<CygnusSafeBrowsingResponse?> Function(
      CygnusWebViewController controller,
      Uri url,
      CygnusSafeBrowsingThreat? threatType,
    )?
    androidOnSafeBrowsingHit,
    CygnusWebViewInitialData? initialData,
    String? initialFile,
    @Deprecated('Use initialSettings instead')
    CygnusWebViewGroupOptions? initialOptions,
    CygnusWebViewSettings? initialSettings,
    CygnusURLRequest? initialUrlRequest,
    UnmodifiableListView<CygnusUserScript>? initialUserScripts,
    CygnusPullToRefreshController? pullToRefreshController,
    CygnusFindInteractionController? findInteractionController,
    CygnusContextMenu? contextMenu,
    void Function(CygnusWebViewController controller, CygnusWebUri? url)?
    onContentLoading,
    void Function(CygnusWebViewController controller, CygnusWebUri? url)?
    onDOMContentLoaded,
    void Function(CygnusWebViewController controller, CygnusWebUri? url)?
    onPageCommitVisible,
    void Function(CygnusWebViewController controller, String? title)?
    onTitleChanged,
    @Deprecated(
      'Use onDidReceiveServerRedirectForProvisionalNavigation instead',
    )
    void Function(CygnusWebViewController controller)?
    iosOnDidReceiveServerRedirectForProvisionalNavigation,
    @Deprecated('Use onWebContentProcessDidTerminate instead')
    void Function(CygnusWebViewController controller)?
    iosOnWebContentProcessDidTerminate,
    @Deprecated('Use onNavigationResponse instead')
    FutureOr<CygnusIOSNavigationResponseAction?> Function(
      CygnusWebViewController controller,
      CygnusIOSWKNavigationResponse navigationResponse,
    )?
    iosOnNavigationResponse,
    @Deprecated('Use shouldAllowDeprecatedTLS instead')
    FutureOr<CygnusIOSShouldAllowDeprecatedTLSAction?> Function(
      CygnusWebViewController controller,
      CygnusURLAuthenticationChallenge challenge,
    )?
    iosShouldAllowDeprecatedTLS,
    FutureOr<CygnusAjaxRequestAction?> Function(
      CygnusWebViewController controller,
      CygnusAjaxRequest ajaxRequest,
    )?
    onAjaxProgress,
    FutureOr<CygnusAjaxRequestAction?> Function(
      CygnusWebViewController controller,
      CygnusAjaxRequest ajaxRequest,
    )?
    onAjaxReadyStateChange,
    void Function(
      CygnusWebViewController controller,
      CygnusConsoleMessage consoleMessage,
    )?
    onConsoleMessage,
    FutureOr<bool?> Function(
      CygnusWebViewController controller,
      CygnusCreateWindowAction createWindowAction,
    )?
    onCreateWindow,
    void Function(CygnusWebViewController controller)? onCloseWindow,
    void Function(CygnusWebViewController controller)? onWindowFocus,
    void Function(CygnusWebViewController controller)? onWindowBlur,
    @Deprecated('Use onReceivedIcon instead')
    void Function(CygnusWebViewController controller, Uint8List icon)?
    androidOnReceivedIcon,
    @Deprecated('Use onReceivedTouchIconUrl instead')
    void Function(CygnusWebViewController controller, Uri url, bool precomposed)?
    androidOnReceivedTouchIconUrl,
    @Deprecated('Use onDownloadStarting instead')
    void Function(CygnusWebViewController controller, Uri url)? onDownloadStart,
    @Deprecated('Use onDownloadStarting instead')
    void Function(
      CygnusWebViewController controller,
      CygnusDownloadStartRequest downloadStartRequest,
    )?
    onDownloadStartRequest,
    FutureOr<CygnusDownloadStartResponse?> Function(
      CygnusWebViewController controller,
      CygnusDownloadStartRequest downloadStartRequest,
    )?
    onDownloadStarting,
    @Deprecated('Use CygnusFindInteractionController.onFindResultReceived instead')
    void Function(
      CygnusWebViewController controller,
      int activeMatchOrdinal,
      int numberOfMatches,
      bool isDoneCounting,
    )?
    onFindResultReceived,
    FutureOr<CygnusJsAlertResponse?> Function(
      CygnusWebViewController controller,
      CygnusJsAlertRequest jsAlertRequest,
    )?
    onJsAlert,
    FutureOr<CygnusJsConfirmResponse?> Function(
      CygnusWebViewController controller,
      CygnusJsConfirmRequest jsConfirmRequest,
    )?
    onJsConfirm,
    FutureOr<CygnusJsPromptResponse?> Function(
      CygnusWebViewController controller,
      CygnusJsPromptRequest jsPromptRequest,
    )?
    onJsPrompt,
    @Deprecated("Use onReceivedError instead")
    void Function(
      CygnusWebViewController controller,
      Uri? url,
      int code,
      String message,
    )?
    onLoadError,
    void Function(
      CygnusWebViewController controller,
      CygnusWebResourceRequest request,
      CygnusWebResourceError error,
    )?
    onReceivedError,
    @Deprecated("Use onReceivedHttpError instead")
    void Function(
      CygnusWebViewController controller,
      Uri? url,
      int statusCode,
      String description,
    )?
    onLoadHttpError,
    void Function(
      CygnusWebViewController controller,
      CygnusWebResourceRequest request,
      CygnusWebResourceResponse errorResponse,
    )?
    onReceivedHttpError,
    void Function(CygnusWebViewController controller, CygnusLoadedResource resource)?
    onLoadResource,
    @Deprecated('Use onLoadResourceWithCustomScheme instead')
    FutureOr<CygnusCustomSchemeResponse?> Function(
      CygnusWebViewController controller,
      Uri url,
    )?
    onLoadResourceCustomScheme,
    FutureOr<CygnusCustomSchemeResponse?> Function(
      CygnusWebViewController controller,
      CygnusWebResourceRequest request,
    )?
    onLoadResourceWithCustomScheme,
    void Function(CygnusWebViewController controller, CygnusWebUri? url)? onLoadStart,
    void Function(CygnusWebViewController controller, CygnusWebUri? url)? onLoadStop,
    void Function(
      CygnusWebViewController controller,
      CygnusWebViewHitTestResult hitTestResult,
    )?
    onLongPressHitTestResult,
    @Deprecated("Use onPrintRequest instead")
    void Function(CygnusWebViewController controller, Uri? url)? onPrint,
    FutureOr<bool?> Function(
      CygnusWebViewController controller,
      CygnusWebUri? url,
      CygnusPlatformPrintJobController? printJobController,
    )?
    onPrintRequest,
    void Function(CygnusWebViewController controller, int progress)?
    onProgressChanged,
    FutureOr<CygnusClientCertResponse?> Function(
      CygnusWebViewController controller,
      CygnusClientCertChallenge challenge,
    )?
    onReceivedClientCertRequest,
    FutureOr<CygnusHttpAuthResponse?> Function(
      CygnusWebViewController controller,
      CygnusHttpAuthenticationChallenge challenge,
    )?
    onReceivedHttpAuthRequest,
    FutureOr<CygnusServerTrustAuthResponse?> Function(
      CygnusWebViewController controller,
      CygnusServerTrustChallenge challenge,
    )?
    onReceivedServerTrustAuthRequest,
    void Function(CygnusWebViewController controller, int x, int y)?
    onScrollChanged,
    void Function(
      CygnusWebViewController controller,
      CygnusWebUri? url,
      bool? isReload,
    )?
    onUpdateVisitedHistory,
    void Function(CygnusWebViewController controller)? onWebViewCreated,
    FutureOr<CygnusAjaxRequest?> Function(
      CygnusWebViewController controller,
      CygnusAjaxRequest ajaxRequest,
    )?
    shouldInterceptAjaxRequest,
    FutureOr<CygnusFetchRequest?> Function(
      CygnusWebViewController controller,
      CygnusFetchRequest fetchRequest,
    )?
    shouldInterceptFetchRequest,
    FutureOr<CygnusNavigationActionPolicy?> Function(
      CygnusWebViewController controller,
      CygnusNavigationAction navigationAction,
    )?
    shouldOverrideUrlLoading,
    void Function(CygnusWebViewController controller)? onEnterFullscreen,
    void Function(CygnusWebViewController controller)? onExitFullscreen,
    void Function(
      CygnusWebViewController controller,
      int x,
      int y,
      bool clampedX,
      bool clampedY,
    )?
    onOverScrolled,
    void Function(
      CygnusWebViewController controller,
      double oldScale,
      double newScale,
    )?
    onZoomScaleChanged,
    @Deprecated('Use shouldInterceptRequest instead')
    FutureOr<CygnusWebResourceResponse?> Function(
      CygnusWebViewController controller,
      CygnusWebResourceRequest request,
    )?
    androidShouldInterceptRequest,
    @Deprecated('Use onRenderProcessUnresponsive instead')
    FutureOr<CygnusWebViewRenderProcessAction?> Function(
      CygnusWebViewController controller,
      Uri? url,
    )?
    androidOnRenderProcessUnresponsive,
    @Deprecated('Use onRenderProcessResponsive instead')
    FutureOr<CygnusWebViewRenderProcessAction?> Function(
      CygnusWebViewController controller,
      Uri? url,
    )?
    androidOnRenderProcessResponsive,
    @Deprecated('Use onRenderProcessGone instead')
    void Function(
      CygnusWebViewController controller,
      CygnusRenderProcessGoneDetail detail,
    )?
    androidOnRenderProcessGone,
    @Deprecated('Use onFormResubmission instead')
    FutureOr<CygnusFormResubmissionAction?> Function(
      CygnusWebViewController controller,
      Uri? url,
    )?
    androidOnFormResubmission,
    @Deprecated('Use onZoomScaleChanged instead')
    void Function(
      CygnusWebViewController controller,
      double oldScale,
      double newScale,
    )?
    androidOnScaleChanged,
    @Deprecated('Use onJsBeforeUnload instead')
    FutureOr<CygnusJsBeforeUnloadResponse?> Function(
      CygnusWebViewController controller,
      CygnusJsBeforeUnloadRequest jsBeforeUnloadRequest,
    )?
    androidOnJsBeforeUnload,
    @Deprecated('Use onReceivedLoginRequest instead')
    void Function(CygnusWebViewController controller, CygnusLoginRequest loginRequest)?
    androidOnReceivedLoginRequest,
    void Function(CygnusWebViewController controller)?
    onDidReceiveServerRedirectForProvisionalNavigation,
    FutureOr<CygnusFormResubmissionAction?> Function(
      CygnusWebViewController controller,
      CygnusWebUri? url,
    )?
    onFormResubmission,
    void Function(CygnusWebViewController controller)?
    onGeolocationPermissionsHidePrompt,
    FutureOr<CygnusGeolocationPermissionShowPromptResponse?> Function(
      CygnusWebViewController controller,
      String origin,
    )?
    onGeolocationPermissionsShowPrompt,
    FutureOr<CygnusJsBeforeUnloadResponse?> Function(
      CygnusWebViewController controller,
      CygnusJsBeforeUnloadRequest jsBeforeUnloadRequest,
    )?
    onJsBeforeUnload,
    FutureOr<CygnusNavigationResponseAction?> Function(
      CygnusWebViewController controller,
      CygnusNavigationResponse navigationResponse,
    )?
    onNavigationResponse,
    FutureOr<CygnusPermissionResponse?> Function(
      CygnusWebViewController controller,
      CygnusPermissionRequest permissionRequest,
    )?
    onPermissionRequest,
    @Deprecated('Use onFaviconChanged instead')
    void Function(CygnusWebViewController controller, Uint8List icon)?
    onReceivedIcon,
    void Function(
      CygnusWebViewController controller,
      CygnusFaviconChangedRequest faviconChangedRequest,
    )?
    onFaviconChanged,
    void Function(CygnusWebViewController controller, CygnusLoginRequest loginRequest)?
    onReceivedLoginRequest,
    void Function(
      CygnusWebViewController controller,
      CygnusPermissionRequest permissionRequest,
    )?
    onPermissionRequestCanceled,
    void Function(CygnusWebViewController controller)? onRequestFocus,
    void Function(
      CygnusWebViewController controller,
      CygnusWebUri url,
      bool precomposed,
    )?
    onReceivedTouchIconUrl,
    void Function(
      CygnusWebViewController controller,
      CygnusRenderProcessGoneDetail detail,
    )?
    onRenderProcessGone,
    FutureOr<CygnusWebViewRenderProcessAction?> Function(
      CygnusWebViewController controller,
      CygnusWebUri? url,
    )?
    onRenderProcessResponsive,
    FutureOr<CygnusWebViewRenderProcessAction?> Function(
      CygnusWebViewController controller,
      CygnusWebUri? url,
    )?
    onRenderProcessUnresponsive,
    FutureOr<CygnusSafeBrowsingResponse?> Function(
      CygnusWebViewController controller,
      CygnusWebUri url,
      CygnusSafeBrowsingThreat? threatType,
    )?
    onSafeBrowsingHit,
    void Function(CygnusWebViewController controller)?
    onWebContentProcessDidTerminate,
    FutureOr<CygnusShouldAllowDeprecatedTLSAction?> Function(
      CygnusWebViewController controller,
      CygnusURLAuthenticationChallenge challenge,
    )?
    shouldAllowDeprecatedTLS,
    FutureOr<CygnusWebResourceResponse?> Function(
      CygnusWebViewController controller,
      CygnusWebResourceRequest request,
    )?
    shouldInterceptRequest,
    FutureOr<void> Function(
      CygnusWebViewController controller,
      CygnusMediaCaptureState? oldState,
      CygnusMediaCaptureState? newState,
    )?
    onCameraCaptureStateChanged,
    FutureOr<void> Function(
      CygnusWebViewController controller,
      CygnusMediaCaptureState? oldState,
      CygnusMediaCaptureState? newState,
    )?
    onMicrophoneCaptureStateChanged,
    void Function(
      CygnusWebViewController controller,
      Size oldContentSize,
      Size newContentSize,
    )?
    onContentSizeChanged,
    void Function(
      CygnusWebViewController controller,
      CygnusProcessFailedDetail detail,
    )?
    onProcessFailed,
    FutureOr<CygnusNotificationReceivedResponse?> Function(
      CygnusWebViewController controller,
      CygnusNotificationReceivedRequest request,
    )?
    onNotificationReceived,
    FutureOr<CygnusSaveAsUIShowingResponse?> Function(
      CygnusWebViewController controller,
      CygnusSaveAsUIShowingRequest request,
    )?
    onSaveAsUIShowing,
    FutureOr<CygnusSaveFileSecurityCheckStartingResponse?> Function(
      CygnusWebViewController controller,
      CygnusSaveFileSecurityCheckStartingRequest request,
    )?
    onSaveFileSecurityCheckStarting,
    FutureOr<CygnusScreenCaptureStartingResponse?> Function(
      CygnusWebViewController controller,
      CygnusScreenCaptureStartingRequest request,
    )?
    onScreenCaptureStarting,
    void Function(
      CygnusWebViewController controller,
      CygnusAcceleratorKeyPressedDetail detail,
    )?
    onAcceleratorKeyPressed,
    FutureOr<CygnusShowFileChooserResponse?> Function(
      CygnusWebViewController controller,
      CygnusShowFileChooserRequest request,
    )?
    onShowFileChooser,
    FutureOr<CygnusLaunchingExternalUriSchemeResponse?> Function(
      CygnusWebViewController controller,
      CygnusLaunchingExternalUriSchemeRequest request,
    )?
    onLaunchingExternalUriScheme,
  }) : this.fromPlatformCreationParams(
         key: key,
         params: CygnusPlatformWebViewWidgetCreationParams(
           controllerFromPlatform:
               (CygnusPlatformWebViewController controller) =>
                   CygnusWebViewController.fromPlatform(platform: controller),
           windowId: windowId,
           keepAlive: keepAlive,
           initialUrlRequest: initialUrlRequest,
           initialFile: initialFile,
           initialData: initialData,
           initialOptions: initialOptions,
           initialSettings: initialSettings,
           initialUserScripts: initialUserScripts,
           pullToRefreshController: pullToRefreshController?.platform,
           findInteractionController: findInteractionController?.platform,
           contextMenu: contextMenu,
           layoutDirection: layoutDirection,
           webViewEnvironment: webViewEnvironment?.platform,
           onWebViewCreated: onWebViewCreated != null
               ? (controller) => onWebViewCreated.call(controller)
               : null,
           onLoadStart: onLoadStart != null
               ? (controller, url) => onLoadStart.call(controller, url)
               : null,
           onLoadStop: onLoadStop != null
               ? (controller, url) => onLoadStop.call(controller, url)
               : null,
           onLoadError: onLoadError != null
               ? (controller, url, code, message) =>
                     onLoadError.call(controller, url, code, message)
               : null,
           onReceivedError: onReceivedError != null
               ? (controller, request, error) =>
                     onReceivedError.call(controller, request, error)
               : null,
           onLoadHttpError: onLoadHttpError != null
               ? (controller, url, statusCode, description) => onLoadHttpError
                     .call(controller, url, statusCode, description)
               : null,
           onReceivedHttpError: onReceivedHttpError != null
               ? (controller, request, errorResponse) => onReceivedHttpError
                     .call(controller, request, errorResponse)
               : null,
           onConsoleMessage: onConsoleMessage != null
               ? (controller, consoleMessage) =>
                     onConsoleMessage.call(controller, consoleMessage)
               : null,
           onProgressChanged: onProgressChanged != null
               ? (controller, progress) =>
                     onProgressChanged.call(controller, progress)
               : null,
           shouldOverrideUrlLoading: shouldOverrideUrlLoading != null
               ? (controller, navigationAction) =>
                     shouldOverrideUrlLoading(controller, navigationAction)
               : null,
           onLoadResource: onLoadResource != null
               ? (controller, resource) =>
                     onLoadResource.call(controller, resource)
               : null,
           onScrollChanged: onScrollChanged != null
               ? (controller, x, y) => onScrollChanged.call(controller, x, y)
               : null,
           onDownloadStart: onDownloadStart != null
               ? (controller, url) => onDownloadStart.call(controller, url)
               : null,
           onDownloadStartRequest: onDownloadStartRequest != null
               ? (controller, downloadStartRequest) => onDownloadStartRequest
                     .call(controller, downloadStartRequest)
               : null,
           onDownloadStarting: onDownloadStarting != null
               ? (controller, downloadStartRequest) =>
                     onDownloadStarting.call(controller, downloadStartRequest)
               : null,
           onLoadResourceCustomScheme: onLoadResourceCustomScheme != null
               ? (controller, url) =>
                     onLoadResourceCustomScheme.call(controller, url)
               : null,
           onLoadResourceWithCustomScheme:
               onLoadResourceWithCustomScheme != null
               ? (controller, request) =>
                     onLoadResourceWithCustomScheme.call(controller, request)
               : null,
           onCreateWindow: onCreateWindow != null
               ? (controller, createWindowAction) =>
                     onCreateWindow.call(controller, createWindowAction)
               : null,
           onCloseWindow: onCloseWindow != null
               ? (controller) => onCloseWindow.call(controller)
               : null,
           onJsAlert: onJsAlert != null
               ? (controller, jsAlertRequest) =>
                     onJsAlert.call(controller, jsAlertRequest)
               : null,
           onJsConfirm: onJsConfirm != null
               ? (controller, jsConfirmRequest) =>
                     onJsConfirm.call(controller, jsConfirmRequest)
               : null,
           onJsPrompt: onJsPrompt != null
               ? (controller, jsPromptRequest) =>
                     onJsPrompt.call(controller, jsPromptRequest)
               : null,
           onReceivedHttpAuthRequest: onReceivedHttpAuthRequest != null
               ? (controller, challenge) =>
                     onReceivedHttpAuthRequest.call(controller, challenge)
               : null,
           onReceivedServerTrustAuthRequest:
               onReceivedServerTrustAuthRequest != null
               ? (controller, challenge) => onReceivedServerTrustAuthRequest
                     .call(controller, challenge)
               : null,
           onReceivedClientCertRequest: onReceivedClientCertRequest != null
               ? (controller, challenge) =>
                     onReceivedClientCertRequest.call(controller, challenge)
               : null,
           onFindResultReceived: onFindResultReceived != null
               ? (
                   controller,
                   activeMatchOrdinal,
                   numberOfMatches,
                   isDoneCounting,
                 ) => onFindResultReceived.call(
                   controller,
                   activeMatchOrdinal,
                   numberOfMatches,
                   isDoneCounting,
                 )
               : null,
           shouldInterceptAjaxRequest: shouldInterceptAjaxRequest != null
               ? (controller, ajaxRequest) =>
                     shouldInterceptAjaxRequest.call(controller, ajaxRequest)
               : null,
           onAjaxReadyStateChange: onAjaxReadyStateChange != null
               ? (controller, ajaxRequest) =>
                     onAjaxReadyStateChange.call(controller, ajaxRequest)
               : null,
           onAjaxProgress: onAjaxProgress != null
               ? (controller, ajaxRequest) =>
                     onAjaxProgress.call(controller, ajaxRequest)
               : null,
           shouldInterceptFetchRequest: shouldInterceptFetchRequest != null
               ? (controller, fetchRequest) =>
                     shouldInterceptFetchRequest.call(controller, fetchRequest)
               : null,
           onUpdateVisitedHistory: onUpdateVisitedHistory != null
               ? (controller, url, isReload) =>
                     onUpdateVisitedHistory.call(controller, url, isReload)
               : null,
           onPrint: onPrint != null
               ? (controller, url) => onPrint.call(controller, url)
               : null,
           onPrintRequest: onPrintRequest != null
               ? (controller, url, printJobController) =>
                     onPrintRequest.call(controller, url, printJobController)
               : null,
           onLongPressHitTestResult: onLongPressHitTestResult != null
               ? (controller, hitTestResult) =>
                     onLongPressHitTestResult.call(controller, hitTestResult)
               : null,
           onEnterFullscreen: onEnterFullscreen != null
               ? (controller) => onEnterFullscreen.call(controller)
               : null,
           onExitFullscreen: onExitFullscreen != null
               ? (controller) => onExitFullscreen.call(controller)
               : null,
           onContentLoading: onContentLoading != null
               ? (controller, url) => onContentLoading.call(controller, url)
               : null,
           onDOMContentLoaded: onDOMContentLoaded != null
               ? (controller, url) => onDOMContentLoaded.call(controller, url)
               : null,
           onPageCommitVisible: onPageCommitVisible != null
               ? (controller, url) => onPageCommitVisible.call(controller, url)
               : null,
           onTitleChanged: onTitleChanged != null
               ? (controller, title) => onTitleChanged.call(controller, title)
               : null,
           onWindowFocus: onWindowFocus != null
               ? (controller) => onWindowFocus.call(controller)
               : null,
           onWindowBlur: onWindowBlur != null
               ? (controller) => onWindowBlur.call(controller)
               : null,
           onOverScrolled: onOverScrolled != null
               ? (controller, x, y, clampedX, clampedY) =>
                     onOverScrolled.call(controller, x, y, clampedX, clampedY)
               : null,
           onZoomScaleChanged: onZoomScaleChanged != null
               ? (controller, oldScale, newScale) =>
                     onZoomScaleChanged.call(controller, oldScale, newScale)
               : null,
           androidOnSafeBrowsingHit: androidOnSafeBrowsingHit != null
               ? (controller, url, threatType) =>
                     androidOnSafeBrowsingHit.call(controller, url, threatType)
               : null,
           onSafeBrowsingHit: onSafeBrowsingHit != null
               ? (controller, url, threatType) =>
                     onSafeBrowsingHit.call(controller, url, threatType)
               : null,
           androidOnPermissionRequest: androidOnPermissionRequest != null
               ? (controller, origin, resources) => androidOnPermissionRequest
                     .call(controller, origin, resources)
               : null,
           onPermissionRequest: onPermissionRequest != null
               ? (controller, permissionRequest) =>
                     onPermissionRequest.call(controller, permissionRequest)
               : null,
           androidOnGeolocationPermissionsShowPrompt:
               androidOnGeolocationPermissionsShowPrompt != null
               ? (controller, origin) =>
                     androidOnGeolocationPermissionsShowPrompt.call(
                       controller,
                       origin,
                     )
               : null,
           onGeolocationPermissionsShowPrompt:
               onGeolocationPermissionsShowPrompt != null
               ? (controller, origin) =>
                     onGeolocationPermissionsShowPrompt.call(controller, origin)
               : null,
           androidOnGeolocationPermissionsHidePrompt:
               androidOnGeolocationPermissionsHidePrompt != null
               ? (controller) =>
                     androidOnGeolocationPermissionsHidePrompt.call(controller)
               : null,
           onGeolocationPermissionsHidePrompt:
               onGeolocationPermissionsHidePrompt != null
               ? (controller) =>
                     onGeolocationPermissionsHidePrompt.call(controller)
               : null,
           androidShouldInterceptRequest: androidShouldInterceptRequest != null
               ? (controller, request) =>
                     androidShouldInterceptRequest.call(controller, request)
               : null,
           shouldInterceptRequest: shouldInterceptRequest != null
               ? (controller, request) =>
                     shouldInterceptRequest.call(controller, request)
               : null,
           androidOnRenderProcessGone: androidOnRenderProcessGone != null
               ? (controller, detail) =>
                     androidOnRenderProcessGone.call(controller, detail)
               : null,
           onRenderProcessGone: onRenderProcessGone != null
               ? (controller, detail) =>
                     onRenderProcessGone.call(controller, detail)
               : null,
           androidOnRenderProcessResponsive:
               androidOnRenderProcessResponsive != null
               ? (controller, url) =>
                     androidOnRenderProcessResponsive.call(controller, url)
               : null,
           onRenderProcessResponsive: onRenderProcessResponsive != null
               ? (controller, url) =>
                     onRenderProcessResponsive.call(controller, url)
               : null,
           androidOnRenderProcessUnresponsive:
               androidOnRenderProcessUnresponsive != null
               ? (controller, url) =>
                     androidOnRenderProcessUnresponsive.call(controller, url)
               : null,
           onRenderProcessUnresponsive: onRenderProcessUnresponsive != null
               ? (controller, url) =>
                     onRenderProcessUnresponsive.call(controller, url)
               : null,
           androidOnFormResubmission: androidOnFormResubmission != null
               ? (controller, url) =>
                     androidOnFormResubmission.call(controller, url)
               : null,
           onFormResubmission: onFormResubmission != null
               ? (controller, url) => onFormResubmission.call(controller, url)
               : null,
           androidOnScaleChanged: androidOnScaleChanged != null
               ? (controller, oldScale, newScale) =>
                     androidOnScaleChanged.call(controller, oldScale, newScale)
               : null,
           androidOnReceivedIcon: androidOnReceivedIcon != null
               ? (controller, icon) =>
                     androidOnReceivedIcon.call(controller, icon)
               : null,
           onReceivedIcon: onReceivedIcon != null
               ? (controller, icon) => onReceivedIcon.call(controller, icon)
               : null,
           onFaviconChanged: onFaviconChanged != null
               ? (controller, request) =>
                     onFaviconChanged.call(controller, request)
               : null,
           androidOnReceivedTouchIconUrl: androidOnReceivedTouchIconUrl != null
               ? (controller, url, precomposed) => androidOnReceivedTouchIconUrl
                     .call(controller, url, precomposed)
               : null,
           onReceivedTouchIconUrl: onReceivedTouchIconUrl != null
               ? (controller, url, precomposed) =>
                     onReceivedTouchIconUrl.call(controller, url, precomposed)
               : null,
           androidOnJsBeforeUnload: androidOnJsBeforeUnload != null
               ? (controller, jsBeforeUnloadRequest) => androidOnJsBeforeUnload
                     .call(controller, jsBeforeUnloadRequest)
               : null,
           onJsBeforeUnload: onJsBeforeUnload != null
               ? (controller, jsBeforeUnloadRequest) =>
                     onJsBeforeUnload.call(controller, jsBeforeUnloadRequest)
               : null,
           androidOnReceivedLoginRequest: androidOnReceivedLoginRequest != null
               ? (controller, loginRequest) => androidOnReceivedLoginRequest
                     .call(controller, loginRequest)
               : null,
           onReceivedLoginRequest: onReceivedLoginRequest != null
               ? (controller, loginRequest) =>
                     onReceivedLoginRequest.call(controller, loginRequest)
               : null,
           onPermissionRequestCanceled: onPermissionRequestCanceled != null
               ? (controller, permissionRequest) => onPermissionRequestCanceled
                     .call(controller, permissionRequest)
               : null,
           onRequestFocus: onRequestFocus != null
               ? (controller) => onRequestFocus.call(controller)
               : null,
           iosOnWebContentProcessDidTerminate:
               iosOnWebContentProcessDidTerminate != null
               ? (controller) =>
                     iosOnWebContentProcessDidTerminate.call(controller)
               : null,
           onWebContentProcessDidTerminate:
               onWebContentProcessDidTerminate != null
               ? (controller) =>
                     onWebContentProcessDidTerminate.call(controller)
               : null,
           iosOnDidReceiveServerRedirectForProvisionalNavigation:
               iosOnDidReceiveServerRedirectForProvisionalNavigation != null
               ? (controller) =>
                     iosOnDidReceiveServerRedirectForProvisionalNavigation.call(
                       controller,
                     )
               : null,
           onDidReceiveServerRedirectForProvisionalNavigation:
               onDidReceiveServerRedirectForProvisionalNavigation != null
               ? (controller) =>
                     onDidReceiveServerRedirectForProvisionalNavigation.call(
                       controller,
                     )
               : null,
           iosOnNavigationResponse: iosOnNavigationResponse != null
               ? (controller, navigationResponse) => iosOnNavigationResponse
                     .call(controller, navigationResponse)
               : null,
           onNavigationResponse: onNavigationResponse != null
               ? (controller, navigationResponse) =>
                     onNavigationResponse.call(controller, navigationResponse)
               : null,
           iosShouldAllowDeprecatedTLS: iosShouldAllowDeprecatedTLS != null
               ? (controller, challenge) =>
                     iosShouldAllowDeprecatedTLS.call(controller, challenge)
               : null,
           shouldAllowDeprecatedTLS: shouldAllowDeprecatedTLS != null
               ? (controller, challenge) =>
                     shouldAllowDeprecatedTLS.call(controller, challenge)
               : null,
           onCameraCaptureStateChanged: onCameraCaptureStateChanged != null
               ? (controller, oldState, newState) => onCameraCaptureStateChanged
                     .call(controller, oldState, newState)
               : null,
           onMicrophoneCaptureStateChanged:
               onMicrophoneCaptureStateChanged != null
               ? (controller, oldState, newState) =>
                     onMicrophoneCaptureStateChanged.call(
                       controller,
                       oldState,
                       newState,
                     )
               : null,
           onContentSizeChanged: onContentSizeChanged != null
               ? (controller, oldContentSize, newContentSize) =>
                     onContentSizeChanged.call(
                       controller,
                       oldContentSize,
                       newContentSize,
                     )
               : null,
           onProcessFailed: onProcessFailed != null
               ? (controller, detail) =>
                     onProcessFailed.call(controller, detail)
               : null,
           onNotificationReceived: onNotificationReceived != null
               ? (controller, request) =>
                     onNotificationReceived.call(controller, request)
               : null,
           onSaveAsUIShowing: onSaveAsUIShowing != null
               ? (controller, request) =>
                     onSaveAsUIShowing.call(controller, request)
               : null,
           onSaveFileSecurityCheckStarting:
               onSaveFileSecurityCheckStarting != null
               ? (controller, request) =>
                     onSaveFileSecurityCheckStarting.call(controller, request)
               : null,
           onScreenCaptureStarting: onScreenCaptureStarting != null
               ? (controller, request) =>
                     onScreenCaptureStarting.call(controller, request)
               : null,
           onAcceleratorKeyPressed: onAcceleratorKeyPressed != null
               ? (controller, detail) =>
                     onAcceleratorKeyPressed.call(controller, detail)
               : null,
           onShowFileChooser: onShowFileChooser != null
               ? (controller, request) =>
                     onShowFileChooser.call(controller, request)
               : null,
           onLaunchingExternalUriScheme: onLaunchingExternalUriScheme != null
               ? (controller, request) =>
                     onLaunchingExternalUriScheme.call(controller, request)
               : null,
           gestureRecognizers: gestureRecognizers,
           headlessWebView: headlessWebView?.platform,
           preventGestureDelay: preventGestureDelay,
         ),
       );

  @override
  _InAppWebViewState createState() => _InAppWebViewState();

  ///{@macro cygnus_core.CygnusPlatformWebViewWidgetCreationParams.isClassSupported}
  static bool isClassSupported({TargetPlatform? platform}) =>
      CygnusPlatformWebViewWidget.static().isClassSupported(platform: platform);

  ///{@macro cygnus_core.CygnusPlatformWebViewWidgetCreationParams.isPropertySupported}
  static bool isPropertySupported(
    dynamic property, {
    TargetPlatform? platform,
  }) => CygnusPlatformWebViewWidget.static().isPropertySupported(
    property,
    platform: platform,
  );
}

class _InAppWebViewState extends State<CygnusWebView> {
  @override
  Widget build(BuildContext context) {
    return widget.platform.build(context);
  }

  @override
  void dispose() {
    widget.platform.dispose();
    super.dispose();
  }
}
