import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:cygnus_core/cygnus_core.dart';

/// Represents a platform for API support checking.
enum SupportedPlatform {
  android,
  ios,
  macos,
  web,
  windows,
  linux;

  String get displayName {
    switch (this) {
      case SupportedPlatform.android:
        return 'Android';
      case SupportedPlatform.ios:
        return 'iOS';
      case SupportedPlatform.macos:
        return 'macOS';
      case SupportedPlatform.web:
        return 'Web';
      case SupportedPlatform.windows:
        return 'Windows';
      case SupportedPlatform.linux:
        return 'Linux';
    }
  }

  IconData get icon {
    switch (this) {
      case SupportedPlatform.android:
        return Icons.android;
      case SupportedPlatform.ios:
        return Icons.phone_iphone;
      case SupportedPlatform.macos:
        return Icons.laptop_mac;
      case SupportedPlatform.web:
        return Icons.language;
      case SupportedPlatform.windows:
        return Icons.desktop_windows;
      case SupportedPlatform.linux:
        return Icons.computer;
    }
  }

  Color get color {
    switch (this) {
      case SupportedPlatform.android:
        return Colors.green.shade600;
      case SupportedPlatform.ios:
        return Colors.grey.shade700;
      case SupportedPlatform.macos:
        return Colors.blueGrey.shade600;
      case SupportedPlatform.web:
        return Colors.blue.shade600;
      case SupportedPlatform.windows:
        return Colors.lightBlue.shade600;
      case SupportedPlatform.linux:
        return Colors.orange.shade700;
    }
  }

  TargetPlatform? get targetPlatform {
    switch (this) {
      case SupportedPlatform.android:
        return TargetPlatform.android;
      case SupportedPlatform.ios:
        return TargetPlatform.iOS;
      case SupportedPlatform.macos:
        return TargetPlatform.macOS;
      case SupportedPlatform.windows:
        return TargetPlatform.windows;
      case SupportedPlatform.linux:
        return TargetPlatform.linux;
      case SupportedPlatform.web:
        return null; // Web doesn't have a TargetPlatform
    }
  }
}

/// Helper utilities for support checks across platforms.
class SupportCheckHelper {
  /// Maps [SupportedPlatform] to a [TargetPlatform] when possible.
  static TargetPlatform? targetPlatformFor(SupportedPlatform platform) {
    return platform.targetPlatform;
  }

  /// Checks class support for a specific [SupportedPlatform].
  static bool isClassSupportedForPlatform({
    required SupportedPlatform platform,
    required bool Function({TargetPlatform? platform}) checker,
  }) {
    if (platform == SupportedPlatform.web) {
      return checker(platform: null);
    }
    return checker(platform: targetPlatformFor(platform));
  }

  /// Checks method support for a specific [SupportedPlatform].
  static bool isMethodSupportedForPlatform<T>({
    required SupportedPlatform platform,
    required T method,
    required bool Function(T method, {TargetPlatform? platform}) checker,
  }) {
    if (platform == SupportedPlatform.web) {
      return checker(method, platform: null);
    }
    return checker(method, platform: targetPlatformFor(platform));
  }

  /// Checks property support for a specific [SupportedPlatform].
  static bool isPropertySupportedForPlatform({
    required SupportedPlatform platform,
    required dynamic property,
    required bool Function(dynamic property, {TargetPlatform? platform})
    checker,
  }) {
    if (platform == SupportedPlatform.web) {
      return checker(property, platform: null);
    }
    return checker(property, platform: targetPlatformFor(platform));
  }

  /// Returns all supported platforms for a given class checker.
  static Set<SupportedPlatform> supportedPlatformsForClass({
    required bool Function({TargetPlatform? platform}) checker,
  }) {
    return SupportedPlatform.values
        .where(
          (platform) =>
              isClassSupportedForPlatform(platform: platform, checker: checker),
        )
        .toSet();
  }

  /// Returns all supported platforms for a given method checker.
  static Set<SupportedPlatform> supportedPlatformsForMethod<T>({
    required T method,
    required bool Function(T method, {TargetPlatform? platform}) checker,
  }) {
    return SupportedPlatform.values
        .where(
          (platform) => isMethodSupportedForPlatform(
            platform: platform,
            method: method,
            checker: checker,
          ),
        )
        .toSet();
  }

  /// Returns all supported platforms for a given property checker.
  static Set<SupportedPlatform> supportedPlatformsForProperty({
    required dynamic property,
    required bool Function(dynamic property, {TargetPlatform? platform})
    checker,
  }) {
    return SupportedPlatform.values
        .where(
          (platform) => isPropertySupportedForPlatform(
            platform: platform,
            property: property,
            checker: checker,
          ),
        )
        .toSet();
  }
}

/// Definition of an API method with platform support information.
class ApiMethodDefinition {
  final String name;
  final String signature;
  final String description;
  final String className;
  final bool isStatic;
  final bool isDeprecated;
  final String? category;

  const ApiMethodDefinition({
    required this.name,
    this.signature = '',
    this.description = '',
    required this.className,
    this.isStatic = false,
    this.isDeprecated = false,
    this.category,
  });

  /// Returns the supported platforms for this method using runtime checks.
  Set<SupportedPlatform> get supportedPlatforms =>
      SupportChecker.getSupportedPlatformsForMethod(className, name);

  bool isSupported(SupportedPlatform platform) =>
      supportedPlatforms.contains(platform);
}

/// Definition of an API event with platform support information.
class ApiEventDefinition {
  final String name;
  final String signature;
  final String description;
  final String className;
  final String? category;

  const ApiEventDefinition({
    required this.name,
    this.signature = '',
    this.description = '',
    required this.className,
    this.category,
  });

  /// Returns the supported platforms for this event using runtime checks.
  Set<SupportedPlatform> get supportedPlatforms =>
      SupportChecker.getSupportedPlatformsForEvent(className, name);

  bool isSupported(SupportedPlatform platform) =>
      supportedPlatforms.contains(platform);
}

/// Definition of an API class with its methods and events.
class ApiClassDefinition {
  final String className;
  final String description;
  final List<ApiMethodDefinition> methods;
  final List<ApiEventDefinition> events;
  final bool Function()? isClassSupported;

  const ApiClassDefinition({
    required this.className,
    this.description = '',
    this.methods = const [],
    this.events = const [],
    this.isClassSupported,
  });

  int get totalApis => methods.length + events.length;

  int methodCountForPlatform(SupportedPlatform platform) =>
      methods.where((m) => m.isSupported(platform)).length;

  int eventCountForPlatform(SupportedPlatform platform) =>
      events.where((e) => e.isSupported(platform)).length;
}

/// Summary of API support statistics.
class SupportSummary {
  final int totalMethods;
  final int totalEvents;
  final Map<SupportedPlatform, int> methodsPerPlatform;
  final Map<SupportedPlatform, int> eventsPerPlatform;

  const SupportSummary({
    required this.totalMethods,
    required this.totalEvents,
    required this.methodsPerPlatform,
    required this.eventsPerPlatform,
  });

  int get totalApis => totalMethods + totalEvents;

  int totalApisForPlatform(SupportedPlatform platform) =>
      (methodsPerPlatform[platform] ?? 0) + (eventsPerPlatform[platform] ?? 0);
}

typedef _MethodSupportResolver =
    bool Function(String methodName, SupportedPlatform platform);

typedef _PropertySupportResolver =
    bool Function(String propertyName, SupportedPlatform platform);

/// Utility class that provides comprehensive API support information.
class SupportChecker {
  // All supported platforms
  static const allPlatforms = {
    SupportedPlatform.android,
    SupportedPlatform.ios,
    SupportedPlatform.macos,
    SupportedPlatform.web,
    SupportedPlatform.windows,
    SupportedPlatform.linux,
  };

  // Mobile platforms
  static const mobilePlatforms = {
    SupportedPlatform.android,
    SupportedPlatform.ios,
  };

  // Native platforms (non-web)
  static const nativePlatforms = {
    SupportedPlatform.android,
    SupportedPlatform.ios,
    SupportedPlatform.macos,
    SupportedPlatform.windows,
    SupportedPlatform.linux,
  };

  // Desktop platforms
  static const desktopPlatforms = {
    SupportedPlatform.macos,
    SupportedPlatform.windows,
    SupportedPlatform.linux,
  };

  // Apple platforms
  static const applePlatforms = {
    SupportedPlatform.ios,
    SupportedPlatform.macos,
  };

  static String _enumName(Object? value) {
    if (value is Enum) return value.name;
    return value.toString().split('.').last;
  }

  static String classNameOf(Type type) => type.toString();

  static String eventClassNameOf(Type type) => '${classNameOf(type)} Events';

  static Set<String> get registeredClassNames => {
    ..._classSupportResolvers.keys,
    ..._methodSupportResolvers.keys,
    ..._eventSupportResolvers.keys,
  };

  static _MethodSupportResolver _buildMethodResolver<T>({
    required List<T> values,
    required bool Function(T method, {TargetPlatform? platform}) checker,
  }) {
    final methodByName = {for (final value in values) _enumName(value): value};
    return (String methodName, SupportedPlatform platform) {
      final resolved = methodByName[methodName];
      if (resolved == null) return false;
      return SupportCheckHelper.isMethodSupportedForPlatform(
        platform: platform,
        method: resolved,
        checker: checker,
      );
    };
  }

  static _PropertySupportResolver _buildPropertyResolver<T>({
    required List<T> values,
    required bool Function(dynamic property, {TargetPlatform? platform})
    checker,
    Map<String, String> nameOverrides = const {},
  }) {
    final propertyByName = {
      for (final value in values) _enumName(value): value,
    };
    return (String propertyName, SupportedPlatform platform) {
      final resolvedName = nameOverrides[propertyName] ?? propertyName;
      final resolved = propertyByName[resolvedName];
      if (resolved == null) return false;
      return SupportCheckHelper.isPropertySupportedForPlatform(
        platform: platform,
        property: resolved,
        checker: checker,
      );
    };
  }

  static final Map<String, bool Function({TargetPlatform? platform})>
  _classSupportResolvers = {
    classNameOf(CygnusWebViewController):
        CygnusWebViewController.isClassSupported,
    eventClassNameOf(CygnusWebView): CygnusWebView.isClassSupported,
    classNameOf(CygnusHeadlessWebView): CygnusHeadlessWebView.isClassSupported,
    classNameOf(CygnusBrowser): CygnusBrowser.isClassSupported,
    classNameOf(CygnusChromeSafariBrowser): CygnusChromeSafariBrowser.isClassSupported,
    classNameOf(CygnusCookieManager): CygnusCookieManager.isClassSupported,
    classNameOf(CygnusWebStorage): CygnusWebStorage.isClassSupported,
    classNameOf(CygnusFindInteractionController):
        CygnusFindInteractionController.isClassSupported,
    classNameOf(CygnusPullToRefreshController):
        CygnusPullToRefreshController.isClassSupported,
    classNameOf(CygnusPrintJobController): CygnusPrintJobController.isClassSupported,
    classNameOf(CygnusWebAuthenticationSession):
        CygnusWebAuthenticationSession.isClassSupported,
    classNameOf(CygnusServiceWorkerController):
        CygnusServiceWorkerController.isClassSupported,
    classNameOf(CygnusProxyController): CygnusProxyController.isClassSupported,
    classNameOf(CygnusTracingController): CygnusTracingController.isClassSupported,
    classNameOf(CygnusHttpAuthCredentialDatabase):
        CygnusHttpAuthCredentialDatabase.isClassSupported,
    classNameOf(CygnusWebViewEnvironment): CygnusWebViewEnvironment.isClassSupported,
    classNameOf(CygnusProcessGlobalConfig): CygnusProcessGlobalConfig.isClassSupported,
    classNameOf(CygnusWebMessageChannel): CygnusWebMessageChannel.isClassSupported,
  };

  static final Map<String, _MethodSupportResolver> _methodSupportResolvers = {
    classNameOf(CygnusWebViewController): _buildMethodResolver(
      values: CygnusPlatformWebViewControllerMethod.values,
      checker: CygnusWebViewController.isMethodSupported,
    ),
    classNameOf(CygnusHeadlessWebView): _buildMethodResolver(
      values: CygnusPlatformHeadlessWebViewMethod.values,
      checker: CygnusHeadlessWebView.isMethodSupported,
    ),
    classNameOf(CygnusBrowser): _buildMethodResolver(
      values: CygnusPlatformBrowserMethod.values,
      checker: CygnusBrowser.isMethodSupported,
    ),
    classNameOf(CygnusChromeSafariBrowser): _buildMethodResolver(
      values: CygnusPlatformChromeSafariBrowserMethod.values,
      checker: CygnusChromeSafariBrowser.isMethodSupported,
    ),
    classNameOf(CygnusCookieManager): _buildMethodResolver(
      values: CygnusPlatformCookieManagerMethod.values,
      checker: CygnusCookieManager.isMethodSupported,
    ),
    classNameOf(CygnusWebStorage): _buildMethodResolver(
      values: CygnusPlatformLocalStorageMethod.values,
      checker: CygnusLocalStorage.isMethodSupported,
    ),
    classNameOf(CygnusFindInteractionController): _buildMethodResolver(
      values: CygnusPlatformFindInteractionControllerMethod.values,
      checker: CygnusFindInteractionController.isMethodSupported,
    ),
    classNameOf(CygnusPullToRefreshController): _buildMethodResolver(
      values: CygnusPlatformPullToRefreshControllerMethod.values,
      checker: CygnusPullToRefreshController.isMethodSupported,
    ),
    classNameOf(CygnusPrintJobController): _buildMethodResolver(
      values: CygnusPlatformPrintJobControllerMethod.values,
      checker: CygnusPrintJobController.isMethodSupported,
    ),
    classNameOf(CygnusWebAuthenticationSession): _buildMethodResolver(
      values: CygnusPlatformWebAuthenticationSessionMethod.values,
      checker: CygnusWebAuthenticationSession.isMethodSupported,
    ),
    classNameOf(CygnusServiceWorkerController): _buildMethodResolver(
      values: CygnusPlatformServiceWorkerControllerMethod.values,
      checker: CygnusServiceWorkerController.isMethodSupported,
    ),
    classNameOf(CygnusProxyController): _buildMethodResolver(
      values: CygnusPlatformProxyControllerMethod.values,
      checker: CygnusProxyController.isMethodSupported,
    ),
    classNameOf(CygnusTracingController): _buildMethodResolver(
      values: CygnusPlatformTracingControllerMethod.values,
      checker: CygnusTracingController.isMethodSupported,
    ),
    classNameOf(CygnusHttpAuthCredentialDatabase): _buildMethodResolver(
      values: CygnusPlatformHttpAuthCredentialDatabaseMethod.values,
      checker: CygnusHttpAuthCredentialDatabase.isMethodSupported,
    ),
    classNameOf(CygnusWebViewEnvironment): _buildMethodResolver(
      values: CygnusPlatformWebViewEnvironmentMethod.values,
      checker: CygnusWebViewEnvironment.isMethodSupported,
    ),
    classNameOf(CygnusProcessGlobalConfig): _buildMethodResolver(
      values: CygnusPlatformProcessGlobalConfigMethod.values,
      checker: CygnusProcessGlobalConfig.isMethodSupported,
    ),
    classNameOf(CygnusWebMessageChannel): _buildMethodResolver(
      values: CygnusPlatformWebMessageChannelMethod.values,
      checker: CygnusWebMessageChannel.isMethodSupported,
    ),
  };

