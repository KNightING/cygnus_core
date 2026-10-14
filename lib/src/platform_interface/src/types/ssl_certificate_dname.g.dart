// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ssl_certificate_dname.dart';

// **************************************************************************
// ExchangeableObjectGenerator
// **************************************************************************

///Distinguished name helper class. Used by [CygnusSslCertificate].
class CygnusSslCertificateDName {
  ///Common-name (CN) component of the name
  String? CName;

  ///Distinguished name (normally includes CN, O, and OU names)
  String? DName;

  ///Organization (O) component of the name
  String? OName;

  ///Organizational Unit (OU) component of the name
  String? UName;
  CygnusSslCertificateDName({
    this.CName = "",
    this.DName = "",
    this.OName = "",
    this.UName = "",
  });

  ///Gets a possible [CygnusSslCertificateDName] instance from a [Map] value.
  static CygnusSslCertificateDName? fromMap(
    Map<String, dynamic>? map, {
    CygnusEnumMethod? enumMethod,
  }) {
    if (map == null) {
      return null;
    }
    final instance = CygnusSslCertificateDName();
    instance.CName = map['CName'];
    instance.DName = map['DName'];
    instance.OName = map['OName'];
    instance.UName = map['UName'];
    return instance;
  }

  ///Converts instance to a map.
  Map<String, dynamic> toMap({CygnusEnumMethod? enumMethod}) {
    return {"CName": CName, "DName": DName, "OName": OName, "UName": UName};
  }

  ///Converts instance to a map.
  Map<String, dynamic> toJson() {
    return toMap();
  }

  @override
  String toString() {
    return 'CygnusSslCertificateDName{CName: $CName, DName: $DName, OName: $OName, UName: $UName}';
  }
}
