import 'package:cygnus_core/src/platform_interface/flutter_inappwebview_platform_interface.dart';

import 'cookie_manager.dart';
import 'in_app_webview/main.dart';
import 'web_storage/web_storage.dart';

/// Implementation of [CygnusWebViewPlatform] using the Web API.
class WebPlatformInAppWebViewPlatform extends CygnusWebViewPlatform {
  /// Registers this class as the default instance of [CygnusWebViewPlatform].
  static void registerWith() {
    CygnusWebViewPlatform.instance = WebPlatformInAppWebViewPlatform();
  }

  /// Creates a new [WebPlatformCookieManager].
  ///
  /// This function should only be called by the app-facing package.
  /// Look at using [CygnusCookieManager] in `flutter_inappwebview` instead.
  @override
  WebPlatformCookieManager createPlatformCookieManager(
    CygnusPlatformCookieManagerCreationParams params,
  ) {
    return WebPlatformCookieManager(params);
  }

  /// Creates a new empty [WebPlatformCookieManager] to access static methods.
  ///
  /// This function should only be called by the app-facing package.
  /// Look at using [CygnusCookieManager] in `flutter_inappwebview` instead.
  @override
  WebPlatformCookieManager createPlatformCookieManagerStatic() {
    return WebPlatformCookieManager.static();
  }

  /// Creates a new [WebPlatformInAppWebViewController].
  ///
  /// This function should only be called by the app-facing package.
  /// Look at using [CygnusWebViewController] in `flutter_inappwebview` instead.
  @override
  WebPlatformInAppWebViewController createPlatformWebViewController(
    CygnusPlatformWebViewControllerCreationParams params,
  ) {
    return WebPlatformInAppWebViewController(params);
  }

  /// Creates a new empty [WebPlatformInAppWebViewController] to access static methods.
  ///
  /// This function should only be called by the app-facing package.
  /// Look at using [CygnusWebViewController] in `flutter_inappwebview` instead.
  @override
  WebPlatformInAppWebViewController
  createPlatformWebViewControllerStatic() {
    return WebPlatformInAppWebViewController.static();
  }

  /// Creates a new [WebPlatformInAppWebViewWidget].
  ///
  /// This function should only be called by the app-facing package.
  /// Look at using [CygnusWebView] in `flutter_inappwebview` instead.
  @override
  WebPlatformInAppWebViewWidget createPlatformWebViewWidget(
    CygnusPlatformWebViewWidgetCreationParams params,
  ) {
    return WebPlatformInAppWebViewWidget(params);
  }

  /// Creates a new empty [WebPlatformInAppWebViewWidget] to access static methods.
  ///
  /// This function should only be called by the app-facing package.
  /// Look at using [CygnusWebView] in `flutter_inappwebview` instead.
  @override
  WebPlatformInAppWebViewWidget createPlatformWebViewWidgetStatic() {
    return WebPlatformInAppWebViewWidget.static();
  }

  /// Creates a new [WebPlatformHeadlessInAppWebView].
  ///
  /// This function should only be called by the app-facing package.
  /// Look at using [CygnusHeadlessWebView] in `flutter_inappwebview` instead.
  @override
  WebPlatformHeadlessInAppWebView createPlatformHeadlessWebView(
    CygnusPlatformHeadlessWebViewCreationParams params,
  ) {
    return WebPlatformHeadlessInAppWebView(params);
  }

  /// Creates a new empty [WebPlatformHeadlessInAppWebView] to access static methods.
  ///
  /// This function should only be called by the app-facing package.
  /// Look at using [CygnusHeadlessWebView] in `flutter_inappwebview` instead.
  @override
  WebPlatformHeadlessInAppWebView createPlatformHeadlessWebViewStatic() {
    return WebPlatformHeadlessInAppWebView.static();
  }

  /// Creates a new [WebPlatformWebStorage].
  ///
  /// This function should only be called by the app-facing package.
  /// Look at using [CygnusWebStorage] in `flutter_inappwebview` instead.
  @override
  WebPlatformWebStorage createPlatformWebStorage(
    CygnusPlatformWebStorageCreationParams params,
  ) {
    return WebPlatformWebStorage(params);
  }

