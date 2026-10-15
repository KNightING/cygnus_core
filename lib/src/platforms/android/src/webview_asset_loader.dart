import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:cygnus_core/src/platform_interface/flutter_webview_platform_interface.dart';

/// Object specifying creation parameters for creating a [AndroidPathHandler].
///
/// When adding additional fields make sure they can be null or have a default
/// value to avoid breaking changes. See [CygnusPlatformPathHandlerCreationParams] for
/// more information.
@immutable
class AndroidPathHandlerCreationParams
    extends CygnusPlatformPathHandlerCreationParams {
  /// Creates a new [AndroidPathHandlerCreationParams] instance.
  AndroidPathHandlerCreationParams(
    // This parameter prevents breaking changes later.
    // ignore: avoid_unused_constructor_parameters
    CygnusPlatformPathHandlerCreationParams params,
  ) : super(path: params.path);

  /// Creates a [AndroidPathHandlerCreationParams] instance based on [CygnusPlatformPathHandlerCreationParams].
  factory AndroidPathHandlerCreationParams.fromPlatformPathHandlerCreationParams(
    CygnusPlatformPathHandlerCreationParams params,
  ) {
    return AndroidPathHandlerCreationParams(params);
  }
}

///{@macro cygnus_core.CygnusPlatformPathHandler}
abstract mixin class AndroidPathHandler
    implements ChannelController, CygnusPlatformPathHandler {
  final String _id = IdGenerator.generate();

  @override
  late final CygnusPlatformPathHandlerEvents? eventHandler;

  @override
  late final String path;

  void _init(CygnusPlatformPathHandlerCreationParams params) {
    this.path = params.path;
    channel = MethodChannel(
      'com.github.knighting.cygnus/webview_custompathhandler_${_id}',
    );
    handler = _handleMethod;
    initMethodCallHandler();
  }

  Future<dynamic> _handleMethod(MethodCall call) async {
    switch (call.method) {
      case "handle":
        String path = call.arguments["path"];
        return (await eventHandler?.handle(path))?.toMap();
      default:
        throw UnimplementedError("Unimplemented ${call.method} method");
    }
  }

  @override
  Map<String, dynamic> toMap({CygnusEnumMethod? enumMethod}) {
    return {"path": path, "type": type, "id": _id};
  }

  @override
  Map<String, dynamic> toJson() {
    return toMap();
  }

  @override
  String toString() {
    return 'AndroidPathHandler{path: $path, type: $type}';
  }

  @override
  void dispose() {
    disposeChannel();
    eventHandler = null;
  }
}

/// Object specifying creation parameters for creating a [AndroidAssetsPathHandler].
///
/// When adding additional fields make sure they can be null or have a default
/// value to avoid breaking changes. See [CygnusPlatformAssetsPathHandlerCreationParams] for
/// more information.
@immutable
class AndroidAssetsPathHandlerCreationParams
    extends CygnusPlatformAssetsPathHandlerCreationParams {
  /// Creates a new [AndroidAssetsPathHandlerCreationParams] instance.
  AndroidAssetsPathHandlerCreationParams(
    // This parameter prevents breaking changes later.
    // ignore: avoid_unused_constructor_parameters
    CygnusPlatformAssetsPathHandlerCreationParams params,
  ) : super(params);

  /// Creates a [AndroidAssetsPathHandlerCreationParams] instance based on [CygnusPlatformAssetsPathHandlerCreationParams].
  factory AndroidAssetsPathHandlerCreationParams.fromPlatformAssetsPathHandlerCreationParams(
    CygnusPlatformAssetsPathHandlerCreationParams params,
  ) {
    return AndroidAssetsPathHandlerCreationParams(params);
  }
}

