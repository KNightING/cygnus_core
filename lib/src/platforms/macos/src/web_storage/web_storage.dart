import 'dart:convert';

import 'package:cygnus_core/src/platform_interface/flutter_webview_platform_interface.dart';

import '../webview/webview_controller.dart';

/// Object specifying creation parameters for creating a [MacOSWebStorage].
///
/// When adding additional fields make sure they can be null or have a default
/// value to avoid breaking changes. See [CygnusPlatformWebStorageCreationParams] for
/// more information.
class MacOSWebStorageCreationParams extends CygnusPlatformWebStorageCreationParams {
  /// Creates a new [MacOSWebStorageCreationParams] instance.
  MacOSWebStorageCreationParams({
    required super.localStorage,
    required super.sessionStorage,
  });

  /// Creates a [MacOSWebStorageCreationParams] instance based on [CygnusPlatformWebStorageCreationParams].
  factory MacOSWebStorageCreationParams.fromPlatformWebStorageCreationParams(
    // Recommended placeholder to prevent being broken by platform interface.
    // ignore: avoid_unused_constructor_parameters
    CygnusPlatformWebStorageCreationParams params,
  ) {
    return MacOSWebStorageCreationParams(
      localStorage: params.localStorage,
      sessionStorage: params.sessionStorage,
    );
  }
}

///{@macro cygnus_core.CygnusPlatformWebStorage}
class MacOSWebStorage extends CygnusPlatformWebStorage {
  /// Constructs a [MacOSWebStorage].
  MacOSWebStorage(CygnusPlatformWebStorageCreationParams params)
    : super.implementation(
        params is MacOSWebStorageCreationParams
            ? params
            : MacOSWebStorageCreationParams.fromPlatformWebStorageCreationParams(
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

/// Object specifying creation parameters for creating a [MacOSStorage].
///
/// When adding additional fields make sure they can be null or have a default
/// value to avoid breaking changes. See [CygnusPlatformStorageCreationParams] for
/// more information.
class MacOSStorageCreationParams extends CygnusPlatformStorageCreationParams {
  /// Creates a new [MacOSStorageCreationParams] instance.
  MacOSStorageCreationParams({
    required super.controller,
    required super.webStorageType,
  });

  /// Creates a [MacOSStorageCreationParams] instance based on [CygnusPlatformStorageCreationParams].
  factory MacOSStorageCreationParams.fromPlatformStorageCreationParams(
    // Recommended placeholder to prevent being broken by platform interface.
    // ignore: avoid_unused_constructor_parameters
    CygnusPlatformStorageCreationParams params,
  ) {
    return MacOSStorageCreationParams(
      controller: params.controller,
      webStorageType: params.webStorageType,
    );
  }
}

///{@macro cygnus_core.CygnusPlatformStorage}
abstract mixin class MacOSStorage implements CygnusPlatformStorage {
  @override
  CygnusMacOSWebViewController? controller;

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

/// Object specifying creation parameters for creating a [MacOSLocalStorage].
///
/// When adding additional fields make sure they can be null or have a default
/// value to avoid breaking changes. See [CygnusPlatformLocalStorageCreationParams] for
/// more information.
class MacOSLocalStorageCreationParams
    extends CygnusPlatformLocalStorageCreationParams {
  /// Creates a new [MacOSLocalStorageCreationParams] instance.
  MacOSLocalStorageCreationParams(super.params);

  /// Creates a [MacOSLocalStorageCreationParams] instance based on [CygnusPlatformLocalStorageCreationParams].
  factory MacOSLocalStorageCreationParams.fromPlatformLocalStorageCreationParams(
    // Recommended placeholder to prevent being broken by platform interface.
    // ignore: avoid_unused_constructor_parameters
    CygnusPlatformLocalStorageCreationParams params,
  ) {
    return MacOSLocalStorageCreationParams(params);
  }
}

///{@macro cygnus_core.CygnusPlatformLocalStorage}
class MacOSLocalStorage extends CygnusPlatformLocalStorage with MacOSStorage {
  /// Constructs a [MacOSLocalStorage].
  MacOSLocalStorage(CygnusPlatformLocalStorageCreationParams params)
    : super.implementation(
        params is MacOSLocalStorageCreationParams
            ? params
            : MacOSLocalStorageCreationParams.fromPlatformLocalStorageCreationParams(
                params,
              ),
      );

  /// Default storage
  factory MacOSLocalStorage.defaultStorage({
    required CygnusPlatformWebViewController? controller,
  }) {
    return MacOSLocalStorage(
      MacOSLocalStorageCreationParams(
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
  CygnusMacOSWebViewController? get controller =>
      params.controller as CygnusMacOSWebViewController?;
}

/// Object specifying creation parameters for creating a [MacOSSessionStorage].
///
/// When adding additional fields make sure they can be null or have a default
/// value to avoid breaking changes. See [CygnusPlatformSessionStorageCreationParams] for
/// more information.
class MacOSSessionStorageCreationParams
    extends CygnusPlatformSessionStorageCreationParams {
  /// Creates a new [MacOSSessionStorageCreationParams] instance.
  MacOSSessionStorageCreationParams(super.params);

  /// Creates a [MacOSSessionStorageCreationParams] instance based on [CygnusPlatformSessionStorageCreationParams].
  factory MacOSSessionStorageCreationParams.fromPlatformSessionStorageCreationParams(
    // Recommended placeholder to prevent being broken by platform interface.
    // ignore: avoid_unused_constructor_parameters
    CygnusPlatformSessionStorageCreationParams params,
  ) {
    return MacOSSessionStorageCreationParams(params);
  }
}

///{@macro cygnus_core.CygnusPlatformSessionStorage}
class MacOSSessionStorage extends CygnusPlatformSessionStorage with MacOSStorage {
  /// Constructs a [MacOSSessionStorage].
  MacOSSessionStorage(CygnusPlatformSessionStorageCreationParams params)
    : super.implementation(
        params is MacOSSessionStorageCreationParams
            ? params
            : MacOSSessionStorageCreationParams.fromPlatformSessionStorageCreationParams(
                params,
              ),
      );

  /// Default storage
  factory MacOSSessionStorage.defaultStorage({
    required CygnusPlatformWebViewController? controller,
  }) {
    return MacOSSessionStorage(
      MacOSSessionStorageCreationParams(
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
  CygnusMacOSWebViewController? get controller =>
      params.controller as CygnusMacOSWebViewController?;
}
