// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'website_data_record.dart';

// **************************************************************************
// ExchangeableObjectGenerator
// **************************************************************************

///Class that represents website data, grouped by domain name using the public suffix list.
class CygnusWebsiteDataRecord {
  ///The various types of website data that exist for this data record.
  Set<CygnusWebsiteDataType>? dataTypes;

  ///The display name for the data record. This is usually the domain name.
  String? displayName;
  CygnusWebsiteDataRecord({this.dataTypes, this.displayName});

  ///Gets a possible [CygnusWebsiteDataRecord] instance from a [Map] value.
  static CygnusWebsiteDataRecord? fromMap(
    Map<String, dynamic>? map, {
    CygnusEnumMethod? enumMethod,
  }) {
    if (map == null) {
      return null;
    }
    final instance = CygnusWebsiteDataRecord(
      dataTypes: map['dataTypes'] != null
          ? Set<CygnusWebsiteDataType>.from(
              map['dataTypes'].map(
                (e) => switch (enumMethod ?? CygnusEnumMethod.nativeValue) {
                  CygnusEnumMethod.nativeValue =>
                    CygnusWebsiteDataType.fromNativeValue(e),
                  CygnusEnumMethod.value => CygnusWebsiteDataType.fromValue(e),
                  CygnusEnumMethod.name => CygnusWebsiteDataType.byName(e),
                }!,
              ),
            )
          : null,
      displayName: map['displayName'],
    );
    return instance;
  }

  ///Converts instance to a map.
  Map<String, dynamic> toMap({CygnusEnumMethod? enumMethod}) {
    return {
      "dataTypes": dataTypes
          ?.map(
            (e) => switch (enumMethod ?? CygnusEnumMethod.nativeValue) {
              CygnusEnumMethod.nativeValue => e.toNativeValue(),
              CygnusEnumMethod.value => e.toValue(),
              CygnusEnumMethod.name => e.name(),
            },
          )
          .toList(),
      "displayName": displayName,
    };
  }

  ///Converts instance to a map.
  Map<String, dynamic> toJson() {
    return toMap();
  }

  @override
  String toString() {
    return 'CygnusWebsiteDataRecord{dataTypes: $dataTypes, displayName: $displayName}';
  }
}

///Class that represents website data, grouped by domain name using the public suffix list.
///
///**NOTE**: available on iOS 9.0+.
///
///Use [CygnusWebsiteDataRecord] instead.
@Deprecated('Use CygnusWebsiteDataRecord instead')
class CygnusIOSWKWebsiteDataRecord {
  ///The various types of website data that exist for this data record.
  Set<CygnusIOSWKWebsiteDataType>? dataTypes;

  ///The display name for the data record. This is usually the domain name.
  String? displayName;
  CygnusIOSWKWebsiteDataRecord({this.dataTypes, this.displayName});

  ///Gets a possible [CygnusIOSWKWebsiteDataRecord] instance from a [Map] value.
  static CygnusIOSWKWebsiteDataRecord? fromMap(
    Map<String, dynamic>? map, {
    CygnusEnumMethod? enumMethod,
  }) {
    if (map == null) {
      return null;
    }
    final instance = CygnusIOSWKWebsiteDataRecord(
      dataTypes: map['dataTypes'] != null
          ? Set<CygnusIOSWKWebsiteDataType>.from(
              map['dataTypes'].map(
                (e) => switch (enumMethod ?? CygnusEnumMethod.nativeValue) {
                  CygnusEnumMethod.nativeValue =>
                    CygnusIOSWKWebsiteDataType.fromNativeValue(e),
                  CygnusEnumMethod.value =>
                    CygnusIOSWKWebsiteDataType.fromValue(e),
                  CygnusEnumMethod.name => CygnusIOSWKWebsiteDataType.byName(e),
                }!,
              ),
            )
          : null,
      displayName: map['displayName'],
    );
    return instance;
  }

  ///Converts instance to a map.
  Map<String, dynamic> toMap({CygnusEnumMethod? enumMethod}) {
    return {
      "dataTypes": dataTypes
          ?.map(
            (e) => switch (enumMethod ?? CygnusEnumMethod.nativeValue) {
              CygnusEnumMethod.nativeValue => e.toNativeValue(),
              CygnusEnumMethod.value => e.toValue(),
              CygnusEnumMethod.name => e.name(),
            },
          )
          .toList(),
      "displayName": displayName,
    };
  }

  ///Converts instance to a map.
  Map<String, dynamic> toJson() {
    return toMap();
  }

  @override
  String toString() {
    return 'CygnusIOSWKWebsiteDataRecord{dataTypes: $dataTypes, displayName: $displayName}';
  }
}
