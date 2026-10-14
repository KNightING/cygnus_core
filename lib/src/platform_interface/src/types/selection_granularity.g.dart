// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'selection_granularity.dart';

// **************************************************************************
// ExchangeableEnumGenerator
// **************************************************************************

///Class used to set the level of granularity with which the user can interactively select content in the web view.
class CygnusSelectionGranularity {
  final int _value;
  final int? _nativeValue;
  const CygnusSelectionGranularity._internal(this._value, this._nativeValue);
  // ignore: unused_element
  factory CygnusSelectionGranularity._internalMultiPlatform(
    int value,
    Function nativeValue,
  ) => CygnusSelectionGranularity._internal(value, nativeValue());

  ///Selection endpoints can be placed at any character boundary.
  static const CHARACTER = CygnusSelectionGranularity._internal(1, 1);

  ///Selection granularity varies automatically based on the selection.
  static const DYNAMIC = CygnusSelectionGranularity._internal(0, 0);

  ///Set of all values of [CygnusSelectionGranularity].
  static final Set<CygnusSelectionGranularity> values = [
    CygnusSelectionGranularity.CHARACTER,
    CygnusSelectionGranularity.DYNAMIC,
  ].toSet();

  ///Gets a possible [CygnusSelectionGranularity] instance from [int] value.
  static CygnusSelectionGranularity? fromValue(int? value) {
    if (value != null) {
      try {
        return CygnusSelectionGranularity.values.firstWhere(
          (element) => element.toValue() == value,
        );
      } catch (e) {
        return null;
      }
    }
    return null;
  }

  ///Gets a possible [CygnusSelectionGranularity] instance from a native value.
  static CygnusSelectionGranularity? fromNativeValue(int? value) {
    if (value != null) {
      try {
        return CygnusSelectionGranularity.values.firstWhere(
          (element) => element.toNativeValue() == value,
        );
      } catch (e) {
        return null;
      }
    }
    return null;
  }

  /// Gets a possible [CygnusSelectionGranularity] instance value with name [name].
  ///
  /// Goes through [CygnusSelectionGranularity.values] looking for a value with
  /// name [name], as reported by [CygnusSelectionGranularity.name].
  /// Returns the first value with the given name, otherwise `null`.
  static CygnusSelectionGranularity? byName(String? name) {
    if (name != null) {
      try {
        return CygnusSelectionGranularity.values.firstWhere(
          (element) => element.name() == name,
        );
      } catch (e) {
        return null;
      }
    }
    return null;
  }

  /// Creates a map from the names of [CygnusSelectionGranularity] values to the values.
  ///
  /// The collection that this method is called on is expected to have
  /// values with distinct names, like the `values` list of an enum class.
  /// Only one value for each name can occur in the created map,
  /// so if two or more values have the same name (either being the
  /// same value, or being values of different enum type), at most one of
  /// them will be represented in the returned map.
  static Map<String, CygnusSelectionGranularity> asNameMap() =>
      <String, CygnusSelectionGranularity>{
        for (final value in CygnusSelectionGranularity.values)
          value.name(): value,
      };

  ///Gets [int] value.
  int toValue() => _value;

  ///Gets [int] native value if supported by the current platform, otherwise `null`.
  int? toNativeValue() => _nativeValue;

  ///Gets the name of the value.
  String name() {
    switch (_value) {
      case 1:
        return 'CHARACTER';
      case 0:
        return 'DYNAMIC';
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

///An iOS-specific class used to set the level of granularity with which the user can interactively select content in the web view.
///Use [CygnusSelectionGranularity] instead.
@Deprecated('Use CygnusSelectionGranularity instead')
class CygnusIOSWKSelectionGranularity {
  final int _value;
  final int? _nativeValue;
  const CygnusIOSWKSelectionGranularity._internal(
    this._value,
    this._nativeValue,
  );
  // ignore: unused_element
  factory CygnusIOSWKSelectionGranularity._internalMultiPlatform(
    int value,
    Function nativeValue,
  ) => CygnusIOSWKSelectionGranularity._internal(value, nativeValue());

  ///Selection endpoints can be placed at any character boundary.
  static const CHARACTER = CygnusIOSWKSelectionGranularity._internal(1, 1);

  ///Selection granularity varies automatically based on the selection.
  static const DYNAMIC = CygnusIOSWKSelectionGranularity._internal(0, 0);

  ///Set of all values of [CygnusIOSWKSelectionGranularity].
  static final Set<CygnusIOSWKSelectionGranularity> values = [
    CygnusIOSWKSelectionGranularity.CHARACTER,
    CygnusIOSWKSelectionGranularity.DYNAMIC,
  ].toSet();

  ///Gets a possible [CygnusIOSWKSelectionGranularity] instance from [int] value.
  static CygnusIOSWKSelectionGranularity? fromValue(int? value) {
    if (value != null) {
      try {
        return CygnusIOSWKSelectionGranularity.values.firstWhere(
          (element) => element.toValue() == value,
        );
      } catch (e) {
        return null;
      }
    }
    return null;
  }

  ///Gets a possible [CygnusIOSWKSelectionGranularity] instance from a native value.
  static CygnusIOSWKSelectionGranularity? fromNativeValue(int? value) {
    if (value != null) {
      try {
        return CygnusIOSWKSelectionGranularity.values.firstWhere(
          (element) => element.toNativeValue() == value,
        );
      } catch (e) {
        return null;
      }
    }
    return null;
  }

  /// Gets a possible [CygnusIOSWKSelectionGranularity] instance value with name [name].
  ///
  /// Goes through [CygnusIOSWKSelectionGranularity.values] looking for a value with
  /// name [name], as reported by [CygnusIOSWKSelectionGranularity.name].
  /// Returns the first value with the given name, otherwise `null`.
  static CygnusIOSWKSelectionGranularity? byName(String? name) {
    if (name != null) {
      try {
        return CygnusIOSWKSelectionGranularity.values.firstWhere(
          (element) => element.name() == name,
        );
      } catch (e) {
        return null;
      }
    }
    return null;
  }

  /// Creates a map from the names of [CygnusIOSWKSelectionGranularity] values to the values.
  ///
  /// The collection that this method is called on is expected to have
  /// values with distinct names, like the `values` list of an enum class.
  /// Only one value for each name can occur in the created map,
  /// so if two or more values have the same name (either being the
  /// same value, or being values of different enum type), at most one of
  /// them will be represented in the returned map.
  static Map<String, CygnusIOSWKSelectionGranularity> asNameMap() =>
      <String, CygnusIOSWKSelectionGranularity>{
        for (final value in CygnusIOSWKSelectionGranularity.values)
          value.name(): value,
      };

  ///Gets [int] value.
  int toValue() => _value;

  ///Gets [int] native value if supported by the current platform, otherwise `null`.
  int? toNativeValue() => _nativeValue;

  ///Gets the name of the value.
  String name() {
    switch (_value) {
      case 1:
        return 'CHARACTER';
      case 0:
        return 'DYNAMIC';
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
