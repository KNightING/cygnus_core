import 'package:cygnus_core/src/platform_interface/flutter_inappwebview_platform_interface.dart';

import 'chrome_safari_browser/chrome_safari_browser.dart';
import 'cookie_manager.dart';
import 'find_interaction/main.dart';
import 'http_auth_credentials_database.dart';
import 'in_app_browser/in_app_browser.dart';
import 'in_app_webview/main.dart';
import 'print_job/main.dart';
import 'proxy_controller.dart';
import 'pull_to_refresh/main.dart';
import 'web_authentication_session/main.dart';
import 'web_message/main.dart';
import 'web_storage/main.dart';

/// Implementation of [CygnusWebViewPlatform] using the WebKit API.
class IOSInAppWebViewPlatform extends CygnusWebViewPlatform {
  /// Registers this class as the default instance of [CygnusWebViewPlatform].
  static void registerWith() {
    CygnusWebViewPlatform.instance = IOSInAppWebViewPlatform();
  }

  /// Creates a new [IOSCookieManager].
  ///
  /// This function should only be called by the app-facing package.
  /// Look at using [CygnusCookieManager] in `flutter_inappwebview` instead.
  @override
  IOSCookieManager createPlatformCookieManager(
    CygnusPlatformCookieManagerCreationParams params,
  ) {
    return IOSCookieManager(params);
  }

  /// Creates a new empty [IOSCookieManager] to access static methods.
  ///
  /// This function should only be called by the app-facing package.
  /// Look at using [CygnusCookieManager] in `flutter_inappwebview` instead.
  @override
  IOSCookieManager createPlatformCookieManagerStatic() {
    return IOSCookieManager.static();
  }

  /// Creates a new [IOSInAppWebViewController].
  ///
  /// This function should only be called by the app-facing package.
  /// Look at using [CygnusWebViewController] in `flutter_inappwebview` instead.
  @override
  IOSInAppWebViewController createPlatformInAppWebViewController(
    CygnusPlatformWebViewControllerCreationParams params,
  ) {
    return IOSInAppWebViewController(params);
  }

  /// Creates a new empty [IOSInAppWebViewController] to access static methods.
  ///
  /// This function should only be called by the app-facing package.
  /// Look at using [CygnusWebViewController] in `flutter_inappwebview` instead.
  @override
  IOSInAppWebViewController createPlatformInAppWebViewControllerStatic() {
    return IOSInAppWebViewController.static();
  }

  /// Creates a new [IOSInAppWebViewWidget].
  ///
  /// This function should only be called by the app-facing package.
  /// Look at using [CygnusWebView] in `flutter_inappwebview` instead.
  @override
  IOSInAppWebViewWidget createPlatformInAppWebViewWidget(
    CygnusPlatformWebViewWidgetCreationParams params,
  ) {
    return IOSInAppWebViewWidget(params);
  }

  /// Creates a new empty [IOSInAppWebViewWidget] to access static methods.
  ///
  /// This function should only be called by the app-facing package.
  /// Look at using [CygnusWebView] in `flutter_inappwebview` instead.
  @override
  IOSInAppWebViewWidget createPlatformInAppWebViewWidgetStatic() {
    return IOSInAppWebViewWidget.static();
  }

  /// Creates a new [IOSFindInteractionController].
  ///
  /// This function should only be called by the app-facing package.
  /// Look at using [CygnusFindInteractionController] in `flutter_inappwebview` instead.
  @override
  IOSFindInteractionController createPlatformFindInteractionController(
    CygnusPlatformFindInteractionControllerCreationParams params,
  ) {
    return IOSFindInteractionController(params);
  }

  /// Creates a new empty [IOSFindInteractionController] to access static methods.
  ///
  /// This function should only be called by the app-facing package.
  /// Look at using [CygnusFindInteractionController] in `flutter_inappwebview` instead.
  @override
  IOSFindInteractionController createPlatformFindInteractionControllerStatic() {
    return IOSFindInteractionController.static();
  }

  /// Creates a new [IOSPrintJobController].
  ///
  /// This function should only be called by the app-facing package.
  /// Look at using [CygnusPrintJobController] in `flutter_inappwebview` instead.
  @override
  IOSPrintJobController createPlatformPrintJobController(
    CygnusPlatformPrintJobControllerCreationParams params,
  ) {
    return IOSPrintJobController(params);
  }

