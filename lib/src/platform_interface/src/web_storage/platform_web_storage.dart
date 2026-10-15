import 'package:flutter/foundation.dart';
import 'package:cygnus_core_internal_annotations/cygnus_core_internal_annotations.dart';
import 'package:cygnus_core/src/platform_interface/src/types/disposable.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import '../webview/platform_webview_controller.dart';
import '../webview_platform.dart';
import '../types/main.dart';
import 'web_storage_item.dart';

part 'platform_web_storage.g.dart';

/// Object specifying creation parameters for creating a [CygnusPlatformWebStorage].
///
/// Platform specific implementations can add additional fields by extending
/// this class.
///{@template cygnus_core.CygnusPlatformWebStorageCreationParams}
/// Object specifying creation parameters for creating a [CygnusPlatformWebStorage].
///
/// Platform specific implementations can add additional fields by extending
/// this class.
///{@endtemplate}
///
///{@macro cygnus_core.CygnusPlatformWebStorageCreationParams.supported_platforms}
@SupportedPlatforms(
  platforms: [
    AndroidPlatform(),
    IOSPlatform(),
    MacOSPlatform(),
    WebPlatform(),
    WindowsPlatform(),
    LinuxPlatform(),
  ],
)
@immutable
class CygnusPlatformWebStorageCreationParams {
  /// Used by the platform implementation to create a new [CygnusPlatformWebStorage].
  const CygnusPlatformWebStorageCreationParams({
    required this.localStorage,
    required this.sessionStorage,
  });

  ///{@macro cygnus_core.CygnusPlatformWebStorage.localStorage}
  ///
  ///{@macro cygnus_core.CygnusPlatformWebStorage.localStorage.supported_platforms}
  @SupportedPlatforms(
    platforms: [
      AndroidPlatform(),
      IOSPlatform(),
      MacOSPlatform(),
      WebPlatform(),
      WindowsPlatform(),
      LinuxPlatform(),
    ],
  )
  final CygnusPlatformLocalStorage localStorage;

  ///{@macro cygnus_core.CygnusPlatformWebStorage.sessionStorage}
  ///
  ///{@macro cygnus_core.CygnusPlatformWebStorage.sessionStorage.supported_platforms}
  @SupportedPlatforms(
    platforms: [
      AndroidPlatform(),
      IOSPlatform(),
      MacOSPlatform(),
      WebPlatform(),
      WindowsPlatform(),
      LinuxPlatform(),
    ],
  )
  final CygnusPlatformSessionStorage sessionStorage;

  ///{@template cygnus_core.CygnusPlatformWebStorageCreationParams.isClassSupported}
  ///Check if the current class is supported by the [defaultTargetPlatform] or a specific [platform].
  ///{@endtemplate}
  bool isClassSupported({TargetPlatform? platform}) =>
      _CygnusPlatformWebStorageCreationParamsClassSupported.isClassSupported(
        platform: platform,
      );

  ///{@template cygnus_core.CygnusPlatformWebStorageCreationParams.isPropertySupported}
  ///Check if the given [property] is supported by the [defaultTargetPlatform] or a specific [platform].
  ///{@endtemplate}
  bool isPropertySupported(
    CygnusPlatformWebStorageCreationParamsProperty property, {
    TargetPlatform? platform,
  }) => _CygnusPlatformWebStorageCreationParamsPropertySupported.isPropertySupported(
    property,
    platform: platform,
  );
}

