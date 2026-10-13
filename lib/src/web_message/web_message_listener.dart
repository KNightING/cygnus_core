import 'package:flutter/foundation.dart';
import 'package:cygnus_core/src/platform_interface/flutter_inappwebview_platform_interface.dart';

///{@macro cygnus_core.PlatformWebMessageListener}
///
///{@macro cygnus_core.PlatformWebMessageListener.supported_platforms}
class WebMessageListener {
  ///{@macro cygnus_core.PlatformWebMessageListener}
  WebMessageListener({
    required String jsObjectName,
    Set<String>? allowedOriginRules,
    OnPostMessageCallback? onPostMessage,
  }) : this.fromPlatformCreationParams(
         params: PlatformWebMessageListenerCreationParams(
           jsObjectName: jsObjectName,
           allowedOriginRules: allowedOriginRules,
           onPostMessage: onPostMessage,
         ),
       );

  /// Constructs a [WebMessageListener].
  ///
  /// See [WebMessageListener.fromPlatformCreationParams] for setting parameters for
  /// a specific platform.
  WebMessageListener.fromPlatformCreationParams({
    required PlatformWebMessageListenerCreationParams params,
  }) : this.fromPlatform(platform: PlatformWebMessageListener(params));

  /// Constructs a [WebMessageListener] from a specific platform implementation.
  WebMessageListener.fromPlatform({required this.platform});

  /// Implementation of [PlatformWebMessageListener] for the current platform.
  final PlatformWebMessageListener platform;

  /// Provide static access.
  static WebMessageListener static() {
    return WebMessageListener.fromPlatform(
      platform: PlatformWebMessageListener.static(),
    );
  }

  ///{@macro cygnus_core.PlatformWebMessageListenerCreationParams.isClassSupported}
  static bool isClassSupported({TargetPlatform? platform}) =>
      PlatformWebMessageListener.static().isClassSupported(platform: platform);

  ///{@macro cygnus_core.PlatformWebMessageListener.isPropertySupported}
  static bool isPropertySupported(
    PlatformWebMessageListenerCreationParamsProperty property, {
    TargetPlatform? platform,
  }) => PlatformWebMessageListener.static().isPropertySupported(
    property,
    platform: platform,
  );

  ///{@macro cygnus_core.PlatformWebMessageListener.isMethodSupported}
  static bool isMethodSupported(
    PlatformWebMessageListenerMethod method, {
    TargetPlatform? platform,
  }) => PlatformWebMessageListener.static().isMethodSupported(
    method,
    platform: platform,
  );

  ///{@macro cygnus_core.PlatformWebMessageListener.jsObjectName}
  ///
  ///{@macro cygnus_core.PlatformWebMessageListener.jsObjectName.supported_platforms}
  String get jsObjectName => platform.jsObjectName;

  ///{@macro cygnus_core.PlatformWebMessageListener.allowedOriginRules}
  ///
  ///{@macro cygnus_core.PlatformWebMessageListener.allowedOriginRules.supported_platforms}
  Set<String>? get allowedOriginRules => platform.allowedOriginRules;

  ///{@macro cygnus_core.PlatformWebMessageListener.onPostMessage}
  ///
  ///{@macro cygnus_core.PlatformWebMessageListener.onPostMessage.supported_platforms}
  OnPostMessageCallback? get onPostMessage => platform.onPostMessage;

  ///{@macro cygnus_core.PlatformWebMessageListener.dispose}
  ///
  ///{@macro cygnus_core.PlatformWebMessageListener.dispose.supported_platforms}
  void dispose() => platform.dispose();

  Map<String, dynamic> toMap() => platform.toMap();

  Map<String, dynamic> toJson() => platform.toJson();

  @override
  String toString() => platform.toString();
}

///{@macro cygnus_core.PlatformJavaScriptReplyProxy}
///
///{@macro cygnus_core.PlatformJavaScriptReplyProxy.supported_platforms}
class JavaScriptReplyProxy {
  ///{@macro cygnus_core.PlatformJavaScriptReplyProxy}
  JavaScriptReplyProxy({required PlatformWebMessageListener webMessageListener})
    : this.fromPlatformCreationParams(
        params: PlatformJavaScriptReplyProxyCreationParams(
          webMessageListener: webMessageListener,
        ),
      );

  /// Constructs a [JavaScriptReplyProxy].
  ///
  /// See [JavaScriptReplyProxy.fromPlatformCreationParams] for setting parameters for
  /// a specific platform.
  JavaScriptReplyProxy.fromPlatformCreationParams({
    required PlatformJavaScriptReplyProxyCreationParams params,
  }) : this.fromPlatform(platform: PlatformJavaScriptReplyProxy(params));

  /// Constructs a [JavaScriptReplyProxy] from a specific platform implementation.
  JavaScriptReplyProxy.fromPlatform({required this.platform});

  /// Implementation of [PlatformJavaScriptReplyProxy] for the current platform.
  final PlatformJavaScriptReplyProxy platform;

  ///{@macro cygnus_core.PlatformJavaScriptReplyProxy.postMessage}
  ///
  ///{@macro cygnus_core.PlatformJavaScriptReplyProxy.postMessage.supported_platforms}
  Future<void> postMessage(WebMessage message) => platform.postMessage(message);

  @override
  String toString() {
    return 'JavaScriptReplyProxy{}';
  }
}
