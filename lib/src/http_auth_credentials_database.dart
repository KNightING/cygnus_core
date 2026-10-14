import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:cygnus_core/src/platform_interface/flutter_webview_platform_interface.dart';

///{@macro cygnus_core.CygnusPlatformHttpAuthCredentialDatabase}
///
///{@macro cygnus_core.CygnusPlatformHttpAuthCredentialDatabase.supported_platforms}
class CygnusHttpAuthCredentialDatabase {
  ///{@macro cygnus_core.CygnusPlatformHttpAuthCredentialDatabase}
  ///
  ///{@macro cygnus_core.CygnusPlatformHttpAuthCredentialDatabase.supported_platforms}
  CygnusHttpAuthCredentialDatabase()
    : this.fromPlatformCreationParams(
        const CygnusPlatformHttpAuthCredentialDatabaseCreationParams(),
      );

  /// Constructs a [CygnusHttpAuthCredentialDatabase] from creation params for a specific
  /// platform.
  CygnusHttpAuthCredentialDatabase.fromPlatformCreationParams(
    CygnusPlatformHttpAuthCredentialDatabaseCreationParams params,
  ) : this.fromPlatform(CygnusPlatformHttpAuthCredentialDatabase(params));

  /// Constructs a [CygnusHttpAuthCredentialDatabase] from a specific platform
  /// implementation.
  CygnusHttpAuthCredentialDatabase.fromPlatform(this.platform);

  /// Implementation of [CygnusPlatformHttpAuthCredentialDatabase] for the current platform.
  final CygnusPlatformHttpAuthCredentialDatabase platform;

  static CygnusHttpAuthCredentialDatabase? _instance;

  ///Gets the [CygnusHttpAuthCredentialDatabase] shared instance.
  static CygnusHttpAuthCredentialDatabase instance() {
    if (_instance == null) {
      _instance = CygnusHttpAuthCredentialDatabase();
    }
    return _instance!;
  }

  ///{@macro cygnus_core.CygnusPlatformHttpAuthCredentialDatabase.getAllAuthCredentials}
  ///
  ///{@macro cygnus_core.CygnusPlatformHttpAuthCredentialDatabase.getAllAuthCredentials.supported_platforms}
  Future<List<CygnusURLProtectionSpaceHttpAuthCredentials>> getAllAuthCredentials() =>
      platform.getAllAuthCredentials();

  ///{@macro cygnus_core.CygnusPlatformHttpAuthCredentialDatabase.getHttpAuthCredentials}
  ///
  ///{@macro cygnus_core.CygnusPlatformHttpAuthCredentialDatabase.getHttpAuthCredentials.supported_platforms}
  Future<List<CygnusURLCredential>> getHttpAuthCredentials({
    required CygnusURLProtectionSpace protectionSpace,
  }) => platform.getHttpAuthCredentials(protectionSpace: protectionSpace);

  ///{@macro cygnus_core.CygnusPlatformHttpAuthCredentialDatabase.setHttpAuthCredential}
  ///
  ///{@macro cygnus_core.CygnusPlatformHttpAuthCredentialDatabase.setHttpAuthCredential.supported_platforms}
  Future<void> setHttpAuthCredential({
    required CygnusURLProtectionSpace protectionSpace,
    required CygnusURLCredential credential,
  }) => platform.setHttpAuthCredential(
    protectionSpace: protectionSpace,
    credential: credential,
  );

  ///{@macro cygnus_core.CygnusPlatformHttpAuthCredentialDatabase.removeHttpAuthCredential}
  ///
  ///{@macro cygnus_core.CygnusPlatformHttpAuthCredentialDatabase.removeHttpAuthCredential.supported_platforms}
  Future<void> removeHttpAuthCredential({
    required CygnusURLProtectionSpace protectionSpace,
    required CygnusURLCredential credential,
  }) => platform.removeHttpAuthCredential(
    protectionSpace: protectionSpace,
    credential: credential,
  );

  ///{@macro cygnus_core.CygnusPlatformHttpAuthCredentialDatabase.removeHttpAuthCredentials}
  ///
  ///{@macro cygnus_core.CygnusPlatformHttpAuthCredentialDatabase.removeHttpAuthCredentials.supported_platforms}
  Future<void> removeHttpAuthCredentials({
    required CygnusURLProtectionSpace protectionSpace,
  }) => platform.removeHttpAuthCredentials(protectionSpace: protectionSpace);

  ///{@macro cygnus_core.CygnusPlatformHttpAuthCredentialDatabase.clearAllAuthCredentials}
  ///
  ///{@macro cygnus_core.CygnusPlatformHttpAuthCredentialDatabase.clearAllAuthCredentials.supported_platforms}
  Future<void> clearAllAuthCredentials() => platform.clearAllAuthCredentials();

  ///{@macro cygnus_core.CygnusPlatformHttpAuthCredentialDatabaseCreationParams.isClassSupported}
  ///
  ///{@macro cygnus_core.CygnusPlatformHttpAuthCredentialDatabaseCreationParams.isClassSupported.supported_platforms}
  static bool isClassSupported({TargetPlatform? platform}) =>
      CygnusPlatformHttpAuthCredentialDatabase.static().isClassSupported(
        platform: platform,
      );

  ///{@macro cygnus_core.CygnusPlatformHttpAuthCredentialDatabase.isMethodSupported}
  ///
  ///{@macro cygnus_core.CygnusPlatformHttpAuthCredentialDatabase.isMethodSupported.supported_platforms}
  static bool isMethodSupported(
    CygnusPlatformHttpAuthCredentialDatabaseMethod method, {
    TargetPlatform? platform,
  }) => CygnusPlatformHttpAuthCredentialDatabase.static().isMethodSupported(
    method,
    platform: platform,
  );
}
