import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:cygnus_core/src/platform_interface/flutter_inappwebview_platform_interface.dart';

///{@macro cygnus_core.PlatformHttpAuthCredentialDatabase}
///
///{@macro cygnus_core.PlatformHttpAuthCredentialDatabase.supported_platforms}
class HttpAuthCredentialDatabase {
  ///{@macro cygnus_core.PlatformHttpAuthCredentialDatabase}
  ///
  ///{@macro cygnus_core.PlatformHttpAuthCredentialDatabase.supported_platforms}
  HttpAuthCredentialDatabase()
    : this.fromPlatformCreationParams(
        const PlatformHttpAuthCredentialDatabaseCreationParams(),
      );

  /// Constructs a [HttpAuthCredentialDatabase] from creation params for a specific
  /// platform.
  HttpAuthCredentialDatabase.fromPlatformCreationParams(
    PlatformHttpAuthCredentialDatabaseCreationParams params,
  ) : this.fromPlatform(PlatformHttpAuthCredentialDatabase(params));

  /// Constructs a [HttpAuthCredentialDatabase] from a specific platform
  /// implementation.
  HttpAuthCredentialDatabase.fromPlatform(this.platform);

  /// Implementation of [PlatformHttpAuthCredentialDatabase] for the current platform.
  final PlatformHttpAuthCredentialDatabase platform;

  static HttpAuthCredentialDatabase? _instance;

  ///Gets the [HttpAuthCredentialDatabase] shared instance.
  static HttpAuthCredentialDatabase instance() {
    if (_instance == null) {
      _instance = HttpAuthCredentialDatabase();
    }
    return _instance!;
  }

  ///{@macro cygnus_core.PlatformHttpAuthCredentialDatabase.getAllAuthCredentials}
  ///
  ///{@macro cygnus_core.PlatformHttpAuthCredentialDatabase.getAllAuthCredentials.supported_platforms}
  Future<List<URLProtectionSpaceHttpAuthCredentials>> getAllAuthCredentials() =>
      platform.getAllAuthCredentials();

  ///{@macro cygnus_core.PlatformHttpAuthCredentialDatabase.getHttpAuthCredentials}
  ///
  ///{@macro cygnus_core.PlatformHttpAuthCredentialDatabase.getHttpAuthCredentials.supported_platforms}
  Future<List<URLCredential>> getHttpAuthCredentials({
    required URLProtectionSpace protectionSpace,
  }) => platform.getHttpAuthCredentials(protectionSpace: protectionSpace);

  ///{@macro cygnus_core.PlatformHttpAuthCredentialDatabase.setHttpAuthCredential}
  ///
  ///{@macro cygnus_core.PlatformHttpAuthCredentialDatabase.setHttpAuthCredential.supported_platforms}
  Future<void> setHttpAuthCredential({
    required URLProtectionSpace protectionSpace,
    required URLCredential credential,
  }) => platform.setHttpAuthCredential(
    protectionSpace: protectionSpace,
    credential: credential,
  );

  ///{@macro cygnus_core.PlatformHttpAuthCredentialDatabase.removeHttpAuthCredential}
  ///
  ///{@macro cygnus_core.PlatformHttpAuthCredentialDatabase.removeHttpAuthCredential.supported_platforms}
  Future<void> removeHttpAuthCredential({
    required URLProtectionSpace protectionSpace,
    required URLCredential credential,
  }) => platform.removeHttpAuthCredential(
    protectionSpace: protectionSpace,
    credential: credential,
  );

  ///{@macro cygnus_core.PlatformHttpAuthCredentialDatabase.removeHttpAuthCredentials}
  ///
  ///{@macro cygnus_core.PlatformHttpAuthCredentialDatabase.removeHttpAuthCredentials.supported_platforms}
  Future<void> removeHttpAuthCredentials({
    required URLProtectionSpace protectionSpace,
  }) => platform.removeHttpAuthCredentials(protectionSpace: protectionSpace);

  ///{@macro cygnus_core.PlatformHttpAuthCredentialDatabase.clearAllAuthCredentials}
  ///
  ///{@macro cygnus_core.PlatformHttpAuthCredentialDatabase.clearAllAuthCredentials.supported_platforms}
  Future<void> clearAllAuthCredentials() => platform.clearAllAuthCredentials();

  ///{@macro cygnus_core.PlatformHttpAuthCredentialDatabaseCreationParams.isClassSupported}
  ///
  ///{@macro cygnus_core.PlatformHttpAuthCredentialDatabaseCreationParams.isClassSupported.supported_platforms}
  static bool isClassSupported({TargetPlatform? platform}) =>
      PlatformHttpAuthCredentialDatabase.static().isClassSupported(
        platform: platform,
      );

  ///{@macro cygnus_core.PlatformHttpAuthCredentialDatabase.isMethodSupported}
  ///
  ///{@macro cygnus_core.PlatformHttpAuthCredentialDatabase.isMethodSupported.supported_platforms}
  static bool isMethodSupported(
    PlatformHttpAuthCredentialDatabaseMethod method, {
    TargetPlatform? platform,
  }) => PlatformHttpAuthCredentialDatabase.static().isMethodSupported(
    method,
    platform: platform,
  );
}
