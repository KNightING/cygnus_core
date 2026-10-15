import 'package:cygnus_core/src/platform_interface/flutter_webview_platform_interface.dart';

import 'cookie_manager/cookie_manager.dart';
import 'find_interaction/find_interaction_controller.dart';
import 'http_auth_credentials_database.dart';
import 'browser/browser.dart';
import 'webview/webview.dart';
import 'webview/webview_controller.dart';
import 'webview/headless_webview.dart';
import 'proxy_controller/proxy_controller.dart';
import 'web_message/web_message_channel.dart';
import 'web_message/web_message_listener.dart';
import 'web_message/web_message_port.dart';
import 'web_storage/web_storage.dart';
import 'web_storage/web_storage_manager.dart';
import 'webview_environment/webview_environment.dart';

/// Implementation of [CygnusWebViewPlatform] using WPE WebKit.
class CygnusLinuxWebViewPlatform extends CygnusWebViewPlatform {
  /// Registers this class as the default instance of [CygnusWebViewPlatform].
  static void registerWith() {
    CygnusWebViewPlatform.instance = CygnusLinuxWebViewPlatform();
  }

  /// Creates a new [CygnusLinuxWebViewController].
  ///
  /// This function should only be called by the app-facing package.
  /// Look at using [CygnusWebViewController] in `cygnus` instead.
  @override
  CygnusLinuxWebViewController createPlatformWebViewController(
    CygnusPlatformWebViewControllerCreationParams params,
  ) {
    return CygnusLinuxWebViewController(params);
  }

  /// Creates a new empty [CygnusLinuxWebViewController] to access static methods.
  ///
  /// This function should only be called by the app-facing package.
  /// Look at using [CygnusWebViewController] in `cygnus` instead.
  @override
  CygnusLinuxWebViewController createPlatformWebViewControllerStatic() {
    return CygnusLinuxWebViewController.static();
  }

  /// Creates a new [CygnusLinuxWebViewWidget].
  ///
  /// This function should only be called by the app-facing package.
  /// Look at using [CygnusWebView] in `cygnus` instead.
  @override
  CygnusLinuxWebViewWidget createPlatformWebViewWidget(
    CygnusPlatformWebViewWidgetCreationParams params,
  ) {
    return CygnusLinuxWebViewWidget(params);
  }

  /// Creates a new empty [CygnusLinuxWebViewWidget] to access static methods.
  ///
  /// This function should only be called by the app-facing package.
  /// Look at using [CygnusWebView] in `cygnus` instead.
  @override
  CygnusLinuxWebViewWidget createPlatformWebViewWidgetStatic() {
    return CygnusLinuxWebViewWidget.static();
  }

  /// Creates a new empty [CygnusPlatformCookieManager] to access static methods.
  @override
  CygnusPlatformCookieManager createPlatformCookieManagerStatic() {
    return LinuxCookieManager.static();
  }

  /// Creates a new [LinuxCookieManager].
  @override
  LinuxCookieManager createPlatformCookieManager(
    CygnusPlatformCookieManagerCreationParams params,
  ) {
    return LinuxCookieManager(params);
  }

  /// Creates a new empty [CygnusPlatformWebViewEnvironment] to access static methods.
  @override
  CygnusPlatformWebViewEnvironment createPlatformWebViewEnvironmentStatic() {
    return LinuxWebViewEnvironment.static();
  }

  /// Creates a new [LinuxWebViewEnvironment].
  @override
  LinuxWebViewEnvironment createPlatformWebViewEnvironment(
    CygnusPlatformWebViewEnvironmentCreationParams params,
  ) {
    return LinuxWebViewEnvironment(params);
  }

  // ************************************************************************ //
  // Create static instances of unsupported classes to be able to call        //
  // isClassSupported, isMethodSupported, isPropertySupported, etc.           //
  // static methods without throwing a missing platform implementation        //
  // exception.                                                               //
  // ************************************************************************ //

  /// Creates a new empty [CygnusPlatformChromeSafariBrowser] to access static methods.
  @override
  CygnusPlatformChromeSafariBrowser createPlatformChromeSafariBrowserStatic() {
    return _PlatformChromeSafariBrowser.static();
  }

  /// Creates a new [LinuxHttpAuthCredentialDatabase].
  @override
  LinuxHttpAuthCredentialDatabase createPlatformHttpAuthCredentialDatabase(
    CygnusPlatformHttpAuthCredentialDatabaseCreationParams params,
  ) {
    return LinuxHttpAuthCredentialDatabase(params);
  }

