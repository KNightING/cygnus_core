import 'package:cygnus_core/src/platform_interface/flutter_webview_platform_interface.dart';

import 'chrome_safari_browser/chrome_safari_browser.dart';
import 'cookie_manager.dart';
import 'find_interaction/main.dart';
import 'http_auth_credentials_database.dart';
import 'browser/browser.dart';
import 'webview/main.dart';
import 'print_job/main.dart';
import 'process_global_config.dart';
import 'proxy_controller.dart';
import 'pull_to_refresh/main.dart';
import 'service_worker_controller.dart';
import 'tracing_controller.dart';
import 'web_message/main.dart';
import 'web_storage/main.dart';
import 'webview_asset_loader.dart';
import 'webview_feature.dart' as wv;

/// Implementation of [CygnusWebViewPlatform] using the WebView API.
class AndroidInAppWebViewPlatform extends CygnusWebViewPlatform {
  /// Registers this class as the default instance of [CygnusWebViewPlatform].
  static void registerWith() {
    CygnusWebViewPlatform.instance = AndroidInAppWebViewPlatform();
    // The platform view factory picks a composition mode synchronously, so whether Hybrid
    // Composition++ is available has to be known by then. Start resolving it here, at the
    // earliest point the plugin runs any Dart code.
    precacheHybridCompositionPlusPlusSupport();
  }

  /// Creates a new [AndroidCookieManager].
  ///
  /// This function should only be called by the app-facing package.
  /// Look at using [CygnusCookieManager] in `cygnus` instead.
  @override
  AndroidCookieManager createPlatformCookieManager(
    CygnusPlatformCookieManagerCreationParams params,
  ) {
    return AndroidCookieManager(params);
  }

  /// Creates a new empty [AndroidCookieManager] to access static methods.
  ///
  /// This function should only be called by the app-facing package.
  /// Look at using [CygnusCookieManager] in `cygnus` instead.
  @override
  AndroidCookieManager createPlatformCookieManagerStatic() {
    return AndroidCookieManager.static();
  }

  /// Creates a new [AndroidInAppWebViewController].
  ///
  /// This function should only be called by the app-facing package.
  /// Look at using [CygnusWebViewController] in `cygnus` instead.
  @override
  AndroidInAppWebViewController createPlatformWebViewController(
    CygnusPlatformWebViewControllerCreationParams params,
  ) {
    return AndroidInAppWebViewController(params);
  }

  /// Creates a new empty [AndroidInAppWebViewController] to access static methods.
  ///
  /// This function should only be called by the app-facing package.
  /// Look at using [CygnusWebViewController] in `cygnus` instead.
  @override
  AndroidInAppWebViewController createPlatformWebViewControllerStatic() {
    return AndroidInAppWebViewController.static();
  }

  /// Creates a new [AndroidInAppWebViewWidget].
  ///
  /// This function should only be called by the app-facing package.
  /// Look at using [CygnusWebView] in `cygnus` instead.
  @override
  AndroidInAppWebViewWidget createPlatformWebViewWidget(
    CygnusPlatformWebViewWidgetCreationParams params,
  ) {
    return AndroidInAppWebViewWidget(params);
  }

  /// Creates a new empty [AndroidInAppWebViewWidget] to access static methods.
  ///
  /// This function should only be called by the app-facing package.
  /// Look at using [CygnusWebView] in `cygnus` instead.
  @override
  AndroidInAppWebViewWidget createPlatformWebViewWidgetStatic() {
    return AndroidInAppWebViewWidget.static();
  }

  /// Creates a new [AndroidFindInteractionController].
  ///
  /// This function should only be called by the app-facing package.
  /// Look at using [CygnusFindInteractionController] in `cygnus` instead.
  @override
  AndroidFindInteractionController createPlatformFindInteractionController(
    CygnusPlatformFindInteractionControllerCreationParams params,
  ) {
    return AndroidFindInteractionController(params);
  }

  /// Creates a new empty [AndroidFindInteractionController] to access static methods.
  ///
  /// This function should only be called by the app-facing package.
  /// Look at using [CygnusFindInteractionController] in `cygnus` instead.
  @override
  AndroidFindInteractionController
  createPlatformFindInteractionControllerStatic() {
    return AndroidFindInteractionController.static();
  }

