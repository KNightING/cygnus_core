import 'package:flutter/foundation.dart';
import 'package:cygnus_core_internal_annotations/cygnus_core_internal_annotations.dart';
import 'package:cygnus_core/src/platform_interface/src/types/disposable.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';
import '../webview/platform_webview_controller.dart';
import '../webview_platform.dart';
import '../types/main.dart';
import 'web_message.dart';

// ignore: uri_has_not_been_generated
part 'platform_web_message_listener.g.dart';

///{@template cygnus_core.CygnusPlatformWebMessageListenerCreationParams}
/// Object specifying creation parameters for creating a [CygnusPlatformWebMessageListener].
///
/// Platform specific implementations can add additional fields by extending
/// this class.
///{@endtemplate}
///
///{@macro cygnus_core.CygnusPlatformWebMessageListenerCreationParams.supported_platforms}
@SupportedPlatforms(
  platforms: [
    AndroidPlatform(),
    IOSPlatform(),
    MacOSPlatform(),
    LinuxPlatform(),
    WindowsPlatform(),
  ],
)
@immutable
class CygnusPlatformWebMessageListenerCreationParams {
  /// Used by the platform implementation to create a new [CygnusPlatformWebMessageListener].
  const CygnusPlatformWebMessageListenerCreationParams({
    required this.jsObjectName,
    this.allowedOriginRules,
    this.onPostMessage,
  });

  ///{@template cygnus_core.CygnusPlatformWebMessageListenerCreationParams.jsObjectName}
  ///The name for the injected JavaScript object.
  ///{@endtemplate}
  ///
  ///{@macro cygnus_core.CygnusPlatformWebMessageListenerCreationParams.jsObjectName.supported_platforms}
  @SupportedPlatforms(
    platforms: [
      AndroidPlatform(),
      IOSPlatform(),
      MacOSPlatform(),
      LinuxPlatform(),
      WindowsPlatform(),
    ],
  )
  final String jsObjectName;

  ///{@template cygnus_core.CygnusPlatformWebMessageListenerCreationParams.allowedOriginRules}
  ///A set of matching rules for the allowed origins.
  ///{@endtemplate}
  ///
  ///{@macro cygnus_core.CygnusPlatformWebMessageListenerCreationParams.allowedOriginRules.supported_platforms}
  @SupportedPlatforms(
    platforms: [
      AndroidPlatform(),
      IOSPlatform(),
      MacOSPlatform(),
      LinuxPlatform(),
      WindowsPlatform(),
    ],
  )
  final Set<String>? allowedOriginRules;

  ///{@template cygnus_core.CygnusPlatformWebMessageListenerCreationParams.onPostMessage}
  ///Event that receives a message sent by a `postMessage()` on the injected JavaScript object.
  ///
  ///Note that when the frame is `file:` or `content:` origin, the value of [sourceOrigin] is `null`.
  ///
  ///- [message] represents the message from JavaScript.
  ///- [sourceOrigin] represents the origin of the frame that the message is from.
  ///- [isMainFrame] is `true` if the message is from the main frame.
  ///- [replyProxy] is used to reply back to the JavaScript object.
  ///{@endtemplate}
  ///
  ///{@macro cygnus_core.CygnusPlatformWebMessageListenerCreationParams.onPostMessage.supported_platforms}
  @SupportedPlatforms(
    platforms: [
      AndroidPlatform(
        apiName: 'WebViewCompat.CygnusWebMessageListener.onPostMessage',
        apiUrl:
            'https://developer.android.com/reference/androidx/webkit/WebViewCompat.CygnusWebMessageListener#onPostMessage(android.webkit.WebView,%20androidx.webkit.WebMessageCompat,%20android.net.Uri,%20boolean,%20androidx.webkit.CygnusJavaScriptReplyProxy)',
      ),
      IOSPlatform(),
      MacOSPlatform(),
      LinuxPlatform(),
      WindowsPlatform(),
    ],
  )
  final CygnusOnPostMessageCallback? onPostMessage;

  ///{@template cygnus_core.CygnusPlatformWebMessageListenerCreationParams.isClassSupported}
  ///Check if the current class is supported by the [defaultTargetPlatform] or a specific [platform].
  ///{@endtemplate}
  bool isClassSupported({TargetPlatform? platform}) =>
      _CygnusPlatformWebMessageListenerCreationParamsClassSupported.isClassSupported(
        platform: platform,
      );

  ///{@template cygnus_core.CygnusPlatformWebMessageListenerCreationParams.isPropertySupported}
  ///Check if the given [property] is supported by the [defaultTargetPlatform] or a specific [platform].
  ///{@endtemplate}
  bool isPropertySupported(
    CygnusPlatformWebMessageListenerCreationParamsProperty property, {
    TargetPlatform? platform,
  }) =>
      _CygnusPlatformWebMessageListenerCreationParamsPropertySupported.isPropertySupported(
        property,
        platform: platform,
      );

