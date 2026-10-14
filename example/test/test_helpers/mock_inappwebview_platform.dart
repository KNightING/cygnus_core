import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:cygnus_core/src/platform_interface/flutter_inappwebview_platform_interface.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

/// A mock CygnusWebViewPlatform for testing purposes.
/// This allows widget tests to run without requiring a real platform implementation.
class MockInAppWebViewPlatform extends CygnusWebViewPlatform
    with MockPlatformInterfaceMixin {
  static final MockInAppWebViewPlatform _instance =
      MockInAppWebViewPlatform._();

  MockInAppWebViewPlatform._();

  /// Initialize the mock platform for testing.
  /// Call this in setUp() or at the start of your tests.
  static void initialize() {
    CygnusWebViewPlatform.instance = _instance;
  }

  /// Reset the platform instance.
  /// Call this in tearDown() to clean up after tests.
  static void reset() {
    // Note: We can't actually set instance to null, but we can leave it as the mock
    // for subsequent tests. The mock is stateless so this is fine.
  }

  @override
  CygnusPlatformWebViewController createPlatformInAppWebViewControllerStatic() {
    return MockPlatformInAppWebViewControllerStatic(
      const CygnusPlatformWebViewControllerCreationParams(id: 'mock_controller'),
    );
  }

  @override
  CygnusPlatformCookieManager createPlatformCookieManagerStatic() {
    return MockPlatformCookieManagerStatic(
      CygnusPlatformCookieManagerCreationParams(),
    );
  }

  @override
  CygnusPlatformCookieManager createPlatformCookieManager(
    CygnusPlatformCookieManagerCreationParams params,
  ) {
    return MockPlatformCookieManager(params);
  }

  @override
  CygnusPlatformWebViewWidget createPlatformInAppWebViewWidget(
    CygnusPlatformWebViewWidgetCreationParams params,
  ) {
    return MockPlatformInAppWebViewWidget(params);
  }

  @override
  CygnusPlatformWebViewWidget createPlatformInAppWebViewWidgetStatic() {
    return MockPlatformInAppWebViewWidget(
      CygnusPlatformWebViewWidgetCreationParams(),
    );
  }

  @override
  CygnusPlatformWebViewController createPlatformInAppWebViewController(
    CygnusPlatformWebViewControllerCreationParams params,
  ) {
    return MockPlatformInAppWebViewController(params);
  }

  @override
  CygnusPlatformServiceWorkerController createPlatformServiceWorkerController(
    CygnusPlatformServiceWorkerControllerCreationParams params,
  ) {
    return MockPlatformServiceWorkerController(params);
  }

  @override
  CygnusPlatformServiceWorkerController
  createPlatformServiceWorkerControllerStatic() {
    return MockPlatformServiceWorkerController(
      const CygnusPlatformServiceWorkerControllerCreationParams(),
    );
  }

  @override
  CygnusPlatformProxyController createPlatformProxyController(
    CygnusPlatformProxyControllerCreationParams params,
  ) {
    return MockPlatformProxyController(params);
  }

  @override
  CygnusPlatformProxyController createPlatformProxyControllerStatic() {
    return MockPlatformProxyController(
      const CygnusPlatformProxyControllerCreationParams(),
    );
  }

  @override
  CygnusPlatformTracingController createPlatformTracingController(
    CygnusPlatformTracingControllerCreationParams params,
  ) {
    return MockPlatformTracingController(params);
  }

  @override
  CygnusPlatformTracingController createPlatformTracingControllerStatic() {
    return MockPlatformTracingController(
      const CygnusPlatformTracingControllerCreationParams(),
    );
  }

  @override
  CygnusPlatformWebViewEnvironment createPlatformWebViewEnvironment(
    CygnusPlatformWebViewEnvironmentCreationParams params,
  ) {
    return MockPlatformWebViewEnvironment(params);
  }

  @override
  CygnusPlatformWebViewEnvironment createPlatformWebViewEnvironmentStatic() {
    return MockPlatformWebViewEnvironment(
      const CygnusPlatformWebViewEnvironmentCreationParams(),
    );
  }

  @override
  CygnusPlatformProcessGlobalConfig createPlatformProcessGlobalConfig(
    CygnusPlatformProcessGlobalConfigCreationParams params,
  ) {
    return MockPlatformProcessGlobalConfig(params);
  }

  @override
  CygnusPlatformProcessGlobalConfig createPlatformProcessGlobalConfigStatic() {
    return MockPlatformProcessGlobalConfig(
      const CygnusPlatformProcessGlobalConfigCreationParams(),
    );
  }

  @override
  CygnusPlatformFindInteractionController createPlatformFindInteractionController(
    CygnusPlatformFindInteractionControllerCreationParams params,
  ) {
    return MockPlatformFindInteractionController(params);
  }

  @override
  CygnusPlatformFindInteractionController
  createPlatformFindInteractionControllerStatic() {
    return MockPlatformFindInteractionController(
      const CygnusPlatformFindInteractionControllerCreationParams(),
    );
  }

  @override
  CygnusPlatformPullToRefreshController createPlatformPullToRefreshController(
    CygnusPlatformPullToRefreshControllerCreationParams params,
  ) {
    return MockPlatformPullToRefreshController(params);
  }

  @override
  CygnusPlatformPullToRefreshController
  createPlatformPullToRefreshControllerStatic() {
    return MockPlatformPullToRefreshController(
      CygnusPlatformPullToRefreshControllerCreationParams(),
    );
  }

  @override
  CygnusPlatformWebMessageChannel createPlatformWebMessageChannel(
    CygnusPlatformWebMessageChannelCreationParams params,
  ) {
    return MockPlatformWebMessageChannel(params);
  }

  @override
  CygnusPlatformWebMessageChannel createPlatformWebMessageChannelStatic() {
    final port1 = MockPlatformWebMessagePort(
      const CygnusPlatformWebMessagePortCreationParams(index: 0),
    );
    final port2 = MockPlatformWebMessagePort(
      const CygnusPlatformWebMessagePortCreationParams(index: 1),
    );
    return MockPlatformWebMessageChannel(
      CygnusPlatformWebMessageChannelCreationParams(
        id: 'mock_channel',
        port1: port1,
        port2: port2,
      ),
    );
  }

  @override
  CygnusPlatformHeadlessWebView createPlatformHeadlessInAppWebView(
    CygnusPlatformHeadlessWebViewCreationParams params,
  ) {
    return MockPlatformHeadlessInAppWebView(params);
  }

  @override
  CygnusPlatformHeadlessWebView createPlatformHeadlessInAppWebViewStatic() {
    return MockPlatformHeadlessInAppWebView(
      const CygnusPlatformHeadlessWebViewCreationParams(),
    );
  }

  @override
  CygnusPlatformBrowser createPlatformInAppBrowser(
    CygnusPlatformBrowserCreationParams params,
  ) {
    return MockPlatformInAppBrowser(params);
  }

  @override
  CygnusPlatformBrowser createPlatformInAppBrowserStatic() {
    return MockPlatformInAppBrowser(const CygnusPlatformBrowserCreationParams());
  }

  @override
  CygnusPlatformChromeSafariBrowser createPlatformChromeSafariBrowser(
    CygnusPlatformChromeSafariBrowserCreationParams params,
  ) {
    return MockPlatformChromeSafariBrowser(params);
  }

  @override
  CygnusPlatformChromeSafariBrowser createPlatformChromeSafariBrowserStatic() {
    return MockPlatformChromeSafariBrowser(
      const CygnusPlatformChromeSafariBrowserCreationParams(),
    );
  }

  @override
  CygnusPlatformPrintJobController createPlatformPrintJobController(
    CygnusPlatformPrintJobControllerCreationParams params,
  ) {
    return MockPlatformPrintJobController(params);
  }

  @override
  CygnusPlatformPrintJobController createPlatformPrintJobControllerStatic() {
    return MockPlatformPrintJobController(
      const CygnusPlatformPrintJobControllerCreationParams(id: 'mock_print_job'),
    );
  }

  @override
  CygnusPlatformWebAuthenticationSession createPlatformWebAuthenticationSession(
    CygnusPlatformWebAuthenticationSessionCreationParams params,
  ) {
    return MockPlatformWebAuthenticationSession(params);
  }

  @override
  CygnusPlatformWebAuthenticationSession
  createPlatformWebAuthenticationSessionStatic() {
    return MockPlatformWebAuthenticationSession(
      const CygnusPlatformWebAuthenticationSessionCreationParams(),
    );
  }

  @override
  CygnusPlatformHttpAuthCredentialDatabase createPlatformHttpAuthCredentialDatabase(
    CygnusPlatformHttpAuthCredentialDatabaseCreationParams params,
  ) {
    return MockPlatformHttpAuthCredentialDatabase(params);
  }

  @override
  CygnusPlatformHttpAuthCredentialDatabase
  createPlatformHttpAuthCredentialDatabaseStatic() {
    return MockPlatformHttpAuthCredentialDatabase(
      const CygnusPlatformHttpAuthCredentialDatabaseCreationParams(),
    );
  }

  @override
  CygnusPlatformWebStorage createPlatformWebStorage(
    CygnusPlatformWebStorageCreationParams params,
  ) {
    return MockPlatformWebStorage(params);
  }

  @override
  CygnusPlatformWebStorage createPlatformWebStorageStatic() {
    final localStorage = MockPlatformLocalStorage(
      CygnusPlatformLocalStorageCreationParams(
        const CygnusPlatformStorageCreationParams(
          controller: null,
          webStorageType: CygnusWebStorageType.LOCAL_STORAGE,
        ),
      ),
    );
    final sessionStorage = MockPlatformSessionStorage(
      CygnusPlatformSessionStorageCreationParams(
        const CygnusPlatformStorageCreationParams(
          controller: null,
          webStorageType: CygnusWebStorageType.SESSION_STORAGE,
        ),
      ),
    );
    return MockPlatformWebStorage(
      CygnusPlatformWebStorageCreationParams(
        localStorage: localStorage,
        sessionStorage: sessionStorage,
      ),
    );
  }

  @override
  CygnusPlatformLocalStorage createPlatformLocalStorage(
    CygnusPlatformLocalStorageCreationParams params,
  ) {
    return MockPlatformLocalStorage(params);
  }

  @override
  CygnusPlatformLocalStorage createPlatformLocalStorageStatic() {
    return MockPlatformLocalStorage(
      CygnusPlatformLocalStorageCreationParams(
        const CygnusPlatformStorageCreationParams(
          controller: null,
          webStorageType: CygnusWebStorageType.LOCAL_STORAGE,
        ),
      ),
    );
  }

  @override
  CygnusPlatformSessionStorage createPlatformSessionStorage(
    CygnusPlatformSessionStorageCreationParams params,
  ) {
    return MockPlatformSessionStorage(params);
  }

  @override
  CygnusPlatformSessionStorage createPlatformSessionStorageStatic() {
    return MockPlatformSessionStorage(
      CygnusPlatformSessionStorageCreationParams(
        const CygnusPlatformStorageCreationParams(
          controller: null,
          webStorageType: CygnusWebStorageType.SESSION_STORAGE,
        ),
      ),
    );
  }
}

