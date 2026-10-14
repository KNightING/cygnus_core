// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'url_protection_space.dart';

// **************************************************************************
// ExchangeableObjectGenerator
// **************************************************************************

///Class that represents a protection space requiring authentication.
class CygnusURLProtectionSpace {
  ///The authentication method used by the receiver.
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- iOS WKWebView ([Official API - CygnusURLProtectionSpace.authenticationMethod](https://developer.apple.com/documentation/foundation/urlprotectionspace/1415028-authenticationmethod))
  ///- macOS WKWebView ([Official API - CygnusURLProtectionSpace.authenticationMethod](https://developer.apple.com/documentation/foundation/urlprotectionspace/1415028-authenticationmethod))
  CygnusURLProtectionSpaceAuthenticationMethod? authenticationMethod;

  ///The acceptable certificate-issuing authorities for client certificate authentication.
  ///This value is `null` if the authentication method of the protection space is not client certificate.
  ///The returned issuing authorities are encoded with Distinguished Encoding Rules (DER).
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- iOS WKWebView ([Official API - CygnusURLProtectionSpace.distinguishedNames](https://developer.apple.com/documentation/foundation/urlprotectionspace/1417061-distinguishednames))
  ///- macOS WKWebView ([Official API - CygnusURLProtectionSpace.distinguishedNames](https://developer.apple.com/documentation/foundation/urlprotectionspace/1417061-distinguishednames))
  List<CygnusX509Certificate>? distinguishedNames;

  ///The hostname of the server.
  String host;

  ///Use [authenticationMethod] instead.
  @Deprecated('Use authenticationMethod instead')
  CygnusIOSNSURLProtectionSpaceAuthenticationMethod? iosAuthenticationMethod;

  ///Use [distinguishedNames] instead.
  @Deprecated('Use distinguishedNames instead')
  List<CygnusX509Certificate>? iosDistinguishedNames;

  ///Use [proxyType] instead.
  @Deprecated('Use proxyType instead')
  CygnusIOSNSURLProtectionSpaceProxyType? iosProxyType;

  ///Use [receivesCredentialSecurely] instead.
  @Deprecated('Use receivesCredentialSecurely instead')
  bool? iosReceivesCredentialSecurely;

  ///The port of the server.
  int? port;

  ///The protocol of the server - e.g. "http", "ftp", "https".
  String? protocol;

  ///The receiver's proxy type.
  ///This value is `null` if the receiver does not represent a proxy protection space.
  ///The supported proxy types are listed in [CygnusURLProtectionSpaceProxyType.values].
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- iOS WKWebView ([Official API - CygnusURLProtectionSpace.proxyType](https://developer.apple.com/documentation/foundation/urlprotectionspace/1411924-proxytype))
  ///- macOS WKWebView ([Official API - CygnusURLProtectionSpace.proxyType](https://developer.apple.com/documentation/foundation/urlprotectionspace/1411924-proxytype))
  CygnusURLProtectionSpaceProxyType? proxyType;

  ///A string indicating a protocol-specific subdivision of a single host.
  ///For http and https, this maps to the realm string in http authentication challenges.
  ///For many other protocols it is unused.
  String? realm;

  ///A Boolean value that indicates whether the credentials for the protection space can be sent securely.
  ///This value is `true` if the credentials for the protection space represented by the receiver can be sent securely, `false` otherwise.
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- iOS WKWebView ([Official API - CygnusURLProtectionSpace.receivesCredentialSecurely](https://developer.apple.com/documentation/foundation/urlprotectionspace/1415176-receivescredentialsecurely))
  ///- macOS WKWebView ([Official API - CygnusURLProtectionSpace.receivesCredentialSecurely](https://developer.apple.com/documentation/foundation/urlprotectionspace/1415176-receivescredentialsecurely))
  bool? receivesCredentialSecurely;

  ///The SSL certificate used.
  CygnusSslCertificate? sslCertificate;

  ///The SSL Error associated.
  CygnusSslError? sslError;
  CygnusURLProtectionSpace({
    this.authenticationMethod,
    this.distinguishedNames,
    required this.host,
    @Deprecated('Use authenticationMethod instead')
    this.iosAuthenticationMethod,
    @Deprecated('Use distinguishedNames instead') this.iosDistinguishedNames,
    @Deprecated('Use proxyType instead') this.iosProxyType,
    @Deprecated('Use receivesCredentialSecurely instead')
    this.iosReceivesCredentialSecurely,
    this.port,
    this.protocol,
    this.proxyType,
    this.realm,
    this.receivesCredentialSecurely,
    this.sslCertificate,
    this.sslError,
  }) {
    authenticationMethod =
        authenticationMethod ??
        CygnusURLProtectionSpaceAuthenticationMethod.fromNativeValue(
          iosAuthenticationMethod?.toNativeValue(),
        );
    distinguishedNames = distinguishedNames ?? iosDistinguishedNames;
    proxyType =
        proxyType ??
        CygnusURLProtectionSpaceProxyType.fromNativeValue(
          iosProxyType?.toNativeValue(),
        );
    receivesCredentialSecurely =
        receivesCredentialSecurely ?? iosReceivesCredentialSecurely;
  }

  ///Gets a possible [CygnusURLProtectionSpace] instance from a [Map] value.
  static CygnusURLProtectionSpace? fromMap(
    Map<String, dynamic>? map, {
    CygnusEnumMethod? enumMethod,
  }) {
    if (map == null) {
      return null;
    }
    final instance = CygnusURLProtectionSpace(
      authenticationMethod: switch (enumMethod ??
          CygnusEnumMethod.nativeValue) {
        CygnusEnumMethod.nativeValue =>
          CygnusURLProtectionSpaceAuthenticationMethod.fromNativeValue(
            map['authenticationMethod'],
          ),
        CygnusEnumMethod.value =>
          CygnusURLProtectionSpaceAuthenticationMethod.fromValue(
            map['authenticationMethod'],
          ),
        CygnusEnumMethod.name =>
          CygnusURLProtectionSpaceAuthenticationMethod.byName(
            map['authenticationMethod'],
          ),
      },
      distinguishedNames: _distinguishedNamesDeserializer(
        map['distinguishedNames'],
        enumMethod: enumMethod,
      ),
      host: map['host'],
      iosAuthenticationMethod: switch (enumMethod ??
          CygnusEnumMethod.nativeValue) {
        CygnusEnumMethod.nativeValue =>
          CygnusIOSNSURLProtectionSpaceAuthenticationMethod.fromNativeValue(
            map['authenticationMethod'],
          ),
        CygnusEnumMethod.value =>
          CygnusIOSNSURLProtectionSpaceAuthenticationMethod.fromValue(
            map['authenticationMethod'],
          ),
        CygnusEnumMethod.name =>
          CygnusIOSNSURLProtectionSpaceAuthenticationMethod.byName(
            map['authenticationMethod'],
          ),
      },
      iosDistinguishedNames: _distinguishedNamesDeserializer(
        map['distinguishedNames'],
        enumMethod: enumMethod,
      ),
      iosProxyType: switch (enumMethod ?? CygnusEnumMethod.nativeValue) {
        CygnusEnumMethod.nativeValue =>
          CygnusIOSNSURLProtectionSpaceProxyType.fromNativeValue(
            map['proxyType'],
          ),
        CygnusEnumMethod.value =>
          CygnusIOSNSURLProtectionSpaceProxyType.fromValue(map['proxyType']),
        CygnusEnumMethod.name => CygnusIOSNSURLProtectionSpaceProxyType.byName(
          map['proxyType'],
        ),
      },
      iosReceivesCredentialSecurely: map['receivesCredentialSecurely'],
      port: map['port'],
      protocol: map['protocol'],
      proxyType: switch (enumMethod ?? CygnusEnumMethod.nativeValue) {
        CygnusEnumMethod.nativeValue =>
          CygnusURLProtectionSpaceProxyType.fromNativeValue(map['proxyType']),
        CygnusEnumMethod.value => CygnusURLProtectionSpaceProxyType.fromValue(
          map['proxyType'],
        ),
        CygnusEnumMethod.name => CygnusURLProtectionSpaceProxyType.byName(
          map['proxyType'],
        ),
      },
      realm: map['realm'],
      receivesCredentialSecurely: map['receivesCredentialSecurely'],
      sslCertificate: CygnusSslCertificate.fromMap(
        map['sslCertificate']?.cast<String, dynamic>(),
        enumMethod: enumMethod,
      ),
      sslError: CygnusSslError.fromMap(
        map['sslError']?.cast<String, dynamic>(),
        enumMethod: enumMethod,
      ),
    );
    return instance;
  }

  ///Converts instance to a map.
  Map<String, dynamic> toMap({CygnusEnumMethod? enumMethod}) {
    return {
      "authenticationMethod": switch (enumMethod ??
          CygnusEnumMethod.nativeValue) {
        CygnusEnumMethod.nativeValue => authenticationMethod?.toNativeValue(),
        CygnusEnumMethod.value => authenticationMethod?.toValue(),
        CygnusEnumMethod.name => authenticationMethod?.name(),
      },
      "distinguishedNames": distinguishedNames
          ?.map((e) => e.toMap(enumMethod: enumMethod))
          .toList(),
      "host": host,
      "port": port,
      "protocol": protocol,
      "proxyType": switch (enumMethod ?? CygnusEnumMethod.nativeValue) {
        CygnusEnumMethod.nativeValue => proxyType?.toNativeValue(),
        CygnusEnumMethod.value => proxyType?.toValue(),
        CygnusEnumMethod.name => proxyType?.name(),
      },
      "realm": realm,
      "receivesCredentialSecurely": receivesCredentialSecurely,
      "sslCertificate": sslCertificate?.toMap(enumMethod: enumMethod),
      "sslError": sslError?.toMap(enumMethod: enumMethod),
    };
  }

  ///Converts instance to a map.
  Map<String, dynamic> toJson() {
    return toMap();
  }

  @override
  String toString() {
    return 'CygnusURLProtectionSpace{authenticationMethod: $authenticationMethod, distinguishedNames: $distinguishedNames, host: $host, port: $port, protocol: $protocol, proxyType: $proxyType, realm: $realm, receivesCredentialSecurely: $receivesCredentialSecurely, sslCertificate: $sslCertificate, sslError: $sslError}';
  }
}