///{@macro cygnus_core.CygnusPlatformAssetsPathHandler}
class AndroidAssetsPathHandler extends CygnusPlatformAssetsPathHandler
    with AndroidPathHandler, ChannelController {
  /// Constructs a [AndroidAssetsPathHandler].
  AndroidAssetsPathHandler(CygnusPlatformAssetsPathHandlerCreationParams params)
    : super.implementation(
        params is AndroidAssetsPathHandlerCreationParams
            ? params
            : AndroidAssetsPathHandlerCreationParams.fromPlatformAssetsPathHandlerCreationParams(
                params,
              ),
      ) {
    _init(params);
  }

  static final AndroidAssetsPathHandler _staticValue = AndroidAssetsPathHandler(
    AndroidAssetsPathHandlerCreationParams(
      CygnusPlatformAssetsPathHandlerCreationParams(
        CygnusPlatformPathHandlerCreationParams(path: ''),
      ),
    ),
  );

  /// Creates a new empty [AndroidAssetsPathHandler] to access static methods.
  factory AndroidAssetsPathHandler.static() => _staticValue;
}

/// Object specifying creation parameters for creating a [AndroidResourcesPathHandler].
///
/// When adding additional fields make sure they can be null or have a default
/// value to avoid breaking changes. See [CygnusPlatformResourcesPathHandlerCreationParams] for
/// more information.
@immutable
class AndroidResourcesPathHandlerCreationParams
    extends CygnusPlatformResourcesPathHandlerCreationParams {
  /// Creates a new [AndroidResourcesPathHandlerCreationParams] instance.
  AndroidResourcesPathHandlerCreationParams(
    // This parameter prevents breaking changes later.
    // ignore: avoid_unused_constructor_parameters
    CygnusPlatformResourcesPathHandlerCreationParams params,
  ) : super(params);

  /// Creates a [AndroidResourcesPathHandlerCreationParams] instance based on [CygnusPlatformResourcesPathHandlerCreationParams].
  factory AndroidResourcesPathHandlerCreationParams.fromPlatformResourcesPathHandlerCreationParams(
    CygnusPlatformResourcesPathHandlerCreationParams params,
  ) {
    return AndroidResourcesPathHandlerCreationParams(params);
  }
}

///{@macro cygnus_core.CygnusPlatformResourcesPathHandler}
class AndroidResourcesPathHandler extends CygnusPlatformResourcesPathHandler
    with AndroidPathHandler, ChannelController {
  /// Constructs a [AndroidResourcesPathHandler].
  AndroidResourcesPathHandler(CygnusPlatformResourcesPathHandlerCreationParams params)
    : super.implementation(
        params is AndroidResourcesPathHandlerCreationParams
            ? params
            : AndroidResourcesPathHandlerCreationParams.fromPlatformResourcesPathHandlerCreationParams(
                params,
              ),
      ) {
    _init(params);
  }

  static final AndroidResourcesPathHandler _staticValue =
      AndroidResourcesPathHandler(
        AndroidResourcesPathHandlerCreationParams(
          CygnusPlatformResourcesPathHandlerCreationParams(
            CygnusPlatformPathHandlerCreationParams(path: ''),
          ),
        ),
      );

  /// Creates a new empty [AndroidResourcesPathHandler] to access static methods.
  factory AndroidResourcesPathHandler.static() => _staticValue;
}

/// Object specifying creation parameters for creating a [AndroidInternalStoragePathHandler].
///
/// When adding additional fields make sure they can be null or have a default
/// value to avoid breaking changes. See [CygnusPlatformInternalStoragePathHandlerCreationParams] for
/// more information.
@immutable
class AndroidInternalStoragePathHandlerCreationParams
    extends CygnusPlatformInternalStoragePathHandlerCreationParams {
  /// Creates a new [AndroidInternalStoragePathHandlerCreationParams] instance.
  AndroidInternalStoragePathHandlerCreationParams(
    // This parameter prevents breaking changes later.
    // ignore: avoid_unused_constructor_parameters
    CygnusPlatformInternalStoragePathHandlerCreationParams params,
  ) : super(params, directory: params.directory);

  /// Creates a [AndroidInternalStoragePathHandlerCreationParams] instance based on [CygnusPlatformInternalStoragePathHandlerCreationParams].
  factory AndroidInternalStoragePathHandlerCreationParams.fromPlatformInternalStoragePathHandlerCreationParams(
    CygnusPlatformInternalStoragePathHandlerCreationParams params,
  ) {
    return AndroidInternalStoragePathHandlerCreationParams(params);
  }
}

