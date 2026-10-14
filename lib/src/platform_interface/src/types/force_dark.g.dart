// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'force_dark.dart';

// **************************************************************************
// ExchangeableEnumGenerator
// **************************************************************************

///Class used to indicate the force dark mode.
class CygnusForceDark {
  final int _value;
  final int? _nativeValue;
  const CygnusForceDark._internal(this._value, this._nativeValue);
  // ignore: unused_element
  factory CygnusForceDark._internalMultiPlatform(
    int value,
    Function nativeValue,
  ) => CygnusForceDark._internal(value, nativeValue());

  ///Enable force dark dependent on the state of the WebView parent view.
  static const AUTO = CygnusForceDark._internal(1, 1);

  ///Disable force dark, irrespective of the force dark mode of the WebView parent.
  ///In this mode, WebView content will always be rendered as-is, regardless of whether native views are being automatically darkened.
  static const OFF = CygnusForceDark._internal(0, 0);

  ///Unconditionally enable force dark. In this mode WebView content will always be rendered so as to emulate a dark theme.
  static const ON = CygnusForceDark._internal(2, 2);

  ///Set of all values of [CygnusForceDark].
  static final Set<CygnusForceDark> values = [
    CygnusForceDark.AUTO,
    CygnusForceDark.OFF,
    CygnusForceDark.ON,
  ].toSet();

  ///Gets a possible [CygnusForceDark] instance from [int] value.
  static CygnusForceDark? fromValue(int? value) {
    if (value != null) {
      try {
        return CygnusForceDark.values.firstWhere(
          (element) => element.toValue() == value,
        );
      } catch (e) {
        return null;
      }
    }
    return null;
  }

  ///Gets a possible [CygnusForceDark] instance from a native value.
  static CygnusForceDark? fromNativeValue(int? value) {
    if (value != null) {
      try {
        return CygnusForceDark.values.firstWhere(
          (element) => element.toNativeValue() == value,
        );
      } catch (e) {
        return null;
      }
    }
    return null;
  }

  /// Gets a possible [CygnusForceDark] instance value with name [name].
  ///
  /// Goes through [CygnusForceDark.values] looking for a value with
  /// name [name], as reported by [CygnusForceDark.name].
  /// Returns the first value with the given name, otherwise `null`.
  static CygnusForceDark? byName(String? name) {
    if (name != null) {
      try {
        return CygnusForceDark.values.firstWhere(
          (element) => element.name() == name,
        );
      } catch (e) {
        return null;
      }
    }
    return null;
  }

  /// Creates a map from the names of [CygnusForceDark] values to the values.
  ///
  /// The collection that this method is called on is expected to have
  /// values with distinct names, like the `values` list of an enum class.
  /// Only one value for each name can occur in the created map,
  /// so if two or more values have the same name (either being the
  /// same value, or being values of different enum type), at most one of
  /// them will be represented in the returned map.
  static Map<String, CygnusForceDark> asNameMap() => <String, CygnusForceDark>{
    for (final value in CygnusForceDark.values) value.name(): value,
  };

  ///Gets [int] value.
  int toValue() => _value;

  ///Gets [int] native value if supported by the current platform, otherwise `null`.
  int? toNativeValue() => _nativeValue;

  ///Gets the name of the value.
  String name() {
    switch (_value) {
      case 1:
        return 'AUTO';
      case 0:
        return 'OFF';
      case 2:
        return 'ON';
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

///An Android-specific class used to indicate the force dark mode.
///
///**NOTE**: available on Android 29+.
///
///Use [CygnusForceDark] instead.
@Deprecated('Use CygnusForceDark instead')
class CygnusAndroidForceDark {
  final int _value;
  final int? _nativeValue;
  const CygnusAndroidForceDark._internal(this._value, this._nativeValue);
  // ignore: unused_element
  factory CygnusAndroidForceDark._internalMultiPlatform(
    int value,
    Function nativeValue,
  ) => CygnusAndroidForceDark._internal(value, nativeValue());

  ///Enable force dark dependent on the state of the WebView parent view.
  static const FORCE_DARK_AUTO = CygnusAndroidForceDark._internal(1, 1);

  ///Disable force dark, irrespective of the force dark mode of the WebView parent.
  ///In this mode, WebView content will always be rendered as-is, regardless of whether native views are being automatically darkened.
  static const FORCE_DARK_OFF = CygnusAndroidForceDark._internal(0, 0);

  ///Unconditionally enable force dark. In this mode WebView content will always be rendered so as to emulate a dark theme.
  static const FORCE_DARK_ON = CygnusAndroidForceDark._internal(2, 2);

  ///Set of all values of [CygnusAndroidForceDark].
  static final Set<CygnusAndroidForceDark> values = [
    CygnusAndroidForceDark.FORCE_DARK_AUTO,
    CygnusAndroidForceDark.FORCE_DARK_OFF,
    CygnusAndroidForceDark.FORCE_DARK_ON,
  ].toSet();

  ///Gets a possible [CygnusAndroidForceDark] instance from [int] value.
  static CygnusAndroidForceDark? fromValue(int? value) {
    if (value != null) {
      try {
        return CygnusAndroidForceDark.values.firstWhere(
          (element) => element.toValue() == value,
        );
      } catch (e) {
        return null;
      }
    }
    return null;
  }

  ///Gets a possible [CygnusAndroidForceDark] instance from a native value.
  static CygnusAndroidForceDark? fromNativeValue(int? value) {
    if (value != null) {
      try {
        return CygnusAndroidForceDark.values.firstWhere(
          (element) => element.toNativeValue() == value,
        );
      } catch (e) {
        return null;
      }
    }
    return null;
  }

  /// Gets a possible [CygnusAndroidForceDark] instance value with name [name].
  ///
  /// Goes through [CygnusAndroidForceDark.values] looking for a value with
  /// name [name], as reported by [CygnusAndroidForceDark.name].
  /// Returns the first value with the given name, otherwise `null`.
  static CygnusAndroidForceDark? byName(String? name) {
    if (name != null) {
      try {
        return CygnusAndroidForceDark.values.firstWhere(
          (element) => element.name() == name,
        );
      } catch (e) {
        return null;
      }
    }
    return null;
  }

  /// Creates a map from the names of [CygnusAndroidForceDark] values to the values.
  ///
  /// The collection that this method is called on is expected to have
  /// values with distinct names, like the `values` list of an enum class.
  /// Only one value for each name can occur in the created map,
  /// so if two or more values have the same name (either being the
  /// same value, or being values of different enum type), at most one of
  /// them will be represented in the returned map.
  static Map<String, CygnusAndroidForceDark> asNameMap() =>
      <String, CygnusAndroidForceDark>{
        for (final value in CygnusAndroidForceDark.values) value.name(): value,
      };

  ///Gets [int] value.
  int toValue() => _value;

  ///Gets [int] native value if supported by the current platform, otherwise `null`.
  int? toNativeValue() => _nativeValue;

  ///Gets the name of the value.
  String name() {
    switch (_value) {
      case 1:
        return 'FORCE_DARK_AUTO';
      case 0:
        return 'FORCE_DARK_OFF';
      case 2:
        return 'FORCE_DARK_ON';
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