///{@template cygnus_core.CygnusPlatformWebStorage}
///Class that provides access to the JavaScript [Web CygnusStorage API](https://developer.mozilla.org/en-US/docs/Web/API/Web_Storage_API): `window.sessionStorage` and `window.localStorage`.
///It used by [CygnusPlatformWebViewController.webStorage].
///{@endtemplate}
///{@macro cygnus_core.CygnusPlatformWebStorage.supported_platforms}
@SupportedPlatforms(
  platforms: [
    AndroidPlatform(),
    IOSPlatform(),
    MacOSPlatform(),
    WebPlatform(),
    WindowsPlatform(),
    LinuxPlatform(),
  ],
)
abstract class CygnusPlatformWebStorage extends PlatformInterface
    implements CygnusDisposable {
  /// Creates a new [CygnusPlatformWebStorage]
  factory CygnusPlatformWebStorage(CygnusPlatformWebStorageCreationParams params) {
    assert(
      CygnusWebViewPlatform.instance != null,
      'A platform implementation for `cygnus` has not been set. Please '
      'ensure that an implementation of `CygnusWebViewPlatform` has been set to '
      '`CygnusWebViewPlatform.instance` before use. For unit testing, '
      '`CygnusWebViewPlatform.instance` can be set with your own test implementation.',
    );
    final CygnusPlatformWebStorage webStorage = CygnusWebViewPlatform.instance!
        .createPlatformWebStorage(params);
    PlatformInterface.verify(webStorage, _token);
    return webStorage;
  }

  /// Creates a new empty [CygnusPlatformWebStorage] to access static methods.
  factory CygnusPlatformWebStorage.static() {
    assert(
      CygnusWebViewPlatform.instance != null,
      'A platform implementation for `cygnus` has not been set. Please '
      'ensure that an implementation of `CygnusWebViewPlatform` has been set to '
      '`CygnusWebViewPlatform.instance` before use. For unit testing, '
      '`CygnusWebViewPlatform.instance` can be set with your own test implementation.',
    );
    final CygnusPlatformWebStorage webStorageStatic = CygnusWebViewPlatform.instance!
        .createPlatformWebStorageStatic();
    PlatformInterface.verify(webStorageStatic, _token);
    return webStorageStatic;
  }

  /// Used by the platform implementation to create a new [CygnusPlatformWebStorage].
  ///
  /// Should only be used by platform implementations because they can't extend
  /// a class that only contains a factory constructor.
  @protected
  CygnusPlatformWebStorage.implementation(this.params) : super(token: _token);

  static final Object _token = Object();

  /// The parameters used to initialize the [CygnusPlatformWebStorage].
  final CygnusPlatformWebStorageCreationParams params;

  ///{@template cygnus_core.CygnusPlatformWebStorage.localStorage}
  ///Represents `window.localStorage`.
  ///{@endtemplate}
  ///
  ///{@macro cygnus_core.CygnusPlatformWebStorage.localStorage.supported_platforms}
  @SupportedPlatforms(
    platforms: [
      AndroidPlatform(),
      IOSPlatform(),
      MacOSPlatform(),
      WebPlatform(),
      WindowsPlatform(),
      LinuxPlatform(),
    ],
  )
  CygnusPlatformLocalStorage get localStorage => params.localStorage;

  ///{@template cygnus_core.CygnusPlatformWebStorage.sessionStorage}
  ///Represents `window.sessionStorage`.
  ///{@endtemplate}
  ///
  ///{@macro cygnus_core.CygnusPlatformWebStorage.sessionStorage.supported_platforms}
  @SupportedPlatforms(
    platforms: [
      AndroidPlatform(),
      IOSPlatform(),
      MacOSPlatform(),
      WebPlatform(),
      WindowsPlatform(),
      LinuxPlatform(),
    ],
  )
  CygnusPlatformSessionStorage get sessionStorage => params.sessionStorage;

  ///{@template cygnus_core.CygnusPlatformWebStorage.dispose}
  ///Disposes the web storage.
  ///{@endtemplate}
  ///
  ///{@macro cygnus_core.CygnusPlatformWebStorage.dispose.supported_platforms}
  @SupportedPlatforms(
    platforms: [
      AndroidPlatform(),
      IOSPlatform(),
      MacOSPlatform(),
      WebPlatform(),
      WindowsPlatform(),
      LinuxPlatform(),
    ],
  )
  void dispose() {
    throw UnimplementedError(
      'dispose is not implemented on the current platform',
    );
  }

  ///{@macro cygnus_core.CygnusPlatformWebStorageCreationParams.isClassSupported}
  bool isClassSupported({TargetPlatform? platform}) =>
      _CygnusPlatformWebStorageClassSupported.isClassSupported(platform: platform);

  ///{@template cygnus_core.CygnusPlatformWebStorage.isPropertySupported}
  ///Check if the given [property] is supported by the [defaultTargetPlatform] or a specific [platform].
  ///{@endtemplate}
  bool isPropertySupported(dynamic property, {TargetPlatform? platform}) =>
      property is CygnusPlatformWebStorageCreationParamsProperty
      ? params.isPropertySupported(property, platform: platform)
      : _CygnusPlatformWebStoragePropertySupported.isPropertySupported(
          property,
          platform: platform,
        );

  ///{@template cygnus_core.CygnusPlatformWebStorage.isMethodSupported}
  ///Check if the given [method] is supported by the [defaultTargetPlatform] or a specific [platform].
  ///{@endtemplate}
  bool isMethodSupported(
    CygnusPlatformWebStorageMethod method, {
    TargetPlatform? platform,
  }) => _CygnusPlatformWebStorageMethodSupported.isMethodSupported(
    method,
    platform: platform,
  );
}

