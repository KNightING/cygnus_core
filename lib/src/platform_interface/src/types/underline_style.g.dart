// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'underline_style.dart';

// **************************************************************************
// ExchangeableEnumGenerator
// **************************************************************************

///Class that represents the constants for the underline style and strikethrough style attribute keys.
class CygnusUnderlineStyle {
  final int _value;
  final int? _nativeValue;
  const CygnusUnderlineStyle._internal(this._value, this._nativeValue);
  // ignore: unused_element
  factory CygnusUnderlineStyle._internalMultiPlatform(
    int value,
    Function nativeValue,
  ) => CygnusUnderlineStyle._internal(value, nativeValue());

  ///Draw the line only beneath or through words, not whitespace.
  static const BY_WORD = CygnusUnderlineStyle._internal(32768, 32768);

  ///Draw a double line.
  static const DOUBLE = CygnusUnderlineStyle._internal(9, 9);

  ///Draw a line of dashes.
  static const PATTERN_DASH = CygnusUnderlineStyle._internal(512, 512);

  ///Draw a line of alternating dashes and dots.
  static const PATTERN_DASH_DOT = CygnusUnderlineStyle._internal(768, 768);

  ///Draw a line of alternating dashes and two dots.
  static const PATTERN_DASH_DOT_DOT = CygnusUnderlineStyle._internal(
    1024,
    1024,
  );

  ///Draw a line of dots.
  static const PATTERN_DOT = CygnusUnderlineStyle._internal(256, 256);

  ///Draw a single line.
  static const SINGLE = CygnusUnderlineStyle._internal(1, 1);

  ///Do not draw a line.
  static const STYLE_NONE = CygnusUnderlineStyle._internal(0, 0);

  ///Draw a thick line.
  static const THICK = CygnusUnderlineStyle._internal(2, 2);

  ///Set of all values of [CygnusUnderlineStyle].
  static final Set<CygnusUnderlineStyle> values = [
    CygnusUnderlineStyle.BY_WORD,
    CygnusUnderlineStyle.DOUBLE,
    CygnusUnderlineStyle.PATTERN_DASH,
    CygnusUnderlineStyle.PATTERN_DASH_DOT,
    CygnusUnderlineStyle.PATTERN_DASH_DOT_DOT,
    CygnusUnderlineStyle.PATTERN_DOT,
    CygnusUnderlineStyle.SINGLE,
    CygnusUnderlineStyle.STYLE_NONE,
    CygnusUnderlineStyle.THICK,
  ].toSet();

  ///Gets a possible [CygnusUnderlineStyle] instance from [int] value.
  static CygnusUnderlineStyle? fromValue(int? value) {
    if (value != null) {
      try {
        return CygnusUnderlineStyle.values.firstWhere(
          (element) => element.toValue() == value,
        );
      } catch (e) {
        return null;
      }
    }
    return null;
  }

  ///Gets a possible [CygnusUnderlineStyle] instance from a native value.
  static CygnusUnderlineStyle? fromNativeValue(int? value) {
    if (value != null) {
      try {
        return CygnusUnderlineStyle.values.firstWhere(
          (element) => element.toNativeValue() == value,
        );
      } catch (e) {
        return null;
      }
    }
    return null;
  }

  /// Gets a possible [CygnusUnderlineStyle] instance value with name [name].
  ///
  /// Goes through [CygnusUnderlineStyle.values] looking for a value with
  /// name [name], as reported by [CygnusUnderlineStyle.name].
  /// Returns the first value with the given name, otherwise `null`.
  static CygnusUnderlineStyle? byName(String? name) {
    if (name != null) {
      try {
        return CygnusUnderlineStyle.values.firstWhere(
          (element) => element.name() == name,
        );
      } catch (e) {
        return null;
      }
    }
    return null;
  }

  /// Creates a map from the names of [CygnusUnderlineStyle] values to the values.
  ///
  /// The collection that this method is called on is expected to have
  /// values with distinct names, like the `values` list of an enum class.
  /// Only one value for each name can occur in the created map,
  /// so if two or more values have the same name (either being the
  /// same value, or being values of different enum type), at most one of
  /// them will be represented in the returned map.
  static Map<String, CygnusUnderlineStyle> asNameMap() =>
      <String, CygnusUnderlineStyle>{
        for (final value in CygnusUnderlineStyle.values) value.name(): value,
      };

  ///Gets [int] value.
  int toValue() => _value;

  ///Gets [int] native value if supported by the current platform, otherwise `null`.
  int? toNativeValue() => _nativeValue;

