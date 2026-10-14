import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:cygnus_core/src/platform_interface/flutter_webview_platform_interface.dart';

/// Object specifying creation parameters for creating a [MacOSWebMessageListener].
///
/// When adding additional fields make sure they can be null or have a default
/// value to avoid breaking changes. See [CygnusPlatformWebMessageListenerCreationParams] for
/// more information.
@immutable
class MacOSWebMessageListenerCreationParams
    extends CygnusPlatformWebMessageListenerCreationParams {
  /// Creates a new [MacOSWebMessageListenerCreationParams] instance.
  const MacOSWebMessageListenerCreationParams({
    required this.allowedOriginRules,
    required super.jsObjectName,
    super.onPostMessage,
  });

  /// Creates a [MacOSWebMessageListenerCreationParams] instance based on [CygnusPlatformWebMessageListenerCreationParams].
  factory MacOSWebMessageListenerCreationParams.fromPlatformWebMessageListenerCreationParams(
    // Recommended placeholder to prevent being broken by platform interface.
    // ignore: avoid_unused_constructor_parameters
    CygnusPlatformWebMessageListenerCreationParams params,
  ) {
    return MacOSWebMessageListenerCreationParams(
      allowedOriginRules: params.allowedOriginRules ?? Set.from(["*"]),
      jsObjectName: params.jsObjectName,
      onPostMessage: params.onPostMessage,
    );
  }

  @override
  final Set<String> allowedOriginRules;

  @override
  String toString() {
    return 'MacOSWebMessageListenerCreationParams{jsObjectName: $jsObjectName, allowedOriginRules: $allowedOriginRules, onPostMessage: $onPostMessage}';
  }
}

///{@macro cygnus_core.CygnusPlatformWebMessageListener}
class MacOSWebMessageListener extends CygnusPlatformWebMessageListener
    with ChannelController {
  /// Constructs a [MacOSWebMessageListener].
  MacOSWebMessageListener(CygnusPlatformWebMessageListenerCreationParams params)
    : super.implementation(
        params is MacOSWebMessageListenerCreationParams
            ? params
            : MacOSWebMessageListenerCreationParams.fromPlatformWebMessageListenerCreationParams(
                params,
              ),
      ) {
    assert(
      !this._macosParams.allowedOriginRules.contains(""),
      "allowedOriginRules cannot contain empty strings",
    );
    channel = MethodChannel(
      'com.pichillilorenzo/flutter_inappwebview_web_message_listener_${_id}_${params.jsObjectName}',
    );
    handler = _handleMethod;
    initMethodCallHandler();
  }

  static final MacOSWebMessageListener _staticValue = MacOSWebMessageListener(
    MacOSWebMessageListenerCreationParams(
      jsObjectName: '',
      allowedOriginRules: Set.from(["*"]),
    ),
  );

  /// Provide static access.
  factory MacOSWebMessageListener.static() {
    return _staticValue;
  }

  ///Message Listener ID used internally.
  final String _id = IdGenerator.generate();

  MacOSJavaScriptReplyProxy? _replyProxy;

  MacOSWebMessageListenerCreationParams get _macosParams =>
      params as MacOSWebMessageListenerCreationParams;

  Future<dynamic> _handleMethod(MethodCall call) async {
    switch (call.method) {
      case "onPostMessage":
        if (_replyProxy == null) {
          _replyProxy = MacOSJavaScriptReplyProxy(
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
      "allowedOriginRules": _macosParams.allowedOriginRules.toList(),
    };
  }

  @override
  Map<String, dynamic> toJson() {
    return this.toMap();
  }

  @override
  String toString() {
    return 'MacOSWebMessageListener{id: ${_id}, jsObjectName: ${params.jsObjectName}, allowedOriginRules: ${params.allowedOriginRules}, replyProxy: $_replyProxy}';
  }
}

/// Object specifying creation parameters for creating a [MacOSJavaScriptReplyProxy].
///
/// When adding additional fields make sure they can be null or have a default
/// value to avoid breaking changes. See [CygnusPlatformJavaScriptReplyProxyCreationParams] for
/// more information.
@immutable
class MacOSJavaScriptReplyProxyCreationParams
    extends CygnusPlatformJavaScriptReplyProxyCreationParams {
  /// Creates a new [MacOSJavaScriptReplyProxyCreationParams] instance.
  const MacOSJavaScriptReplyProxyCreationParams({
    required super.webMessageListener,
  });

  /// Creates a [MacOSJavaScriptReplyProxyCreationParams] instance based on [CygnusPlatformJavaScriptReplyProxyCreationParams].
  factory MacOSJavaScriptReplyProxyCreationParams.fromPlatformJavaScriptReplyProxyCreationParams(
    // Recommended placeholder to prevent being broken by platform interface.
    // ignore: avoid_unused_constructor_parameters
    CygnusPlatformJavaScriptReplyProxyCreationParams params,
  ) {
    return MacOSJavaScriptReplyProxyCreationParams(
      webMessageListener: params.webMessageListener,
    );
  }
}

///{@macro cygnus_core.CygnusJavaScriptReplyProxy}
class MacOSJavaScriptReplyProxy extends CygnusPlatformJavaScriptReplyProxy {
  /// Constructs a [MacOSWebMessageListener].
  MacOSJavaScriptReplyProxy(CygnusPlatformJavaScriptReplyProxyCreationParams params)
    : super.implementation(
        params is MacOSJavaScriptReplyProxyCreationParams
            ? params
            : MacOSJavaScriptReplyProxyCreationParams.fromPlatformJavaScriptReplyProxyCreationParams(
                params,
              ),
      );

  MacOSWebMessageListener get _macosWebMessageListener =>
      params.webMessageListener as MacOSWebMessageListener;

  @override
  Future<void> postMessage(CygnusWebMessage message) async {
    Map<String, dynamic> args = <String, dynamic>{};
    args.putIfAbsent('message', () => message.toMap());
    await _macosWebMessageListener.channel?.invokeMethod('postMessage', args);
  }

  @override
  String toString() {
    return 'MacOSJavaScriptReplyProxy{}';
  }
}
