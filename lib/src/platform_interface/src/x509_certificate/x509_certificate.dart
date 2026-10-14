import 'dart:convert';
import 'dart:typed_data';

import '../types/enum_method.dart';
import 'asn1_decoder.dart';
import 'asn1_object.dart';
import 'oid.dart';
import 'x509_public_key.dart';

import 'x509_extension.dart';
import 'asn1_distinguished_names.dart';

///Class that represents a X.509 certificate.
///This provides a standard way to access all the attributes of an X.509 certificate.
class CygnusX509Certificate {
  List<CygnusASN1Object>? asn1;
  CygnusASN1Object? block1;

  ///Returns the encoded form of this certificate. It is
  ///assumed that each certificate type would have only a single
  ///form of encoding; for example, X.509 certificates would
  ///be encoded as ASN.1 DER.
  Uint8List? encoded;

  static const beginPemBlock = "-----BEGIN CERTIFICATE-----";
  static const endPemBlock = "-----END CERTIFICATE-----";

  CygnusX509Certificate({CygnusASN1Object? asn1}) {
    if (asn1 != null) {
      var block1 = asn1.subAtIndex(0);
      if (block1 == null) {
        throw CygnusASN1ParseError();
      }
    }
  }

  static CygnusX509Certificate fromData({required Uint8List data}) {
    var decoded = utf8.decode(data, allowMalformed: true);
    if (decoded.contains(CygnusX509Certificate.beginPemBlock)) {
      return CygnusX509Certificate.fromPemData(pem: data);
    } else {
      return CygnusX509Certificate.fromDerData(der: data);
    }
  }

  static CygnusX509Certificate fromDerData({required Uint8List der}) {
    var asn1 = CygnusASN1DERDecoder.decode(data: der.toList(growable: true));
    if (asn1.length > 0) {
      var block1 = asn1.first.subAtIndex(0);
      if (block1 != null) {
        var certificate = CygnusX509Certificate();
        certificate.asn1 = asn1;
        certificate.block1 = block1;
        certificate.encoded = der;
        return certificate;
      }
    }
    throw CygnusASN1ParseError();
  }

  static CygnusX509Certificate fromPemData({required Uint8List pem}) {
    var derData = CygnusX509Certificate.decodeToDER(pemData: pem);
    if (derData == null) {
      throw CygnusASN1ParseError();
    }
    return CygnusX509Certificate.fromDerData(der: derData);
  }

  ///Read possible PEM encoding
  static Uint8List? decodeToDER({required pemData}) {
    var pem = String.fromCharCodes(pemData);
    if (pem.contains(CygnusX509Certificate.beginPemBlock)) {
      var lines = pem.split("\n");
      var base64buffer = "";
      var certLine = false;
      for (var line in lines) {
        if (line == CygnusX509Certificate.endPemBlock) {
          certLine = false;
        }
        if (certLine) {
          base64buffer += line;
        }
        if (line == CygnusX509Certificate.beginPemBlock) {
          certLine = true;
        }
      }

      Uint8List? derDataDecoded;
      try {
        derDataDecoded = Uint8List.fromList(base64Decode(base64buffer));
      } catch (e) {}
      if (derDataDecoded != null) {
        return derDataDecoded;
      }
    }
    return null;
  }

  String get description =>
      asn1?.fold(
        "",
        (value, element) => (value ?? '') + element.description + '\n',
      ) ??
      '';

  ///Checks that the given date is within the certificate's validity period.
  bool checkValidity({DateTime? date}) {
    if (date == null) {
      date = DateTime.now();
    }
    if (notBefore != null && notAfter != null) {
      return date.isAfter(notBefore!) && date.isBefore(notAfter!);
    }
    return false;
  }

  ///Gets the version (version number) value from the certificate.
  int? get version {
    if (block1 != null) {
      var v = firstLeafValue(block: block1!);
      if (v is List<int>) {
        var index = toIntValue(v);
        if (index != null) {
          return index.toInt() + 1;
        }
      }
    }
    return null;
  }

  ///Gets the serialNumber value from the certificate.
  List<int>? get serialNumber {
    var data = block1?.atIndex(CygnusX509BlockPosition.serialNumber)?.value;
    return data is List<int> ? data : null;
  }