  ///Gets the name of the value.
  String name() {
    switch (_value) {
      case 32768:
        return 'BY_WORD';
      case 9:
        return 'DOUBLE';
      case 512:
        return 'PATTERN_DASH';
      case 768:
        return 'PATTERN_DASH_DOT';
      case 1024:
        return 'PATTERN_DASH_DOT_DOT';
      case 256:
        return 'PATTERN_DOT';
      case 1:
        return 'SINGLE';
      case 0:
        return 'STYLE_NONE';
      case 2:
        return 'THICK';
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

///An iOS-specific Class that represents the constants for the underline style and strikethrough style attribute keys.
///Use [CygnusUnderlineStyle] instead.
@Deprecated('Use CygnusUnderlineStyle instead')
class CygnusIOSNSUnderlineStyle {
  final int _value;
  final int? _nativeValue;
  const CygnusIOSNSUnderlineStyle._internal(this._value, this._nativeValue);
  // ignore: unused_element
  factory CygnusIOSNSUnderlineStyle._internalMultiPlatform(
    int value,
    Function nativeValue,
  ) => CygnusIOSNSUnderlineStyle._internal(value, nativeValue());

  ///Draw the line only beneath or through words, not whitespace.
  static const BY_WORD = CygnusIOSNSUnderlineStyle._internal(32768, 32768);

  ///Draw a double line.
  static const DOUBLE = CygnusIOSNSUnderlineStyle._internal(9, 9);

  ///Draw a line of dashes.
  static const PATTERN_DASH = CygnusIOSNSUnderlineStyle._internal(512, 512);

  ///Draw a line of alternating dashes and dots.
  static const PATTERN_DASH_DOT = CygnusIOSNSUnderlineStyle._internal(768, 768);

  ///Draw a line of alternating dashes and two dots.
  static const PATTERN_DASH_DOT_DOT = CygnusIOSNSUnderlineStyle._internal(
    1024,
    1024,
  );

  ///Draw a line of dots.
  static const PATTERN_DOT = CygnusIOSNSUnderlineStyle._internal(256, 256);

  ///Draw a single line.
  static const SINGLE = CygnusIOSNSUnderlineStyle._internal(1, 1);

  ///Do not draw a line.
  static const STYLE_NONE = CygnusIOSNSUnderlineStyle._internal(0, 0);

  ///Draw a thick line.
  static const THICK = CygnusIOSNSUnderlineStyle._internal(2, 2);

  ///Set of all values of [CygnusIOSNSUnderlineStyle].
  static final Set<CygnusIOSNSUnderlineStyle> values = [
    CygnusIOSNSUnderlineStyle.BY_WORD,
    CygnusIOSNSUnderlineStyle.DOUBLE,
    CygnusIOSNSUnderlineStyle.PATTERN_DASH,
    CygnusIOSNSUnderlineStyle.PATTERN_DASH_DOT,
    CygnusIOSNSUnderlineStyle.PATTERN_DASH_DOT_DOT,
    CygnusIOSNSUnderlineStyle.PATTERN_DOT,
    CygnusIOSNSUnderlineStyle.SINGLE,
    CygnusIOSNSUnderlineStyle.STYLE_NONE,
    CygnusIOSNSUnderlineStyle.THICK,
  ].toSet();

  ///Gets a possible [CygnusIOSNSUnderlineStyle] instance from [int] value.
  static CygnusIOSNSUnderlineStyle? fromValue(int? value) {
    if (value != null) {
      try {
        return CygnusIOSNSUnderlineStyle.values.firstWhere(
          (element) => element.toValue() == value,
        );
      } catch (e) {
        return null;
      }
    }
    return null;
  }

  ///Gets a possible [CygnusIOSNSUnderlineStyle] instance from a native value.
  static CygnusIOSNSUnderlineStyle? fromNativeValue(int? value) {
    if (value != null) {
      try {
        return CygnusIOSNSUnderlineStyle.values.firstWhere(
          (element) => element.toNativeValue() == value,
        );
      } catch (e) {
        return null;
      }
    }
    return null;
  }

  /// Gets a possible [CygnusIOSNSUnderlineStyle] instance value with name [name].
  ///
  /// Goes through [CygnusIOSNSUnderlineStyle.values] looking for a value with
  /// name [name], as reported by [CygnusIOSNSUnderlineStyle.name].
  /// Returns the first value with the given name, otherwise `null`.
  static CygnusIOSNSUnderlineStyle? byName(String? name) {
    if (name != null) {
      try {
        return CygnusIOSNSUnderlineStyle.values.firstWhere(
          (element) => element.name() == name,
        );
      } catch (e) {
        return null;
      }
    }
    return null;
  }

  /// Creates a map from the names of [CygnusIOSNSUnderlineStyle] values to the values.
  ///
  /// The collection that this method is called on is expected to have
  /// values with distinct names, like the `values` list of an enum class.
  /// Only one value for each name can occur in the created map,
  /// so if two or more values have the same name (either being the
  /// same value, or being values of different enum type), at most one of
  /// them will be represented in the returned map.
  static Map<String, CygnusIOSNSUnderlineStyle> asNameMap() =>
      <String, CygnusIOSNSUnderlineStyle>{
        for (final value in CygnusIOSNSUnderlineStyle.values)
          value.name(): value,
      };

  ///Gets [int] value.
  int toValue() => _value;

  ///Gets [int] native value if supported by the current platform, otherwise `null`.
  int? toNativeValue() => _nativeValue;

  ///Gets the name of the value.
  String name() {
    switch (_value) {
      case 32768:
        return 'BY_WORD';
      case 9:
        return 'DOUBLE';
      case 512:
        return 'PATTERN_DASH';
      case 768:
        return 'PATTERN_DASH_DOT';
      case 1024:
        return 'PATTERN_DASH_DOT_DOT';
      case 256:
        return 'PATTERN_DOT';
      case 1:
        return 'SINGLE';
      case 0:
        return 'STYLE_NONE';
      case 2:
        return 'THICK';
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
