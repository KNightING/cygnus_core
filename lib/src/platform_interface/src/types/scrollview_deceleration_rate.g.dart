// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'scrollview_deceleration_rate.dart';

// **************************************************************************
// ExchangeableEnumGenerator
// **************************************************************************

///Class that represents a floating-point value that determines the rate of deceleration after the user lifts their finger.
class CygnusScrollViewDecelerationRate {
  final String _value;
  final String? _nativeValue;
  const CygnusScrollViewDecelerationRate._internal(
    this._value,
    this._nativeValue,
  );
  // ignore: unused_element
  factory CygnusScrollViewDecelerationRate._internalMultiPlatform(
    String value,
    Function nativeValue,
  ) => CygnusScrollViewDecelerationRate._internal(value, nativeValue());

  ///A fast deceleration rate for a scroll view: `0.99`.
  static const FAST = CygnusScrollViewDecelerationRate._internal(
    'FAST',
    'FAST',
  );

  ///The default deceleration rate for a scroll view: `0.998`.
  static const NORMAL = CygnusScrollViewDecelerationRate._internal(
    'NORMAL',
    'NORMAL',
  );

  ///Set of all values of [CygnusScrollViewDecelerationRate].
  static final Set<CygnusScrollViewDecelerationRate> values = [
    CygnusScrollViewDecelerationRate.FAST,
    CygnusScrollViewDecelerationRate.NORMAL,
  ].toSet();

  ///Gets a possible [CygnusScrollViewDecelerationRate] instance from [String] value.
  static CygnusScrollViewDecelerationRate? fromValue(String? value) {
    if (value != null) {
      try {
        return CygnusScrollViewDecelerationRate.values.firstWhere(
          (element) => element.toValue() == value,
        );
      } catch (e) {
        return null;
      }
    }
    return null;
  }

  ///Gets a possible [CygnusScrollViewDecelerationRate] instance from a native value.
  static CygnusScrollViewDecelerationRate? fromNativeValue(String? value) {
    if (value != null) {
      try {
        return CygnusScrollViewDecelerationRate.values.firstWhere(
          (element) => element.toNativeValue() == value,
        );
      } catch (e) {
        return null;
      }
    }
    return null;
  }

  /// Gets a possible [CygnusScrollViewDecelerationRate] instance value with name [name].
  ///
  /// Goes through [CygnusScrollViewDecelerationRate.values] looking for a value with
  /// name [name], as reported by [CygnusScrollViewDecelerationRate.name].
  /// Returns the first value with the given name, otherwise `null`.
  static CygnusScrollViewDecelerationRate? byName(String? name) {
    if (name != null) {
      try {
        return CygnusScrollViewDecelerationRate.values.firstWhere(
          (element) => element.name() == name,
        );
      } catch (e) {
        return null;
      }
    }
    return null;
  }

  /// Creates a map from the names of [CygnusScrollViewDecelerationRate] values to the values.
  ///
  /// The collection that this method is called on is expected to have
  /// values with distinct names, like the `values` list of an enum class.
  /// Only one value for each name can occur in the created map,
  /// so if two or more values have the same name (either being the
  /// same value, or being values of different enum type), at most one of
  /// them will be represented in the returned map.
  static Map<String, CygnusScrollViewDecelerationRate> asNameMap() =>
      <String, CygnusScrollViewDecelerationRate>{
        for (final value in CygnusScrollViewDecelerationRate.values)
          value.name(): value,
      };

  ///Gets [String] value.
  String toValue() => _value;

  ///Gets [String] native value if supported by the current platform, otherwise `null`.
  String? toNativeValue() => _nativeValue;

