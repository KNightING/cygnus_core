import 'package:flutter/foundation.dart';
import 'package:cygnus_core/src/platform_interface/flutter_inappwebview_platform_interface.dart';

///{@macro cygnus_core.CygnusPlatformWebMessageListener}
///
///{@macro cygnus_core.CygnusPlatformWebMessageListener.supported_platforms}
class CygnusWebMessageListener {
  ///{@macro cygnus_core.CygnusPlatformWebMessageListener}
  CygnusWebMessageListener({
    required String jsObjectName,
    Set<String>? allowedOriginRules,
    CygnusOnPostMessageCallback? onPostMessage,
  }) : this.fromPlatformCreationParams(
         params: CygnusPlatformWebMessageListenerCreationParams(
           jsObjectName: jsObjectName,
           allowedOriginRules: allowedOriginRules,
           onPostMessage: onPostMessage,
         ),
       );

  /// Constructs a [CygnusWebMessageListener].
  ///
  /// See [CygnusWebMessageListener.fromPlatformCreationParams] for setting parameters for
  /// a specific platform.
  CygnusWebMessageListener.fromPlatformCreationParams({
    required CygnusPlatformWebMessageListenerCreationParams params,
  }) : this.fromPlatform(platform: CygnusPlatformWebMessageListener(params));

  /// Constructs a [CygnusWebMessageListener] from a specific platform implementation.
  CygnusWebMessageListener.fromPlatform({required this.platform});

  /// Implementation of [CygnusPlatformWebMessageListener] for the current platform.
  final CygnusPlatformWebMessageListener platform;

  /// Provide static access.
  static CygnusWebMessageListener static() {
    return CygnusWebMessageListener.fromPlatform(
      platform: CygnusPlatformWebMessageListener.static(),
    );
  }

  ///{@macro cygnus_core.CygnusPlatformWebMessageListenerCreationParams.isClassSupported}
  static bool isClassSupported({TargetPlatform? platform}) =>
      CygnusPlatformWebMessageListener.static().isClassSupported(platform: platform);

  ///{@macro cygnus_core.CygnusPlatformWebMessageListener.isPropertySupported}
  static bool isPropertySupported(
    CygnusPlatformWebMessageListenerCreationParamsProperty property, {
    TargetPlatform? platform,
  }) => CygnusPlatformWebMessageListener.static().isPropertySupported(
    property,
    platform: platform,
  );

  ///{@macro cygnus_core.CygnusPlatformWebMessageListener.isMethodSupported}
  static bool isMethodSupported(
    CygnusPlatformWebMessageListenerMethod method, {
    TargetPlatform? platform,
  }) => CygnusPlatformWebMessageListener.static().isMethodSupported(
    method,
    platform: platform,
  );

  ///{@macro cygnus_core.CygnusPlatformWebMessageListener.jsObjectName}
  ///
  ///{@macro cygnus_core.CygnusPlatformWebMessageListener.jsObjectName.supported_platforms}
  String get jsObjectName => platform.jsObjectName;

  ///{@macro cygnus_core.CygnusPlatformWebMessageListener.allowedOriginRules}
  ///
  ///{@macro cygnus_core.CygnusPlatformWebMessageListener.allowedOriginRules.supported_platforms}
  Set<String>? get allowedOriginRules => platform.allowedOriginRules;

  ///{@macro cygnus_core.CygnusPlatformWebMessageListener.onPostMessage}
  ///
  ///{@macro cygnus_core.CygnusPlatformWebMessageListener.onPostMessage.supported_platforms}
  CygnusOnPostMessageCallback? get onPostMessage => platform.onPostMessage;

  ///{@macro cygnus_core.CygnusPlatformWebMessageListener.dispose}
  ///
  ///{@macro cygnus_core.CygnusPlatformWebMessageListener.dispose.supported_platforms}
  void dispose() => platform.dispose();

  Map<String, dynamic> toMap() => platform.toMap();

  Map<String, dynamic> toJson() => platform.toJson();

  @override
  String toString() => platform.toString();
}

///{@macro cygnus_core.CygnusPlatformJavaScriptReplyProxy}
///
///{@macro cygnus_core.CygnusPlatformJavaScriptReplyProxy.supported_platforms}
class CygnusJavaScriptReplyProxy {
  ///{@macro cygnus_core.CygnusPlatformJavaScriptReplyProxy}
  CygnusJavaScriptReplyProxy({required CygnusPlatformWebMessageListener webMessageListener})
    : this.fromPlatformCreationParams(
        params: CygnusPlatformJavaScriptReplyProxyCreationParams(
          webMessageListener: webMessageListener,
        ),
      );

  /// Constructs a [CygnusJavaScriptReplyProxy].
  ///
  /// See [CygnusJavaScriptReplyProxy.fromPlatformCreationParams] for setting parameters for
  /// a specific platform.
  CygnusJavaScriptReplyProxy.fromPlatformCreationParams({
    required CygnusPlatformJavaScriptReplyProxyCreationParams params,
  }) : this.fromPlatform(platform: CygnusPlatformJavaScriptReplyProxy(params));

  /// Constructs a [CygnusJavaScriptReplyProxy] from a specific platform implementation.
  CygnusJavaScriptReplyProxy.fromPlatform({required this.platform});

  /// Implementation of [CygnusPlatformJavaScriptReplyProxy] for the current platform.
  final CygnusPlatformJavaScriptReplyProxy platform;

  ///{@macro cygnus_core.CygnusPlatformJavaScriptReplyProxy.postMessage}
  ///
  ///{@macro cygnus_core.CygnusPlatformJavaScriptReplyProxy.postMessage.supported_platforms}
  Future<void> postMessage(CygnusWebMessage message) => platform.postMessage(message);

  @override
  String toString() {
    return 'CygnusJavaScriptReplyProxy{}';
  }
}