  /// Creates a new [AndroidPrintJobController].
  ///
  /// This function should only be called by the app-facing package.
  /// Look at using [CygnusPrintJobController] in `cygnus` instead.
  @override
  AndroidPrintJobController createPlatformPrintJobController(
    CygnusPlatformPrintJobControllerCreationParams params,
  ) {
    return AndroidPrintJobController(params);
  }

  /// Creates a new empty [CygnusPlatformPrintJobController] to access static methods.
  ///
  /// This function should only be called by the app-facing package.
  /// Look at using [CygnusPrintJobController] in `cygnus` instead.
  @override
  AndroidPrintJobController createPlatformPrintJobControllerStatic() {
    return AndroidPrintJobController.static();
  }

  /// Creates a new [AndroidPullToRefreshController].
  ///
  /// This function should only be called by the app-facing package.
  /// Look at using [CygnusPullToRefreshController] in `cygnus` instead.
  @override
  AndroidPullToRefreshController createPlatformPullToRefreshController(
    CygnusPlatformPullToRefreshControllerCreationParams params,
  ) {
    return AndroidPullToRefreshController(params);
  }

  /// Creates a new empty [AndroidPullToRefreshController] to access static methods.
  ///
  /// This function should only be called by the app-facing package.
  /// Look at using [CygnusPullToRefreshController] in `cygnus` instead.
  @override
  AndroidPullToRefreshController createPlatformPullToRefreshControllerStatic() {
    return AndroidPullToRefreshController.static();
  }

  /// Creates a new [AndroidWebMessageChannel].
  ///
  /// This function should only be called by the app-facing package.
  /// Look at using [CygnusWebMessageChannel] in `cygnus` instead.
  @override
  AndroidWebMessageChannel createPlatformWebMessageChannel(
    CygnusPlatformWebMessageChannelCreationParams params,
  ) {
    return AndroidWebMessageChannel(params);
  }

  /// Creates a new empty [AndroidWebMessageChannel] to access static methods.
  ///
  /// This function should only be called by the app-facing package.
  /// Look at using [CygnusWebMessageChannel] in `cygnus` instead.
  @override
  AndroidWebMessageChannel createPlatformWebMessageChannelStatic() {
    return AndroidWebMessageChannel.static();
  }

  /// Creates a new [AndroidWebMessageListener].
  ///
  /// This function should only be called by the app-facing package.
  /// Look at using [CygnusWebMessageListener] in `cygnus` instead.
  @override
  AndroidWebMessageListener createPlatformWebMessageListener(
    CygnusPlatformWebMessageListenerCreationParams params,
  ) {
    return AndroidWebMessageListener(params);
  }

  /// Creates a new empty [AndroidWebMessageListener] to access static methods.
  ///
  /// This function should only be called by the app-facing package.
  /// Look at using [CygnusWebMessageListener] in `cygnus` instead.
  @override
  AndroidWebMessageListener createPlatformWebMessageListenerStatic() {
    return AndroidWebMessageListener.static();
  }

  /// Creates a new [AndroidJavaScriptReplyProxy].
  ///
  /// This function should only be called by the app-facing package.
  /// Look at using [CygnusJavaScriptReplyProxy] in `cygnus` instead.
  @override
  AndroidJavaScriptReplyProxy createPlatformJavaScriptReplyProxy(
    CygnusPlatformJavaScriptReplyProxyCreationParams params,
  ) {
    return AndroidJavaScriptReplyProxy(params);
  }

  /// Creates a new [AndroidWebMessagePort].
  ///
  /// This function should only be called by the app-facing package.
  /// Look at using [CygnusWebMessagePort] in `cygnus` instead.
  @override
  AndroidWebMessagePort createPlatformWebMessagePort(
    CygnusPlatformWebMessagePortCreationParams params,
  ) {
    return AndroidWebMessagePort(params);
  }

  /// Creates a new [AndroidWebStorage].
  ///
  /// This function should only be called by the app-facing package.
  /// Look at using [CygnusWebStorage] in `cygnus` instead.
  @override
  AndroidWebStorage createPlatformWebStorage(
    CygnusPlatformWebStorageCreationParams params,
  ) {
    return AndroidWebStorage(params);
  }

