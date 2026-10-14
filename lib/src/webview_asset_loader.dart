import 'package:flutter/foundation.dart';
import 'package:cygnus_core/src/platform_interface/flutter_inappwebview_platform_interface.dart';

///{@macro cygnus_core.CygnusPlatformPathHandler}
///
///{@macro cygnus_core.CygnusPlatformPathHandler.supported_platforms}
abstract class CygnusPathHandler
    implements CygnusPlatformPathHandler, CygnusPlatformPathHandlerEvents {
  /// Constructs a [CygnusPathHandler] from a specific platform implementation.
  CygnusPathHandler.fromPlatform({required this.platform}) {
    this.platform.eventHandler = this;
  }

  /// Returns whether this class is supported on the current platform.
  ///
  /// Use [platform] to check support for a specific platform.
  static bool isClassSupported({TargetPlatform? platform}) =>
      CygnusPlatformPathHandlerCreationParams(
        path: '',
      ).isClassSupported(platform: platform);

  @override
  late final CygnusPlatformPathHandlerEvents? eventHandler;

  /// Implementation of [CygnusPlatformPathHandler] for the current platform.
  final CygnusPlatformPathHandler platform;

  @override
  String get type => platform.type;

  @override
  String get path => platform.path;

  @override
  Future<CygnusWebResourceResponse?> handle(String path) async {
    return null;
  }

  @override
  Map<String, dynamic> toMap({CygnusEnumMethod? enumMethod}) =>
      platform.toMap(enumMethod: enumMethod);

  @override
  Map<String, dynamic> toJson() => platform.toJson();
}

///{@macro cygnus_core.CygnusPlatformAssetsPathHandler}
///
///{@macro cygnus_core.CygnusPlatformAssetsPathHandler.supported_platforms}
class CygnusAssetsPathHandler extends CygnusPathHandler {
  ///{@macro cygnus_core.CygnusPlatformAssetsPathHandler}
  ///
  ///{@macro cygnus_core.CygnusPlatformAssetsPathHandler.supported_platforms}
  CygnusAssetsPathHandler({required String path})
    : this.fromPlatformCreationParams(
        params: CygnusPlatformAssetsPathHandlerCreationParams(
          CygnusPlatformPathHandlerCreationParams(path: path),
        ),
      );

  /// Constructs a [CygnusAssetsPathHandler].
  ///
  /// See [CygnusAssetsPathHandler.fromPlatformCreationParams] for setting parameters for
  /// a specific platform.
  CygnusAssetsPathHandler.fromPlatformCreationParams({
    required CygnusPlatformAssetsPathHandlerCreationParams params,
  }) : this.fromPlatform(platform: CygnusPlatformAssetsPathHandler(params));

  /// Constructs a [CygnusAssetsPathHandler] from a specific platform implementation.
  CygnusAssetsPathHandler.fromPlatform({required this.platform})
    : super.fromPlatform(platform: platform);

  /// Implementation of [CygnusPlatformAssetsPathHandler] for the current platform.
  final CygnusPlatformAssetsPathHandler platform;

  /// Returns whether this class is supported on the current platform.
  ///
  /// Use [platform] to check support for a specific platform.
  static bool isClassSupported({TargetPlatform? platform}) =>
      CygnusPlatformPathHandlerCreationParams(
        path: '',
      ).isClassSupported(platform: platform);
}

///{@macro cygnus_core.CygnusPlatformResourcesPathHandler}
///
///{@macro cygnus_core.CygnusPlatformResourcesPathHandler.supported_platforms}
class CygnusResourcesPathHandler extends CygnusPathHandler {
  ///{@macro cygnus_core.CygnusPlatformResourcesPathHandler}
  ///
  ///{@macro cygnus_core.CygnusPlatformResourcesPathHandler.supported_platforms}
  CygnusResourcesPathHandler({required String path})
    : this.fromPlatformCreationParams(
        params: CygnusPlatformResourcesPathHandlerCreationParams(
          CygnusPlatformPathHandlerCreationParams(path: path),
        ),
      );

  /// Constructs a [CygnusResourcesPathHandler].
  ///
  /// See [CygnusResourcesPathHandler.fromPlatformCreationParams] for setting parameters for
  /// a specific platform.
  CygnusResourcesPathHandler.fromPlatformCreationParams({
    required CygnusPlatformResourcesPathHandlerCreationParams params,
  }) : this.fromPlatform(platform: CygnusPlatformResourcesPathHandler(params));

