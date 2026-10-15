import 'package:cygnus_core/src/platform_interface/flutter_webview_platform_interface.dart';

import 'cookie_manager.dart';
import 'find_interaction/find_interaction_controller.dart';
import 'browser/browser.dart';
import 'webview/headless_webview.dart';
import 'webview/webview.dart';
import 'webview/webview_controller.dart';
import 'web_message/web_message_channel.dart';
import 'web_message/web_message_listener.dart';
import 'web_message/web_message_port.dart';
import 'web_notification/web_notification_controller.dart';
import 'web_storage/web_storage.dart';
import 'webview_environment/webview_environment.dart';

/// Implementation of [CygnusWebViewPlatform] using the WebView2 API.
class CygnusWindowsWebViewPlatform extends CygnusWebViewPlatform {
  /// Registers this class as the default instance of [CygnusWebViewPlatform].
  static void registerWith() {
    CygnusWebViewPlatform.instance = CygnusWindowsWebViewPlatform();
  }

  /// Creates a new [WindowsCookieManager].
  ///
  /// This function should only be called by the app-facing package.
  /// Look at using [CygnusCookieManager] in `cygnus` instead.
  @override
  WindowsCookieManager createPlatformCookieManager(
    CygnusPlatformCookieManagerCreationParams params,
  ) {
    return WindowsCookieManager(params);
  }

  /// Creates a new empty [WindowsCookieManager] to access static methods.
  ///
  /// This function should only be called by the app-facing package.
  /// Look at using [CygnusCookieManager] in `cygnus` instead.
  @override
  WindowsCookieManager createPlatformCookieManagerStatic() {
    return WindowsCookieManager.static();
  }

  /// Creates a new [WindowsInAppWebViewController].
  ///
  /// This function should only be called by the app-facing package.
  /// Look at using [CygnusWebViewController] in `cygnus` instead.
  @override
  WindowsInAppWebViewController createPlatformWebViewController(
    CygnusPlatformWebViewControllerCreationParams params,
  ) {
    return WindowsInAppWebViewController(params);
  }

  /// Creates a new empty [WindowsInAppWebViewController] to access static methods.
  ///
  /// This function should only be called by the app-facing package.
  /// Look at using [CygnusWebViewController] in `cygnus` instead.
  @override
  WindowsInAppWebViewController createPlatformWebViewControllerStatic() {
    return WindowsInAppWebViewController.static();
  }

  /// Creates a new [WindowsInAppWebViewWidget].
  ///
  /// This function should only be called by the app-facing package.
  /// Look at using [CygnusWebView] in `cygnus` instead.
  @override
  WindowsInAppWebViewWidget createPlatformWebViewWidget(
    CygnusPlatformWebViewWidgetCreationParams params,
  ) {
    return WindowsInAppWebViewWidget(params);
  }

  /// Creates a new empty [WindowsInAppWebViewWidget] to access static methods.
  ///
  /// This function should only be called by the app-facing package.
  /// Look at using [CygnusWebView] in `cygnus` instead.
  @override
  WindowsInAppWebViewWidget createPlatformWebViewWidgetStatic() {
    return WindowsInAppWebViewWidget.static();
  }

  /// Creates a new [WindowsInAppBrowser].
  ///
  /// This function should only be called by the app-facing package.
  /// Look at using [CygnusBrowser] in `cygnus` instead.
  @override
  WindowsInAppBrowser createPlatformBrowser(
    CygnusPlatformBrowserCreationParams params,
  ) {
    return WindowsInAppBrowser(params);
  }

  /// Creates a new empty [WindowsInAppBrowser] to access static methods.
  ///
  /// This function should only be called by the app-facing package.
  /// Look at using [CygnusBrowser] in `cygnus` instead.
  @override
  WindowsInAppBrowser createPlatformBrowserStatic() {
    return WindowsInAppBrowser.static();
  }

  /// Creates a new [WindowsHeadlessInAppWebView].
  ///
  /// This function should only be called by the app-facing package.
  /// Look at using [CygnusHeadlessWebView] in `cygnus` instead.
  @override
  WindowsHeadlessInAppWebView createPlatformHeadlessWebView(
    CygnusPlatformHeadlessWebViewCreationParams params,
  ) {
    return WindowsHeadlessInAppWebView(params);
  }

