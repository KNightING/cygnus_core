import 'package:cygnus_core/src/platform_interface/flutter_webview_platform_interface.dart';

///{@macro cygnus_core.CygnusPlatformWebMessagePort}
///
///{@macro cygnus_core.CygnusPlatformWebMessagePort.supported_platforms}
class CygnusWebMessagePort implements CygnusIWebMessagePort {
  ///{@macro cygnus_core.CygnusPlatformWebMessagePort}
  CygnusWebMessagePort({required int index})
    : this.fromPlatformCreationParams(
        params: CygnusPlatformWebMessagePortCreationParams(index: index),
      );

  /// Constructs a [CygnusWebMessagePort].
  ///
  /// See [CygnusWebMessagePort.fromPlatformCreationParams] for setting parameters for
  /// a specific platform.
  CygnusWebMessagePort.fromPlatformCreationParams({
    required CygnusPlatformWebMessagePortCreationParams params,
  }) : this.fromPlatform(platform: CygnusPlatformWebMessagePort(params));

  /// Constructs a [CygnusWebMessagePort] from a specific platform implementation.
  CygnusWebMessagePort.fromPlatform({required this.platform});

  /// Implementation of [CygnusPlatformWebMessagePort] for the current platform.
  final CygnusPlatformWebMessagePort platform;

  ///{@macro cygnus_core.CygnusPlatformWebMessagePort.setWebMessageCallback}
  ///
  ///{@macro cygnus_core.CygnusPlatformWebMessagePort.setWebMessageCallback.supported_platforms}
  Future<void> setWebMessageCallback(CygnusWebMessageCallback? onMessage) =>
      platform.setWebMessageCallback(onMessage);

  ///{@macro cygnus_core.CygnusPlatformWebMessagePort.postMessage}
  ///
  ///{@macro cygnus_core.CygnusPlatformWebMessagePort.postMessage.supported_platforms}
  Future<void> postMessage(CygnusWebMessage message) => platform.postMessage(message);

  ///{@macro cygnus_core.CygnusPlatformWebMessagePort.close}
  ///
  ///{@macro cygnus_core.CygnusPlatformWebMessagePort.close.supported_platforms}
  Future<void> close() => platform.close();

  Map<String, dynamic> toMap({CygnusEnumMethod? enumMethod}) =>
      platform.toMap(enumMethod: enumMethod);

  Map<String, dynamic> toJson() => platform.toJson();

  @override
  String toString() => platform.toString();
}
