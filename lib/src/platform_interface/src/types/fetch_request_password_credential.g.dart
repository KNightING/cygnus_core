// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fetch_request_password_credential.dart';

// **************************************************************************
// ExchangeableObjectGenerator
// **************************************************************************

///Class that represents a [PasswordCredential](https://developer.mozilla.org/en-US/docs/Web/API/PasswordCredential) type of credentials.
class CygnusFetchRequestPasswordCredential
    extends CygnusFetchRequestCredential {
  ///URL pointing to an image for an icon. This image is intended for display in a credential chooser. The URL must be accessible without authentication.
  CygnusWebUri? iconURL;

  ///Credential's identifier.
  dynamic id;

  ///The name associated with a credential. It should be a human-readable, public name.
  String? name;

  ///The password of the credential.
  String? password;
  CygnusFetchRequestPasswordCredential({
    this.iconURL,
    this.id,
    this.name,
    this.password,
    String? type,
  }) : super(type: type);

  ///Gets a possible [CygnusFetchRequestPasswordCredential] instance from a [Map] value.
  static CygnusFetchRequestPasswordCredential? fromMap(
    Map<String, dynamic>? map, {
    CygnusEnumMethod? enumMethod,
  }) {
    if (map == null) {
      return null;
    }
    final instance = CygnusFetchRequestPasswordCredential(
      iconURL: map['iconURL'] != null ? CygnusWebUri(map['iconURL']) : null,
      id: map['id'],
      name: map['name'],
      password: map['password'],
    );
    instance.type = map['type'];
    return instance;
  }

  ///Converts instance to a map.
  Map<String, dynamic> toMap({CygnusEnumMethod? enumMethod}) {
    return {
      "type": type,
      "iconURL": iconURL?.toString(),
      "id": id,
      "name": name,
      "password": password,
    };
  }

  ///Converts instance to a map.
  Map<String, dynamic> toJson() {
    return toMap();
  }

  @override
  String toString() {
    return 'CygnusFetchRequestPasswordCredential{type: $type, iconURL: $iconURL, id: $id, name: $name, password: $password}';
  }
}
