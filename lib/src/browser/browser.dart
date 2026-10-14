import 'dart:async';
import 'dart:collection';
import 'dart:typed_data';
import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:cygnus_core/src/platform_interface/flutter_webview_platform_interface.dart';

import '../find_interaction/find_interaction_controller.dart';
import '../pull_to_refresh/main.dart';

import '../webview/webview_controller.dart';
import '../webview_environment/webview_environment.dart';

///{@macro cygnus_core.CygnusPlatformBrowser}
///
///{@macro cygnus_core.CygnusPlatformBrowser.supported_platforms}
class CygnusBrowser implements CygnusPlatformBrowserEvents {
  ///Constructs a [CygnusBrowser].
  ///
  ///{@macro cygnus_core.CygnusPlatformBrowser}
  ///
  ///{@macro cygnus_core.CygnusPlatformBrowser.supported_platforms}
  CygnusBrowser({
    CygnusContextMenu? contextMenu,
    CygnusPullToRefreshController? pullToRefreshController,
    CygnusFindInteractionController? findInteractionController,
    UnmodifiableListView<CygnusUserScript>? initialUserScripts,
    int? windowId,
    CygnusWebViewEnvironment? webViewEnvironment,
  }) : this.fromPlatformCreationParams(
         CygnusPlatformBrowserCreationParams(
           contextMenu: contextMenu,
           pullToRefreshController: pullToRefreshController?.platform,
           findInteractionController: findInteractionController?.platform,
           initialUserScripts: initialUserScripts,
           windowId: windowId,
           webViewEnvironment: webViewEnvironment?.platform,
         ),
       );

  /// Constructs a [CygnusBrowser] from creation params for a specific
  /// platform.
  CygnusBrowser.fromPlatformCreationParams(
    CygnusPlatformBrowserCreationParams params,
  ) : this.fromPlatform(CygnusPlatformBrowser(params));

  /// Constructs a [CygnusBrowser] from a specific platform
  /// implementation.
  CygnusBrowser.fromPlatform(this.platform) {
    this.platform.eventHandler = this;
  }

  /// Implementation of [CygnusPlatformBrowser] for the current platform.
  final CygnusPlatformBrowser platform;

  ///{@macro cygnus_core.CygnusPlatformBrowser.id}
  ///
  ///{@macro cygnus_core.CygnusPlatformBrowser.id.supported_platforms}
  String get id => platform.id;

  ///{@macro cygnus_core.CygnusPlatformWebViewCreationParams.contextMenu}
  ///
  ///{@macro cygnus_core.CygnusPlatformBrowser.contextMenu.supported_platforms}
  CygnusContextMenu? get contextMenu => platform.contextMenu;

  ///{@macro cygnus_core.CygnusPlatformWebViewCreationParams.pullToRefreshController}
  ///
  ///{@macro cygnus_core.CygnusPlatformBrowser.pullToRefreshController.supported_platforms}
  CygnusPullToRefreshController? get pullToRefreshController {
    final pullToRefreshControllerPlatform = platform.pullToRefreshController;
    if (pullToRefreshControllerPlatform == null) {
      return null;
    }
    return CygnusPullToRefreshController.fromPlatform(
      platform: pullToRefreshControllerPlatform,
    );
  }

  ///{@macro cygnus_core.CygnusPlatformWebViewCreationParams.findInteractionController}
  ///
  ///{@macro cygnus_core.CygnusPlatformBrowser.findInteractionController.supported_platforms}
  CygnusFindInteractionController? get findInteractionController {
    final findInteractionControllerPlatform =
        platform.findInteractionController;
    if (findInteractionControllerPlatform == null) {
      return null;
    }
    return CygnusFindInteractionController.fromPlatform(
      platform: findInteractionControllerPlatform,
    );
  }

  ///{@macro cygnus_core.CygnusPlatformWebViewCreationParams.initialUserScripts}
  ///
  ///{@macro cygnus_core.CygnusPlatformBrowser.initialUserScripts.supported_platforms}
  UnmodifiableListView<CygnusUserScript>? get initialUserScripts =>
      platform.initialUserScripts;