  /// Creates a new empty [AndroidWebStorage] to access static methods.
  ///
  /// This function should only be called by the app-facing package.
  /// Look at using [CygnusWebStorage] in `cygnus` instead.
  @override
  AndroidWebStorage createPlatformWebStorageStatic() {
    return AndroidWebStorage(
      AndroidWebStorageCreationParams(
        localStorage: createPlatformLocalStorageStatic(),
        sessionStorage: createPlatformSessionStorageStatic(),
      ),
    );
  }

  /// Creates a new [AndroidLocalStorage].
  ///
  /// This function should only be called by the app-facing package.
  /// Look at using [CygnusLocalStorage] in `cygnus` instead.
  @override
  AndroidLocalStorage createPlatformLocalStorage(
    CygnusPlatformLocalStorageCreationParams params,
  ) {
    return AndroidLocalStorage(params);
  }

  /// Creates a new empty [AndroidLocalStorage] to access static methods.
  ///
  /// This function should only be called by the app-facing package.
  /// Look at using [CygnusLocalStorage] in `cygnus` instead.
  @override
  AndroidLocalStorage createPlatformLocalStorageStatic() {
    return AndroidLocalStorage.defaultStorage(controller: null);
  }

  /// Creates a new [AndroidSessionStorage].
  ///
  /// This function should only be called by the app-facing package.
  /// Look at using [CygnusSessionStorage] in `cygnus` instead.
  @override
  AndroidSessionStorage createPlatformSessionStorage(
    CygnusPlatformSessionStorageCreationParams params,
  ) {
    return AndroidSessionStorage(params);
  }

  /// Creates a new empty [AndroidSessionStorage] to access static methods.
  ///
  /// This function should only be called by the app-facing package.
  /// Look at using [CygnusSessionStorage] in `cygnus` instead.
  @override
  AndroidSessionStorage createPlatformSessionStorageStatic() {
    return AndroidSessionStorage.defaultStorage(controller: null);
  }

  /// Creates a new [AndroidHeadlessInAppWebView].
  ///
  /// This function should only be called by the app-facing package.
  /// Look at using [CygnusHeadlessWebView] in `cygnus` instead.
  @override
  AndroidHeadlessInAppWebView createPlatformHeadlessWebView(
    CygnusPlatformHeadlessWebViewCreationParams params,
  ) {
    return AndroidHeadlessInAppWebView(params);
  }

  /// Creates a new empty [AndroidHeadlessInAppWebView] to access static methods.
  ///
  /// This function should only be called by the app-facing package.
  /// Look at using [CygnusHeadlessWebView] in `cygnus` instead.
  @override
  AndroidHeadlessInAppWebView createPlatformHeadlessWebViewStatic() {
    return AndroidHeadlessInAppWebView.static();
  }

  /// Creates a new [AndroidHttpAuthCredentialDatabase].
  ///
  /// This function should only be called by the app-facing package.
  /// Look at using [CygnusHttpAuthCredentialDatabase] in `cygnus` instead.
  @override
  AndroidHttpAuthCredentialDatabase createPlatformHttpAuthCredentialDatabase(
    CygnusPlatformHttpAuthCredentialDatabaseCreationParams params,
  ) {
    return AndroidHttpAuthCredentialDatabase(params);
  }

  /// Creates a new empty [AndroidHttpAuthCredentialDatabase] to access static methods.
  ///
  /// This function should only be called by the app-facing package.
  /// Look at using [CygnusHttpAuthCredentialDatabase] in `cygnus` instead.
  @override
  AndroidHttpAuthCredentialDatabase
  createPlatformHttpAuthCredentialDatabaseStatic() {
    return AndroidHttpAuthCredentialDatabase.static();
  }

  /// Creates a new [AndroidInAppBrowser].
  ///
  /// This function should only be called by the app-facing package.
  /// Look at using [CygnusBrowser] in `cygnus` instead.
  @override
  AndroidInAppBrowser createPlatformBrowser(
    CygnusPlatformBrowserCreationParams params,
  ) {
    return AndroidInAppBrowser(params);
  }

