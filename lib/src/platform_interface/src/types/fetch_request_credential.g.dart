// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fetch_request_credential.dart';

// **************************************************************************
// ExchangeableObjectGenerator
// **************************************************************************

///Class that is an interface for [CygnusFetchRequestCredentialDefault], [CygnusFetchRequestFederatedCredential] and [CygnusFetchRequestPasswordCredential] classes.
class CygnusFetchRequestCredential {
  ///Type of credentials.
  String? type;
  CygnusFetchRequestCredential({this.type});

  ///Gets a possible [CygnusFetchRequestCredential] instance from a [Map] value.
  static CygnusFetchRequestCredential? fromMap(
    Map<String, dynamic>? map, {
    CygnusEnumMethod? enumMethod,
  }) {
    if (map == null) {
      return null;
    }
    final instance = CygnusFetchRequestCredential(type: map['type']);
    return instance;
  }

  ///Converts instance to a map.
  Map<String, dynamic> toMap({CygnusEnumMethod? enumMethod}) {
    return {"type": type};
  }

  ///Converts instance to a map.
  Map<String, dynamic> toJson() {
    return toMap();
  }

  @override
  String toString() {
    return 'CygnusFetchRequestCredential{type: $type}';
  }
}
