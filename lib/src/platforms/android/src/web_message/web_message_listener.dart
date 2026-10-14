import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:cygnus_core/src/platform_interface/flutter_inappwebview_platform_interface.dart';

/// Object specifying creation parameters for creating a [AndroidWebMessageListener].
///
/// When adding additional fields make sure they can be null or have a default
/// value to avoid breaking changes. See [CygnusPlatformWebMessageListenerCreationParams] for
/// more information.
@immutable
class AndroidWebMessageListenerCreationParams
    extends CygnusPlatformWebMessageListenerCreationParams {
  /// Creates a new [AndroidWebMessageListenerCreationParams] instance.
  const AndroidWebMessageListenerCreationParams({
    required this.allowedOriginRules,
    required super.jsObjectName,
    super.onPostMessage,
  });

  /// Creates a [AndroidWebMessageListenerCreationParams] instance based on [CygnusPlatformWebMessageListenerCreationParams].
  factory AndroidWebMessageListenerCreationParams.fromPlatformWebMessageListenerCreationParams(
    // Recommended placeholder to prevent being broken by platform interface.
    // ignore: avoid_unused_constructor_parameters
    CygnusPlatformWebMessageListenerCreationParams params,
  ) {
    return AndroidWebMessageListenerCreationParams(
      allowedOriginRules: params.allowedOriginRules ?? Set.from(["*"]),
      jsObjectName: params.jsObjectName,
      onPostMessage: params.onPostMessage,
    );
  }

  @override
  final Set<String> allowedOriginRules;

  @override
  String toString() {
    return 'AndroidWebMessageListenerCreationParams{jsObjectName: $jsObjectName, allowedOriginRules: $allowedOriginRules, onPostMessage: $onPostMessage}';
  }
}

///{@macro cygnus_core.CygnusPlatformWebMessageListener}
class AndroidWebMessageListener extends CygnusPlatformWebMessageListener
    with ChannelController {
  /// Constructs a [AndroidWebMessageListener].
  AndroidWebMessageListener(CygnusPlatformWebMessageListenerCreationParams params)
    : super.implementation(
        params is AndroidWebMessageListenerCreationParams
            ? params
            : AndroidWebMessageListenerCreationParams.fromPlatformWebMessageListenerCreationParams(
                params,
              ),
      ) {
    assert(
      !this._androidParams.allowedOriginRules.contains(""),
      "allowedOriginRules cannot contain empty strings",
    );
    channel = MethodChannel(
      'com.pichillilorenzo/flutter_inappwebview_web_message_listener_${_id}_${params.jsObjectName}',
    );
    handler = _handleMethod;
    initMethodCallHandler();
  }

  static final AndroidWebMessageListener _staticValue =
      AndroidWebMessageListener(
        AndroidWebMessageListenerCreationParams(
          jsObjectName: '',
          allowedOriginRules: Set.from(["*"]),
        ),
      );

  /// Provide static access.
  factory AndroidWebMessageListener.static() {
    return _staticValue;
  }

  ///Message Listener ID used internally.
  final String _id = IdGenerator.generate();

  AndroidJavaScriptReplyProxy? _replyProxy;

  AndroidWebMessageListenerCreationParams get _androidParams =>
      params as AndroidWebMessageListenerCreationParams;

  Future<dynamic> _handleMethod(MethodCall call) async {
    switch (call.method) {
      case "onPostMessage":
        if (_replyProxy == null) {
          _replyProxy = AndroidJavaScriptReplyProxy(
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
      "allowedOriginRules": _androidParams.allowedOriginRules.toList(),
    };
  }

  @override
  Map<String, dynamic> toJson() {
    return this.toMap();
  }

  @override
  String toString() {
    return 'AndroidWebMessageListener{id: ${_id}, jsObjectName: ${params.jsObjectName}, allowedOriginRules: ${params.allowedOriginRules}, replyProxy: $_replyProxy}';
  }
}

/// Object specifying creation parameters for creating a [AndroidJavaScriptReplyProxy].
///
/// When adding additional fields make sure they can be null or have a default
/// value to avoid breaking changes. See [CygnusPlatformJavaScriptReplyProxyCreationParams] for
/// more information.
@immutable
class AndroidJavaScriptReplyProxyCreationParams
    extends CygnusPlatformJavaScriptReplyProxyCreationParams {
  /// Creates a new [AndroidJavaScriptReplyProxyCreationParams] instance.
  const AndroidJavaScriptReplyProxyCreationParams({
    required super.webMessageListener,
  });

  /// Creates a [AndroidJavaScriptReplyProxyCreationParams] instance based on [CygnusPlatformJavaScriptReplyProxyCreationParams].
  factory AndroidJavaScriptReplyProxyCreationParams.fromPlatformJavaScriptReplyProxyCreationParams(
    // Recommended placeholder to prevent being broken by platform interface.
    // ignore: avoid_unused_constructor_parameters
    CygnusPlatformJavaScriptReplyProxyCreationParams params,
  ) {
    return AndroidJavaScriptReplyProxyCreationParams(
      webMessageListener: params.webMessageListener,
    );
  }
}

///{@macro cygnus_core.CygnusJavaScriptReplyProxy}
class AndroidJavaScriptReplyProxy extends CygnusPlatformJavaScriptReplyProxy {
  /// Constructs a [AndroidWebMessageListener].
  AndroidJavaScriptReplyProxy(CygnusPlatformJavaScriptReplyProxyCreationParams params)
    : super.implementation(
        params is AndroidJavaScriptReplyProxyCreationParams
            ? params
            : AndroidJavaScriptReplyProxyCreationParams.fromPlatformJavaScriptReplyProxyCreationParams(
                params,
              ),
      );

  AndroidWebMessageListener get _androidWebMessageListener =>
      params.webMessageListener as AndroidWebMessageListener;

  @override
  Future<void> postMessage(CygnusWebMessage message) async {
    Map<String, dynamic> args = <String, dynamic>{};
    args.putIfAbsent('message', () => message.toMap());
    await _androidWebMessageListener.channel?.invokeMethod('postMessage', args);
  }

  @override
  String toString() {
    return 'AndroidJavaScriptReplyProxy{}';
  }
}
