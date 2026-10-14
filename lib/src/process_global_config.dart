import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:cygnus_core/src/platform_interface/flutter_webview_platform_interface.dart';

///{@macro cygnus_core.CygnusPlatformProcessGlobalConfig}
///
///{@macro cygnus_core.CygnusPlatformProcessGlobalConfig.supported_platforms}
class CygnusProcessGlobalConfig {
  ///{@macro cygnus_core.CygnusPlatformProcessGlobalConfig}
  CygnusProcessGlobalConfig()
    : this.fromPlatformCreationParams(
        const CygnusPlatformProcessGlobalConfigCreationParams(),
      );

  /// Constructs a [CygnusProcessGlobalConfig] from creation params for a specific
  /// platform.
  CygnusProcessGlobalConfig.fromPlatformCreationParams(
    CygnusPlatformProcessGlobalConfigCreationParams params,
  ) : this.fromPlatform(CygnusPlatformProcessGlobalConfig(params));

  /// Constructs a [CygnusProcessGlobalConfig] from a specific platform
  /// implementation.
  CygnusProcessGlobalConfig.fromPlatform(this.platform);

  /// Implementation of [CygnusPlatformProcessGlobalConfig] for the current platform.
  final CygnusPlatformProcessGlobalConfig platform;

  static CygnusProcessGlobalConfig? _instance;

  ///Gets the [CygnusProcessGlobalConfig] shared instance.
  static CygnusProcessGlobalConfig instance() {
    if (_instance == null) {
      _instance = CygnusProcessGlobalConfig();
    }
    return _instance!;
  }

  ///{@macro cygnus_core.CygnusPlatformProcessGlobalConfig.apply}
  ///
  ///{@macro cygnus_core.CygnusPlatformProcessGlobalConfig.apply.supported_platforms}
  Future<void> apply({required CygnusProcessGlobalConfigSettings settings}) =>
      platform.apply(settings: settings);

  ///{@macro cygnus_core.CygnusPlatformProcessGlobalConfigCreationParams.isClassSupported}
  static bool isClassSupported({TargetPlatform? platform}) =>
      CygnusPlatformProcessGlobalConfig.static().isClassSupported(platform: platform);

  ///{@macro cygnus_core.CygnusPlatformProcessGlobalConfig.isMethodSupported}
  static bool isMethodSupported(
    CygnusPlatformProcessGlobalConfigMethod method, {
    TargetPlatform? platform,
  }) => CygnusPlatformProcessGlobalConfig.static().isMethodSupported(
    method,
    platform: platform,
  );
}
