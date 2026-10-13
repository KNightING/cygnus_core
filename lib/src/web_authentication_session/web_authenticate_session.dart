import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:cygnus_core/src/platform_interface/flutter_inappwebview_platform_interface.dart';

///{@macro cygnus_core.PlatformWebAuthenticationSession}
///
///{@macro cygnus_core.PlatformWebAuthenticationSession.supported_platforms}
class WebAuthenticationSession {
  ///{@macro cygnus_core.PlatformWebAuthenticationSession}
  ///
  ///{@macro cygnus_core.PlatformWebAuthenticationSession.supported_platforms}
  WebAuthenticationSession()
    : this.fromPlatformCreationParams(
        params: PlatformWebAuthenticationSessionCreationParams(),
      );

  /// Constructs a [WebAuthenticationSession].
  ///
  /// See [WebAuthenticationSession.fromPlatformCreationParams] for setting parameters for
  /// a specific platform.
  WebAuthenticationSession.fromPlatformCreationParams({
    required PlatformWebAuthenticationSessionCreationParams params,
  }) : this.fromPlatform(platform: PlatformWebAuthenticationSession(params));

  /// Constructs a [WebAuthenticationSession] from a specific platform implementation.
  WebAuthenticationSession.fromPlatform({required this.platform});

  /// Implementation of [PlatformWebAuthenticationSession] for the current platform.
  final PlatformWebAuthenticationSession platform;

  ///{@macro cygnus_core.PlatformWebAuthenticationSession.id}
  ///
  ///{@macro cygnus_core.PlatformWebAuthenticationSession.id.supported_platforms}
  String get id => platform.id;

  ///{@macro cygnus_core.PlatformWebAuthenticationSession.url}
  ///
  ///{@macro cygnus_core.PlatformWebAuthenticationSession.url.supported_platforms}
  WebUri get url => platform.url;

  ///{@macro cygnus_core.PlatformWebAuthenticationSession.callbackURLScheme}
  ///
  ///{@macro cygnus_core.PlatformWebAuthenticationSession.callbackURLScheme.supported_platforms}
  String? get callbackURLScheme => platform.callbackURLScheme;

  ///{@macro cygnus_core.PlatformWebAuthenticationSession.initialSettings}
  ///
  ///{@macro cygnus_core.PlatformWebAuthenticationSession.initialSettings.supported_platforms}
  WebAuthenticationSessionSettings? get initialSettings =>
      platform.initialSettings;

  ///{@macro cygnus_core.PlatformWebAuthenticationSession.onComplete}
  ///
  ///{@macro cygnus_core.PlatformWebAuthenticationSession.onComplete.supported_platforms}
  WebAuthenticationSessionCompletionHandler get onComplete =>
      platform.onComplete;

  ///{@macro cygnus_core.PlatformWebAuthenticationSession.create}
  ///
  ///{@macro cygnus_core.PlatformWebAuthenticationSession.create.supported_platforms}
  static Future<WebAuthenticationSession> create({
    required WebUri url,
    String? callbackURLScheme,
    WebAuthenticationSessionCompletionHandler onComplete,
    WebAuthenticationSessionSettings? initialSettings,
  }) async {
    return WebAuthenticationSession.fromPlatform(
      platform: await PlatformWebAuthenticationSession.static().create(
        url: url,
        callbackURLScheme: callbackURLScheme,
        onComplete: onComplete,
        initialSettings: initialSettings,
      ),
    );
  }

  ///{@macro cygnus_core.PlatformWebAuthenticationSession.canStart}
  ///
  ///{@macro cygnus_core.PlatformWebAuthenticationSession.canStart.supported_platforms}
  Future<bool> canStart() => platform.canStart();

  ///{@macro cygnus_core.PlatformWebAuthenticationSession.start}
  ///
  ///{@macro cygnus_core.PlatformWebAuthenticationSession.start.supported_platforms}
  Future<bool> start() => platform.start();

  ///{@macro cygnus_core.PlatformWebAuthenticationSession.cancel}
  ///
  ///{@macro cygnus_core.PlatformWebAuthenticationSession.cancel.supported_platforms}
  Future<void> cancel() => platform.cancel();

  ///{@macro cygnus_core.PlatformWebAuthenticationSession.dispose}
  ///
  ///{@macro cygnus_core.PlatformWebAuthenticationSession.dispose.supported_platforms}
  Future<void> dispose() => platform.dispose();

  ///{@macro cygnus_core.PlatformWebAuthenticationSession.isAvailable}
  ///
  ///{@macro cygnus_core.PlatformWebAuthenticationSession.isAvailable.supported_platforms}
  static Future<bool> isAvailable() =>
      PlatformWebAuthenticationSession.static().isAvailable();

  ///{@template cygnus_core.WebAuthenticationSession.isClassSupported}
  ///Check if the current class is supported by the [defaultTargetPlatform] or a specific [platform].
  ///{@endtemplate}
  static bool isClassSupported({TargetPlatform? platform}) =>
      PlatformWebAuthenticationSession.static().isClassSupported(
        platform: platform,
      );

  ///{@template cygnus_core.WebAuthenticationSession.isPropertySupported}
  ///Check if the given [property] is supported by the [defaultTargetPlatform] or a specific [platform].
  ///The property should be one of the [PlatformWebAuthenticationSessionProperty] or [PlatformWebAuthenticationSessionCreationParamsProperty] values.
  ///{@endtemplate}
  static bool isPropertySupported(
    dynamic property, {
    TargetPlatform? platform,
  }) => PlatformWebAuthenticationSession.static().isPropertySupported(
    property,
    platform: platform,
  );

  ///{@template cygnus_core.WebAuthenticationSession.isMethodSupported}
  ///Check if the given [method] is supported by the [defaultTargetPlatform] or a specific [platform].
  ///{@endtemplate}
  static bool isMethodSupported(
    PlatformWebAuthenticationSessionMethod method, {
    TargetPlatform? platform,
  }) => PlatformWebAuthenticationSession.static().isMethodSupported(
    method,
    platform: platform,
  );
}
