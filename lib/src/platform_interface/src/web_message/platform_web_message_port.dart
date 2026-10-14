import 'package:flutter/foundation.dart';
import 'package:flutter_inappwebview_internal_annotations/flutter_inappwebview_internal_annotations.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import '../webview_platform.dart';
import '../types/enum_method.dart';
import '../types/web_message_callback.dart';
import 'web_message.dart';

/// Object specifying creation parameters for creating a [CygnusPlatformWebMessagePort].
///
/// Platform specific implementations can add additional fields by extending
/// this class.
@immutable
class CygnusPlatformWebMessagePortCreationParams {
  /// Used by the platform implementation to create a new [CygnusPlatformWebMessagePort].
  const CygnusPlatformWebMessagePortCreationParams({required this.index});

  ///Port index.
  final int index;

  @override
  String toString() {
    return 'CygnusPlatformWebMessagePortCreationParams{index: $index}';
  }
}

///{@template cygnus_core.CygnusPlatformWebMessagePort}
///The representation of the [HTML5 message ports](https://html.spec.whatwg.org/multipage/comms.html#messageport).
///
///A Message port represents one endpoint of a Message Channel. In Android webview, there is no separate Message Channel object.
///When a message channel is created, both ports are tangled to each other and started.
///See [CygnusWebViewController.createWebMessageChannel] for creating a message channel.
///
///When a message port is first created or received via transfer, it does not have a [CygnusWebMessageCallback] to receive web messages.
///On Android, the messages are queued until a [CygnusWebMessageCallback] is set.
///
///A message port should be closed when it is not used by the embedder application anymore.
///A closed port cannot be transferred or cannot be reopened to send messages.
///Close can be called multiple times.
///
///When a port is transferred to JavaScript, it cannot be used to send or receive messages at the Dart side anymore.
///Different from HTML5 Spec, a port cannot be transferred if one of these has ever happened: i. a message callback was set, ii. a message was posted on it.
///A transferred port cannot be closed by the application, since the ownership is also transferred.
///
///It is possible to transfer both ports of a channel to JavaScript, for example for communication between subframes.
///{@endtemplate}
///
///{@macro cygnus_core.CygnusPlatformWebMessagePort.supported_platforms}
@SupportedPlatforms(
  platforms: [
    AndroidPlatform(),
    IOSPlatform(),
    MacOSPlatform(),
    LinuxPlatform(note: 'Implemented via JavaScript MessageChannel API.'),
    WindowsPlatform(note: 'Implemented via JavaScript MessageChannel API.'),
  ],
)
abstract class CygnusPlatformWebMessagePort extends PlatformInterface
    implements CygnusIWebMessagePort {
  /// Creates a new [CygnusPlatformWebMessagePort]
  factory CygnusPlatformWebMessagePort(CygnusPlatformWebMessagePortCreationParams params) {
    assert(
      CygnusWebViewPlatform.instance != null,
      'A platform implementation for `flutter_inappwebview` has not been set. Please '
      'ensure that an implementation of `CygnusWebViewPlatform` has been set to '
      '`CygnusWebViewPlatform.instance` before use. For unit testing, '
      '`CygnusWebViewPlatform.instance` can be set with your own test implementation.',
    );
    final CygnusPlatformWebMessagePort webMessagePort = CygnusWebViewPlatform.instance!
        .createPlatformWebMessagePort(params);
    PlatformInterface.verify(webMessagePort, _token);
    return webMessagePort;
  }

  /// Used by the platform implementation to create a new [CygnusPlatformWebMessagePort].
  ///
  /// Should only be used by platform implementations because they can't extend
  /// a class that only contains a factory constructor.
  @protected
  CygnusPlatformWebMessagePort.implementation(this.params) : super(token: _token);

  static final Object _token = Object();

  /// The parameters used to initialize the [CygnusPlatformWebMessagePort].
  final CygnusPlatformWebMessagePortCreationParams params;

  @override
  String toString() {
    return 'CygnusPlatformWebMessagePort{index: ${params.index}}';
  }
}

abstract class CygnusIWebMessagePort {
  ///{@template cygnus_core.CygnusPlatformWebMessagePort.setWebMessageCallback}
  ///Sets a callback to receive message events on the main thread.
  ///{@endtemplate}
  ///
  ///{@macro cygnus_core.CygnusPlatformWebMessagePort.setWebMessageCallback.supported_platforms}
  @SupportedPlatforms(
    platforms: [
      AndroidPlatform(),
      IOSPlatform(),
      MacOSPlatform(),
      LinuxPlatform(note: 'Implemented via JavaScript MessageChannel API.'),
      WindowsPlatform(note: 'Implemented via JavaScript MessageChannel API.'),
    ],
  )
  Future<void> setWebMessageCallback(CygnusWebMessageCallback? onMessage) {
    throw UnimplementedError(
      'setWebMessageCallback is not implemented on the current platform',
    );
  }

  ///{@template cygnus_core.CygnusPlatformWebMessagePort.postMessage}
  ///Post a CygnusWebMessage to the entangled port.
  ///{@endtemplate}
  ///
  ///{@macro cygnus_core.CygnusPlatformWebMessagePort.postMessage.supported_platforms}
  @SupportedPlatforms(
    platforms: [
      AndroidPlatform(),
      IOSPlatform(),
      MacOSPlatform(),
      LinuxPlatform(note: 'Implemented via JavaScript MessageChannel API.'),
      WindowsPlatform(note: 'Implemented via JavaScript MessageChannel API.'),
    ],
  )
  Future<void> postMessage(CygnusWebMessage message) {
    throw UnimplementedError(
      'postMessage is not implemented on the current platform',
    );
  }

  ///{@template cygnus_core.CygnusPlatformWebMessagePort.close}
  ///Close the message port and free any resources associated with it.
  ///{@endtemplate}
  ///
  ///{@macro cygnus_core.CygnusPlatformWebMessagePort.close.supported_platforms}
  @SupportedPlatforms(
    platforms: [
      AndroidPlatform(),
      IOSPlatform(),
      MacOSPlatform(),
      LinuxPlatform(note: 'Implemented via JavaScript MessageChannel API.'),
      WindowsPlatform(note: 'Implemented via JavaScript MessageChannel API.'),
    ],
  )
  Future<void> close() {
    throw UnimplementedError(
      'close is not implemented on the current platform',
    );
  }

  Map<String, dynamic> toMap({CygnusEnumMethod? enumMethod}) {
    throw UnimplementedError(
      'toMap is not implemented on the current platform',
    );
  }

  Map<String, dynamic> toJson() {
    throw UnimplementedError(
      'toJson is not implemented on the current platform',
    );
  }
}
