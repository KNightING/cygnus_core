import 'package:flutter/services.dart';
import 'package:cygnus_core/src/platform_interface/flutter_inappwebview_platform_interface.dart';

/// Object specifying creation parameters for creating a [LinuxWebStorageManager].
///
/// When adding additional fields make sure they can be null or have a default
/// value to avoid breaking changes. See [CygnusPlatformWebStorageManagerCreationParams] for
/// more information.
class LinuxWebStorageManagerCreationParams
    extends CygnusPlatformWebStorageManagerCreationParams {
  /// Creates a new [LinuxWebStorageManagerCreationParams] instance.
  const LinuxWebStorageManagerCreationParams();

  /// Creates a [LinuxWebStorageManagerCreationParams] instance based on [CygnusPlatformWebStorageManagerCreationParams].
  factory LinuxWebStorageManagerCreationParams.fromPlatformWebStorageManagerCreationParams(
    CygnusPlatformWebStorageManagerCreationParams params,
  ) {
    return const LinuxWebStorageManagerCreationParams();
  }
}

/// Implementation of [CygnusPlatformWebStorageManager] for Linux using WPE WebKit.
///
/// Uses [WebKitWebsiteDataManager](https://wpewebkit.org/reference/stable/wpe-webkit-2.0/class.WebsiteDataManager.html)
/// to manage website data.
class LinuxWebStorageManager extends CygnusPlatformWebStorageManager {
  static const MethodChannel _channel = MethodChannel(
    'com.pichillilorenzo/flutter_inappwebview_webstoragemanager',
  );

  /// Constructs a [LinuxWebStorageManager].
  LinuxWebStorageManager(CygnusPlatformWebStorageManagerCreationParams params)
    : super.implementation(
        params is LinuxWebStorageManagerCreationParams
            ? params
            : LinuxWebStorageManagerCreationParams.fromPlatformWebStorageManagerCreationParams(
                params,
              ),
      );

  static final LinuxWebStorageManager _instance = LinuxWebStorageManager(
    const LinuxWebStorageManagerCreationParams(),
  );

  /// The [LinuxWebStorageManager] singleton instance.
  static LinuxWebStorageManager instance() => _instance;

  /// Creates and returns a new [LinuxWebStorageManager] for static methods.
  factory LinuxWebStorageManager.static() => _instance;

  /// Maps CygnusWebsiteDataType to WPE WebKit data type strings.
  static String _toWpeDataType(CygnusWebsiteDataType type) {
    if (type == CygnusWebsiteDataType.WKWebsiteDataTypeDiskCache) {
      return 'WEBKIT_WEBSITE_DATA_DISK_CACHE';
    } else if (type == CygnusWebsiteDataType.WKWebsiteDataTypeMemoryCache) {
      return 'WEBKIT_WEBSITE_DATA_MEMORY_CACHE';
    } else if (type ==
        CygnusWebsiteDataType.WKWebsiteDataTypeOfflineWebApplicationCache) {
      return 'WEBKIT_WEBSITE_DATA_OFFLINE_APPLICATION_CACHE';
    } else if (type == CygnusWebsiteDataType.WKWebsiteDataTypeCookies) {
      return 'WEBKIT_WEBSITE_DATA_COOKIES';
    } else if (type == CygnusWebsiteDataType.WKWebsiteDataTypeSessionStorage) {
      return 'WEBKIT_WEBSITE_DATA_SESSION_STORAGE';
    } else if (type == CygnusWebsiteDataType.WKWebsiteDataTypeLocalStorage) {
      return 'WEBKIT_WEBSITE_DATA_LOCAL_STORAGE';
    } else if (type == CygnusWebsiteDataType.WKWebsiteDataTypeIndexedDBDatabases) {
      return 'WEBKIT_WEBSITE_DATA_INDEXEDDB_DATABASES';
    } else if (type ==
        CygnusWebsiteDataType.WKWebsiteDataTypeServiceWorkerRegistrations) {
      return 'WEBKIT_WEBSITE_DATA_SERVICE_WORKER_REGISTRATIONS';
    } else if (type == CygnusWebsiteDataType.WKWebsiteDataTypeFetchCache) {
      // WPE uses same as disk cache for fetch cache
      return 'WEBKIT_WEBSITE_DATA_DISK_CACHE';
    } else if (type == CygnusWebsiteDataType.WKWebsiteDataTypeWebSQLDatabases) {
      // WebSQL is deprecated, map to local storage
      return 'WEBKIT_WEBSITE_DATA_LOCAL_STORAGE';
    }
    // Default fallback
    return 'WEBKIT_WEBSITE_DATA_LOCAL_STORAGE';
  }