  ///{@macro cygnus_core.CygnusPlatformWebViewCreationParams.windowId}
  ///
  ///{@macro cygnus_core.CygnusPlatformBrowser.windowId.supported_platforms}
  int? get windowId => platform.windowId;

  ///{@macro cygnus_core.CygnusPlatformBrowser.webViewController}
  ///
  ///{@macro cygnus_core.CygnusPlatformBrowser.webViewController.supported_platforms}
  CygnusWebViewController? get webViewController {
    final webViewControllerPlatform = platform.webViewController;
    if (webViewControllerPlatform == null) {
      return null;
    }
    return CygnusWebViewController.fromPlatform(
      platform: webViewControllerPlatform,
    );
  }

  ///{@macro cygnus_core.CygnusPlatformBrowser.openUrlRequest}
  ///
  ///{@macro cygnus_core.CygnusPlatformBrowser.openUrlRequest.supported_platforms}
  Future<void> openUrlRequest({
    required CygnusURLRequest urlRequest,
    @Deprecated('Use settings instead') CygnusBrowserClassOptions? options,
    CygnusBrowserClassSettings? settings,
  }) {
    this.platform.eventHandler = this;
    return platform.openUrlRequest(
      urlRequest: urlRequest,
      options: options,
      settings: settings,
    );
  }

  ///{@macro cygnus_core.CygnusPlatformBrowser.openFile}
  ///
  ///{@macro cygnus_core.CygnusPlatformBrowser.openFile.supported_platforms}
  Future<void> openFile({
    required String assetFilePath,
    @Deprecated('Use settings instead') CygnusBrowserClassOptions? options,
    CygnusBrowserClassSettings? settings,
  }) {
    this.platform.eventHandler = this;
    return platform.openFile(
      assetFilePath: assetFilePath,
      options: options,
      settings: settings,
    );
  }

  ///{@macro cygnus_core.CygnusPlatformBrowser.openData}
  ///
  ///{@macro cygnus_core.CygnusPlatformBrowser.openData.supported_platforms}
  Future<void> openData({
    required String data,
    String mimeType = "text/html",
    String encoding = "utf8",
    CygnusWebUri? baseUrl,
    @Deprecated("Use historyUrl instead") Uri? androidHistoryUrl,
    CygnusWebUri? historyUrl,
    @Deprecated('Use settings instead') CygnusBrowserClassOptions? options,
    CygnusBrowserClassSettings? settings,
  }) {
    this.platform.eventHandler = this;
    return platform.openData(
      data: data,
      mimeType: mimeType,
      encoding: encoding,
      baseUrl: baseUrl,
      androidHistoryUrl: androidHistoryUrl,
      historyUrl: historyUrl,
      options: options,
      settings: settings,
    );
  }

  ///{@macro cygnus_core.CygnusPlatformBrowser.openWithSystemBrowser}
  ///
  ///{@macro cygnus_core.CygnusPlatformBrowser.openWithSystemBrowser.supported_platforms}
  static Future<void> openWithSystemBrowser({required CygnusWebUri url}) =>
      CygnusPlatformBrowser.static().openWithSystemBrowser(url: url);

  ///{@macro cygnus_core.CygnusPlatformBrowser.addMenuItem}
  ///
  ///{@macro cygnus_core.CygnusPlatformBrowser.addMenuItem.supported_platforms}
  void addMenuItem(CygnusBrowserMenuItem menuItem) =>
      platform.addMenuItem(menuItem);

  ///{@macro cygnus_core.CygnusPlatformBrowser.addMenuItems}
  ///
  ///{@macro cygnus_core.CygnusPlatformBrowser.addMenuItems.supported_platforms}
  void addMenuItems(List<CygnusBrowserMenuItem> menuItems) =>
      platform.addMenuItems(menuItems);

  ///{@macro cygnus_core.CygnusPlatformBrowser.removeMenuItem}
  ///
  ///{@macro cygnus_core.CygnusPlatformBrowser.removeMenuItem.supported_platforms}
  bool removeMenuItem(CygnusBrowserMenuItem menuItem) =>
      platform.removeMenuItem(menuItem);

