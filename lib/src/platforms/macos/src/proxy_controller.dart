import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:cygnus_core/src/platform_interface/flutter_inappwebview_platform_interface.dart';

/// Object specifying creation parameters for creating a [MacOSProxyController].
///
/// When adding additional fields make sure they can be null or have a default
/// value to avoid breaking changes. See [CygnusPlatformProxyControllerCreationParams] for
/// more information.
@immutable
class MacOSProxyControllerCreationParams
    extends CygnusPlatformProxyControllerCreationParams {
  /// Creates a new [MacOSProxyControllerCreationParams] instance.
  const MacOSProxyControllerCreationParams(
    // This parameter prevents breaking changes later.
    // ignore: avoid_unused_constructor_parameters
    CygnusPlatformProxyControllerCreationParams params,
  ) : super();

  /// Creates a [MacOSProxyControllerCreationParams] instance based on [CygnusPlatformProxyControllerCreationParams].
  factory MacOSProxyControllerCreationParams.fromPlatformProxyControllerCreationParams(
    CygnusPlatformProxyControllerCreationParams params,
  ) {
    return MacOSProxyControllerCreationParams(params);
  }
}

///{@macro cygnus_core.CygnusPlatformProxyController}
class MacOSProxyController extends CygnusPlatformProxyController
    with ChannelController {
  /// Creates a new [MacOSProxyController].
  MacOSProxyController(CygnusPlatformProxyControllerCreationParams params)
    : super.implementation(
        params is MacOSProxyControllerCreationParams
            ? params
            : MacOSProxyControllerCreationParams.fromPlatformProxyControllerCreationParams(
                params,
              ),
      ) {
    channel = const MethodChannel(
      'com.pichillilorenzo/flutter_inappwebview_proxycontroller',
    );
    handler = handleMethod;
    initMethodCallHandler();
  }

  static MacOSProxyController? _instance;

  ///Gets the [MacOSProxyController] shared instance.
  static MacOSProxyController instance() {
    return (_instance != null) ? _instance! : _init();
  }

  static MacOSProxyController _init() {
    _instance = MacOSProxyController(
      MacOSProxyControllerCreationParams(
        const CygnusPlatformProxyControllerCreationParams(),
      ),
    );
    return _instance!;
  }

  static final MacOSProxyController _staticValue = MacOSProxyController(
    MacOSProxyControllerCreationParams(
      const CygnusPlatformProxyControllerCreationParams(),
    ),
  );

  /// Provide static access.
  factory MacOSProxyController.static() {
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

extension InternalProxyController on MacOSProxyController {
  get handleMethod => _handleMethod;
}
