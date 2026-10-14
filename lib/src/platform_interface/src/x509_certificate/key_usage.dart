class CygnusKeyUsage {
  final int _value;

  const CygnusKeyUsage._internal(this._value);

  static final Set<CygnusKeyUsage> values = [
    CygnusKeyUsage.digitalSignature,
    CygnusKeyUsage.nonRepudiation,
    CygnusKeyUsage.keyEncipherment,
    CygnusKeyUsage.dataEncipherment,
    CygnusKeyUsage.keyAgreement,
    CygnusKeyUsage.keyCertSign,
    CygnusKeyUsage.cRLSign,
    CygnusKeyUsage.encipherOnly,
    CygnusKeyUsage.decipherOnly,
  ].toSet();

  static CygnusKeyUsage? fromIndex(int? value) {
    if (value != null) {
      try {
        return CygnusKeyUsage.values.firstWhere(
          (element) => element.toValue() == value,
        );
      } catch (e) {
        return null;
      }
    }
    return null;
  }

  int toValue() => _value;

  String name() => _KeyUsageMapName.containsKey(this._value)
      ? _KeyUsageMapName[this._value]!
      : "";

  @override
  String toString() => "($_value, ${name()})";

  static const digitalSignature = const CygnusKeyUsage._internal(0);
  static const nonRepudiation = const CygnusKeyUsage._internal(1);
  static const keyEncipherment = const CygnusKeyUsage._internal(2);
  static const dataEncipherment = const CygnusKeyUsage._internal(3);
  static const keyAgreement = const CygnusKeyUsage._internal(4);
  static const keyCertSign = const CygnusKeyUsage._internal(5);
  static const cRLSign = const CygnusKeyUsage._internal(6);
  static const encipherOnly = const CygnusKeyUsage._internal(7);
  static const decipherOnly = const CygnusKeyUsage._internal(8);

  bool operator ==(value) => value == _value;

  @override
  int get hashCode => _value.hashCode;

  static const Map<int, String> _KeyUsageMapName = {
    0: "digitalSignature",
    1: "nonRepudiation",
    2: "keyEncipherment",
    3: "dataEncipherment",
    4: "keyAgreement",
    5: "keyCertSign",
    6: "cRLSign",
    7: "encipherOnly",
    8: "decipherOnly",
  };
}
