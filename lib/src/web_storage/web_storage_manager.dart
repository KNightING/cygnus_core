import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:cygnus_core/src/platform_interface/flutter_webview_platform_interface.dart';

import 'android/web_storage_manager.dart';
import 'ios/web_storage_manager.dart';

///{@macro cygnus_core.CygnusPlatformWebStorageManager}
///
///{@macro cygnus_core.CygnusPlatformWebStorageManager.supported_platforms}
class CygnusWebStorageManager {
  ///{@macro cygnus_core.CygnusPlatformWebStorageManager}
  CygnusWebStorageManager()
    : this.fromPlatformCreationParams(
        const CygnusPlatformWebStorageManagerCreationParams(),
      );

  /// Constructs a [CygnusWebStorageManager] from creation params for a specific
  /// platform.
  CygnusWebStorageManager.fromPlatformCreationParams(
    CygnusPlatformWebStorageManagerCreationParams params,
  ) : this.fromPlatform(CygnusPlatformWebStorageManager(params));

  /// Constructs a [CygnusWebStorageManager] from a specific platform
  /// implementation.
  CygnusWebStorageManager.fromPlatform(this.platform);

  /// Implementation of [CygnusPlatformCookieManager] for the current platform.
  final CygnusPlatformWebStorageManager platform;

  static CygnusWebStorageManager? _instance;

  ///Check if the current class is supported by the [defaultTargetPlatform] or a specific [platform].
  static bool isClassSupported({TargetPlatform? platform}) =>
      CygnusPlatformWebStorageManager.static().isClassSupported(platform: platform);

  ///Check if the given [method] is supported by the [defaultTargetPlatform] or a specific [platform].
  static bool isMethodSupported(
    CygnusPlatformWebStorageManagerMethod method, {
    TargetPlatform? platform,
  }) => CygnusPlatformWebStorageManager.static().isMethodSupported(
    method,
    platform: platform,
  );

  ///Use [CygnusWebStorageManager] instead.
  @Deprecated("Use CygnusWebStorageManager instead")
  CygnusAndroidWebStorageManager android = CygnusAndroidWebStorageManager();

  ///Use [CygnusWebStorageManager] instead.
  @Deprecated("Use CygnusWebStorageManager instead")
  CygnusIOSWebStorageManager ios = CygnusIOSWebStorageManager();

  ///Gets the [CygnusWebStorageManager] shared instance.
  static CygnusWebStorageManager instance() {
    if (_instance == null) {
      _instance = CygnusWebStorageManager();
    }
    return _instance!;
  }

  ///{@macro cygnus_core.CygnusPlatformWebStorageManager.getOrigins}
  ///
  ///{@macro cygnus_core.CygnusPlatformWebStorageManager.getOrigins.supported_platforms}
  Future<List<CygnusWebStorageOrigin>> getOrigins() => platform.getOrigins();

  ///{@macro cygnus_core.CygnusPlatformWebStorageManager.deleteAllData}
  ///
  ///{@macro cygnus_core.CygnusPlatformWebStorageManager.deleteAllData.supported_platforms}
  Future<void> deleteAllData() => platform.deleteAllData();

  ///{@macro cygnus_core.CygnusPlatformWebStorageManager.deleteOrigin}
  ///
  ///{@macro cygnus_core.CygnusPlatformWebStorageManager.deleteOrigin.supported_platforms}
  Future<void> deleteOrigin({required String origin}) =>
      platform.deleteOrigin(origin: origin);

  ///{@macro cygnus_core.CygnusPlatformWebStorageManager.getQuotaForOrigin}
  ///
  ///{@macro cygnus_core.CygnusPlatformWebStorageManager.getQuotaForOrigin.supported_platforms}
  Future<int> getQuotaForOrigin({required String origin}) =>
      platform.getQuotaForOrigin(origin: origin);

  ///{@macro cygnus_core.CygnusPlatformWebStorageManager.getUsageForOrigin}
  ///
  ///{@macro cygnus_core.CygnusPlatformWebStorageManager.getUsageForOrigin.supported_platforms}
  Future<int> getUsageForOrigin({required String origin}) =>
      platform.getUsageForOrigin(origin: origin);

  ///{@macro cygnus_core.CygnusPlatformWebStorageManager.fetchDataRecords}
  ///
  ///{@macro cygnus_core.CygnusPlatformWebStorageManager.fetchDataRecords.supported_platforms}
  Future<List<CygnusWebsiteDataRecord>> fetchDataRecords({
    required Set<CygnusWebsiteDataType> dataTypes,
  }) => platform.fetchDataRecords(dataTypes: dataTypes);

  ///{@macro cygnus_core.CygnusPlatformWebStorageManager.removeDataFor}
  ///
  ///{@macro cygnus_core.CygnusPlatformWebStorageManager.removeDataFor.supported_platforms}
  Future<void> removeDataFor({
    required Set<CygnusWebsiteDataType> dataTypes,
    required List<CygnusWebsiteDataRecord> dataRecords,
  }) => platform.removeDataFor(dataTypes: dataTypes, dataRecords: dataRecords);

  ///{@macro cygnus_core.CygnusPlatformWebStorageManager.removeDataModifiedSince}
  ///
  ///{@macro cygnus_core.CygnusPlatformWebStorageManager.removeDataModifiedSince.supported_platforms}
  Future<void> removeDataModifiedSince({
    required Set<CygnusWebsiteDataType> dataTypes,
    required DateTime date,
  }) => platform.removeDataModifiedSince(dataTypes: dataTypes, date: date);
}
