// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dismiss_button_style.dart';

// **************************************************************************
// ExchangeableEnumGenerator
// **************************************************************************

///Class used to set the custom style for the dismiss button.
class CygnusDismissButtonStyle {
  final int _value;
  final int? _nativeValue;
  const CygnusDismissButtonStyle._internal(this._value, this._nativeValue);
  // ignore: unused_element
  factory CygnusDismissButtonStyle._internalMultiPlatform(
    int value,
    Function nativeValue,
  ) => CygnusDismissButtonStyle._internal(value, nativeValue());

  ///Makes the button title the localized string "Cancel".
  static const CANCEL = CygnusDismissButtonStyle._internal(2, 2);

  ///Makes the button title the localized string "Close".
  static const CLOSE = CygnusDismissButtonStyle._internal(1, 1);

  ///Makes the button title the localized string "Done".
  static const DONE = CygnusDismissButtonStyle._internal(0, 0);

  ///Set of all values of [CygnusDismissButtonStyle].
  static final Set<CygnusDismissButtonStyle> values = [
    CygnusDismissButtonStyle.CANCEL,
    CygnusDismissButtonStyle.CLOSE,
    CygnusDismissButtonStyle.DONE,
  ].toSet();

  ///Gets a possible [CygnusDismissButtonStyle] instance from [int] value.
  static CygnusDismissButtonStyle? fromValue(int? value) {
    if (value != null) {
      try {
        return CygnusDismissButtonStyle.values.firstWhere(
          (element) => element.toValue() == value,
        );
      } catch (e) {
        return null;
      }
    }
    return null;
  }

  ///Gets a possible [CygnusDismissButtonStyle] instance from a native value.
  static CygnusDismissButtonStyle? fromNativeValue(int? value) {
    if (value != null) {
      try {
        return CygnusDismissButtonStyle.values.firstWhere(
          (element) => element.toNativeValue() == value,
        );
      } catch (e) {
        return null;
      }
    }
    return null;
  }

  /// Gets a possible [CygnusDismissButtonStyle] instance value with name [name].
  ///
  /// Goes through [CygnusDismissButtonStyle.values] looking for a value with
  /// name [name], as reported by [CygnusDismissButtonStyle.name].
  /// Returns the first value with the given name, otherwise `null`.
  static CygnusDismissButtonStyle? byName(String? name) {
    if (name != null) {
      try {
        return CygnusDismissButtonStyle.values.firstWhere(
          (element) => element.name() == name,
        );
      } catch (e) {
        return null;
      }
    }
    return null;
  }

  /// Creates a map from the names of [CygnusDismissButtonStyle] values to the values.
  ///
  /// The collection that this method is called on is expected to have
  /// values with distinct names, like the `values` list of an enum class.
  /// Only one value for each name can occur in the created map,
  /// so if two or more values have the same name (either being the
  /// same value, or being values of different enum type), at most one of
  /// them will be represented in the returned map.
  static Map<String, CygnusDismissButtonStyle> asNameMap() =>
      <String, CygnusDismissButtonStyle>{
        for (final value in CygnusDismissButtonStyle.values)
          value.name(): value,
      };

  ///Gets [int] value.
  int toValue() => _value;

  ///Gets [int] native value if supported by the current platform, otherwise `null`.
  int? toNativeValue() => _nativeValue;

  ///Gets the name of the value.
  String name() {
    switch (_value) {
      case 2:
        return 'CANCEL';
      case 1:
        return 'CLOSE';
      case 0:
        return 'DONE';
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

///An iOS-specific class used to set the custom style for the dismiss button.
///
///**NOTE**: available on iOS 11.0+.
///
///Use [CygnusDismissButtonStyle] instead.
@Deprecated('Use CygnusDismissButtonStyle instead')
class CygnusIOSSafariDismissButtonStyle {
  final int _value;
  final int? _nativeValue;
  const CygnusIOSSafariDismissButtonStyle._internal(
    this._value,
    this._nativeValue,
  );
  // ignore: unused_element
  factory CygnusIOSSafariDismissButtonStyle._internalMultiPlatform(
    int value,
    Function nativeValue,
  ) => CygnusIOSSafariDismissButtonStyle._internal(value, nativeValue());

  ///Makes the button title the localized string "Cancel".
  static const CANCEL = CygnusIOSSafariDismissButtonStyle._internal(2, 2);

  ///Makes the button title the localized string "Close".
  static const CLOSE = CygnusIOSSafariDismissButtonStyle._internal(1, 1);

  ///Makes the button title the localized string "Done".
  static const DONE = CygnusIOSSafariDismissButtonStyle._internal(0, 0);

  ///Set of all values of [CygnusIOSSafariDismissButtonStyle].
  static final Set<CygnusIOSSafariDismissButtonStyle> values = [
    CygnusIOSSafariDismissButtonStyle.CANCEL,
    CygnusIOSSafariDismissButtonStyle.CLOSE,
    CygnusIOSSafariDismissButtonStyle.DONE,
  ].toSet();

  ///Gets a possible [CygnusIOSSafariDismissButtonStyle] instance from [int] value.
  static CygnusIOSSafariDismissButtonStyle? fromValue(int? value) {
    if (value != null) {
      try {
        return CygnusIOSSafariDismissButtonStyle.values.firstWhere(
          (element) => element.toValue() == value,
        );
      } catch (e) {
        return null;
      }
    }
    return null;
  }

  ///Gets a possible [CygnusIOSSafariDismissButtonStyle] instance from a native value.
  static CygnusIOSSafariDismissButtonStyle? fromNativeValue(int? value) {
    if (value != null) {
      try {
        return CygnusIOSSafariDismissButtonStyle.values.firstWhere(
          (element) => element.toNativeValue() == value,
        );
      } catch (e) {
        return null;
      }
    }
    return null;
  }

  /// Gets a possible [CygnusIOSSafariDismissButtonStyle] instance value with name [name].
  ///
  /// Goes through [CygnusIOSSafariDismissButtonStyle.values] looking for a value with
  /// name [name], as reported by [CygnusIOSSafariDismissButtonStyle.name].
  /// Returns the first value with the given name, otherwise `null`.
  static CygnusIOSSafariDismissButtonStyle? byName(String? name) {
    if (name != null) {
      try {
        return CygnusIOSSafariDismissButtonStyle.values.firstWhere(
          (element) => element.name() == name,
        );
      } catch (e) {
        return null;
      }
    }
    return null;
  }

  /// Creates a map from the names of [CygnusIOSSafariDismissButtonStyle] values to the values.
  ///
  /// The collection that this method is called on is expected to have
  /// values with distinct names, like the `values` list of an enum class.
  /// Only one value for each name can occur in the created map,
  /// so if two or more values have the same name (either being the
  /// same value, or being values of different enum type), at most one of
  /// them will be represented in the returned map.
  static Map<String, CygnusIOSSafariDismissButtonStyle> asNameMap() =>
      <String, CygnusIOSSafariDismissButtonStyle>{
        for (final value in CygnusIOSSafariDismissButtonStyle.values)
          value.name(): value,
      };

  ///Gets [int] value.
  int toValue() => _value;

  ///Gets [int] native value if supported by the current platform, otherwise `null`.
  int? toNativeValue() => _nativeValue;

  ///Gets the name of the value.
  String name() {
    switch (_value) {
      case 2:
        return 'CANCEL';
      case 1:
        return 'CLOSE';
      case 0:
        return 'DONE';
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
