import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:cygnus_core/src/platform_interface/flutter_inappwebview_platform_interface.dart';

///{@macro cygnus_core.PlatformProxyController}
///
///{@macro cygnus_core.PlatformProxyController.supported_platforms}
class ProxyController {
  ///{@macro cygnus_core.PlatformProxyController}
  ProxyController()
    : this.fromPlatformCreationParams(
        const PlatformProxyControllerCreationParams(),
      );

  /// Constructs a [ProxyController] from creation params for a specific
  /// platform.
  ProxyController.fromPlatformCreationParams(
    PlatformProxyControllerCreationParams params,
  ) : this.fromPlatform(PlatformProxyController(params));

  /// Constructs a [ProxyController] from a specific platform
  /// implementation.
  ProxyController.fromPlatform(this.platform);

  /// Implementation of [PlatformProxyController] for the current platform.
  final PlatformProxyController platform;

  static ProxyController? _instance;

  ///Gets the [ProxyController] shared instance.
  static ProxyController instance() {
    if (_instance == null) {
      _instance = ProxyController();
    }
    return _instance!;
  }

  ///{@macro cygnus_core.PlatformProxyController.setProxyOverride}
  ///
  ///{@macro cygnus_core.PlatformProxyController.setProxyOverride.supported_platforms}
  Future<void> setProxyOverride({required ProxySettings settings}) =>
      platform.setProxyOverride(settings: settings);

  ///{@macro cygnus_core.PlatformProxyController.clearProxyOverride}
  ///
  ///{@macro cygnus_core.PlatformProxyController.clearProxyOverride.supported_platforms}
  Future<void> clearProxyOverride() => platform.clearProxyOverride();

  ///{@macro cygnus_core.PlatformProxyControllerCreationParams.isClassSupported}
  static bool isClassSupported({TargetPlatform? platform}) =>
      PlatformProxyController.static().isClassSupported(platform: platform);

  ///{@macro cygnus_core.PlatformProxyController.isMethodSupported}
  static bool isMethodSupported(
    PlatformProxyControllerMethod method, {
    TargetPlatform? platform,
  }) => PlatformProxyController.static().isMethodSupported(
    method,
    platform: platform,
  );
}