  /// Creates a new empty [CygnusPlatformPrintJobController] to access static methods.
  ///
  /// This function should only be called by the app-facing package.
  /// Look at using [CygnusPrintJobController] in `flutter_inappwebview` instead.
  @override
  IOSPrintJobController createPlatformPrintJobControllerStatic() {
    return IOSPrintJobController.static();
  }

  /// Creates a new [IOSPullToRefreshController].
  ///
  /// This function should only be called by the app-facing package.
  /// Look at using [CygnusPullToRefreshController] in `flutter_inappwebview` instead.
  @override
  IOSPullToRefreshController createPlatformPullToRefreshController(
    CygnusPlatformPullToRefreshControllerCreationParams params,
  ) {
    return IOSPullToRefreshController(params);
  }

  /// Creates a new empty [IOSPullToRefreshController] to access static methods.
  ///
  /// This function should only be called by the app-facing package.
  /// Look at using [CygnusPullToRefreshController] in `flutter_inappwebview` instead.
  @override
  IOSPullToRefreshController createPlatformPullToRefreshControllerStatic() {
    return IOSPullToRefreshController.static();
  }

  /// Creates a new [IOSWebMessageChannel].
  ///
  /// This function should only be called by the app-facing package.
  /// Look at using [CygnusWebMessageChannel] in `flutter_inappwebview` instead.
  @override
  IOSWebMessageChannel createPlatformWebMessageChannel(
    CygnusPlatformWebMessageChannelCreationParams params,
  ) {
    return IOSWebMessageChannel(params);
  }

  /// Creates a new empty [IOSWebMessageChannel] to access static methods.
  ///
  /// This function should only be called by the app-facing package.
  /// Look at using [CygnusWebMessageChannel] in `flutter_inappwebview` instead.
  @override
  IOSWebMessageChannel createPlatformWebMessageChannelStatic() {
    return IOSWebMessageChannel.static();
  }

  /// Creates a new [IOSWebMessageListener].
  ///
  /// This function should only be called by the app-facing package.
  /// Look at using [CygnusWebMessageListener] in `flutter_inappwebview` instead.
  @override
  IOSWebMessageListener createPlatformWebMessageListener(
    CygnusPlatformWebMessageListenerCreationParams params,
  ) {
    return IOSWebMessageListener(params);
  }

  /// Creates a new empty [IOSWebMessageListener] to access static methods.
  ///
  /// This function should only be called by the app-facing package.
  /// Look at using [CygnusWebMessageListener] in `flutter_inappwebview` instead.
  @override
  IOSWebMessageListener createPlatformWebMessageListenerStatic() {
    return IOSWebMessageListener.static();
  }

  /// Creates a new [IOSJavaScriptReplyProxy].
  ///
  /// This function should only be called by the app-facing package.
  /// Look at using [CygnusJavaScriptReplyProxy] in `flutter_inappwebview` instead.
  @override
  IOSJavaScriptReplyProxy createPlatformJavaScriptReplyProxy(
    CygnusPlatformJavaScriptReplyProxyCreationParams params,
  ) {
    return IOSJavaScriptReplyProxy(params);
  }

  /// Creates a new [IOSWebMessagePort].
  ///
  /// This function should only be called by the app-facing package.
  /// Look at using [CygnusWebMessagePort] in `flutter_inappwebview` instead.
  @override
  IOSWebMessagePort createPlatformWebMessagePort(
    CygnusPlatformWebMessagePortCreationParams params,
  ) {
    return IOSWebMessagePort(params);
  }

  /// Creates a new [IOSWebStorage].
  ///
  /// This function should only be called by the app-facing package.
  /// Look at using [CygnusWebStorage] in `flutter_inappwebview` instead.
  @override
  IOSWebStorage createPlatformWebStorage(
    CygnusPlatformWebStorageCreationParams params,
  ) {
    return IOSWebStorage(params);
  }

  /// Creates a new empty [IOSWebStorage] to access static methods.
  ///
  /// This function should only be called by the app-facing package.
  /// Look at using [CygnusWebStorage] in `flutter_inappwebview` instead.
  @override
  IOSWebStorage createPlatformWebStorageStatic() {
    return IOSWebStorage(
      IOSWebStorageCreationParams(
        localStorage: createPlatformLocalStorageStatic(),
        sessionStorage: createPlatformSessionStorageStatic(),
      ),
    );
  }

