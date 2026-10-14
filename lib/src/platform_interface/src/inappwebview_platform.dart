import 'package:flutter/foundation.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'chrome_safari_browser/platform_chrome_safari_browser.dart';
import 'find_interaction/platform_find_interaction_controller.dart';
import 'in_app_browser/platform_in_app_browser.dart';
import 'in_app_localhost_server.dart';
import 'in_app_webview/platform_headless_in_app_webview.dart';
import 'in_app_webview/platform_inappwebview_controller.dart';
import 'in_app_webview/platform_inappwebview_widget.dart';
import 'platform_cookie_manager.dart';
import 'platform_http_auth_credentials_database.dart';
import 'platform_in_app_localhost_server.dart';
import 'platform_process_global_config.dart';
import 'platform_proxy_controller.dart';
import 'platform_service_worker_controller.dart';
import 'platform_tracing_controller.dart';
import 'platform_webview_asset_loader.dart';
import 'platform_webview_feature.dart';
import 'print_job/platform_print_job_controller.dart';
import 'pull_to_refresh/platform_pull_to_refresh_controller.dart';
import 'web_authentication_session/platform_web_authenticate_session.dart';
import 'web_message/platform_web_message_channel.dart';
import 'web_message/platform_web_message_listener.dart';
import 'web_message/platform_web_message_port.dart';
import 'web_notification/platform_web_notification_controller.dart';
import 'web_storage/platform_web_storage.dart';
import 'web_storage/platform_web_storage_manager.dart';
import 'webview_environment/platform_webview_environment.dart';

// Logs the donation link in debug mode only once.
// If you are reading this, consider supporting the
// development of this project, thanks!
bool _alreadyShown = false;
void _logPluginSupportLinks() {
  if (_alreadyShown || !kDebugMode) return;
  _alreadyShown = true;
  print("""\n
🚀 Hi, flutter_inappwebview here, thank you for using it! If you like this plugin → 💙 Support development https://inappwebview.dev/donate ⭐ Star on GitHub https://github.com/pichillilorenzo/flutter_inappwebview 📱 Showcase your app https://inappwebview.dev/showcase
""");
}

/// Interface for a platform implementation of a WebView.
abstract class CygnusWebViewPlatform extends PlatformInterface {
  /// Creates a new [CygnusWebViewPlatform].
  CygnusWebViewPlatform() : super(token: _token) {
    _logPluginSupportLinks();
  }

  static final Object _token = Object();

  static CygnusWebViewPlatform? _instance;

  /// The instance of [CygnusWebViewPlatform] to use.
  static CygnusWebViewPlatform? get instance => _instance;

  /// Platform-specific plugins should set this with their own platform-specific
  /// class that extends [CygnusWebViewPlatform] when they register themselves.
  static set instance(CygnusWebViewPlatform? instance) {
    if (instance == null) {
      throw AssertionError(
        'Platform interfaces can only be set to a non-null instance',
      );
    }

    PlatformInterface.verify(instance, _token);
    _instance = instance;
  }

  /// Creates a new [CygnusPlatformCookieManager].
  ///
  /// This function should only be called by the app-facing package.
  /// Look at using [CygnusCookieManager] in `flutter_inappwebview` instead.
  CygnusPlatformCookieManager createPlatformCookieManager(
    CygnusPlatformCookieManagerCreationParams params,
  ) {
    throw UnimplementedError(
      'createPlatformCookieManager is not implemented on the current platform.',
    );
  }

  /// Creates a new empty [CygnusPlatformCookieManager] to access static methods.
  ///
  /// This function should only be called by the app-facing package.
  /// Look at using [CygnusCookieManager] in `flutter_inappwebview` instead.
  CygnusPlatformCookieManager createPlatformCookieManagerStatic() {
    throw UnimplementedError(
      'createPlatformCookieManagerStatic is not implemented on the current platform.',
    );
  }

