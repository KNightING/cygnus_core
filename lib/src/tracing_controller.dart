import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:cygnus_core/src/platform_interface/flutter_inappwebview_platform_interface.dart';

///{@macro cygnus_core.PlatformTracingController}
///
///{@macro cygnus_core.PlatformTracingController.supported_platforms}
class TracingController {
  ///{@macro cygnus_core.PlatformTracingController}
  TracingController()
    : this.fromPlatformCreationParams(
        const PlatformTracingControllerCreationParams(),
      );

  /// Constructs a [TracingController] from creation params for a specific
  /// platform.
  TracingController.fromPlatformCreationParams(
    PlatformTracingControllerCreationParams params,
  ) : this.fromPlatform(PlatformTracingController(params));

  /// Constructs a [TracingController] from a specific platform
  /// implementation.
  TracingController.fromPlatform(this.platform);

  /// Implementation of [PlatformTracingController] for the current platform.
  final PlatformTracingController platform;

  static TracingController? _instance;

  ///Gets the [TracingController] shared instance.
  static TracingController instance() {
    if (_instance == null) {
      _instance = TracingController();
    }
    return _instance!;
  }

  ///{@macro cygnus_core.PlatformTracingController.start}
  ///
  ///{@macro cygnus_core.PlatformTracingController.start.supported_platforms}
  Future<void> start({required TracingSettings settings}) =>
      platform.start(settings: settings);

  ///{@macro cygnus_core.PlatformTracingController.stop}
  ///
  ///{@macro cygnus_core.PlatformTracingController.stop.supported_platforms}
  Future<bool> stop({String? filePath}) => platform.stop(filePath: filePath);

  ///{@macro cygnus_core.PlatformTracingController.isTracing}
  ///
  ///{@macro cygnus_core.PlatformTracingController.isTracing.supported_platforms}
  Future<bool> isTracing() => platform.isTracing();

  ///{@macro cygnus_core.PlatformTracingControllerCreationParams.isClassSupported}
  static bool isClassSupported({TargetPlatform? platform}) =>
      PlatformTracingController.static().isClassSupported(platform: platform);

  ///{@macro cygnus_core.PlatformTracingController.isMethodSupported}
  static bool isMethodSupported(
    PlatformTracingControllerMethod method, {
    TargetPlatform? platform,
  }) => PlatformTracingController.static().isMethodSupported(
    method,
    platform: platform,
  );
}