  /// Maps WPE WebKit data type string to CygnusWebsiteDataType.
  static CygnusWebsiteDataType? _fromWpeDataType(String wpeType) {
    if (wpeType == 'WEBKIT_WEBSITE_DATA_DISK_CACHE') {
      return CygnusWebsiteDataType.WKWebsiteDataTypeDiskCache;
    } else if (wpeType == 'WEBKIT_WEBSITE_DATA_MEMORY_CACHE') {
      return CygnusWebsiteDataType.WKWebsiteDataTypeMemoryCache;
    } else if (wpeType == 'WEBKIT_WEBSITE_DATA_OFFLINE_APPLICATION_CACHE') {
      return CygnusWebsiteDataType.WKWebsiteDataTypeOfflineWebApplicationCache;
    } else if (wpeType == 'WEBKIT_WEBSITE_DATA_COOKIES') {
      return CygnusWebsiteDataType.WKWebsiteDataTypeCookies;
    } else if (wpeType == 'WEBKIT_WEBSITE_DATA_SESSION_STORAGE') {
      return CygnusWebsiteDataType.WKWebsiteDataTypeSessionStorage;
    } else if (wpeType == 'WEBKIT_WEBSITE_DATA_LOCAL_STORAGE') {
      return CygnusWebsiteDataType.WKWebsiteDataTypeLocalStorage;
    } else if (wpeType == 'WEBKIT_WEBSITE_DATA_INDEXEDDB_DATABASES') {
      return CygnusWebsiteDataType.WKWebsiteDataTypeIndexedDBDatabases;
    } else if (wpeType == 'WEBKIT_WEBSITE_DATA_SERVICE_WORKER_REGISTRATIONS') {
      return CygnusWebsiteDataType.WKWebsiteDataTypeServiceWorkerRegistrations;
    }
    return null;
  }

  @override
  Future<List<CygnusWebsiteDataRecord>> fetchDataRecords({
    required Set<CygnusWebsiteDataType> dataTypes,
  }) async {
    final List<String> wpeDataTypes = dataTypes
        .map((type) => _toWpeDataType(type))
        .toList();

    final result = await _channel.invokeMethod<List<dynamic>>(
      'fetchDataRecords',
      {'dataTypes': wpeDataTypes},
    );

    if (result == null) {
      return [];
    }

    return result.cast<Map<dynamic, dynamic>>().map((recordMap) {
      final String? displayName = recordMap['displayName'] as String?;
      final List<dynamic>? dataTypesRaw =
          recordMap['dataTypes'] as List<dynamic>?;

      Set<CygnusWebsiteDataType>? dataTypesSet;
      if (dataTypesRaw != null) {
        dataTypesSet = dataTypesRaw
            .cast<String>()
            .map((typeStr) => _fromWpeDataType(typeStr))
            .whereType<CygnusWebsiteDataType>()
            .toSet();
      }

      return CygnusWebsiteDataRecord(
        displayName: displayName,
        dataTypes: dataTypesSet,
      );
    }).toList();
  }

  @override
  Future<void> removeDataFor({
    required Set<CygnusWebsiteDataType> dataTypes,
    required List<CygnusWebsiteDataRecord> dataRecords,
  }) async {
    final List<String> wpeDataTypes = dataTypes
        .map((type) => _toWpeDataType(type))
        .toList();

    final List<Map<String, dynamic>> recordList = dataRecords.map((record) {
      return {
        'displayName': record.displayName,
        'dataTypes': record.dataTypes
            ?.map((type) => _toWpeDataType(type))
            .toList(),
      };
    }).toList();

    await _channel.invokeMethod('removeDataFor', {
      'dataTypes': wpeDataTypes,
      'recordList': recordList,
    });
  }

  @override
  Future<void> removeDataModifiedSince({
    required Set<CygnusWebsiteDataType> dataTypes,
    required DateTime date,
  }) async {
    final List<String> wpeDataTypes = dataTypes
        .map((type) => _toWpeDataType(type))
        .toList();

    // Convert DateTime to Unix timestamp (seconds since epoch)
    final int timestamp = date.millisecondsSinceEpoch ~/ 1000;

    await _channel.invokeMethod('removeDataModifiedSince', {
      'dataTypes': wpeDataTypes,
      'timestamp': timestamp,
    });
  }
}
