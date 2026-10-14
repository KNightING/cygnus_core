import 'dart:convert';

import 'package:cygnus_core/src/platform_interface/flutter_inappwebview_platform_interface.dart';

import '../in_app_webview/in_app_webview_controller.dart';

/// Object specifying creation parameters for creating a [AndroidWebStorage].
///
/// When adding additional fields make sure they can be null or have a default
/// value to avoid breaking changes. See [CygnusPlatformWebStorageCreationParams] for
/// more information.
class AndroidWebStorageCreationParams extends CygnusPlatformWebStorageCreationParams {
  /// Creates a new [AndroidWebStorageCreationParams] instance.
  AndroidWebStorageCreationParams({
    required super.localStorage,
    required super.sessionStorage,
  });

  /// Creates a [AndroidWebStorageCreationParams] instance based on [CygnusPlatformWebStorageCreationParams].
  factory AndroidWebStorageCreationParams.fromPlatformWebStorageCreationParams(
    // Recommended placeholder to prevent being broken by platform interface.
    // ignore: avoid_unused_constructor_parameters
    CygnusPlatformWebStorageCreationParams params,
  ) {
    return AndroidWebStorageCreationParams(
      localStorage: params.localStorage,
      sessionStorage: params.sessionStorage,
    );
  }
}

///{@macro cygnus_core.CygnusPlatformWebStorage}
class AndroidWebStorage extends CygnusPlatformWebStorage {
  /// Constructs a [AndroidWebStorage].
  AndroidWebStorage(CygnusPlatformWebStorageCreationParams params)
    : super.implementation(
        params is AndroidWebStorageCreationParams
            ? params
            : AndroidWebStorageCreationParams.fromPlatformWebStorageCreationParams(
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

/// Object specifying creation parameters for creating a [AndroidStorage].
///
/// When adding additional fields make sure they can be null or have a default
/// value to avoid breaking changes. See [CygnusPlatformStorageCreationParams] for
/// more information.
class AndroidStorageCreationParams extends CygnusPlatformStorageCreationParams {
  /// Creates a new [AndroidStorageCreationParams] instance.
  AndroidStorageCreationParams({
    required super.controller,
    required super.webStorageType,
  });

  /// Creates a [AndroidStorageCreationParams] instance based on [CygnusPlatformStorageCreationParams].
  factory AndroidStorageCreationParams.fromPlatformStorageCreationParams(
    // Recommended placeholder to prevent being broken by platform interface.
    // ignore: avoid_unused_constructor_parameters
    CygnusPlatformStorageCreationParams params,
  ) {
    return AndroidStorageCreationParams(
      controller: params.controller,
      webStorageType: params.webStorageType,
    );
  }
}

///{@macro cygnus_core.CygnusPlatformStorage}
abstract mixin class AndroidStorage implements CygnusPlatformStorage {
  @override
  AndroidInAppWebViewController? controller;

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

/// Object specifying creation parameters for creating a [AndroidLocalStorage].
///
/// When adding additional fields make sure they can be null or have a default
/// value to avoid breaking changes. See [CygnusPlatformLocalStorageCreationParams] for
/// more information.
class AndroidLocalStorageCreationParams
    extends CygnusPlatformLocalStorageCreationParams {
  /// Creates a new [AndroidLocalStorageCreationParams] instance.
  AndroidLocalStorageCreationParams(super.params);

  /// Creates a [AndroidLocalStorageCreationParams] instance based on [CygnusPlatformLocalStorageCreationParams].
  factory AndroidLocalStorageCreationParams.fromPlatformLocalStorageCreationParams(
    // Recommended placeholder to prevent being broken by platform interface.
    // ignore: avoid_unused_constructor_parameters
    CygnusPlatformLocalStorageCreationParams params,
  ) {
    return AndroidLocalStorageCreationParams(params);
  }
}

///{@macro cygnus_core.CygnusPlatformLocalStorage}
class AndroidLocalStorage extends CygnusPlatformLocalStorage with AndroidStorage {
  /// Constructs a [AndroidLocalStorage].
  AndroidLocalStorage(CygnusPlatformLocalStorageCreationParams params)
    : super.implementation(
        params is AndroidLocalStorageCreationParams
            ? params
            : AndroidLocalStorageCreationParams.fromPlatformLocalStorageCreationParams(
                params,
              ),
      );

  /// Default storage
  factory AndroidLocalStorage.defaultStorage({
    required CygnusPlatformWebViewController? controller,
  }) {
    return AndroidLocalStorage(
      AndroidLocalStorageCreationParams(
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
  AndroidInAppWebViewController? get controller =>
      params.controller as AndroidInAppWebViewController?;
}

/// Object specifying creation parameters for creating a [AndroidSessionStorage].
///
/// When adding additional fields make sure they can be null or have a default
/// value to avoid breaking changes. See [CygnusPlatformSessionStorageCreationParams] for
/// more information.
class AndroidSessionStorageCreationParams
    extends CygnusPlatformSessionStorageCreationParams {
  /// Creates a new [AndroidSessionStorageCreationParams] instance.
  AndroidSessionStorageCreationParams(super.params);

  /// Creates a [AndroidSessionStorageCreationParams] instance based on [CygnusPlatformSessionStorageCreationParams].
  factory AndroidSessionStorageCreationParams.fromPlatformSessionStorageCreationParams(
    // Recommended placeholder to prevent being broken by platform interface.
    // ignore: avoid_unused_constructor_parameters
    CygnusPlatformSessionStorageCreationParams params,
  ) {
    return AndroidSessionStorageCreationParams(params);
  }
}

///{@macro cygnus_core.CygnusPlatformSessionStorage}
class AndroidSessionStorage extends CygnusPlatformSessionStorage with AndroidStorage {
  /// Constructs a [AndroidSessionStorage].
  AndroidSessionStorage(CygnusPlatformSessionStorageCreationParams params)
    : super.implementation(
        params is AndroidSessionStorageCreationParams
            ? params
            : AndroidSessionStorageCreationParams.fromPlatformSessionStorageCreationParams(
                params,
              ),
      );

  /// Default storage
  factory AndroidSessionStorage.defaultStorage({
    required CygnusPlatformWebViewController? controller,
  }) {
    return AndroidSessionStorage(
      AndroidSessionStorageCreationParams(
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
  AndroidInAppWebViewController? get controller =>
      params.controller as AndroidInAppWebViewController?;
}