  /// Creates a new [CygnusPlatformWebViewController].
  ///
  /// This function should only be called by the app-facing package.
  /// Look at using [CygnusWebViewController] in `flutter_inappwebview` instead.
  CygnusPlatformWebViewController createPlatformWebViewController(
    CygnusPlatformWebViewControllerCreationParams params,
  ) {
    throw UnimplementedError(
      'createPlatformWebViewController is not implemented on the current platform.',
    );
  }

  /// Creates a new empty [CygnusPlatformWebViewController] to access static methods.
  ///
  /// This function should only be called by the app-facing package.
  /// Look at using [CygnusWebViewController] in `flutter_inappwebview` instead.
  CygnusPlatformWebViewController createPlatformWebViewControllerStatic() {
    throw UnimplementedError(
      'createPlatformWebViewControllerStatic is not implemented on the current platform.',
    );
  }

  /// Creates a new [CygnusPlatformWebViewWidget].
  ///
  /// This function should only be called by the app-facing package.
  /// Look at using [CygnusWebView] in `flutter_inappwebview` instead.
  CygnusPlatformWebViewWidget createPlatformWebViewWidget(
    CygnusPlatformWebViewWidgetCreationParams params,
  ) {
    throw UnimplementedError(
      'createPlatformWebViewWidget is not implemented on the current platform.',
    );
  }

  /// Creates a new empty [CygnusPlatformWebViewWidget] to access static methods.
  ///
  /// This function should only be called by the app-facing package.
  /// Look at using [CygnusWebView] in `flutter_inappwebview` instead.
  CygnusPlatformWebViewWidget createPlatformWebViewWidgetStatic() {
    throw UnimplementedError(
      'createPlatformWebViewWidgetStatic is not implemented on the current platform.',
    );
  }

  /// Creates a new [CygnusPlatformFindInteractionController].
  ///
  /// This function should only be called by the app-facing package.
  /// Look at using [CygnusFindInteractionController] in `flutter_inappwebview` instead.
  CygnusPlatformFindInteractionController createPlatformFindInteractionController(
    CygnusPlatformFindInteractionControllerCreationParams params,
  ) {
    throw UnimplementedError(
      'createPlatformFindInteractionController is not implemented on the current platform.',
    );
  }

  /// Creates a new empty [CygnusPlatformFindInteractionController] to access static methods.
  ///
  /// This function should only be called by the app-facing package.
  /// Look at using [CygnusFindInteractionController] in `flutter_inappwebview` instead.
  CygnusPlatformFindInteractionController
  createPlatformFindInteractionControllerStatic() {
    throw UnimplementedError(
      'createPlatformFindInteractionControllerStatic is not implemented on the current platform.',
    );
  }

  /// Creates a new [CygnusPlatformPrintJobController].
  ///
  /// This function should only be called by the app-facing package.
  /// Look at using [CygnusPrintJobController] in `flutter_inappwebview` instead.
  CygnusPlatformPrintJobController createPlatformPrintJobController(
    CygnusPlatformPrintJobControllerCreationParams params,
  ) {
    throw UnimplementedError(
      'createPlatformPrintJobController is not implemented on the current platform.',
    );
  }

  /// Creates a new empty [CygnusPlatformPrintJobController] to access static methods.
  ///
  /// This function should only be called by the app-facing package.
  /// Look at using [CygnusPrintJobController] in `flutter_inappwebview` instead.
  CygnusPlatformPrintJobController createPlatformPrintJobControllerStatic() {
    throw UnimplementedError(
      'createPlatformPrintJobControllerStatic is not implemented on the current platform.',
    );
  }

  /// Creates a new [CygnusPlatformPullToRefreshController].
  ///
  /// This function should only be called by the app-facing package.
  /// Look at using [CygnusPullToRefreshController] in `flutter_inappwebview` instead.
  CygnusPlatformPullToRefreshController createPlatformPullToRefreshController(
    CygnusPlatformPullToRefreshControllerCreationParams params,
  ) {
    throw UnimplementedError(
      'createPlatformPullToRefreshController is not implemented on the current platform.',
    );
  }

