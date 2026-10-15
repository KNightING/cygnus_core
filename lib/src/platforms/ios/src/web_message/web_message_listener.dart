import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:cygnus_core/src/platform_interface/flutter_webview_platform_interface.dart';

/// Object specifying creation parameters for creating a [IOSWebMessageListener].
///
/// When adding additional fields make sure they can be null or have a default
/// value to avoid breaking changes. See [CygnusPlatformWebMessageListenerCreationParams] for
/// more information.
@immutable
class IOSWebMessageListenerCreationParams
    extends CygnusPlatformWebMessageListenerCreationParams {
  /// Creates a new [IOSWebMessageListenerCreationParams] instance.
  const IOSWebMessageListenerCreationParams({
    required this.allowedOriginRules,
    required super.jsObjectName,
    super.onPostMessage,
  });

  /// Creates a [IOSWebMessageListenerCreationParams] instance based on [CygnusPlatformWebMessageListenerCreationParams].
  factory IOSWebMessageListenerCreationParams.fromPlatformWebMessageListenerCreationParams(
    // Recommended placeholder to prevent being broken by platform interface.
    // ignore: avoid_unused_constructor_parameters
    CygnusPlatformWebMessageListenerCreationParams params,
  ) {
    return IOSWebMessageListenerCreationParams(
      allowedOriginRules: params.allowedOriginRules ?? Set.from(["*"]),
      jsObjectName: params.jsObjectName,
      onPostMessage: params.onPostMessage,
    );
  }

  @override
  final Set<String> allowedOriginRules;

  @override
  String toString() {
    return 'IOSWebMessageListenerCreationParams{jsObjectName: $jsObjectName, allowedOriginRules: $allowedOriginRules, onPostMessage: $onPostMessage}';
  }
}

///{@macro cygnus_core.CygnusPlatformWebMessageListener}
class IOSWebMessageListener extends CygnusPlatformWebMessageListener
    with ChannelController {
  /// Constructs a [IOSWebMessageListener].
  IOSWebMessageListener(CygnusPlatformWebMessageListenerCreationParams params)
    : super.implementation(
        params is IOSWebMessageListenerCreationParams
            ? params
            : IOSWebMessageListenerCreationParams.fromPlatformWebMessageListenerCreationParams(
                params,
              ),
      ) {
    assert(
      !this._iosParams.allowedOriginRules.contains(""),
      "allowedOriginRules cannot contain empty strings",
    );
    channel = MethodChannel(
      'com.github.knighting.cygnus/webview_web_message_listener_${_id}_${params.jsObjectName}',
    );
    handler = _handleMethod;
    initMethodCallHandler();
  }

  static final IOSWebMessageListener _staticValue = IOSWebMessageListener(
    IOSWebMessageListenerCreationParams(
      jsObjectName: '',
      allowedOriginRules: Set.from(["*"]),
    ),
  );

  /// Provide static access.
  factory IOSWebMessageListener.static() {
    return _staticValue;
  }

  ///Message Listener ID used internally.
  final String _id = IdGenerator.generate();

  IOSJavaScriptReplyProxy? _replyProxy;

  IOSWebMessageListenerCreationParams get _iosParams =>
      params as IOSWebMessageListenerCreationParams;

  Future<dynamic> _handleMethod(MethodCall call) async {
    switch (call.method) {
      case "onPostMessage":
        if (_replyProxy == null) {
          _replyProxy = IOSJavaScriptReplyProxy(
            CygnusPlatformJavaScriptReplyProxyCreationParams(
              webMessageListener: this,
            ),
          );
        }
        if (onPostMessage != null) {
          CygnusWebMessage? message = call.arguments["message"] != null
              ? CygnusWebMessage.fromMap(
                  call.arguments["message"].cast<String, dynamic>(),
                )
              : null;
          CygnusWebUri? sourceOrigin = call.arguments["sourceOrigin"] != null
              ? CygnusWebUri(call.arguments["sourceOrigin"])
              : null;
          bool isMainFrame = call.arguments["isMainFrame"];
          onPostMessage!(message, sourceOrigin, isMainFrame, _replyProxy!);
        }
        break;
      default:
        throw UnimplementedError("Unimplemented ${call.method} method");
    }
    return null;
  }

  @override
  void dispose() {
    disposeChannel();
  }

  @override
  Map<String, dynamic> toMap() {
    return {
      "id": _id,
      "jsObjectName": params.jsObjectName,
      "allowedOriginRules": _iosParams.allowedOriginRules.toList(),
    };
  }

  @override
  Map<String, dynamic> toJson() {
    return this.toMap();
  }

  @override
  String toString() {
    return 'IOSWebMessageListener{id: ${_id}, jsObjectName: ${params.jsObjectName}, allowedOriginRules: ${params.allowedOriginRules}, replyProxy: $_replyProxy}';
  }
}

/// Object specifying creation parameters for creating a [IOSJavaScriptReplyProxy].
///
/// When adding additional fields make sure they can be null or have a default
/// value to avoid breaking changes. See [CygnusPlatformJavaScriptReplyProxyCreationParams] for
/// more information.
@immutable
class IOSJavaScriptReplyProxyCreationParams
    extends CygnusPlatformJavaScriptReplyProxyCreationParams {
  /// Creates a new [IOSJavaScriptReplyProxyCreationParams] instance.
  const IOSJavaScriptReplyProxyCreationParams({
    required super.webMessageListener,
  });

  /// Creates a [IOSJavaScriptReplyProxyCreationParams] instance based on [CygnusPlatformJavaScriptReplyProxyCreationParams].
  factory IOSJavaScriptReplyProxyCreationParams.fromPlatformJavaScriptReplyProxyCreationParams(
    // Recommended placeholder to prevent being broken by platform interface.
    // ignore: avoid_unused_constructor_parameters
    CygnusPlatformJavaScriptReplyProxyCreationParams params,
  ) {
    return IOSJavaScriptReplyProxyCreationParams(
      webMessageListener: params.webMessageListener,
    );
  }
}

///{@macro cygnus_core.CygnusJavaScriptReplyProxy}
class IOSJavaScriptReplyProxy extends CygnusPlatformJavaScriptReplyProxy {
  /// Constructs a [IOSWebMessageListener].
  IOSJavaScriptReplyProxy(CygnusPlatformJavaScriptReplyProxyCreationParams params)
    : super.implementation(
        params is IOSJavaScriptReplyProxyCreationParams
            ? params
            : IOSJavaScriptReplyProxyCreationParams.fromPlatformJavaScriptReplyProxyCreationParams(
                params,
              ),
      );

  IOSWebMessageListener get _iosWebMessageListener =>
      params.webMessageListener as IOSWebMessageListener;

  @override
  Future<void> postMessage(CygnusWebMessage message) async {
    Map<String, dynamic> args = <String, dynamic>{};
    args.putIfAbsent('message', () => message.toMap());
    await _iosWebMessageListener.channel?.invokeMethod('postMessage', args);
  }

  @override
  String toString() {
    return 'IOSJavaScriptReplyProxy{}';
  }
}