  /// Creates a new empty [LinuxHttpAuthCredentialDatabase] to access static methods.
  @override
  LinuxHttpAuthCredentialDatabase
  createPlatformHttpAuthCredentialDatabaseStatic() {
    return LinuxHttpAuthCredentialDatabase.static();
  }

  /// Creates a new empty [CygnusLinuxBrowser] to access static methods.
  @override
  CygnusLinuxBrowser createPlatformBrowserStatic() {
    return CygnusLinuxBrowser.static();
  }

  /// Creates a new [CygnusLinuxBrowser].
  @override
  CygnusLinuxBrowser createPlatformBrowser(
    CygnusPlatformBrowserCreationParams params,
  ) {
    return CygnusLinuxBrowser(params);
  }

  /// Creates a new empty [CygnusPlatformHeadlessWebView] to access static methods.
  @override
  CygnusPlatformHeadlessWebView createPlatformHeadlessWebViewStatic() {
    return CygnusLinuxHeadlessWebView.static();
  }

  /// Creates a new [CygnusLinuxHeadlessWebView].
  @override
  CygnusLinuxHeadlessWebView createPlatformHeadlessWebView(
    CygnusPlatformHeadlessWebViewCreationParams params,
  ) {
    return CygnusLinuxHeadlessWebView(params);
  }

  /// Creates a new empty [CygnusPlatformProcessGlobalConfig] to access static methods.
  @override
  CygnusPlatformProcessGlobalConfig createPlatformProcessGlobalConfigStatic() {
    return _PlatformProcessGlobalConfig.static();
  }

  /// Creates a new empty [CygnusPlatformProxyController] to access static methods.
  @override
  CygnusPlatformProxyController createPlatformProxyControllerStatic() {
    return LinuxProxyController.static();
  }

  /// Creates a new [LinuxProxyController].
  @override
  LinuxProxyController createPlatformProxyController(
    CygnusPlatformProxyControllerCreationParams params,
  ) {
    return LinuxProxyController(params);
  }

  /// Creates a new empty [CygnusPlatformServiceWorkerController] to access static methods.
  @override
  CygnusPlatformServiceWorkerController
  createPlatformServiceWorkerControllerStatic() {
    return _PlatformServiceWorkerController.static();
  }

  /// Creates a new empty [CygnusPlatformTracingController] to access static methods.
  @override
  CygnusPlatformTracingController createPlatformTracingControllerStatic() {
    return _PlatformTracingController.static();
  }

  /// Creates a new empty [CygnusPlatformFindInteractionController] to access static methods.
  @override
  CygnusPlatformFindInteractionController
  createPlatformFindInteractionControllerStatic() {
    return LinuxFindInteractionController.static();
  }

  /// Creates a new [LinuxFindInteractionController].
  @override
  LinuxFindInteractionController createPlatformFindInteractionController(
    CygnusPlatformFindInteractionControllerCreationParams params,
  ) {
    return LinuxFindInteractionController(params);
  }

  /// Creates a new empty [CygnusPlatformPrintJobController] to access static methods.
  @override
  CygnusPlatformPrintJobController createPlatformPrintJobControllerStatic() {
    return _PlatformPrintJobController.static();
  }

  /// Creates a new empty [CygnusPlatformPullToRefreshController] to access static methods.
  @override
  CygnusPlatformPullToRefreshController
  createPlatformPullToRefreshControllerStatic() {
    return _PlatformPullToRefreshController.static();
  }

  /// Creates a new empty [CygnusPlatformWebAuthenticationSession] to access static methods.
  @override
  CygnusPlatformWebAuthenticationSession
  createPlatformWebAuthenticationSessionStatic() {
    return _PlatformWebAuthenticationSession.static();
  }

  /// Creates a new empty [CygnusPlatformWebNotificationController] to access static methods.
  @override
  CygnusPlatformWebNotificationController
  createPlatformWebNotificationControllerStatic() {
    return _PlatformWebNotificationController.static();
  }

  /// Creates a new empty [LinuxWebMessageChannel] to access static methods.
  @override
  LinuxWebMessageChannel createPlatformWebMessageChannelStatic() {
    return LinuxWebMessageChannel.static();
  }

  /// Creates a new [LinuxWebMessageChannel].
  @override
  LinuxWebMessageChannel createPlatformWebMessageChannel(
    CygnusPlatformWebMessageChannelCreationParams params,
  ) {
    return LinuxWebMessageChannel(params);
  }