  /// Creates a new empty [CygnusPlatformPullToRefreshController] to access static methods.
  ///
  /// This function should only be called by the app-facing package.
  /// Look at using [CygnusPullToRefreshController] in `flutter_inappwebview` instead.
  CygnusPlatformPullToRefreshController
  createPlatformPullToRefreshControllerStatic() {
    throw UnimplementedError(
      'createPlatformPullToRefreshControllerStatic is not implemented on the current platform.',
    );
  }

  /// Creates a new [CygnusPlatformWebAuthenticationSession].
  ///
  /// This function should only be called by the app-facing package.
  /// Look at using [CygnusWebAuthenticationSession] in `flutter_inappwebview` instead.
  CygnusPlatformWebAuthenticationSession createPlatformWebAuthenticationSession(
    CygnusPlatformWebAuthenticationSessionCreationParams params,
  ) {
    throw UnimplementedError(
      'createPlatformWebAuthenticationSession is not implemented on the current platform.',
    );
  }

  /// Creates a new empty [CygnusPlatformWebAuthenticationSession] to access static methods.
  ///
  /// This function should only be called by the app-facing package.
  /// Look at using [CygnusWebAuthenticationSession] in `flutter_inappwebview` instead.
  CygnusPlatformWebAuthenticationSession
  createPlatformWebAuthenticationSessionStatic() {
    throw UnimplementedError(
      'createPlatformWebAuthenticationSessionStatic is not implemented on the current platform.',
    );
  }

  /// Creates a new [CygnusPlatformWebMessageChannel].
  ///
  /// This function should only be called by the app-facing package.
  /// Look at using [CygnusWebMessageChannel] in `flutter_inappwebview` instead.
  CygnusPlatformWebMessageChannel createPlatformWebMessageChannel(
    CygnusPlatformWebMessageChannelCreationParams params,
  ) {
    throw UnimplementedError(
      'createPlatformWebMessageChannel is not implemented on the current platform.',
    );
  }

  /// Creates a new empty [CygnusPlatformWebMessageChannel] to access static methods.
  ///
  /// This function should only be called by the app-facing package.
  /// Look at using [CygnusWebMessageChannel] in `flutter_inappwebview` instead.
  CygnusPlatformWebMessageChannel createPlatformWebMessageChannelStatic() {
    throw UnimplementedError(
      'createPlatformWebMessageChannelStatic is not implemented on the current platform.',
    );
  }

  /// Creates a new [CygnusPlatformWebMessageListener].
  ///
  /// This function should only be called by the app-facing package.
  /// Look at using [CygnusWebMessageListener] in `flutter_inappwebview` instead.
  CygnusPlatformWebMessageListener createPlatformWebMessageListener(
    CygnusPlatformWebMessageListenerCreationParams params,
  ) {
    throw UnimplementedError(
      'createPlatformWebMessageListener is not implemented on the current platform.',
    );
  }

  /// Creates a new empty [CygnusPlatformWebMessageListener] to access static methods.
  ///
  /// This function should only be called by the app-facing package.
  /// Look at using [CygnusWebMessageListener] in `flutter_inappwebview` instead.
  CygnusPlatformWebMessageListener createPlatformWebMessageListenerStatic() {
    throw UnimplementedError(
      'createPlatformWebMessageListenerStatic is not implemented on the current platform.',
    );
  }

  /// Creates a new [CygnusPlatformJavaScriptReplyProxy].
  ///
  /// This function should only be called by the app-facing package.
  /// Look at using [CygnusJavaScriptReplyProxy] in `flutter_inappwebview` instead.
  CygnusPlatformJavaScriptReplyProxy createPlatformJavaScriptReplyProxy(
    CygnusPlatformJavaScriptReplyProxyCreationParams params,
  ) {
    throw UnimplementedError(
      'createPlatformJavaScriptReplyProxy is not implemented on the current platform.',
    );
  }

