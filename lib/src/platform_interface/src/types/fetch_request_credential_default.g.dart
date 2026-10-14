// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fetch_request_credential_default.dart';

// **************************************************************************
// ExchangeableObjectGenerator
// **************************************************************************

///Class that represents the default credentials used by an [CygnusFetchRequest].
class CygnusFetchRequestCredentialDefault extends CygnusFetchRequestCredential {
  ///The value of the credentials.
  String? value;
  CygnusFetchRequestCredentialDefault({this.value, String? type})
    : super(type: type);

  ///Gets a possible [CygnusFetchRequestCredentialDefault] instance from a [Map] value.
  static CygnusFetchRequestCredentialDefault? fromMap(
    Map<String, dynamic>? map, {
    CygnusEnumMethod? enumMethod,
  }) {
    if (map == null) {
      return null;
    }
    final instance = CygnusFetchRequestCredentialDefault(value: map['value']);
    instance.type = map['type'];
    return instance;
  }

  ///Converts instance to a map.
  Map<String, dynamic> toMap({CygnusEnumMethod? enumMethod}) {
    return {"type": type, "value": value};
  }

  ///Converts instance to a map.
  Map<String, dynamic> toJson() {
    return toMap();
  }

  @override
  String toString() {
    return 'CygnusFetchRequestCredentialDefault{type: $type, value: $value}';
  }
}
