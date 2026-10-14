// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'web_storage_type.dart';

// **************************************************************************
// ExchangeableEnumGenerator
// **************************************************************************

///Class that represents the type of Web CygnusStorage: `localStorage` or `sessionStorage`.
///Used by the [CygnusPlatformStorage] class.
class CygnusWebStorageType {
  final String _value;
  final String? _nativeValue;
  const CygnusWebStorageType._internal(this._value, this._nativeValue);
  // ignore: unused_element
  factory CygnusWebStorageType._internalMultiPlatform(
    String value,
    Function nativeValue,
  ) => CygnusWebStorageType._internal(value, nativeValue());

  ///`window.localStorage`: same as [SESSION_STORAGE], but persists even when the browser is closed and reopened.
  static const LOCAL_STORAGE = CygnusWebStorageType._internal(
    'localStorage',
    'localStorage',
  );

  ///`window.sessionStorage`: maintains a separate storage area for each given origin that's available for the duration
  ///of the page session (as long as the browser is open, including page reloads and restores).
  static const SESSION_STORAGE = CygnusWebStorageType._internal(
    'sessionStorage',
    'sessionStorage',
  );

  ///Set of all values of [CygnusWebStorageType].
  static final Set<CygnusWebStorageType> values = [
    CygnusWebStorageType.LOCAL_STORAGE,
    CygnusWebStorageType.SESSION_STORAGE,
  ].toSet();

  ///Gets a possible [CygnusWebStorageType] instance from [String] value.
  static CygnusWebStorageType? fromValue(String? value) {
    if (value != null) {
      try {
        return CygnusWebStorageType.values.firstWhere(
          (element) => element.toValue() == value,
        );
      } catch (e) {
        return null;
      }
    }
    return null;
  }

  ///Gets a possible [CygnusWebStorageType] instance from a native value.
  static CygnusWebStorageType? fromNativeValue(String? value) {
    if (value != null) {
      try {
        return CygnusWebStorageType.values.firstWhere(
          (element) => element.toNativeValue() == value,
        );
      } catch (e) {
        return null;
      }
    }
    return null;
  }

  /// Gets a possible [CygnusWebStorageType] instance value with name [name].
  ///
  /// Goes through [CygnusWebStorageType.values] looking for a value with
  /// name [name], as reported by [CygnusWebStorageType.name].
  /// Returns the first value with the given name, otherwise `null`.
  static CygnusWebStorageType? byName(String? name) {
    if (name != null) {
      try {
        return CygnusWebStorageType.values.firstWhere(
          (element) => element.name() == name,
        );
      } catch (e) {
        return null;
      }
    }
    return null;
  }

  /// Creates a map from the names of [CygnusWebStorageType] values to the values.
  ///
  /// The collection that this method is called on is expected to have
  /// values with distinct names, like the `values` list of an enum class.
  /// Only one value for each name can occur in the created map,
  /// so if two or more values have the same name (either being the
  /// same value, or being values of different enum type), at most one of
  /// them will be represented in the returned map.
  static Map<String, CygnusWebStorageType> asNameMap() =>
      <String, CygnusWebStorageType>{
        for (final value in CygnusWebStorageType.values) value.name(): value,
      };

  ///Gets [String] value.
  String toValue() => _value;

  ///Gets [String] native value if supported by the current platform, otherwise `null`.
  String? toNativeValue() => _nativeValue;

  ///Gets the name of the value.
  String name() {
    switch (_value) {
      case 'localStorage':
        return 'LOCAL_STORAGE';
      case 'sessionStorage':
        return 'SESSION_STORAGE';
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