/// Object specifying creation parameters for creating a [CygnusPlatformStorage].
///
/// Platform specific implementations can add additional fields by extending
/// this class.
///{@template cygnus_core.CygnusPlatformStorageCreationParams}
/// Object specifying creation parameters for creating a [CygnusPlatformStorage].
///
/// Platform specific implementations can add additional fields by extending
/// this class.
///{@endtemplate}
///
///{@macro cygnus_core.CygnusPlatformStorageCreationParams.supported_platforms}
@SupportedPlatforms(
  platforms: [
    AndroidPlatform(),
    IOSPlatform(),
    MacOSPlatform(),
    WebPlatform(),
    WindowsPlatform(),
    LinuxPlatform(),
  ],
)
@immutable
class CygnusPlatformStorageCreationParams {
  /// Used by the platform implementation to create a new [CygnusPlatformStorage].
  const CygnusPlatformStorageCreationParams({
    required this.controller,
    required this.webStorageType,
  });

  ///{@macro cygnus_core.CygnusPlatformStorage.controller}
  ///
  ///{@macro cygnus_core.CygnusPlatformStorage.controller.supported_platforms}
  @SupportedPlatforms(
    platforms: [
      AndroidPlatform(),
      IOSPlatform(),
      MacOSPlatform(),
      WebPlatform(),
      WindowsPlatform(),
      LinuxPlatform(),
    ],
  )
  final CygnusPlatformWebViewController? controller;

  ///{@macro cygnus_core.CygnusPlatformStorage.webStorageType}
  ///
  ///{@macro cygnus_core.CygnusPlatformStorage.webStorageType.supported_platforms}
  @SupportedPlatforms(
    platforms: [
      AndroidPlatform(),
      IOSPlatform(),
      MacOSPlatform(),
      WebPlatform(),
      WindowsPlatform(),
      LinuxPlatform(),
    ],
  )
  final CygnusWebStorageType webStorageType;

  ///{@template cygnus_core.CygnusPlatformStorageCreationParams.isClassSupported}
  ///Check if the current class is supported by the [defaultTargetPlatform] or a specific [platform].
  ///{@endtemplate}
  bool isClassSupported({TargetPlatform? platform}) =>
      _CygnusPlatformStorageCreationParamsClassSupported.isClassSupported(
        platform: platform,
      );

  ///{@template cygnus_core.CygnusPlatformStorageCreationParams.isPropertySupported}
  ///Check if the given [property] is supported by the [defaultTargetPlatform] or a specific [platform].
  ///{@endtemplate}
  bool isPropertySupported(
    CygnusPlatformStorageCreationParamsProperty property, {
    TargetPlatform? platform,
  }) => _CygnusPlatformStorageCreationParamsPropertySupported.isPropertySupported(
    property,
    platform: platform,
  );
}

