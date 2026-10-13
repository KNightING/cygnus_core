import 'package:cygnus_core/src/platform_interface/flutter_inappwebview_platform_interface.dart';

///{@macro cygnus_core.PlatformWebMessagePort}
///
///{@macro cygnus_core.PlatformWebMessagePort.supported_platforms}
class WebMessagePort implements IWebMessagePort {
  ///{@macro cygnus_core.PlatformWebMessagePort}
  WebMessagePort({required int index})
    : this.fromPlatformCreationParams(
        params: PlatformWebMessagePortCreationParams(index: index),
      );

  /// Constructs a [WebMessagePort].
  ///
  /// See [WebMessagePort.fromPlatformCreationParams] for setting parameters for
  /// a specific platform.
  WebMessagePort.fromPlatformCreationParams({
    required PlatformWebMessagePortCreationParams params,
  }) : this.fromPlatform(platform: PlatformWebMessagePort(params));

  /// Constructs a [WebMessagePort] from a specific platform implementation.
  WebMessagePort.fromPlatform({required this.platform});

  /// Implementation of [PlatformWebMessagePort] for the current platform.
  final PlatformWebMessagePort platform;

  ///{@macro cygnus_core.PlatformWebMessagePort.setWebMessageCallback}
  ///
  ///{@macro cygnus_core.PlatformWebMessagePort.setWebMessageCallback.supported_platforms}
  Future<void> setWebMessageCallback(WebMessageCallback? onMessage) =>
      platform.setWebMessageCallback(onMessage);

  ///{@macro cygnus_core.PlatformWebMessagePort.postMessage}
  ///
  ///{@macro cygnus_core.PlatformWebMessagePort.postMessage.supported_platforms}
  Future<void> postMessage(WebMessage message) => platform.postMessage(message);

  ///{@macro cygnus_core.PlatformWebMessagePort.close}
  ///
  ///{@macro cygnus_core.PlatformWebMessagePort.close.supported_platforms}
  Future<void> close() => platform.close();

  Map<String, dynamic> toMap({EnumMethod? enumMethod}) =>
      platform.toMap(enumMethod: enumMethod);

  Map<String, dynamic> toJson() => platform.toJson();

  @override
  String toString() => platform.toString();
}