  /// Creates a new [CygnusPlatformWebMessagePort].
  ///
  /// This function should only be called by the app-facing package.
  /// Look at using [CygnusWebMessagePort] in `flutter_inappwebview` instead.
  CygnusPlatformWebMessagePort createPlatformWebMessagePort(
    CygnusPlatformWebMessagePortCreationParams params,
  ) {
    throw UnimplementedError(
      'createPlatformWebMessagePort is not implemented on the current platform.',
    );
  }

  /// Creates a new [CygnusPlatformWebStorage].
  ///
  /// This function should only be called by the app-facing package.
  /// Look at using [CygnusWebStorage] in `flutter_inappwebview` instead.
  CygnusPlatformWebStorage createPlatformWebStorage(
    CygnusPlatformWebStorageCreationParams params,
  ) {
    throw UnimplementedError(
      'createPlatformWebStorage is not implemented on the current platform.',
    );
  }

  /// Creates a new empty [CygnusPlatformWebStorage] to access static methods.
  ///
  /// This function should only be called by the app-facing package.
  /// Look at using [CygnusWebStorage] in `flutter_inappwebview` instead.
  CygnusPlatformWebStorage createPlatformWebStorageStatic() {
    throw UnimplementedError(
      'createPlatformWebStorageStatic is not implemented on the current platform.',
    );
  }

  /// Creates a new [CygnusPlatformLocalStorage].
  ///
  /// This function should only be called by the app-facing package.
  /// Look at using [CygnusLocalStorage] in `flutter_inappwebview` instead.
  CygnusPlatformLocalStorage createPlatformLocalStorage(
    CygnusPlatformLocalStorageCreationParams params,
  ) {
    throw UnimplementedError(
      'createPlatformLocalStorage is not implemented on the current platform.',
    );
  }

  /// Creates a new empty [CygnusPlatformLocalStorage] to access static methods.
  ///
  /// This function should only be called by the app-facing package.
  /// Look at using [CygnusLocalStorage] in `flutter_inappwebview` instead.
  CygnusPlatformLocalStorage createPlatformLocalStorageStatic() {
    throw UnimplementedError(
      'createPlatformLocalStorageStatic is not implemented on the current platform.',
    );
  }

  /// Creates a new [CygnusPlatformSessionStorage].
  ///
  /// This function should only be called by the app-facing package.
  /// Look at using [CygnusPlatformSessionStorage] in `flutter_inappwebview` instead.
  CygnusPlatformSessionStorage createPlatformSessionStorage(
    CygnusPlatformSessionStorageCreationParams params,
  ) {
    throw UnimplementedError(
      'createPlatformSessionStorage is not implemented on the current platform.',
    );
  }

  /// Creates a new empty [CygnusPlatformSessionStorage] to access static methods.
  ///
  /// This function should only be called by the app-facing package.
  /// Look at using [CygnusPlatformSessionStorage] in `flutter_inappwebview` instead.
  CygnusPlatformSessionStorage createPlatformSessionStorageStatic() {
    throw UnimplementedError(
      'createPlatformSessionStorageStatic is not implemented on the current platform.',
    );
  }

  /// Creates a new [CygnusPlatformHeadlessWebView].
  ///
  /// This function should only be called by the app-facing package.
  /// Look at using [CygnusHeadlessWebView] in `flutter_inappwebview` instead.
  CygnusPlatformHeadlessWebView createPlatformHeadlessWebView(
    CygnusPlatformHeadlessWebViewCreationParams params,
  ) {
    throw UnimplementedError(
      'createPlatformHeadlessWebView is not implemented on the current platform.',
    );
  }

