import 'package:cygnus_core/src/platform_interface/flutter_webview_platform_interface.dart';

import 'cookie_manager.dart';
import 'find_interaction/main.dart';
import 'http_auth_credentials_database.dart';
import 'browser/browser.dart';
import 'webview/main.dart';
import 'print_job/main.dart';
import 'proxy_controller.dart';
import 'web_authentication_session/main.dart';
import 'web_message/main.dart';
import 'web_storage/main.dart';

/// Implementation of [CygnusWebViewPlatform] using the WebKit API.
class MacOSInAppWebViewPlatform extends CygnusWebViewPlatform {
  /// Registers this class as the default instance of [CygnusWebViewPlatform].
  static void registerWith() {
    CygnusWebViewPlatform.instance = MacOSInAppWebViewPlatform();
  }

  /// Creates a new [MacOSCookieManager].
  ///
  /// This function should only be called by the app-facing package.
  /// Look at using [CygnusCookieManager] in `flutter_inappwebview` instead.
  @override
  MacOSCookieManager createPlatformCookieManager(
    CygnusPlatformCookieManagerCreationParams params,
  ) {
    return MacOSCookieManager(params);
  }

  /// Creates a new empty [MacOSCookieManager] to access static methods.
  ///
  /// This function should only be called by the app-facing package.
  /// Look at using [CygnusCookieManager] in `flutter_inappwebview` instead.
  @override
  MacOSCookieManager createPlatformCookieManagerStatic() {
    return MacOSCookieManager.static();
  }

  /// Creates a new [MacOSInAppWebViewController].
  ///
  /// This function should only be called by the app-facing package.
  /// Look at using [CygnusWebViewController] in `flutter_inappwebview` instead.
  @override
  MacOSInAppWebViewController createPlatformWebViewController(
    CygnusPlatformWebViewControllerCreationParams params,
  ) {
    return MacOSInAppWebViewController(params);
  }

  /// Creates a new empty [MacOSInAppWebViewController] to access static methods.
  ///
  /// This function should only be called by the app-facing package.
  /// Look at using [CygnusWebViewController] in `flutter_inappwebview` instead.
  @override
  MacOSInAppWebViewController createPlatformWebViewControllerStatic() {
    return MacOSInAppWebViewController.static();
  }

  /// Creates a new [MacOSInAppWebViewWidget].
  ///
  /// This function should only be called by the app-facing package.
  /// Look at using [CygnusWebView] in `flutter_inappwebview` instead.
  @override
  MacOSInAppWebViewWidget createPlatformWebViewWidget(
    CygnusPlatformWebViewWidgetCreationParams params,
  ) {
    return MacOSInAppWebViewWidget(params);
  }

  /// Creates a new empty [MacOSInAppWebViewWidget] to access static methods.
  ///
  /// This function should only be called by the app-facing package.
  /// Look at using [CygnusWebView] in `flutter_inappwebview` instead.
  @override
  MacOSInAppWebViewWidget createPlatformWebViewWidgetStatic() {
    return MacOSInAppWebViewWidget.static();
  }

  /// Creates a new [MacOSFindInteractionController].
  ///
  /// This function should only be called by the app-facing package.
  /// Look at using [CygnusFindInteractionController] in `flutter_inappwebview` instead.
  @override
  MacOSFindInteractionController createPlatformFindInteractionController(
    CygnusPlatformFindInteractionControllerCreationParams params,
  ) {
    return MacOSFindInteractionController(params);
  }

  /// Creates a new empty [MacOSFindInteractionController] to access static methods.
  ///
  /// This function should only be called by the app-facing package.
  /// Look at using [CygnusFindInteractionController] in `flutter_inappwebview` instead.
  @override
  MacOSFindInteractionController
  createPlatformFindInteractionControllerStatic() {
    return MacOSFindInteractionController.static();
  }

  /// Creates a new [MacOSPrintJobController].
  ///
  /// This function should only be called by the app-facing package.
  /// Look at using [CygnusPrintJobController] in `flutter_inappwebview` instead.
  @override
  MacOSPrintJobController createPlatformPrintJobController(
    CygnusPlatformPrintJobControllerCreationParams params,
  ) {
    return MacOSPrintJobController(params);
  }

