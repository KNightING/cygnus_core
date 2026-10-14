import 'dart:convert';

import 'package:cygnus_core/src/platform_interface/flutter_inappwebview_platform_interface.dart';

import '../in_app_webview/in_app_webview_controller.dart';

/// Object specifying creation parameters for creating a [WindowsWebStorage].
///
/// When adding additional fields make sure they can be null or have a default
/// value to avoid breaking changes. See [CygnusPlatformWebStorageCreationParams] for
/// more information.
class WindowsWebStorageCreationParams extends CygnusPlatformWebStorageCreationParams {
  /// Creates a new [WindowsWebStorageCreationParams] instance.
  WindowsWebStorageCreationParams({
    required super.localStorage,
    required super.sessionStorage,
  });

  /// Creates a [WindowsWebStorageCreationParams] instance based on [CygnusPlatformWebStorageCreationParams].
  factory WindowsWebStorageCreationParams.fromPlatformWebStorageCreationParams(
    // Recommended placeholder to prevent being broken by platform interface.
    // ignore: avoid_unused_constructor_parameters
    CygnusPlatformWebStorageCreationParams params,
  ) {
    return WindowsWebStorageCreationParams(
      localStorage: params.localStorage,
      sessionStorage: params.sessionStorage,
    );
  }
}

///{@macro cygnus_core.CygnusPlatformWebStorage}
class WindowsWebStorage extends CygnusPlatformWebStorage {
  /// Constructs a [WindowsWebStorage].
  WindowsWebStorage(CygnusPlatformWebStorageCreationParams params)
    : super.implementation(
        params is WindowsWebStorageCreationParams
            ? params
            : WindowsWebStorageCreationParams.fromPlatformWebStorageCreationParams(
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

/// Object specifying creation parameters for creating a [WindowsStorage].
///
/// When adding additional fields make sure they can be null or have a default
/// value to avoid breaking changes. See [CygnusPlatformStorageCreationParams] for
/// more information.
class WindowsStorageCreationParams extends CygnusPlatformStorageCreationParams {
  /// Creates a new [WindowsStorageCreationParams] instance.
  WindowsStorageCreationParams({
    required super.controller,
    required super.webStorageType,
  });

  /// Creates a [WindowsStorageCreationParams] instance based on [CygnusPlatformStorageCreationParams].
  factory WindowsStorageCreationParams.fromPlatformStorageCreationParams(
    // Recommended placeholder to prevent being broken by platform interface.
    // ignore: avoid_unused_constructor_parameters
    CygnusPlatformStorageCreationParams params,
  ) {
    return WindowsStorageCreationParams(
      controller: params.controller,
      webStorageType: params.webStorageType,
    );
  }
}

///{@macro cygnus_core.CygnusPlatformStorage}
abstract mixin class WindowsStorage implements CygnusPlatformStorage {
  @override
  WindowsInAppWebViewController? controller;

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

/// Object specifying creation parameters for creating a [WindowsLocalStorage].
///
/// When adding additional fields make sure they can be null or have a default
/// value to avoid breaking changes. See [CygnusPlatformLocalStorageCreationParams] for
/// more information.
class WindowsLocalStorageCreationParams
    extends CygnusPlatformLocalStorageCreationParams {
  /// Creates a new [WindowsLocalStorageCreationParams] instance.
  WindowsLocalStorageCreationParams(super.params);

  /// Creates a [WindowsLocalStorageCreationParams] instance based on [CygnusPlatformLocalStorageCreationParams].
  factory WindowsLocalStorageCreationParams.fromPlatformLocalStorageCreationParams(
    // Recommended placeholder to prevent being broken by platform interface.
    // ignore: avoid_unused_constructor_parameters
    CygnusPlatformLocalStorageCreationParams params,
  ) {
    return WindowsLocalStorageCreationParams(params);
  }
}

///{@macro cygnus_core.CygnusPlatformLocalStorage}
class WindowsLocalStorage extends CygnusPlatformLocalStorage with WindowsStorage {
  /// Constructs a [WindowsLocalStorage].
  WindowsLocalStorage(CygnusPlatformLocalStorageCreationParams params)
    : super.implementation(
        params is WindowsLocalStorageCreationParams
            ? params
            : WindowsLocalStorageCreationParams.fromPlatformLocalStorageCreationParams(
                params,
              ),
      );

  /// Default storage
  factory WindowsLocalStorage.defaultStorage({
    required CygnusPlatformWebViewController? controller,
  }) {
    return WindowsLocalStorage(
      WindowsLocalStorageCreationParams(
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
  WindowsInAppWebViewController? get controller =>
      params.controller as WindowsInAppWebViewController?;
}

/// Object specifying creation parameters for creating a [WindowsSessionStorage].
///
/// When adding additional fields make sure they can be null or have a default
/// value to avoid breaking changes. See [CygnusPlatformSessionStorageCreationParams] for
/// more information.
class WindowsSessionStorageCreationParams
    extends CygnusPlatformSessionStorageCreationParams {
  /// Creates a new [WindowsSessionStorageCreationParams] instance.
  WindowsSessionStorageCreationParams(super.params);

  /// Creates a [WindowsSessionStorageCreationParams] instance based on [CygnusPlatformSessionStorageCreationParams].
  factory WindowsSessionStorageCreationParams.fromPlatformSessionStorageCreationParams(
    // Recommended placeholder to prevent being broken by platform interface.
    // ignore: avoid_unused_constructor_parameters
    CygnusPlatformSessionStorageCreationParams params,
  ) {
    return WindowsSessionStorageCreationParams(params);
  }
}

///{@macro cygnus_core.CygnusPlatformSessionStorage}
class WindowsSessionStorage extends CygnusPlatformSessionStorage with WindowsStorage {
  /// Constructs a [WindowsSessionStorage].
  WindowsSessionStorage(CygnusPlatformSessionStorageCreationParams params)
    : super.implementation(
        params is WindowsSessionStorageCreationParams
            ? params
            : WindowsSessionStorageCreationParams.fromPlatformSessionStorageCreationParams(
                params,
              ),
      );

  /// Default storage
  factory WindowsSessionStorage.defaultStorage({
    required CygnusPlatformWebViewController? controller,
  }) {
    return WindowsSessionStorage(
      WindowsSessionStorageCreationParams(
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
  WindowsInAppWebViewController? get controller =>
      params.controller as WindowsInAppWebViewController?;
}