/// Mock static controller for testing
class MockPlatformInAppWebViewControllerStatic
    extends CygnusPlatformWebViewController
    with MockPlatformInterfaceMixin {
  MockPlatformInAppWebViewControllerStatic(super.params)
    : super.implementation();

  @override
  bool isMethodSupported(
    CygnusPlatformWebViewControllerMethod method, {
    TargetPlatform? platform,
  }) {
    // Return true for all methods in tests
    return true;
  }
}

class MockPlatformInAppWebViewController extends CygnusPlatformWebViewController
    with MockPlatformInterfaceMixin {
  MockPlatformInAppWebViewController(super.params) : super.implementation();

  @override
  bool isMethodSupported(
    CygnusPlatformWebViewControllerMethod method, {
    TargetPlatform? platform,
  }) => true;

  @override
  Future<void> loadUrl({
    required CygnusURLRequest urlRequest,
    @Deprecated('Use allowingReadAccessTo instead')
    Uri? iosAllowingReadAccessTo,
    CygnusWebUri? allowingReadAccessTo,
  }) async {}

  @override
  Future<void> reload() async {}

  @override
  Future<void> stopLoading() async {}

  @override
  Future<bool> canGoBack() async => false;

  @override
  Future<bool> canGoForward() async => false;

  @override
  Future<void> goBack() async {}

  @override
  Future<void> goForward() async {}

  @override
  Future<String?> getTitle() async => 'Mock Title';

  @override
  int? getViewId() => 1;

  @override
  Future<dynamic> evaluateJavascript({
    required String source,
    CygnusContentWorld? contentWorld,
  }) async => null;

  @override
  Future<CygnusCallAsyncJavaScriptResult?> callAsyncJavaScript({
    required String functionBody,
    Map<String, dynamic>? arguments,
    CygnusContentWorld? contentWorld,
  }) async => null;

  @override
  Future<void> addUserScript({required CygnusUserScript userScript}) async {}

  @override
  Future<bool> removeUserScript({required CygnusUserScript userScript}) async => true;

  @override
  Future<CygnusPlatformWebMessageChannel?> createWebMessageChannel() async {
    final port1 = MockPlatformWebMessagePort(
      const CygnusPlatformWebMessagePortCreationParams(index: 0),
    );
    final port2 = MockPlatformWebMessagePort(
      const CygnusPlatformWebMessagePortCreationParams(index: 1),
    );
    return MockPlatformWebMessageChannel(
      CygnusPlatformWebMessageChannelCreationParams(
        id: 'controller_channel',
        port1: port1,
        port2: port2,
      ),
    );
  }
}