  /// Creates a new empty [CygnusPlatformPrintJobController] to access static methods.
  ///
  /// This function should only be called by the app-facing package.
  /// Look at using [CygnusPrintJobController] in `flutter_inappwebview` instead.
  @override
  MacOSPrintJobController createPlatformPrintJobControllerStatic() {
    return MacOSPrintJobController.static();
  }

  /// Creates a new empty [CygnusPlatformPullToRefreshController] to access static methods.
  ///
  /// This function should only be called by the app-facing package.
  /// Look at using [CygnusPullToRefreshController] in `flutter_inappwebview` instead.
  @override
  CygnusPlatformPullToRefreshController
  createPlatformPullToRefreshControllerStatic() {
    return _PlatformPullToRefreshController.static();
  }

  /// Creates a new [MacOSWebMessageChannel].
  ///
  /// This function should only be called by the app-facing package.
  /// Look at using [CygnusWebMessageChannel] in `flutter_inappwebview` instead.
  @override
  MacOSWebMessageChannel createPlatformWebMessageChannel(
    CygnusPlatformWebMessageChannelCreationParams params,
  ) {
    return MacOSWebMessageChannel(params);
  }

  /// Creates a new empty [MacOSWebMessageChannel] to access static methods.
  ///
  /// This function should only be called by the app-facing package.
  /// Look at using [CygnusWebMessageChannel] in `flutter_inappwebview` instead.
  @override
  MacOSWebMessageChannel createPlatformWebMessageChannelStatic() {
    return MacOSWebMessageChannel.static();
  }

  /// Creates a new [MacOSWebMessageListener].
  ///
  /// This function should only be called by the app-facing package.
  /// Look at using [CygnusWebMessageListener] in `flutter_inappwebview` instead.
  @override
  MacOSWebMessageListener createPlatformWebMessageListener(
    CygnusPlatformWebMessageListenerCreationParams params,
  ) {
    return MacOSWebMessageListener(params);
  }

  /// Creates a new empty [MacOSWebMessageListener] to access static methods.
  ///
  /// This function should only be called by the app-facing package.
  /// Look at using [CygnusWebMessageListener] in `flutter_inappwebview` instead.
  @override
  MacOSWebMessageListener createPlatformWebMessageListenerStatic() {
    return MacOSWebMessageListener.static();
  }

  /// Creates a new [MacOSJavaScriptReplyProxy].
  ///
  /// This function should only be called by the app-facing package.
  /// Look at using [CygnusJavaScriptReplyProxy] in `flutter_inappwebview` instead.
  @override
  MacOSJavaScriptReplyProxy createPlatformJavaScriptReplyProxy(
    CygnusPlatformJavaScriptReplyProxyCreationParams params,
  ) {
    return MacOSJavaScriptReplyProxy(params);
  }

  /// Creates a new [MacOSWebMessagePort].
  ///
  /// This function should only be called by the app-facing package.
  /// Look at using [CygnusWebMessagePort] in `flutter_inappwebview` instead.
  @override
  MacOSWebMessagePort createPlatformWebMessagePort(
    CygnusPlatformWebMessagePortCreationParams params,
  ) {
    return MacOSWebMessagePort(params);
  }

  /// Creates a new [MacOSWebStorage].
  ///
  /// This function should only be called by the app-facing package.
  /// Look at using [CygnusWebStorage] in `flutter_inappwebview` instead.
  @override
  MacOSWebStorage createPlatformWebStorage(
    CygnusPlatformWebStorageCreationParams params,
  ) {
    return MacOSWebStorage(params);
  }

  /// Creates a new empty [MacOSWebStorage] to access static methods.
  ///
  /// This function should only be called by the app-facing package.
  /// Look at using [CygnusWebStorage] in `flutter_inappwebview` instead.
  @override
  MacOSWebStorage createPlatformWebStorageStatic() {
    return MacOSWebStorage(
      MacOSWebStorageCreationParams(
        localStorage: createPlatformLocalStorageStatic(),
        sessionStorage: createPlatformSessionStorageStatic(),
      ),
    );
  }