  static final Map<String, _PropertySupportResolver> _eventSupportResolvers = {
    eventClassNameOf(CygnusWebView): _buildPropertyResolver(
      values: CygnusPlatformWebViewCreationParamsProperty.values,
      checker: CygnusWebView.isPropertySupported,
    ),
    classNameOf(CygnusFindInteractionController): _buildPropertyResolver(
      values: CygnusPlatformFindInteractionControllerCreationParamsProperty.values,
      checker: (property, {platform}) =>
          CygnusFindInteractionController.isPropertySupported(
            property as CygnusPlatformFindInteractionControllerCreationParamsProperty,
            platform: platform,
          ),
    ),
  };

  /// Get all API definitions organized by class.
  static List<ApiClassDefinition> getAllApiDefinitions() {
    return [
      _getWebViewControllerDefinition(),
      _getWebViewEventsDefinition(),
      _getHeadlessWebViewDefinition(),
      _getBrowserDefinition(),
      _getChromeSafariBrowserDefinition(),
      _getCookieManagerDefinition(),
      _getWebStorageDefinition(),
      _getFindInteractionControllerDefinition(),
      _getPullToRefreshControllerDefinition(),
      _getPrintJobControllerDefinition(),
      _getWebAuthenticationSessionDefinition(),
      _getServiceWorkerControllerDefinition(),
      _getProxyControllerDefinition(),
      _getTracingControllerDefinition(),
      _getHttpAuthCredentialDatabaseDefinition(),
      _getWebViewEnvironmentDefinition(),
      _getProcessGlobalConfigDefinition(),
      _getWebMessageChannelDefinition(),
    ];
  }

  /// Check if a specific method is supported on current platform.
  static bool isMethodSupported(String className, String methodName) {
    final currentPlatform = _getCurrentPlatform();
    if (currentPlatform == null) return false;
    return isMethodSupportedForPlatform(className, methodName, currentPlatform);
  }

  /// Check if a specific method is supported on a target platform.
  static bool isMethodSupportedForPlatform(
    String className,
    String methodName,
    SupportedPlatform platform,
  ) {
    final resolver = _methodSupportResolvers[className];
    if (resolver != null) {
      return resolver(methodName, platform);
    }

    final definitions = getAllApiDefinitions();
    final classDef = definitions.cast<ApiClassDefinition?>().firstWhere(
      (c) => c?.className == className,
      orElse: () => null,
    );
    if (classDef == null) return false;

    final method = classDef.methods.cast<ApiMethodDefinition?>().firstWhere(
      (m) => m?.name == methodName,
      orElse: () => null,
    );
    if (method == null) return false;

    return method.isSupported(platform);
  }

  /// Check if a specific event is supported on current platform.
  static bool isEventSupported(String className, String eventName) {
    final currentPlatform = _getCurrentPlatform();
    if (currentPlatform == null) return false;
    return isEventSupportedForPlatform(className, eventName, currentPlatform);
  }

  /// Check if a specific event is supported on a target platform.
  static bool isEventSupportedForPlatform(
    String className,
    String eventName,
    SupportedPlatform platform,
  ) {
    final resolver = _eventSupportResolvers[className];
    if (resolver != null) {
      return resolver(eventName, platform);
    }

    final definitions = getAllApiDefinitions();
    final classDef = definitions.cast<ApiClassDefinition?>().firstWhere(
      (c) => c?.className == className,
      orElse: () => null,
    );
    if (classDef == null) return false;

    final event = classDef.events.cast<ApiEventDefinition?>().firstWhere(
      (e) => e?.name == eventName,
      orElse: () => null,
    );
    if (event == null) return false;

    return event.isSupported(platform);
  }

  /// Returns supported platforms for a given class.
  static Set<SupportedPlatform> getSupportedPlatformsForClass(
    String className,
  ) {
    final resolver = _classSupportResolvers[className];
    if (resolver != null) {
      return SupportCheckHelper.supportedPlatformsForClass(checker: resolver);
    }

    final definitions = getAllApiDefinitions();
    final classDef = definitions.cast<ApiClassDefinition?>().firstWhere(
      (c) => c?.className == className,
      orElse: () => null,
    );
    if (classDef == null) return {};

    final supported = <SupportedPlatform>{};
    if (classDef.isClassSupported != null) {
      final currentPlatform = _getCurrentPlatform();
      if (currentPlatform != null && classDef.isClassSupported!()) {
        supported.add(currentPlatform);
      }
    }

    for (final platform in SupportedPlatform.values) {
      if (classDef.methods.any((m) => m.isSupported(platform)) ||
          classDef.events.any((e) => e.isSupported(platform))) {
        supported.add(platform);
      }
    }
    return supported;
  }

  /// Returns supported platforms for a specific method.
  static Set<SupportedPlatform> getSupportedPlatformsForMethod(
    String className,
    String methodName,
  ) {
    final resolver = _methodSupportResolvers[className];
    if (resolver != null) {
      return SupportedPlatform.values
          .where((p) => resolver(methodName, p))
          .toSet();
    }
    // No resolver registered for this class
    return <SupportedPlatform>{};
  }

  /// Returns supported platforms for a specific event.
  static Set<SupportedPlatform> getSupportedPlatformsForEvent(
    String className,
    String eventName,
  ) {
    final resolver = _eventSupportResolvers[className];
    if (resolver != null) {
      return SupportedPlatform.values
          .where((p) => resolver(eventName, p))
          .toSet();
    }
    // No resolver registered for this class
    return <SupportedPlatform>{};
  }

  /// Get support summary statistics.
  static SupportSummary getSupportSummary() {
    final definitions = getAllApiDefinitions();

    int totalMethods = 0;
    int totalEvents = 0;
    final methodsPerPlatform = <SupportedPlatform, int>{};
    final eventsPerPlatform = <SupportedPlatform, int>{};

    for (final platform in SupportedPlatform.values) {
      methodsPerPlatform[platform] = 0;
      eventsPerPlatform[platform] = 0;
    }

    for (final classDef in definitions) {
      totalMethods += classDef.methods.length;
      totalEvents += classDef.events.length;

      for (final method in classDef.methods) {
        final supported = getSupportedPlatformsForMethod(
          classDef.className,
          method.name,
        );
        for (final platform in supported) {
          methodsPerPlatform[platform] = methodsPerPlatform[platform]! + 1;
        }
      }

      for (final event in classDef.events) {
        final supported = getSupportedPlatformsForEvent(
          classDef.className,
          event.name,
        );
        for (final platform in supported) {
          eventsPerPlatform[platform] = eventsPerPlatform[platform]! + 1;
        }
      }
    }

    return SupportSummary(
      totalMethods: totalMethods,
      totalEvents: totalEvents,
      methodsPerPlatform: methodsPerPlatform,
      eventsPerPlatform: eventsPerPlatform,
    );
  }

