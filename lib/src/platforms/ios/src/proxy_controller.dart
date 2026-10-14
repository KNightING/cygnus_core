import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:cygnus_core/src/platform_interface/flutter_inappwebview_platform_interface.dart';

/// Object specifying creation parameters for creating a [IOSProxyController].
///
/// When adding additional fields make sure they can be null or have a default
/// value to avoid breaking changes. See [CygnusPlatformProxyControllerCreationParams] for
/// more information.
@immutable
class IOSProxyControllerCreationParams
    extends CygnusPlatformProxyControllerCreationParams {
  /// Creates a new [IOSProxyControllerCreationParams] instance.
  const IOSProxyControllerCreationParams(
    // This parameter prevents breaking changes later.
    // ignore: avoid_unused_constructor_parameters
    CygnusPlatformProxyControllerCreationParams params,
  ) : super();

  /// Creates a [IOSProxyControllerCreationParams] instance based on [CygnusPlatformProxyControllerCreationParams].
  factory IOSProxyControllerCreationParams.fromPlatformProxyControllerCreationParams(
    CygnusPlatformProxyControllerCreationParams params,
  ) {
    return IOSProxyControllerCreationParams(params);
  }
}

///{@macro cygnus_core.CygnusPlatformProxyController}
class IOSProxyController extends CygnusPlatformProxyController
    with ChannelController {
  /// Creates a new [IOSProxyController].
  IOSProxyController(CygnusPlatformProxyControllerCreationParams params)
    : super.implementation(
        params is IOSProxyControllerCreationParams
            ? params
            : IOSProxyControllerCreationParams.fromPlatformProxyControllerCreationParams(
                params,
              ),
      ) {
    channel = const MethodChannel(
      'com.pichillilorenzo/flutter_inappwebview_proxycontroller',
    );
    handler = handleMethod;
    initMethodCallHandler();
  }

  static IOSProxyController? _instance;

  ///Gets the [IOSProxyController] shared instance.
  static IOSProxyController instance() {
    return (_instance != null) ? _instance! : _init();
  }

  static IOSProxyController _init() {
    _instance = IOSProxyController(
      IOSProxyControllerCreationParams(
        const CygnusPlatformProxyControllerCreationParams(),
      ),
    );
    return _instance!;
  }

  static final IOSProxyController _staticValue = IOSProxyController(
    IOSProxyControllerCreationParams(
      const CygnusPlatformProxyControllerCreationParams(),
    ),
  );

  /// Provide static access.
  factory IOSProxyController.static() {
    return _staticValue;
  }

  Future<dynamic> _handleMethod(MethodCall call) async {}

  @override
  Future<void> setProxyOverride({required CygnusProxySettings settings}) async {
    Map<String, dynamic> args = <String, dynamic>{};
    args.putIfAbsent("settings", () => settings.toMap());
    await channel?.invokeMethod('setProxyOverride', args);
  }

  @override
  Future<void> clearProxyOverride() async {
    Map<String, dynamic> args = <String, dynamic>{};
    await channel?.invokeMethod('clearProxyOverride', args);
  }

  @override
  void dispose() {
    // empty
  }
}

extension InternalProxyController on IOSProxyController {
  get handleMethod => _handleMethod;
}