  /// Creates a new empty [AndroidInAppBrowser] to access static methods.
  ///
  /// This function should only be called by the app-facing package.
  /// Look at using [CygnusBrowser] in `cygnus` instead.
  @override
  AndroidInAppBrowser createPlatformBrowserStatic() {
    return AndroidInAppBrowser.static();
  }

  /// Creates a new [AndroidProcessGlobalConfig].
  ///
  /// This function should only be called by the app-facing package.
  /// Look at using [CygnusProcessGlobalConfig] in `cygnus` instead.
  @override
  AndroidProcessGlobalConfig createPlatformProcessGlobalConfig(
    CygnusPlatformProcessGlobalConfigCreationParams params,
  ) {
    return AndroidProcessGlobalConfig(params);
  }

  /// Creates a new empty [AndroidProcessGlobalConfig] to access static methods.
  ///
  /// This function should only be called by the app-facing package.
  /// Look at using [CygnusProcessGlobalConfig] in `cygnus` instead.
  @override
  AndroidProcessGlobalConfig createPlatformProcessGlobalConfigStatic() {
    return AndroidProcessGlobalConfig.static();
  }

  /// Creates a new [AndroidProxyController].
  ///
  /// This function should only be called by the app-facing package.
  /// Look at using [CygnusProxyController] in `cygnus` instead.
  @override
  AndroidProxyController createPlatformProxyController(
    CygnusPlatformProxyControllerCreationParams params,
  ) {
    return AndroidProxyController(params);
  }

  /// Creates a new empty [AndroidProxyController] to access static methods.
  ///
  /// This function should only be called by the app-facing package.
  /// Look at using [CygnusProxyController] in `cygnus` instead.
  @override
  AndroidProxyController createPlatformProxyControllerStatic() {
    return AndroidProxyController.static();
  }

  /// Creates a new [AndroidServiceWorkerController].
  ///
  /// This function should only be called by the app-facing package.
  /// Look at using [CygnusServiceWorkerController] in `cygnus` instead.
  @override
  AndroidServiceWorkerController createPlatformServiceWorkerController(
    CygnusPlatformServiceWorkerControllerCreationParams params,
  ) {
    return AndroidServiceWorkerController(params);
  }

  /// Creates a new empty [AndroidServiceWorkerController] to access static methods.
  ///
  /// This function should only be called by the app-facing package.
  /// Look at using [CygnusServiceWorkerController] in `cygnus` instead.
  @override
  AndroidServiceWorkerController createPlatformServiceWorkerControllerStatic() {
    return AndroidServiceWorkerController.static();
  }

  /// Creates a new [AndroidTracingController].
  ///
  /// This function should only be called by the app-facing package.
  /// Look at using [CygnusTracingController] in `cygnus` instead.
  @override
  AndroidTracingController createPlatformTracingController(
    CygnusPlatformTracingControllerCreationParams params,
  ) {
    return AndroidTracingController(params);
  }

  /// Creates a new empty [AndroidTracingController] to access static methods.
  ///
  /// This function should only be called by the app-facing package.
  /// Look at using [CygnusTracingController] in `cygnus` instead.
  @override
  AndroidTracingController createPlatformTracingControllerStatic() {
    return AndroidTracingController.static();
  }

  /// Creates a new [AndroidAssetsPathHandler].
  ///
  /// This function should only be called by the app-facing package.
  /// Look at using [CygnusAssetsPathHandler] in `cygnus` instead.
  @override
  AndroidAssetsPathHandler createPlatformAssetsPathHandler(
    CygnusPlatformAssetsPathHandlerCreationParams params,
  ) {
    return AndroidAssetsPathHandler(params);
  }

  /// Creates a new [AndroidResourcesPathHandler].
  ///
  /// This function should only be called by the app-facing package.
  /// Look at using [CygnusResourcesPathHandler] in `cygnus` instead.
  @override
  AndroidResourcesPathHandler createPlatformResourcesPathHandler(
    CygnusPlatformResourcesPathHandlerCreationParams params,
  ) {
    return AndroidResourcesPathHandler(params);
  }