  /// Creates a new [IOSLocalStorage].
  ///
  /// This function should only be called by the app-facing package.
  /// Look at using [CygnusLocalStorage] in `flutter_inappwebview` instead.
  @override
  IOSLocalStorage createPlatformLocalStorage(
    CygnusPlatformLocalStorageCreationParams params,
  ) {
    return IOSLocalStorage(params);
  }

  /// Creates a new empty [IOSLocalStorage] to access static methods.
  ///
  /// This function should only be called by the app-facing package.
  /// Look at using [CygnusLocalStorage] in `flutter_inappwebview` instead.
  @override
  IOSLocalStorage createPlatformLocalStorageStatic() {
    return IOSLocalStorage.defaultStorage(controller: null);
  }

  /// Creates a new [IOSSessionStorage].
  ///
  /// This function should only be called by the app-facing package.
  /// Look at using [CygnusSessionStorage] in `flutter_inappwebview` instead.
  @override
  IOSSessionStorage createPlatformSessionStorage(
    CygnusPlatformSessionStorageCreationParams params,
  ) {
    return IOSSessionStorage(params);
  }

  /// Creates a new empty [IOSSessionStorage] to access static methods.
  ///
  /// This function should only be called by the app-facing package.
  /// Look at using [CygnusSessionStorage] in `flutter_inappwebview` instead.
  @override
  IOSSessionStorage createPlatformSessionStorageStatic() {
    return IOSSessionStorage.defaultStorage(controller: null);
  }

  /// Creates a new [IOSHeadlessInAppWebView].
  ///
  /// This function should only be called by the app-facing package.
  /// Look at using [CygnusHeadlessWebView] in `flutter_inappwebview` instead.
  @override
  IOSHeadlessInAppWebView createPlatformHeadlessInAppWebView(
    CygnusPlatformHeadlessWebViewCreationParams params,
  ) {
    return IOSHeadlessInAppWebView(params);
  }

  /// Creates a new empty [IOSHeadlessInAppWebView] to access static methods.
  ///
  /// This function should only be called by the app-facing package.
  /// Look at using [CygnusHeadlessWebView] in `flutter_inappwebview` instead.
  @override
  IOSHeadlessInAppWebView createPlatformHeadlessInAppWebViewStatic() {
    return IOSHeadlessInAppWebView.static();
  }

  /// Creates a new [IOSHttpAuthCredentialDatabase].
  ///
  /// This function should only be called by the app-facing package.
  /// Look at using [CygnusHttpAuthCredentialDatabase] in `flutter_inappwebview` instead.
  @override
  IOSHttpAuthCredentialDatabase createPlatformHttpAuthCredentialDatabase(
    CygnusPlatformHttpAuthCredentialDatabaseCreationParams params,
  ) {
    return IOSHttpAuthCredentialDatabase(params);
  }

  /// Creates a new empty [IOSHttpAuthCredentialDatabase] to access static methods.
  ///
  /// This function should only be called by the app-facing package.
  /// Look at using [CygnusHttpAuthCredentialDatabase] in `flutter_inappwebview` instead.
  @override
  IOSHttpAuthCredentialDatabase
  createPlatformHttpAuthCredentialDatabaseStatic() {
    return IOSHttpAuthCredentialDatabase.static();
  }

  /// Creates a new [IOSInAppBrowser].
  ///
  /// This function should only be called by the app-facing package.
  /// Look at using [CygnusBrowser] in `flutter_inappwebview` instead.
  @override
  IOSInAppBrowser createPlatformInAppBrowser(
    CygnusPlatformBrowserCreationParams params,
  ) {
    return IOSInAppBrowser(params);
  }

  /// Creates a new empty [IOSInAppBrowser] to access static methods.
  ///
  /// This function should only be called by the app-facing package.
  /// Look at using [CygnusBrowser] in `flutter_inappwebview` instead.
  @override
  IOSInAppBrowser createPlatformInAppBrowserStatic() {
    return IOSInAppBrowser.static();
  }

