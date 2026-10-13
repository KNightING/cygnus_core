import 'package:flutter/foundation.dart';
import 'package:cygnus_core/src/platform_interface/flutter_inappwebview_platform_interface.dart';
import 'web_message_port.dart';

///{@macro cygnus_core.PlatformWebMessageChannel}
///
///{@macro cygnus_core.PlatformWebMessageChannel.supported_platforms}
class WebMessageChannel {
  ///{@macro cygnus_core.PlatformWebMessageChannel}
  WebMessageChannel({
    required String id,
    required WebMessagePort port1,
    required WebMessagePort port2,
  }) : this.fromPlatformCreationParams(
         params: PlatformWebMessageChannelCreationParams(
           id: id,
           port1: port1.platform,
           port2: port2.platform,
         ),
       );

  /// Constructs a [WebMessageChannel].
  ///
  /// See [WebMessageChannel.fromPlatformCreationParams] for setting parameters for
  /// a specific platform.
  WebMessageChannel.fromPlatformCreationParams({
    required PlatformWebMessageChannelCreationParams params,
  }) : this.fromPlatform(platform: PlatformWebMessageChannel(params));

  /// Constructs a [WebMessageChannel] from a specific platform implementation.
  WebMessageChannel.fromPlatform({required this.platform});

  /// Implementation of [PlatformWebMessageChannel] for the current platform.
  final PlatformWebMessageChannel platform;

  /// Provide static access.
  static WebMessageChannel static() {
    return WebMessageChannel.fromPlatform(
      platform: PlatformWebMessageChannel.static(),
    );
  }

  ///{@macro cygnus_core.PlatformWebMessageChannelCreationParams.isClassSupported}
  static bool isClassSupported({TargetPlatform? platform}) =>
      PlatformWebMessageChannel.static().isClassSupported(platform: platform);

  ///{@macro cygnus_core.PlatformWebMessageChannel.isPropertySupported}
  static bool isPropertySupported(
    PlatformWebMessageChannelCreationParamsProperty property, {
    TargetPlatform? platform,
  }) => PlatformWebMessageChannel.static().isPropertySupported(
    property,
    platform: platform,
  );

  ///{@macro cygnus_core.PlatformWebMessageChannel.isMethodSupported}
  static bool isMethodSupported(
    PlatformWebMessageChannelMethod method, {
    TargetPlatform? platform,
  }) => PlatformWebMessageChannel.static().isMethodSupported(
    method,
    platform: platform,
  );

  static WebMessageChannel? fromMap(Map<String, dynamic>? map) {
    PlatformWebMessageChannel? platform = PlatformWebMessageChannel.static()
        .fromMap(map);
    if (platform == null) {
      return null;
    }
    return WebMessageChannel.fromPlatform(platform: platform);
  }

  ///{@macro cygnus_core.PlatformWebMessageChannel.id}
  ///
  ///{@macro cygnus_core.PlatformWebMessageChannel.id.supported_platforms}
  String get id => platform.id;

  ///{@macro cygnus_core.PlatformWebMessageChannel.port1}
  ///
  ///{@macro cygnus_core.PlatformWebMessageChannel.port1.supported_platforms}
  WebMessagePort get port1 =>
      WebMessagePort.fromPlatform(platform: platform.port1);

  ///{@macro cygnus_core.PlatformWebMessageChannel.port2}
  ///
  ///{@macro cygnus_core.PlatformWebMessageChannel.port2.supported_platforms}
  WebMessagePort get port2 =>
      WebMessagePort.fromPlatform(platform: platform.port2);

  ///{@macro cygnus_core.PlatformWebMessageChannel.dispose}
  ///
  ///{@macro cygnus_core.PlatformWebMessageChannel.dispose.supported_platforms}
  void dispose() => platform.dispose();

  @override
  String toString() => platform.toString();
}
