// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'security_origin.dart';

// **************************************************************************
// ExchangeableObjectGenerator
// **************************************************************************

///An object that identifies the origin of a particular resource.
class CygnusSecurityOrigin {
  ///The security origin’s host.
  String host;

  ///The security origin's port.
  int port;

  ///The security origin's protocol.
  String protocol;
  CygnusSecurityOrigin({
    required this.host,
    required this.port,
    required this.protocol,
  });

  ///Gets a possible [CygnusSecurityOrigin] instance from a [Map] value.
  static CygnusSecurityOrigin? fromMap(
    Map<String, dynamic>? map, {
    CygnusEnumMethod? enumMethod,
  }) {
    if (map == null) {
      return null;
    }
    final instance = CygnusSecurityOrigin(
      host: map['host'],
      port: map['port'],
      protocol: map['protocol'],
    );
    return instance;
  }

  ///Converts instance to a map.
  Map<String, dynamic> toMap({CygnusEnumMethod? enumMethod}) {
    return {"host": host, "port": port, "protocol": protocol};
  }

  ///Converts instance to a map.
  Map<String, dynamic> toJson() {
    return toMap();
  }

  @override
  String toString() {
    return 'CygnusSecurityOrigin{host: $host, port: $port, protocol: $protocol}';
  }
}

///An object that identifies the origin of a particular resource.
///
///**NOTE**: available only on iOS 9.0+.
///
///Use [CygnusSecurityOrigin] instead.
@Deprecated('Use CygnusSecurityOrigin instead')
class CygnusIOSWKSecurityOrigin {
  ///The security origin’s host.
  String host;

  ///The security origin's port.
  int port;

  ///The security origin's protocol.
  String protocol;
  CygnusIOSWKSecurityOrigin({
    required this.host,
    required this.port,
    required this.protocol,
  });

  ///Gets a possible [CygnusIOSWKSecurityOrigin] instance from a [Map] value.
  static CygnusIOSWKSecurityOrigin? fromMap(
    Map<String, dynamic>? map, {
    CygnusEnumMethod? enumMethod,
  }) {
    if (map == null) {
      return null;
    }
    final instance = CygnusIOSWKSecurityOrigin(
      host: map['host'],
      port: map['port'],
      protocol: map['protocol'],
    );
    return instance;
  }

  ///Converts instance to a map.
  Map<String, dynamic> toMap({CygnusEnumMethod? enumMethod}) {
    return {"host": host, "port": port, "protocol": protocol};
  }

  ///Converts instance to a map.
  Map<String, dynamic> toJson() {
    return toMap();
  }

  @override
  String toString() {
    return 'CygnusIOSWKSecurityOrigin{host: $host, port: $port, protocol: $protocol}';
  }
}