  @override
  String toString() {
    return 'CygnusPlatformWebMessageListenerCreationParams{jsObjectName: $jsObjectName, allowedOriginRules: $allowedOriginRules, onPostMessage: $onPostMessage}';
  }
}

///{@template cygnus_core.CygnusPlatformWebMessageListener}
///This listener receives messages sent on the JavaScript object which was injected by [CygnusPlatformWebViewController.addWebMessageListener].
///{@endtemplate}
///
///{@macro cygnus_core.CygnusPlatformWebMessageListener.supported_platforms}
@SupportedPlatforms(
  platforms: [
    AndroidPlatform(),
    IOSPlatform(),
    MacOSPlatform(),
    LinuxPlatform(),
    WindowsPlatform(),
  ],
)
abstract class CygnusPlatformWebMessageListener extends PlatformInterface
    implements CygnusDisposable {
  /// Creates a new [CygnusPlatformWebMessageListener]
  factory CygnusPlatformWebMessageListener(
    CygnusPlatformWebMessageListenerCreationParams params,
  ) {
    assert(
      CygnusWebViewPlatform.instance != null,
      'A platform implementation for `cygnus` has not been set. Please '
      'ensure that an implementation of `CygnusWebViewPlatform` has been set to '
      '`CygnusWebViewPlatform.instance` before use. For unit testing, '
      '`CygnusWebViewPlatform.instance` can be set with your own test implementation.',
    );
    final CygnusPlatformWebMessageListener webMessageListener = CygnusWebViewPlatform
        .instance!
        .createPlatformWebMessageListener(params);
    PlatformInterface.verify(webMessageListener, _token);
    return webMessageListener;
  }

  /// Creates a new [CygnusPlatformWebMessageListener] to access static methods.
  factory CygnusPlatformWebMessageListener.static() {
    assert(
      CygnusWebViewPlatform.instance != null,
      'A platform implementation for `cygnus` has not been set. Please '
      'ensure that an implementation of `CygnusWebViewPlatform` has been set to '
      '`CygnusWebViewPlatform.instance` before use. For unit testing, '
      '`CygnusWebViewPlatform.instance` can be set with your own test implementation.',
    );
    final CygnusPlatformWebMessageListener webMessageListenerStatic =
        CygnusWebViewPlatform.instance!.createPlatformWebMessageListenerStatic();
    PlatformInterface.verify(webMessageListenerStatic, _token);
    return webMessageListenerStatic;
  }

  /// Used by the platform implementation to create a new [CygnusPlatformWebMessageListener].
  ///
  /// Should only be used by platform implementations because they can't extend
  /// a class that only contains a factory constructor.
  @protected
  CygnusPlatformWebMessageListener.implementation(this.params) : super(token: _token);

  static final Object _token = Object();

  /// The parameters used to initialize the [CygnusPlatformWebMessageListener].
  final CygnusPlatformWebMessageListenerCreationParams params;

  ///{@macro cygnus_core.CygnusPlatformWebMessageListenerCreationParams.jsObjectName}
  ///
  ///{@macro cygnus_core.CygnusPlatformWebMessageListenerCreationParams.jsObjectName.supported_platforms}
  String get jsObjectName => params.jsObjectName;

  ///{@macro cygnus_core.CygnusPlatformWebMessageListenerCreationParams.allowedOriginRules}
  ///
  ///{@macro cygnus_core.CygnusPlatformWebMessageListenerCreationParams.allowedOriginRules.supported_platforms}
  Set<String>? get allowedOriginRules => params.allowedOriginRules;

  ///{@macro cygnus_core.CygnusPlatformWebMessageListenerCreationParams.onPostMessage}
  ///
  ///{@macro cygnus_core.CygnusPlatformWebMessageListenerCreationParams.onPostMessage.supported_platforms}
  CygnusOnPostMessageCallback? get onPostMessage => params.onPostMessage;

  Map<String, dynamic> toMap() {
    throw UnimplementedError(
      'toMap is not implemented on the current platform.',
    );
  }

  Map<String, dynamic> toJson() {
    throw UnimplementedError(
      'toJson is not implemented on the current platform.',
    );
  }

  ///{@template cygnus_core.CygnusPlatformWebMessageListener.dispose}
  ///Disposes the channel.
  ///{@endtemplate}
  ///
  ///{@macro cygnus_core.CygnusPlatformWebMessageListener.dispose.supported_platforms}
  @SupportedPlatforms(
    platforms: [
      AndroidPlatform(),
      IOSPlatform(),
      MacOSPlatform(),
      LinuxPlatform(),
      WindowsPlatform(),
    ],
  )
  @override
  void dispose() {
    throw UnimplementedError(
      'dispose is not implemented on the current platform.',
    );
  }

  ///{@macro cygnus_core.CygnusPlatformWebMessageListenerCreationParams.isClassSupported}
  bool isClassSupported({TargetPlatform? platform}) =>
      _CygnusPlatformWebMessageListenerClassSupported.isClassSupported(
        platform: platform,
      );

  ///{@template cygnus_core.CygnusPlatformWebMessageListener.isPropertySupported}
  ///Check if the given [property] is supported by the [defaultTargetPlatform] or a specific [platform].
  ///{@endtemplate}
  bool isPropertySupported(
    CygnusPlatformWebMessageListenerCreationParamsProperty property, {
    TargetPlatform? platform,
  }) => params.isPropertySupported(property, platform: platform);

  ///{@template cygnus_core.CygnusPlatformWebMessageListener.isMethodSupported}
  ///Check if the given [method] is supported by the [defaultTargetPlatform] or a specific [platform].
  ///{@endtemplate}
  bool isMethodSupported(
    CygnusPlatformWebMessageListenerMethod method, {
    TargetPlatform? platform,
  }) => _CygnusPlatformWebMessageListenerMethodSupported.isMethodSupported(
    method,
    platform: platform,
  );

  @override
  String toString() {
    return 'CygnusPlatformWebMessageListener{jsObjectName: $jsObjectName, allowedOriginRules: $allowedOriginRules, onPostMessage: $onPostMessage}';
  }
}

