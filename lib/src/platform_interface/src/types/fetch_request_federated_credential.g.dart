// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fetch_request_federated_credential.dart';

// **************************************************************************
// ExchangeableObjectGenerator
// **************************************************************************

///Class that represents a [FederatedCredential](https://developer.mozilla.org/en-US/docs/Web/API/FederatedCredential) type of credentials.
class CygnusFetchRequestFederatedCredential
    extends CygnusFetchRequestCredential {
  ///URL pointing to an image for an icon. This image is intended for display in a credential chooser. The URL must be accessible without authentication.
  CygnusWebUri? iconURL;

  ///Credential's identifier.
  dynamic id;

  ///The name associated with a credential. It should be a human-readable, public name.
  String? name;

  ///Credential's federated identity protocol.
  String? protocol;

  ///Credential's federated identity provider.
  String? provider;
  CygnusFetchRequestFederatedCredential({
    this.iconURL,
    this.id,
    this.name,
    this.protocol,
    this.provider,
    String? type,
  }) : super(type: type);

  ///Gets a possible [CygnusFetchRequestFederatedCredential] instance from a [Map] value.
  static CygnusFetchRequestFederatedCredential? fromMap(
    Map<String, dynamic>? map, {
    CygnusEnumMethod? enumMethod,
  }) {
    if (map == null) {
      return null;
    }
    final instance = CygnusFetchRequestFederatedCredential(
      iconURL: map['iconURL'] != null ? CygnusWebUri(map['iconURL']) : null,
      id: map['id'],
      name: map['name'],
      protocol: map['protocol'],
      provider: map['provider'],
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
      "protocol": protocol,
      "provider": provider,
    };
  }

  ///Converts instance to a map.
  Map<String, dynamic> toJson() {
    return toMap();
  }

  @override
  String toString() {
    return 'CygnusFetchRequestFederatedCredential{type: $type, iconURL: $iconURL, id: $id, name: $name, protocol: $protocol, provider: $provider}';
  }
}
