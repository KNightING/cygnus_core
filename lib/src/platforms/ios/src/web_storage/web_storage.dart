import 'dart:convert';

import 'package:cygnus_core/src/platform_interface/flutter_webview_platform_interface.dart';

import '../webview/webview_controller.dart';

/// Object specifying creation parameters for creating a [IOSWebStorage].
///
/// When adding additional fields make sure they can be null or have a default
/// value to avoid breaking changes. See [CygnusPlatformWebStorageCreationParams] for
/// more information.
class IOSWebStorageCreationParams extends CygnusPlatformWebStorageCreationParams {
  /// Creates a new [IOSWebStorageCreationParams] instance.
  IOSWebStorageCreationParams({
    required super.localStorage,
    required super.sessionStorage,
  });

  /// Creates a [IOSWebStorageCreationParams] instance based on [CygnusPlatformWebStorageCreationParams].
  factory IOSWebStorageCreationParams.fromPlatformWebStorageCreationParams(
    // Recommended placeholder to prevent being broken by platform interface.
    // ignore: avoid_unused_constructor_parameters
    CygnusPlatformWebStorageCreationParams params,
  ) {
    return IOSWebStorageCreationParams(
      localStorage: params.localStorage,
      sessionStorage: params.sessionStorage,
    );
  }
}

///{@macro cygnus_core.CygnusPlatformWebStorage}
class IOSWebStorage extends CygnusPlatformWebStorage {
  /// Constructs a [IOSWebStorage].
  IOSWebStorage(CygnusPlatformWebStorageCreationParams params)
    : super.implementation(
        params is IOSWebStorageCreationParams
            ? params
            : IOSWebStorageCreationParams.fromPlatformWebStorageCreationParams(
                params,
              ),
      );

  @override
  CygnusPlatformLocalStorage get localStorage => params.localStorage;

  @override
  CygnusPlatformSessionStorage get sessionStorage => params.sessionStorage;

  @override
  void dispose() {
    localStorage.dispose();
    sessionStorage.dispose();
  }
}

/// Object specifying creation parameters for creating a [IOSStorage].
///
/// When adding additional fields make sure they can be null or have a default
/// value to avoid breaking changes. See [CygnusPlatformStorageCreationParams] for
/// more information.
class IOSStorageCreationParams extends CygnusPlatformStorageCreationParams {
  /// Creates a new [IOSStorageCreationParams] instance.
  IOSStorageCreationParams({
    required super.controller,
    required super.webStorageType,
  });

  /// Creates a [IOSStorageCreationParams] instance based on [CygnusPlatformStorageCreationParams].
  factory IOSStorageCreationParams.fromPlatformStorageCreationParams(
    // Recommended placeholder to prevent being broken by platform interface.
    // ignore: avoid_unused_constructor_parameters
    CygnusPlatformStorageCreationParams params,
  ) {
    return IOSStorageCreationParams(
      controller: params.controller,
      webStorageType: params.webStorageType,
    );
  }
}

///{@macro cygnus_core.CygnusPlatformStorage}
abstract mixin class IOSStorage implements CygnusPlatformStorage {
  @override
  IOSInAppWebViewController? controller;

  @override
  Future<int?> length() async {
    var result = await controller?.evaluateJavascript(
      source:
          """
    window.$webStorageType.length;
    """,
    );
    return result != null ? int.parse(json.decode(result)) : null;
  }

  @override
  Future<void> setItem({required String key, required dynamic value}) async {
    var encodedValue = json.encode(value);
    await controller?.evaluateJavascript(
      source:
          """
    window.$webStorageType.setItem("$key", ${value is String ? encodedValue : "JSON.stringify($encodedValue)"});
    """,
    );
  }

  @override
  Future<dynamic> getItem({required String key}) async {
    var itemValue = await controller?.evaluateJavascript(
      source:
          """
    window.$webStorageType.getItem("$key");
    """,
    );

    if (itemValue == null) {
      return null;
    }

    try {
      return json.decode(itemValue);
    } catch (e) {}

    return itemValue;
  }

  @override
  Future<void> removeItem({required String key}) async {
    await controller?.evaluateJavascript(
      source:
          """
    window.$webStorageType.removeItem("$key");
    """,
    );
  }

  @override
  Future<List<CygnusWebStorageItem>> getItems() async {
    var webStorageItems = <CygnusWebStorageItem>[];

    List<Map<dynamic, dynamic>>? items = (await controller?.evaluateJavascript(
      source:
          """
(function() {
  var webStorageItems = [];
  for(var i = 0; i < window.$webStorageType.length; i++){
    var key = window.$webStorageType.key(i);
    webStorageItems.push(
      {
        key: key,
        value: window.$webStorageType.getItem(key)
      }
    );
  }
  return webStorageItems;
})();
    """,
    ))?.cast<Map<dynamic, dynamic>>();

    if (items == null) {
      return webStorageItems;
    }

    for (var item in items) {
      webStorageItems.add(
        CygnusWebStorageItem(key: item["key"], value: item["value"]),
      );
    }

    return webStorageItems;
  }

  @override
  Future<void> clear() async {
    await controller?.evaluateJavascript(
      source:
          """
    window.$webStorageType.clear();
    """,
    );
  }

  @override
  Future<String> key({required int index}) async {
    var result = await controller?.evaluateJavascript(
      source:
          """
    window.$webStorageType.key($index);
    """,
    );
    return result != null ? json.decode(result) : null;
  }

  @override
  void dispose() {
    controller = null;
  }
}