class MockPlatformInAppWebViewWidget extends CygnusPlatformWebViewWidget
    with MockPlatformInterfaceMixin {
  MockPlatformInAppWebViewWidget(super.params) : super.implementation();

  @override
  T controllerFromPlatform<T>(CygnusPlatformWebViewController controller) {
    return controller as T;
  }

  @override
  void dispose() {}

  @override
  Widget build(BuildContext context) {
    return const SizedBox.shrink();
  }
}

/// Mock static cookie manager for testing
class MockPlatformCookieManagerStatic extends CygnusPlatformCookieManager
    with MockPlatformInterfaceMixin {
  MockPlatformCookieManagerStatic(super.params) : super.implementation();

  @override
  bool isMethodSupported(
    CygnusPlatformCookieManagerMethod method, {
    TargetPlatform? platform,
  }) {
    return true;
  }
}

class MockPlatformCookieManager extends CygnusPlatformCookieManager
    with MockPlatformInterfaceMixin {
  MockPlatformCookieManager(super.params) : super.implementation();

  @override
  bool isMethodSupported(
    CygnusPlatformCookieManagerMethod method, {
    TargetPlatform? platform,
  }) => true;
}

class MockPlatformServiceWorkerController
    extends CygnusPlatformServiceWorkerController
    with MockPlatformInterfaceMixin {
  MockPlatformServiceWorkerController(super.params) : super.implementation();

  @override
  bool isMethodSupported(
    CygnusPlatformServiceWorkerControllerMethod method, {
    TargetPlatform? platform,
  }) => true;

  @override
  Future<bool> getAllowContentAccess() async => true;

  @override
  Future<bool> getAllowFileAccess() async => true;

  @override
  Future<bool> getBlockNetworkLoads() async => false;

  @override
  Future<CygnusCacheMode?> getCacheMode() async => CygnusCacheMode.LOAD_DEFAULT;

  @override
  Future<void> setAllowContentAccess(bool value) async {}

  @override
  Future<void> setAllowFileAccess(bool value) async {}

  @override
  Future<void> setBlockNetworkLoads(bool value) async {}

  @override
  Future<void> setCacheMode(CygnusCacheMode? mode) async {}

  @override
  CygnusServiceWorkerClient? get serviceWorkerClient => null;
}

