import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:cygnus_core/src/platform_interface/flutter_webview_platform_interface.dart';

///{@macro cygnus_core.CygnusPlatformProxyController}
///
///{@macro cygnus_core.CygnusPlatformProxyController.supported_platforms}
class CygnusProxyController {
  ///{@macro cygnus_core.CygnusPlatformProxyController}
  CygnusProxyController()
    : this.fromPlatformCreationParams(
        const CygnusPlatformProxyControllerCreationParams(),
      );

  /// Constructs a [CygnusProxyController] from creation params for a specific
  /// platform.
  CygnusProxyController.fromPlatformCreationParams(
    CygnusPlatformProxyControllerCreationParams params,
  ) : this.fromPlatform(CygnusPlatformProxyController(params));

  /// Constructs a [CygnusProxyController] from a specific platform
  /// implementation.
  CygnusProxyController.fromPlatform(this.platform);

  /// Implementation of [CygnusPlatformProxyController] for the current platform.
  final CygnusPlatformProxyController platform;

  static CygnusProxyController? _instance;

  ///Gets the [CygnusProxyController] shared instance.
  static CygnusProxyController instance() {
    if (_instance == null) {
      _instance = CygnusProxyController();
    }
    return _instance!;
  }

  ///{@macro cygnus_core.CygnusPlatformProxyController.setProxyOverride}
  ///
  ///{@macro cygnus_core.CygnusPlatformProxyController.setProxyOverride.supported_platforms}
  Future<void> setProxyOverride({required CygnusProxySettings settings}) =>
      platform.setProxyOverride(settings: settings);

  ///{@macro cygnus_core.CygnusPlatformProxyController.clearProxyOverride}
  ///
  ///{@macro cygnus_core.CygnusPlatformProxyController.clearProxyOverride.supported_platforms}
  Future<void> clearProxyOverride() => platform.clearProxyOverride();

  ///{@macro cygnus_core.CygnusPlatformProxyControllerCreationParams.isClassSupported}
  static bool isClassSupported({TargetPlatform? platform}) =>
      CygnusPlatformProxyController.static().isClassSupported(platform: platform);

  ///{@macro cygnus_core.CygnusPlatformProxyController.isMethodSupported}
  static bool isMethodSupported(
    CygnusPlatformProxyControllerMethod method, {
    TargetPlatform? platform,
  }) => CygnusPlatformProxyController.static().isMethodSupported(
    method,
    platform: platform,
  );
}
