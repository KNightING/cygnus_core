import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:cygnus_core/src/platform_interface/flutter_inappwebview_platform_interface.dart';

/// Object specifying creation parameters for creating a [AndroidProcessGlobalConfig].
///
/// When adding additional fields make sure they can be null or have a default
/// value to avoid breaking changes. See [CygnusPlatformProcessGlobalConfigCreationParams] for
/// more information.
@immutable
class AndroidProcessGlobalConfigCreationParams
    extends CygnusPlatformProcessGlobalConfigCreationParams {
  /// Creates a new [AndroidProcessGlobalConfigCreationParams] instance.
  const AndroidProcessGlobalConfigCreationParams(
    // This parameter prevents breaking changes later.
    // ignore: avoid_unused_constructor_parameters
    CygnusPlatformProcessGlobalConfigCreationParams params,
  ) : super();

  /// Creates a [AndroidProcessGlobalConfigCreationParams] instance based on [CygnusPlatformProcessGlobalConfigCreationParams].
  factory AndroidProcessGlobalConfigCreationParams.fromPlatformProcessGlobalConfigCreationParams(
    CygnusPlatformProcessGlobalConfigCreationParams params,
  ) {
    return AndroidProcessGlobalConfigCreationParams(params);
  }
}

///{@macro cygnus_core.CygnusPlatformProcessGlobalConfig}
class AndroidProcessGlobalConfig extends CygnusPlatformProcessGlobalConfig
    with ChannelController {
  /// Creates a new [AndroidProcessGlobalConfig].
  AndroidProcessGlobalConfig(CygnusPlatformProcessGlobalConfigCreationParams params)
    : super.implementation(
        params is AndroidProcessGlobalConfigCreationParams
            ? params
            : AndroidProcessGlobalConfigCreationParams.fromPlatformProcessGlobalConfigCreationParams(
                params,
              ),
      ) {
    channel = const MethodChannel(
      'com.pichillilorenzo/flutter_inappwebview_processglobalconfig',
    );
    handler = handleMethod;
    initMethodCallHandler();
  }

  static AndroidProcessGlobalConfig? _instance;

  ///Gets the [AndroidProcessGlobalConfig] shared instance.
  static AndroidProcessGlobalConfig instance() {
    return (_instance != null) ? _instance! : _init();
  }

  static AndroidProcessGlobalConfig _init() {
    _instance = AndroidProcessGlobalConfig(
      AndroidProcessGlobalConfigCreationParams(
        const CygnusPlatformProcessGlobalConfigCreationParams(),
      ),
    );
    return _instance!;
  }

  static final AndroidProcessGlobalConfig _staticValue =
      AndroidProcessGlobalConfig(
        AndroidProcessGlobalConfigCreationParams(
          const CygnusPlatformProcessGlobalConfigCreationParams(),
        ),
      );

  /// Provide static access.
  factory AndroidProcessGlobalConfig.static() {
    return _staticValue;
  }

  Future<dynamic> _handleMethod(MethodCall call) async {}

  @override
  Future<void> apply({required CygnusProcessGlobalConfigSettings settings}) async {
    Map<String, dynamic> args = <String, dynamic>{};
    args.putIfAbsent("settings", () => settings.toMap());
    await channel?.invokeMethod('apply', args);
  }

  @override
  void dispose() {
    // empty
  }
}

extension InternalProcessGlobalConfig on AndroidProcessGlobalConfig {
  get handleMethod => _handleMethod;
}