  /// Creates a new [IOSChromeSafariBrowser].
  ///
  /// This function should only be called by the app-facing package.
  /// Look at using [CygnusChromeSafariBrowser] in `flutter_inappwebview` instead.
  @override
  IOSChromeSafariBrowser createPlatformChromeSafariBrowser(
    CygnusPlatformChromeSafariBrowserCreationParams params,
  ) {
    return IOSChromeSafariBrowser(params);
  }

  /// Creates a new empty [IOSChromeSafariBrowser] to access static methods.
  ///
  /// This function should only be called by the app-facing package.
  /// Look at using [CygnusChromeSafariBrowser] in `flutter_inappwebview` instead.
  @override
  IOSChromeSafariBrowser createPlatformChromeSafariBrowserStatic() {
    return IOSChromeSafariBrowser.static();
  }

  /// Creates a new empty [IOSWebStorageManager] to access static methods.
  ///
  /// This function should only be called by the app-facing package.
  /// Look at using [CygnusWebStorageManager] in `flutter_inappwebview` instead.
  @override
  IOSWebStorageManager createPlatformWebStorageManager(
    CygnusPlatformWebStorageManagerCreationParams params,
  ) {
    return IOSWebStorageManager(params);
  }

  /// Creates a new empty [IOSWebStorageManager] to access static methods.
  ///
  /// This function should only be called by the app-facing package.
  /// Look at using [CygnusWebStorageManager] in `flutter_inappwebview` instead.
  @override
  IOSWebStorageManager createPlatformWebStorageManagerStatic() {
    return IOSWebStorageManager.static();
  }

  /// Creates a new [IOSWebAuthenticationSession].
  ///
  /// This function should only be called by the app-facing package.
  /// Look at using [CygnusWebAuthenticationSession] in `flutter_inappwebview` instead.
  @override
  IOSWebAuthenticationSession createPlatformWebAuthenticationSession(
    CygnusPlatformWebAuthenticationSessionCreationParams params,
  ) {
    return IOSWebAuthenticationSession(params);
  }

  /// Creates a new empty [IOSWebAuthenticationSession] to access static methods.
  ///
  /// This function should only be called by the app-facing package.
  /// Look at using [CygnusWebAuthenticationSession] in `flutter_inappwebview` instead.
  @override
  IOSWebAuthenticationSession createPlatformWebAuthenticationSessionStatic() {
    return IOSWebAuthenticationSession.static();
  }

  /// Creates a new [IOSProxyController].
  ///
  /// This function should only be called by the app-facing package.
  /// Look at using [CygnusProxyController] in `flutter_inappwebview` instead.
  @override
  CygnusPlatformProxyController createPlatformProxyController(
    CygnusPlatformProxyControllerCreationParams params,
  ) {
    return IOSProxyController(params);
  }

