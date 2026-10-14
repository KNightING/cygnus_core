import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:cygnus_core/src/platform_interface/flutter_inappwebview_platform_interface.dart';

///{@macro cygnus_core.CygnusPlatformWebAuthenticationSession}
///
///{@macro cygnus_core.CygnusPlatformWebAuthenticationSession.supported_platforms}
class CygnusWebAuthenticationSession {
  ///{@macro cygnus_core.CygnusPlatformWebAuthenticationSession}
  ///
  ///{@macro cygnus_core.CygnusPlatformWebAuthenticationSession.supported_platforms}
  CygnusWebAuthenticationSession()
    : this.fromPlatformCreationParams(
        params: CygnusPlatformWebAuthenticationSessionCreationParams(),
      );

  /// Constructs a [CygnusWebAuthenticationSession].
  ///
  /// See [CygnusWebAuthenticationSession.fromPlatformCreationParams] for setting parameters for
  /// a specific platform.
  CygnusWebAuthenticationSession.fromPlatformCreationParams({
    required CygnusPlatformWebAuthenticationSessionCreationParams params,
  }) : this.fromPlatform(platform: CygnusPlatformWebAuthenticationSession(params));

  /// Constructs a [CygnusWebAuthenticationSession] from a specific platform implementation.
  CygnusWebAuthenticationSession.fromPlatform({required this.platform});

  /// Implementation of [CygnusPlatformWebAuthenticationSession] for the current platform.
  final CygnusPlatformWebAuthenticationSession platform;

  ///{@macro cygnus_core.CygnusPlatformWebAuthenticationSession.id}
  ///
  ///{@macro cygnus_core.CygnusPlatformWebAuthenticationSession.id.supported_platforms}
  String get id => platform.id;

  ///{@macro cygnus_core.CygnusPlatformWebAuthenticationSession.url}
  ///
  ///{@macro cygnus_core.CygnusPlatformWebAuthenticationSession.url.supported_platforms}
  CygnusWebUri get url => platform.url;

  ///{@macro cygnus_core.CygnusPlatformWebAuthenticationSession.callbackURLScheme}
  ///
  ///{@macro cygnus_core.CygnusPlatformWebAuthenticationSession.callbackURLScheme.supported_platforms}
  String? get callbackURLScheme => platform.callbackURLScheme;

  ///{@macro cygnus_core.CygnusPlatformWebAuthenticationSession.initialSettings}
  ///
  ///{@macro cygnus_core.CygnusPlatformWebAuthenticationSession.initialSettings.supported_platforms}
  CygnusWebAuthenticationSessionSettings? get initialSettings =>
      platform.initialSettings;

  ///{@macro cygnus_core.CygnusPlatformWebAuthenticationSession.onComplete}
  ///
  ///{@macro cygnus_core.CygnusPlatformWebAuthenticationSession.onComplete.supported_platforms}
  CygnusWebAuthenticationSessionCompletionHandler get onComplete =>
      platform.onComplete;

  ///{@macro cygnus_core.CygnusPlatformWebAuthenticationSession.create}
  ///
  ///{@macro cygnus_core.CygnusPlatformWebAuthenticationSession.create.supported_platforms}
  static Future<CygnusWebAuthenticationSession> create({
    required CygnusWebUri url,
    String? callbackURLScheme,
    CygnusWebAuthenticationSessionCompletionHandler onComplete,
    CygnusWebAuthenticationSessionSettings? initialSettings,
  }) async {
    return CygnusWebAuthenticationSession.fromPlatform(
      platform: await CygnusPlatformWebAuthenticationSession.static().create(
        url: url,
        callbackURLScheme: callbackURLScheme,
        onComplete: onComplete,
        initialSettings: initialSettings,
      ),
    );
  }

  ///{@macro cygnus_core.CygnusPlatformWebAuthenticationSession.canStart}
  ///
  ///{@macro cygnus_core.CygnusPlatformWebAuthenticationSession.canStart.supported_platforms}
  Future<bool> canStart() => platform.canStart();

  ///{@macro cygnus_core.CygnusPlatformWebAuthenticationSession.start}
  ///
  ///{@macro cygnus_core.CygnusPlatformWebAuthenticationSession.start.supported_platforms}
  Future<bool> start() => platform.start();

  ///{@macro cygnus_core.CygnusPlatformWebAuthenticationSession.cancel}
  ///
  ///{@macro cygnus_core.CygnusPlatformWebAuthenticationSession.cancel.supported_platforms}
  Future<void> cancel() => platform.cancel();

  ///{@macro cygnus_core.CygnusPlatformWebAuthenticationSession.dispose}
  ///
  ///{@macro cygnus_core.CygnusPlatformWebAuthenticationSession.dispose.supported_platforms}
  Future<void> dispose() => platform.dispose();

  ///{@macro cygnus_core.CygnusPlatformWebAuthenticationSession.isAvailable}
  ///
  ///{@macro cygnus_core.CygnusPlatformWebAuthenticationSession.isAvailable.supported_platforms}
  static Future<bool> isAvailable() =>
      CygnusPlatformWebAuthenticationSession.static().isAvailable();

  ///{@template cygnus_core.CygnusWebAuthenticationSession.isClassSupported}
  ///Check if the current class is supported by the [defaultTargetPlatform] or a specific [platform].
  ///{@endtemplate}
  static bool isClassSupported({TargetPlatform? platform}) =>
      CygnusPlatformWebAuthenticationSession.static().isClassSupported(
        platform: platform,
      );

  ///{@template cygnus_core.CygnusWebAuthenticationSession.isPropertySupported}
  ///Check if the given [property] is supported by the [defaultTargetPlatform] or a specific [platform].
  ///The property should be one of the [CygnusPlatformWebAuthenticationSessionProperty] or [PlatformWebAuthenticationSessionCreationParamsProperty] values.
  ///{@endtemplate}
  static bool isPropertySupported(
    dynamic property, {
    TargetPlatform? platform,
  }) => CygnusPlatformWebAuthenticationSession.static().isPropertySupported(
    property,
    platform: platform,
  );

  ///{@template cygnus_core.CygnusWebAuthenticationSession.isMethodSupported}
  ///Check if the given [method] is supported by the [defaultTargetPlatform] or a specific [platform].
  ///{@endtemplate}
  static bool isMethodSupported(
    CygnusPlatformWebAuthenticationSessionMethod method, {
    TargetPlatform? platform,
  }) => CygnusPlatformWebAuthenticationSession.static().isMethodSupported(
    method,
    platform: platform,
  );
}