class MockPlatformProxyController extends CygnusPlatformProxyController
    with MockPlatformInterfaceMixin {
  MockPlatformProxyController(super.params) : super.implementation();

  @override
  bool isMethodSupported(
    CygnusPlatformProxyControllerMethod method, {
    TargetPlatform? platform,
  }) => true;

  @override
  Future<void> setProxyOverride({required CygnusProxySettings settings}) async {}

  @override
  Future<void> clearProxyOverride() async {}
}

class MockPlatformTracingController extends CygnusPlatformTracingController
    with MockPlatformInterfaceMixin {
  MockPlatformTracingController(super.params) : super.implementation();

  @override
  bool isMethodSupported(
    CygnusPlatformTracingControllerMethod method, {
    TargetPlatform? platform,
  }) => true;

  @override
  Future<void> start({required CygnusTracingSettings settings}) async {}

  @override
  Future<bool> stop({String? filePath}) async => true;
}

class MockPlatformWebViewEnvironment extends CygnusPlatformWebViewEnvironment
    with MockPlatformInterfaceMixin {
  MockPlatformWebViewEnvironment(super.params) : super.implementation();

  @override
  bool isMethodSupported(
    CygnusPlatformWebViewEnvironmentMethod method, {
    TargetPlatform? platform,
  }) => true;

  @override
  Future<String?> getAvailableVersion({
    String? browserExecutableFolder,
  }) async => null;

  @override
  Future<List<CygnusBrowserProcessInfo>> getBrowserProcessInfo() async => [];
}