  /// Creates a new [LinuxWebMessagePort].
  @override
  LinuxWebMessagePort createPlatformWebMessagePort(
    CygnusPlatformWebMessagePortCreationParams params,
  ) {
    return LinuxWebMessagePort(params);
  }

  /// Creates a new empty [CygnusPlatformWebMessageListener] to access static methods.
  @override
  CygnusPlatformWebMessageListener createPlatformWebMessageListenerStatic() {
    return LinuxWebMessageListener.static();
  }

  /// Creates a new [LinuxWebMessageListener].
  @override
  LinuxWebMessageListener createPlatformWebMessageListener(
    CygnusPlatformWebMessageListenerCreationParams params,
  ) {
    return LinuxWebMessageListener(params);
  }

  /// Creates a new [LinuxWebStorage].
  ///
  /// This function should only be called by the app-facing package.
  /// Look at using [CygnusWebStorage] in `cygnus` instead.
  @override
  LinuxWebStorage createPlatformWebStorage(
    CygnusPlatformWebStorageCreationParams params,
  ) {
    return LinuxWebStorage(params);
  }

  /// Creates a new empty [LinuxWebStorage] to access static methods.
  ///
  /// This function should only be called by the app-facing package.
  /// Look at using [CygnusWebStorage] in `cygnus` instead.
  @override
  LinuxWebStorage createPlatformWebStorageStatic() {
    return LinuxWebStorage(
      LinuxWebStorageCreationParams(
        localStorage: createPlatformLocalStorageStatic(),
        sessionStorage: createPlatformSessionStorageStatic(),
      ),
    );
  }

  /// Creates a new [LinuxLocalStorage].
  ///
  /// This function should only be called by the app-facing package.
  /// Look at using [CygnusLocalStorage] in `cygnus` instead.
  @override
  LinuxLocalStorage createPlatformLocalStorage(
    CygnusPlatformLocalStorageCreationParams params,
  ) {
    return LinuxLocalStorage(params);
  }

  /// Creates a new empty [LinuxLocalStorage] to access static methods.
  ///
  /// This function should only be called by the app-facing package.
  /// Look at using [CygnusLocalStorage] in `cygnus` instead.
  @override
  LinuxLocalStorage createPlatformLocalStorageStatic() {
    return LinuxLocalStorage.defaultStorage(controller: null);
  }

  /// Creates a new [LinuxSessionStorage].
  ///
  /// This function should only be called by the app-facing package.
  /// Look at using [CygnusSessionStorage] in `cygnus` instead.
  @override
  LinuxSessionStorage createPlatformSessionStorage(
    CygnusPlatformSessionStorageCreationParams params,
  ) {
    return LinuxSessionStorage(params);
  }

  /// Creates a new empty [LinuxSessionStorage] to access static methods.
  ///
  /// This function should only be called by the app-facing package.
  /// Look at using [CygnusSessionStorage] in `cygnus` instead.
  @override
  LinuxSessionStorage createPlatformSessionStorageStatic() {
    return LinuxSessionStorage.defaultStorage(controller: null);
  }

  /// Creates a new empty [CygnusPlatformWebStorageManager] to access static methods.
  @override
  CygnusPlatformWebStorageManager createPlatformWebStorageManagerStatic() {
    return LinuxWebStorageManager.static();
  }

  /// Creates a new [LinuxWebStorageManager].
  @override
  LinuxWebStorageManager createPlatformWebStorageManager(
    CygnusPlatformWebStorageManagerCreationParams params,
  ) {
    return LinuxWebStorageManager(params);
  }

  /// Creates a new empty [CygnusPlatformAssetsPathHandler] to access static methods.
  @override
  CygnusPlatformAssetsPathHandler createPlatformAssetsPathHandlerStatic() {
    return _PlatformAssetsPathHandler.static();
  }

  /// Creates a new empty [CygnusPlatformResourcesPathHandler] to access static methods.
  @override
  CygnusPlatformResourcesPathHandler createPlatformResourcesPathHandlerStatic() {
    return _PlatformResourcesPathHandler.static();
  }

  /// Creates a new empty [CygnusPlatformInternalStoragePathHandler] to access static methods.
  @override
  CygnusPlatformInternalStoragePathHandler
  createPlatformInternalStoragePathHandlerStatic() {
    return _PlatformInternalStoragePathHandler.static();
  }

  /// Creates a new empty [CygnusPlatformCustomPathHandler] to access static methods.
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

// Stub implementations for unsupported classes

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
