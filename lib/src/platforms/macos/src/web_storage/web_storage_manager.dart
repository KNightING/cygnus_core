import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:cygnus_core/src/platform_interface/flutter_inappwebview_platform_interface.dart';

/// Object specifying creation parameters for creating a [MacOSWebStorageManager].
///
/// When adding additional fields make sure they can be null or have a default
/// value to avoid breaking changes. See [CygnusPlatformWebStorageManagerCreationParams] for
/// more information.
@immutable
class MacOSWebStorageManagerCreationParams
    extends CygnusPlatformWebStorageManagerCreationParams {
  /// Creates a new [MacOSWebStorageManagerCreationParams] instance.
  const MacOSWebStorageManagerCreationParams(
    // This parameter prevents breaking changes later.
    // ignore: avoid_unused_constructor_parameters
    CygnusPlatformWebStorageManagerCreationParams params,
  ) : super();

  /// Creates a [MacOSWebStorageManagerCreationParams] instance based on [CygnusPlatformWebStorageManagerCreationParams].
  factory MacOSWebStorageManagerCreationParams.fromPlatformWebStorageManagerCreationParams(
    CygnusPlatformWebStorageManagerCreationParams params,
  ) {
    return MacOSWebStorageManagerCreationParams(params);
  }
}

///{@macro cygnus_core.CygnusPlatformWebStorageManager}
class MacOSWebStorageManager extends CygnusPlatformWebStorageManager
    with ChannelController {
  /// Creates a new [MacOSWebStorageManager].
  MacOSWebStorageManager(CygnusPlatformWebStorageManagerCreationParams params)
    : super.implementation(
        params is MacOSWebStorageManagerCreationParams
            ? params
            : MacOSWebStorageManagerCreationParams.fromPlatformWebStorageManagerCreationParams(
                params,
              ),
      ) {
    channel = const MethodChannel(
      'com.pichillilorenzo/flutter_inappwebview_webstoragemanager',
    );
    handler = _handleMethod;
    initMethodCallHandler();
  }

  static MacOSWebStorageManager? _instance;

  ///Gets the CygnusWebStorage manager shared instance.
  static MacOSWebStorageManager instance() {
    return (_instance != null) ? _instance! : _init();
  }

  static MacOSWebStorageManager _init() {
    _instance = MacOSWebStorageManager(
      MacOSWebStorageManagerCreationParams(
        const CygnusPlatformWebStorageManagerCreationParams(),
      ),
    );
    return _instance!;
  }

  static MacOSWebStorageManager? _static;

  /// Provide static access.
  factory MacOSWebStorageManager.static() {
    _static ??= MacOSWebStorageManager(
      MacOSWebStorageManagerCreationParams(
        const CygnusPlatformWebStorageManagerCreationParams(),
      ),
    );
    return _static!;
  }

  Future<dynamic> _handleMethod(MethodCall call) async {}

  @override
  Future<List<CygnusWebsiteDataRecord>> fetchDataRecords({
    required Set<CygnusWebsiteDataType> dataTypes,
  }) async {
    List<CygnusWebsiteDataRecord> recordList = [];
    List<String> dataTypesList = [];
    for (var dataType in dataTypes) {
      if (dataType.isSupported()) {
        dataTypesList.add(dataType.toNativeValue()!);
      }
    }
    Map<String, dynamic> args = <String, dynamic>{};
    args.putIfAbsent("dataTypes", () => dataTypesList);
    List<Map<dynamic, dynamic>> records =
        (await channel?.invokeMethod<List>(
          'fetchDataRecords',
          args,
        ))?.cast<Map<dynamic, dynamic>>() ??
        [];
    for (var record in records) {
      List<String> dataTypesString = record["dataTypes"].cast<String>();
      Set<CygnusWebsiteDataType> dataTypes = Set();
      for (var dataTypeValue in dataTypesString) {
        var dataType = CygnusWebsiteDataType.fromNativeValue(dataTypeValue);
        if (dataType != null) {
          dataTypes.add(dataType);
        }
      }
      recordList.add(
        CygnusWebsiteDataRecord(
          displayName: record["displayName"],
          dataTypes: dataTypes,
        ),
      );
    }
    return recordList;
  }

  @override
  Future<void> removeDataFor({
    required Set<CygnusWebsiteDataType> dataTypes,
    required List<CygnusWebsiteDataRecord> dataRecords,
  }) async {
    List<String> dataTypesList = [];
    for (var dataType in dataTypes) {
      if (dataType.isSupported()) {
        dataTypesList.add(dataType.toNativeValue()!);
      }
    }

    List<Map<String, dynamic>> recordList = [];
    for (var record in dataRecords) {
      recordList.add(record.toMap());
    }

    Map<String, dynamic> args = <String, dynamic>{};
    args.putIfAbsent("dataTypes", () => dataTypesList);
    args.putIfAbsent("recordList", () => recordList);
    await channel?.invokeMethod('removeDataFor', args);
  }

  @override
  Future<void> removeDataModifiedSince({
    required Set<CygnusWebsiteDataType> dataTypes,
    required DateTime date,
  }) async {
    List<String> dataTypesList = [];
    for (var dataType in dataTypes) {
      if (dataType.isSupported()) {
        dataTypesList.add(dataType.toNativeValue()!);
      }
    }

    var timestamp = date.millisecondsSinceEpoch;

    Map<String, dynamic> args = <String, dynamic>{};
    args.putIfAbsent("dataTypes", () => dataTypesList);
    args.putIfAbsent("timestamp", () => timestamp);
    await channel?.invokeMethod('removeDataModifiedSince', args);
  }

  @override
  void dispose() {
    // empty
  }
}
