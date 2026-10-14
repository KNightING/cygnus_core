import 'dart:async';

import 'package:cygnus_core/src/platform_interface/flutter_webview_platform_interface.dart';

import '../web_storage_manager.dart';

///Class that represents various types of data that a website might make use of.
///This includes cookies, disk and memory caches, and persistent data such as WebSQL, IndexedDB databases, and local storage.
///
///**NOTE**: available on iOS 9.0+.
///
///Use [CygnusWebStorageManager] instead.
@Deprecated("Use CygnusWebStorageManager instead")
class CygnusIOSWebStorageManager {
  ///Fetches data records containing the given website data types.
  ///
  ///[dataTypes] represents the website data types to fetch records for.
  Future<List<CygnusIOSWKWebsiteDataRecord>> fetchDataRecords({
    required Set<CygnusIOSWKWebsiteDataType> dataTypes,
  }) async {
    List<CygnusIOSWKWebsiteDataRecord> recordList = [];
    Set<CygnusWebsiteDataType> dataTypesList = Set();
    for (var dataType in dataTypes) {
      dataTypesList.add(
        CygnusWebsiteDataType.fromNativeValue(dataType.toNativeValue())!,
      );
    }

    List<CygnusWebsiteDataRecord> records = await CygnusWebStorageManager.instance()
        .fetchDataRecords(dataTypes: dataTypesList);

    for (var record in records) {
      Set<CygnusWebsiteDataType> dataTypesString = record.dataTypes ?? Set();
      Set<CygnusIOSWKWebsiteDataType> dataTypes = Set();
      for (var dataTypeValue in dataTypesString) {
        var dataType = CygnusIOSWKWebsiteDataType.fromNativeValue(
          dataTypeValue.toNativeValue(),
        );
        if (dataType != null) {
          dataTypes.add(dataType);
        }
      }
      recordList.add(
        CygnusIOSWKWebsiteDataRecord(
          displayName: record.displayName,
          dataTypes: dataTypes,
        ),
      );
    }
    return recordList;
  }

  ///Removes website data of the given types for the given data records.
  ///
  ///[dataTypes] represents the website data types that should be removed.
  ///
  ///[dataRecords] represents the website data records to delete website data for.
  Future<void> removeDataFor({
    required Set<CygnusIOSWKWebsiteDataType> dataTypes,
    required List<CygnusIOSWKWebsiteDataRecord> dataRecords,
  }) async {
    Set<CygnusWebsiteDataType> dataTypesList = Set();
    for (var dataType in dataTypes) {
      dataTypesList.add(
        CygnusWebsiteDataType.fromNativeValue(dataType.toNativeValue())!,
      );
    }

    List<CygnusWebsiteDataRecord> recordList = [];
    for (var record in dataRecords) {
      recordList.add(CygnusWebsiteDataRecord.fromMap(record.toMap())!);
    }

    await CygnusWebStorageManager.instance().removeDataFor(
      dataRecords: recordList,
      dataTypes: dataTypesList,
    );
  }

  ///Removes all website data of the given types that has been modified since the given date.
  ///
  ///[dataTypes] represents the website data types that should be removed.
  ///
  ///[date] represents a date. All website data modified after this date will be removed.
  Future<void> removeDataModifiedSince({
    required Set<CygnusIOSWKWebsiteDataType> dataTypes,
    required DateTime date,
  }) async {
    Set<CygnusWebsiteDataType> dataTypesList = Set();
    for (var dataType in dataTypes) {
      dataTypesList.add(
        CygnusWebsiteDataType.fromNativeValue(dataType.toNativeValue())!,
      );
    }

    await CygnusWebStorageManager.instance().removeDataModifiedSince(
      dataTypes: dataTypesList,
      date: date,
    );
  }
}