  ///Gets the name of the value.
  String name() {
    switch (_value) {
      case 'FAST':
        return 'FAST';
      case 'NORMAL':
        return 'NORMAL';
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

///Class that represents a floating-point value that determines the rate of deceleration after the user lifts their finger.
///Use [CygnusScrollViewDecelerationRate] instead.
@Deprecated('Use CygnusScrollViewDecelerationRate instead')
class CygnusIOSUIScrollViewDecelerationRate {
  final String _value;
  final String? _nativeValue;
  const CygnusIOSUIScrollViewDecelerationRate._internal(
    this._value,
    this._nativeValue,
  );
  // ignore: unused_element
  factory CygnusIOSUIScrollViewDecelerationRate._internalMultiPlatform(
    String value,
    Function nativeValue,
  ) => CygnusIOSUIScrollViewDecelerationRate._internal(value, nativeValue());

  ///A fast deceleration rate for a scroll view: `0.99`.
  static const FAST = CygnusIOSUIScrollViewDecelerationRate._internal(
    'FAST',
    'FAST',
  );

  ///The default deceleration rate for a scroll view: `0.998`.
  static const NORMAL = CygnusIOSUIScrollViewDecelerationRate._internal(
    'NORMAL',
    'NORMAL',
  );

  ///Set of all values of [CygnusIOSUIScrollViewDecelerationRate].
  static final Set<CygnusIOSUIScrollViewDecelerationRate> values = [
    CygnusIOSUIScrollViewDecelerationRate.FAST,
    CygnusIOSUIScrollViewDecelerationRate.NORMAL,
  ].toSet();

  ///Gets a possible [CygnusIOSUIScrollViewDecelerationRate] instance from [String] value.
  static CygnusIOSUIScrollViewDecelerationRate? fromValue(String? value) {
    if (value != null) {
      try {
        return CygnusIOSUIScrollViewDecelerationRate.values.firstWhere(
          (element) => element.toValue() == value,
        );
      } catch (e) {
        return null;
      }
    }
    return null;
  }

  ///Gets a possible [CygnusIOSUIScrollViewDecelerationRate] instance from a native value.
  static CygnusIOSUIScrollViewDecelerationRate? fromNativeValue(String? value) {
    if (value != null) {
      try {
        return CygnusIOSUIScrollViewDecelerationRate.values.firstWhere(
          (element) => element.toNativeValue() == value,
        );
      } catch (e) {
        return null;
      }
    }
    return null;
  }

  /// Gets a possible [CygnusIOSUIScrollViewDecelerationRate] instance value with name [name].
  ///
  /// Goes through [CygnusIOSUIScrollViewDecelerationRate.values] looking for a value with
  /// name [name], as reported by [CygnusIOSUIScrollViewDecelerationRate.name].
  /// Returns the first value with the given name, otherwise `null`.
  static CygnusIOSUIScrollViewDecelerationRate? byName(String? name) {
    if (name != null) {
      try {
        return CygnusIOSUIScrollViewDecelerationRate.values.firstWhere(
          (element) => element.name() == name,
        );
      } catch (e) {
        return null;
      }
    }
    return null;
  }

  /// Creates a map from the names of [CygnusIOSUIScrollViewDecelerationRate] values to the values.
  ///
  /// The collection that this method is called on is expected to have
  /// values with distinct names, like the `values` list of an enum class.
  /// Only one value for each name can occur in the created map,
  /// so if two or more values have the same name (either being the
  /// same value, or being values of different enum type), at most one of
  /// them will be represented in the returned map.
  static Map<String, CygnusIOSUIScrollViewDecelerationRate> asNameMap() =>
      <String, CygnusIOSUIScrollViewDecelerationRate>{
        for (final value in CygnusIOSUIScrollViewDecelerationRate.values)
          value.name(): value,
      };

  ///Gets [String] value.
  String toValue() => _value;

  ///Gets [String] native value if supported by the current platform, otherwise `null`.
  String? toNativeValue() => _nativeValue;

  ///Gets the name of the value.
  String name() {
    switch (_value) {
      case 'FAST':
        return 'FAST';
      case 'NORMAL':
        return 'NORMAL';
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
