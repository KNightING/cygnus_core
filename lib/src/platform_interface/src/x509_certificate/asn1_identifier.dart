class CygnusASN1IdentifierClass {
  final int _value;

  const CygnusASN1IdentifierClass._internal(this._value);

  static final Set<CygnusASN1IdentifierClass> values = [
    CygnusASN1IdentifierClass.UNIVERSAL,
    CygnusASN1IdentifierClass.APPLICATION,
    CygnusASN1IdentifierClass.CONTEXT_SPECIFIC,
    CygnusASN1IdentifierClass.PRIVATE,
  ].toSet();

  static CygnusASN1IdentifierClass? fromValue(int? value) {
    if (value != null) {
      try {
        return CygnusASN1IdentifierClass.values.firstWhere(
          (element) => element.toValue() == value,
        );
      } catch (e) {
        return null;
      }
    }
    return null;
  }

  int toValue() => _value;

  static const UNIVERSAL = const CygnusASN1IdentifierClass._internal(0x00);
  static const APPLICATION = const CygnusASN1IdentifierClass._internal(0x40);
  static const CONTEXT_SPECIFIC = const CygnusASN1IdentifierClass._internal(0x80);
  static const PRIVATE = const CygnusASN1IdentifierClass._internal(0xC0);

  @override
  String toString() {
    switch (this.toValue()) {
      case 0x00:
        return "UNIVERSAL";
      case 0x40:
        return "APPLICATION";
      case 0x80:
        return "CONTEXT_SPECIFIC";
      case 0xC0:
        return "PRIVATE";
    }
    return "";
  }

  bool operator ==(value) => value == _value;

  @override
  int get hashCode => _value.hashCode;
}

class CygnusASN1IdentifierTagNumber {
  final int _value;

  const CygnusASN1IdentifierTagNumber._internal(this._value);

  static final Set<CygnusASN1IdentifierTagNumber> values = [
    CygnusASN1IdentifierTagNumber.END_OF_CONTENT,
    CygnusASN1IdentifierTagNumber.BOOLEAN,
    CygnusASN1IdentifierTagNumber.INTEGER,
    CygnusASN1IdentifierTagNumber.BIT_STRING,
    CygnusASN1IdentifierTagNumber.OCTET_STRING,
    CygnusASN1IdentifierTagNumber.NULL,
    CygnusASN1IdentifierTagNumber.OBJECT_IDENTIFIER,
    CygnusASN1IdentifierTagNumber.OBJECT_DESCRIPTOR,
    CygnusASN1IdentifierTagNumber.EXTERNAL,
    CygnusASN1IdentifierTagNumber.READ,
    CygnusASN1IdentifierTagNumber.ENUMERATED,
    CygnusASN1IdentifierTagNumber.EMBEDDED_PDV,
    CygnusASN1IdentifierTagNumber.UTF8_STRING,
    CygnusASN1IdentifierTagNumber.RELATIVE_OID,
    CygnusASN1IdentifierTagNumber.SEQUENCE,
    CygnusASN1IdentifierTagNumber.SET,
    CygnusASN1IdentifierTagNumber.NUMERIC_STRING,
    CygnusASN1IdentifierTagNumber.PRINTABLE_STRING,
    CygnusASN1IdentifierTagNumber.T61_STRING,
    CygnusASN1IdentifierTagNumber.VIDEOTEX_STRING,
    CygnusASN1IdentifierTagNumber.IA5_STRING,
    CygnusASN1IdentifierTagNumber.UTC_TIME,
    CygnusASN1IdentifierTagNumber.GENERALIZED_TIME,
    CygnusASN1IdentifierTagNumber.GRAPHIC_STRING,
    CygnusASN1IdentifierTagNumber.VISIBLE_STRING,
    CygnusASN1IdentifierTagNumber.GENERAL_STRING,
    CygnusASN1IdentifierTagNumber.UNIVERSAL_STRING,
    CygnusASN1IdentifierTagNumber.CHARACTER_STRING,
    CygnusASN1IdentifierTagNumber.BMP_STRING,
  ].toSet();

  static CygnusASN1IdentifierTagNumber? fromValue(int? value) {
    if (value != null) {
      try {
        return CygnusASN1IdentifierTagNumber.values.firstWhere(
          (element) => element.toValue() == value,
        );
      } catch (e) {
        return null;
      }
    }
    return null;
  }

  int toValue() => _value;

