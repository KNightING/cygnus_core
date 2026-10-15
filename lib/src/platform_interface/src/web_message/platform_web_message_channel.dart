import 'package:flutter/foundation.dart';
import 'package:cygnus_core_internal_annotations/cygnus_core_internal_annotations.dart';
import 'package:cygnus_core/src/platform_interface/src/types/disposable.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';
import '../webview_platform.dart';
import 'platform_web_message_port.dart';

// ignore: uri_has_not_been_generated
part 'platform_web_message_channel.g.dart';

///{@template cygnus_core.CygnusPlatformWebMessageChannelCreationParams}
/// Object specifying creation parameters for creating a [CygnusPlatformWebMessageChannel].
///
/// Platform specific implementations can add additional fields by extending
/// this class.
///{@endtemplate}
///
///{@macro cygnus_core.CygnusPlatformWebMessageChannelCreationParams.supported_platforms}
@SupportedPlatforms(
  platforms: [
    AndroidPlatform(),
    IOSPlatform(),
    MacOSPlatform(),
    LinuxPlatform(note: 'Implemented via JavaScript MessageChannel API.'),
    WindowsPlatform(note: 'Implemented via JavaScript MessageChannel API.'),
  ],
)
@immutable
class CygnusPlatformWebMessageChannelCreationParams {
  /// Used by the platform implementation to create a new [CygnusPlatformWebMessageChannel].
  const CygnusPlatformWebMessageChannelCreationParams({
    required this.id,
    required this.port1,
    required this.port2,
  });

  ///{@template cygnus_core.CygnusPlatformWebMessageChannelCreationParams.id}
  ///Message Channel ID used internally.
  ///{@endtemplate}
  ///
  ///{@macro cygnus_core.CygnusPlatformWebMessageChannelCreationParams.id.supported_platforms}
  @SupportedPlatforms(
    platforms: [
      AndroidPlatform(),
      IOSPlatform(),
      MacOSPlatform(),
      LinuxPlatform(note: 'Implemented via JavaScript MessageChannel API.'),
      WindowsPlatform(note: 'Implemented via JavaScript MessageChannel API.'),
    ],
  )
  final String id;

  ///{@template cygnus_core.CygnusPlatformWebMessageChannelCreationParams.port1}
  ///The first [CygnusPlatformWebMessagePort] object of the channel.
  ///{@endtemplate}
  ///
  ///{@macro cygnus_core.CygnusPlatformWebMessageChannelCreationParams.port1.supported_platforms}
  @SupportedPlatforms(
    platforms: [
      AndroidPlatform(),
      IOSPlatform(),
      MacOSPlatform(),
      LinuxPlatform(note: 'Implemented via JavaScript MessageChannel API.'),
      WindowsPlatform(note: 'Implemented via JavaScript MessageChannel API.'),
    ],
  )
  final CygnusPlatformWebMessagePort port1;

  ///{@template cygnus_core.CygnusPlatformWebMessageChannelCreationParams.port2}
  ///The second [CygnusPlatformWebMessagePort] object of the channel.
  ///{@endtemplate}
  ///
  ///{@macro cygnus_core.CygnusPlatformWebMessageChannelCreationParams.port2.supported_platforms}
  @SupportedPlatforms(
    platforms: [
      AndroidPlatform(),
      IOSPlatform(),
      MacOSPlatform(),
      LinuxPlatform(note: 'Implemented via JavaScript MessageChannel API.'),
      WindowsPlatform(note: 'Implemented via JavaScript MessageChannel API.'),
    ],
  )
  final CygnusPlatformWebMessagePort port2;

  ///{@template cygnus_core.CygnusPlatformWebMessageChannelCreationParams.isClassSupported}
  ///Check if the current class is supported by the [defaultTargetPlatform] or a specific [platform].
  ///{@endtemplate}
  bool isClassSupported({TargetPlatform? platform}) =>
      _CygnusPlatformWebMessageChannelCreationParamsClassSupported.isClassSupported(
        platform: platform,
      );

  ///{@template cygnus_core.CygnusPlatformWebMessageChannelCreationParams.isPropertySupported}
  ///Check if the given [property] is supported by the [defaultTargetPlatform] or a specific [platform].
  ///{@endtemplate}
  bool isPropertySupported(
    CygnusPlatformWebMessageChannelCreationParamsProperty property, {
    TargetPlatform? platform,
  }) =>
      _CygnusPlatformWebMessageChannelCreationParamsPropertySupported.isPropertySupported(
        property,
        platform: platform,
      );

  @override
  String toString() {
    return 'CygnusPlatformWebMessageChannelCreationParams{id: $id, port1: $port1, port2: $port2}';
  }
}