///{@macro cygnus_core.CygnusPlatformInternalStoragePathHandler}
class AndroidInternalStoragePathHandler
    extends CygnusPlatformInternalStoragePathHandler
    with AndroidPathHandler, ChannelController {
  /// Constructs a [AndroidInternalStoragePathHandler].
  AndroidInternalStoragePathHandler(
    CygnusPlatformInternalStoragePathHandlerCreationParams params,
  ) : super.implementation(
        params is AndroidInternalStoragePathHandlerCreationParams
            ? params
            : AndroidInternalStoragePathHandlerCreationParams.fromPlatformInternalStoragePathHandlerCreationParams(
                params,
              ),
      ) {
    _init(params);
  }

  static final AndroidInternalStoragePathHandler _staticValue =
      AndroidInternalStoragePathHandler(
        AndroidInternalStoragePathHandlerCreationParams(
          CygnusPlatformInternalStoragePathHandlerCreationParams(
            CygnusPlatformPathHandlerCreationParams(path: ''),
            directory: '',
          ),
        ),
      );

  /// Creates a new empty [AndroidInternalStoragePathHandler] to access static methods.
  factory AndroidInternalStoragePathHandler.static() => _staticValue;

  AndroidInternalStoragePathHandlerCreationParams get _internalParams =>
      params as AndroidInternalStoragePathHandlerCreationParams;

  @override
  String get directory => _internalParams.directory;

  @override
  Map<String, dynamic> toMap({CygnusEnumMethod? enumMethod}) {
    return {...super.toMap(), 'directory': directory};
  }
}

/// Object specifying creation parameters for creating a [AndroidCustomPathHandler].
///
/// When adding additional fields make sure they can be null or have a default
/// value to avoid breaking changes. See [CygnusPlatformCustomPathHandlerCreationParams] for
/// more information.
@immutable
class AndroidCustomPathHandlerCreationParams
    extends CygnusPlatformCustomPathHandlerCreationParams {
  /// Creates a new [AndroidCustomPathHandlerCreationParams] instance.
  AndroidCustomPathHandlerCreationParams(
    // This parameter prevents breaking changes later.
    // ignore: avoid_unused_constructor_parameters
    CygnusPlatformCustomPathHandlerCreationParams params,
  ) : super(params);

  /// Creates a [AndroidCustomPathHandlerCreationParams] instance based on [CygnusPlatformCustomPathHandlerCreationParams].
  factory AndroidCustomPathHandlerCreationParams.fromPlatformCustomPathHandlerCreationParams(
    CygnusPlatformCustomPathHandlerCreationParams params,
  ) {
    return AndroidCustomPathHandlerCreationParams(params);
  }
}

///{@macro cygnus_core.CygnusPlatformCustomPathHandler}
class AndroidCustomPathHandler extends CygnusPlatformCustomPathHandler
    with AndroidPathHandler, ChannelController {
  /// Constructs a [AndroidCustomPathHandler].
  AndroidCustomPathHandler(CygnusPlatformCustomPathHandlerCreationParams params)
    : super.implementation(
        params is AndroidCustomPathHandlerCreationParams
            ? params
            : AndroidCustomPathHandlerCreationParams.fromPlatformCustomPathHandlerCreationParams(
                params,
              ),
      ) {
    _init(params);
  }

  static final AndroidCustomPathHandler _staticValue = AndroidCustomPathHandler(
    AndroidCustomPathHandlerCreationParams(
      CygnusPlatformCustomPathHandlerCreationParams(
        CygnusPlatformPathHandlerCreationParams(path: ''),
      ),
    ),
  );

  /// Creates a new empty [AndroidCustomPathHandler] to access static methods.
  factory AndroidCustomPathHandler.static() => _staticValue;
}