  static SupportedPlatform? _getCurrentPlatform() {
    if (kIsWeb) return SupportedPlatform.web;
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return SupportedPlatform.android;
      case TargetPlatform.iOS:
        return SupportedPlatform.ios;
      case TargetPlatform.macOS:
        return SupportedPlatform.macos;
      case TargetPlatform.windows:
        return SupportedPlatform.windows;
      case TargetPlatform.linux:
        return SupportedPlatform.linux;
      default:
        return null;
    }
  }

  // ====================
  // API Class Definitions
  // ====================

  static ApiClassDefinition _getWebViewControllerDefinition() {
    final className = classNameOf(CygnusWebViewController);
    return ApiClassDefinition(
      className: className,
      description: 'Controls an ${CygnusWebView} instance.',
      isClassSupported: () => CygnusWebViewController.isClassSupported(),
      methods: [
        // Navigation methods
        ApiMethodDefinition(
          name: CygnusPlatformWebViewControllerMethod.loadUrl.name,
          signature: 'Future<void> loadUrl({required CygnusURLRequest urlRequest})',
          description: 'Loads the given URL with optional headers.',
          className: className,
          category: 'Navigation',
        ),
        ApiMethodDefinition(
          name: CygnusPlatformWebViewControllerMethod.postUrl.name,
          signature:
              'Future<void> postUrl({required CygnusWebUri url, required Uint8List postData})',
          description: 'Loads the URL with POST data.',
          className: className,
          category: 'Navigation',
        ),
        ApiMethodDefinition(
          name: CygnusPlatformWebViewControllerMethod.loadData.name,
          signature: 'Future<void> loadData({required String data, ...})',
          description: 'Loads HTML data directly into the WebView.',
          className: className,
          category: 'Navigation',
        ),
        ApiMethodDefinition(
          name: CygnusPlatformWebViewControllerMethod.loadFile.name,
          signature: 'Future<void> loadFile({required String assetFilePath})',
          description: 'Loads a file from the asset bundle.',
          className: className,
          category: 'Navigation',
        ),
        ApiMethodDefinition(
          name: CygnusPlatformWebViewControllerMethod.reload.name,
          signature: 'Future<void> reload()',
          description: 'Reloads the current page.',
          className: className,
          category: 'Navigation',
        ),
        ApiMethodDefinition(
          name: CygnusPlatformWebViewControllerMethod.reloadFromOrigin.name,
          signature: 'Future<void> reloadFromOrigin()',
          description:
              'Reloads the current page, performing end-to-end validation.',
          className: className,
          category: 'Navigation',
        ),
        ApiMethodDefinition(
          name: CygnusPlatformWebViewControllerMethod.goBack.name,
          signature: 'Future<void> goBack()',
          description: 'Goes back in the history of the WebView.',
          className: className,
          category: 'Navigation',
        ),
        ApiMethodDefinition(
          name: CygnusPlatformWebViewControllerMethod.goForward.name,
          signature: 'Future<void> goForward()',
          description: 'Goes forward in the history of the WebView.',
          className: className,
          category: 'Navigation',
        ),
        ApiMethodDefinition(
          name: CygnusPlatformWebViewControllerMethod.goBackOrForward.name,
          signature: 'Future<void> goBackOrForward({required int steps})',
          description: 'Goes to the history item at the given offset.',
          className: className,
          category: 'Navigation',
        ),
        ApiMethodDefinition(
          name: CygnusPlatformWebViewControllerMethod.goTo.name,
          signature: 'Future<void> goTo({required CygnusWebHistoryItem historyItem})',
          description: 'Goes to the specified history item.',
          className: className,
          category: 'Navigation',
        ),
        ApiMethodDefinition(
          name: CygnusPlatformWebViewControllerMethod.canGoBack.name,
          signature: 'Future<bool> canGoBack()',
          description: 'Returns whether the WebView can go back in history.',
          className: className,
          category: 'Navigation',
        ),
        ApiMethodDefinition(
          name: CygnusPlatformWebViewControllerMethod.canGoForward.name,
          signature: 'Future<bool> canGoForward()',
          description: 'Returns whether the WebView can go forward in history.',
          className: className,
          category: 'Navigation',
        ),
        ApiMethodDefinition(
          name: CygnusPlatformWebViewControllerMethod.canGoBackOrForward.name,
          signature: 'Future<bool> canGoBackOrForward({required int steps})',
          description:
              'Returns whether the WebView can go to the specified offset.',
          className: className,
          category: 'Navigation',
        ),
        ApiMethodDefinition(
          name: CygnusPlatformWebViewControllerMethod.isLoading.name,
          signature: 'Future<bool> isLoading()',
          description: 'Returns whether the WebView is currently loading.',
          className: className,
          category: 'Navigation',
        ),
        ApiMethodDefinition(
          name: CygnusPlatformWebViewControllerMethod.stopLoading.name,
          signature: 'Future<void> stopLoading()',
          description: 'Stops the current page load.',
          className: className,
          category: 'Navigation',
        ),
        ApiMethodDefinition(
          name: CygnusPlatformWebViewControllerMethod.loadSimulatedRequest.name,
          signature:
              'Future<void> loadSimulatedRequest({required CygnusURLRequest urlRequest, ...})',
          description:
              'Navigates to a requested URL with simulated response data.',
          className: className,
          category: 'Navigation',
        ),

        // Page Info methods
        ApiMethodDefinition(
          name: CygnusPlatformWebViewControllerMethod.getUrl.name,
          signature: 'Future<CygnusWebUri?> getUrl()',
          description: 'Gets the current URL of the WebView.',
          className: className,
          category: 'Page Info',
        ),
        ApiMethodDefinition(
          name: CygnusPlatformWebViewControllerMethod.getTitle.name,
          signature: 'Future<String?> getTitle()',
          description: 'Gets the title of the current page.',
          className: className,
          category: 'Page Info',
        ),
        ApiMethodDefinition(
          name: CygnusPlatformWebViewControllerMethod.getProgress.name,
          signature: 'Future<int?> getProgress()',
          description: 'Gets the current loading progress.',
          className: className,
          category: 'Page Info',
        ),
        ApiMethodDefinition(
          name: CygnusPlatformWebViewControllerMethod.getHtml.name,
          signature: 'Future<String?> getHtml()',
          description: 'Gets the HTML content of the current page.',
          className: className,
          category: 'Page Info',
        ),
        ApiMethodDefinition(
          name: CygnusPlatformWebViewControllerMethod.getFavicons.name,
          signature: 'Future<List<CygnusFavicon>> getFavicons()',
          description: 'Gets the favicons of the current page.',
          className: className,
          category: 'Page Info',
        ),
        ApiMethodDefinition(
          name: CygnusPlatformWebViewControllerMethod.getOriginalUrl.name,
          signature: 'Future<CygnusWebUri?> getOriginalUrl()',
          description: 'Gets the original URL before redirects.',
          className: className,
          category: 'Page Info',
        ),
        ApiMethodDefinition(
          name: CygnusPlatformWebViewControllerMethod.getSelectedText.name,
          signature: 'Future<String?> getSelectedText()',
          description: 'Gets the currently selected text.',
          className: className,
          category: 'Page Info',
        ),
        ApiMethodDefinition(
          name: CygnusPlatformWebViewControllerMethod.getHitTestResult.name,
          signature:
              'Future<${CygnusWebViewHitTestResult}?> ${CygnusPlatformWebViewControllerMethod.getHitTestResult.name}()',
          description: 'Gets a hit test result for the last tap.',
          className: className,
          category: 'Page Info',
        ),
        ApiMethodDefinition(
          name: CygnusPlatformWebViewControllerMethod.getMetaTags.name,
          signature: 'Future<List<CygnusMetaTag>> getMetaTags()',
          description: 'Gets all meta tags of the current page.',
          className: className,
          category: 'Page Info',
        ),
        ApiMethodDefinition(
          name: CygnusPlatformWebViewControllerMethod.getMetaThemeColor.name,
          signature: 'Future<Color?> getMetaThemeColor()',
          description: 'Gets the meta theme color of the page.',
          className: className,
          category: 'Page Info',
        ),
        ApiMethodDefinition(
          name: CygnusPlatformWebViewControllerMethod.getCertificate.name,
          signature: 'Future<CygnusSslCertificate?> getCertificate()',
          description: 'Gets the SSL certificate for the main resource.',
          className: className,
          category: 'Page Info',
        ),
        ApiMethodDefinition(
          name:
              CygnusPlatformWebViewControllerMethod.getCopyBackForwardList.name,
          signature: 'Future<CygnusWebHistory?> getCopyBackForwardList()',
          description: 'Gets a copy of the back/forward list.',
          className: className,
          category: 'Page Info',
        ),

        // JavaScript methods
        ApiMethodDefinition(
          name: CygnusPlatformWebViewControllerMethod.evaluateJavascript.name,
          signature:
              'Future<dynamic> evaluateJavascript({required String source, ...})',
          description: 'Evaluates JavaScript code and returns the result.',
          className: className,
          category: 'JavaScript',
        ),
        ApiMethodDefinition(
          name: CygnusPlatformWebViewControllerMethod.callAsyncJavaScript.name,
          signature:
              'Future<CygnusCallAsyncJavaScriptResult?> callAsyncJavaScript({...})',
          description: 'Calls a JavaScript function asynchronously.',
          className: className,
          category: 'JavaScript',
        ),
        ApiMethodDefinition(
          name: CygnusPlatformWebViewControllerMethod
              .injectJavascriptFileFromUrl
              .name,
          signature:
              'Future<void> injectJavascriptFileFromUrl({required CygnusWebUri urlFile, ...})',
          description: 'Injects a JavaScript file from a URL.',
          className: className,
          category: 'JavaScript',
        ),
        ApiMethodDefinition(
          name: CygnusPlatformWebViewControllerMethod
              .injectJavascriptFileFromAsset
              .name,
          signature:
              'Future<dynamic> injectJavascriptFileFromAsset({required String assetFilePath})',
          description: 'Injects a JavaScript file from assets.',
          className: className,
          category: 'JavaScript',
        ),
        ApiMethodDefinition(
          name: CygnusPlatformWebViewControllerMethod.injectCSSCode.name,
          signature: 'Future<void> injectCSSCode({required String source})',
          description: 'Injects CSS code into the page.',
          className: className,
          category: 'JavaScript',
        ),
        ApiMethodDefinition(
          name: CygnusPlatformWebViewControllerMethod.injectCSSFileFromUrl.name,
          signature:
              'Future<void> injectCSSFileFromUrl({required CygnusWebUri urlFile, ...})',
          description: 'Injects a CSS file from a URL.',
          className: className,
          category: 'JavaScript',
        ),
        ApiMethodDefinition(
          name:
              CygnusPlatformWebViewControllerMethod.injectCSSFileFromAsset.name,
          signature:
              'Future<void> injectCSSFileFromAsset({required String assetFilePath})',
          description: 'Injects a CSS file from assets.',
          className: className,
          category: 'JavaScript',
        ),

        // JavaScript Handler methods
        ApiMethodDefinition(
          name: CygnusPlatformWebViewControllerMethod.addJavaScriptHandler.name,
          signature:
              'void addJavaScriptHandler({required String handlerName, ...})',
          description: 'Adds a handler for JavaScript to call.',
          className: className,
          category: 'Handlers',
        ),
        ApiMethodDefinition(
          name:
              CygnusPlatformWebViewControllerMethod.removeJavaScriptHandler.name,
          signature:
              'CygnusJavaScriptHandlerCallback? removeJavaScriptHandler({required String handlerName})',
          description: 'Removes a JavaScript handler.',
          className: className,
          category: 'Handlers',
        ),
        ApiMethodDefinition(
          name: CygnusPlatformWebViewControllerMethod.hasJavaScriptHandler.name,
          signature: 'bool hasJavaScriptHandler({required String handlerName})',
          description: 'Checks if a JavaScript handler exists.',
          className: className,
          category: 'Handlers',
        ),

        // User Scripts methods
        ApiMethodDefinition(
          name: CygnusPlatformWebViewControllerMethod.addUserScript.name,
          signature:
              'Future<void> addUserScript({required CygnusUserScript userScript})',
          description: 'Adds a user script to the WebView.',
          className: className,
          category: 'User Scripts',
        ),
        ApiMethodDefinition(
          name: CygnusPlatformWebViewControllerMethod.removeUserScript.name,
          signature:
              'Future<bool> removeUserScript({required CygnusUserScript userScript})',
          description: 'Removes a user script.',
          className: className,
          category: 'User Scripts',
        ),
        ApiMethodDefinition(
          name: CygnusPlatformWebViewControllerMethod
              .removeUserScriptsByGroupName
              .name,
          signature:
              'Future<void> removeUserScriptsByGroupName({required String groupName})',
          description: 'Removes user scripts by group name.',
          className: className,
          category: 'User Scripts',
        ),
        ApiMethodDefinition(
          name: CygnusPlatformWebViewControllerMethod.removeAllUserScripts.name,
          signature: 'Future<void> removeAllUserScripts()',
          description: 'Removes all user scripts.',
          className: className,
          category: 'User Scripts',
        ),
        ApiMethodDefinition(
          name: CygnusPlatformWebViewControllerMethod.hasUserScript.name,
          signature: 'bool hasUserScript({required CygnusUserScript userScript})',
          description: 'Checks if a user script exists.',
          className: className,
          category: 'User Scripts',
        ),

        // Scrolling methods
        ApiMethodDefinition(
          name: CygnusPlatformWebViewControllerMethod.scrollTo.name,
          signature:
              'Future<void> scrollTo({required int x, required int y, bool animated})',
          description: 'Scrolls the WebView to the specified position.',
          className: className,
          category: 'Scrolling',
        ),
        ApiMethodDefinition(
          name: CygnusPlatformWebViewControllerMethod.scrollBy.name,
          signature:
              'Future<void> scrollBy({required int x, required int y, bool animated})',
          description: 'Scrolls the WebView by the specified amount.',
          className: className,
          category: 'Scrolling',
        ),
        ApiMethodDefinition(
          name: CygnusPlatformWebViewControllerMethod.getScrollX.name,
          signature: 'Future<int?> getScrollX()',
          description: 'Gets the current horizontal scroll position.',
          className: className,
          category: 'Scrolling',
        ),
        ApiMethodDefinition(
          name: CygnusPlatformWebViewControllerMethod.getScrollY.name,
          signature: 'Future<int?> getScrollY()',
          description: 'Gets the current vertical scroll position.',
          className: className,
          category: 'Scrolling',
        ),
        ApiMethodDefinition(
          name: CygnusPlatformWebViewControllerMethod.getContentHeight.name,
          signature: 'Future<int?> getContentHeight()',
          description: 'Gets the height of the HTML content.',
          className: className,
          category: 'Scrolling',
        ),
        ApiMethodDefinition(
          name: CygnusPlatformWebViewControllerMethod.getContentWidth.name,
          signature: 'Future<int?> getContentWidth()',
          description: 'Gets the width of the HTML content.',
          className: className,
          category: 'Scrolling',
        ),
        ApiMethodDefinition(
          name: CygnusPlatformWebViewControllerMethod.canScrollVertically.name,
          signature: 'Future<bool> canScrollVertically()',
          description: 'Checks if the WebView can scroll vertically.',
          className: className,
          category: 'Scrolling',
        ),
        ApiMethodDefinition(
          name: CygnusPlatformWebViewControllerMethod.canScrollHorizontally.name,
          signature: 'Future<bool> canScrollHorizontally()',
          description: 'Checks if the WebView can scroll horizontally.',
          className: className,
          category: 'Scrolling',
        ),
        ApiMethodDefinition(
          name: CygnusPlatformWebViewControllerMethod.pageDown.name,
          signature: 'Future<bool> pageDown({required bool bottom})',
          description: 'Scrolls down by half or full page.',
          className: className,
          category: 'Scrolling',
        ),
        ApiMethodDefinition(
          name: CygnusPlatformWebViewControllerMethod.pageUp.name,
          signature: 'Future<bool> pageUp({required bool top})',
          description: 'Scrolls up by half or full page.',
          className: className,
          category: 'Scrolling',
        ),

        // Zoom methods
        ApiMethodDefinition(
          name: CygnusPlatformWebViewControllerMethod.zoomBy.name,
          signature: 'Future<void> zoomBy({required double zoomFactor, ...})',
          description: 'Zooms by the specified factor.',
          className: className,
          category: 'Zoom',
        ),
        ApiMethodDefinition(
          name: CygnusPlatformWebViewControllerMethod.zoomIn.name,
          signature: 'Future<bool> zoomIn()',
          description: 'Zooms in by a standard amount.',
          className: className,
          category: 'Zoom',
        ),
        ApiMethodDefinition(
          name: CygnusPlatformWebViewControllerMethod.zoomOut.name,
          signature: 'Future<bool> zoomOut()',
          description: 'Zooms out by a standard amount.',
          className: className,
          category: 'Zoom',
        ),
        ApiMethodDefinition(
          name: CygnusPlatformWebViewControllerMethod.getZoomScale.name,
          signature: 'Future<double?> getZoomScale()',
          description: 'Gets the current zoom scale.',
          className: className,
          category: 'Zoom',
        ),

        // Settings methods
        ApiMethodDefinition(
          name: CygnusPlatformWebViewControllerMethod.setSettings.name,
          signature:
              'Future<void> ${CygnusPlatformWebViewControllerMethod.setSettings.name}({required ${CygnusWebViewSettings} settings})',
          description: 'Updates the WebView settings.',
          className: className,
          category: 'Settings',
        ),
        ApiMethodDefinition(
          name: CygnusPlatformWebViewControllerMethod.getSettings.name,
          signature:
              'Future<${CygnusWebViewSettings}?> ${CygnusPlatformWebViewControllerMethod.getSettings.name}()',
          description: 'Gets the current WebView settings.',
          className: className,
          category: 'Settings',
        ),
        ApiMethodDefinition(
          name: CygnusPlatformWebViewControllerMethod.setContextMenu.name,
          signature: 'Future<void> setContextMenu(CygnusContextMenu? contextMenu)',
          description: 'Sets the context menu.',
          className: className,
          category: 'Settings',
        ),
        ApiMethodDefinition(
          name: CygnusPlatformWebViewControllerMethod.requestFocus.name,
          signature: 'Future<void> requestFocus()',
          description: 'Requests focus for the WebView.',
          className: className,
          category: 'Settings',
        ),
        ApiMethodDefinition(
          name: CygnusPlatformWebViewControllerMethod.clearFocus.name,
          signature: 'Future<void> clearFocus()',
          description: 'Clears focus from the WebView.',
          className: className,
          category: 'Settings',
        ),

        // Screenshot methods
        ApiMethodDefinition(
          name: CygnusPlatformWebViewControllerMethod.takeScreenshot.name,
          signature:
              'Future<Uint8List?> takeScreenshot({CygnusScreenshotConfiguration? screenshotConfiguration})',
          description: 'Takes a screenshot of the WebView.',
          className: className,
          category: 'Screenshot',
        ),
        ApiMethodDefinition(
          name: CygnusPlatformWebViewControllerMethod.printCurrentPage.name,
          signature:
              'Future<${CygnusPrintJobController}?> ${CygnusPlatformWebViewControllerMethod.printCurrentPage.name}({${CygnusPrintJobSettings}? settings})',
          description: 'Prints the current page.',
          className: className,
          category: 'Screenshot',
        ),
        ApiMethodDefinition(
          name: CygnusPlatformWebViewControllerMethod.createPdf.name,
          signature:
              'Future<Uint8List?> createPdf({PdfConfiguration? pdfConfiguration})',
          description: 'Creates a PDF from the current page.',
          className: className,
          category: 'Screenshot',
        ),

        // Cache methods
        ApiMethodDefinition(
          name: CygnusPlatformWebViewControllerMethod.clearHistory.name,
          signature: 'Future<void> clearHistory()',
          description: 'Clears the WebView history.',
          className: className,
          category: 'Cache',
        ),
        ApiMethodDefinition(
          name: CygnusPlatformWebViewControllerMethod.clearFormData.name,
          signature: 'Future<void> clearFormData()',
          description: 'Clears form data.',
          className: className,
          category: 'Cache',
        ),
        ApiMethodDefinition(
          name: CygnusPlatformWebViewControllerMethod.clearSslPreferences.name,
          signature: 'Future<void> clearSslPreferences()',
          description: 'Clears SSL preferences.',
          className: className,
          category: 'Cache',
        ),

        // Pause/Resume methods
        ApiMethodDefinition(
          name: CygnusPlatformWebViewControllerMethod.pause.name,
          signature: 'Future<void> pause()',
          description: 'Pauses the WebView.',
          className: className,
          category: 'Pause/Resume',
        ),
        ApiMethodDefinition(
          name: CygnusPlatformWebViewControllerMethod.resume.name,
          signature: 'Future<void> resume()',
          description: 'Resumes the WebView.',
          className: className,
          category: 'Pause/Resume',
        ),
        ApiMethodDefinition(
          name: CygnusPlatformWebViewControllerMethod.pauseTimers.name,
          signature: 'Future<void> pauseTimers()',
          description: 'Pauses all layout, parsing, and JavaScript timers.',
          className: className,
          category: 'Pause/Resume',
        ),
        ApiMethodDefinition(
          name: CygnusPlatformWebViewControllerMethod.resumeTimers.name,
          signature: 'Future<void> resumeTimers()',
          description: 'Resumes all layout, parsing, and JavaScript timers.',
          className: className,
          category: 'Pause/Resume',
        ),

        // Web Messaging methods
        ApiMethodDefinition(
          name:
              CygnusPlatformWebViewControllerMethod.createWebMessageChannel.name,
          signature:
              'Future<${CygnusWebMessageChannel}?> ${CygnusPlatformWebViewControllerMethod.createWebMessageChannel.name}()',
          description: 'Creates a message channel for communication.',
          className: className,
          category: 'Web Messaging',
        ),
        ApiMethodDefinition(
          name: CygnusPlatformWebViewControllerMethod.postWebMessage.name,
          signature:
              'Future<void> ${CygnusPlatformWebViewControllerMethod.postWebMessage.name}({required ${CygnusWebMessage} message, ...})',
          description: 'Posts a message to the WebView.',
          className: className,
          category: 'Web Messaging',
        ),
        ApiMethodDefinition(
          name: CygnusPlatformWebViewControllerMethod.addWebMessageListener.name,
          signature:
              'Future<void> ${CygnusPlatformWebViewControllerMethod.addWebMessageListener.name}(${CygnusWebMessageListener} webMessageListener)',
          description: 'Adds a listener for web messages.',
          className: className,
          category: 'Web Messaging',
        ),
        ApiMethodDefinition(
          name: CygnusPlatformWebViewControllerMethod.hasWebMessageListener.name,
          signature:
              'bool hasWebMessageListener({required String jsObjectName})',
          description: 'Checks if a web message listener exists.',
          className: className,
          category: 'Web Messaging',
        ),

        // Media methods
        ApiMethodDefinition(
          name: CygnusPlatformWebViewControllerMethod.isInFullscreen.name,
          signature: 'Future<bool?> isInFullscreen()',
          description: 'Returns whether the WebView is in fullscreen mode.',
          className: className,
          category: 'Media',
        ),
        ApiMethodDefinition(
          name: CygnusPlatformWebViewControllerMethod.pauseAllMediaPlayback.name,
          signature: 'Future<void> pauseAllMediaPlayback()',
          description: 'Pauses all media playback.',
          className: className,
          category: 'Media',
        ),
        ApiMethodDefinition(
          name: CygnusPlatformWebViewControllerMethod
              .setAllMediaPlaybackSuspended
              .name,
          signature:
              'Future<void> setAllMediaPlaybackSuspended({required bool suspended})',
          description: 'Suspends or resumes all media playback.',
          className: className,
          category: 'Media',
        ),
        ApiMethodDefinition(
          name: CygnusPlatformWebViewControllerMethod
              .closeAllMediaPresentations
              .name,
          signature: 'Future<void> closeAllMediaPresentations()',
          description: 'Closes all media presentations.',
          className: className,
          category: 'Media',
        ),
        ApiMethodDefinition(
          name: CygnusPlatformWebViewControllerMethod
              .requestMediaPlaybackState
              .name,
          signature: 'Future<CygnusMediaPlaybackState?> requestMediaPlaybackState()',
          description: 'Gets the current media playback state.',
          className: className,
          category: 'Media',
        ),
        ApiMethodDefinition(
          name: CygnusPlatformWebViewControllerMethod.isPlayingAudio.name,
          signature: 'Future<bool?> isPlayingAudio()',
          description: 'Checks if audio is currently playing.',
          className: className,
          category: 'Media',
        ),
        ApiMethodDefinition(
          name: CygnusPlatformWebViewControllerMethod.isMuted.name,
          signature: 'Future<bool?> isMuted()',
          description: 'Checks if audio is muted.',
          className: className,
          category: 'Media',
        ),
        ApiMethodDefinition(
          name: CygnusPlatformWebViewControllerMethod.setMuted.name,
          signature: 'Future<void> setMuted({required bool muted})',
          description: 'Sets the muted state.',
          className: className,
          category: 'Media',
        ),

        // Camera/Mic methods
        ApiMethodDefinition(
          name: CygnusPlatformWebViewControllerMethod.getCameraCaptureState.name,
          signature: 'Future<CygnusMediaCaptureState?> getCameraCaptureState()',
          description: 'Gets the camera capture state.',
          className: className,
          category: 'Camera/Mic',
        ),
        ApiMethodDefinition(
          name: CygnusPlatformWebViewControllerMethod.setCameraCaptureState.name,
          signature:
              'Future<void> setCameraCaptureState({required CygnusMediaCaptureState state})',
          description: 'Sets the camera capture state.',
          className: className,
          category: 'Camera/Mic',
        ),
        ApiMethodDefinition(
          name: CygnusPlatformWebViewControllerMethod
              .getMicrophoneCaptureState
              .name,
          signature: 'Future<CygnusMediaCaptureState?> getMicrophoneCaptureState()',
          description: 'Gets the microphone capture state.',
          className: className,
          category: 'Camera/Mic',
        ),
        ApiMethodDefinition(
          name: CygnusPlatformWebViewControllerMethod
              .setMicrophoneCaptureState
              .name,
          signature:
              'Future<void> setMicrophoneCaptureState({required CygnusMediaCaptureState state})',
          description: 'Sets the microphone capture state.',
          className: className,
          category: 'Camera/Mic',
        ),

        // Security methods
        ApiMethodDefinition(
          name: CygnusPlatformWebViewControllerMethod.isSecureContext.name,
          signature: 'Future<bool> isSecureContext()',
          description: 'Checks if the current context is secure (HTTPS).',
          className: className,
          category: 'Security',
        ),
        ApiMethodDefinition(
          name: CygnusPlatformWebViewControllerMethod.hasOnlySecureContent.name,
          signature: 'Future<bool> hasOnlySecureContent()',
          description: 'Checks if the page has only secure content.',
          className: className,
          category: 'Security',
        ),

        // Android-specific methods
        ApiMethodDefinition(
          name: CygnusPlatformWebViewControllerMethod.startSafeBrowsing.name,
          signature: 'Future<bool> startSafeBrowsing()',
          description: 'Starts the Safe Browsing initialization.',
          className: className,
          category: 'Android',
        ),
        ApiMethodDefinition(
          name: CygnusPlatformWebViewControllerMethod.saveWebArchive.name,
          signature:
              'Future<String?> saveWebArchive({required String basename, ...})',
          description: 'Saves the current page as a web archive.',
          className: className,
          category: 'Android',
        ),
        ApiMethodDefinition(
          name: CygnusPlatformWebViewControllerMethod.requestFocusNodeHref.name,
          signature:
              'Future<CygnusRequestFocusNodeHrefResult?> requestFocusNodeHref()',
          description: 'Requests the URL of the focused anchor.',
          className: className,
          category: 'Android',
        ),
        ApiMethodDefinition(
          name: CygnusPlatformWebViewControllerMethod.requestImageRef.name,
          signature: 'Future<CygnusRequestImageRefResult?> requestImageRef()',
          description: 'Requests the URL of the focused image.',
          className: className,
          category: 'Android',
        ),
        ApiMethodDefinition(
          name: CygnusPlatformWebViewControllerMethod.saveState.name,
          signature: 'Future<Uint8List?> saveState()',
          description: 'Saves the WebView state to a bundle.',
          className: className,
          category: 'Android',
        ),
        ApiMethodDefinition(
          name: CygnusPlatformWebViewControllerMethod.restoreState.name,
          signature: 'Future<void> restoreState({required Uint8List state})',
          description: 'Restores the WebView state from a bundle.',
          className: className,
          category: 'Android',
        ),

        // iOS/macOS-specific methods
        ApiMethodDefinition(
          name: CygnusPlatformWebViewControllerMethod.createWebArchiveData.name,
          signature: 'Future<Uint8List?> createWebArchiveData()',
          description: 'Creates a web archive of the current page.',
          className: className,
          category: 'iOS/macOS',
        ),
        ApiMethodDefinition(
          name: CygnusPlatformWebViewControllerMethod.terminateWebProcess.name,
          signature: 'Future<void> terminateWebProcess()',
          description: 'Terminates the web content process.',
          className: className,
          category: 'iOS/macOS',
        ),

        // Windows-specific methods
        ApiMethodDefinition(
          name: CygnusPlatformWebViewControllerMethod.openDevTools.name,
          signature: 'Future<void> openDevTools()',
          description: 'Opens the browser DevTools.',
          className: className,
          category: 'Windows',
        ),
        ApiMethodDefinition(
          name: CygnusPlatformWebViewControllerMethod
              .callDevToolsProtocolMethod
              .name,
          signature:
              'Future<dynamic> callDevToolsProtocolMethod({required String methodName, ...})',
          description: 'Calls a DevTools Protocol method.',
          className: className,
          category: 'Windows',
        ),
        ApiMethodDefinition(
          name: CygnusPlatformWebViewControllerMethod
              .addDevToolsProtocolEventListener
              .name,
          signature:
              'Future<void> addDevToolsProtocolEventListener({required String eventName, ...})',
          description: 'Adds a DevTools Protocol event listener.',
          className: className,
          category: 'Windows',
        ),
        ApiMethodDefinition(
          name: CygnusPlatformWebViewControllerMethod
              .removeDevToolsProtocolEventListener
              .name,
          signature:
              'Future<void> removeDevToolsProtocolEventListener({required String eventName})',
          description: 'Removes a DevTools Protocol event listener.',
          className: className,
          category: 'Windows',
        ),

        // Web-specific methods
        ApiMethodDefinition(
          name: CygnusPlatformWebViewControllerMethod.getIFrameId.name,
          signature: 'Future<String?> getIFrameId()',
          description: 'Gets the iframe ID on web platform.',
          className: className,
          category: 'Web',
        ),

        // Other methods
        ApiMethodDefinition(
          name: CygnusPlatformWebViewControllerMethod.getViewId.name,
          signature: 'int getViewId()',
          description: 'Gets the view ID of the WebView.',
          className: className,
          category: 'Other',
        ),
        ApiMethodDefinition(
          name: CygnusPlatformWebViewControllerMethod.dispose.name,
          signature: 'void dispose()',
          description: 'Disposes the controller and releases resources.',
          className: className,
          category: 'Other',
        ),

        // Static methods
        ApiMethodDefinition(
          name: CygnusPlatformWebViewControllerMethod.getDefaultUserAgent.name,
          signature: 'static Future<String> getDefaultUserAgent()',
          description: 'Gets the default User-Agent string.',
          className: className,
          isStatic: true,
          category: 'Static',
        ),
        ApiMethodDefinition(
          name: CygnusPlatformWebViewControllerMethod
              .clearClientCertPreferences
              .name,
          signature: 'static Future<void> clearClientCertPreferences()',
          description: 'Clears the client certificate preferences.',
          className: className,
          isStatic: true,
          category: 'Static',
        ),
        ApiMethodDefinition(
          name: CygnusPlatformWebViewControllerMethod
              .getSafeBrowsingPrivacyPolicyUrl
              .name,
          signature: 'static Future<CygnusWebUri?> getSafeBrowsingPrivacyPolicyUrl()',
          description: 'Gets the Safe Browsing privacy policy URL.',
          className: className,
          isStatic: true,
          category: 'Static',
        ),
        ApiMethodDefinition(
          name: CygnusPlatformWebViewControllerMethod
              .setSafeBrowsingAllowlist
              .name,
          signature:
              'static Future<bool> setSafeBrowsingAllowlist({required List<String> hosts})',
          description: 'Sets the Safe Browsing allowlist.',
          className: className,
          isStatic: true,
          category: 'Static',
        ),
        ApiMethodDefinition(
          name: CygnusPlatformWebViewControllerMethod
              .getCurrentWebViewPackage
              .name,
          signature:
              'static Future<CygnusWebViewPackageInfo?> getCurrentWebViewPackage()',
          description: 'Gets the current WebView package info.',
          className: className,
          isStatic: true,
          category: 'Static',
        ),
        ApiMethodDefinition(
          name: CygnusPlatformWebViewControllerMethod
              .setWebContentsDebuggingEnabled
              .name,
          signature:
              'static Future<void> setWebContentsDebuggingEnabled(bool debuggingEnabled)',
          description: 'Enables or disables debugging.',
          className: className,
          isStatic: true,
          category: 'Static',
        ),
        ApiMethodDefinition(
          name: CygnusPlatformWebViewControllerMethod.getVariationsHeader.name,
          signature: 'static Future<String?> getVariationsHeader()',
          description: 'Gets the variations header.',
          className: className,
          isStatic: true,
          category: 'Static',
        ),
        ApiMethodDefinition(
          name: CygnusPlatformWebViewControllerMethod.isMultiProcessEnabled.name,
          signature: 'static Future<bool> isMultiProcessEnabled()',
          description: 'Checks if multi-process is enabled.',
          className: className,
          isStatic: true,
          category: 'Static',
        ),
        ApiMethodDefinition(
          name: CygnusPlatformWebViewControllerMethod.disableWebView.name,
          signature: 'static Future<void> disableWebView()',
          description: 'Disables the WebView.',
          className: className,
          isStatic: true,
          category: 'Static',
        ),
        ApiMethodDefinition(
          name: CygnusPlatformWebViewControllerMethod.handlesURLScheme.name,
          signature: 'static Future<bool> handlesURLScheme(String urlScheme)',
          description: 'Checks if the WebView handles a URL scheme.',
          className: className,
          isStatic: true,
          category: 'Static',
        ),
        ApiMethodDefinition(
          name: CygnusPlatformWebViewControllerMethod.disposeKeepAlive.name,
          signature:
              'static Future<void> disposeKeepAlive(${CygnusWebViewKeepAlive} keepAlive)',
          description: 'Disposes a keep-alive instance.',
          className: className,
          isStatic: true,
          category: 'Static',
        ),
        ApiMethodDefinition(
          name: CygnusPlatformWebViewControllerMethod.clearAllCache.name,
          signature:
              'static Future<void> clearAllCache({bool includeDiskFiles = true})',
          description: 'Clears all WebView caches.',
          className: className,
          isStatic: true,
          category: 'Static',
        ),
        ApiMethodDefinition(
          name: CygnusPlatformWebViewControllerMethod
              .enableSlowWholeDocumentDraw
              .name,
          signature: 'static Future<void> enableSlowWholeDocumentDraw()',
          description: 'Enables slow whole document draw.',
          className: className,
          isStatic: true,
          category: 'Static',
        ),
        ApiMethodDefinition(
          name:
              CygnusPlatformWebViewControllerMethod.setJavaScriptBridgeName.name,
          signature:
              'static Future<void> setJavaScriptBridgeName(String bridgeName)',
          description: 'Sets the JavaScript bridge name.',
          className: className,
          isStatic: true,
          category: 'Static',
        ),
        ApiMethodDefinition(
          name:
              CygnusPlatformWebViewControllerMethod.getJavaScriptBridgeName.name,
          signature: 'static Future<String> getJavaScriptBridgeName()',
          description: 'Gets the JavaScript bridge name.',
          className: className,
          isStatic: true,
          category: 'Static',
        ),
      ],
    );
  }

  static ApiClassDefinition _getWebViewEventsDefinition() {
    final className = eventClassNameOf(CygnusWebView);
    return ApiClassDefinition(
      className: className,
      description: 'Events fired by ${CygnusWebView}.',
      events: [
        // Core events
        ApiEventDefinition(
          name: CygnusPlatformWebViewCreationParamsProperty.onWebViewCreated.name,
          description: 'Called when the WebView is created.',
          className: className,
          category: 'Core',
        ),
        ApiEventDefinition(
          name: CygnusPlatformWebViewCreationParamsProperty.onLoadStart.name,
          description: 'Called when a page starts loading.',
          className: className,
          category: 'Core',
        ),
        ApiEventDefinition(
          name: CygnusPlatformWebViewCreationParamsProperty.onLoadStop.name,
          description: 'Called when a page finishes loading.',
          className: className,
          category: 'Core',
        ),
        ApiEventDefinition(
          name: CygnusPlatformWebViewCreationParamsProperty.onLoadError.name,
          description: 'Called when a page fails to load.',
          className: className,
          category: 'Core',
        ),
        ApiEventDefinition(
          name: CygnusPlatformWebViewCreationParamsProperty.onLoadHttpError.name,
          description: 'Called when an HTTP error is received.',
          className: className,
          category: 'Core',
        ),
        ApiEventDefinition(
          name: CygnusPlatformWebViewCreationParamsProperty.onProgressChanged.name,
          description: 'Called when the loading progress changes.',
          className: className,
          category: 'Core',
        ),
        ApiEventDefinition(
          name: CygnusPlatformWebViewCreationParamsProperty.onConsoleMessage.name,
          description: 'Called when a console message is received.',
          className: className,
          category: 'Core',
        ),
        ApiEventDefinition(
          name: CygnusPlatformWebViewCreationParamsProperty.onTitleChanged.name,
          description: 'Called when the page title changes.',
          className: className,
          category: 'Core',
        ),
        ApiEventDefinition(
          name:
              CygnusPlatformWebViewCreationParamsProperty.onUpdateVisitedHistory.name,
          description: 'Called when the visited history is updated.',
          className: className,
          category: 'Core',
        ),

        // Navigation events
        ApiEventDefinition(
          name: CygnusPlatformWebViewCreationParamsProperty
              .shouldOverrideUrlLoading
              .name,
          description: 'Called to handle URL navigation requests.',
          className: className,
          category: 'Navigation',
        ),
        ApiEventDefinition(
          name: CygnusPlatformWebViewCreationParamsProperty.onNavigationResponse.name,
          description: 'Called when receiving a navigation response.',
          className: className,
          category: 'Navigation',
        ),
        ApiEventDefinition(
          name: CygnusPlatformWebViewCreationParamsProperty
              .shouldAllowDeprecatedTLS
              .name,
          description: 'Called to check if deprecated TLS should be allowed.',
          className: className,
          category: 'Navigation',
        ),

        // Window events
        ApiEventDefinition(
          name: CygnusPlatformWebViewCreationParamsProperty.onCreateWindow.name,
          description: 'Called when a new window is requested.',
          className: className,
          category: 'Window',
        ),
        ApiEventDefinition(
          name: CygnusPlatformWebViewCreationParamsProperty.onCloseWindow.name,
          description: 'Called when a window should be closed.',
          className: className,
          category: 'Window',
        ),
        ApiEventDefinition(
          name: CygnusPlatformWebViewCreationParamsProperty.onWindowFocus.name,
          description: 'Called when the window receives focus.',
          className: className,
          category: 'Window',
        ),
        ApiEventDefinition(
          name: CygnusPlatformWebViewCreationParamsProperty.onWindowBlur.name,
          description: 'Called when the window loses focus.',
          className: className,
          category: 'Window',
        ),

        // JS Dialog events
        ApiEventDefinition(
          name: CygnusPlatformWebViewCreationParamsProperty.onJsAlert.name,
          description: 'Called when a JavaScript alert is shown.',
          className: className,
          category: 'JS Dialogs',
        ),
        ApiEventDefinition(
          name: CygnusPlatformWebViewCreationParamsProperty.onJsConfirm.name,
          description: 'Called when a JavaScript confirm is shown.',
          className: className,
          category: 'JS Dialogs',
        ),
        ApiEventDefinition(
          name: CygnusPlatformWebViewCreationParamsProperty.onJsPrompt.name,
          description: 'Called when a JavaScript prompt is shown.',
          className: className,
          category: 'JS Dialogs',
        ),
        ApiEventDefinition(
          name: CygnusPlatformWebViewCreationParamsProperty.onJsBeforeUnload.name,
          description: 'Called before the page is unloaded.',
          className: className,
          category: 'JS Dialogs',
        ),

        // Authentication events
        ApiEventDefinition(
          name: CygnusPlatformWebViewCreationParamsProperty
              .onReceivedHttpAuthRequest
              .name,
          description: 'Called for HTTP authentication requests.',
          className: className,
          category: 'Authentication',
        ),
        ApiEventDefinition(
          name: CygnusPlatformWebViewCreationParamsProperty
              .onReceivedServerTrustAuthRequest
              .name,
          description: 'Called for server trust authentication.',
          className: className,
          category: 'Authentication',
        ),
        ApiEventDefinition(
          name: CygnusPlatformWebViewCreationParamsProperty
              .onReceivedClientCertRequest
              .name,
          description: 'Called when a client certificate is requested.',
          className: className,
          category: 'Authentication',
        ),

        // Network events
        ApiEventDefinition(
          name:
              CygnusPlatformWebViewCreationParamsProperty.shouldInterceptRequest.name,
          description: 'Called to intercept resource requests.',
          className: className,
          category: 'Network',
        ),
        ApiEventDefinition(
          name: CygnusPlatformWebViewCreationParamsProperty.onLoadResource.name,
          description: 'Called when a resource is loaded.',
          className: className,
          category: 'Network',
        ),
        ApiEventDefinition(
          name: CygnusPlatformWebViewCreationParamsProperty
              .onLoadResourceWithCustomScheme
              .name,
          description: 'Called when loading a custom scheme resource.',
          className: className,
          category: 'Network',
        ),
        ApiEventDefinition(
          name: CygnusPlatformWebViewCreationParamsProperty.onReceivedError.name,
          description: 'Called when a resource load error occurs.',
          className: className,
          category: 'Network',
        ),
        ApiEventDefinition(
          name: CygnusPlatformWebViewCreationParamsProperty.onReceivedHttpError.name,
          description: 'Called when an HTTP error occurs.',
          className: className,
          category: 'Network',
        ),

        // Download events
        ApiEventDefinition(
          name:
              CygnusPlatformWebViewCreationParamsProperty.onDownloadStartRequest.name,
          description: 'Called when a download is requested.',
          className: className,
          category: 'Download',
        ),
        ApiEventDefinition(
          name: CygnusPlatformWebViewCreationParamsProperty.onDownloadStarting.name,
          description: 'Called when a download is starting.',
          className: className,
          category: 'Download',
        ),

        // Scroll events
        ApiEventDefinition(
          name: CygnusPlatformWebViewCreationParamsProperty.onScrollChanged.name,
          description: 'Called when the scroll position changes.',
          className: className,
          category: 'Scroll',
        ),
        ApiEventDefinition(
          name: CygnusPlatformWebViewCreationParamsProperty.onOverScrolled.name,
          description: 'Called when the WebView is over-scrolled.',
          className: className,
          category: 'Scroll',
        ),

        // Zoom events
        ApiEventDefinition(
          name: CygnusPlatformWebViewCreationParamsProperty.onZoomScaleChanged.name,
          description: 'Called when the zoom scale changes.',
          className: className,
          category: 'Zoom',
        ),

        // Print events
        ApiEventDefinition(
          name: CygnusPlatformWebViewCreationParamsProperty.onPrintRequest.name,
          description: 'Called when a print request is made.',
          className: className,
          category: 'Print',
        ),

        // Fullscreen events
        ApiEventDefinition(
          name: CygnusPlatformWebViewCreationParamsProperty.onEnterFullscreen.name,
          description: 'Called when entering fullscreen mode.',
          className: className,
          category: 'Fullscreen',
        ),
        ApiEventDefinition(
          name: CygnusPlatformWebViewCreationParamsProperty.onExitFullscreen.name,
          description: 'Called when exiting fullscreen mode.',
          className: className,
          category: 'Fullscreen',
        ),

        // Permission events
        ApiEventDefinition(
          name: CygnusPlatformWebViewCreationParamsProperty.onPermissionRequest.name,
          description: 'Called when a permission is requested.',
          className: className,
          category: 'Permission',
        ),
        ApiEventDefinition(
          name: CygnusPlatformWebViewCreationParamsProperty
              .onPermissionRequestCanceled
              .name,
          description: 'Called when a permission request is canceled.',
          className: className,
          category: 'Permission',
        ),

        // Touch/Gesture events
        ApiEventDefinition(
          name: CygnusPlatformWebViewCreationParamsProperty
              .onLongPressHitTestResult
              .name,
          description: 'Called on a long press.',
          className: className,
          category: 'Touch',
        ),
        ApiEventDefinition(
          name: CygnusPlatformWebViewCreationParamsProperty
              .onGeolocationPermissionsShowPrompt
              .name,
          description: 'Called when requesting geolocation permission.',
          className: className,
          category: 'Permission',
        ),
        ApiEventDefinition(
          name: CygnusPlatformWebViewCreationParamsProperty
              .onGeolocationPermissionsHidePrompt
              .name,
          description: 'Called when hiding geolocation permission prompt.',
          className: className,
          category: 'Permission',
        ),

        // Render Process events
        ApiEventDefinition(
          name: CygnusPlatformWebViewCreationParamsProperty.onRenderProcessGone.name,
          description: 'Called when the render process terminates.',
          className: className,
          category: 'Render Process',
        ),
        ApiEventDefinition(
          name: CygnusPlatformWebViewCreationParamsProperty
              .onRenderProcessResponsive
              .name,
          description: 'Called when the render process becomes responsive.',
          className: className,
          category: 'Render Process',
        ),
        ApiEventDefinition(
          name: CygnusPlatformWebViewCreationParamsProperty
              .onRenderProcessUnresponsive
              .name,
          description: 'Called when the render process becomes unresponsive.',
          className: className,
          category: 'Render Process',
        ),
        ApiEventDefinition(
          name: CygnusPlatformWebViewCreationParamsProperty
              .onWebContentProcessDidTerminate
              .name,
          description: 'Called when the web content process terminates.',
          className: className,
          category: 'Render Process',
        ),

        // Form events
        ApiEventDefinition(
          name: CygnusPlatformWebViewCreationParamsProperty.onFormResubmission.name,
          description: 'Called when a form is resubmitted.',
          className: className,
          category: 'Form',
        ),

        // Icon events
        ApiEventDefinition(
          name: CygnusPlatformWebViewCreationParamsProperty.onReceivedIcon.name,
          description: 'Called when a favicon is received.',
          className: className,
          category: 'Icon',
        ),
        ApiEventDefinition(
          name:
              CygnusPlatformWebViewCreationParamsProperty.onReceivedTouchIconUrl.name,
          description: 'Called when a touch icon URL is received.',
          className: className,
          category: 'Icon',
        ),

        // Safe Browsing events
        ApiEventDefinition(
          name: CygnusPlatformWebViewCreationParamsProperty.onSafeBrowsingHit.name,
          description: 'Called when Safe Browsing detects a threat.',
          className: className,
          category: 'Safe Browsing',
        ),

        // iOS/macOS events
        ApiEventDefinition(
          name: CygnusPlatformWebViewCreationParamsProperty
              .onDidReceiveServerRedirectForProvisionalNavigation
              .name,
          description: 'Called when a server redirect is received.',
          className: className,
          category: 'iOS/macOS',
        ),
        ApiEventDefinition(
          name: CygnusPlatformWebViewCreationParamsProperty
              .onCameraCaptureStateChanged
              .name,
          description: 'Called when camera capture state changes.',
          className: className,
          category: 'iOS/macOS',
        ),
        ApiEventDefinition(
          name: CygnusPlatformWebViewCreationParamsProperty
              .onMicrophoneCaptureStateChanged
              .name,
          description: 'Called when microphone capture state changes.',
          className: className,
          category: 'iOS/macOS',
        ),

        // Windows events
        ApiEventDefinition(
          name: CygnusPlatformWebViewCreationParamsProperty.onProcessFailed.name,
          description: 'Called when a process failure occurs.',
          className: className,
          category: 'Windows',
        ),

        // Other events
        ApiEventDefinition(
          name: CygnusPlatformWebViewCreationParamsProperty.onPageCommitVisible.name,
          description: 'Called when the page becomes visible.',
          className: className,
          category: 'Other',
        ),
        ApiEventDefinition(
          name: CygnusPlatformWebViewCreationParamsProperty.onContentSizeChanged.name,
          description: 'Called when the content size changes.',
          className: className,
          category: 'Other',
        ),
        ApiEventDefinition(
          name:
              CygnusPlatformWebViewCreationParamsProperty.onAjaxReadyStateChange.name,
          description: 'Called when an AJAX ready state changes.',
          className: className,
          category: 'Other',
        ),
        ApiEventDefinition(
          name: CygnusPlatformWebViewCreationParamsProperty.onAjaxProgress.name,
          description: 'Called for AJAX progress updates.',
          className: className,
          category: 'Other',
        ),
        ApiEventDefinition(
          name: CygnusPlatformWebViewCreationParamsProperty
              .shouldInterceptAjaxRequest
              .name,
          description: 'Called to intercept AJAX requests.',
          className: className,
          category: 'Other',
        ),
        ApiEventDefinition(
          name: CygnusPlatformWebViewCreationParamsProperty
              .shouldInterceptFetchRequest
              .name,
          description: 'Called to intercept fetch requests.',
          className: className,
          category: 'Other',
        ),
      ],
    );
  }

  static ApiClassDefinition _getHeadlessWebViewDefinition() {
    final className = classNameOf(CygnusHeadlessWebView);
    return ApiClassDefinition(
      className: className,
      description: 'A WebView that runs without UI.',
      isClassSupported: () => CygnusHeadlessWebView.isClassSupported(),
      methods: [
        ApiMethodDefinition(
          name: CygnusPlatformHeadlessWebViewMethod.run.name,
          signature: 'Future<void> run()',
          description: 'Runs the headless WebView.',
          className: className,
        ),
        ApiMethodDefinition(
          name: CygnusPlatformHeadlessWebViewMethod.isRunning.name,
          signature: 'Future<bool> isRunning()',
          description: 'Checks if the WebView is running.',
          className: className,
        ),
        ApiMethodDefinition(
          name: CygnusPlatformHeadlessWebViewMethod.setSize.name,
          signature: 'Future<void> setSize(Size size)',
          description: 'Sets the WebView size.',
          className: className,
        ),
        ApiMethodDefinition(
          name: CygnusPlatformHeadlessWebViewMethod.getSize.name,
          signature: 'Future<Size?> getSize()',
          description: 'Gets the WebView size.',
          className: className,
        ),
        ApiMethodDefinition(
          name: CygnusPlatformHeadlessWebViewMethod.dispose.name,
          signature: 'Future<void> dispose()',
          description: 'Disposes the headless WebView.',
          className: className,
        ),
      ],
    );
  }

  static ApiClassDefinition _getBrowserDefinition() {
    final className = classNameOf(CygnusBrowser);
    return ApiClassDefinition(
      className: className,
      description: 'A full-screen in-app browser.',
      isClassSupported: () => CygnusBrowser.isClassSupported(),
      methods: [
        ApiMethodDefinition(
          name: CygnusPlatformBrowserMethod.openUrlRequest.name,
          signature:
              'Future<void> openUrlRequest({required CygnusURLRequest urlRequest, ...})',
          description: 'Opens a URL in the browser.',
          className: className,
        ),
        ApiMethodDefinition(
          name: CygnusPlatformBrowserMethod.openFile.name,
          signature:
              'Future<void> openFile({required String assetFilePath, ...})',
          description: 'Opens a file from assets.',
          className: className,
        ),
        ApiMethodDefinition(
          name: CygnusPlatformBrowserMethod.openData.name,
          signature: 'Future<void> openData({required String data, ...})',
          description: 'Opens HTML data.',
          className: className,
        ),
        ApiMethodDefinition(
          name: CygnusPlatformBrowserMethod.openWithSystemBrowser.name,
          signature:
              'static Future<void> openWithSystemBrowser({required CygnusWebUri url})',
          description: 'Opens a URL in the system browser.',
          className: className,
          isStatic: true,
        ),
        ApiMethodDefinition(
          name: CygnusPlatformBrowserMethod.show.name,
          signature: 'Future<void> show()',
          description: 'Shows the browser.',
          className: className,
        ),
        ApiMethodDefinition(
          name: CygnusPlatformBrowserMethod.hide.name,
          signature: 'Future<void> hide()',
          description: 'Hides the browser.',
          className: className,
        ),
        ApiMethodDefinition(
          name: CygnusPlatformBrowserMethod.close.name,
          signature: 'Future<void> close()',
          description: 'Closes the browser.',
          className: className,
        ),
        ApiMethodDefinition(
          name: CygnusPlatformBrowserMethod.isHidden.name,
          signature: 'Future<bool> isHidden()',
          description: 'Checks if the browser is hidden.',
          className: className,
        ),
        ApiMethodDefinition(
          name: CygnusPlatformBrowserMethod.setSettings.name,
          signature:
              'Future<void> ${CygnusPlatformBrowserMethod.setSettings.name}({required ${CygnusBrowserClassSettings} settings})',
          description: 'Sets the browser settings.',
          className: className,
        ),
        ApiMethodDefinition(
          name: CygnusPlatformBrowserMethod.getSettings.name,
          signature:
              'Future<${CygnusBrowserClassSettings}?> ${CygnusPlatformBrowserMethod.getSettings.name}()',
          description: 'Gets the browser settings.',
          className: className,
        ),
        ApiMethodDefinition(
          name: CygnusPlatformBrowserMethod.isOpened.name,
          signature: 'bool isOpened()',
          description: 'Checks if the browser is opened.',
          className: className,
        ),
      ],
      events: [
        ApiEventDefinition(
          name: CygnusPlatformBrowserEventsMethod.onBrowserCreated.name,
          description: 'Called when the browser is created.',
          className: className,
        ),
        ApiEventDefinition(
          name: CygnusPlatformBrowserEventsMethod.onExit.name,
          description: 'Called when the browser exits.',
          className: className,
        ),
        ApiEventDefinition(
          name: CygnusPlatformBrowserEventsMethod.onMainWindowWillClose.name,
          description: 'Called when the main window will close.',
          className: className,
        ),
      ],
    );
  }

  static ApiClassDefinition _getChromeSafariBrowserDefinition() {
    final className = classNameOf(CygnusChromeSafariBrowser);
    return ApiClassDefinition(
      className: className,
      description:
          'A browser using Chrome Custom Tabs or SFSafariViewController.',
      isClassSupported: () => CygnusChromeSafariBrowser.isClassSupported(),
      methods: [
        ApiMethodDefinition(
          name: CygnusPlatformChromeSafariBrowserMethod.open.name,
          signature: 'Future<void> open({CygnusWebUri? url, ...})',
          description: 'Opens a URL in the browser.',
          className: className,
        ),
        ApiMethodDefinition(
          name: CygnusPlatformChromeSafariBrowserMethod.launchUrl.name,
          signature: 'Future<void> launchUrl({required CygnusWebUri url, ...})',
          description: 'Launches a URL.',
          className: className,
        ),
        ApiMethodDefinition(
          name: CygnusPlatformChromeSafariBrowserMethod.mayLaunchUrl.name,
          signature: 'Future<bool> mayLaunchUrl({CygnusWebUri? url, ...})',
          description: 'Hints to the browser to start loading a URL.',
          className: className,
        ),
        ApiMethodDefinition(
          name: CygnusPlatformChromeSafariBrowserMethod.validateRelationship.name,
          signature:
              'Future<bool> validateRelationship({required CygnusCustomTabsRelationType relation, ...})',
          description: 'Validates a relationship.',
          className: className,
        ),
        ApiMethodDefinition(
          name: CygnusPlatformChromeSafariBrowserMethod.close.name,
          signature: 'Future<void> close()',
          description: 'Closes the browser.',
          className: className,
        ),
        ApiMethodDefinition(
          name: CygnusPlatformChromeSafariBrowserMethod.isOpened.name,
          signature: 'bool isOpened()',
          description: 'Checks if the browser is opened.',
          className: className,
        ),
        ApiMethodDefinition(
          name: CygnusPlatformChromeSafariBrowserMethod.isAvailable.name,
          signature: 'static Future<bool> isAvailable()',
          description: 'Checks if the browser is available.',
          className: className,
          isStatic: true,
        ),
        ApiMethodDefinition(
          name: CygnusPlatformChromeSafariBrowserMethod.getMaxToolbarItems.name,
          signature: 'static Future<int> getMaxToolbarItems()',
          description: 'Gets the maximum toolbar items.',
          className: className,
          isStatic: true,
        ),
        ApiMethodDefinition(
          name: CygnusPlatformChromeSafariBrowserMethod.getPackageName.name,
          signature:
              'static Future<String?> getPackageName({List<String>? packages, ...})',
          description: 'Gets the package name for Custom Tabs.',
          className: className,
          isStatic: true,
        ),
        ApiMethodDefinition(
          name: CygnusPlatformChromeSafariBrowserMethod.clearWebsiteData.name,
          signature: 'static Future<void> clearWebsiteData()',
          description: 'Clears website data.',
          className: className,
          isStatic: true,
        ),
        ApiMethodDefinition(
          name: CygnusPlatformChromeSafariBrowserMethod.prewarmConnections.name,
          signature:
              'static Future<CygnusPrewarmingToken?> prewarmConnections({required List<CygnusWebUri> urls})',
          description: 'Prewarms connections.',
          className: className,
          isStatic: true,
        ),
        ApiMethodDefinition(
          name:
              CygnusPlatformChromeSafariBrowserMethod.invalidatePrewarmingToken.name,
          signature:
              'static Future<void> invalidatePrewarmingToken({required CygnusPrewarmingToken prewarmingToken})',
          description: 'Invalidates a prewarming token.',
          className: className,
          isStatic: true,
        ),
        ApiMethodDefinition(
          name: CygnusPlatformChromeSafariBrowserMethod.setActionButton.name,
          signature:
              'Future<void> ${CygnusPlatformChromeSafariBrowserMethod.setActionButton.name}(${CygnusChromeSafariBrowserActionButton} actionButton)',
          description: 'Sets an action button.',
          className: className,
        ),
        ApiMethodDefinition(
          name: CygnusPlatformChromeSafariBrowserMethod.updateActionButton.name,
          signature:
              'Future<void> updateActionButton({required Uint8List icon, required String description})',
          description: 'Updates the action button.',
          className: className,
        ),
        ApiMethodDefinition(
          name: CygnusPlatformChromeSafariBrowserMethod.setSecondaryToolbar.name,
          signature:
              'Future<void> ${CygnusPlatformChromeSafariBrowserMethod.setSecondaryToolbar.name}(${CygnusChromeSafariBrowserSecondaryToolbar} secondaryToolbar)',
          description: 'Sets a secondary toolbar.',
          className: className,
        ),
        ApiMethodDefinition(
          name: CygnusPlatformChromeSafariBrowserMethod.updateSecondaryToolbar.name,
          signature:
              'Future<void> ${CygnusPlatformChromeSafariBrowserMethod.updateSecondaryToolbar.name}(${CygnusChromeSafariBrowserSecondaryToolbar} secondaryToolbar)',
          description: 'Updates the secondary toolbar.',
          className: className,
        ),
        ApiMethodDefinition(
          name:
              CygnusPlatformChromeSafariBrowserMethod.requestPostMessageChannel.name,
          signature:
              'Future<bool> requestPostMessageChannel({required CygnusWebUri sourceOrigin, ...})',
          description: 'Requests a post message channel.',
          className: className,
        ),
        ApiMethodDefinition(
          name: CygnusPlatformChromeSafariBrowserMethod.postMessage.name,
          signature:
              'Future<CygnusCustomTabsPostMessageResultType> postMessage({required String message})',
          description: 'Posts a message.',
          className: className,
        ),
        ApiMethodDefinition(
          name: CygnusPlatformChromeSafariBrowserMethod
              .isEngagementSignalsApiAvailable
              .name,
          signature: 'Future<bool> isEngagementSignalsApiAvailable()',
          description: 'Checks if engagement signals API is available.',
          className: className,
        ),
      ],
      events: [
        ApiEventDefinition(
          name: CygnusPlatformChromeSafariBrowserEventsMethod.onOpened.name,
          description: 'Called when the browser is opened.',
          className: className,
        ),
        ApiEventDefinition(
          name: CygnusPlatformChromeSafariBrowserEventsMethod.onClosed.name,
          description: 'Called when the browser is closed.',
          className: className,
        ),
        ApiEventDefinition(
          name: CygnusPlatformChromeSafariBrowserEventsMethod
              .onCompletedInitialLoad
              .name,
          description: 'Called when the initial load completes.',
          className: className,
        ),
        ApiEventDefinition(
          name: CygnusPlatformChromeSafariBrowserEventsMethod
              .onInitialLoadDidRedirect
              .name,
          description: 'Called when the initial load redirects.',
          className: className,
        ),
        ApiEventDefinition(
          name:
              CygnusPlatformChromeSafariBrowserEventsMethod.onWillOpenInBrowser.name,
          description: 'Called when opening in the browser.',
          className: className,
        ),
        ApiEventDefinition(
          name: CygnusPlatformChromeSafariBrowserEventsMethod.onNavigationEvent.name,
          description: 'Called on navigation events.',
          className: className,
        ),
        ApiEventDefinition(
          name: CygnusPlatformChromeSafariBrowserEventsMethod.onServiceConnected.name,
          description: 'Called when the service connects.',
          className: className,
        ),
        ApiEventDefinition(
          name: CygnusPlatformChromeSafariBrowserEventsMethod
              .onRelationshipValidationResult
              .name,
          description: 'Called with relationship validation results.',
          className: className,
        ),
        ApiEventDefinition(
          name: CygnusPlatformChromeSafariBrowserEventsMethod
              .onMessageChannelReady
              .name,
          description: 'Called when the message channel is ready.',
          className: className,
        ),
        ApiEventDefinition(
          name: CygnusPlatformChromeSafariBrowserEventsMethod.onPostMessage.name,
          description: 'Called when a post message is received.',
          className: className,
        ),
        ApiEventDefinition(
          name: CygnusPlatformChromeSafariBrowserEventsMethod
              .onVerticalScrollEvent
              .name,
          description: 'Called on vertical scroll events.',
          className: className,
        ),
        ApiEventDefinition(
          name: CygnusPlatformChromeSafariBrowserEventsMethod
              .onGreatestScrollPercentageIncreased
              .name,
          description: 'Called when the greatest scroll percentage increases.',
          className: className,
        ),
        ApiEventDefinition(
          name: CygnusPlatformChromeSafariBrowserEventsMethod.onSessionEnded.name,
          description: 'Called when the session ends.',
          className: className,
        ),
      ],
    );
  }

  static ApiClassDefinition _getCookieManagerDefinition() {
    final className = classNameOf(CygnusCookieManager);
    return ApiClassDefinition(
      className: className,
      description: 'Manages cookies for WebViews.',
      isClassSupported: () => CygnusCookieManager.isClassSupported(),
      methods: [
        ApiMethodDefinition(
          name: CygnusPlatformCookieManagerMethod.setCookie.name,
          signature:
              'Future<bool> setCookie({required CygnusWebUri url, required String name, required String value, ...})',
          description: 'Sets a cookie.',
          className: className,
        ),
        ApiMethodDefinition(
          name: CygnusPlatformCookieManagerMethod.getCookies.name,
          signature: 'Future<List<CygnusCookie>> getCookies({required CygnusWebUri url})',
          description: 'Gets all cookies for a URL.',
          className: className,
        ),
        ApiMethodDefinition(
          name: CygnusPlatformCookieManagerMethod.getCookie.name,
          signature:
              'Future<CygnusCookie?> getCookie({required CygnusWebUri url, required String name})',
          description: 'Gets a specific cookie.',
          className: className,
        ),
        ApiMethodDefinition(
          name: CygnusPlatformCookieManagerMethod.deleteCookie.name,
          signature:
              'Future<void> deleteCookie({required CygnusWebUri url, required String name, ...})',
          description: 'Deletes a cookie.',
          className: className,
        ),
        ApiMethodDefinition(
          name: CygnusPlatformCookieManagerMethod.deleteCookies.name,
          signature:
              'Future<void> deleteCookies({required CygnusWebUri url, String? domain, String? path})',
          description: 'Deletes cookies for a URL.',
          className: className,
        ),
        ApiMethodDefinition(
          name: CygnusPlatformCookieManagerMethod.deleteAllCookies.name,
          signature: 'Future<void> deleteAllCookies()',
          description: 'Deletes all cookies.',
          className: className,
        ),
        ApiMethodDefinition(
          name: CygnusPlatformCookieManagerMethod.removeSessionCookies.name,
          signature: 'Future<bool> removeSessionCookies()',
          description: 'Removes all session cookies.',
          className: className,
        ),
        ApiMethodDefinition(
          name: CygnusPlatformCookieManagerMethod.flush.name,
          signature: 'Future<void> flush()',
          description: 'Flushes cookies to persistent storage.',
          className: className,
        ),
        ApiMethodDefinition(
          name: CygnusPlatformCookieManagerMethod.getAllCookies.name,
          signature: 'Future<List<CygnusCookie>> getAllCookies()',
          description: 'Gets all cookies.',
          className: className,
        ),
      ],
    );
  }

  static ApiClassDefinition _getWebStorageDefinition() {
    final className = classNameOf(CygnusWebStorage);
    return ApiClassDefinition(
      className: className,
      description: 'Manages ${CygnusLocalStorage} and ${CygnusSessionStorage}.',
      isClassSupported: () => CygnusWebStorage.isClassSupported(),
      methods: [
        ApiMethodDefinition(
          name: CygnusPlatformLocalStorageMethod.length.name,
          signature: 'Future<int?> length()',
          description: 'Gets the number of items.',
          className: className,
        ),
        ApiMethodDefinition(
          name: CygnusPlatformLocalStorageMethod.setItem.name,
          signature:
              'Future<void> setItem({required String key, required dynamic value})',
          description: 'Sets an item.',
          className: className,
        ),
        ApiMethodDefinition(
          name: CygnusPlatformLocalStorageMethod.getItem.name,
          signature: 'Future<dynamic> getItem({required String key})',
          description: 'Gets an item.',
          className: className,
        ),
        ApiMethodDefinition(
          name: CygnusPlatformLocalStorageMethod.removeItem.name,
          signature: 'Future<void> removeItem({required String key})',
          description: 'Removes an item.',
          className: className,
        ),
        ApiMethodDefinition(
          name: CygnusPlatformLocalStorageMethod.getItems.name,
          signature:
              'Future<List<${CygnusWebStorageItem}>> ${CygnusPlatformLocalStorageMethod.getItems.name}()',
          description: 'Gets all items.',
          className: className,
        ),
        ApiMethodDefinition(
          name: CygnusPlatformLocalStorageMethod.clear.name,
          signature: 'Future<void> clear()',
          description: 'Clears all items.',
          className: className,
        ),
        ApiMethodDefinition(
          name: CygnusPlatformLocalStorageMethod.key.name,
          signature: 'Future<String> key({required int index})',
          description: 'Gets the key at an index.',
          className: className,
        ),
      ],
    );
  }

  static ApiClassDefinition _getFindInteractionControllerDefinition() {
    final className = classNameOf(CygnusFindInteractionController);
    return ApiClassDefinition(
      className: className,
      description: 'Controls find-in-page functionality.',
      isClassSupported: () => CygnusFindInteractionController.isClassSupported(),
      methods: [
        ApiMethodDefinition(
          name: CygnusPlatformFindInteractionControllerMethod.findAll.name,
          signature: 'Future<void> findAll({String? find})',
          description: 'Finds all occurrences.',
          className: className,
        ),
        ApiMethodDefinition(
          name: CygnusPlatformFindInteractionControllerMethod.findNext.name,
          signature: 'Future<void> findNext({bool forward = true})',
          description: 'Finds the next occurrence.',
          className: className,
        ),
        ApiMethodDefinition(
          name: CygnusPlatformFindInteractionControllerMethod.clearMatches.name,
          signature: 'Future<void> clearMatches()',
          description: 'Clears all matches.',
          className: className,
        ),
        ApiMethodDefinition(
          name: CygnusPlatformFindInteractionControllerMethod.setSearchText.name,
          signature: 'Future<void> setSearchText(String? searchText)',
          description: 'Sets the search text.',
          className: className,
        ),
        ApiMethodDefinition(
          name: CygnusPlatformFindInteractionControllerMethod.getSearchText.name,
          signature: 'Future<String?> getSearchText()',
          description: 'Gets the search text.',
          className: className,
        ),
        ApiMethodDefinition(
          name: CygnusPlatformFindInteractionControllerMethod
              .isFindNavigatorVisible
              .name,
          signature: 'Future<bool?> isFindNavigatorVisible()',
          description: 'Checks if the find navigator is visible.',
          className: className,
        ),
        ApiMethodDefinition(
          name:
              CygnusPlatformFindInteractionControllerMethod.presentFindNavigator.name,
          signature: 'Future<void> presentFindNavigator()',
          description: 'Presents the find navigator.',
          className: className,
        ),
        ApiMethodDefinition(
          name:
              CygnusPlatformFindInteractionControllerMethod.dismissFindNavigator.name,
          signature: 'Future<void> dismissFindNavigator()',
          description: 'Dismisses the find navigator.',
          className: className,
        ),
        ApiMethodDefinition(
          name:
              CygnusPlatformFindInteractionControllerMethod.getActiveFindSession.name,
          signature: 'Future<CygnusFindSession?> getActiveFindSession()',
          description: 'Gets the active find session.',
          className: className,
        ),
        ApiMethodDefinition(
          name: CygnusPlatformFindInteractionControllerMethod.dispose.name,
          signature: 'void dispose()',
          description: 'Disposes the controller.',
          className: className,
        ),
      ],
      events: [
        ApiEventDefinition(
          name: CygnusPlatformFindInteractionControllerCreationParamsProperty
              .onFindResultReceived
              .name,
          description: 'Called when find results are received.',
          className: className,
        ),
      ],
    );
  }

  static ApiClassDefinition _getPullToRefreshControllerDefinition() {
    final className = classNameOf(CygnusPullToRefreshController);
    return ApiClassDefinition(
      className: className,
      description: 'Controls pull-to-refresh functionality.',
      isClassSupported: () => CygnusPullToRefreshController.isClassSupported(),
      methods: [
        ApiMethodDefinition(
          name: CygnusPlatformPullToRefreshControllerMethod.setEnabled.name,
          signature: 'Future<void> setEnabled(bool enabled)',
          description: 'Enables or disables pull-to-refresh.',
          className: className,
        ),
        ApiMethodDefinition(
          name: CygnusPlatformPullToRefreshControllerMethod.isEnabled.name,
          signature: 'Future<bool> isEnabled()',
          description: 'Checks if pull-to-refresh is enabled.',
          className: className,
        ),
        ApiMethodDefinition(
          name: CygnusPlatformPullToRefreshControllerMethod.beginRefreshing.name,
          signature: 'Future<void> beginRefreshing()',
          description: 'Starts the refresh animation.',
          className: className,
        ),
        ApiMethodDefinition(
          name: CygnusPlatformPullToRefreshControllerMethod.endRefreshing.name,
          signature: 'Future<void> endRefreshing()',
          description: 'Stops the refresh animation.',
          className: className,
        ),
        ApiMethodDefinition(
          name: CygnusPlatformPullToRefreshControllerMethod.isRefreshing.name,
          signature: 'Future<bool> isRefreshing()',
          description: 'Checks if currently refreshing.',
          className: className,
        ),
        ApiMethodDefinition(
          name: CygnusPlatformPullToRefreshControllerMethod.setColor.name,
          signature: 'Future<void> setColor(Color color)',
          description: 'Sets the indicator color.',
          className: className,
        ),
        ApiMethodDefinition(
          name: CygnusPlatformPullToRefreshControllerMethod.setBackgroundColor.name,
          signature: 'Future<void> setBackgroundColor(Color color)',
          description: 'Sets the background color.',
          className: className,
        ),
        ApiMethodDefinition(
          name: CygnusPlatformPullToRefreshControllerMethod
              .setDistanceToTriggerSync
              .name,
          signature:
              'Future<void> setDistanceToTriggerSync(double distanceToTrigger)',
          description: 'Sets the distance to trigger refresh.',
          className: className,
        ),
        ApiMethodDefinition(
          name: CygnusPlatformPullToRefreshControllerMethod.setSlingshotDistance.name,
          signature:
              'Future<void> setSlingshotDistance(double slingshotDistance)',
          description: 'Sets the slingshot distance.',
          className: className,
        ),
        ApiMethodDefinition(
          name: CygnusPlatformPullToRefreshControllerMethod
              .getDefaultSlingshotDistance
              .name,
          signature: 'Future<double> getDefaultSlingshotDistance()',
          description: 'Gets the default slingshot distance.',
          className: className,
        ),
        ApiMethodDefinition(
          name: CygnusPlatformPullToRefreshControllerMethod.setIndicatorSize.name,
          signature: 'Future<void> setIndicatorSize(CygnusPullToRefreshSize size)',
          description: 'Sets the indicator size.',
          className: className,
        ),
        ApiMethodDefinition(
          name: CygnusPlatformPullToRefreshControllerMethod.dispose.name,
          signature: 'void dispose()',
          description: 'Disposes the controller.',
          className: className,
        ),
      ],
      events: [
        ApiEventDefinition(
          name: CygnusPlatformPullToRefreshControllerCreationParamsProperty
              .onRefresh
              .name,
          description: 'Called when a refresh is triggered.',
          className: className,
        ),
      ],
    );
  }

  static ApiClassDefinition _getPrintJobControllerDefinition() {
    final className = classNameOf(CygnusPrintJobController);
    return ApiClassDefinition(
      className: className,
      description: 'Controls print jobs.',
      isClassSupported: () => CygnusPrintJobController.isClassSupported(),
      methods: [
        ApiMethodDefinition(
          name: CygnusPlatformPrintJobControllerMethod.cancel.name,
          signature: 'Future<void> cancel()',
          description: 'Cancels the print job.',
          className: className,
        ),
        ApiMethodDefinition(
          name: CygnusPlatformPrintJobControllerMethod.restart.name,
          signature: 'Future<void> restart()',
          description: 'Restarts the print job.',
          className: className,
        ),
        ApiMethodDefinition(
          name: CygnusPlatformPrintJobControllerMethod.dismiss.name,
          signature: 'Future<void> dismiss({bool animated = true})',
          description: 'Dismisses the print interface.',
          className: className,
        ),
        ApiMethodDefinition(
          name: CygnusPlatformPrintJobControllerMethod.getInfo.name,
          signature: 'Future<CygnusPrintJobInfo?> getInfo()',
          description: 'Gets the print job info.',
          className: className,
        ),
      ],
      events: [
        ApiEventDefinition(
          name: CygnusPlatformPrintJobControllerProperty.onComplete.name,
          description: 'Called when the print job completes.',
          className: className,
        ),
      ],
    );
  }

  static ApiClassDefinition _getWebAuthenticationSessionDefinition() {
    final className = classNameOf(CygnusWebAuthenticationSession);
    return ApiClassDefinition(
      className: className,
      description: 'Handles web authentication sessions.',
      isClassSupported: () => CygnusWebAuthenticationSession.isClassSupported(),
      methods: [
        ApiMethodDefinition(
          name: CygnusPlatformWebAuthenticationSessionMethod.create.name,
          signature:
              'static Future<${CygnusWebAuthenticationSession}> ${CygnusPlatformWebAuthenticationSessionMethod.create.name}({...})',
          description: 'Creates a new authentication session.',
          className: className,
          isStatic: true,
        ),
        ApiMethodDefinition(
          name: CygnusPlatformWebAuthenticationSessionMethod.canStart.name,
          signature: 'Future<bool> canStart()',
          description: 'Checks if the session can start.',
          className: className,
        ),
        ApiMethodDefinition(
          name: CygnusPlatformWebAuthenticationSessionMethod.start.name,
          signature: 'Future<void> start()',
          description: 'Starts the authentication session.',
          className: className,
        ),
        ApiMethodDefinition(
          name: CygnusPlatformWebAuthenticationSessionMethod.cancel.name,
          signature: 'Future<void> cancel()',
          description: 'Cancels the session.',
          className: className,
        ),
        ApiMethodDefinition(
          name: CygnusPlatformWebAuthenticationSessionMethod.dispose.name,
          signature: 'Future<void> dispose()',
          description: 'Disposes the session.',
          className: className,
        ),
        ApiMethodDefinition(
          name: CygnusPlatformWebAuthenticationSessionMethod.isAvailable.name,
          signature: 'static Future<bool> isAvailable()',
          description: 'Checks if web authentication is available.',
          className: className,
          isStatic: true,
        ),
      ],
      events: [
        ApiEventDefinition(
          name: CygnusPlatformWebAuthenticationSessionProperty.onComplete.name,
          description: 'Called when authentication completes.',
          className: className,
        ),
      ],
    );
  }

  static ApiClassDefinition _getServiceWorkerControllerDefinition() {
    final className = classNameOf(CygnusServiceWorkerController);
    return ApiClassDefinition(
      className: className,
      description: 'Controls service workers.',
      isClassSupported: () => CygnusServiceWorkerController.isClassSupported(),
      methods: [
        ApiMethodDefinition(
          name:
              CygnusPlatformServiceWorkerControllerMethod.setServiceWorkerClient.name,
          signature:
              'Future<void> setServiceWorkerClient(CygnusServiceWorkerClient? value)',
          description: 'Sets the service worker client.',
          className: className,
        ),
        ApiMethodDefinition(
          name:
              CygnusPlatformServiceWorkerControllerMethod.getAllowContentAccess.name,
          signature: 'Future<bool> getAllowContentAccess()',
          description: 'Gets allow content access setting.',
          className: className,
        ),
        ApiMethodDefinition(
          name:
              CygnusPlatformServiceWorkerControllerMethod.setAllowContentAccess.name,
          signature: 'Future<void> setAllowContentAccess(bool allow)',
          description: 'Sets allow content access setting.',
          className: className,
        ),
        ApiMethodDefinition(
          name: CygnusPlatformServiceWorkerControllerMethod.getAllowFileAccess.name,
          signature: 'Future<bool> getAllowFileAccess()',
          description: 'Gets allow file access setting.',
          className: className,
        ),
        ApiMethodDefinition(
          name: CygnusPlatformServiceWorkerControllerMethod.setAllowFileAccess.name,
          signature: 'Future<void> setAllowFileAccess(bool allow)',
          description: 'Sets allow file access setting.',
          className: className,
        ),
        ApiMethodDefinition(
          name: CygnusPlatformServiceWorkerControllerMethod.getBlockNetworkLoads.name,
          signature: 'Future<bool> getBlockNetworkLoads()',
          description: 'Gets block network loads setting.',
          className: className,
        ),
        ApiMethodDefinition(
          name: CygnusPlatformServiceWorkerControllerMethod.setBlockNetworkLoads.name,
          signature: 'Future<void> setBlockNetworkLoads(bool block)',
          description: 'Sets block network loads setting.',
          className: className,
        ),
      ],
      events: [
        ApiEventDefinition(
          name: CygnusServiceWorkerClientProperty.shouldInterceptRequest.name,
          description: 'Called to intercept service worker requests.',
          className: className,
        ),
      ],
    );
  }

  static ApiClassDefinition _getProxyControllerDefinition() {
    final className = classNameOf(CygnusProxyController);
    return ApiClassDefinition(
      className: className,
      description: 'Controls proxy settings.',
      isClassSupported: () => CygnusProxyController.isClassSupported(),
      methods: [
        ApiMethodDefinition(
          name: CygnusPlatformProxyControllerMethod.setProxyOverride.name,
          signature:
              'Future<void> setProxyOverride({required CygnusProxySettings settings})',
          description: 'Sets the proxy override.',
          className: className,
        ),
        ApiMethodDefinition(
          name: CygnusPlatformProxyControllerMethod.clearProxyOverride.name,
          signature: 'Future<void> clearProxyOverride()',
          description: 'Clears the proxy override.',
          className: className,
        ),
      ],
    );
  }

  static ApiClassDefinition _getTracingControllerDefinition() {
    final className = classNameOf(CygnusTracingController);
    return ApiClassDefinition(
      className: className,
      description: 'Controls tracing.',
      isClassSupported: () => CygnusTracingController.isClassSupported(),
      methods: [
        ApiMethodDefinition(
          name: CygnusPlatformTracingControllerMethod.start.name,
          signature: 'Future<void> start({required CygnusTracingSettings settings})',
          description: 'Starts tracing.',
          className: className,
        ),
        ApiMethodDefinition(
          name: CygnusPlatformTracingControllerMethod.stop.name,
          signature: 'Future<bool> stop({String? filePath})',
          description: 'Stops tracing.',
          className: className,
        ),
        ApiMethodDefinition(
          name: CygnusPlatformTracingControllerMethod.isTracing.name,
          signature: 'Future<bool> isTracing()',
          description: 'Checks if tracing is active.',
          className: className,
        ),
      ],
    );
  }

  static ApiClassDefinition _getHttpAuthCredentialDatabaseDefinition() {
    final className = classNameOf(CygnusHttpAuthCredentialDatabase);
    return ApiClassDefinition(
      className: className,
      description: 'Manages HTTP authentication credentials.',
      isClassSupported: () => CygnusHttpAuthCredentialDatabase.isClassSupported(),
      methods: [
        ApiMethodDefinition(
          name: CygnusPlatformHttpAuthCredentialDatabaseMethod
              .getAllAuthCredentials
              .name,
          signature:
              'Future<List<CygnusURLProtectionSpaceHttpAuthCredentials>> getAllAuthCredentials()',
          description: 'Gets all stored credentials.',
          className: className,
        ),
        ApiMethodDefinition(
          name: CygnusPlatformHttpAuthCredentialDatabaseMethod
              .getHttpAuthCredentials
              .name,
          signature:
              'Future<List<CygnusURLCredential>> getHttpAuthCredentials({...})',
          description: 'Gets credentials for a protection space.',
          className: className,
        ),
        ApiMethodDefinition(
          name: CygnusPlatformHttpAuthCredentialDatabaseMethod
              .setHttpAuthCredential
              .name,
          signature: 'Future<void> setHttpAuthCredential({...})',
          description: 'Sets a credential.',
          className: className,
        ),
        ApiMethodDefinition(
          name: CygnusPlatformHttpAuthCredentialDatabaseMethod
              .removeHttpAuthCredential
              .name,
          signature: 'Future<void> removeHttpAuthCredential({...})',
          description: 'Removes a credential.',
          className: className,
        ),
        ApiMethodDefinition(
          name: CygnusPlatformHttpAuthCredentialDatabaseMethod
              .removeHttpAuthCredentials
              .name,
          signature: 'Future<void> removeHttpAuthCredentials({...})',
          description: 'Removes all credentials for a protection space.',
          className: className,
        ),
        ApiMethodDefinition(
          name: CygnusPlatformHttpAuthCredentialDatabaseMethod
              .clearAllAuthCredentials
              .name,
          signature: 'Future<void> clearAllAuthCredentials()',
          description: 'Clears all credentials.',
          className: className,
        ),
      ],
    );
  }

  static ApiClassDefinition _getWebViewEnvironmentDefinition() {
    final className = classNameOf(CygnusWebViewEnvironment);
    return ApiClassDefinition(
      className: className,
      description: 'WebView2 environment for Windows.',
      isClassSupported: () => CygnusWebViewEnvironment.isClassSupported(),
      methods: [
        ApiMethodDefinition(
          name: CygnusPlatformWebViewEnvironmentMethod.create.name,
          signature:
              'static Future<${CygnusWebViewEnvironment}> ${CygnusPlatformWebViewEnvironmentMethod.create.name}({...})',
          description: 'Creates a WebView environment.',
          className: className,
          isStatic: true,
        ),
        ApiMethodDefinition(
          name: CygnusPlatformWebViewEnvironmentMethod.getAvailableVersion.name,
          signature:
              'static Future<String?> getAvailableVersion({String? browserExecutableFolder})',
          description: 'Gets the available WebView2 version.',
          className: className,
          isStatic: true,
        ),
        ApiMethodDefinition(
          name: CygnusPlatformWebViewEnvironmentMethod.getProcessInfos.name,
          signature: 'Future<List<CygnusBrowserProcessInfo>> getProcessInfos()',
          description: 'Gets running process information.',
          className: className,
        ),
        ApiMethodDefinition(
          name: CygnusPlatformWebViewEnvironmentMethod.compareBrowserVersions.name,
          signature: 'static Future<int> compareBrowserVersions({...})',
          description: 'Compares browser versions.',
          className: className,
          isStatic: true,
        ),
        ApiMethodDefinition(
          name: CygnusPlatformWebViewEnvironmentMethod.dispose.name,
          signature: 'Future<void> dispose()',
          description: 'Disposes the environment.',
          className: className,
        ),
      ],
      events: [
        ApiEventDefinition(
          name: CygnusPlatformWebViewEnvironmentProperty.onBrowserProcessExited.name,
          description: 'Called when the browser process exits.',
          className: className,
        ),
        ApiEventDefinition(
          name: CygnusPlatformWebViewEnvironmentProperty.onProcessInfosChanged.name,
          description: 'Called when process info changes.',
          className: className,
        ),
        ApiEventDefinition(
          name: CygnusPlatformWebViewEnvironmentProperty
              .onNewBrowserVersionAvailable
              .name,
          description: 'Called when a new browser version is available.',
          className: className,
        ),
      ],
    );
  }

  static ApiClassDefinition _getProcessGlobalConfigDefinition() {
    final className = classNameOf(CygnusProcessGlobalConfig);
    return ApiClassDefinition(
      className: className,
      description: 'Global process configuration for Android.',
      isClassSupported: () => CygnusProcessGlobalConfig.isClassSupported(),
      methods: [
        ApiMethodDefinition(
          name: CygnusPlatformProcessGlobalConfigMethod.apply.name,
          signature:
              'Future<void> ${CygnusPlatformProcessGlobalConfigMethod.apply.name}({required ${CygnusProcessGlobalConfigSettings} settings})',
          description: 'Applies global configuration settings.',
          className: className,
        ),
      ],
    );
  }

  static ApiClassDefinition _getWebMessageChannelDefinition() {
    final className = classNameOf(CygnusWebMessageChannel);
    return ApiClassDefinition(
      className: className,
      description: 'HTML5 message channel for two-way communication.',
      isClassSupported: () => CygnusWebMessageChannel.isClassSupported(),
      methods: [
        ApiMethodDefinition(
          name: CygnusPlatformWebMessageChannelMethod.dispose.name,
          signature: 'void dispose()',
          description: 'Disposes the channel.',
          className: className,
        ),
      ],
    );
  }
}