  /// Creates a new [AndroidInternalStoragePathHandler].
  ///
  /// This function should only be called by the app-facing package.
  /// Look at using [CygnusInternalStoragePathHandler] in `cygnus` instead.
  @override
  AndroidInternalStoragePathHandler createPlatformInternalStoragePathHandler(
    CygnusPlatformInternalStoragePathHandlerCreationParams params,
  ) {
    return AndroidInternalStoragePathHandler(params);
  }

  /// Creates a new [AndroidCustomPathHandler].
  ///
  /// This function should only be called by the app-facing package.
  /// Look at using [CygnusCustomPathHandler] in `cygnus` instead.
  @override
  AndroidCustomPathHandler createPlatformCustomPathHandler(
    CygnusPlatformCustomPathHandlerCreationParams params,
  ) {
    return AndroidCustomPathHandler(params);
  }

  /// Creates a new empty [AndroidAssetsPathHandler] to access static methods.
  ///
  /// This function should only be called by the app-facing package.
  /// Look at using [CygnusAssetsPathHandler] in `cygnus` instead.
  @override
  AndroidAssetsPathHandler createPlatformAssetsPathHandlerStatic() {
    return AndroidAssetsPathHandler.static();
  }

  /// Creates a new empty [AndroidResourcesPathHandler] to access static methods.
  ///
  /// This function should only be called by the app-facing package.
  /// Look at using [CygnusResourcesPathHandler] in `cygnus` instead.
  @override
  AndroidResourcesPathHandler createPlatformResourcesPathHandlerStatic() {
    return AndroidResourcesPathHandler.static();
  }

  /// Creates a new empty [AndroidInternalStoragePathHandler] to access static methods.
  ///
  /// This function should only be called by the app-facing package.
  /// Look at using [CygnusInternalStoragePathHandler] in `cygnus` instead.
  @override
  AndroidInternalStoragePathHandler
  createPlatformInternalStoragePathHandlerStatic() {
    return AndroidInternalStoragePathHandler.static();
  }

  /// Creates a new empty [AndroidCustomPathHandler] to access static methods.
  ///
  /// This function should only be called by the app-facing package.
  /// Look at using [CygnusCustomPathHandler] in `cygnus` instead.
  @override
  AndroidCustomPathHandler createPlatformCustomPathHandlerStatic() {
    return AndroidCustomPathHandler.static();
  }

  /// Creates a new [wv.AndroidWebViewFeature].
  ///
  /// This function should only be called by the app-facing package.
  /// Look at using [CygnusWebViewFeature] in `cygnus` instead.
  @override
  wv.AndroidWebViewFeature createPlatformWebViewFeature(
    CygnusPlatformWebViewFeatureCreationParams params,
  ) {
    return wv.AndroidWebViewFeature(params);
  }

  /// Creates a new empty [wv.AndroidWebViewFeature] to access static methods.
  ///
  /// This function should only be called by the app-facing package.
  /// Look at using [CygnusWebViewFeature] in `cygnus` instead.
  @override
  wv.AndroidWebViewFeature createPlatformWebViewFeatureStatic() {
    return wv.AndroidWebViewFeature.static();
  }

  /// Creates a new [AndroidChromeSafariBrowser].
  ///
  /// This function should only be called by the app-facing package.
  /// Look at using [CygnusChromeSafariBrowser] in `cygnus` instead.
  @override
  AndroidChromeSafariBrowser createPlatformChromeSafariBrowser(
    CygnusPlatformChromeSafariBrowserCreationParams params,
  ) {
    return AndroidChromeSafariBrowser(params);
  }

  /// Creates a new empty [AndroidChromeSafariBrowser] to access static methods.
  ///
  /// This function should only be called by the app-facing package.
  /// Look at using [CygnusChromeSafariBrowser] in `cygnus` instead.
  @override
  AndroidChromeSafariBrowser createPlatformChromeSafariBrowserStatic() {
    return AndroidChromeSafariBrowser.static();
  }

  /// Creates a new empty [AndroidWebStorageManager] to access static methods.
  ///
  /// This function should only be called by the app-facing package.
  /// Look at using [CygnusWebStorageManager] in `cygnus` instead.
  @override
  AndroidWebStorageManager createPlatformWebStorageManager(
    CygnusPlatformWebStorageManagerCreationParams params,
  ) {
    return AndroidWebStorageManager(params);
  }