  ///{@macro cygnus_core.CygnusPlatformBrowser.removeMenuItems}
  ///
  ///{@macro cygnus_core.CygnusPlatformBrowser.removeMenuItems.supported_platforms}
  void removeMenuItems(List<CygnusBrowserMenuItem> menuItems) =>
      platform.removeMenuItems(menuItems);

  ///{@macro cygnus_core.CygnusPlatformBrowser.removeAllMenuItem}
  ///
  ///{@macro cygnus_core.CygnusPlatformBrowser.removeAllMenuItem.supported_platforms}
  void removeAllMenuItem() => platform.removeAllMenuItem();

  ///{@macro cygnus_core.CygnusPlatformBrowser.hasMenuItem}
  ///
  ///{@macro cygnus_core.CygnusPlatformBrowser.hasMenuItem.supported_platforms}
  bool hasMenuItem(CygnusBrowserMenuItem menuItem) =>
      platform.hasMenuItem(menuItem);

  ///{@macro cygnus_core.CygnusPlatformBrowser.show}
  ///
  ///{@macro cygnus_core.CygnusPlatformBrowser.show.supported_platforms}
  Future<void> show() => platform.show();

  ///{@macro cygnus_core.CygnusPlatformBrowser.hide}
  ///
  ///{@macro cygnus_core.CygnusPlatformBrowser.hide.supported_platforms}
  Future<void> hide() => platform.hide();

  ///{@macro cygnus_core.CygnusPlatformBrowser.close}
  ///
  ///{@macro cygnus_core.CygnusPlatformBrowser.close.supported_platforms}
  Future<void> close() => platform.close();

  ///{@macro cygnus_core.CygnusPlatformBrowser.isHidden}
  ///
  ///{@macro cygnus_core.CygnusPlatformBrowser.isHidden.supported_platforms}
  Future<bool> isHidden() => platform.isHidden();

  ///{@macro cygnus_core.CygnusPlatformBrowser.setOptions}
  ///
  ///{@macro cygnus_core.CygnusPlatformBrowser.setOptions.supported_platforms}
  @Deprecated('Use setSettings instead')
  Future<void> setOptions({required CygnusBrowserClassOptions options}) =>
      platform.setOptions(options: options);

  ///{@macro cygnus_core.CygnusPlatformBrowser.getOptions}
  ///
  ///{@macro cygnus_core.CygnusPlatformBrowser.getOptions.supported_platforms}
  @Deprecated('Use getSettings instead')
  Future<CygnusBrowserClassOptions?> getOptions() => platform.getOptions();

  ///{@macro cygnus_core.CygnusPlatformBrowser.setSettings}
  ///
  ///{@macro cygnus_core.CygnusPlatformBrowser.setSettings.supported_platforms}
  Future<void> setSettings({required CygnusBrowserClassSettings settings}) =>
      platform.setSettings(settings: settings);

  ///{@macro cygnus_core.CygnusPlatformBrowser.getSettings}
  ///
  ///{@macro cygnus_core.CygnusPlatformBrowser.getSettings.supported_platforms}
  Future<CygnusBrowserClassSettings?> getSettings() => platform.getSettings();

  ///{@macro cygnus_core.CygnusPlatformBrowser.isOpened}
  ///
  ///{@macro cygnus_core.CygnusPlatformBrowser.isOpened.supported_platforms}
  bool isOpened() => platform.isOpened();

  ///{@macro cygnus_core.CygnusPlatformBrowser.dispose}
  ///
  ///{@macro cygnus_core.CygnusPlatformBrowser.dispose.supported_platforms}
  @mustCallSuper
  void dispose() => platform.dispose();

  ///Use [onFormResubmission] instead.
  @Deprecated('Use onFormResubmission instead')
  @override
  FutureOr<CygnusFormResubmissionAction?>? androidOnFormResubmission(Uri? url) {
    return null;
  }