///{@template cygnus_core.CygnusPlatformStorage}
///Class that provides methods to manage the JavaScript [CygnusStorage](https://developer.mozilla.org/en-US/docs/Web/API/CygnusStorage) object.
///It is used by [CygnusPlatformLocalStorage] and [CygnusPlatformSessionStorage].
///{@endtemplate}
///{@macro cygnus_core.CygnusPlatformStorage.supported_platforms}
@SupportedPlatforms(
  platforms: [
    AndroidPlatform(),
    IOSPlatform(),
    MacOSPlatform(),
    WebPlatform(),
    WindowsPlatform(),
    LinuxPlatform(),
  ],
)
abstract mixin class CygnusPlatformStorage implements CygnusDisposable {
  ///{@template cygnus_core.CygnusPlatformStorage.controller}
  ///Controller used to interact with storage.
  ///{@endtemplate}
  @SupportedPlatforms(
    platforms: [
      AndroidPlatform(),
      IOSPlatform(),
      MacOSPlatform(),
      WebPlatform(),
      WindowsPlatform(),
      LinuxPlatform(),
    ],
  )
  CygnusPlatformWebViewController? get controller;

  ///{@template cygnus_core.CygnusPlatformStorage.webStorageType}
  ///The web storage type: `window.sessionStorage` or `window.localStorage`.
  ///{@endtemplate}
  @SupportedPlatforms(
    platforms: [
      AndroidPlatform(),
      IOSPlatform(),
      MacOSPlatform(),
      WebPlatform(),
      WindowsPlatform(),
      LinuxPlatform(),
    ],
  )
  CygnusWebStorageType get webStorageType {
    throw UnimplementedError(
      'webStorageType is not implemented on the current platform',
    );
  }

  ///{@template cygnus_core.CygnusPlatformStorage.length}
  ///Returns an integer representing the number of data items stored in the CygnusStorage object.
  ///{@endtemplate}
  @SupportedPlatforms(
    platforms: [
      AndroidPlatform(),
      IOSPlatform(),
      MacOSPlatform(),
      WebPlatform(
        note:
            'This method has an effect only if the iframe has the same origin.',
      ),
      WindowsPlatform(),
      LinuxPlatform(),
    ],
  )
  Future<int?> length() {
    throw UnimplementedError(
      'length is not implemented on the current platform',
    );
  }

  ///{@template cygnus_core.CygnusPlatformStorage.setItem}
  ///When passed a [key] name and [value], will add that key to the storage, or update that key's value if it already exists.
  ///{@endtemplate}
  @SupportedPlatforms(
    platforms: [
      AndroidPlatform(),
      IOSPlatform(),
      MacOSPlatform(),
      WebPlatform(
        note:
            'This method has an effect only if the iframe has the same origin.',
      ),
      WindowsPlatform(),
      LinuxPlatform(),
    ],
  )
  Future<void> setItem({required String key, required dynamic value}) {
    throw UnimplementedError(
      'setItem is not implemented on the current platform',
    );
  }

  ///{@template cygnus_core.CygnusPlatformStorage.getItem}
  ///When passed a [key] name, will return that key's value, or `null` if the key does not exist, in the given CygnusStorage object.
  ///{@endtemplate}
  @SupportedPlatforms(
    platforms: [
      AndroidPlatform(),
      IOSPlatform(),
      MacOSPlatform(),
      WebPlatform(
        note:
            'This method has an effect only if the iframe has the same origin.',
      ),
      WindowsPlatform(),
      LinuxPlatform(),
    ],
  )
  Future<dynamic> getItem({required String key}) {
    throw UnimplementedError(
      'getItem is not implemented on the current platform',
    );
  }

  ///{@template cygnus_core.CygnusPlatformStorage.removeItem}
  ///When passed a [key] name, will remove that key from the given CygnusStorage object if it exists.
  ///{@endtemplate}
  @SupportedPlatforms(
    platforms: [
      AndroidPlatform(),
      IOSPlatform(),
      MacOSPlatform(),
      WebPlatform(
        note:
            'This method has an effect only if the iframe has the same origin.',
      ),
      WindowsPlatform(),
      LinuxPlatform(),
    ],
  )
  Future<void> removeItem({required String key}) {
    throw UnimplementedError(
      'removeItem is not implemented on the current platform',
    );
  }

  ///{@template cygnus_core.CygnusPlatformStorage.getItems}
  ///Returns the list of all items from the given CygnusStorage object.
  ///{@endtemplate}
  @SupportedPlatforms(
    platforms: [
      AndroidPlatform(),
      IOSPlatform(),
      MacOSPlatform(),
      WebPlatform(
        note:
            'This method has an effect only if the iframe has the same origin.',
      ),
      WindowsPlatform(),
      LinuxPlatform(),
    ],
  )
  Future<List<CygnusWebStorageItem>> getItems() {
    throw UnimplementedError(
      'getItems is not implemented on the current platform',
    );
  }

  ///{@template cygnus_core.CygnusPlatformStorage.clear}
  ///Clears all keys stored in a given CygnusStorage object.
  ///{@endtemplate}
  @SupportedPlatforms(
    platforms: [
      AndroidPlatform(),
      IOSPlatform(),
      MacOSPlatform(),
      WebPlatform(
        note:
            'This method has an effect only if the iframe has the same origin.',
      ),
      WindowsPlatform(),
      LinuxPlatform(),
    ],
  )
  Future<void> clear() {
    throw UnimplementedError(
      'clear is not implemented on the current platform',
    );
  }

  ///{@template cygnus_core.CygnusPlatformStorage.key}
  ///When passed a number [index], returns the name of the nth key in a given CygnusStorage object.
  ///The order of keys is user-agent defined, so you should not rely on it.
  ///{@endtemplate}
  @SupportedPlatforms(
    platforms: [
      AndroidPlatform(),
      IOSPlatform(),
      MacOSPlatform(),
      WebPlatform(
        note:
            'This method has an effect only if the iframe has the same origin.',
      ),
      WindowsPlatform(),
      LinuxPlatform(),
    ],
  )
  Future<String> key({required int index}) {
    throw UnimplementedError('key is not implemented on the current platform');
  }

  @override
  @SupportedPlatforms(
    platforms: [
      AndroidPlatform(),
      IOSPlatform(),
      MacOSPlatform(),
      WebPlatform(),
      WindowsPlatform(),
      LinuxPlatform(),
    ],
  )
  void dispose() {
    throw UnimplementedError(
      'dispose is not implemented on the current platform',
    );
  }
}