  /// Creates a new empty [CygnusPlatformHeadlessWebView] to access static methods.
  ///
  /// This function should only be called by the app-facing package.
  /// Look at using [CygnusHeadlessWebView] in `flutter_inappwebview` instead.
  CygnusPlatformHeadlessWebView createPlatformHeadlessWebViewStatic() {
    throw UnimplementedError(
      'createPlatformHeadlessWebViewStatic is not implemented on the current platform.',
    );
  }

  /// Creates a new [CygnusPlatformWebStorageManager].
  ///
  /// This function should only be called by the app-facing package.
  /// Look at using [CygnusWebStorageManager] in `flutter_inappwebview` instead.
  CygnusPlatformWebStorageManager createPlatformWebStorageManager(
    CygnusPlatformWebStorageManagerCreationParams params,
  ) {
    throw UnimplementedError(
      'createPlatformWebStorageManager is not implemented on the current platform.',
    );
  }

  /// Creates a new empty [CygnusPlatformWebStorageManager] to access static methods.
  ///
  /// This function should only be called by the app-facing package.
  /// Look at using [CygnusWebStorageManager] in `flutter_inappwebview` instead.
  CygnusPlatformWebStorageManager createPlatformWebStorageManagerStatic() {
    throw UnimplementedError(
      'createPlatformWebStorageManagerStatic is not implemented on the current platform.',
    );
  }

  /// Creates a new [CygnusPlatformHttpAuthCredentialDatabase].
  ///
  /// This function should only be called by the app-facing package.
  /// Look at using [CygnusHttpAuthCredentialDatabase] in `flutter_inappwebview` instead.
  CygnusPlatformHttpAuthCredentialDatabase createPlatformHttpAuthCredentialDatabase(
    CygnusPlatformHttpAuthCredentialDatabaseCreationParams params,
  ) {
    throw UnimplementedError(
      'createPlatformHttpAuthCredentialDatabase is not implemented on the current platform.',
    );
  }

  /// Creates a new empty [CygnusPlatformHttpAuthCredentialDatabase] to access static methods.
  ///
  /// This function should only be called by the app-facing package.
  /// Look at using [CygnusHttpAuthCredentialDatabase] in `flutter_inappwebview` instead.
  CygnusPlatformHttpAuthCredentialDatabase
  createPlatformHttpAuthCredentialDatabaseStatic() {
    throw UnimplementedError(
      'createPlatformHttpAuthCredentialDatabaseStatic is not implemented on the current platform.',
    );
  }

  /// Creates a new [CygnusPlatformBrowser].
  ///
  /// This function should only be called by the app-facing package.
  /// Look at using [CygnusBrowser] in `flutter_inappwebview` instead.
  CygnusPlatformBrowser createPlatformBrowser(
    CygnusPlatformBrowserCreationParams params,
  ) {
    throw UnimplementedError(
      'createPlatformBrowser is not implemented on the current platform.',
    );
  }

  /// Creates a new empty [CygnusPlatformBrowser] to access static methods.
  ///
  /// This function should only be called by the app-facing package.
  /// Look at using [CygnusBrowser] in `flutter_inappwebview` instead.
  CygnusPlatformBrowser createPlatformBrowserStatic() {
    throw UnimplementedError(
      'createPlatformBrowserStatic is not implemented on the current platform.',
    );
  }

  /// Creates a new [CygnusPlatformProcessGlobalConfig].
  ///
  /// This function should only be called by the app-facing package.
  /// Look at using [CygnusProcessGlobalConfig] in `flutter_inappwebview` instead.
  CygnusPlatformProcessGlobalConfig createPlatformProcessGlobalConfig(
    CygnusPlatformProcessGlobalConfigCreationParams params,
  ) {
    throw UnimplementedError(
      'createPlatformProcessGlobalConfig is not implemented on the current platform.',
    );
  }