  ///Use [onGeolocationPermissionsHidePrompt] instead.
  @Deprecated("Use onGeolocationPermissionsHidePrompt instead")
  @override
  void androidOnGeolocationPermissionsHidePrompt() {}

  ///Use [onGeolocationPermissionsShowPrompt] instead.
  @Deprecated("Use onGeolocationPermissionsShowPrompt instead")
  @override
  FutureOr<CygnusGeolocationPermissionShowPromptResponse?>?
  androidOnGeolocationPermissionsShowPrompt(String origin) {
    return null;
  }

  ///Use [onJsBeforeUnload] instead.
  @Deprecated('Use onJsBeforeUnload instead')
  @override
  FutureOr<CygnusJsBeforeUnloadResponse?>? androidOnJsBeforeUnload(
    CygnusJsBeforeUnloadRequest jsBeforeUnloadRequest,
  ) {
    return null;
  }

  ///Use [onPermissionRequest] instead.
  @Deprecated("Use onPermissionRequest instead")
  @override
  FutureOr<CygnusPermissionRequestResponse?>? androidOnPermissionRequest(
    String origin,
    List<String> resources,
  ) {
    return null;
  }

  ///Use [onReceivedIcon] instead.
  @Deprecated('Use onReceivedIcon instead')
  @override
  void androidOnReceivedIcon(Uint8List icon) {}

  ///Use [onReceivedLoginRequest] instead.
  @Deprecated('Use onReceivedLoginRequest instead')
  @override
  void androidOnReceivedLoginRequest(CygnusLoginRequest loginRequest) {}

  ///Use [onReceivedTouchIconUrl] instead.
  @Deprecated('Use onReceivedTouchIconUrl instead')
  @override
  void androidOnReceivedTouchIconUrl(Uri url, bool precomposed) {}

  ///Use [onRenderProcessGone] instead.
  @Deprecated("Use onRenderProcessGone instead")
  @override
  void androidOnRenderProcessGone(CygnusRenderProcessGoneDetail detail) {}

  ///Use [onRenderProcessResponsive] instead.
  @Deprecated("Use onRenderProcessResponsive instead")
  @override
  FutureOr<CygnusWebViewRenderProcessAction?>? androidOnRenderProcessResponsive(
    Uri? url,
  ) {
    return null;
  }

  ///Use [onRenderProcessUnresponsive] instead.
  @Deprecated("Use onRenderProcessUnresponsive instead")
  @override
  FutureOr<CygnusWebViewRenderProcessAction?>? androidOnRenderProcessUnresponsive(
    Uri? url,
  ) {
    return null;
  }

  ///Use [onSafeBrowsingHit] instead.
  @Deprecated("Use onSafeBrowsingHit instead")
  @override
  FutureOr<CygnusSafeBrowsingResponse?>? androidOnSafeBrowsingHit(
    Uri url,
    CygnusSafeBrowsingThreat? threatType,
  ) {
    return null;
  }

  ///Use [onZoomScaleChanged] instead.
  @Deprecated('Use onZoomScaleChanged instead')
  @override
  void androidOnScaleChanged(double oldScale, double newScale) {}

  ///Use [shouldInterceptRequest] instead.
  @Deprecated("Use shouldInterceptRequest instead")
  @override
  FutureOr<CygnusWebResourceResponse?>? androidShouldInterceptRequest(
    CygnusWebResourceRequest request,
  ) {
    return null;
  }

  ///Use [onDidReceiveServerRedirectForProvisionalNavigation] instead.
  @Deprecated('Use onDidReceiveServerRedirectForProvisionalNavigation instead')
  @override
  void iosOnDidReceiveServerRedirectForProvisionalNavigation() {}

  ///Use [onNavigationResponse] instead.
  @Deprecated('Use onNavigationResponse instead')
  @override
  FutureOr<CygnusIOSNavigationResponseAction?>? iosOnNavigationResponse(
    CygnusIOSWKNavigationResponse navigationResponse,
  ) {
    return null;
  }

