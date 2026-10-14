import 'asn1_object.dart';

class CygnusASN1DistinguishedNames {
  final String _oid;
  final String _representation;

  const CygnusASN1DistinguishedNames._internal(this._oid, this._representation);

  static final Set<CygnusASN1DistinguishedNames> values = [
    CygnusASN1DistinguishedNames.COMMON_NAME,
    CygnusASN1DistinguishedNames.DN_QUALIFIER,
    CygnusASN1DistinguishedNames.SERIAL_NUMBER,
    CygnusASN1DistinguishedNames.GIVEN_NAME,
    CygnusASN1DistinguishedNames.SURNAME,
    CygnusASN1DistinguishedNames.ORGANIZATIONAL_UNIT_NAME,
    CygnusASN1DistinguishedNames.ORGANIZATION_NAME,
    CygnusASN1DistinguishedNames.STREET_ADDRESS,
    CygnusASN1DistinguishedNames.LOCALITY_NAME,
    CygnusASN1DistinguishedNames.STATE_OR_PROVINCE_NAME,
    CygnusASN1DistinguishedNames.COUNTRY_NAME,
    CygnusASN1DistinguishedNames.EMAIL,
  ].toSet();

  static CygnusASN1DistinguishedNames? fromValue(String? oid) {
    if (oid != null) {
      try {
        return CygnusASN1DistinguishedNames.values.firstWhere(
          (element) => element.oid() == oid,
        );
      } catch (e) {
        return null;
      }
    }
    return null;
  }

  String oid() => _oid;

  String representation() => _representation;

  @override
  String toString() => "($_oid, $_representation)";

  static const COMMON_NAME = const CygnusASN1DistinguishedNames._internal(
    "2.5.4.3",
    "CN",
  );
  static const DN_QUALIFIER = const CygnusASN1DistinguishedNames._internal(
    "2.5.4.46",
    "DNQ",
  );
  static const SERIAL_NUMBER = const CygnusASN1DistinguishedNames._internal(
    "2.5.4.5",
    "SERIALNUMBER",
  );
  static const GIVEN_NAME = const CygnusASN1DistinguishedNames._internal(
    "2.5.4.42",
    "GIVENNAME",
  );
  static const SURNAME = const CygnusASN1DistinguishedNames._internal(
    "2.5.4.4",
    "SURNAME",
  );
  static const ORGANIZATIONAL_UNIT_NAME =
      const CygnusASN1DistinguishedNames._internal("2.5.4.11", "OU");
  static const ORGANIZATION_NAME = const CygnusASN1DistinguishedNames._internal(
    "2.5.4.10",
    "O",
  );
  static const STREET_ADDRESS = const CygnusASN1DistinguishedNames._internal(
    "2.5.4.9",
    "STREET",
  );
  static const LOCALITY_NAME = const CygnusASN1DistinguishedNames._internal(
    "2.5.4.7",
    "L",
  );
  static const STATE_OR_PROVINCE_NAME = const CygnusASN1DistinguishedNames._internal(
    "2.5.4.8",
    "ST",
  );
  static const COUNTRY_NAME = const CygnusASN1DistinguishedNames._internal(
    "2.5.4.6",
    "C",
  );
  static const EMAIL = const CygnusASN1DistinguishedNames._internal(
    "1.2.840.113549.1.9.1",
    "E",
  );

  bool operator ==(value) => value == _oid;

  @override
  int get hashCode => _oid.hashCode;

  /// Format subject/issuer information in RFC1779
  static String string({required CygnusASN1Object block}) {
    var result = "";
    var oidNames = CygnusASN1DistinguishedNames.values;
    for (var oidName in oidNames) {
      var oidBlock = block.findOid(oidValue: oidName.oid());
      if (oidBlock == null) {
        continue;
      }
      if (result.isNotEmpty) {
        result += ", ";
      }
      result += oidName.representation();
      result += "=";

      String? value;
      try {
        value = oidBlock.parent?.sub?.last.value as String?;
      } catch (e) {}
      if (value != null) {
        result += quote(value);
      }
    }
    return result;
  }

  static String quote(String string) {
    var specialChars = [",", "+", "=", "\n", "<", ">", "#", ";", "\\"];
    for (var specialChar in specialChars) {
      if (string.contains(specialChar)) {
        return "\"" + string + "\"";
      }
    }
    return string;
  }
}