/// Object specifying creation parameters for creating a [CygnusPlatformLocalStorage].
///
/// Platform specific implementations can add additional fields by extending
/// this class.
@immutable
@SupportedPlatforms(
  platforms: [
    AndroidPlatform(),
    IOSPlatform(),
    MacOSPlatform(),
    WebPlatform(),
    WindowsPlatform(),
    LinuxPlatform(),
  ],
)
class CygnusPlatformLocalStorageCreationParams extends CygnusPlatformStorageCreationParams {
  /// Used by the platform implementation to create a new [CygnusPlatformLocalStorage].
  CygnusPlatformLocalStorageCreationParams(
    // This parameter prevents breaking changes later.
    // ignore: avoid_unused_constructor_parameters
    CygnusPlatformStorageCreationParams params,
  ) : super(
        controller: params.controller,
        webStorageType: CygnusWebStorageType.LOCAL_STORAGE,
      );

  /// Creates a [CygnusPlatformLocalStorageCreationParams] instance based on [CygnusPlatformLocalStorageCreationParams].
  factory CygnusPlatformLocalStorageCreationParams.fromPlatformStorageCreationParams(
    CygnusPlatformStorageCreationParams params,
  ) {
    return CygnusPlatformLocalStorageCreationParams(params);
  }

  ///{@template cygnus_core.CygnusPlatformLocalStorageCreationParams.isClassSupported}
  ///Check if the current class is supported by the [defaultTargetPlatform] or a specific [platform].
  ///{@endtemplate}
  bool isClassSupported({TargetPlatform? platform}) =>
      _CygnusPlatformLocalStorageCreationParamsClassSupported.isClassSupported(
        platform: platform,
      );
}