  /// Creates a new empty [WindowsHeadlessInAppWebView] to access static methods.
  ///
  /// This function should only be called by the app-facing package.
  /// Look at using [CygnusHeadlessWebView] in `cygnus` instead.
  @override
  WindowsHeadlessInAppWebView createPlatformHeadlessWebViewStatic() {
    return WindowsHeadlessInAppWebView.static();
  }

  /// Creates a new [WindowsWebViewEnvironment].
  ///
  /// This function should only be called by the app-facing package.
  /// Look at using [CygnusWebViewEnvironment] in `cygnus` instead.
  @override
  WindowsWebViewEnvironment createPlatformWebViewEnvironment(
    CygnusPlatformWebViewEnvironmentCreationParams params,
  ) {
    return WindowsWebViewEnvironment(params);
  }

  /// Creates a new empty [WindowsWebViewEnvironment] to access static methods.
  ///
  /// This function should only be called by the app-facing package.
  /// Look at using [CygnusWebViewEnvironment] in `cygnus` instead.
  @override
  WindowsWebViewEnvironment createPlatformWebViewEnvironmentStatic() {
    return WindowsWebViewEnvironment.static();
  }

  /// Creates a new [WindowsWebStorage].
  ///
  /// This function should only be called by the app-facing package.
  /// Look at using [CygnusWebStorage] in `cygnus` instead.
  @override
  WindowsWebStorage createPlatformWebStorage(
    CygnusPlatformWebStorageCreationParams params,
  ) {
    return WindowsWebStorage(params);
  }

  /// Creates a new empty [WindowsWebStorage] to access static methods.
  ///
  /// This function should only be called by the app-facing package.
  /// Look at using [CygnusWebStorage] in `cygnus` instead.
  @override
  WindowsWebStorage createPlatformWebStorageStatic() {
    return WindowsWebStorage(
      WindowsWebStorageCreationParams(
        localStorage: createPlatformLocalStorageStatic(),
        sessionStorage: createPlatformSessionStorageStatic(),
      ),
    );
  }

  /// Creates a new [WindowsLocalStorage].
  ///
  /// This function should only be called by the app-facing package.
  /// Look at using [CygnusLocalStorage] in `cygnus` instead.
  @override
  WindowsLocalStorage createPlatformLocalStorage(
    CygnusPlatformLocalStorageCreationParams params,
  ) {
    return WindowsLocalStorage(params);
  }

  /// Creates a new empty [WindowsLocalStorage] to access static methods.
  ///
  /// This function should only be called by the app-facing package.
  /// Look at using [CygnusLocalStorage] in `cygnus` instead.
  @override
  WindowsLocalStorage createPlatformLocalStorageStatic() {
    return WindowsLocalStorage.defaultStorage(controller: null);
  }

  /// Creates a new [WindowsSessionStorage].
  ///
  /// This function should only be called by the app-facing package.
  /// Look at using [CygnusSessionStorage] in `cygnus` instead.
  @override
  WindowsSessionStorage createPlatformSessionStorage(
    CygnusPlatformSessionStorageCreationParams params,
  ) {
    return WindowsSessionStorage(params);
  }

  /// Creates a new empty [WindowsSessionStorage] to access static methods.
  ///
  /// This function should only be called by the app-facing package.
  /// Look at using [CygnusSessionStorage] in `cygnus` instead.
  @override
  WindowsSessionStorage createPlatformSessionStorageStatic() {
    return WindowsSessionStorage.defaultStorage(controller: null);
  }

  /// Creates a new [WindowsWebMessageChannel].
  ///
  /// This function should only be called by the app-facing package.
  /// Look at using [CygnusWebMessageChannel] in `cygnus` instead.
  @override
  WindowsWebMessageChannel createPlatformWebMessageChannel(
    CygnusPlatformWebMessageChannelCreationParams params,
  ) {
    return WindowsWebMessageChannel(params);
  }

  /// Creates a new empty [WindowsWebMessageChannel] to access static methods.
  ///
  /// This function should only be called by the app-facing package.
  /// Look at using [CygnusWebMessageChannel] in `cygnus` instead.
  @override
  WindowsWebMessageChannel createPlatformWebMessageChannelStatic() {
    return WindowsWebMessageChannel.static();
  }

  /// Creates a new [WindowsWebMessagePort].
  ///
  /// This function should only be called by the app-facing package.
  /// Look at using [CygnusWebMessagePort] in `cygnus` instead.
  @override
  WindowsWebMessagePort createPlatformWebMessagePort(
    CygnusPlatformWebMessagePortCreationParams params,
  ) {
    return WindowsWebMessagePort(params);
  }