class MockPlatformProcessGlobalConfig extends CygnusPlatformProcessGlobalConfig
    with MockPlatformInterfaceMixin {
  MockPlatformProcessGlobalConfig(super.params) : super.implementation();

  @override
  bool isMethodSupported(
    CygnusPlatformProcessGlobalConfigMethod method, {
    TargetPlatform? platform,
  }) => true;

  @override
  Future<void> setDataDirectorySuffix({required String suffix}) async {}
}

class MockPlatformFindInteractionController
    extends CygnusPlatformFindInteractionController
    with MockPlatformInterfaceMixin {
  MockPlatformFindInteractionController(super.params) : super.implementation();

  @override
  bool isMethodSupported(
    CygnusPlatformFindInteractionControllerMethod method, {
    TargetPlatform? platform,
  }) => true;

  @override
  Future<void> findAll({String? find}) async {}

  @override
  Future<void> findNext({bool forward = true}) async {}

  @override
  Future<void> clearMatches() async {}

  @override
  Future<void> setSearchText(String? searchText) async {}

  @override
  Future<String?> getSearchText() async => '';

  @override
  Future<void> presentFindNavigator() async {}

  @override
  Future<void> dismissFindNavigator() async {}

  @override
  Future<bool?> isFindNavigatorVisible() async => false;

  @override
  Future<CygnusFindSession?> getActiveFindSession() async => null;

  @override
  void dispose({bool isKeepAlive = false}) {}
}

