import 'package:flutter/foundation.dart';
import 'package:cygnus_core/src/platform_interface/flutter_inappwebview_platform_interface.dart';

import '../in_app_webview/in_app_webview_controller.dart';

///{@macro cygnus_core.PlatformWebStorage}
///
///{@macro cygnus_core.PlatformWebStorage.supported_platforms}
class WebStorage {
  ///{@macro cygnus_core.PlatformWebStorage}
  WebStorage({
    required PlatformLocalStorage localStorage,
    required PlatformSessionStorage sessionStorage,
  }) : this.fromPlatformCreationParams(
         params: PlatformWebStorageCreationParams(
           localStorage: localStorage,
           sessionStorage: sessionStorage,
         ),
       );

  /// Constructs a [WebStorage].
  ///
  /// See [WebStorage.fromPlatformCreationParams] for setting parameters for
  /// a specific platform.
  WebStorage.fromPlatformCreationParams({
    required PlatformWebStorageCreationParams params,
  }) : this.fromPlatform(platform: PlatformWebStorage(params));

  /// Constructs a [WebStorage] from a specific platform implementation.
  WebStorage.fromPlatform({required this.platform});

  /// Implementation of [PlatformWebStorage] for the current platform.
  final PlatformWebStorage platform;

  ///Check if the current class is supported by the [defaultTargetPlatform] or a specific [platform].
  static bool isClassSupported({TargetPlatform? platform}) =>
      PlatformWebStorage.static().isClassSupported(platform: platform);

  ///Check if the given [property] is supported by the [defaultTargetPlatform] or a specific [platform].
  static bool isPropertySupported(
    dynamic property, {
    TargetPlatform? platform,
  }) => PlatformWebStorage.static().isPropertySupported(
    property,
    platform: platform,
  );

  ///Check if the given [method] is supported by the [defaultTargetPlatform] or a specific [platform].
  static bool isMethodSupported(
    PlatformWebStorageMethod method, {
    TargetPlatform? platform,
  }) =>
      PlatformWebStorage.static().isMethodSupported(method, platform: platform);

  ///{@macro cygnus_core.PlatformWebStorage.localStorage}
  ///
  ///{@macro cygnus_core.PlatformWebStorage.localStorage.supported_platforms}
  LocalStorage get localStorage =>
      LocalStorage.fromPlatform(platform: platform.localStorage);

  ///{@macro cygnus_core.PlatformWebStorage.sessionStorage}
  ///
  ///{@macro cygnus_core.PlatformWebStorage.sessionStorage.supported_platforms}
  SessionStorage get sessionStorage =>
      SessionStorage.fromPlatform(platform: platform.sessionStorage);

  ///{@macro cygnus_core.PlatformWebStorage.dispose}
  ///
  ///{@macro cygnus_core.PlatformWebStorage.dispose.supported_platforms}
  void dispose() => platform.dispose();
}

///{@macro cygnus_core.PlatformStorage}
///
///{@macro cygnus_core.PlatformStorage.supported_platforms}
abstract class Storage implements PlatformStorage {
  /// Constructs a [Storage] from a specific platform implementation.
  Storage.fromPlatform({required this.platform});

  /// Implementation of [PlatformStorage] for the current platform.
  final PlatformStorage platform;

  ///{@macro cygnus_core.PlatformStorage.controller}
  ///
  ///{@macro cygnus_core.PlatformStorage.controller.supported_platforms}
  PlatformInAppWebViewController? get controller => platform.controller;

  ///{@macro cygnus_core.PlatformStorage.webStorageType}
  ///
  ///{@macro cygnus_core.PlatformStorage.webStorageType.supported_platforms}
  WebStorageType get webStorageType => platform.webStorageType;

  ///{@macro cygnus_core.PlatformStorage.length}
  ///
  ///{@macro cygnus_core.PlatformStorage.length.supported_platforms}
  Future<int?> length() => platform.length();

  ///{@macro cygnus_core.PlatformStorage.setItem}
  ///
  ///{@macro cygnus_core.PlatformStorage.setItem.supported_platforms}
  Future<void> setItem({required String key, required dynamic value}) =>
      platform.setItem(key: key, value: value);

  ///{@macro cygnus_core.PlatformStorage.getItem}
  ///
  ///{@macro cygnus_core.PlatformStorage.getItem.supported_platforms}
  Future<dynamic> getItem({required String key}) => platform.getItem(key: key);

  ///{@macro cygnus_core.PlatformStorage.removeItem}
  ///
  ///{@macro cygnus_core.PlatformStorage.removeItem.supported_platforms}
  Future<void> removeItem({required String key}) =>
      platform.removeItem(key: key);

  ///{@macro cygnus_core.PlatformStorage.getItems}
  ///
  ///{@macro cygnus_core.PlatformStorage.getItems.supported_platforms}
  Future<List<WebStorageItem>> getItems() => platform.getItems();