  /// Creates a new [WindowsWebMessageListener].
  ///
  /// This function should only be called by the app-facing package.
  /// Look at using [CygnusWebMessageListener] in `cygnus` instead.
  @override
  WindowsWebMessageListener createPlatformWebMessageListener(
    CygnusPlatformWebMessageListenerCreationParams params,
  ) {
    return WindowsWebMessageListener(params);
  }

  /// Creates a new [WindowsJavaScriptReplyProxy].
  ///
  /// This function should only be called by the app-facing package.
  /// Look at using [CygnusJavaScriptReplyProxy] in `cygnus` instead.
  @override
  WindowsJavaScriptReplyProxy createPlatformJavaScriptReplyProxy(
    CygnusPlatformJavaScriptReplyProxyCreationParams params,
  ) {
    return WindowsJavaScriptReplyProxy(params);
  }

  /// Creates a new empty [WindowsWebMessageListener] to access static methods.
  ///
  /// This function should only be called by the app-facing package.
  /// Look at using [CygnusWebMessageListener] in `cygnus` instead.
  @override
  WindowsWebMessageListener createPlatformWebMessageListenerStatic() {
    return WindowsWebMessageListener.static();
  }

  /// Creates a new [WindowsFindInteractionController].
  ///
  /// This function should only be called by the app-facing package.
  /// Look at using [CygnusFindInteractionController] in `cygnus` instead.
  @override
  WindowsFindInteractionController createPlatformFindInteractionController(
    CygnusPlatformFindInteractionControllerCreationParams params,
  ) {
    return WindowsFindInteractionController(params);
  }

  /// Creates a new empty [WindowsFindInteractionController] to access static methods.
  ///
  /// This function should only be called by the app-facing package.
  /// Look at using [CygnusFindInteractionController] in `cygnus` instead.
  @override
  WindowsFindInteractionController
  createPlatformFindInteractionControllerStatic() {
    return WindowsFindInteractionController.static();
  }

  /// Creates a new [WindowsWebNotificationController].
  ///
  /// This function should only be called by the app-facing package.
  /// Look at using [CygnusWebNotificationController] in `cygnus` instead.
  @override
  WindowsWebNotificationController createPlatformWebNotificationController(
    CygnusPlatformWebNotificationControllerCreationParams params,
  ) {
    return WindowsWebNotificationController(params);
  }

  /// Creates a new empty [WindowsWebNotificationController] to access static methods.
  ///
  /// This function should only be called by the app-facing package.
  /// Look at using [CygnusWebNotificationController] in `cygnus` instead.
  @override
  WindowsWebNotificationController
  createPlatformWebNotificationControllerStatic() {
    return WindowsWebNotificationController.static();
  }

  // ************************************************************************ //
  // Create static instances of unsupported classes to be able to call        //
  // isClassSupported, isMethodSupported, isPropertySupported, etc.           //
  // static methods without throwing a missing platform implementation        //
  // exception.                                                               //
  // ************************************************************************ //

  /// Creates a new empty [CygnusPlatformWebStorageManager] to access static methods.
  ///
  /// This function should only be called by the app-facing package.
  /// Look at using [CygnusWebStorageManager] in `cygnus` instead.
  @override
  CygnusPlatformWebStorageManager createPlatformWebStorageManagerStatic() {
    return _PlatformWebStorageManager.static();
  }

  /// Creates a new empty [CygnusPlatformChromeSafariBrowser] to access static methods.
  ///
  /// This function should only be called by the app-facing package.
  /// Look at using [CygnusChromeSafariBrowser] in `cygnus` instead.
  CygnusPlatformChromeSafariBrowser createPlatformChromeSafariBrowserStatic() {
    return _PlatformChromeSafariBrowser.static();
  }

  /// Creates a new empty [CygnusPlatformHttpAuthCredentialDatabase] to access static methods.
  ///
  /// This function should only be called by the app-facing package.
  /// Look at using [CygnusHttpAuthCredentialDatabase] in `cygnus` instead.
  @override
  CygnusPlatformHttpAuthCredentialDatabase
  createPlatformHttpAuthCredentialDatabaseStatic() {
    return _PlatformHttpAuthCredentialDatabase.static();
  }