  /// Creates a new empty [IOSProxyController] to access static methods.
  ///
  /// This function should only be called by the app-facing package.
  /// Look at using [CygnusProxyController] in `flutter_inappwebview` instead.
  @override
  IOSProxyController createPlatformProxyControllerStatic() {
    return IOSProxyController.static();
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
  /// Look at using [CygnusWebViewEnvironment] in `flutter_inappwebview` instead.
  @override
  CygnusPlatformWebViewEnvironment createPlatformWebViewEnvironmentStatic() {
    return _PlatformWebViewEnvironment.static();
  }

  /// Creates a new empty [CygnusPlatformProcessGlobalConfig] to access static methods.
  ///
  /// This function should only be called by the app-facing package.
  /// Look at using [CygnusProcessGlobalConfig] in `flutter_inappwebview` instead.
  @override
  CygnusPlatformProcessGlobalConfig createPlatformProcessGlobalConfigStatic() {
    return _PlatformProcessGlobalConfig.static();
  }

  /// Creates a new empty [CygnusPlatformServiceWorkerController] to access static methods.
  ///
  /// This function should only be called by the app-facing package.
  /// Look at using [CygnusServiceWorkerController] in `flutter_inappwebview` instead.
  @override
  CygnusPlatformServiceWorkerController
  createPlatformServiceWorkerControllerStatic() {
    return _PlatformServiceWorkerController.static();
  }

  /// Creates a new empty [CygnusPlatformTracingController] to access static methods.
  ///
  /// This function should only be called by the app-facing package.
  /// Look at using [CygnusTracingController] in `flutter_inappwebview` instead.
  @override
  CygnusPlatformTracingController createPlatformTracingControllerStatic() {
    return _PlatformTracingController.static();
  }

  /// Creates a new empty [CygnusPlatformWebNotificationController] to access static methods.
  ///
  /// This function should only be called by the app-facing package.
  /// Look at using [CygnusWebNotificationController] in `flutter_inappwebview` instead.
  @override
  CygnusPlatformWebNotificationController
  createPlatformWebNotificationControllerStatic() {
    return _PlatformWebNotificationController.static();
  }

  /// Creates a new empty [CygnusPlatformAssetsPathHandler] to access static methods.
  ///
  /// This function should only be called by the app-facing package.
  /// Look at using [CygnusAssetsPathHandler] in `flutter_inappwebview` instead.
  @override
  CygnusPlatformAssetsPathHandler createPlatformAssetsPathHandlerStatic() {
    return _PlatformAssetsPathHandler.static();
  }

  /// Creates a new empty [CygnusPlatformResourcesPathHandler] to access static methods.
  ///
  /// This function should only be called by the app-facing package.
  /// Look at using [CygnusResourcesPathHandler] in `flutter_inappwebview` instead.
  @override
  CygnusPlatformResourcesPathHandler createPlatformResourcesPathHandlerStatic() {
    return _PlatformResourcesPathHandler.static();
  }

  /// Creates a new empty [CygnusPlatformInternalStoragePathHandler] to access static methods.
  ///
  /// This function should only be called by the app-facing package.
  /// Look at using [CygnusInternalStoragePathHandler] in `flutter_inappwebview` instead.
  @override
  CygnusPlatformInternalStoragePathHandler
  createPlatformInternalStoragePathHandlerStatic() {
    return _PlatformInternalStoragePathHandler.static();
  }

  /// Creates a new empty [CygnusPlatformCustomPathHandler] to access static methods.
  ///
  /// This function should only be called by the app-facing package.
  /// Look at using [CygnusCustomPathHandler] in `flutter_inappwebview` instead.
  @override
  CygnusPlatformCustomPathHandler createPlatformCustomPathHandlerStatic() {
    return _PlatformCustomPathHandler.static();
  }

  /// Creates a new [CygnusDefaultLocalhostServer].
  ///
  /// This function should only be called by the app-facing package.
  /// Look at using [CygnusLocalhostServer] in `flutter_inappwebview` instead.
  @override
  CygnusDefaultLocalhostServer createPlatformInAppLocalhostServer(
    CygnusPlatformLocalhostServerCreationParams params,
  ) {
    return CygnusDefaultLocalhostServer(params);
  }

  /// Creates a new empty [CygnusDefaultLocalhostServer] to access static methods.
  ///
  /// This function should only be called by the app-facing package.
  /// Look at using [CygnusLocalhostServer] in `flutter_inappwebview` instead.
  @override
  CygnusDefaultLocalhostServer createPlatformInAppLocalhostServerStatic() {
    return CygnusDefaultLocalhostServer.static();
  }

  /// Creates a new empty [CygnusPlatformWebViewFeature] to access static methods.
  ///
  /// This function should only be called by the app-facing package.
  /// Look at using [CygnusWebViewFeature] in `flutter_inappwebview` instead
  @override
  CygnusPlatformWebViewFeature createPlatformWebViewFeatureStatic() {
    return _PlatformWebViewFeature.static();
  }
}

class _PlatformProcessGlobalConfig extends CygnusPlatformProcessGlobalConfig {
  _PlatformProcessGlobalConfig(CygnusPlatformProcessGlobalConfigCreationParams params)
    : super.implementation(params);
  static final _PlatformProcessGlobalConfig _staticValue =
      _PlatformProcessGlobalConfig(
        const CygnusPlatformProcessGlobalConfigCreationParams(),
      );

  factory _PlatformProcessGlobalConfig.static() => _staticValue;
}

class _PlatformServiceWorkerController extends CygnusPlatformServiceWorkerController {
  _PlatformServiceWorkerController(
    CygnusPlatformServiceWorkerControllerCreationParams params,
  ) : super.implementation(params);
  static final _PlatformServiceWorkerController _staticValue =
      _PlatformServiceWorkerController(
        const CygnusPlatformServiceWorkerControllerCreationParams(),
      );

  factory _PlatformServiceWorkerController.static() => _staticValue;

