// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'attributed_string_text_effect_style.dart';

// **************************************************************************
// ExchangeableEnumGenerator
// **************************************************************************

///Class that represents the supported proxy types.
class CygnusAttributedStringTextEffectStyle {
  final String _value;
  final String? _nativeValue;
  const CygnusAttributedStringTextEffectStyle._internal(
    this._value,
    this._nativeValue,
  );
  // ignore: unused_element
  factory CygnusAttributedStringTextEffectStyle._internalMultiPlatform(
    String value,
    Function nativeValue,
  ) => CygnusAttributedStringTextEffectStyle._internal(value, nativeValue());

  ///A graphical text effect that gives glyphs the appearance of letterpress printing, which involves pressing the type into the paper.
  static const LETTERPRESS_STYLE =
      CygnusAttributedStringTextEffectStyle._internal(
        'letterpressStyle',
        'letterpressStyle',
      );

  ///Set of all values of [CygnusAttributedStringTextEffectStyle].
  static final Set<CygnusAttributedStringTextEffectStyle> values = [
    CygnusAttributedStringTextEffectStyle.LETTERPRESS_STYLE,
  ].toSet();

  ///Gets a possible [CygnusAttributedStringTextEffectStyle] instance from [String] value.
  static CygnusAttributedStringTextEffectStyle? fromValue(String? value) {
    if (value != null) {
      try {
        return CygnusAttributedStringTextEffectStyle.values.firstWhere(
          (element) => element.toValue() == value,
        );
      } catch (e) {
        return null;
      }
    }
    return null;
  }

  ///Gets a possible [CygnusAttributedStringTextEffectStyle] instance from a native value.
  static CygnusAttributedStringTextEffectStyle? fromNativeValue(String? value) {
    if (value != null) {
      try {
        return CygnusAttributedStringTextEffectStyle.values.firstWhere(
          (element) => element.toNativeValue() == value,
        );
      } catch (e) {
        return null;
      }
    }
    return null;
  }

  /// Gets a possible [CygnusAttributedStringTextEffectStyle] instance value with name [name].
  ///
  /// Goes through [CygnusAttributedStringTextEffectStyle.values] looking for a value with
  /// name [name], as reported by [CygnusAttributedStringTextEffectStyle.name].
  /// Returns the first value with the given name, otherwise `null`.
  static CygnusAttributedStringTextEffectStyle? byName(String? name) {
    if (name != null) {
      try {
        return CygnusAttributedStringTextEffectStyle.values.firstWhere(
          (element) => element.name() == name,
        );
      } catch (e) {
        return null;
      }
    }
    return null;
  }

  /// Creates a map from the names of [CygnusAttributedStringTextEffectStyle] values to the values.
  ///
  /// The collection that this method is called on is expected to have
  /// values with distinct names, like the `values` list of an enum class.
  /// Only one value for each name can occur in the created map,
  /// so if two or more values have the same name (either being the
  /// same value, or being values of different enum type), at most one of
  /// them will be represented in the returned map.
  static Map<String, CygnusAttributedStringTextEffectStyle> asNameMap() =>
      <String, CygnusAttributedStringTextEffectStyle>{
        for (final value in CygnusAttributedStringTextEffectStyle.values)
          value.name(): value,
      };

  ///Gets [String] value.
  String toValue() => _value;

  ///Gets [String] native value if supported by the current platform, otherwise `null`.
  String? toNativeValue() => _nativeValue;

  ///Gets the name of the value.
  String name() {
    switch (_value) {
      case 'letterpressStyle':
        return 'LETTERPRESS_STYLE';
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
    return _value;
  }
}

///An iOS-specific Class that represents the supported proxy types.
///Use [CygnusAttributedStringTextEffectStyle] instead.
@Deprecated('Use CygnusAttributedStringTextEffectStyle instead')
class CygnusIOSNSAttributedStringTextEffectStyle {
  final String _value;
  final String? _nativeValue;
  const CygnusIOSNSAttributedStringTextEffectStyle._internal(
    this._value,
    this._nativeValue,
  );
  // ignore: unused_element
  factory CygnusIOSNSAttributedStringTextEffectStyle._internalMultiPlatform(
    String value,
    Function nativeValue,
  ) => CygnusIOSNSAttributedStringTextEffectStyle._internal(
    value,
    nativeValue(),
  );

  ///A graphical text effect that gives glyphs the appearance of letterpress printing, which involves pressing the type into the paper.
  static const LETTERPRESS_STYLE =
      CygnusIOSNSAttributedStringTextEffectStyle._internal(
        'letterpressStyle',
        'letterpressStyle',
      );

  ///Set of all values of [CygnusIOSNSAttributedStringTextEffectStyle].
  static final Set<CygnusIOSNSAttributedStringTextEffectStyle> values = [
    CygnusIOSNSAttributedStringTextEffectStyle.LETTERPRESS_STYLE,
  ].toSet();

  ///Gets a possible [CygnusIOSNSAttributedStringTextEffectStyle] instance from [String] value.
  static CygnusIOSNSAttributedStringTextEffectStyle? fromValue(String? value) {
    if (value != null) {
      try {
        return CygnusIOSNSAttributedStringTextEffectStyle.values.firstWhere(
          (element) => element.toValue() == value,
        );
      } catch (e) {
        return null;
      }
    }
    return null;
  }

  ///Gets a possible [CygnusIOSNSAttributedStringTextEffectStyle] instance from a native value.
  static CygnusIOSNSAttributedStringTextEffectStyle? fromNativeValue(
    String? value,
  ) {
    if (value != null) {
      try {
        return CygnusIOSNSAttributedStringTextEffectStyle.values.firstWhere(
          (element) => element.toNativeValue() == value,
        );
      } catch (e) {
        return null;
      }
    }
    return null;
  }

  /// Gets a possible [CygnusIOSNSAttributedStringTextEffectStyle] instance value with name [name].
  ///
  /// Goes through [CygnusIOSNSAttributedStringTextEffectStyle.values] looking for a value with
  /// name [name], as reported by [CygnusIOSNSAttributedStringTextEffectStyle.name].
  /// Returns the first value with the given name, otherwise `null`.
  static CygnusIOSNSAttributedStringTextEffectStyle? byName(String? name) {
    if (name != null) {
      try {
        return CygnusIOSNSAttributedStringTextEffectStyle.values.firstWhere(
          (element) => element.name() == name,
        );
      } catch (e) {
        return null;
      }
    }
    return null;
  }

  /// Creates a map from the names of [CygnusIOSNSAttributedStringTextEffectStyle] values to the values.
  ///
  /// The collection that this method is called on is expected to have
  /// values with distinct names, like the `values` list of an enum class.
  /// Only one value for each name can occur in the created map,
  /// so if two or more values have the same name (either being the
  /// same value, or being values of different enum type), at most one of
  /// them will be represented in the returned map.
  static Map<String, CygnusIOSNSAttributedStringTextEffectStyle> asNameMap() =>
      <String, CygnusIOSNSAttributedStringTextEffectStyle>{
        for (final value in CygnusIOSNSAttributedStringTextEffectStyle.values)
          value.name(): value,
      };

  ///Gets [String] value.
  String toValue() => _value;

  ///Gets [String] native value if supported by the current platform, otherwise `null`.
  String? toNativeValue() => _nativeValue;

  ///Gets the name of the value.
  String name() {
    switch (_value) {
      case 'letterpressStyle':
        return 'LETTERPRESS_STYLE';
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
    return _value;
  }
}