  /// Creates a new empty [CygnusPlatformProcessGlobalConfig] to access static methods.
  ///
  /// This function should only be called by the app-facing package.
  /// Look at using [CygnusProcessGlobalConfig] in `flutter_inappwebview` instead.
  CygnusPlatformProcessGlobalConfig createPlatformProcessGlobalConfigStatic() {
    throw UnimplementedError(
      'createPlatformProcessGlobalConfigStatic is not implemented on the current platform.',
    );
  }

  /// Creates a new [CygnusPlatformProxyController].
  ///
  /// This function should only be called by the app-facing package.
  /// Look at using [CygnusProxyController] in `flutter_inappwebview` instead.
  CygnusPlatformProxyController createPlatformProxyController(
    CygnusPlatformProxyControllerCreationParams params,
  ) {
    throw UnimplementedError(
      'createPlatformProxyController is not implemented on the current platform.',
    );
  }

  /// Creates a new empty [CygnusPlatformProxyController] to access static methods.
  ///
  /// This function should only be called by the app-facing package.
  /// Look at using [CygnusProxyController] in `flutter_inappwebview` instead.
  CygnusPlatformProxyController createPlatformProxyControllerStatic() {
    throw UnimplementedError(
      'createPlatformProxyControllerStatic is not implemented on the current platform.',
    );
  }

  /// Creates a new [CygnusPlatformServiceWorkerController].
  ///
  /// This function should only be called by the app-facing package.
  /// Look at using [CygnusServiceWorkerController] in `flutter_inappwebview` instead.
  CygnusPlatformServiceWorkerController createPlatformServiceWorkerController(
    CygnusPlatformServiceWorkerControllerCreationParams params,
  ) {
    throw UnimplementedError(
      'createPlatformServiceWorkerController is not implemented on the current platform.',
    );
  }

  /// Creates a new empty [CygnusPlatformServiceWorkerController] to access static methods.
  ///
  /// This function should only be called by the app-facing package.
  /// Look at using [CygnusServiceWorkerController] in `flutter_inappwebview` instead.
  CygnusPlatformServiceWorkerController
  createPlatformServiceWorkerControllerStatic() {
    throw UnimplementedError(
      'createPlatformServiceWorkerControllerStatic is not implemented on the current platform.',
    );
  }

  /// Creates a new [CygnusPlatformTracingController].
  ///
  /// This function should only be called by the app-facing package.
  /// Look at using [CygnusTracingController] in `flutter_inappwebview` instead.
  CygnusPlatformTracingController createPlatformTracingController(
    CygnusPlatformTracingControllerCreationParams params,
  ) {
    throw UnimplementedError(
      'createPlatformTracingController is not implemented on the current platform.',
    );
  }

  /// Creates a new empty [CygnusPlatformTracingController] to access static methods.
  ///
  /// This function should only be called by the app-facing package.
  /// Look at using [CygnusTracingController] in `flutter_inappwebview` instead.
  CygnusPlatformTracingController createPlatformTracingControllerStatic() {
    throw UnimplementedError(
      'createPlatformTracingControllerStatic is not implemented on the current platform.',
    );
  }

  /// Creates a new [CygnusPlatformAssetsPathHandler].
  ///
  /// This function should only be called by the app-facing package.
  /// Look at using [CygnusAssetsPathHandler] in `flutter_inappwebview` instead.
  CygnusPlatformAssetsPathHandler createPlatformAssetsPathHandler(
    CygnusPlatformAssetsPathHandlerCreationParams params,
  ) {
    throw UnimplementedError(
      'createPlatformAssetsPathHandler is not implemented on the current platform.',
    );
  }

  /// Creates a new empty [CygnusPlatformAssetsPathHandler] to access static methods.
  ///
  /// This function should only be called by the app-facing package.
  /// Look at using [CygnusAssetsPathHandler] in `flutter_inappwebview` instead.
  CygnusPlatformAssetsPathHandler createPlatformAssetsPathHandlerStatic() {
    throw UnimplementedError(
      'createPlatformAssetsPathHandlerStatic is not implemented on the current platform.',
    );
  }