  /// Creates a new empty [WebPlatformWebStorage] to access static methods.
  ///
  /// This function should only be called by the app-facing package.
  /// Look at using [CygnusWebStorage] in `flutter_inappwebview` instead.
  @override
  WebPlatformWebStorage createPlatformWebStorageStatic() {
    return WebPlatformWebStorage(
      WebPlatformWebStorageCreationParams(
        localStorage: createPlatformLocalStorageStatic(),
        sessionStorage: createPlatformSessionStorageStatic(),
      ),
    );
  }

  /// Creates a new [WebPlatformLocalStorage].
  ///
  /// This function should only be called by the app-facing package.
  /// Look at using [CygnusLocalStorage] in `flutter_inappwebview` instead.
  @override
  WebPlatformLocalStorage createPlatformLocalStorage(
    CygnusPlatformLocalStorageCreationParams params,
  ) {
    return WebPlatformLocalStorage(params);
  }

  /// Creates a new empty [WebPlatformLocalStorage] to access static methods.
  ///
  /// This function should only be called by the app-facing package.
  /// Look at using [CygnusLocalStorage] in `flutter_inappwebview` instead.
  @override
  WebPlatformLocalStorage createPlatformLocalStorageStatic() {
    return WebPlatformLocalStorage.defaultStorage(controller: null);
  }

  /// Creates a new [WebPlatformSessionStorage].
  ///
  /// This function should only be called by the app-facing package.
  /// Look at using [CygnusSessionStorage] in `flutter_inappwebview` instead.
  @override
  WebPlatformSessionStorage createPlatformSessionStorage(
    CygnusPlatformSessionStorageCreationParams params,
  ) {
    return WebPlatformSessionStorage(params);
  }

  /// Creates a new empty [WebPlatformSessionStorage] to access static methods.
  ///
  /// This function should only be called by the app-facing package.
  /// Look at using [CygnusSessionStorage] in `flutter_inappwebview` instead.
  @override
  WebPlatformSessionStorage createPlatformSessionStorageStatic() {
    return WebPlatformSessionStorage.defaultStorage(controller: null);
  }