///{@template cygnus_core.CygnusPlatformLocalStorage}
///Class that provides methods to manage the JavaScript `window.localStorage` object.
///It used by [CygnusPlatformWebStorage].
///{@endtemplate}
///{@macro cygnus_core.CygnusPlatformLocalStorage.supported_platforms}
@SupportedPlatforms(
  platforms: [
    AndroidPlatform(),
    IOSPlatform(),
    MacOSPlatform(),
    WebPlatform(),
    WindowsPlatform(),
    LinuxPlatform(),
  ],
)
abstract class CygnusPlatformLocalStorage extends PlatformInterface
    with CygnusPlatformStorage {
  /// Creates a new [CygnusPlatformLocalStorage]
  factory CygnusPlatformLocalStorage(CygnusPlatformLocalStorageCreationParams params) {
    assert(
      CygnusWebViewPlatform.instance != null,
      'A platform implementation for `cygnus` has not been set. Please '
      'ensure that an implementation of `CygnusWebViewPlatform` has been set to '
      '`CygnusWebViewPlatform.instance` before use. For unit testing, '
      '`CygnusWebViewPlatform.instance` can be set with your own test implementation.',
    );
    final CygnusPlatformLocalStorage localStorage = CygnusWebViewPlatform.instance!
        .createPlatformLocalStorage(params);
    PlatformInterface.verify(localStorage, _token);
    return localStorage;
  }

  /// Creates a new empty [CygnusPlatformLocalStorage] to access static methods.
  factory CygnusPlatformLocalStorage.static() {
    assert(
      CygnusWebViewPlatform.instance != null,
      'A platform implementation for `cygnus` has not been set. Please '
      'ensure that an implementation of `CygnusWebViewPlatform` has been set to '
      '`WebViewPlatform.instance` before use. For unit testing, '
      '`WebViewPlatform.instance` can be set with your own test implementation.',
    );
    final CygnusPlatformLocalStorage localStorageStatic = CygnusWebViewPlatform
        .instance!
        .createPlatformLocalStorageStatic();
    PlatformInterface.verify(localStorageStatic, _token);
    return localStorageStatic;
  }

  /// Used by the platform implementation to create a new [CygnusPlatformLocalStorage].
  ///
  /// Should only be used by platform implementations because they can't extend
  /// a class that only contains a factory constructor.
  @protected
  CygnusPlatformLocalStorage.implementation(this.params) : super(token: _token);

  static final Object _token = Object();

  /// The parameters used to initialize the [CygnusPlatformLocalStorage].
  final CygnusPlatformLocalStorageCreationParams params;

  @override
  CygnusWebStorageType get webStorageType => params.webStorageType;

  ///{@macro cygnus_core.CygnusPlatformLocalStorage.isClassSupported}
  bool isClassSupported({TargetPlatform? platform}) =>
      _CygnusPlatformLocalStorageClassSupported.isClassSupported(platform: platform);

  ///{@template cygnus_core.CygnusPlatformLocalStorage.isPropertySupported}
  ///Check if the given [property] is supported by the [defaultTargetPlatform] or a specific [platform].
  ///{@endtemplate}
  bool isPropertySupported(
    CygnusPlatformStorageCreationParamsProperty property, {
    TargetPlatform? platform,
  }) => params.isPropertySupported(property, platform: platform);

  ///{@template cygnus_core.CygnusPlatformLocalStorage.isMethodSupported}
  ///Check if the given [method] is supported by the [defaultTargetPlatform] or a specific [platform].
  ///{@endtemplate}
  bool isMethodSupported(
    CygnusPlatformLocalStorageMethod method, {
    TargetPlatform? platform,
  }) => _CygnusPlatformLocalStorageMethodSupported.isMethodSupported(
    method,
    platform: platform,
  );

  @override
  @SupportedPlatforms(
    platforms: [
      AndroidPlatform(),
      IOSPlatform(),
      MacOSPlatform(),
      WebPlatform(),
      WindowsPlatform(),
      LinuxPlatform(),
    ],
  )
  Future<int?> length() => super.length();

  @override
  @SupportedPlatforms(
    platforms: [
      AndroidPlatform(),
      IOSPlatform(),
      MacOSPlatform(),
      WebPlatform(),
      WindowsPlatform(),
      LinuxPlatform(),
    ],
  )
  Future<void> setItem({required String key, required dynamic value}) =>
      super.setItem(key: key, value: value);

  @override
  @SupportedPlatforms(
    platforms: [
      AndroidPlatform(),
      IOSPlatform(),
      MacOSPlatform(),
      WebPlatform(),
      WindowsPlatform(),
      LinuxPlatform(),
    ],
  )
  Future<dynamic> getItem({required String key}) => super.getItem(key: key);

  @override
  @SupportedPlatforms(
    platforms: [
      AndroidPlatform(),
      IOSPlatform(),
      MacOSPlatform(),
      WebPlatform(),
      WindowsPlatform(),
      LinuxPlatform(),
    ],
  )
  Future<void> removeItem({required String key}) => super.removeItem(key: key);

  @override
  @SupportedPlatforms(
    platforms: [
      AndroidPlatform(),
      IOSPlatform(),
      MacOSPlatform(),
      WebPlatform(),
      WindowsPlatform(),
      LinuxPlatform(),
    ],
  )
  Future<List<CygnusWebStorageItem>> getItems() => super.getItems();

  @override
  @SupportedPlatforms(
    platforms: [
      AndroidPlatform(),
      IOSPlatform(),
      MacOSPlatform(),
      WebPlatform(),
      WindowsPlatform(),
      LinuxPlatform(),
    ],
  )
  Future<void> clear() => super.clear();

  @override
  @SupportedPlatforms(
    platforms: [
      AndroidPlatform(),
      IOSPlatform(),
      MacOSPlatform(),
      WebPlatform(),
      WindowsPlatform(),
      LinuxPlatform(),
    ],
  )
  Future<String> key({required int index}) => super.key(index: index);

  @override
  @SupportedPlatforms(
    platforms: [
      AndroidPlatform(),
      IOSPlatform(),
      MacOSPlatform(),
      WebPlatform(),
      WindowsPlatform(),
      LinuxPlatform(),
    ],
  )
  void dispose() => super.dispose();
}