  @override
  CygnusServiceWorkerClient? get serviceWorkerClient => throw UnimplementedError();
}

class _PlatformTracingController extends CygnusPlatformTracingController {
  _PlatformTracingController(CygnusPlatformTracingControllerCreationParams params)
    : super.implementation(params);
  static final _PlatformTracingController _staticValue =
      _PlatformTracingController(
        const CygnusPlatformTracingControllerCreationParams(),
      );

  factory _PlatformTracingController.static() => _staticValue;
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

class _PlatformWebViewFeature extends CygnusPlatformWebViewFeature {
  _PlatformWebViewFeature(CygnusPlatformWebViewFeatureCreationParams params)
    : super.implementation(params);

  static final _PlatformWebViewFeature _staticValue = _PlatformWebViewFeature(
    CygnusPlatformWebViewFeatureCreationParams(),
  );
  factory _PlatformWebViewFeature.static() => _staticValue;
}

class _PlatformAssetsPathHandler extends CygnusPlatformAssetsPathHandler {
  _PlatformAssetsPathHandler(CygnusPlatformAssetsPathHandlerCreationParams params)
    : super.implementation(params);

  static final _PlatformAssetsPathHandler _staticValue =
      _PlatformAssetsPathHandler(
        CygnusPlatformAssetsPathHandlerCreationParams(
          CygnusPlatformPathHandlerCreationParams(path: ''),
        ),
      );

  factory _PlatformAssetsPathHandler.static() => _staticValue;

  @override
  CygnusPlatformPathHandlerEvents? eventHandler;

  @override
  Map<String, dynamic> toMap({CygnusEnumMethod? enumMethod}) => {
    "path": path,
    "type": type,
  };

  @override
  Map<String, dynamic> toJson() => toMap();
}

class _PlatformResourcesPathHandler extends CygnusPlatformResourcesPathHandler {
  _PlatformResourcesPathHandler(
    CygnusPlatformResourcesPathHandlerCreationParams params,
  ) : super.implementation(params);

  static final _PlatformResourcesPathHandler _staticValue =
      _PlatformResourcesPathHandler(
        CygnusPlatformResourcesPathHandlerCreationParams(
          CygnusPlatformPathHandlerCreationParams(path: ''),
        ),
      );

  factory _PlatformResourcesPathHandler.static() => _staticValue;

  @override
  CygnusPlatformPathHandlerEvents? eventHandler;

  @override
  Map<String, dynamic> toMap({CygnusEnumMethod? enumMethod}) => {
    "path": path,
    "type": type,
  };

  @override
  Map<String, dynamic> toJson() => toMap();
}

class _PlatformInternalStoragePathHandler
    extends CygnusPlatformInternalStoragePathHandler {
  _PlatformInternalStoragePathHandler(
    CygnusPlatformInternalStoragePathHandlerCreationParams params,
  ) : super.implementation(params);

  static final _PlatformInternalStoragePathHandler _staticValue =
      _PlatformInternalStoragePathHandler(
        CygnusPlatformInternalStoragePathHandlerCreationParams(
          CygnusPlatformPathHandlerCreationParams(path: ''),
          directory: '',
        ),
      );

  factory _PlatformInternalStoragePathHandler.static() => _staticValue;

  @override
  CygnusPlatformPathHandlerEvents? eventHandler;

  @override
  Map<String, dynamic> toMap({CygnusEnumMethod? enumMethod}) => {
    "path": path,
    "type": type,
  };

  @override
  Map<String, dynamic> toJson() => toMap();
}

class _PlatformCustomPathHandler extends CygnusPlatformCustomPathHandler {
  _PlatformCustomPathHandler(CygnusPlatformCustomPathHandlerCreationParams params)
    : super.implementation(params);

  static final _PlatformCustomPathHandler _staticValue =
      _PlatformCustomPathHandler(
        CygnusPlatformCustomPathHandlerCreationParams(
          CygnusPlatformPathHandlerCreationParams(path: ''),
        ),
      );

  factory _PlatformCustomPathHandler.static() => _staticValue;

  @override
  CygnusPlatformPathHandlerEvents? eventHandler;

  @override
  Map<String, dynamic> toMap({CygnusEnumMethod? enumMethod}) => {
    "path": path,
    "type": type,
  };

  @override
  Map<String, dynamic> toJson() => toMap();
}
