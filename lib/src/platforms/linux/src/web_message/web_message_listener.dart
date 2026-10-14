import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:cygnus_core/src/platform_interface/flutter_inappwebview_platform_interface.dart';

/// Object specifying creation parameters for creating a [LinuxWebMessageListener].
///
/// When adding additional fields make sure they can be null or have a default
/// value to avoid breaking changes. See [CygnusPlatformWebMessageListenerCreationParams] for
/// more information.
@immutable
class LinuxWebMessageListenerCreationParams
    extends CygnusPlatformWebMessageListenerCreationParams {
  /// Creates a new [LinuxWebMessageListenerCreationParams] instance.
  const LinuxWebMessageListenerCreationParams({
    required this.allowedOriginRules,
    required super.jsObjectName,
    super.onPostMessage,
  });

  /// Creates a [LinuxWebMessageListenerCreationParams] instance based on [CygnusPlatformWebMessageListenerCreationParams].
  factory LinuxWebMessageListenerCreationParams.fromPlatformWebMessageListenerCreationParams(
    CygnusPlatformWebMessageListenerCreationParams params,
  ) {
    return LinuxWebMessageListenerCreationParams(
      allowedOriginRules: params.allowedOriginRules ?? Set.from(["*"]),
      jsObjectName: params.jsObjectName,
      onPostMessage: params.onPostMessage,
    );
  }

  @override
  final Set<String> allowedOriginRules;

  @override
  String toString() {
    return 'LinuxWebMessageListenerCreationParams{jsObjectName: $jsObjectName, allowedOriginRules: $allowedOriginRules, onPostMessage: $onPostMessage}';
  }
}

///{@macro cygnus_core.CygnusPlatformWebMessageListener}
class LinuxWebMessageListener extends CygnusPlatformWebMessageListener
    with ChannelController {
  /// Constructs a [LinuxWebMessageListener].
  LinuxWebMessageListener(CygnusPlatformWebMessageListenerCreationParams params)
    : super.implementation(
        params is LinuxWebMessageListenerCreationParams
            ? params
            : LinuxWebMessageListenerCreationParams.fromPlatformWebMessageListenerCreationParams(
                params,
              ),
      ) {
    assert(
      !this._linuxParams.allowedOriginRules.contains(""),
      "allowedOriginRules cannot contain empty strings",
    );
    channel = MethodChannel(
      'com.pichillilorenzo/flutter_inappwebview_web_message_listener_${_id}_${params.jsObjectName}',
    );
    handler = _handleMethod;
    initMethodCallHandler();
  }

  static final LinuxWebMessageListener _staticValue = LinuxWebMessageListener(
    LinuxWebMessageListenerCreationParams(
      jsObjectName: '',
      allowedOriginRules: Set.from(["*"]),
    ),
  );

  /// Provide static access.
  factory LinuxWebMessageListener.static() {
    return _staticValue;
  }

  ///Message Listener ID used internally.
  final String _id = IdGenerator.generate();

  LinuxJavaScriptReplyProxy? _replyProxy;

  LinuxWebMessageListenerCreationParams get _linuxParams =>
      params as LinuxWebMessageListenerCreationParams;

  Future<dynamic> _handleMethod(MethodCall call) async {
    switch (call.method) {
      case "onPostMessage":
        if (_replyProxy == null) {
          _replyProxy = LinuxJavaScriptReplyProxy(
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
      "allowedOriginRules": _linuxParams.allowedOriginRules.toList(),
    };
  }

  @override
  Map<String, dynamic> toJson() {
    return this.toMap();
  }

  @override
  String toString() {
    return 'LinuxWebMessageListener{id: ${_id}, jsObjectName: ${params.jsObjectName}, allowedOriginRules: ${params.allowedOriginRules}, replyProxy: $_replyProxy}';
  }
}

/// Object specifying creation parameters for creating a [LinuxJavaScriptReplyProxy].
///
/// When adding additional fields make sure they can be null or have a default
/// value to avoid breaking changes. See [CygnusPlatformJavaScriptReplyProxyCreationParams] for
/// more information.
@immutable
class LinuxJavaScriptReplyProxyCreationParams
    extends CygnusPlatformJavaScriptReplyProxyCreationParams {
  /// Creates a new [LinuxJavaScriptReplyProxyCreationParams] instance.
  const LinuxJavaScriptReplyProxyCreationParams({
    required super.webMessageListener,
  });

  /// Creates a [LinuxJavaScriptReplyProxyCreationParams] instance based on [CygnusPlatformJavaScriptReplyProxyCreationParams].
  factory LinuxJavaScriptReplyProxyCreationParams.fromPlatformJavaScriptReplyProxyCreationParams(
    CygnusPlatformJavaScriptReplyProxyCreationParams params,
  ) {
    return LinuxJavaScriptReplyProxyCreationParams(
      webMessageListener: params.webMessageListener,
    );
  }
}

///{@macro cygnus_core.CygnusJavaScriptReplyProxy}
class LinuxJavaScriptReplyProxy extends CygnusPlatformJavaScriptReplyProxy {
  /// Constructs a [LinuxWebMessageListener].
  LinuxJavaScriptReplyProxy(CygnusPlatformJavaScriptReplyProxyCreationParams params)
    : super.implementation(
        params is LinuxJavaScriptReplyProxyCreationParams
            ? params
            : LinuxJavaScriptReplyProxyCreationParams.fromPlatformJavaScriptReplyProxyCreationParams(
                params,
              ),
      );

  LinuxWebMessageListener get _linuxWebMessageListener =>
      params.webMessageListener as LinuxWebMessageListener;

  @override
  Future<void> postMessage(CygnusWebMessage message) async {
    Map<String, dynamic> args = <String, dynamic>{};
    args.putIfAbsent('message', () => message.toMap());
    await _linuxWebMessageListener.channel?.invokeMethod('postMessage', args);
  }

  @override
  String toString() {
    return 'LinuxJavaScriptReplyProxy{}';
  }
}
