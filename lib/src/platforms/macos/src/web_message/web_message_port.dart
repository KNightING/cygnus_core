import 'package:flutter/foundation.dart';
import 'package:cygnus_core/src/platform_interface/flutter_inappwebview_platform_interface.dart';

import 'web_message_channel.dart';

/// Object specifying creation parameters for creating a [MacOSWebMessagePort].
///
/// When adding additional fields make sure they can be null or have a default
/// value to avoid breaking changes. See [CygnusPlatformWebMessagePortCreationParams] for
/// more information.
@immutable
class MacOSWebMessagePortCreationParams
    extends CygnusPlatformWebMessagePortCreationParams {
  /// Creates a new [MacOSWebMessagePortCreationParams] instance.
  const MacOSWebMessagePortCreationParams({required super.index});

  /// Creates a [MacOSWebMessagePortCreationParams] instance based on [CygnusPlatformWebMessagePortCreationParams].
  factory MacOSWebMessagePortCreationParams.fromPlatformWebMessagePortCreationParams(
    // Recommended placeholder to prevent being broken by platform interface.
    // ignore: avoid_unused_constructor_parameters
    CygnusPlatformWebMessagePortCreationParams params,
  ) {
    return MacOSWebMessagePortCreationParams(index: params.index);
  }

  @override
  String toString() {
    return 'MacOSWebMessagePortCreationParams{index: $index}';
  }
}

///{@macro cygnus_core.CygnusPlatformWebMessagePort}
class MacOSWebMessagePort extends CygnusPlatformWebMessagePort {
  CygnusWebMessageCallback? _onMessage;
  late MacOSWebMessageChannel _webMessageChannel;

  /// Constructs a [MacOSWebMessagePort].
  MacOSWebMessagePort(CygnusPlatformWebMessagePortCreationParams params)
    : super.implementation(
        params is MacOSWebMessagePortCreationParams
            ? params
            : MacOSWebMessagePortCreationParams.fromPlatformWebMessagePortCreationParams(
                params,
              ),
      );

  @override
  Future<void> setWebMessageCallback(CygnusWebMessageCallback? onMessage) async {
    Map<String, dynamic> args = <String, dynamic>{};
    args.putIfAbsent('index', () => params.index);
    await _webMessageChannel.internalChannel?.invokeMethod(
      'setWebMessageCallback',
      args,
    );
    this._onMessage = onMessage;
  }

  @override
  Future<void> postMessage(CygnusWebMessage message) async {
    Map<String, dynamic> args = <String, dynamic>{};
    args.putIfAbsent('index', () => params.index);
    args.putIfAbsent('message', () => message.toMap());
    await _webMessageChannel.internalChannel?.invokeMethod('postMessage', args);
  }

  @override
  Future<void> close() async {
    Map<String, dynamic> args = <String, dynamic>{};
    args.putIfAbsent('index', () => params.index);
    await _webMessageChannel.internalChannel?.invokeMethod('close', args);
  }

  @override
  Map<String, dynamic> toMap({CygnusEnumMethod? enumMethod}) {
    return {
      "index": params.index,
      "webMessageChannelId": this._webMessageChannel.params.id,
    };
  }

  @override
  Map<String, dynamic> toJson() {
    return toMap();
  }

  @override
  String toString() {
    return 'MacOSWebMessagePort{index: ${params.index}}';
  }
}

extension InternalWebMessagePort on MacOSWebMessagePort {
  CygnusWebMessageCallback? get onMessage => _onMessage;
  void set onMessage(CygnusWebMessageCallback? value) => _onMessage = value;

  MacOSWebMessageChannel get webMessageChannel => _webMessageChannel;
  void set webMessageChannel(MacOSWebMessageChannel value) =>
      _webMessageChannel = value;
}
