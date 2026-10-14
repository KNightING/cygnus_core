// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'url_authentication_challenge.dart';

// **************************************************************************
// ExchangeableObjectGenerator
// **************************************************************************

///Class that represents a challenge from a server requiring authentication from the client.
///It provides all the information about the challenge.
class CygnusURLAuthenticationChallenge {
  ///The protection space requiring authentication.
  CygnusURLProtectionSpace protectionSpace;
  CygnusURLAuthenticationChallenge({required this.protectionSpace});

  ///Gets a possible [CygnusURLAuthenticationChallenge] instance from a [Map] value.
  static CygnusURLAuthenticationChallenge? fromMap(
    Map<String, dynamic>? map, {
    CygnusEnumMethod? enumMethod,
  }) {
    if (map == null) {
      return null;
    }
    final instance = CygnusURLAuthenticationChallenge(
      protectionSpace: CygnusURLProtectionSpace.fromMap(
        map['protectionSpace']?.cast<String, dynamic>(),
        enumMethod: enumMethod,
      )!,
    );
    return instance;
  }

  ///Converts instance to a map.
  Map<String, dynamic> toMap({CygnusEnumMethod? enumMethod}) {
    return {"protectionSpace": protectionSpace.toMap(enumMethod: enumMethod)};
  }

  ///Converts instance to a map.
  Map<String, dynamic> toJson() {
    return toMap();
  }

  @override
  String toString() {
    return 'CygnusURLAuthenticationChallenge{protectionSpace: $protectionSpace}';
  }
}
