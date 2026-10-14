// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'font_hinting_style.dart';

// **************************************************************************
// ExchangeableEnumGenerator
// **************************************************************************

///Font hinting style used for text rendering on Linux.
class CygnusFontHintingStyle {
  final int _value;
  final int? _nativeValue;
  const CygnusFontHintingStyle._internal(this._value, this._nativeValue);
  // ignore: unused_element
  factory CygnusFontHintingStyle._internalMultiPlatform(
    int value,
    Function nativeValue,
  ) => CygnusFontHintingStyle._internal(value, nativeValue());

  ///Full hinting. Maximum hinting is applied for crispest text.
  static const FULL = CygnusFontHintingStyle._internal(3, 3);

  ///Medium hinting. A moderate amount of hinting is applied.
  static const MEDIUM = CygnusFontHintingStyle._internal(2, 2);

  ///No hinting. Text is rendered without any hinting.
  static const NONE = CygnusFontHintingStyle._internal(0, 0);

  ///Slight hinting. A minimal amount of hinting is applied.
  static const SLIGHT = CygnusFontHintingStyle._internal(1, 1);

  ///Set of all values of [CygnusFontHintingStyle].
  static final Set<CygnusFontHintingStyle> values = [
    CygnusFontHintingStyle.FULL,
    CygnusFontHintingStyle.MEDIUM,
    CygnusFontHintingStyle.NONE,
    CygnusFontHintingStyle.SLIGHT,
  ].toSet();

  ///Gets a possible [CygnusFontHintingStyle] instance from [int] value.
  static CygnusFontHintingStyle? fromValue(int? value) {
    if (value != null) {
      try {
        return CygnusFontHintingStyle.values.firstWhere(
          (element) => element.toValue() == value,
        );
      } catch (e) {
        return null;
      }
    }
    return null;
  }

  ///Gets a possible [CygnusFontHintingStyle] instance from a native value.
  static CygnusFontHintingStyle? fromNativeValue(int? value) {
    if (value != null) {
      try {
        return CygnusFontHintingStyle.values.firstWhere(
          (element) => element.toNativeValue() == value,
        );
      } catch (e) {
        return null;
      }
    }
    return null;
  }

  /// Gets a possible [CygnusFontHintingStyle] instance value with name [name].
  ///
  /// Goes through [CygnusFontHintingStyle.values] looking for a value with
  /// name [name], as reported by [CygnusFontHintingStyle.name].
  /// Returns the first value with the given name, otherwise `null`.
  static CygnusFontHintingStyle? byName(String? name) {
    if (name != null) {
      try {
        return CygnusFontHintingStyle.values.firstWhere(
          (element) => element.name() == name,
        );
      } catch (e) {
        return null;
      }
    }
    return null;
  }

  /// Creates a map from the names of [CygnusFontHintingStyle] values to the values.
  ///
  /// The collection that this method is called on is expected to have
  /// values with distinct names, like the `values` list of an enum class.
  /// Only one value for each name can occur in the created map,
  /// so if two or more values have the same name (either being the
  /// same value, or being values of different enum type), at most one of
  /// them will be represented in the returned map.
  static Map<String, CygnusFontHintingStyle> asNameMap() =>
      <String, CygnusFontHintingStyle>{
        for (final value in CygnusFontHintingStyle.values) value.name(): value,
      };

  ///Gets [int] value.
  int toValue() => _value;

  ///Gets [int] native value if supported by the current platform, otherwise `null`.
  int? toNativeValue() => _nativeValue;

  ///Gets the name of the value.
  String name() {
    switch (_value) {
      case 3:
        return 'FULL';
      case 2:
        return 'MEDIUM';
      case 0:
        return 'NONE';
      case 1:
        return 'SLIGHT';
    }
    return _value.toString();
  }

  @override
  int get hashCode => _value.hashCode;

  @override
  bool operator ==(value) => value == _value;

  ///Checks if the value is supported by the [defaultTargetPlatform].
  bool isSupported() {
    return _nativeValue != null;
  }

  @override
  String toString() {
    return name();
  }
}
