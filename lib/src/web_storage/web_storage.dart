import 'package:flutter/foundation.dart';
import 'package:cygnus_core/src/platform_interface/flutter_inappwebview_platform_interface.dart';

import '../in_app_webview/in_app_webview_controller.dart';

///{@macro cygnus_core.CygnusPlatformWebStorage}
///
///{@macro cygnus_core.CygnusPlatformWebStorage.supported_platforms}
class CygnusWebStorage {
  ///{@macro cygnus_core.CygnusPlatformWebStorage}
  CygnusWebStorage({
    required CygnusPlatformLocalStorage localStorage,
    required CygnusPlatformSessionStorage sessionStorage,
  }) : this.fromPlatformCreationParams(
         params: CygnusPlatformWebStorageCreationParams(
           localStorage: localStorage,
           sessionStorage: sessionStorage,
         ),
       );

  /// Constructs a [CygnusWebStorage].
  ///
  /// See [CygnusWebStorage.fromPlatformCreationParams] for setting parameters for
  /// a specific platform.
  CygnusWebStorage.fromPlatformCreationParams({
    required CygnusPlatformWebStorageCreationParams params,
  }) : this.fromPlatform(platform: CygnusPlatformWebStorage(params));

  /// Constructs a [CygnusWebStorage] from a specific platform implementation.
  CygnusWebStorage.fromPlatform({required this.platform});

  /// Implementation of [CygnusPlatformWebStorage] for the current platform.
  final CygnusPlatformWebStorage platform;

  ///Check if the current class is supported by the [defaultTargetPlatform] or a specific [platform].
  static bool isClassSupported({TargetPlatform? platform}) =>
      CygnusPlatformWebStorage.static().isClassSupported(platform: platform);

  ///Check if the given [property] is supported by the [defaultTargetPlatform] or a specific [platform].
  static bool isPropertySupported(
    dynamic property, {
    TargetPlatform? platform,
  }) => CygnusPlatformWebStorage.static().isPropertySupported(
    property,
    platform: platform,
  );

  ///Check if the given [method] is supported by the [defaultTargetPlatform] or a specific [platform].
  static bool isMethodSupported(
    CygnusPlatformWebStorageMethod method, {
    TargetPlatform? platform,
  }) =>
      CygnusPlatformWebStorage.static().isMethodSupported(method, platform: platform);

  ///{@macro cygnus_core.CygnusPlatformWebStorage.localStorage}
  ///
  ///{@macro cygnus_core.CygnusPlatformWebStorage.localStorage.supported_platforms}
  CygnusLocalStorage get localStorage =>
      CygnusLocalStorage.fromPlatform(platform: platform.localStorage);

  ///{@macro cygnus_core.CygnusPlatformWebStorage.sessionStorage}
  ///
  ///{@macro cygnus_core.CygnusPlatformWebStorage.sessionStorage.supported_platforms}
  CygnusSessionStorage get sessionStorage =>
      CygnusSessionStorage.fromPlatform(platform: platform.sessionStorage);

  ///{@macro cygnus_core.CygnusPlatformWebStorage.dispose}
  ///
  ///{@macro cygnus_core.CygnusPlatformWebStorage.dispose.supported_platforms}
  void dispose() => platform.dispose();
}

///{@macro cygnus_core.CygnusPlatformStorage}
///
///{@macro cygnus_core.CygnusPlatformStorage.supported_platforms}
abstract class CygnusStorage implements CygnusPlatformStorage {
  /// Constructs a [CygnusStorage] from a specific platform implementation.
  CygnusStorage.fromPlatform({required this.platform});

  /// Implementation of [CygnusPlatformStorage] for the current platform.
  final CygnusPlatformStorage platform;

  ///{@macro cygnus_core.CygnusPlatformStorage.controller}
  ///
  ///{@macro cygnus_core.CygnusPlatformStorage.controller.supported_platforms}
  CygnusPlatformWebViewController? get controller => platform.controller;

  ///{@macro cygnus_core.CygnusPlatformStorage.webStorageType}
  ///
  ///{@macro cygnus_core.CygnusPlatformStorage.webStorageType.supported_platforms}
  CygnusWebStorageType get webStorageType => platform.webStorageType;

  ///{@macro cygnus_core.CygnusPlatformStorage.length}
  ///
  ///{@macro cygnus_core.CygnusPlatformStorage.length.supported_platforms}
  Future<int?> length() => platform.length();

  ///{@macro cygnus_core.CygnusPlatformStorage.setItem}
  ///
  ///{@macro cygnus_core.CygnusPlatformStorage.setItem.supported_platforms}
  Future<void> setItem({required String key, required dynamic value}) =>
      platform.setItem(key: key, value: value);

  ///{@macro cygnus_core.CygnusPlatformStorage.getItem}
  ///
  ///{@macro cygnus_core.CygnusPlatformStorage.getItem.supported_platforms}
  Future<dynamic> getItem({required String key}) => platform.getItem(key: key);

  ///{@macro cygnus_core.CygnusPlatformStorage.removeItem}
  ///
  ///{@macro cygnus_core.CygnusPlatformStorage.removeItem.supported_platforms}
  Future<void> removeItem({required String key}) =>
      platform.removeItem(key: key);