  /// Creates a new empty [AndroidWebStorageManager] to access static methods.
  ///
  /// This function should only be called by the app-facing package.
  /// Look at using [CygnusWebStorageManager] in `cygnus` instead.
  @override
  AndroidWebStorageManager createPlatformWebStorageManagerStatic() {
    return AndroidWebStorageManager.static();
  }

  /// Creates a new [CygnusDefaultLocalhostServer].
  ///
  /// This function should only be called by the app-facing package.
  /// Look at using [CygnusLocalhostServer] in `cygnus` instead.
  @override
  CygnusDefaultLocalhostServer createPlatformLocalhostServer(
    CygnusPlatformLocalhostServerCreationParams params,
  ) {
    return CygnusDefaultLocalhostServer(params);
  }

  /// Creates a new empty [CygnusDefaultLocalhostServer] to access static methods.
  ///
  /// This function should only be called by the app-facing package.
  /// Look at using [CygnusLocalhostServer] in `cygnus` instead.
  @override
  CygnusDefaultLocalhostServer createPlatformLocalhostServerStatic() {
    return CygnusDefaultLocalhostServer.static();
  }

  // ************************************************************************ //
  // Create static instances of unsupported classes to be able to call        //
  // isClassSupported, isMethodSupported, isPropertySupported, etc.           //
  // static methods without throwing a missing platform implementation        //
  // exception.                                                               //
  // ************************************************************************ //

  /// Creates a new empty [CygnusPlatformWebViewEnvironment] to access static methods.
  ///
  /// This function should only be called by the app-facing package.
  /// Look at using [CygnusWebViewEnvironment] in `cygnus` instead.
  @override
  CygnusPlatformWebViewEnvironment createPlatformWebViewEnvironmentStatic() {
    return _PlatformWebViewEnvironment.static();
  }

  /// Creates a new empty [CygnusPlatformWebAuthenticationSession] to access static methods.
  ///
  /// This function should only be called by the app-facing package.
  /// Look at using [CygnusWebAuthenticationSession] in `cygnus` instead.
  @override
  CygnusPlatformWebAuthenticationSession
  createPlatformWebAuthenticationSessionStatic() {
    return _PlatformWebAuthenticationSession.static();
  }

  /// Creates a new empty [CygnusPlatformWebNotificationController] to access static methods.
  ///
  /// This function should only be called by the app-facing package.
  /// Look at using [CygnusWebNotificationController] in `cygnus` instead.
  @override
  CygnusPlatformWebNotificationController
  createPlatformWebNotificationControllerStatic() {
    return _PlatformWebNotificationController.static();
  }
}

class _PlatformWebAuthenticationSession
    extends CygnusPlatformWebAuthenticationSession {
  _PlatformWebAuthenticationSession(
    CygnusPlatformWebAuthenticationSessionCreationParams params,
  ) : super.implementation(params);

  static final _PlatformWebAuthenticationSession _staticValue =
      _PlatformWebAuthenticationSession(
        const CygnusPlatformWebAuthenticationSessionCreationParams(),
      );

  factory _PlatformWebAuthenticationSession.static() => _staticValue;
}

class _PlatformWebViewEnvironment extends CygnusPlatformWebViewEnvironment {
  _PlatformWebViewEnvironment(CygnusPlatformWebViewEnvironmentCreationParams params)
    : super.implementation(params);
  static final _PlatformWebViewEnvironment _staticValue =
      _PlatformWebViewEnvironment(
        const CygnusPlatformWebViewEnvironmentCreationParams(),
      );

  factory _PlatformWebViewEnvironment.static() => _staticValue;
}

class _PlatformWebNotificationController
    extends CygnusPlatformWebNotificationController {
  _PlatformWebNotificationController(
    CygnusPlatformWebNotificationControllerCreationParams params,
  ) : super.implementation(params);

  static final _PlatformWebNotificationController _staticValue =
      _PlatformWebNotificationController(
        CygnusPlatformWebNotificationControllerCreationParams(
          id: '',
          notification: CygnusWebNotification(),
        ),
      );

  factory _PlatformWebNotificationController.static() => _staticValue;
}
