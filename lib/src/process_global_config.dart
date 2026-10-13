import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:cygnus_core/src/platform_interface/flutter_inappwebview_platform_interface.dart';

///{@macro cygnus_core.PlatformProcessGlobalConfig}
///
///{@macro cygnus_core.PlatformProcessGlobalConfig.supported_platforms}
class ProcessGlobalConfig {
  ///{@macro cygnus_core.PlatformProcessGlobalConfig}
  ProcessGlobalConfig()
    : this.fromPlatformCreationParams(
        const PlatformProcessGlobalConfigCreationParams(),
      );

  /// Constructs a [ProcessGlobalConfig] from creation params for a specific
  /// platform.
  ProcessGlobalConfig.fromPlatformCreationParams(
    PlatformProcessGlobalConfigCreationParams params,
  ) : this.fromPlatform(PlatformProcessGlobalConfig(params));

  /// Constructs a [ProcessGlobalConfig] from a specific platform
  /// implementation.
  ProcessGlobalConfig.fromPlatform(this.platform);

  /// Implementation of [PlatformProcessGlobalConfig] for the current platform.
  final PlatformProcessGlobalConfig platform;

  static ProcessGlobalConfig? _instance;

  ///Gets the [ProcessGlobalConfig] shared instance.
  static ProcessGlobalConfig instance() {
    if (_instance == null) {
      _instance = ProcessGlobalConfig();
    }
    return _instance!;
  }

  ///{@macro cygnus_core.PlatformProcessGlobalConfig.apply}
  ///
  ///{@macro cygnus_core.PlatformProcessGlobalConfig.apply.supported_platforms}
  Future<void> apply({required ProcessGlobalConfigSettings settings}) =>
      platform.apply(settings: settings);

  ///{@macro cygnus_core.PlatformProcessGlobalConfigCreationParams.isClassSupported}
  static bool isClassSupported({TargetPlatform? platform}) =>
      PlatformProcessGlobalConfig.static().isClassSupported(platform: platform);

  ///{@macro cygnus_core.PlatformProcessGlobalConfig.isMethodSupported}
  static bool isMethodSupported(
    PlatformProcessGlobalConfigMethod method, {
    TargetPlatform? platform,
  }) => PlatformProcessGlobalConfig.static().isMethodSupported(
    method,
    platform: platform,
  );
}