/// Object specifying creation parameters for creating a [CygnusPlatformSessionStorage].
///
/// Platform specific implementations can add additional fields by extending
/// this class.
@immutable
@SupportedPlatforms(
  platforms: [
    AndroidPlatform(),
    IOSPlatform(),
    MacOSPlatform(),
    WebPlatform(),
    WindowsPlatform(),
    LinuxPlatform(),
  ],
)
class CygnusPlatformSessionStorageCreationParams
    extends CygnusPlatformStorageCreationParams {
  /// Used by the platform implementation to create a new [CygnusPlatformSessionStorage].
  CygnusPlatformSessionStorageCreationParams(
    // This parameter prevents breaking changes later.
    // ignore: avoid_unused_constructor_parameters
    CygnusPlatformStorageCreationParams params,
  ) : super(
        controller: params.controller,
        webStorageType: CygnusWebStorageType.SESSION_STORAGE,
      );

  /// Creates a [CygnusPlatformSessionStorageCreationParams] instance based on [CygnusPlatformStorageCreationParams].
  factory CygnusPlatformSessionStorageCreationParams.fromPlatformStorageCreationParams(
    CygnusPlatformStorageCreationParams params,
  ) {
    return CygnusPlatformSessionStorageCreationParams(params);
  }

  ///{@template cygnus_core.CygnusPlatformSessionStorageCreationParams.isClassSupported}
  ///Check if the current class is supported by the [defaultTargetPlatform] or a specific [platform].
  ///{@endtemplate}
  bool isClassSupported({TargetPlatform? platform}) =>
      _CygnusPlatformSessionStorageCreationParamsClassSupported.isClassSupported(
        platform: platform,
      );
}