  ///{@macro cygnus_core.CygnusPlatformStorage.getItems}
  ///
  ///{@macro cygnus_core.CygnusPlatformStorage.getItems.supported_platforms}
  Future<List<CygnusWebStorageItem>> getItems() => platform.getItems();

  ///{@macro cygnus_core.CygnusPlatformStorage.clear}
  ///
  ///{@macro cygnus_core.CygnusPlatformStorage.clear.supported_platforms}
  Future<void> clear() => platform.clear();

  ///{@macro cygnus_core.CygnusPlatformStorage.key}
  ///
  ///{@macro cygnus_core.CygnusPlatformStorage.key.supported_platforms}
  Future<String> key({required int index}) => platform.key(index: index);

  ///{@macro cygnus_core.CygnusPlatformStorage.dispose}
  ///
  ///{@macro cygnus_core.CygnusPlatformStorage.dispose.supported_platforms}
  void dispose() => platform.dispose();
}

///{@macro cygnus_core.CygnusPlatformLocalStorage}
///
///{@macro cygnus_core.CygnusPlatformLocalStorage.supported_platforms}
class CygnusLocalStorage extends CygnusStorage {
  ///{@macro cygnus_core.CygnusPlatformLocalStorage}
  CygnusLocalStorage({required CygnusWebViewController? controller})
    : this.fromPlatformCreationParams(
        params: CygnusPlatformLocalStorageCreationParams(
          CygnusPlatformStorageCreationParams(
            controller: controller?.platform,
            webStorageType: CygnusWebStorageType.LOCAL_STORAGE,
          ),
        ),
      );

  /// Constructs a [CygnusLocalStorage].
  ///
  /// See [CygnusLocalStorage.fromPlatformCreationParams] for setting parameters for
  /// a specific platform.
  CygnusLocalStorage.fromPlatformCreationParams({
    required CygnusPlatformLocalStorageCreationParams params,
  }) : this.fromPlatform(platform: CygnusPlatformLocalStorage(params));

  /// Constructs a [CygnusLocalStorage] from a specific platform implementation.
  CygnusLocalStorage.fromPlatform({required this.platform})
    : super.fromPlatform(platform: platform);

  /// Implementation of [CygnusPlatformLocalStorage] for the current platform.
  final CygnusPlatformLocalStorage platform;

  ///Check if the current class is supported by the [defaultTargetPlatform] or a specific [platform].
  static bool isClassSupported({TargetPlatform? platform}) =>
      CygnusPlatformLocalStorage.static().isClassSupported(platform: platform);

  ///Check if the given [property] is supported by the [defaultTargetPlatform] or a specific [platform].
  static bool isPropertySupported(
    CygnusPlatformStorageCreationParamsProperty property, {
    TargetPlatform? platform,
  }) => CygnusPlatformLocalStorage.static().isPropertySupported(
    property,
    platform: platform,
  );

  ///Check if the given [method] is supported by the [defaultTargetPlatform] or a specific [platform].
  static bool isMethodSupported(
    CygnusPlatformLocalStorageMethod method, {
    TargetPlatform? platform,
  }) => CygnusPlatformLocalStorage.static().isMethodSupported(
    method,
    platform: platform,
  );
}

///{@macro cygnus_core.CygnusPlatformSessionStorage}
///
///{@macro cygnus_core.CygnusPlatformSessionStorage.supported_platforms}
class CygnusSessionStorage extends CygnusStorage {
  ///{@macro cygnus_core.CygnusPlatformSessionStorage}
  CygnusSessionStorage({required CygnusWebViewController? controller})
    : this.fromPlatformCreationParams(
        params: CygnusPlatformSessionStorageCreationParams(
          CygnusPlatformStorageCreationParams(
            controller: controller?.platform,
            webStorageType: CygnusWebStorageType.SESSION_STORAGE,
          ),
        ),
      );

  /// Constructs a [CygnusSessionStorage].
  ///
  /// See [CygnusSessionStorage.fromPlatformCreationParams] for setting parameters for
  /// a specific platform.
  CygnusSessionStorage.fromPlatformCreationParams({
    required CygnusPlatformSessionStorageCreationParams params,
  }) : this.fromPlatform(platform: CygnusPlatformSessionStorage(params));

  /// Constructs a [CygnusSessionStorage] from a specific platform implementation.
  CygnusSessionStorage.fromPlatform({required this.platform})
    : super.fromPlatform(platform: platform);

  /// Implementation of [CygnusPlatformSessionStorage] for the current platform.
  final CygnusPlatformSessionStorage platform;

  ///Check if the current class is supported by the [defaultTargetPlatform] or a specific [platform].
  static bool isClassSupported({TargetPlatform? platform}) =>
      CygnusPlatformSessionStorage.static().isClassSupported(platform: platform);

  ///Check if the given [property] is supported by the [defaultTargetPlatform] or a specific [platform].
  static bool isPropertySupported(
    CygnusPlatformStorageCreationParamsProperty property, {
    TargetPlatform? platform,
  }) => CygnusPlatformSessionStorage.static().isPropertySupported(
    property,
    platform: platform,
  );

  ///Check if the given [method] is supported by the [defaultTargetPlatform] or a specific [platform].
  static bool isMethodSupported(
    CygnusPlatformSessionStorageMethod method, {
    TargetPlatform? platform,
  }) => CygnusPlatformSessionStorage.static().isMethodSupported(
    method,
    platform: platform,
  );
}
