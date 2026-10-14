import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:cygnus_core/src/platform_interface/flutter_inappwebview_platform_interface.dart';

///{@macro cygnus_core.CygnusPlatformTracingController}
///
///{@macro cygnus_core.CygnusPlatformTracingController.supported_platforms}
class CygnusTracingController {
  ///{@macro cygnus_core.CygnusPlatformTracingController}
  CygnusTracingController()
    : this.fromPlatformCreationParams(
        const CygnusPlatformTracingControllerCreationParams(),
      );

  /// Constructs a [CygnusTracingController] from creation params for a specific
  /// platform.
  CygnusTracingController.fromPlatformCreationParams(
    CygnusPlatformTracingControllerCreationParams params,
  ) : this.fromPlatform(CygnusPlatformTracingController(params));

  /// Constructs a [CygnusTracingController] from a specific platform
  /// implementation.
  CygnusTracingController.fromPlatform(this.platform);

  /// Implementation of [CygnusPlatformTracingController] for the current platform.
  final CygnusPlatformTracingController platform;

  static CygnusTracingController? _instance;

  ///Gets the [CygnusTracingController] shared instance.
  static CygnusTracingController instance() {
    if (_instance == null) {
      _instance = CygnusTracingController();
    }
    return _instance!;
  }

  ///{@macro cygnus_core.CygnusPlatformTracingController.start}
  ///
  ///{@macro cygnus_core.CygnusPlatformTracingController.start.supported_platforms}
  Future<void> start({required CygnusTracingSettings settings}) =>
      platform.start(settings: settings);

  ///{@macro cygnus_core.CygnusPlatformTracingController.stop}
  ///
  ///{@macro cygnus_core.CygnusPlatformTracingController.stop.supported_platforms}
  Future<bool> stop({String? filePath}) => platform.stop(filePath: filePath);

  ///{@macro cygnus_core.CygnusPlatformTracingController.isTracing}
  ///
  ///{@macro cygnus_core.CygnusPlatformTracingController.isTracing.supported_platforms}
  Future<bool> isTracing() => platform.isTracing();

  ///{@macro cygnus_core.CygnusPlatformTracingControllerCreationParams.isClassSupported}
  static bool isClassSupported({TargetPlatform? platform}) =>
      CygnusPlatformTracingController.static().isClassSupported(platform: platform);

  ///{@macro cygnus_core.CygnusPlatformTracingController.isMethodSupported}
  static bool isMethodSupported(
    CygnusPlatformTracingControllerMethod method, {
    TargetPlatform? platform,
  }) => CygnusPlatformTracingController.static().isMethodSupported(
    method,
    platform: platform,
  );
}