  ///Returns the issuer (issuer distinguished name) value from the certificate as a String.
  String? get issuerDistinguishedName {
    var issuerBlock = block1?.atIndex(CygnusX509BlockPosition.issuer);
    if (issuerBlock != null) {
      return CygnusASN1DistinguishedNames.string(block: issuerBlock);
    }
    return null;
  }

  List<String> get issuerOIDs {
    var result = <String>[];
    var issuerBlock = block1?.atIndex(CygnusX509BlockPosition.issuer);
    if (issuerBlock != null) {
      for (var sub in (issuerBlock.sub ?? <CygnusASN1Object>[])) {
        var value = firstLeafValue(block: sub);
        if (value is String) {
          result.add(value);
        }
      }
    }
    return result;
  }

  String? issuer({String? oid, CygnusASN1DistinguishedNames? dn}) {
    if (oid == null && dn != null) {
      oid = dn.oid();
    }
    if (oid != null) {
      var issuerBlock = block1?.atIndex(CygnusX509BlockPosition.issuer);
      if (issuerBlock != null) {
        var oidBlock = issuerBlock.findOid(oidValue: oid);
        if (oidBlock != null) {
          var sub = oidBlock.parent?.sub;
          if (sub != null && sub.length > 0 && sub.last.value is String) {
            return sub.last.value;
          } else {
            return null;
          }
        }
      }
    }
    return null;
  }

  ///Returns the subject (subject distinguished name) value from the certificate as a String.
  String? get subjectDistinguishedName {
    var subjectBlock = block1?.atIndex(CygnusX509BlockPosition.subject);
    if (subjectBlock != null) {
      return CygnusASN1DistinguishedNames.string(block: subjectBlock);
    }
    return null;
  }

  List<String> get subjectOIDs {
    var result = <String>[];
    var subjectBlock = block1?.atIndex(CygnusX509BlockPosition.subject);
    if (subjectBlock != null) {
      for (var sub in (subjectBlock.sub ?? <CygnusASN1Object>[])) {
        var value = firstLeafValue(block: sub);
        if (value is String) {
          result.add(value);
        }
      }
    }
    return result;
  }

  String? subject({String? oid, CygnusASN1DistinguishedNames? dn}) {
    if (oid == null && dn != null) {
      oid = dn.oid();
    }
    if (oid != null) {
      var subjectBlock = block1?.atIndex(CygnusX509BlockPosition.subject);
      if (subjectBlock != null) {
        var oidBlock = subjectBlock.findOid(oidValue: oid);
        if (oidBlock != null) {
          var sub = oidBlock.parent?.sub;
          if (sub != null && sub.length > 0 && sub.last.value is String) {
            return sub.last.value;
          } else {
            return null;
          }
        }
      }
    }
    return null;
  }

  ///Gets the notBefore date from the validity period of the certificate.
  DateTime? get notBefore {
    var data = block1
        ?.atIndex(CygnusX509BlockPosition.dateValidity)
        ?.subAtIndex(0)
        ?.value;
    return data is DateTime ? data : null;
  }

  ///Gets the notAfter date from the validity period of the certificate.
  DateTime? get notAfter {
    var data = block1
        ?.atIndex(CygnusX509BlockPosition.dateValidity)
        ?.subAtIndex(1)
        ?.value;
    return data is DateTime ? data : null;
  }

  ///Gets the signature value (the raw signature bits) from the certificate.
  List<int>? get signature {
    var data = asn1?[0].subAtIndex(2)?.value;
    return data is List<int> ? data : null;
  }

  ///Gets the signature algorithm name for the certificate signature algorithm.
  String? get sigAlgName => CygnusOID.fromValue(sigAlgOID ?? '')?.name();

  ///Gets the signature algorithm CygnusOID string from the certificate.
  String? get sigAlgOID {
    var data = block1?.subAtIndex(2)?.subAtIndex(0)?.value;
    return data is String ? data : null;
  }

  ///Gets the DER-encoded signature algorithm parameters from this certificate's signature algorithm.
  List<int>? get sigAlgParams => null;