  ///Use [onWebContentProcessDidTerminate] instead.
  @Deprecated('Use onWebContentProcessDidTerminate instead')
  @override
  void iosOnWebContentProcessDidTerminate() {}

  ///Use [shouldAllowDeprecatedTLS] instead.
  @Deprecated('Use shouldAllowDeprecatedTLS instead')
  @override
  FutureOr<CygnusIOSShouldAllowDeprecatedTLSAction?>? iosShouldAllowDeprecatedTLS(
    CygnusURLAuthenticationChallenge challenge,
  ) {
    return null;
  }

  @override
  FutureOr<CygnusAjaxRequestAction?>? onAjaxProgress(CygnusAjaxRequest ajaxRequest) {
    return null;
  }

  @override
  FutureOr<CygnusAjaxRequestAction?>? onAjaxReadyStateChange(
    CygnusAjaxRequest ajaxRequest,
  ) {
    return null;
  }

  @override
  void onBrowserCreated() {}

  @override
  void onCameraCaptureStateChanged(
    CygnusMediaCaptureState? oldState,
    CygnusMediaCaptureState? newState,
  ) {}

  @override
  void onCloseWindow() {}

  @override
  void onConsoleMessage(CygnusConsoleMessage consoleMessage) {}

  @override
  void onContentSizeChanged(Size oldContentSize, Size newContentSize) {}

  @override
  FutureOr<bool?>? onCreateWindow(CygnusCreateWindowAction createWindowAction) {
    return null;
  }

  @override
  void onDidReceiveServerRedirectForProvisionalNavigation() {}

  ///Use [onDownloadStarting] instead
  @Deprecated('Use onDownloadStarting instead')
  @override
  void onDownloadStart(Uri url) {}

  ///Use [onDownloadStarting] instead
  @Deprecated('Use onDownloadStarting instead')
  @override
  void onDownloadStartRequest(CygnusDownloadStartRequest downloadStartRequest) {}

  @override
  FutureOr<CygnusDownloadStartResponse?>? onDownloadStarting(
    CygnusDownloadStartRequest downloadStartRequest,
  ) {
    return null;
  }

  @override
  void onEnterFullscreen() {}

  @override
  void onExit() {}

  @override
  void onExitFullscreen() {}

  @override
  void onContentLoading(CygnusWebUri? url) {}

  @override
  void onDOMContentLoaded(CygnusWebUri? url) {}

  ///Use [CygnusFindInteractionController.onFindResultReceived] instead.
  @Deprecated('Use CygnusFindInteractionController.onFindResultReceived instead')
  @override
  void onFindResultReceived(
    int activeMatchOrdinal,
    int numberOfMatches,
    bool isDoneCounting,
  ) {}

  @override
  FutureOr<CygnusFormResubmissionAction?>? onFormResubmission(CygnusWebUri? url) {
    return null;
  }

  @override
  void onGeolocationPermissionsHidePrompt() {}

  @override
  FutureOr<CygnusGeolocationPermissionShowPromptResponse?>?
  onGeolocationPermissionsShowPrompt(String origin) {
    return null;
  }

  @override
  FutureOr<CygnusJsAlertResponse?>? onJsAlert(CygnusJsAlertRequest jsAlertRequest) {
    return null;
  }

  @override
  FutureOr<CygnusJsBeforeUnloadResponse?>? onJsBeforeUnload(
    CygnusJsBeforeUnloadRequest jsBeforeUnloadRequest,
  ) {
    return null;
  }

  @override
  FutureOr<CygnusJsConfirmResponse?>? onJsConfirm(CygnusJsConfirmRequest jsConfirmRequest) {
    return null;
  }

  @override
  FutureOr<CygnusJsPromptResponse?>? onJsPrompt(CygnusJsPromptRequest jsPromptRequest) {
    return null;
  }

  ///Use [onReceivedError] instead.
  @Deprecated("Use onReceivedError instead")
  @override
  void onLoadError(Uri? url, int code, String message) {}

  ///Use [onReceivedHttpError] instead.
  @Deprecated("Use onReceivedHttpError instead")
  @override
  void onLoadHttpError(Uri? url, int statusCode, String description) {}

