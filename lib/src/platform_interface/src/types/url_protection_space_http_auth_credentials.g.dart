// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'url_protection_space_http_auth_credentials.dart';

// **************************************************************************
// ExchangeableObjectGenerator
// **************************************************************************

///Class that represents a [CygnusURLProtectionSpace] with all of its [CygnusURLCredential]s.
///It used by [CygnusPlatformHttpAuthCredentialDatabase.getAllAuthCredentials].
class CygnusURLProtectionSpaceHttpAuthCredentials {
  ///The list of all its http authentication credentials.
  List<CygnusURLCredential>? credentials;

  ///The protection space.
  CygnusURLProtectionSpace? protectionSpace;
  CygnusURLProtectionSpaceHttpAuthCredentials({
    this.credentials,
    this.protectionSpace,
  });

  ///Gets a possible [CygnusURLProtectionSpaceHttpAuthCredentials] instance from a [Map] value.
  static CygnusURLProtectionSpaceHttpAuthCredentials? fromMap(
    Map<String, dynamic>? map, {
    CygnusEnumMethod? enumMethod,
  }) {
    if (map == null) {
      return null;
    }
    final instance = CygnusURLProtectionSpaceHttpAuthCredentials(
      credentials: map['credentials'] != null
          ? List<CygnusURLCredential>.from(
              map['credentials'].map(
                (e) => CygnusURLCredential.fromMap(
                  e?.cast<String, dynamic>(),
                  enumMethod: enumMethod,
                )!,
              ),
            )
          : null,
      protectionSpace: CygnusURLProtectionSpace.fromMap(
        map['protectionSpace']?.cast<String, dynamic>(),
        enumMethod: enumMethod,
      ),
    );
    return instance;
  }

  ///Converts instance to a map.
  Map<String, dynamic> toMap({CygnusEnumMethod? enumMethod}) {
    return {
      "credentials": credentials
          ?.map((e) => e.toMap(enumMethod: enumMethod))
          .toList(),
      "protectionSpace": protectionSpace?.toMap(enumMethod: enumMethod),
    };
  }

  ///Converts instance to a map.
  Map<String, dynamic> toJson() {
    return toMap();
  }

  @override
  String toString() {
    return 'CygnusURLProtectionSpaceHttpAuthCredentials{credentials: $credentials, protectionSpace: $protectionSpace}';
  }
}