  /// Creates a new [MacOSLocalStorage].
  ///
  /// This function should only be called by the app-facing package.
  /// Look at using [CygnusLocalStorage] in `flutter_inappwebview` instead.
  @override
  MacOSLocalStorage createPlatformLocalStorage(
    CygnusPlatformLocalStorageCreationParams params,
  ) {
    return MacOSLocalStorage(params);
  }

  /// Creates a new empty [MacOSLocalStorage] to access static methods.
  ///
  /// This function should only be called by the app-facing package.
  /// Look at using [CygnusLocalStorage] in `flutter_inappwebview` instead.
  @override
  MacOSLocalStorage createPlatformLocalStorageStatic() {
    return MacOSLocalStorage.defaultStorage(controller: null);
  }

  /// Creates a new [MacOSSessionStorage].
  ///
  /// This function should only be called by the app-facing package.
  /// Look at using [CygnusSessionStorage] in `flutter_inappwebview` instead.
  @override
  MacOSSessionStorage createPlatformSessionStorage(
    CygnusPlatformSessionStorageCreationParams params,
  ) {
    return MacOSSessionStorage(params);
  }

  /// Creates a new empty [MacOSSessionStorage] to access static methods.
  ///
  /// This function should only be called by the app-facing package.
  /// Look at using [CygnusSessionStorage] in `flutter_inappwebview` instead.
  @override
  MacOSSessionStorage createPlatformSessionStorageStatic() {
    return MacOSSessionStorage.defaultStorage(controller: null);
  }

  /// Creates a new [MacOSHeadlessInAppWebView].
  ///
  /// This function should only be called by the app-facing package.
  /// Look at using [CygnusHeadlessWebView] in `flutter_inappwebview` instead.
  @override
  MacOSHeadlessInAppWebView createPlatformHeadlessWebView(
    CygnusPlatformHeadlessWebViewCreationParams params,
  ) {
    return MacOSHeadlessInAppWebView(params);
  }

  /// Creates a new empty [MacOSHeadlessInAppWebView] to access static methods.
  ///
  /// This function should only be called by the app-facing package.
  /// Look at using [CygnusHeadlessWebView] in `flutter_inappwebview` instead.
  @override
  MacOSHeadlessInAppWebView createPlatformHeadlessWebViewStatic() {
    return MacOSHeadlessInAppWebView.static();
  }

  /// Creates a new [MacOSHttpAuthCredentialDatabase].
  ///
  /// This function should only be called by the app-facing package.
  /// Look at using [CygnusHttpAuthCredentialDatabase] in `flutter_inappwebview` instead.
  @override
  MacOSHttpAuthCredentialDatabase createPlatformHttpAuthCredentialDatabase(
    CygnusPlatformHttpAuthCredentialDatabaseCreationParams params,
  ) {
    return MacOSHttpAuthCredentialDatabase(params);
  }

  /// Creates a new empty [MacOSHttpAuthCredentialDatabase] to access static methods.
  ///
  /// This function should only be called by the app-facing package.
  /// Look at using [CygnusHttpAuthCredentialDatabase] in `flutter_inappwebview` instead.
  @override
  MacOSHttpAuthCredentialDatabase
  createPlatformHttpAuthCredentialDatabaseStatic() {
    return MacOSHttpAuthCredentialDatabase.static();
  }

  /// Creates a new [MacOSInAppBrowser].
  ///
  /// This function should only be called by the app-facing package.
  /// Look at using [CygnusBrowser] in `flutter_inappwebview` instead.
  @override
  MacOSInAppBrowser createPlatformBrowser(
    CygnusPlatformBrowserCreationParams params,
  ) {
    return MacOSInAppBrowser(params);
  }

  /// Creates a new empty [MacOSInAppBrowser] to access static methods.
  ///
  /// This function should only be called by the app-facing package.
  /// Look at using [CygnusBrowser] in `flutter_inappwebview` instead.
  @override
  MacOSInAppBrowser createPlatformBrowserStatic() {
    return MacOSInAppBrowser.static();
  }