  ///{@macro cygnus_core.PlatformStorage.clear}
  ///
  ///{@macro cygnus_core.PlatformStorage.clear.supported_platforms}
  Future<void> clear() => platform.clear();

  ///{@macro cygnus_core.PlatformStorage.key}
  ///
  ///{@macro cygnus_core.PlatformStorage.key.supported_platforms}
  Future<String> key({required int index}) => platform.key(index: index);

  ///{@macro cygnus_core.PlatformStorage.dispose}
  ///
  ///{@macro cygnus_core.PlatformStorage.dispose.supported_platforms}
  void dispose() => platform.dispose();
}

///{@macro cygnus_core.PlatformLocalStorage}
///
///{@macro cygnus_core.PlatformLocalStorage.supported_platforms}
class LocalStorage extends Storage {
  ///{@macro cygnus_core.PlatformLocalStorage}
  LocalStorage({required InAppWebViewController? controller})
    : this.fromPlatformCreationParams(
        params: PlatformLocalStorageCreationParams(
          PlatformStorageCreationParams(
            controller: controller?.platform,
            webStorageType: WebStorageType.LOCAL_STORAGE,
          ),
        ),
      );

  /// Constructs a [LocalStorage].
  ///
  /// See [LocalStorage.fromPlatformCreationParams] for setting parameters for
  /// a specific platform.
  LocalStorage.fromPlatformCreationParams({
    required PlatformLocalStorageCreationParams params,
  }) : this.fromPlatform(platform: PlatformLocalStorage(params));

  /// Constructs a [LocalStorage] from a specific platform implementation.
  LocalStorage.fromPlatform({required this.platform})
    : super.fromPlatform(platform: platform);

  /// Implementation of [PlatformLocalStorage] for the current platform.
  final PlatformLocalStorage platform;

  ///Check if the current class is supported by the [defaultTargetPlatform] or a specific [platform].
  static bool isClassSupported({TargetPlatform? platform}) =>
      PlatformLocalStorage.static().isClassSupported(platform: platform);

  ///Check if the given [property] is supported by the [defaultTargetPlatform] or a specific [platform].
  static bool isPropertySupported(
    PlatformStorageCreationParamsProperty property, {
    TargetPlatform? platform,
  }) => PlatformLocalStorage.static().isPropertySupported(
    property,
    platform: platform,
  );

  ///Check if the given [method] is supported by the [defaultTargetPlatform] or a specific [platform].
  static bool isMethodSupported(
    PlatformLocalStorageMethod method, {
    TargetPlatform? platform,
  }) => PlatformLocalStorage.static().isMethodSupported(
    method,
    platform: platform,
  );
}

///{@macro cygnus_core.PlatformSessionStorage}
///
///{@macro cygnus_core.PlatformSessionStorage.supported_platforms}
class SessionStorage extends Storage {
  ///{@macro cygnus_core.PlatformSessionStorage}
  SessionStorage({required InAppWebViewController? controller})
    : this.fromPlatformCreationParams(
        params: PlatformSessionStorageCreationParams(
          PlatformStorageCreationParams(
            controller: controller?.platform,
            webStorageType: WebStorageType.SESSION_STORAGE,
          ),
        ),
      );

  /// Constructs a [SessionStorage].
  ///
  /// See [SessionStorage.fromPlatformCreationParams] for setting parameters for
  /// a specific platform.
  SessionStorage.fromPlatformCreationParams({
    required PlatformSessionStorageCreationParams params,
  }) : this.fromPlatform(platform: PlatformSessionStorage(params));

  /// Constructs a [SessionStorage] from a specific platform implementation.
  SessionStorage.fromPlatform({required this.platform})
    : super.fromPlatform(platform: platform);

  /// Implementation of [PlatformSessionStorage] for the current platform.
  final PlatformSessionStorage platform;

  ///Check if the current class is supported by the [defaultTargetPlatform] or a specific [platform].
  static bool isClassSupported({TargetPlatform? platform}) =>
      PlatformSessionStorage.static().isClassSupported(platform: platform);

  ///Check if the given [property] is supported by the [defaultTargetPlatform] or a specific [platform].
  static bool isPropertySupported(
    PlatformStorageCreationParamsProperty property, {
    TargetPlatform? platform,
  }) => PlatformSessionStorage.static().isPropertySupported(
    property,
    platform: platform,
  );

  ///Check if the given [method] is supported by the [defaultTargetPlatform] or a specific [platform].
  static bool isMethodSupported(
    PlatformSessionStorageMethod method, {
    TargetPlatform? platform,
  }) => PlatformSessionStorage.static().isMethodSupported(
    method,
    platform: platform,
  );
}