/// Object specifying creation parameters for creating a [CygnusPlatformJavaScriptReplyProxy].
///
/// Platform specific implementations can add additional fields by extending
/// this class.
@immutable
class CygnusPlatformJavaScriptReplyProxyCreationParams {
  /// Used by the platform implementation to create a new [CygnusPlatformJavaScriptReplyProxy].
  const CygnusPlatformJavaScriptReplyProxyCreationParams({
    required this.webMessageListener,
  });

  final CygnusPlatformWebMessageListener webMessageListener;
}

///{@template cygnus_core.CygnusPlatformJavaScriptReplyProxy}
///This class represents the JavaScript object injected by [CygnusPlatformWebViewController.addWebMessageListener].
///An instance will be given by [CygnusPlatformWebMessageListener.onPostMessage].
///The app can use `postMessage(String)` to talk to the JavaScript context.
///
///There is a 1:1 relationship between this object and the JavaScript object in a frame.
///{@endtemplate}
///
///{@macro cygnus_core.CygnusPlatformJavaScriptReplyProxy.supported_platforms}
@SupportedPlatforms(
  platforms: [
    AndroidPlatform(),
    IOSPlatform(),
    MacOSPlatform(),
    LinuxPlatform(),
    WindowsPlatform(),
  ],
)
abstract class CygnusPlatformJavaScriptReplyProxy extends PlatformInterface {
  /// Creates a new [CygnusPlatformWebMessageListener]
  factory CygnusPlatformJavaScriptReplyProxy(
    CygnusPlatformJavaScriptReplyProxyCreationParams params,
  ) {
    assert(
      CygnusWebViewPlatform.instance != null,
      'A platform implementation for `cygnus` has not been set. Please '
      'ensure that an implementation of `CygnusWebViewPlatform` has been set to '
      '`CygnusWebViewPlatform.instance` before use. For unit testing, '
      '`CygnusWebViewPlatform.instance` can be set with your own test implementation.',
    );
    final CygnusPlatformJavaScriptReplyProxy javaScriptReplyProxy =
        CygnusWebViewPlatform.instance!.createPlatformJavaScriptReplyProxy(
          params,
        );
    PlatformInterface.verify(javaScriptReplyProxy, _token);
    return javaScriptReplyProxy;
  }

  /// Used by the platform implementation to create a new [CygnusPlatformJavaScriptReplyProxy].
  ///
  /// Should only be used by platform implementations because they can't extend
  /// a class that only contains a factory constructor.
  @protected
  CygnusPlatformJavaScriptReplyProxy.implementation(this.params)
    : super(token: _token);

  static final Object _token = Object();

  /// The parameters used to initialize the [CygnusPlatformJavaScriptReplyProxy].
  final CygnusPlatformJavaScriptReplyProxyCreationParams params;

  ///{@template cygnus_core.CygnusPlatformJavaScriptReplyProxy.postMessage}
  ///Post a [message] to the injected JavaScript object which sent this [CygnusPlatformJavaScriptReplyProxy].
  ///
  ///If [message] is of type [CygnusWebMessageType.ARRAY_BUFFER], be aware that large byte buffers can lead to out-of-memory crashes on low-end devices.
  ///
  ///**Official Android API**: https://developer.android.com/reference/androidx/webkit/CygnusJavaScriptReplyProxy#postMessage(java.lang.String)
  ///{@endtemplate}
  ///
  ///{@macro cygnus_core.CygnusPlatformJavaScriptReplyProxy.postMessage.supported_platforms}
  @SupportedPlatforms(
    platforms: [
      AndroidPlatform(),
      IOSPlatform(),
      MacOSPlatform(),
      LinuxPlatform(),
      WindowsPlatform(),
    ],
  )
  Future<void> postMessage(CygnusWebMessage message) {
    throw UnimplementedError(
      'postMessage is not implemented on the current platform.',
    );
  }

  @override
  String toString() {
    return 'CygnusJavaScriptReplyProxy{}';
  }
}