  /// Creates a new empty [MacOSWebStorageManager] to access static methods.
  ///
  /// This function should only be called by the app-facing package.
  /// Look at using [CygnusWebStorageManager] in `flutter_inappwebview` instead.
  @override
  MacOSWebStorageManager createPlatformWebStorageManager(
    CygnusPlatformWebStorageManagerCreationParams params,
  ) {
    return MacOSWebStorageManager(params);
  }

  /// Creates a new empty [MacOSWebStorageManager] to access static methods.
  ///
  /// This function should only be called by the app-facing package.
  /// Look at using [CygnusWebStorageManager] in `flutter_inappwebview` instead.
  @override
  MacOSWebStorageManager createPlatformWebStorageManagerStatic() {
    return MacOSWebStorageManager.static();
  }

  /// Creates a new [MacOSWebAuthenticationSession].
  ///
  /// This function should only be called by the app-facing package.
  /// Look at using [CygnusWebAuthenticationSession] in `flutter_inappwebview` instead.
  @override
  MacOSWebAuthenticationSession createPlatformWebAuthenticationSession(
    CygnusPlatformWebAuthenticationSessionCreationParams params,
  ) {
    return MacOSWebAuthenticationSession(params);
  }

  /// Creates a new empty [MacOSWebAuthenticationSession] to access static methods.
  ///
  /// This function should only be called by the app-facing package.
  /// Look at using [CygnusWebAuthenticationSession] in `flutter_inappwebview` instead.
  @override
  MacOSWebAuthenticationSession createPlatformWebAuthenticationSessionStatic() {
    return MacOSWebAuthenticationSession.static();
  }

  /// Creates a new [MacOSProxyController].
  ///
  /// This function should only be called by the app-facing package.
  /// Look at using [CygnusProxyController] in `flutter_inappwebview` instead.
  @override
  CygnusPlatformProxyController createPlatformProxyController(
    CygnusPlatformProxyControllerCreationParams params,
  ) {
    return MacOSProxyController(params);
  }

  /// Creates a new empty [MacOSProxyController] to access static methods.
  ///
  /// This function should only be called by the app-facing package.
  /// Look at using [CygnusProxyController] in `flutter_inappwebview` instead.
  @override
  MacOSProxyController createPlatformProxyControllerStatic() {
    return MacOSProxyController.static();
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

  /// Creates a new empty [CygnusPlatformChromeSafariBrowser] to access static methods.
  ///
  /// This function should only be called by the app-facing package.
  /// Look at using [CygnusChromeSafariBrowser] in `flutter_inappwebview` instead.
  CygnusPlatformChromeSafariBrowser createPlatformChromeSafariBrowserStatic() {
    return _PlatformChromeSafariBrowser.static();
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
  CygnusDefaultLocalhostServer createPlatformLocalhostServer(
    CygnusPlatformLocalhostServerCreationParams params,
  ) {
    return CygnusDefaultLocalhostServer(params);
  }

  /// Creates a new empty [CygnusDefaultLocalhostServer] to access static methods.
  ///
  /// This function should only be called by the app-facing package.
  /// Look at using [CygnusLocalhostServer] in `flutter_inappwebview` instead.
  @override
  CygnusDefaultLocalhostServer createPlatformLocalhostServerStatic() {
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

class _PlatformChromeSafariBrowser extends CygnusPlatformChromeSafariBrowser {
  _PlatformChromeSafariBrowser(CygnusPlatformChromeSafariBrowserCreationParams params)
    : super.implementation(params);
  static final _PlatformChromeSafariBrowser _staticValue =
      _PlatformChromeSafariBrowser(
        const CygnusPlatformChromeSafariBrowserCreationParams(),
      );

  factory _PlatformChromeSafariBrowser.static() => _staticValue;
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

class _PlatformPullToRefreshController extends CygnusPlatformPullToRefreshController {
  _PlatformPullToRefreshController(
    CygnusPlatformPullToRefreshControllerCreationParams params,
  ) : super.implementation(params);

  static final _PlatformPullToRefreshController _staticValue =
      _PlatformPullToRefreshController(
        CygnusPlatformPullToRefreshControllerCreationParams(),
      );

  factory _PlatformPullToRefreshController.static() => _staticValue;
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