  /// Creates a new empty [CygnusPlatformProcessGlobalConfig] to access static methods.
  ///
  /// This function should only be called by the app-facing package.
  /// Look at using [CygnusProcessGlobalConfig] in `cygnus` instead.
  @override
  CygnusPlatformProcessGlobalConfig createPlatformProcessGlobalConfigStatic() {
    return _PlatformProcessGlobalConfig.static();
  }

  /// Creates a new empty [CygnusPlatformProxyController] to access static methods.
  ///
  /// This function should only be called by the app-facing package.
  /// Look at using [CygnusProxyController] in `cygnus` instead.
  @override
  CygnusPlatformProxyController createPlatformProxyControllerStatic() {
    return _PlatformProxyController.static();
  }

  /// Creates a new empty [CygnusPlatformServiceWorkerController] to access static methods.
  ///
  /// This function should only be called by the app-facing package.
  /// Look at using [CygnusServiceWorkerController] in `cygnus` instead.
  @override
  CygnusPlatformServiceWorkerController
  createPlatformServiceWorkerControllerStatic() {
    return _PlatformServiceWorkerController.static();
  }

  /// Creates a new empty [CygnusPlatformTracingController] to access static methods.
  ///
  /// This function should only be called by the app-facing package.
  /// Look at using [CygnusTracingController] in `cygnus` instead.
  @override
  CygnusPlatformTracingController createPlatformTracingControllerStatic() {
    return _PlatformTracingController.static();
  }

  /// Creates a new empty [CygnusPlatformPrintJobController] to access static methods.
  ///
  /// This function should only be called by the app-facing package.
  /// Look at using [CygnusPrintJobController] in `cygnus` instead.
  @override
  CygnusPlatformPrintJobController createPlatformPrintJobControllerStatic() {
    return _PlatformPrintJobController.static();
  }

  /// Creates a new empty [CygnusPlatformPullToRefreshController] to access static methods.
  ///
  /// This function should only be called by the app-facing package.
  /// Look at using [CygnusPullToRefreshController] in `cygnus` instead.
  @override
  CygnusPlatformPullToRefreshController
  createPlatformPullToRefreshControllerStatic() {
    return _PlatformPullToRefreshController.static();
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

  /// Creates a new empty [CygnusPlatformAssetsPathHandler] to access static methods.
  ///
  /// This function should only be called by the app-facing package.
  /// Look at using [CygnusAssetsPathHandler] in `cygnus` instead.
  @override
  CygnusPlatformAssetsPathHandler createPlatformAssetsPathHandlerStatic() {
    return _PlatformAssetsPathHandler.static();
  }

  /// Creates a new empty [CygnusPlatformResourcesPathHandler] to access static methods.
  ///
  /// This function should only be called by the app-facing package.
  /// Look at using [CygnusResourcesPathHandler] in `cygnus` instead.
  @override
  CygnusPlatformResourcesPathHandler createPlatformResourcesPathHandlerStatic() {
    return _PlatformResourcesPathHandler.static();
  }

  /// Creates a new empty [CygnusPlatformInternalStoragePathHandler] to access static methods.
  ///
  /// This function should only be called by the app-facing package.
  /// Look at using [CygnusInternalStoragePathHandler] in `cygnus` instead.
  @override
  CygnusPlatformInternalStoragePathHandler
  createPlatformInternalStoragePathHandlerStatic() {
    return _PlatformInternalStoragePathHandler.static();
  }

  /// Creates a new empty [CygnusPlatformCustomPathHandler] to access static methods.
  ///
  /// This function should only be called by the app-facing package.
  /// Look at using [CygnusCustomPathHandler] in `cygnus` instead.
  @override
  CygnusPlatformCustomPathHandler createPlatformCustomPathHandlerStatic() {
    return _PlatformCustomPathHandler.static();
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

  /// Creates a new empty [CygnusPlatformWebViewFeature] to access static methods.
  ///
  /// This function should only be called by the app-facing package.
  /// Look at using [CygnusWebViewFeature] in `cygnus` instead
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

class _PlatformWebStorageManager extends CygnusPlatformWebStorageManager {
  _PlatformWebStorageManager(CygnusPlatformWebStorageManagerCreationParams params)
    : super.implementation(params);

  static final _PlatformWebStorageManager _staticValue =
      _PlatformWebStorageManager(
        const CygnusPlatformWebStorageManagerCreationParams(),
      );

  factory _PlatformWebStorageManager.static() => _staticValue;
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
