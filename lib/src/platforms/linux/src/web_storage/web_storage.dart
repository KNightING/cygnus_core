import 'dart:convert';

import 'package:cygnus_core/src/platform_interface/flutter_webview_platform_interface.dart';

import '../webview/webview_controller.dart';

/// Object specifying creation parameters for creating a [LinuxWebStorage].
///
/// When adding additional fields make sure they can be null or have a default
/// value to avoid breaking changes. See [CygnusPlatformWebStorageCreationParams] for
/// more information.
class LinuxWebStorageCreationParams extends CygnusPlatformWebStorageCreationParams {
  /// Creates a new [LinuxWebStorageCreationParams] instance.
  LinuxWebStorageCreationParams({
    required super.localStorage,
    required super.sessionStorage,
  });

  /// Creates a [LinuxWebStorageCreationParams] instance based on [CygnusPlatformWebStorageCreationParams].
  factory LinuxWebStorageCreationParams.fromPlatformWebStorageCreationParams(
    // Recommended placeholder to prevent being broken by platform interface.
    // ignore: avoid_unused_constructor_parameters
    CygnusPlatformWebStorageCreationParams params,
  ) {
    return LinuxWebStorageCreationParams(
      localStorage: params.localStorage,
      sessionStorage: params.sessionStorage,
    );
  }
}

///{@macro cygnus_core.CygnusPlatformWebStorage}
class LinuxWebStorage extends CygnusPlatformWebStorage {
  /// Constructs a [LinuxWebStorage].
  LinuxWebStorage(CygnusPlatformWebStorageCreationParams params)
    : super.implementation(
        params is LinuxWebStorageCreationParams
            ? params
            : LinuxWebStorageCreationParams.fromPlatformWebStorageCreationParams(
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

/// Object specifying creation parameters for creating a [LinuxStorage].
///
/// When adding additional fields make sure they can be null or have a default
/// value to avoid breaking changes. See [CygnusPlatformStorageCreationParams] for
/// more information.
class LinuxStorageCreationParams extends CygnusPlatformStorageCreationParams {
  /// Creates a new [LinuxStorageCreationParams] instance.
  LinuxStorageCreationParams({
    required super.controller,
    required super.webStorageType,
  });

  /// Creates a [LinuxStorageCreationParams] instance based on [CygnusPlatformStorageCreationParams].
  factory LinuxStorageCreationParams.fromPlatformStorageCreationParams(
    // Recommended placeholder to prevent being broken by platform interface.
    // ignore: avoid_unused_constructor_parameters
    CygnusPlatformStorageCreationParams params,
  ) {
    return LinuxStorageCreationParams(
      controller: params.controller,
      webStorageType: params.webStorageType,
    );
  }
}

///{@macro cygnus_core.CygnusPlatformStorage}
abstract mixin class LinuxStorage implements CygnusPlatformStorage {
  @override
  CygnusLinuxWebViewController? controller;

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

/// Object specifying creation parameters for creating a [LinuxLocalStorage].
///
/// When adding additional fields make sure they can be null or have a default
/// value to avoid breaking changes. See [CygnusPlatformLocalStorageCreationParams] for
/// more information.
class LinuxLocalStorageCreationParams extends CygnusPlatformLocalStorageCreationParams {
  /// Creates a new [LinuxLocalStorageCreationParams] instance.
  LinuxLocalStorageCreationParams(super.params);

  /// Creates a [LinuxLocalStorageCreationParams] instance based on [CygnusPlatformLocalStorageCreationParams].
  factory LinuxLocalStorageCreationParams.fromPlatformLocalStorageCreationParams(
    // Recommended placeholder to prevent being broken by platform interface.
    // ignore: avoid_unused_constructor_parameters
    CygnusPlatformLocalStorageCreationParams params,
  ) {
    return LinuxLocalStorageCreationParams(params);
  }
}

///{@macro cygnus_core.CygnusPlatformLocalStorage}
class LinuxLocalStorage extends CygnusPlatformLocalStorage with LinuxStorage {
  /// Constructs a [LinuxLocalStorage].
  LinuxLocalStorage(CygnusPlatformLocalStorageCreationParams params)
    : super.implementation(
        params is LinuxLocalStorageCreationParams
            ? params
            : LinuxLocalStorageCreationParams.fromPlatformLocalStorageCreationParams(
                params,
              ),
      );

  /// Default storage
  factory LinuxLocalStorage.defaultStorage({
    required CygnusPlatformWebViewController? controller,
  }) {
    return LinuxLocalStorage(
      LinuxLocalStorageCreationParams(
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
  CygnusLinuxWebViewController? get controller =>
      params.controller as CygnusLinuxWebViewController?;
}

/// Object specifying creation parameters for creating a [LinuxSessionStorage].
///
/// When adding additional fields make sure they can be null or have a default
/// value to avoid breaking changes. See [CygnusPlatformSessionStorageCreationParams] for
/// more information.
class LinuxSessionStorageCreationParams
    extends CygnusPlatformSessionStorageCreationParams {
  /// Creates a new [LinuxSessionStorageCreationParams] instance.
  LinuxSessionStorageCreationParams(super.params);

  /// Creates a [LinuxSessionStorageCreationParams] instance based on [CygnusPlatformSessionStorageCreationParams].
  factory LinuxSessionStorageCreationParams.fromPlatformSessionStorageCreationParams(
    // Recommended placeholder to prevent being broken by platform interface.
    // ignore: avoid_unused_constructor_parameters
    CygnusPlatformSessionStorageCreationParams params,
  ) {
    return LinuxSessionStorageCreationParams(params);
  }
}

///{@macro cygnus_core.CygnusPlatformSessionStorage}
class LinuxSessionStorage extends CygnusPlatformSessionStorage with LinuxStorage {
  /// Constructs a [LinuxSessionStorage].
  LinuxSessionStorage(CygnusPlatformSessionStorageCreationParams params)
    : super.implementation(
        params is LinuxSessionStorageCreationParams
            ? params
            : LinuxSessionStorageCreationParams.fromPlatformSessionStorageCreationParams(
                params,
              ),
      );

  /// Default storage
  factory LinuxSessionStorage.defaultStorage({
    required CygnusPlatformWebViewController? controller,
  }) {
    return LinuxSessionStorage(
      LinuxSessionStorageCreationParams(
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
  CygnusLinuxWebViewController? get controller =>
      params.controller as CygnusLinuxWebViewController?;
}
