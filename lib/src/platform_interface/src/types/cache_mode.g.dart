// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cache_mode.dart';

// **************************************************************************
// ExchangeableEnumGenerator
// **************************************************************************

///Class used to override the way the cache is used.
class CygnusCacheMode {
  final int _value;
  final int? _nativeValue;
  const CygnusCacheMode._internal(this._value, this._nativeValue);
  // ignore: unused_element
  factory CygnusCacheMode._internalMultiPlatform(
    int value,
    Function nativeValue,
  ) => CygnusCacheMode._internal(value, nativeValue());

  ///Use cached resources when they are available, even if they have expired. Otherwise load resources from the network.
  static const LOAD_CACHE_ELSE_NETWORK = CygnusCacheMode._internal(1, 1);

  ///Don't use the network, load from the cache.
  static const LOAD_CACHE_ONLY = CygnusCacheMode._internal(3, 3);

  ///Default cache usage mode. If the navigation type doesn't impose any specific behavior,
  ///use cached resources when they are available and not expired, otherwise load resources from the network.
  static const LOAD_DEFAULT = CygnusCacheMode._internal(-1, -1);

  ///Don't use the cache, load from the network.
  static const LOAD_NO_CACHE = CygnusCacheMode._internal(2, 2);

  ///Set of all values of [CygnusCacheMode].
  static final Set<CygnusCacheMode> values = [
    CygnusCacheMode.LOAD_CACHE_ELSE_NETWORK,
    CygnusCacheMode.LOAD_CACHE_ONLY,
    CygnusCacheMode.LOAD_DEFAULT,
    CygnusCacheMode.LOAD_NO_CACHE,
  ].toSet();

  ///Gets a possible [CygnusCacheMode] instance from [int] value.
  static CygnusCacheMode? fromValue(int? value) {
    if (value != null) {
      try {
        return CygnusCacheMode.values.firstWhere(
          (element) => element.toValue() == value,
        );
      } catch (e) {
        return null;
      }
    }
    return null;
  }

  ///Gets a possible [CygnusCacheMode] instance from a native value.
  static CygnusCacheMode? fromNativeValue(int? value) {
    if (value != null) {
      try {
        return CygnusCacheMode.values.firstWhere(
          (element) => element.toNativeValue() == value,
        );
      } catch (e) {
        return null;
      }
    }
    return null;
  }

  /// Gets a possible [CygnusCacheMode] instance value with name [name].
  ///
  /// Goes through [CygnusCacheMode.values] looking for a value with
  /// name [name], as reported by [CygnusCacheMode.name].
  /// Returns the first value with the given name, otherwise `null`.
  static CygnusCacheMode? byName(String? name) {
    if (name != null) {
      try {
        return CygnusCacheMode.values.firstWhere(
          (element) => element.name() == name,
        );
      } catch (e) {
        return null;
      }
    }
    return null;
  }

  /// Creates a map from the names of [CygnusCacheMode] values to the values.
  ///
  /// The collection that this method is called on is expected to have
  /// values with distinct names, like the `values` list of an enum class.
  /// Only one value for each name can occur in the created map,
  /// so if two or more values have the same name (either being the
  /// same value, or being values of different enum type), at most one of
  /// them will be represented in the returned map.
  static Map<String, CygnusCacheMode> asNameMap() => <String, CygnusCacheMode>{
    for (final value in CygnusCacheMode.values) value.name(): value,
  };

  ///Gets [int] value.
  int toValue() => _value;

  ///Gets [int] native value if supported by the current platform, otherwise `null`.
  int? toNativeValue() => _nativeValue;