  /// Creates a new [CygnusPlatformResourcesPathHandler].
  ///
  /// This function should only be called by the app-facing package.
  /// Look at using [CygnusResourcesPathHandler] in `flutter_inappwebview` instead.
  CygnusPlatformResourcesPathHandler createPlatformResourcesPathHandler(
    CygnusPlatformResourcesPathHandlerCreationParams params,
  ) {
    throw UnimplementedError(
      'createPlatformResourcesPathHandler is not implemented on the current platform.',
    );
  }

  /// Creates a new empty [CygnusPlatformResourcesPathHandler] to access static methods.
  ///
  /// This function should only be called by the app-facing package.
  /// Look at using [CygnusResourcesPathHandler] in `flutter_inappwebview` instead.
  CygnusPlatformResourcesPathHandler createPlatformResourcesPathHandlerStatic() {
    throw UnimplementedError(
      'createPlatformResourcesPathHandlerStatic is not implemented on the current platform.',
    );
  }

  /// Creates a new [CygnusPlatformInternalStoragePathHandler].
  ///
  /// This function should only be called by the app-facing package.
  /// Look at using [CygnusInternalStoragePathHandler] in `flutter_inappwebview` instead.
  CygnusPlatformInternalStoragePathHandler createPlatformInternalStoragePathHandler(
    CygnusPlatformInternalStoragePathHandlerCreationParams params,
  ) {
    throw UnimplementedError(
      'createPlatformInternalStoragePathHandler is not implemented on the current platform.',
    );
  }

  /// Creates a new empty [CygnusPlatformInternalStoragePathHandler] to access static methods.
  ///
  /// This function should only be called by the app-facing package.
  /// Look at using [CygnusInternalStoragePathHandler] in `flutter_inappwebview` instead.
  CygnusPlatformInternalStoragePathHandler
  createPlatformInternalStoragePathHandlerStatic() {
    throw UnimplementedError(
      'createPlatformInternalStoragePathHandlerStatic is not implemented on the current platform.',
    );
  }

  /// Creates a new [CygnusPlatformCustomPathHandler].
  ///
  /// This function should only be called by the app-facing package.
  /// Look at using [CygnusCustomPathHandler] in `flutter_inappwebview` instead.
  CygnusPlatformCustomPathHandler createPlatformCustomPathHandler(
    CygnusPlatformCustomPathHandlerCreationParams params,
  ) {
    throw UnimplementedError(
      'createPlatformCustomPathHandler is not implemented on the current platform.',
    );
  }

  /// Creates a new empty [CygnusPlatformCustomPathHandler] to access static methods.
  ///
  /// This function should only be called by the app-facing package.
  /// Look at using [CygnusCustomPathHandler] in `flutter_inappwebview` instead.
  CygnusPlatformCustomPathHandler createPlatformCustomPathHandlerStatic() {
    throw UnimplementedError(
      'createPlatformCustomPathHandlerStatic is not implemented on the current platform.',
    );
  }

  /// Creates a new [CygnusPlatformWebViewFeature].
  ///
  /// This function should only be called by the app-facing package.
  /// Look at using [CygnusWebViewFeature] in `flutter_inappwebview` instead.
  CygnusPlatformWebViewFeature createPlatformWebViewFeature(
    CygnusPlatformWebViewFeatureCreationParams params,
  ) {
    throw UnimplementedError(
      'createPlatformWebViewFeature is not implemented on the current platform.',
    );
  }

  /// Creates a new empty [CygnusPlatformWebViewFeature] to access static methods.
  ///
  /// This function should only be called by the app-facing package.
  /// Look at using [CygnusWebViewFeature] in `flutter_inappwebview` instead.
  CygnusPlatformWebViewFeature createPlatformWebViewFeatureStatic() {
    throw UnimplementedError(
      'createPlatformWebViewFeatureStatic is not implemented on the current platform.',
    );
  }

