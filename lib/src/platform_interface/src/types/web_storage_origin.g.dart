// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'web_storage_origin.dart';

// **************************************************************************
// ExchangeableObjectGenerator
// **************************************************************************

///Class that encapsulates information about the amount of storage currently used by an origin for the JavaScript storage APIs.
///An origin comprises the host, scheme and port of a URI. See [CygnusPlatformWebStorageManager] for details.
class CygnusWebStorageOrigin {
  ///The string representation of this origin.
  String? origin;

  ///The quota for this origin, for the Web SQL Database API, in bytes.
  int? quota;

  ///The total amount of storage currently being used by this origin, for all JavaScript storage APIs, in bytes.
  int? usage;
  CygnusWebStorageOrigin({this.origin, this.quota, this.usage});

  ///Gets a possible [CygnusWebStorageOrigin] instance from a [Map] value.
  static CygnusWebStorageOrigin? fromMap(
    Map<String, dynamic>? map, {
    CygnusEnumMethod? enumMethod,
  }) {
    if (map == null) {
      return null;
    }
    final instance = CygnusWebStorageOrigin(
      origin: map['origin'],
      quota: map['quota'],
      usage: map['usage'],
    );
    return instance;
  }

  ///Converts instance to a map.
  Map<String, dynamic> toMap({CygnusEnumMethod? enumMethod}) {
    return {"origin": origin, "quota": quota, "usage": usage};
  }

  ///Converts instance to a map.
  Map<String, dynamic> toJson() {
    return toMap();
  }

  @override
  String toString() {
    return 'CygnusWebStorageOrigin{origin: $origin, quota: $quota, usage: $usage}';
  }
}

///Class that encapsulates information about the amount of storage currently used by an origin for the JavaScript storage APIs.
///An origin comprises the host, scheme and port of a URI. See `CygnusAndroidWebStorageManager` for details.
///Use [CygnusWebStorageOrigin] instead.
@Deprecated('Use CygnusWebStorageOrigin instead')
class CygnusAndroidWebStorageOrigin {
  ///The string representation of this origin.
  String? origin;

  ///The quota for this origin, for the Web SQL Database API, in bytes.
  int? quota;

  ///The total amount of storage currently being used by this origin, for all JavaScript storage APIs, in bytes.
  int? usage;
  CygnusAndroidWebStorageOrigin({this.origin, this.quota, this.usage});

  ///Gets a possible [CygnusAndroidWebStorageOrigin] instance from a [Map] value.
  static CygnusAndroidWebStorageOrigin? fromMap(
    Map<String, dynamic>? map, {
    CygnusEnumMethod? enumMethod,
  }) {
    if (map == null) {
      return null;
    }
    final instance = CygnusAndroidWebStorageOrigin(
      origin: map['origin'],
      quota: map['quota'],
      usage: map['usage'],
    );
    return instance;
  }

  ///Converts instance to a map.
  Map<String, dynamic> toMap({CygnusEnumMethod? enumMethod}) {
    return {"origin": origin, "quota": quota, "usage": usage};
  }

  ///Converts instance to a map.
  Map<String, dynamic> toJson() {
    return toMap();
  }

  @override
  String toString() {
    return 'CygnusAndroidWebStorageOrigin{origin: $origin, quota: $quota, usage: $usage}';
  }
}