  @override
  void onLoadResource(CygnusLoadedResource resource) {}

  ///Use [onLoadResourceWithCustomScheme] instead.
  @Deprecated('Use onLoadResourceWithCustomScheme instead')
  @override
  FutureOr<CygnusCustomSchemeResponse?>? onLoadResourceCustomScheme(Uri url) {
    return null;
  }

  @override
  FutureOr<CygnusCustomSchemeResponse?>? onLoadResourceWithCustomScheme(
    CygnusWebResourceRequest request,
  ) {
    return null;
  }

  @override
  void onLoadStart(CygnusWebUri? url) {}

  @override
  void onLoadStop(CygnusWebUri? url) {}

  @override
  void onLongPressHitTestResult(CygnusWebViewHitTestResult hitTestResult) {}

  @override
  void onMicrophoneCaptureStateChanged(
    CygnusMediaCaptureState? oldState,
    CygnusMediaCaptureState? newState,
  ) {}

  @override
  FutureOr<CygnusNavigationResponseAction?>? onNavigationResponse(
    CygnusNavigationResponse navigationResponse,
  ) {
    return null;
  }

  @override
  void onOverScrolled(int x, int y, bool clampedX, bool clampedY) {}

  @override
  void onPageCommitVisible(CygnusWebUri? url) {}

  @override
  FutureOr<CygnusPermissionResponse?>? onPermissionRequest(
    CygnusPermissionRequest permissionRequest,
  ) {
    return null;
  }

  @override
  void onPermissionRequestCanceled(CygnusPermissionRequest permissionRequest) {}

  ///Use [onPrintRequest] instead
  @Deprecated("Use onPrintRequest instead")
  @override
  void onPrint(Uri? url) {}

  @override
  FutureOr<bool?>? onPrintRequest(
    CygnusWebUri? url,
    CygnusPlatformPrintJobController? printJobController,
  ) {
    return null;
  }

  @override
  void onProgressChanged(int progress) {}

  @override
  FutureOr<CygnusClientCertResponse?>? onReceivedClientCertRequest(
    CygnusClientCertChallenge challenge,
  ) {
    return null;
  }

  @override
  void onReceivedError(CygnusWebResourceRequest request, CygnusWebResourceError error) {}

  @override
  FutureOr<CygnusHttpAuthResponse?>? onReceivedHttpAuthRequest(
    CygnusHttpAuthenticationChallenge challenge,
  ) {
    return null;
  }

  @override
  void onReceivedHttpError(
    CygnusWebResourceRequest request,
    CygnusWebResourceResponse errorResponse,
  ) {}

  ///Use [onFaviconChanged] instead.
  @Deprecated('Use onFaviconChanged instead')
  @override
  void onReceivedIcon(Uint8List icon) {}

  @override
  void onFaviconChanged(CygnusFaviconChangedRequest faviconChangedRequest) {}

  @override
  void onReceivedLoginRequest(CygnusLoginRequest loginRequest) {}

  @override
  FutureOr<CygnusServerTrustAuthResponse?>? onReceivedServerTrustAuthRequest(
    CygnusServerTrustChallenge challenge,
  ) {
    return null;
  }

  @override
  void onReceivedTouchIconUrl(CygnusWebUri url, bool precomposed) {}

  @override
  FutureOr<CygnusNotificationReceivedResponse?>? onNotificationReceived(
    CygnusNotificationReceivedRequest request,
  ) {
    return null;
  }

  @override
  FutureOr<CygnusSaveAsUIShowingResponse?>? onSaveAsUIShowing(
    CygnusSaveAsUIShowingRequest request,
  ) {
    return null;
  }

  @override
  FutureOr<CygnusSaveFileSecurityCheckStartingResponse?>?
  onSaveFileSecurityCheckStarting(
    CygnusSaveFileSecurityCheckStartingRequest request,
  ) {
    return null;
  }