  /// Creates a new empty [CygnusPlatformLocalhostServer] to access static methods.
  ///
  /// This function should only be called by the app-facing package.
  /// Look at using [CygnusDefaultLocalhostServer] in `flutter_inappwebview` instead.
  CygnusPlatformLocalhostServer createPlatformLocalhostServer(
    CygnusPlatformLocalhostServerCreationParams params,
  ) {
    return CygnusDefaultLocalhostServer(params);
  }

  /// Creates a new empty [CygnusPlatformLocalhostServer] to access static methods.
  ///
  /// This function should only be called by the app-facing package.
  /// Look at using [CygnusDefaultLocalhostServer] in `flutter_inappwebview` instead.
  CygnusPlatformLocalhostServer createPlatformLocalhostServerStatic() {
    return CygnusDefaultLocalhostServer(
      const CygnusPlatformLocalhostServerCreationParams(),
    );
  }

  /// Creates a new [CygnusPlatformChromeSafariBrowser].
  ///
  /// This function should only be called by the app-facing package.
  /// Look at using [CygnusChromeSafariBrowser] in `flutter_inappwebview` instead.
  CygnusPlatformChromeSafariBrowser createPlatformChromeSafariBrowser(
    CygnusPlatformChromeSafariBrowserCreationParams params,
  ) {
    throw UnimplementedError(
      'createPlatformChromeSafariBrowser is not implemented on the current platform.',
    );
  }

  /// Creates a new empty [CygnusPlatformChromeSafariBrowser] to access static methods.
  ///
  /// This function should only be called by the app-facing package.
  /// Look at using [CygnusChromeSafariBrowser] in `flutter_inappwebview` instead.
  CygnusPlatformChromeSafariBrowser createPlatformChromeSafariBrowserStatic() {
    throw UnimplementedError(
      'createPlatformChromeSafariBrowserStatic is not implemented on the current platform.',
    );
  }

  /// Creates a new [CygnusPlatformWebViewEnvironment].
  ///
  /// This function should only be called by the app-facing package.
  /// Look at using [CygnusWebViewEnvironment] in `flutter_inappwebview` instead.
  CygnusPlatformWebViewEnvironment createPlatformWebViewEnvironment(
    CygnusPlatformWebViewEnvironmentCreationParams params,
  ) {
    throw UnimplementedError(
      'createPlatformWebViewEnvironment is not implemented on the current platform.',
    );
  }

  /// Creates a new empty [CygnusPlatformWebViewEnvironment] to access static methods.
  ///
  /// This function should only be called by the app-facing package.
  /// Look at using [CygnusWebViewEnvironment] in `flutter_inappwebview` instead.
  CygnusPlatformWebViewEnvironment createPlatformWebViewEnvironmentStatic() {
    throw UnimplementedError(
      'createPlatformWebViewEnvironmentStatic is not implemented on the current platform.',
    );
  }

  /// Creates a new [CygnusPlatformWebNotificationController].
  ///
  /// This function should only be called by the app-facing package.
  /// Look at using [CygnusWebNotificationController] in `flutter_inappwebview` instead.
  CygnusPlatformWebNotificationController createPlatformWebNotificationController(
    CygnusPlatformWebNotificationControllerCreationParams params,
  ) {
    throw UnimplementedError(
      'createPlatformWebNotificationController is not implemented on the current platform.',
    );
  }

  /// Creates a new empty [CygnusPlatformWebNotificationController] to access static methods.
  ///
  /// This function should only be called by the app-facing package.
  /// Look at using [CygnusWebNotificationController] in `flutter_inappwebview` instead.
  CygnusPlatformWebNotificationController
  createPlatformWebNotificationControllerStatic() {
    throw UnimplementedError(
      'createPlatformWebNotificationControllerStatic is not implemented on the current platform.',
    );
  }
}
