// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pull_to_refresh_size.dart';

// **************************************************************************
// ExchangeableEnumGenerator
// **************************************************************************

///Class representing the size of the refresh indicator.
class CygnusPullToRefreshSize {
  final int _value;
  final int? _nativeValue;
  const CygnusPullToRefreshSize._internal(this._value, this._nativeValue);
  // ignore: unused_element
  factory CygnusPullToRefreshSize._internalMultiPlatform(
    int value,
    Function nativeValue,
  ) => CygnusPullToRefreshSize._internal(value, nativeValue());

  ///Default size.
  static const DEFAULT = CygnusPullToRefreshSize._internal(1, 1);

  ///Large size.
  static const LARGE = CygnusPullToRefreshSize._internal(0, 0);

  ///Set of all values of [CygnusPullToRefreshSize].
  static final Set<CygnusPullToRefreshSize> values = [
    CygnusPullToRefreshSize.DEFAULT,
    CygnusPullToRefreshSize.LARGE,
  ].toSet();

  ///Gets a possible [CygnusPullToRefreshSize] instance from [int] value.
  static CygnusPullToRefreshSize? fromValue(int? value) {
    if (value != null) {
      try {
        return CygnusPullToRefreshSize.values.firstWhere(
          (element) => element.toValue() == value,
        );
      } catch (e) {
        return null;
      }
    }
    return null;
  }

  ///Gets a possible [CygnusPullToRefreshSize] instance from a native value.
  static CygnusPullToRefreshSize? fromNativeValue(int? value) {
    if (value != null) {
      try {
        return CygnusPullToRefreshSize.values.firstWhere(
          (element) => element.toNativeValue() == value,
        );
      } catch (e) {
        return null;
      }
    }
    return null;
  }

  /// Gets a possible [CygnusPullToRefreshSize] instance value with name [name].
  ///
  /// Goes through [CygnusPullToRefreshSize.values] looking for a value with
  /// name [name], as reported by [CygnusPullToRefreshSize.name].
  /// Returns the first value with the given name, otherwise `null`.
  static CygnusPullToRefreshSize? byName(String? name) {
    if (name != null) {
      try {
        return CygnusPullToRefreshSize.values.firstWhere(
          (element) => element.name() == name,
        );
      } catch (e) {
        return null;
      }
    }
    return null;
  }

  /// Creates a map from the names of [CygnusPullToRefreshSize] values to the values.
  ///
  /// The collection that this method is called on is expected to have
  /// values with distinct names, like the `values` list of an enum class.
  /// Only one value for each name can occur in the created map,
  /// so if two or more values have the same name (either being the
  /// same value, or being values of different enum type), at most one of
  /// them will be represented in the returned map.
  static Map<String, CygnusPullToRefreshSize> asNameMap() =>
      <String, CygnusPullToRefreshSize>{
        for (final value in CygnusPullToRefreshSize.values) value.name(): value,
      };

  ///Gets [int] value.
  int toValue() => _value;

  ///Gets [int] native value if supported by the current platform, otherwise `null`.
  int? toNativeValue() => _nativeValue;

  ///Gets the name of the value.
  String name() {
    switch (_value) {
      case 1:
        return 'DEFAULT';
      case 0:
        return 'LARGE';
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

///Android-specific class representing the size of the refresh indicator.
///Use [CygnusPullToRefreshSize] instead.
@Deprecated('Use CygnusPullToRefreshSize instead')
class CygnusAndroidPullToRefreshSize {
  final int _value;
  final int? _nativeValue;
  const CygnusAndroidPullToRefreshSize._internal(
    this._value,
    this._nativeValue,
  );
  // ignore: unused_element
  factory CygnusAndroidPullToRefreshSize._internalMultiPlatform(
    int value,
    Function nativeValue,
  ) => CygnusAndroidPullToRefreshSize._internal(value, nativeValue());

  ///Default size.
  static const DEFAULT = CygnusAndroidPullToRefreshSize._internal(1, 1);

  ///Large size.
  static const LARGE = CygnusAndroidPullToRefreshSize._internal(0, 0);

  ///Set of all values of [CygnusAndroidPullToRefreshSize].
  static final Set<CygnusAndroidPullToRefreshSize> values = [
    CygnusAndroidPullToRefreshSize.DEFAULT,
    CygnusAndroidPullToRefreshSize.LARGE,
  ].toSet();

  ///Gets a possible [CygnusAndroidPullToRefreshSize] instance from [int] value.
  static CygnusAndroidPullToRefreshSize? fromValue(int? value) {
    if (value != null) {
      try {
        return CygnusAndroidPullToRefreshSize.values.firstWhere(
          (element) => element.toValue() == value,
        );
      } catch (e) {
        return null;
      }
    }
    return null;
  }

  ///Gets a possible [CygnusAndroidPullToRefreshSize] instance from a native value.
  static CygnusAndroidPullToRefreshSize? fromNativeValue(int? value) {
    if (value != null) {
      try {
        return CygnusAndroidPullToRefreshSize.values.firstWhere(
          (element) => element.toNativeValue() == value,
        );
      } catch (e) {
        return null;
      }
    }
    return null;
  }

  /// Gets a possible [CygnusAndroidPullToRefreshSize] instance value with name [name].
  ///
  /// Goes through [CygnusAndroidPullToRefreshSize.values] looking for a value with
  /// name [name], as reported by [CygnusAndroidPullToRefreshSize.name].
  /// Returns the first value with the given name, otherwise `null`.
  static CygnusAndroidPullToRefreshSize? byName(String? name) {
    if (name != null) {
      try {
        return CygnusAndroidPullToRefreshSize.values.firstWhere(
          (element) => element.name() == name,
        );
      } catch (e) {
        return null;
      }
    }
    return null;
  }

  /// Creates a map from the names of [CygnusAndroidPullToRefreshSize] values to the values.
  ///
  /// The collection that this method is called on is expected to have
  /// values with distinct names, like the `values` list of an enum class.
  /// Only one value for each name can occur in the created map,
  /// so if two or more values have the same name (either being the
  /// same value, or being values of different enum type), at most one of
  /// them will be represented in the returned map.
  static Map<String, CygnusAndroidPullToRefreshSize> asNameMap() =>
      <String, CygnusAndroidPullToRefreshSize>{
        for (final value in CygnusAndroidPullToRefreshSize.values)
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
        return 'DEFAULT';
      case 0:
        return 'LARGE';
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