///{@template cygnus_core.CygnusPlatformSessionStorage}
///Class that provides methods to manage the JavaScript `window.sessionStorage` object.
///It used by [CygnusPlatformWebStorage].
///{@endtemplate}
///{@macro cygnus_core.CygnusPlatformSessionStorage.supported_platforms}
@SupportedPlatforms(
  platforms: [
    AndroidPlatform(),
    IOSPlatform(),
    MacOSPlatform(),
    WebPlatform(),
    WindowsPlatform(),
    LinuxPlatform(),
  ],
)
abstract class CygnusPlatformSessionStorage extends PlatformInterface
    with CygnusPlatformStorage {
  /// Creates a new [CygnusPlatformSessionStorage]
  factory CygnusPlatformSessionStorage(CygnusPlatformSessionStorageCreationParams params) {
    assert(
      CygnusWebViewPlatform.instance != null,
      'A platform implementation for `cygnus` has not been set. Please '
      'ensure that an implementation of `CygnusWebViewPlatform` has been set to '
      '`CygnusWebViewPlatform.instance` before use. For unit testing, '
      '`CygnusWebViewPlatform.instance` can be set with your own test implementation.',
    );
    final CygnusPlatformSessionStorage sessionStorage = CygnusWebViewPlatform.instance!
        .createPlatformSessionStorage(params);
    PlatformInterface.verify(sessionStorage, _token);
    return sessionStorage;
  }

  /// Creates a new empty [CygnusPlatformSessionStorage] to access static methods.
  factory CygnusPlatformSessionStorage.static() {
    assert(
      CygnusWebViewPlatform.instance != null,
      'A platform implementation for `cygnus` has not been set. Please '
      'ensure that an implementation of `CygnusWebViewPlatform` has been set to '
      '`WebViewPlatform.instance` before use. For unit testing, '
      '`WebViewPlatform.instance` can be set with your own test implementation.',
    );
    final CygnusPlatformSessionStorage sessionStorageStatic = CygnusWebViewPlatform
        .instance!
        .createPlatformSessionStorageStatic();
    PlatformInterface.verify(sessionStorageStatic, _token);
    return sessionStorageStatic;
  }

  /// Used by the platform implementation to create a new [CygnusPlatformSessionStorage].
  ///
  /// Should only be used by platform implementations because they can't extend
  /// a class that only contains a factory constructor.
  @protected
  CygnusPlatformSessionStorage.implementation(this.params) : super(token: _token);

  static final Object _token = Object();

  /// The parameters used to initialize the [CygnusPlatformSessionStorage].
  final CygnusPlatformSessionStorageCreationParams params;

  @override
  CygnusWebStorageType get webStorageType => params.webStorageType;

  ///{@macro cygnus_core.CygnusPlatformSessionStorage.isClassSupported}
  bool isClassSupported({TargetPlatform? platform}) =>
      _CygnusPlatformSessionStorageClassSupported.isClassSupported(
        platform: platform,
      );

  ///{@template cygnus_core.CygnusPlatformSessionStorage.isPropertySupported}
  ///Check if the given [property] is supported by the [defaultTargetPlatform] or a specific [platform].
  ///{@endtemplate}
  bool isPropertySupported(
    CygnusPlatformStorageCreationParamsProperty property, {
    TargetPlatform? platform,
  }) => params.isPropertySupported(property, platform: platform);

  ///{@template cygnus_core.CygnusPlatformSessionStorage.isMethodSupported}
  ///Check if the given [method] is supported by the [defaultTargetPlatform] or a specific [platform].
  ///{@endtemplate}
  bool isMethodSupported(
    CygnusPlatformSessionStorageMethod method, {
    TargetPlatform? platform,
  }) => _CygnusPlatformSessionStorageMethodSupported.isMethodSupported(
    method,
    platform: platform,
  );

  @override
  @SupportedPlatforms(
    platforms: [
      AndroidPlatform(),
      IOSPlatform(),
      MacOSPlatform(),
      WebPlatform(),
      WindowsPlatform(),
      LinuxPlatform(),
    ],
  )
  Future<int?> length() => super.length();

  @override
  @SupportedPlatforms(
    platforms: [
      AndroidPlatform(),
      IOSPlatform(),
      MacOSPlatform(),
      WebPlatform(),
      WindowsPlatform(),
      LinuxPlatform(),
    ],
  )
  Future<void> setItem({required String key, required dynamic value}) =>
      super.setItem(key: key, value: value);

  @override
  @SupportedPlatforms(
    platforms: [
      AndroidPlatform(),
      IOSPlatform(),
      MacOSPlatform(),
      WebPlatform(),
      WindowsPlatform(),
      LinuxPlatform(),
    ],
  )
  Future<dynamic> getItem({required String key}) => super.getItem(key: key);

  @override
  @SupportedPlatforms(
    platforms: [
      AndroidPlatform(),
      IOSPlatform(),
      MacOSPlatform(),
      WebPlatform(),
      WindowsPlatform(),
      LinuxPlatform(),
    ],
  )
  Future<void> removeItem({required String key}) => super.removeItem(key: key);

  @override
  @SupportedPlatforms(
    platforms: [
      AndroidPlatform(),
      IOSPlatform(),
      MacOSPlatform(),
      WebPlatform(),
      WindowsPlatform(),
      LinuxPlatform(),
    ],
  )
  Future<List<CygnusWebStorageItem>> getItems() => super.getItems();

  @override
  @SupportedPlatforms(
    platforms: [
      AndroidPlatform(),
      IOSPlatform(),
      MacOSPlatform(),
      WebPlatform(),
      WindowsPlatform(),
      LinuxPlatform(),
    ],
  )
  Future<void> clear() => super.clear();

  @override
  @SupportedPlatforms(
    platforms: [
      AndroidPlatform(),
      IOSPlatform(),
      MacOSPlatform(),
      WebPlatform(),
      WindowsPlatform(),
      LinuxPlatform(),
    ],
  )
  Future<String> key({required int index}) => super.key(index: index);

  @override
  @SupportedPlatforms(
    platforms: [
      AndroidPlatform(),
      IOSPlatform(),
      MacOSPlatform(),
      WebPlatform(),
      WindowsPlatform(),
      LinuxPlatform(),
    ],
  )
  void dispose() => super.dispose();
}