/// Object specifying creation parameters for creating a [IOSLocalStorage].
///
/// When adding additional fields make sure they can be null or have a default
/// value to avoid breaking changes. See [CygnusPlatformLocalStorageCreationParams] for
/// more information.
class IOSLocalStorageCreationParams extends CygnusPlatformLocalStorageCreationParams {
  /// Creates a new [IOSLocalStorageCreationParams] instance.
  IOSLocalStorageCreationParams(super.params);

  /// Creates a [IOSLocalStorageCreationParams] instance based on [CygnusPlatformLocalStorageCreationParams].
  factory IOSLocalStorageCreationParams.fromPlatformLocalStorageCreationParams(
    // Recommended placeholder to prevent being broken by platform interface.
    // ignore: avoid_unused_constructor_parameters
    CygnusPlatformLocalStorageCreationParams params,
  ) {
    return IOSLocalStorageCreationParams(params);
  }
}

///{@macro cygnus_core.CygnusPlatformLocalStorage}
class IOSLocalStorage extends CygnusPlatformLocalStorage with IOSStorage {
  /// Constructs a [IOSLocalStorage].
  IOSLocalStorage(CygnusPlatformLocalStorageCreationParams params)
    : super.implementation(
        params is IOSLocalStorageCreationParams
            ? params
            : IOSLocalStorageCreationParams.fromPlatformLocalStorageCreationParams(
                params,
              ),
      );

  /// Default storage
  factory IOSLocalStorage.defaultStorage({
    required CygnusPlatformWebViewController? controller,
  }) {
    return IOSLocalStorage(
      IOSLocalStorageCreationParams(
        CygnusPlatformLocalStorageCreationParams(
          CygnusPlatformStorageCreationParams(
            controller: controller,
            webStorageType: CygnusWebStorageType.LOCAL_STORAGE,
          ),
        ),
      ),
    );
  }

  @override
  IOSInAppWebViewController? get controller =>
      params.controller as IOSInAppWebViewController?;
}

/// Object specifying creation parameters for creating a [IOSSessionStorage].
///
/// When adding additional fields make sure they can be null or have a default
/// value to avoid breaking changes. See [CygnusPlatformSessionStorageCreationParams] for
/// more information.
class IOSSessionStorageCreationParams
    extends CygnusPlatformSessionStorageCreationParams {
  /// Creates a new [IOSSessionStorageCreationParams] instance.
  IOSSessionStorageCreationParams(super.params);

  /// Creates a [IOSSessionStorageCreationParams] instance based on [CygnusPlatformSessionStorageCreationParams].
  factory IOSSessionStorageCreationParams.fromPlatformSessionStorageCreationParams(
    // Recommended placeholder to prevent being broken by platform interface.
    // ignore: avoid_unused_constructor_parameters
    CygnusPlatformSessionStorageCreationParams params,
  ) {
    return IOSSessionStorageCreationParams(params);
  }
}

///{@macro cygnus_core.CygnusPlatformSessionStorage}
class IOSSessionStorage extends CygnusPlatformSessionStorage with IOSStorage {
  /// Constructs a [IOSSessionStorage].
  IOSSessionStorage(CygnusPlatformSessionStorageCreationParams params)
    : super.implementation(
        params is IOSSessionStorageCreationParams
            ? params
            : IOSSessionStorageCreationParams.fromPlatformSessionStorageCreationParams(
                params,
              ),
      );

  /// Default storage
  factory IOSSessionStorage.defaultStorage({
    required CygnusPlatformWebViewController? controller,
  }) {
    return IOSSessionStorage(
      IOSSessionStorageCreationParams(
        CygnusPlatformSessionStorageCreationParams(
          CygnusPlatformStorageCreationParams(
            controller: controller,
            webStorageType: CygnusWebStorageType.SESSION_STORAGE,
          ),
        ),
      ),
    );
  }

  @override
  IOSInAppWebViewController? get controller =>
      params.controller as IOSInAppWebViewController?;
}