class MockPlatformPullToRefreshController
    extends CygnusPlatformPullToRefreshController
    with MockPlatformInterfaceMixin {
  bool _enabled = true;

  MockPlatformPullToRefreshController(super.params) : super.implementation();

  @override
  bool isMethodSupported(
    CygnusPlatformPullToRefreshControllerMethod method, {
    TargetPlatform? platform,
  }) => true;

  @override
  Future<void> setEnabled(bool enabled) async {
    _enabled = enabled;
  }

  @override
  Future<bool> isEnabled() async => _enabled;

  @override
  Future<void> beginRefreshing() async {}

  @override
  Future<void> endRefreshing() async {}

  @override
  Future<bool> isRefreshing() async => false;

  @override
  Future<void> setColor(Color color) async {}

  @override
  Future<void> setBackgroundColor(Color color) async {}

  @override
  Future<int> getDefaultSlingshotDistance() async => 0;

  @override
  void dispose({bool isKeepAlive = false}) {}
}

class MockPlatformWebMessageChannel extends CygnusPlatformWebMessageChannel
    with MockPlatformInterfaceMixin {
  MockPlatformWebMessageChannel(super.params) : super.implementation();

  @override
  CygnusPlatformWebMessagePort get port1 => params.port1;

  @override
  CygnusPlatformWebMessagePort get port2 => params.port2;

  @override
  Future<void> dispose() async {}
}

class MockPlatformWebMessagePort extends CygnusPlatformWebMessagePort
    with MockPlatformInterfaceMixin {
  MockPlatformWebMessagePort(super.params) : super.implementation();

  @override
  Future<void> setWebMessageCallback(CygnusWebMessageCallback? onMessage) async {}

  @override
  Future<void> postMessage(CygnusWebMessage message) async {}

  @override
  Future<void> close() async {}

  @override
  Map<String, dynamic> toMap({CygnusEnumMethod? enumMethod}) => {};

  @override
  Map<String, dynamic> toJson() => toMap();
}

class MockPlatformHeadlessInAppWebView extends CygnusPlatformHeadlessWebView
    with MockPlatformInterfaceMixin {
  MockPlatformHeadlessInAppWebView(super.params) : super.implementation();

  @override
  String get id => 'mock_headless';

  @override
  CygnusPlatformWebViewController? get webViewController =>
      MockPlatformInAppWebViewController(
        const CygnusPlatformWebViewControllerCreationParams(
          id: 'mock_headless_controller',
        ),
      );

  @override
  Future<void> run() async {}

  @override
  bool isRunning() => false;

  @override
  Future<void> setSize(Size size) async {}

  @override
  Future<Size?> getSize() async => null;

  @override
  Future<void> dispose() async {}
}

class MockPlatformInAppBrowser extends CygnusPlatformBrowser
    with MockPlatformInterfaceMixin {
  MockPlatformInAppBrowser(super.params) : super.implementation();

  @override
  String get id => 'mock_inapp_browser';

  @override
  CygnusPlatformWebViewController? get webViewController =>
      MockPlatformInAppWebViewController(
        const CygnusPlatformWebViewControllerCreationParams(
          id: 'mock_inapp_browser_controller',
        ),
      );

  @override
  Future<void> openUrlRequest({
    required CygnusURLRequest urlRequest,
    @Deprecated('Use settings instead') CygnusBrowserClassOptions? options,
    CygnusBrowserClassSettings? settings,
  }) async {}

  @override
  Future<void> openFile({
    required String assetFilePath,
    @Deprecated('Use settings instead') CygnusBrowserClassOptions? options,
    CygnusBrowserClassSettings? settings,
  }) async {}

  @override
  Future<void> openData({
    required String data,
    String mimeType = 'text/html',
    String encoding = 'utf8',
    CygnusWebUri? baseUrl,
    @Deprecated('Use historyUrl instead') Uri? androidHistoryUrl,
    CygnusWebUri? historyUrl,
    @Deprecated('Use settings instead') CygnusBrowserClassOptions? options,
    CygnusBrowserClassSettings? settings,
  }) async {}

  @override
  Future<void> show() async {}

  @override
  Future<void> hide() async {}

  @override
  Future<void> close() async {}

  @override
  Future<bool> isHidden() async => false;

  @override
  Future<void> setSettings({
    required CygnusBrowserClassSettings settings,
  }) async {}

  @override
  Future<CygnusBrowserClassSettings?> getSettings() async =>
      CygnusBrowserClassSettings();

  @override
  bool isOpened() => true;

  @override
  void dispose() {
    super.dispose();
  }
}