  ///Gets the name of the value.
  String name() {
    switch (_value) {
      case 1:
        return 'LOAD_CACHE_ELSE_NETWORK';
      case 3:
        return 'LOAD_CACHE_ONLY';
      case -1:
        return 'LOAD_DEFAULT';
      case 2:
        return 'LOAD_NO_CACHE';
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

///An Android-specific class used to override the way the cache is used.
///Use [CygnusCacheMode] instead.
@Deprecated('Use CygnusCacheMode instead')
class CygnusAndroidCacheMode {
  final int _value;
  final int? _nativeValue;
  const CygnusAndroidCacheMode._internal(this._value, this._nativeValue);
  // ignore: unused_element
  factory CygnusAndroidCacheMode._internalMultiPlatform(
    int value,
    Function nativeValue,
  ) => CygnusAndroidCacheMode._internal(value, nativeValue());

  ///Use cached resources when they are available, even if they have expired. Otherwise load resources from the network.
  static const LOAD_CACHE_ELSE_NETWORK = CygnusAndroidCacheMode._internal(1, 1);

  ///Don't use the network, load from the cache.
  static const LOAD_CACHE_ONLY = CygnusAndroidCacheMode._internal(3, 3);

  ///Default cache usage mode. If the navigation type doesn't impose any specific behavior,
  ///use cached resources when they are available and not expired, otherwise load resources from the network.
  static const LOAD_DEFAULT = CygnusAndroidCacheMode._internal(-1, -1);

  ///Don't use the cache, load from the network.
  static const LOAD_NO_CACHE = CygnusAndroidCacheMode._internal(2, 2);

  ///Set of all values of [CygnusAndroidCacheMode].
  static final Set<CygnusAndroidCacheMode> values = [
    CygnusAndroidCacheMode.LOAD_CACHE_ELSE_NETWORK,
    CygnusAndroidCacheMode.LOAD_CACHE_ONLY,
    CygnusAndroidCacheMode.LOAD_DEFAULT,
    CygnusAndroidCacheMode.LOAD_NO_CACHE,
  ].toSet();

  ///Gets a possible [CygnusAndroidCacheMode] instance from [int] value.
  static CygnusAndroidCacheMode? fromValue(int? value) {
    if (value != null) {
      try {
        return CygnusAndroidCacheMode.values.firstWhere(
          (element) => element.toValue() == value,
        );
      } catch (e) {
        return null;
      }
    }
    return null;
  }

  ///Gets a possible [CygnusAndroidCacheMode] instance from a native value.
  static CygnusAndroidCacheMode? fromNativeValue(int? value) {
    if (value != null) {
      try {
        return CygnusAndroidCacheMode.values.firstWhere(
          (element) => element.toNativeValue() == value,
        );
      } catch (e) {
        return null;
      }
    }
    return null;
  }

  /// Gets a possible [CygnusAndroidCacheMode] instance value with name [name].
  ///
  /// Goes through [CygnusAndroidCacheMode.values] looking for a value with
  /// name [name], as reported by [CygnusAndroidCacheMode.name].
  /// Returns the first value with the given name, otherwise `null`.
  static CygnusAndroidCacheMode? byName(String? name) {
    if (name != null) {
      try {
        return CygnusAndroidCacheMode.values.firstWhere(
          (element) => element.name() == name,
        );
      } catch (e) {
        return null;
      }
    }
    return null;
  }

  /// Creates a map from the names of [CygnusAndroidCacheMode] values to the values.
  ///
  /// The collection that this method is called on is expected to have
  /// values with distinct names, like the `values` list of an enum class.
  /// Only one value for each name can occur in the created map,
  /// so if two or more values have the same name (either being the
  /// same value, or being values of different enum type), at most one of
  /// them will be represented in the returned map.
  static Map<String, CygnusAndroidCacheMode> asNameMap() =>
      <String, CygnusAndroidCacheMode>{
        for (final value in CygnusAndroidCacheMode.values) value.name(): value,
      };

  ///Gets [int] value.
  int toValue() => _value;

  ///Gets [int] native value if supported by the current platform, otherwise `null`.
  int? toNativeValue() => _nativeValue;

  ///Gets the name of the value.
  String name() {
    switch (_value) {
      case 1:
        return 'LOAD_CACHE_ELSE_NETWORK';
      case 3:
        return 'LOAD_CACHE_ONLY';
      case -1:
        return 'LOAD_DEFAULT';
      case 2:
        return 'LOAD_NO_CACHE';
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