  static const END_OF_CONTENT = const CygnusASN1IdentifierTagNumber._internal(0x00);
  static const BOOLEAN = const CygnusASN1IdentifierTagNumber._internal(0x01);
  static const INTEGER = const CygnusASN1IdentifierTagNumber._internal(0x02);
  static const BIT_STRING = const CygnusASN1IdentifierTagNumber._internal(0x03);
  static const OCTET_STRING = const CygnusASN1IdentifierTagNumber._internal(0x04);
  static const NULL = const CygnusASN1IdentifierTagNumber._internal(0x05);
  static const OBJECT_IDENTIFIER = const CygnusASN1IdentifierTagNumber._internal(
    0x06,
  );
  static const OBJECT_DESCRIPTOR = const CygnusASN1IdentifierTagNumber._internal(
    0x07,
  );
  static const EXTERNAL = const CygnusASN1IdentifierTagNumber._internal(0x08);
  static const READ = const CygnusASN1IdentifierTagNumber._internal(0x09);
  static const ENUMERATED = const CygnusASN1IdentifierTagNumber._internal(0x0A);
  static const EMBEDDED_PDV = const CygnusASN1IdentifierTagNumber._internal(0x0B);
  static const UTF8_STRING = const CygnusASN1IdentifierTagNumber._internal(0x0C);
  static const RELATIVE_OID = const CygnusASN1IdentifierTagNumber._internal(0x0D);
  static const SEQUENCE = const CygnusASN1IdentifierTagNumber._internal(0x10);
  static const SET = const CygnusASN1IdentifierTagNumber._internal(0x11);
  static const NUMERIC_STRING = const CygnusASN1IdentifierTagNumber._internal(0x12);
  static const PRINTABLE_STRING = const CygnusASN1IdentifierTagNumber._internal(0x13);
  static const T61_STRING = const CygnusASN1IdentifierTagNumber._internal(0x14);
  static const VIDEOTEX_STRING = const CygnusASN1IdentifierTagNumber._internal(0x15);
  static const IA5_STRING = const CygnusASN1IdentifierTagNumber._internal(0x16);
  static const UTC_TIME = const CygnusASN1IdentifierTagNumber._internal(0x17);
  static const GENERALIZED_TIME = const CygnusASN1IdentifierTagNumber._internal(0x18);
  static const GRAPHIC_STRING = const CygnusASN1IdentifierTagNumber._internal(0x19);
  static const VISIBLE_STRING = const CygnusASN1IdentifierTagNumber._internal(0x1A);
  static const GENERAL_STRING = const CygnusASN1IdentifierTagNumber._internal(0x1B);
  static const UNIVERSAL_STRING = const CygnusASN1IdentifierTagNumber._internal(0x1C);
  static const CHARACTER_STRING = const CygnusASN1IdentifierTagNumber._internal(0x1D);
  static const BMP_STRING = const CygnusASN1IdentifierTagNumber._internal(0x1E);

  @override
  String toString() {
    switch (this.toValue()) {
      case 0x00:
        return "END_OF_CONTENT";
      case 0x01:
        return "BOOLEAN";
      case 0x02:
        return "INTEGER";
      case 0x03:
        return "BIT_STRING";
      case 0x04:
        return "OCTET_STRING";
      case 0x05:
        return "NULL";
      case 0x06:
        return "OBJECT_IDENTIFIER";
      case 0x07:
        return "OBJECT_DESCRIPTOR";
      case 0x08:
        return "EXTERNAL";
      case 0x09:
        return "READ";
      case 0x0A:
        return "ENUMERATED";
      case 0x0B:
        return "EMBEDDED_PDV";
      case 0x0C:
        return "UTF8_STRING";
      case 0x0D:
        return "RELATIVE_OID";
      case 0x10:
        return "SEQUENCE";
      case 0x11:
        return "SET";
      case 0x12:
        return "NUMERIC_STRING";
      case 0x13:
        return "PRINTABLE_STRING";
      case 0x14:
        return "T61_STRING";
      case 0x15:
        return "VIDEOTEX_STRING";
      case 0x16:
        return "IA5_STRING";
      case 0x17:
        return "UTC_TIME";
      case 0x18:
        return "GENERALIZED_TIME";
      case 0x19:
        return "GRAPHIC_STRING";
      case 0x1A:
        return "VISIBLE_STRING";
      case 0x1B:
        return "GENERAL_STRING";
      case 0x1C:
        return "UNIVERSAL_STRING";
      case 0x1D:
        return "CHARACTER_STRING";
      case 0x1E:
        return "BMP_STRING";
    }
    return "";
  }

  bool operator ==(value) => value == _value;

  @override
  int get hashCode => _value.hashCode;
}

class CygnusASN1Identifier {
  int rawValue;
  static int constructedTag = 0x20;

  CygnusASN1Identifier(this.rawValue);

  bool isPrimitive() {
    return (rawValue & CygnusASN1Identifier.constructedTag) == 0;
  }

  bool isConstructed() {
    return (rawValue & CygnusASN1Identifier.constructedTag) != 0;
  }

  CygnusASN1IdentifierTagNumber tagNumber() {
    return CygnusASN1IdentifierTagNumber.fromValue(rawValue & 0x1F) ??
        CygnusASN1IdentifierTagNumber.END_OF_CONTENT;
  }

  CygnusASN1IdentifierClass typeClass() {
    for (var tc in [
      CygnusASN1IdentifierClass.APPLICATION,
      CygnusASN1IdentifierClass.CONTEXT_SPECIFIC,
      CygnusASN1IdentifierClass.PRIVATE,
    ]) {
      if ((rawValue & tc.toValue()) == tc.toValue()) {
        return tc;
      }
    }
    return CygnusASN1IdentifierClass.UNIVERSAL;
  }

  String get description {
    var tc = typeClass();
    var tn = tagNumber();
    if (tc == CygnusASN1IdentifierClass.UNIVERSAL) {
      return tn.toString();
    } else {
      return "$tc(${tn.toValue()})";
    }
  }

  @override
  String toString() {
    return description;
  }
}