class MockPlatformChromeSafariBrowser extends CygnusPlatformChromeSafariBrowser
    with MockPlatformInterfaceMixin {
  MockPlatformChromeSafariBrowser(super.params) : super.implementation();

  @override
  String get id => 'mock_chrome_safari_browser';

  @override
  Future<void> open({
    CygnusWebUri? url,
    Map<String, String>? headers,
    List<CygnusWebUri>? otherLikelyURLs,
    CygnusWebUri? referrer,
    @Deprecated('Use settings instead')
    CygnusChromeSafariBrowserClassOptions? options,
    CygnusChromeSafariBrowserSettings? settings,
  }) async {}

  @override
  Future<void> launchUrl({
    required CygnusWebUri url,
    Map<String, String>? headers,
    List<CygnusWebUri>? otherLikelyURLs,
    CygnusWebUri? referrer,
  }) async {}

  @override
  Future<bool> mayLaunchUrl({
    CygnusWebUri? url,
    List<CygnusWebUri>? otherLikelyURLs,
  }) async => true;

  @override
  Future<bool> validateRelationship({
    required CygnusCustomTabsRelationType relation,
    required CygnusWebUri origin,
  }) async => true;

  @override
  Future<void> close() async {}

  @override
  void dispose() {
    eventHandler = null;
  }
}

class MockPlatformPrintJobController extends CygnusPlatformPrintJobController
    with MockPlatformInterfaceMixin {
  MockPlatformPrintJobController(super.params) : super.implementation();

  @override
  Future<void> cancel() async {}

  @override
  Future<void> restart() async {}

  @override
  Future<void> dismiss({bool animated = true}) async {}

  @override
  Future<CygnusPrintJobInfo?> getInfo() async => null;

  @override
  void dispose() {}
}

class MockPlatformWebAuthenticationSession
    extends CygnusPlatformWebAuthenticationSession
    with MockPlatformInterfaceMixin {
  MockPlatformWebAuthenticationSession(super.params) : super.implementation();

  @override
  bool isMethodSupported(
    CygnusPlatformWebAuthenticationSessionMethod method, {
    TargetPlatform? platform,
  }) => true;
}

class MockPlatformHttpAuthCredentialDatabase
    extends CygnusPlatformHttpAuthCredentialDatabase
    with MockPlatformInterfaceMixin {
  MockPlatformHttpAuthCredentialDatabase(super.params) : super.implementation();

  @override
  bool isMethodSupported(
    CygnusPlatformHttpAuthCredentialDatabaseMethod method, {
    TargetPlatform? platform,
  }) => true;
}

class MockPlatformWebStorage extends CygnusPlatformWebStorage
    with MockPlatformInterfaceMixin {
  MockPlatformWebStorage(super.params) : super.implementation();

  @override
  CygnusPlatformLocalStorage get localStorage => params.localStorage;

  @override
  CygnusPlatformSessionStorage get sessionStorage => params.sessionStorage;
}

class MockPlatformLocalStorage extends CygnusPlatformLocalStorage
    with MockPlatformInterfaceMixin {
  MockPlatformLocalStorage(super.params) : super.implementation();

  @override
  CygnusPlatformWebViewController? get controller => params.controller;

  @override
  bool isMethodSupported(
    CygnusPlatformLocalStorageMethod method, {
    TargetPlatform? platform,
  }) => true;
}

class MockPlatformSessionStorage extends CygnusPlatformSessionStorage
    with MockPlatformInterfaceMixin {
  MockPlatformSessionStorage(super.params) : super.implementation();

  @override
  CygnusPlatformWebViewController? get controller => params.controller;

  @override
  bool isMethodSupported(
    CygnusPlatformSessionStorageMethod method, {
    TargetPlatform? platform,
  }) => true;
}
