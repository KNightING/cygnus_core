import 'package:flutter/foundation.dart';
import 'package:cygnus_core/src/platform_interface/flutter_webview_platform_interface.dart';
import 'web_message_port.dart';

///{@macro cygnus_core.CygnusPlatformWebMessageChannel}
///
///{@macro cygnus_core.CygnusPlatformWebMessageChannel.supported_platforms}
class CygnusWebMessageChannel {
  ///{@macro cygnus_core.CygnusPlatformWebMessageChannel}
  CygnusWebMessageChannel({
    required String id,
    required CygnusWebMessagePort port1,
    required CygnusWebMessagePort port2,
  }) : this.fromPlatformCreationParams(
         params: CygnusPlatformWebMessageChannelCreationParams(
           id: id,
           port1: port1.platform,
           port2: port2.platform,
         ),
       );

  /// Constructs a [CygnusWebMessageChannel].
  ///
  /// See [CygnusWebMessageChannel.fromPlatformCreationParams] for setting parameters for
  /// a specific platform.
  CygnusWebMessageChannel.fromPlatformCreationParams({
    required CygnusPlatformWebMessageChannelCreationParams params,
  }) : this.fromPlatform(platform: CygnusPlatformWebMessageChannel(params));

  /// Constructs a [CygnusWebMessageChannel] from a specific platform implementation.
  CygnusWebMessageChannel.fromPlatform({required this.platform});

  /// Implementation of [CygnusPlatformWebMessageChannel] for the current platform.
  final CygnusPlatformWebMessageChannel platform;

  /// Provide static access.
  static CygnusWebMessageChannel static() {
    return CygnusWebMessageChannel.fromPlatform(
      platform: CygnusPlatformWebMessageChannel.static(),
    );
  }

  ///{@macro cygnus_core.CygnusPlatformWebMessageChannelCreationParams.isClassSupported}
  static bool isClassSupported({TargetPlatform? platform}) =>
      CygnusPlatformWebMessageChannel.static().isClassSupported(platform: platform);

  ///{@macro cygnus_core.CygnusPlatformWebMessageChannel.isPropertySupported}
  static bool isPropertySupported(
    CygnusPlatformWebMessageChannelCreationParamsProperty property, {
    TargetPlatform? platform,
  }) => CygnusPlatformWebMessageChannel.static().isPropertySupported(
    property,
    platform: platform,
  );

  ///{@macro cygnus_core.CygnusPlatformWebMessageChannel.isMethodSupported}
  static bool isMethodSupported(
    CygnusPlatformWebMessageChannelMethod method, {
    TargetPlatform? platform,
  }) => CygnusPlatformWebMessageChannel.static().isMethodSupported(
    method,
    platform: platform,
  );

  static CygnusWebMessageChannel? fromMap(Map<String, dynamic>? map) {
    CygnusPlatformWebMessageChannel? platform = CygnusPlatformWebMessageChannel.static()
        .fromMap(map);
    if (platform == null) {
      return null;
    }
    return CygnusWebMessageChannel.fromPlatform(platform: platform);
  }

  ///{@macro cygnus_core.CygnusPlatformWebMessageChannel.id}
  ///
  ///{@macro cygnus_core.CygnusPlatformWebMessageChannel.id.supported_platforms}
  String get id => platform.id;

  ///{@macro cygnus_core.CygnusPlatformWebMessageChannel.port1}
  ///
  ///{@macro cygnus_core.CygnusPlatformWebMessageChannel.port1.supported_platforms}
  CygnusWebMessagePort get port1 =>
      CygnusWebMessagePort.fromPlatform(platform: platform.port1);

  ///{@macro cygnus_core.CygnusPlatformWebMessageChannel.port2}
  ///
  ///{@macro cygnus_core.CygnusPlatformWebMessageChannel.port2.supported_platforms}
  CygnusWebMessagePort get port2 =>
      CygnusWebMessagePort.fromPlatform(platform: platform.port2);

  ///{@macro cygnus_core.CygnusPlatformWebMessageChannel.dispose}
  ///
  ///{@macro cygnus_core.CygnusPlatformWebMessageChannel.dispose.supported_platforms}
  void dispose() => platform.dispose();

  @override
  String toString() => platform.toString();
}