  ///Gets a boolean array representing bits of the CygnusKeyUsage extension, (CygnusOID = 2.5.29.15).
  ///```
  ///CygnusKeyUsage ::= BIT STRING {
  ///digitalSignature        (0),
  ///nonRepudiation          (1),
  ///keyEncipherment         (2),
  ///dataEncipherment        (3),
  ///keyAgreement            (4),
  ///keyCertSign             (5),
  ///cRLSign                 (6),
  ///encipherOnly            (7),
  ///decipherOnly            (8)
  ///}
  ///```
  List<bool> get keyUsage {
    var result = <bool>[];
    var oidBlock = block1?.findOid(oid: CygnusOID.keyUsage);
    if (oidBlock != null) {
      var sub = oidBlock.parent?.sub;
      if (sub != null && sub.length > 0) {
        var data = sub.last.subAtIndex(0)?.value;
        int bits = (data is List<int> && data.length > 0) ? data.first : 0;
        for (var index = 0; index < 8; index++) {
          var value = bits & (1 << index).toUnsigned(8) != 0;
          result.insert(0, value);
        }
      }
    }
    return result;
  }

  ///Gets a list of Strings representing the OBJECT IDENTIFIERs of the ExtKeyUsageSyntax field of
  ///the extended key usage extension, (CygnusOID = 2.5.29.37).
  List<String> get extendedKeyUsage =>
      extensionObject(oid: CygnusOID.extKeyUsage)?.valueAsStrings ?? <String>[];

  ///Gets a collection of subject alternative names from the SubjectAltName extension, (CygnusOID = 2.5.29.17).
  List<String> get subjectAlternativeNames =>
      extensionObject(oid: CygnusOID.subjectAltName)?.alternativeNameAsStrings ??
      <String>[];

  ///Gets a collection of issuer alternative names from the IssuerAltName extension, (CygnusOID = 2.5.29.18).
  List<String> get issuerAlternativeNames =>
      extensionObject(oid: CygnusOID.issuerAltName)?.alternativeNameAsStrings ??
      <String>[];

  ///Gets the informations of the public key from this certificate.
  CygnusX509PublicKey? get publicKey {
    var pkBlock = block1?.atIndex(CygnusX509BlockPosition.publicKey);
    if (pkBlock != null) {
      return CygnusX509PublicKey(pkBlock: pkBlock);
    }
    return null;
  }

  ///Get a list of critical extension CygnusOID codes
  List<String> get criticalExtensionOIDs {
    var extensionBlocks = this.extensionBlocks;
    if (extensionBlocks == null) {
      return <String>[];
    }
    return extensionBlocks
        .map((block) => CygnusX509Extension(block: block))
        .where((extension) => extension.isCritical)
        .map((extension) => extension.oid ?? '')
        .toList();
  }

  ///Get a list of non critical extension CygnusOID codes
  List<String> get nonCriticalExtensionOIDs {
    var extensionBlocks = this.extensionBlocks;
    if (extensionBlocks == null) {
      return <String>[];
    }
    return extensionBlocks
        .map((block) => CygnusX509Extension(block: block))
        .where((extension) => !extension.isCritical)
        .map((extension) => extension.oid ?? '')
        .toList();
  }

  ///Gets the certificate constraints path length from the
  ///critical BasicConstraints extension, (CygnusOID = 2.5.29.19).
  CygnusBasicConstraintExtension? get basicConstraints =>
      extensionObject(oid: CygnusOID.basicConstraints) as CygnusBasicConstraintExtension?;

  ///Gets the raw bits from the Subject Key Identifier (SKID) extension, (CygnusOID = 2.5.29.14).
  CygnusSubjectKeyIdentifierExtension? get subjectKeyIdentifier =>
      extensionObject(oid: CygnusOID.subjectKeyIdentifier)
          as CygnusSubjectKeyIdentifierExtension?;

  ///Gets the raw bits from the Authority Key Identifier extension, (CygnusOID = 2.5.29.35).
  CygnusAuthorityKeyIdentifierExtension? get authorityKeyIdentifier =>
      extensionObject(oid: CygnusOID.authorityKeyIdentifier)
          as CygnusAuthorityKeyIdentifierExtension?;

  ///Gets the list of certificate policies from the CertificatePolicies extension, (CygnusOID = 2.5.29.32).
  CygnusCertificatePoliciesExtension? get certificatePolicies =>
      extensionObject(oid: CygnusOID.certificatePolicies)
          as CygnusCertificatePoliciesExtension?;

  ///Gets the list of CRL distribution points from the CRLDistributionPoints extension, (CygnusOID = 2.5.29.31).
  CygnusCRLDistributionPointsExtension? get cRLDistributionPoints =>
      extensionObject(oid: CygnusOID.cRLDistributionPoints)
          as CygnusCRLDistributionPointsExtension?;