///{@template cygnus_core.CygnusPlatformWebMessageChannel}
///The representation of the [HTML5 message channels](https://html.spec.whatwg.org/multipage/web-messaging.html#message-channels).
///{@endtemplate}
///
///{@macro cygnus_core.CygnusPlatformWebMessageChannel.supported_platforms}
@SupportedPlatforms(
  platforms: [
    AndroidPlatform(),
    IOSPlatform(),
    MacOSPlatform(),
    LinuxPlatform(note: 'Implemented via JavaScript MessageChannel API.'),
    WindowsPlatform(note: 'Implemented via JavaScript MessageChannel API.'),
  ],
)
abstract class CygnusPlatformWebMessageChannel extends PlatformInterface
    implements CygnusDisposable {
  /// Creates a new [CygnusPlatformWebMessageChannel]
  factory CygnusPlatformWebMessageChannel(
    CygnusPlatformWebMessageChannelCreationParams params,
  ) {
    assert(
      CygnusWebViewPlatform.instance != null,
      'A platform implementation for `cygnus` has not been set. Please '
      'ensure that an implementation of `CygnusWebViewPlatform` has been set to '
      '`CygnusWebViewPlatform.instance` before use. For unit testing, '
      '`CygnusWebViewPlatform.instance` can be set with your own test implementation.',
    );
    final CygnusPlatformWebMessageChannel webMessageChannel = CygnusWebViewPlatform
        .instance!
        .createPlatformWebMessageChannel(params);
    PlatformInterface.verify(webMessageChannel, _token);
    return webMessageChannel;
  }

  /// Creates a new [CygnusPlatformWebMessageChannel] to access static methods.
  factory CygnusPlatformWebMessageChannel.static() {
    assert(
      CygnusWebViewPlatform.instance != null,
      'A platform implementation for `cygnus` has not been set. Please '
      'ensure that an implementation of `CygnusWebViewPlatform` has been set to '
      '`CygnusWebViewPlatform.instance` before use. For unit testing, '
      '`CygnusWebViewPlatform.instance` can be set with your own test implementation.',
    );
    final CygnusPlatformWebMessageChannel webMessageChannelStatic =
        CygnusWebViewPlatform.instance!.createPlatformWebMessageChannelStatic();
    PlatformInterface.verify(webMessageChannelStatic, _token);
    return webMessageChannelStatic;
  }

  /// Used by the platform implementation to create a new [CygnusPlatformWebMessageChannel].
  ///
  /// Should only be used by platform implementations because they can't extend
  /// a class that only contains a factory constructor.
  @protected
  CygnusPlatformWebMessageChannel.implementation(this.params) : super(token: _token);

  static final Object _token = Object();

  /// The parameters used to initialize the [CygnusPlatformWebMessageChannel].
  final CygnusPlatformWebMessageChannelCreationParams params;

  ///{@macro cygnus_core.CygnusPlatformWebMessageChannelCreationParams.id}
  ///
  ///{@macro cygnus_core.CygnusPlatformWebMessageChannelCreationParams.id.supported_platforms}
  String get id => params.id;

  ///{@macro cygnus_core.CygnusPlatformWebMessageChannelCreationParams.port1}
  ///
  ///{@macro cygnus_core.CygnusPlatformWebMessageChannelCreationParams.port1.supported_platforms}
  CygnusPlatformWebMessagePort get port1 => params.port1;

  ///{@macro cygnus_core.CygnusPlatformWebMessageChannelCreationParams.port2}
  ///
  ///{@macro cygnus_core.CygnusPlatformWebMessageChannelCreationParams.port2.supported_platforms}
  CygnusPlatformWebMessagePort get port2 => params.port2;

  CygnusPlatformWebMessageChannel? fromMap(Map<String, dynamic>? map) {
    throw UnimplementedError(
      'fromMap is not implemented on the current platform',
    );
  }

  ///{@template cygnus_core.CygnusPlatformWebMessageChannel.dispose}
  ///Disposes the web message channel.
  ///{@endtemplate}
  ///
  ///{@macro cygnus_core.CygnusPlatformWebMessageChannel.dispose.supported_platforms}
  @SupportedPlatforms(
    platforms: [
      AndroidPlatform(),
      IOSPlatform(),
      MacOSPlatform(),
      LinuxPlatform(note: 'Implemented via JavaScript MessageChannel API.'),
      WindowsPlatform(note: 'Implemented via JavaScript MessageChannel API.'),
    ],
  )
  @override
  void dispose() {
    throw UnimplementedError(
      'dispose is not implemented on the current platform',
    );
  }

  ///{@macro cygnus_core.CygnusPlatformWebMessageChannelCreationParams.isClassSupported}
  bool isClassSupported({TargetPlatform? platform}) =>
      _CygnusPlatformWebMessageChannelClassSupported.isClassSupported(
        platform: platform,
      );

  ///{@template cygnus_core.CygnusPlatformWebMessageChannel.isPropertySupported}
  ///Check if the given [property] is supported by the [defaultTargetPlatform] or a specific [platform].
  ///{@endtemplate}
  bool isPropertySupported(
    CygnusPlatformWebMessageChannelCreationParamsProperty property, {
    TargetPlatform? platform,
  }) => params.isPropertySupported(property, platform: platform);

  ///{@template cygnus_core.CygnusPlatformWebMessageChannel.isMethodSupported}
  ///Check if the given [method] is supported by the [defaultTargetPlatform] or a specific [platform].
  ///{@endtemplate}
  bool isMethodSupported(
    CygnusPlatformWebMessageChannelMethod method, {
    TargetPlatform? platform,
  }) => _CygnusPlatformWebMessageChannelMethodSupported.isMethodSupported(
    method,
    platform: platform,
  );

  @override
  String toString() {
    return 'CygnusPlatformWebMessageChannel{id: $id, port1: $port1, port2: $port2}';
  }
}