  /// Constructs a [CygnusResourcesPathHandler] from a specific platform implementation.
  CygnusResourcesPathHandler.fromPlatform({required this.platform})
    : super.fromPlatform(platform: platform);

  /// Implementation of [CygnusPlatformResourcesPathHandler] for the current platform.
  final CygnusPlatformResourcesPathHandler platform;

  /// Returns whether this class is supported on the current platform.
  ///
  /// Use [platform] to check support for a specific platform.
  static bool isClassSupported({TargetPlatform? platform}) =>
      CygnusPlatformPathHandlerCreationParams(
        path: '',
      ).isClassSupported(platform: platform);
}

///{@macro cygnus_core.CygnusPlatformInternalStoragePathHandler}
///
///{@macro cygnus_core.CygnusPlatformInternalStoragePathHandler.supported_platforms}
class CygnusInternalStoragePathHandler extends CygnusPathHandler {
  ///{@macro cygnus_core.CygnusPlatformInternalStoragePathHandler}
  ///
  ///{@macro cygnus_core.CygnusPlatformInternalStoragePathHandler.supported_platforms}
  CygnusInternalStoragePathHandler({required String path, required String directory})
    : this.fromPlatformCreationParams(
        params: CygnusPlatformInternalStoragePathHandlerCreationParams(
          CygnusPlatformPathHandlerCreationParams(path: path),
          directory: directory,
        ),
      );

  /// Constructs a [CygnusInternalStoragePathHandler].
  ///
  /// See [CygnusInternalStoragePathHandler.fromPlatformCreationParams] for setting parameters for
  /// a specific platform.
  CygnusInternalStoragePathHandler.fromPlatformCreationParams({
    required CygnusPlatformInternalStoragePathHandlerCreationParams params,
  }) : this.fromPlatform(platform: CygnusPlatformInternalStoragePathHandler(params));

  /// Constructs a [CygnusInternalStoragePathHandler] from a specific platform implementation.
  CygnusInternalStoragePathHandler.fromPlatform({required this.platform})
    : super.fromPlatform(platform: platform);

  /// Implementation of [CygnusPlatformInternalStoragePathHandler] for the current platform.
  final CygnusPlatformInternalStoragePathHandler platform;

  String get directory => platform.directory;

  /// Returns whether this class is supported on the current platform.
  ///
  /// Use [platform] to check support for a specific platform.
  static bool isClassSupported({TargetPlatform? platform}) =>
      CygnusPlatformPathHandlerCreationParams(
        path: '',
      ).isClassSupported(platform: platform);
}

///{@macro cygnus_core.CygnusPlatformCustomPathHandler}
///
///{@macro cygnus_core.CygnusPlatformCustomPathHandler.supported_platforms}
abstract class CygnusCustomPathHandler extends CygnusPathHandler {
  ///{@macro cygnus_core.CygnusPlatformCustomPathHandler}
  ///
  ///{@macro cygnus_core.CygnusPlatformCustomPathHandler.supported_platforms}
  CygnusCustomPathHandler({required String path})
    : this.fromPlatformCreationParams(
        params: CygnusPlatformCustomPathHandlerCreationParams(
          CygnusPlatformPathHandlerCreationParams(path: path),
        ),
      );

  /// Constructs a [CygnusCustomPathHandler].
  ///
  /// See [CygnusCustomPathHandler.fromPlatformCreationParams] for setting parameters for
  /// a specific platform.
  CygnusCustomPathHandler.fromPlatformCreationParams({
    required CygnusPlatformCustomPathHandlerCreationParams params,
  }) : this.fromPlatform(platform: CygnusPlatformCustomPathHandler(params));

  /// Constructs a [CygnusCustomPathHandler] from a specific platform implementation.
  CygnusCustomPathHandler.fromPlatform({required this.platform})
    : super.fromPlatform(platform: platform);

  /// Implementation of [CygnusPlatformCustomPathHandler] for the current platform.
  final CygnusPlatformCustomPathHandler platform;

  /// Returns whether this class is supported on the current platform.
  ///
  /// Use [platform] to check support for a specific platform.
  static bool isClassSupported({TargetPlatform? platform}) =>
      CygnusPlatformPathHandlerCreationParams(
        path: '',
      ).isClassSupported(platform: platform);
}