  /// Creates a new empty [CygnusPlatformWebStorageManager] to access static methods.
  ///
  /// This function should only be called by the app-facing package.
  /// Look at using [CygnusWebStorageManager] in `flutter_inappwebview` instead.
  @override
  CygnusPlatformWebStorageManager createPlatformWebStorageManagerStatic() {
    return _PlatformWebStorageManager.static();
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

  /// Creates a new empty [CygnusPlatformBrowser] to access static methods.
  ///
  /// This function should only be called by the app-facing package.
  /// Look at using [CygnusBrowser] in `flutter_inappwebview` instead.
  @override
  CygnusPlatformBrowser createPlatformBrowserStatic() {
    return _PlatformInAppBrowser.static();
  }

  /// Creates a new empty [CygnusPlatformChromeSafariBrowser] to access static methods.
  ///
  /// This function should only be called by the app-facing package.
  /// Look at using [CygnusChromeSafariBrowser] in `flutter_inappwebview` instead.
  CygnusPlatformChromeSafariBrowser createPlatformChromeSafariBrowserStatic() {
    return _PlatformChromeSafariBrowser.static();
  }

  /// Creates a new empty [CygnusPlatformHttpAuthCredentialDatabase] to access static methods.
  ///
  /// This function should only be called by the app-facing package.
  /// Look at using [CygnusHttpAuthCredentialDatabase] in `flutter_inappwebview` instead.
  @override
  CygnusPlatformHttpAuthCredentialDatabase
  createPlatformHttpAuthCredentialDatabaseStatic() {
    return _PlatformHttpAuthCredentialDatabase.static();
  }

  /// Creates a new empty [CygnusPlatformProcessGlobalConfig] to access static methods.
  ///
  /// This function should only be called by the app-facing package.
  /// Look at using [CygnusProcessGlobalConfig] in `flutter_inappwebview` instead.
  @override
  CygnusPlatformProcessGlobalConfig createPlatformProcessGlobalConfigStatic() {
    return _PlatformProcessGlobalConfig.static();
  }

  /// Creates a new empty [CygnusPlatformProxyController] to access static methods.
  ///
  /// This function should only be called by the app-facing package.
  /// Look at using [CygnusProxyController] in `flutter_inappwebview` instead.
  @override
  CygnusPlatformProxyController createPlatformProxyControllerStatic() {
    return _PlatformProxyController.static();
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

  /// Creates a new empty [CygnusPlatformFindInteractionController] to access static methods.
  ///
  /// This function should only be called by the app-facing package.
  /// Look at using [CygnusFindInteractionController] in `flutter_inappwebview` instead.
  @override
  CygnusPlatformFindInteractionController
  createPlatformFindInteractionControllerStatic() {
    return _PlatformFindInteractionController.static();
  }

  /// Creates a new empty [CygnusPlatformPrintJobController] to access static methods.
  ///
  /// This function should only be called by the app-facing package.
  /// Look at using [CygnusPrintJobController] in `flutter_inappwebview` instead.
  @override
  CygnusPlatformPrintJobController createPlatformPrintJobControllerStatic() {
    return _PlatformPrintJobController.static();
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

  /// Creates a new empty [CygnusPlatformWebAuthenticationSession] to access static methods.
  ///
  /// This function should only be called by the app-facing package.
  /// Look at using [CygnusWebAuthenticationSession] in `flutter_inappwebview` instead.
  @override
  CygnusPlatformWebAuthenticationSession
  createPlatformWebAuthenticationSessionStatic() {
    return _PlatformWebAuthenticationSession.static();
  }

  /// Creates a new empty [CygnusPlatformWebMessageChannel] to access static methods.
  ///
  /// This function should only be called by the app-facing package.
  /// Look at using [CygnusWebMessageChannel] in `flutter_inappwebview` instead.
  @override
  CygnusPlatformWebMessageChannel createPlatformWebMessageChannelStatic() {
    return _PlatformWebMessageChannel.static();
  }

  /// Creates a new empty [CygnusPlatformWebMessageListener] to access static methods.
  ///
  /// This function should only be called by the app-facing package.
  /// Look at using [CygnusWebMessageListener] in `flutter_inappwebview` instead.
  @override
  CygnusPlatformWebMessageListener createPlatformWebMessageListenerStatic() {
    return _PlatformWebMessageListener.static();
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

  /// Creates a new empty [CygnusPlatformLocalhostServer] to access static methods.
  ///
  /// This function should only be called by the app-facing package.
  /// Look at using [CygnusLocalhostServer] in `flutter_inappwebview` instead.
  @override
  CygnusPlatformLocalhostServer createPlatformLocalhostServerStatic() {
    return _PlatformInAppLocalhostServer.static();
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

class _PlatformInAppBrowser extends CygnusPlatformBrowser {
  _PlatformInAppBrowser(CygnusPlatformBrowserCreationParams params)
    : super.implementation(params);
  static final _PlatformInAppBrowser _staticValue = _PlatformInAppBrowser(
    const CygnusPlatformBrowserCreationParams(),
  );

  factory _PlatformInAppBrowser.static() => _staticValue;
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

class _PlatformHttpAuthCredentialDatabase
    extends CygnusPlatformHttpAuthCredentialDatabase {
  _PlatformHttpAuthCredentialDatabase(
    CygnusPlatformHttpAuthCredentialDatabaseCreationParams params,
  ) : super.implementation(params);
  static final _PlatformHttpAuthCredentialDatabase _staticValue =
      _PlatformHttpAuthCredentialDatabase(
        const CygnusPlatformHttpAuthCredentialDatabaseCreationParams(),
      );

  factory _PlatformHttpAuthCredentialDatabase.static() => _staticValue;
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

class _PlatformProxyController extends CygnusPlatformProxyController {
  _PlatformProxyController(CygnusPlatformProxyControllerCreationParams params)
    : super.implementation(params);
  static final _PlatformProxyController _staticValue = _PlatformProxyController(
    const CygnusPlatformProxyControllerCreationParams(),
  );

  factory _PlatformProxyController.static() => _staticValue;
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

class _PlatformFindInteractionController
    extends CygnusPlatformFindInteractionController {
  _PlatformFindInteractionController(
    CygnusPlatformFindInteractionControllerCreationParams params,
  ) : super.implementation(params);
  static final _PlatformFindInteractionController _staticValue =
      _PlatformFindInteractionController(
        const CygnusPlatformFindInteractionControllerCreationParams(),
      );

  factory _PlatformFindInteractionController.static() => _staticValue;
}

class _PlatformPrintJobController extends CygnusPlatformPrintJobController {
  _PlatformPrintJobController(CygnusPlatformPrintJobControllerCreationParams params)
    : super.implementation(params);

  static final _PlatformPrintJobController _staticValue =
      _PlatformPrintJobController(
        const CygnusPlatformPrintJobControllerCreationParams(id: ''),
      );

  factory _PlatformPrintJobController.static() => _staticValue;
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

class _PlatformWebMessageChannel extends CygnusPlatformWebMessageChannel {
  _PlatformWebMessageChannel(CygnusPlatformWebMessageChannelCreationParams params)
    : super.implementation(params);

  static final _PlatformWebMessageChannel _staticValue =
      _PlatformWebMessageChannel(
        CygnusPlatformWebMessageChannelCreationParams(
          id: '',
          port1: _PlatformWebMessagePort(
            const CygnusPlatformWebMessagePortCreationParams(index: 0),
          ),
          port2: _PlatformWebMessagePort(
            const CygnusPlatformWebMessagePortCreationParams(index: 1),
          ),
        ),
      );

  factory _PlatformWebMessageChannel.static() => _staticValue;
}

class _PlatformWebMessageListener extends CygnusPlatformWebMessageListener {
  _PlatformWebMessageListener(CygnusPlatformWebMessageListenerCreationParams params)
    : super.implementation(params);

  static final _PlatformWebMessageListener _staticValue =
      _PlatformWebMessageListener(
        const CygnusPlatformWebMessageListenerCreationParams(jsObjectName: ''),
      );

  factory _PlatformWebMessageListener.static() => _staticValue;
}

class _PlatformWebMessagePort extends CygnusPlatformWebMessagePort {
  _PlatformWebMessagePort(CygnusPlatformWebMessagePortCreationParams params)
    : super.implementation(params);

  static final _PlatformWebMessagePort _staticValue = _PlatformWebMessagePort(
    const CygnusPlatformWebMessagePortCreationParams(index: 0),
  );

  factory _PlatformWebMessagePort.static() => _staticValue;

  @override
  Future<void> close() {
    throw UnimplementedError();
  }

  @override
  Future<void> postMessage(CygnusWebMessage message) {
    throw UnimplementedError();
  }

  @override
  Future<void> setWebMessageCallback(CygnusWebMessageCallback? onMessage) {
    throw UnimplementedError();
  }

  @override
  Map<String, dynamic> toJson() {
    throw UnimplementedError();
  }

  @override
  Map<String, dynamic> toMap({CygnusEnumMethod? enumMethod}) {
    throw UnimplementedError();
  }
}

class _PlatformWebStorageManager extends CygnusPlatformWebStorageManager {
  _PlatformWebStorageManager(CygnusPlatformWebStorageManagerCreationParams params)
    : super.implementation(params);

  static final _PlatformWebStorageManager _staticValue =
      _PlatformWebStorageManager(
        const CygnusPlatformWebStorageManagerCreationParams(),
      );

  factory _PlatformWebStorageManager.static() => _staticValue;
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

class _PlatformInAppLocalhostServer extends CygnusPlatformLocalhostServer {
  _PlatformInAppLocalhostServer(
    CygnusPlatformLocalhostServerCreationParams params,
  ) : super.implementation(params);

  static final _PlatformInAppLocalhostServer _staticValue =
      _PlatformInAppLocalhostServer(
        const CygnusPlatformLocalhostServerCreationParams(),
      );

  factory _PlatformInAppLocalhostServer.static() => _staticValue;
}
