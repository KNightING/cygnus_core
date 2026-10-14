// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'url_credential.dart';

// **************************************************************************
// ExchangeableObjectGenerator
// **************************************************************************

///Class that represents an authentication credential consisting of information
///specific to the type of credential and the type of persistent storage to use, if any.
class CygnusURLCredential {
  ///The intermediate certificates of the credential, if it is a client certificate credential.
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- iOS WKWebView
  ///- macOS WKWebView
  List<CygnusX509Certificate>? certificates;

  ///Use [certificates] instead.
  @Deprecated('Use certificates instead')
  List<CygnusX509Certificate>? iosCertificates;

  ///Use [persistence] instead.
  @Deprecated('Use persistence instead')
  CygnusIOSURLCredentialPersistence? iosPersistence;

  ///The credential’s password.
  String? password;

  ///The credential’s persistence setting.
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- iOS WKWebView
  ///- macOS WKWebView
  CygnusURLCredentialPersistence? persistence;

  ///The credential’s user name.
  String? username;
  CygnusURLCredential({
    this.certificates,
    @Deprecated('Use certificates instead') this.iosCertificates,
    @Deprecated('Use persistence instead') this.iosPersistence,
    this.password,
    this.persistence,
    this.username,
  }) {
    certificates = certificates ?? iosCertificates;
    persistence =
        persistence ??
        CygnusURLCredentialPersistence.fromNativeValue(
          iosPersistence?.toNativeValue(),
        );
  }

  ///Gets a possible [CygnusURLCredential] instance from a [Map] value.
  static CygnusURLCredential? fromMap(
    Map<String, dynamic>? map, {
    CygnusEnumMethod? enumMethod,
  }) {
    if (map == null) {
      return null;
    }
    final instance = CygnusURLCredential(
      certificates: _certificatesDeserializer(
        map['certificates'],
        enumMethod: enumMethod,
      ),
      iosCertificates: _certificatesDeserializer(
        map['certificates'],
        enumMethod: enumMethod,
      ),
      iosPersistence: switch (enumMethod ?? CygnusEnumMethod.nativeValue) {
        CygnusEnumMethod.nativeValue =>
          CygnusIOSURLCredentialPersistence.fromNativeValue(map['persistence']),
        CygnusEnumMethod.value => CygnusIOSURLCredentialPersistence.fromValue(
          map['persistence'],
        ),
        CygnusEnumMethod.name => CygnusIOSURLCredentialPersistence.byName(
          map['persistence'],
        ),
      },
      password: map['password'],
      persistence: switch (enumMethod ?? CygnusEnumMethod.nativeValue) {
        CygnusEnumMethod.nativeValue =>
          CygnusURLCredentialPersistence.fromNativeValue(map['persistence']),
        CygnusEnumMethod.value => CygnusURLCredentialPersistence.fromValue(
          map['persistence'],
        ),
        CygnusEnumMethod.name => CygnusURLCredentialPersistence.byName(
          map['persistence'],
        ),
      },
      username: map['username'],
    );
    return instance;
  }

  ///Converts instance to a map.
  Map<String, dynamic> toMap({CygnusEnumMethod? enumMethod}) {
    return {
      "certificates": certificates
          ?.map((e) => e.toMap(enumMethod: enumMethod))
          .toList(),
      "password": password,
      "persistence": switch (enumMethod ?? CygnusEnumMethod.nativeValue) {
        CygnusEnumMethod.nativeValue => persistence?.toNativeValue(),
        CygnusEnumMethod.value => persistence?.toValue(),
        CygnusEnumMethod.name => persistence?.name(),
      },
      "username": username,
    };
  }

  ///Converts instance to a map.
  Map<String, dynamic> toJson() {
    return toMap();
  }

  @override
  String toString() {
    return 'CygnusURLCredential{certificates: $certificates, password: $password, persistence: $persistence, username: $username}';
  }
}