  ///Gets the map of the format (as a key) and location (as a value) of additional information
  ///about the CA who issued the certificate in which this extension appears
  ///from the CygnusAuthorityInfoAccess extension, (CygnusOID = 1.3.6.1.5.5.5.7.1.1).
  CygnusAuthorityInfoAccessExtension? get authorityInfoAccess =>
      extensionObject(oid: CygnusOID.authorityInfoAccess)
          as CygnusAuthorityInfoAccessExtension?;

  List<CygnusASN1Object>? get extensionBlocks =>
      block1?.atIndex(CygnusX509BlockPosition.extensions)?.subAtIndex(0)?.sub;

  ///Gets the extension information of the given CygnusOID code or enum string value.
  CygnusX509Extension? extensionObject({String? oidValue, CygnusOID? oid}) {
    if (oidValue == null && oid != null) {
      oidValue = oid.toValue();
    }
    if (oidValue != null) {
      var block = block1
          ?.atIndex(CygnusX509BlockPosition.extensions)
          ?.findOid(oidValue: oidValue)
          ?.parent;
      if (block != null) {
        if (oidValue == CygnusOID.basicConstraints.toValue()) {
          return CygnusBasicConstraintExtension(block: block);
        } else if (oidValue == CygnusOID.subjectKeyIdentifier.toValue()) {
          return CygnusSubjectKeyIdentifierExtension(block: block);
        } else if (oidValue == CygnusOID.authorityInfoAccess.toValue()) {
          return CygnusAuthorityInfoAccessExtension(block: block);
        } else if (oidValue == CygnusOID.authorityKeyIdentifier.toValue()) {
          return CygnusAuthorityKeyIdentifierExtension(block: block);
        } else if (oidValue == CygnusOID.certificatePolicies.toValue()) {
          return CygnusCertificatePoliciesExtension(block: block);
        } else if (oidValue == CygnusOID.cRLDistributionPoints.toValue()) {
          return CygnusCRLDistributionPointsExtension(block: block);
        }
        return CygnusX509Extension(block: block);
      }
    }
    return null;
  }

  @override
  String toString() {
    return description;
  }

  Map<String, dynamic> toMap({CygnusEnumMethod? enumMethod}) {
    return {
      "basicConstraints": basicConstraints?.toMap(enumMethod: enumMethod),
      "subjectAlternativeNames": subjectAlternativeNames,
      "issuerAlternativeNames": issuerAlternativeNames,
      "extendedKeyUsage": extendedKeyUsage,
      "issuerDistinguishedName": issuerDistinguishedName,
      "keyUsage": keyUsage,
      "notAfter": notAfter?.millisecondsSinceEpoch,
      "notBefore": notBefore?.millisecondsSinceEpoch,
      "serialNumber": serialNumber,
      "sigAlgName": sigAlgName,
      "sigAlgOID": sigAlgOID,
      "sigAlgParams": sigAlgParams,
      "signature": signature,
      "subjectDistinguishedName": subjectDistinguishedName,
      "version": version,
      "criticalExtensionOIDs": criticalExtensionOIDs,
      "nonCriticalExtensionOIDs": nonCriticalExtensionOIDs,
      "encoded": encoded,
      "publicKey": publicKey?.toMap(enumMethod: enumMethod),
      "subjectKeyIdentifier": subjectKeyIdentifier?.toMap(
        enumMethod: enumMethod,
      ),
      "authorityKeyIdentifier": authorityKeyIdentifier?.toMap(
        enumMethod: enumMethod,
      ),
      "certificatePolicies": certificatePolicies?.toMap(enumMethod: enumMethod),
      "cRLDistributionPoints": cRLDistributionPoints?.toMap(
        enumMethod: enumMethod,
      ),
      "authorityInfoAccess": authorityInfoAccess?.toMap(enumMethod: enumMethod),
    };
  }

  Map<String, dynamic> toJson() {
    return toMap();
  }
}

dynamic firstLeafValue({required CygnusASN1Object block}) {
  var sub = block.sub;
  if (sub != null && sub.length > 0) {
    CygnusASN1Object? subFirst;
    try {
      subFirst = sub.first;
    } catch (e) {}
    if (subFirst != null) {
      return firstLeafValue(block: subFirst);
    }
  }
  return block.value;
}

enum CygnusX509BlockPosition {
  version,
  serialNumber,
  signatureAlg,
  issuer,
  dateValidity,
  subject,
  publicKey,
  extensions,
}