  @override
  FutureOr<CygnusScreenCaptureStartingResponse?>? onScreenCaptureStarting(
    CygnusScreenCaptureStartingRequest request,
  ) {
    return null;
  }

  @override
  FutureOr<CygnusLaunchingExternalUriSchemeResponse?>? onLaunchingExternalUriScheme(
    CygnusLaunchingExternalUriSchemeRequest request,
  ) {
    return null;
  }

  @override
  void onRenderProcessGone(CygnusRenderProcessGoneDetail detail) {}

  @override
  FutureOr<CygnusWebViewRenderProcessAction?>? onRenderProcessResponsive(
    CygnusWebUri? url,
  ) {
    return null;
  }

  @override
  FutureOr<CygnusWebViewRenderProcessAction?>? onRenderProcessUnresponsive(
    CygnusWebUri? url,
  ) {
    return null;
  }

  @override
  void onRequestFocus() {}

  @override
  FutureOr<CygnusSafeBrowsingResponse?>? onSafeBrowsingHit(
    CygnusWebUri url,
    CygnusSafeBrowsingThreat? threatType,
  ) {
    return null;
  }

  @override
  void onScrollChanged(int x, int y) {}

  @override
  void onTitleChanged(String? title) {}

  @override
  void onUpdateVisitedHistory(CygnusWebUri? url, bool? isReload) {}

  @override
  void onWebContentProcessDidTerminate() {}

  @override
  void onWindowBlur() {}

  @override
  void onWindowFocus() {}

  @override
  void onZoomScaleChanged(double oldScale, double newScale) {}

  @override
  FutureOr<CygnusShouldAllowDeprecatedTLSAction?>? shouldAllowDeprecatedTLS(
    CygnusURLAuthenticationChallenge challenge,
  ) {
    return null;
  }

  @override
  FutureOr<CygnusAjaxRequest?>? shouldInterceptAjaxRequest(CygnusAjaxRequest ajaxRequest) {
    return null;
  }

  @override
  FutureOr<CygnusFetchRequest?>? shouldInterceptFetchRequest(
    CygnusFetchRequest fetchRequest,
  ) {
    return null;
  }

  @override
  FutureOr<CygnusWebResourceResponse?>? shouldInterceptRequest(
    CygnusWebResourceRequest request,
  ) {
    return null;
  }

  @override
  FutureOr<CygnusNavigationActionPolicy?>? shouldOverrideUrlLoading(
    CygnusNavigationAction navigationAction,
  ) {
    return null;
  }

  @override
  void onMainWindowWillClose() {}

  @override
  void onProcessFailed(CygnusProcessFailedDetail detail) {}

  @override
  void onAcceleratorKeyPressed(CygnusAcceleratorKeyPressedDetail detail) {}

  @override
  FutureOr<CygnusShowFileChooserResponse?> onShowFileChooser(
    CygnusShowFileChooserRequest request,
  ) {
    return null;
  }

  ///{@macro cygnus_core.CygnusPlatformBrowser.isClassSupported}
  static bool isClassSupported({TargetPlatform? platform}) =>
      CygnusPlatformBrowser.static().isClassSupported(platform: platform);

  ///{@macro cygnus_core.CygnusPlatformBrowser.isPropertySupported}
  static bool isPropertySupported(
    CygnusPlatformBrowserProperty property, {
    TargetPlatform? platform,
  }) => CygnusPlatformBrowser.static().isPropertySupported(
    property,
    platform: platform,
  );

  ///{@macro cygnus_core.CygnusPlatformBrowser.isMethodSupported}
  static bool isMethodSupported(
    CygnusPlatformBrowserMethod property, {
    TargetPlatform? platform,
  }) => CygnusPlatformBrowser.static().isMethodSupported(
    property,
    platform: platform,
  );

  ///{@macro cygnus_core.CygnusPlatformBrowserEvents.isMethodSupported}
  static bool isEventMethodSupported(
    CygnusPlatformBrowserEventsMethod method, {
    TargetPlatform? platform,
  }) =>
      CygnusPlatformBrowserEvents.isMethodSupported(method, platform: platform);
}
