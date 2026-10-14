// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'website_data_type.dart';

// **************************************************************************
// ExchangeableEnumGenerator
// **************************************************************************

///Class that represents a website data type.
class CygnusWebsiteDataType {
  final String _value;
  final String? _nativeValue;
  const CygnusWebsiteDataType._internal(this._value, this._nativeValue);
  // ignore: unused_element
  factory CygnusWebsiteDataType._internalMultiPlatform(
    String value,
    Function nativeValue,
  ) => CygnusWebsiteDataType._internal(value, nativeValue());

  ///Returns a set of all available website data types.
  static final ALL = [
    CygnusWebsiteDataType.WKWebsiteDataTypeFetchCache,
    CygnusWebsiteDataType.WKWebsiteDataTypeDiskCache,
    CygnusWebsiteDataType.WKWebsiteDataTypeMemoryCache,
    CygnusWebsiteDataType.WKWebsiteDataTypeOfflineWebApplicationCache,
    CygnusWebsiteDataType.WKWebsiteDataTypeCookies,
    CygnusWebsiteDataType.WKWebsiteDataTypeSessionStorage,
    CygnusWebsiteDataType.WKWebsiteDataTypeLocalStorage,
    CygnusWebsiteDataType.WKWebsiteDataTypeWebSQLDatabases,
    CygnusWebsiteDataType.WKWebsiteDataTypeIndexedDBDatabases,
    CygnusWebsiteDataType.WKWebsiteDataTypeServiceWorkerRegistrations,
  ].toSet();

  ///Cookies.
  static const WKWebsiteDataTypeCookies = CygnusWebsiteDataType._internal(
    'WKWebsiteDataTypeCookies',
    'WKWebsiteDataTypeCookies',
  );

  ///On-disk caches.
  static const WKWebsiteDataTypeDiskCache = CygnusWebsiteDataType._internal(
    'WKWebsiteDataTypeDiskCache',
    'WKWebsiteDataTypeDiskCache',
  );

  ///On-disk Fetch caches.
  ///
  ///**NOTE**: available on iOS 11.3+.
  static const WKWebsiteDataTypeFetchCache = CygnusWebsiteDataType._internal(
    'WKWebsiteDataTypeFetchCache',
    'WKWebsiteDataTypeFetchCache',
  );

  ///IndexedDB databases.
  static const WKWebsiteDataTypeIndexedDBDatabases =
      CygnusWebsiteDataType._internal(
        'WKWebsiteDataTypeIndexedDBDatabases',
        'WKWebsiteDataTypeIndexedDBDatabases',
      );

  ///HTML local storage.
  static const WKWebsiteDataTypeLocalStorage = CygnusWebsiteDataType._internal(
    'WKWebsiteDataTypeLocalStorage',
    'WKWebsiteDataTypeLocalStorage',
  );

  ///In-memory caches.
  static const WKWebsiteDataTypeMemoryCache = CygnusWebsiteDataType._internal(
    'WKWebsiteDataTypeMemoryCache',
    'WKWebsiteDataTypeMemoryCache',
  );

  ///HTML offline web application caches.
  static const WKWebsiteDataTypeOfflineWebApplicationCache =
      CygnusWebsiteDataType._internal(
        'WKWebsiteDataTypeOfflineWebApplicationCache',
        'WKWebsiteDataTypeOfflineWebApplicationCache',
      );

  ///Service worker registrations.
  ///
  ///**NOTE**: available on iOS 11.3+.
  static const WKWebsiteDataTypeServiceWorkerRegistrations =
      CygnusWebsiteDataType._internal(
        'WKWebsiteDataTypeServiceWorkerRegistrations',
        'WKWebsiteDataTypeServiceWorkerRegistrations',
      );

  ///HTML session storage.
  static const WKWebsiteDataTypeSessionStorage =
      CygnusWebsiteDataType._internal(
        'WKWebsiteDataTypeSessionStorage',
        'WKWebsiteDataTypeSessionStorage',
      );

  ///WebSQL databases.
  static const WKWebsiteDataTypeWebSQLDatabases =
      CygnusWebsiteDataType._internal(
        'WKWebsiteDataTypeWebSQLDatabases',
        'WKWebsiteDataTypeWebSQLDatabases',
      );

  ///Set of all values of [CygnusWebsiteDataType].
  static final Set<CygnusWebsiteDataType> values = [
    CygnusWebsiteDataType.WKWebsiteDataTypeCookies,
    CygnusWebsiteDataType.WKWebsiteDataTypeDiskCache,
    CygnusWebsiteDataType.WKWebsiteDataTypeFetchCache,
    CygnusWebsiteDataType.WKWebsiteDataTypeIndexedDBDatabases,
    CygnusWebsiteDataType.WKWebsiteDataTypeLocalStorage,
    CygnusWebsiteDataType.WKWebsiteDataTypeMemoryCache,
    CygnusWebsiteDataType.WKWebsiteDataTypeOfflineWebApplicationCache,
    CygnusWebsiteDataType.WKWebsiteDataTypeServiceWorkerRegistrations,
    CygnusWebsiteDataType.WKWebsiteDataTypeSessionStorage,
    CygnusWebsiteDataType.WKWebsiteDataTypeWebSQLDatabases,
  ].toSet();

  ///Gets a possible [CygnusWebsiteDataType] instance from [String] value.
  static CygnusWebsiteDataType? fromValue(String? value) {
    if (value != null) {
      try {
        return CygnusWebsiteDataType.values.firstWhere(
          (element) => element.toValue() == value,
        );
      } catch (e) {
        return null;
      }
    }
    return null;
  }

  ///Gets a possible [CygnusWebsiteDataType] instance from a native value.
  static CygnusWebsiteDataType? fromNativeValue(String? value) {
    if (value != null) {
      try {
        return CygnusWebsiteDataType.values.firstWhere(
          (element) => element.toNativeValue() == value,
        );
      } catch (e) {
        return null;
      }
    }
    return null;
  }

  /// Gets a possible [CygnusWebsiteDataType] instance value with name [name].
  ///
  /// Goes through [CygnusWebsiteDataType.values] looking for a value with
  /// name [name], as reported by [CygnusWebsiteDataType.name].
  /// Returns the first value with the given name, otherwise `null`.
  static CygnusWebsiteDataType? byName(String? name) {
    if (name != null) {
      try {
        return CygnusWebsiteDataType.values.firstWhere(
          (element) => element.name() == name,
        );
      } catch (e) {
        return null;
      }
    }
    return null;
  }

  /// Creates a map from the names of [CygnusWebsiteDataType] values to the values.
  ///
  /// The collection that this method is called on is expected to have
  /// values with distinct names, like the `values` list of an enum class.
  /// Only one value for each name can occur in the created map,
  /// so if two or more values have the same name (either being the
  /// same value, or being values of different enum type), at most one of
  /// them will be represented in the returned map.
  static Map<String, CygnusWebsiteDataType> asNameMap() =>
      <String, CygnusWebsiteDataType>{
        for (final value in CygnusWebsiteDataType.values) value.name(): value,
      };

  ///Gets [String] value.
  String toValue() => _value;

  ///Gets [String] native value if supported by the current platform, otherwise `null`.
  String? toNativeValue() => _nativeValue;

  ///Gets the name of the value.
  String name() {
    switch (_value) {
      case 'WKWebsiteDataTypeCookies':
        return 'WKWebsiteDataTypeCookies';
      case 'WKWebsiteDataTypeDiskCache':
        return 'WKWebsiteDataTypeDiskCache';
      case 'WKWebsiteDataTypeFetchCache':
        return 'WKWebsiteDataTypeFetchCache';
      case 'WKWebsiteDataTypeIndexedDBDatabases':
        return 'WKWebsiteDataTypeIndexedDBDatabases';
      case 'WKWebsiteDataTypeLocalStorage':
        return 'WKWebsiteDataTypeLocalStorage';
      case 'WKWebsiteDataTypeMemoryCache':
        return 'WKWebsiteDataTypeMemoryCache';
      case 'WKWebsiteDataTypeOfflineWebApplicationCache':
        return 'WKWebsiteDataTypeOfflineWebApplicationCache';
      case 'WKWebsiteDataTypeServiceWorkerRegistrations':
        return 'WKWebsiteDataTypeServiceWorkerRegistrations';
      case 'WKWebsiteDataTypeSessionStorage':
        return 'WKWebsiteDataTypeSessionStorage';
      case 'WKWebsiteDataTypeWebSQLDatabases':
        return 'WKWebsiteDataTypeWebSQLDatabases';
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

///Class that represents a website data type.
///
///**NOTE**: available on iOS 9.0+.
///
///Use [CygnusWebsiteDataType] instead.
@Deprecated('Use CygnusWebsiteDataType instead')
class CygnusIOSWKWebsiteDataType {
  final String _value;
  final String? _nativeValue;
  const CygnusIOSWKWebsiteDataType._internal(this._value, this._nativeValue);
  // ignore: unused_element
  factory CygnusIOSWKWebsiteDataType._internalMultiPlatform(
    String value,
    Function nativeValue,
  ) => CygnusIOSWKWebsiteDataType._internal(value, nativeValue());

  ///Returns a set of all available website data types.
  static final ALL = [
    CygnusIOSWKWebsiteDataType.WKWebsiteDataTypeFetchCache,
    CygnusIOSWKWebsiteDataType.WKWebsiteDataTypeDiskCache,
    CygnusIOSWKWebsiteDataType.WKWebsiteDataTypeMemoryCache,
    CygnusIOSWKWebsiteDataType.WKWebsiteDataTypeOfflineWebApplicationCache,
    CygnusIOSWKWebsiteDataType.WKWebsiteDataTypeCookies,
    CygnusIOSWKWebsiteDataType.WKWebsiteDataTypeSessionStorage,
    CygnusIOSWKWebsiteDataType.WKWebsiteDataTypeLocalStorage,
    CygnusIOSWKWebsiteDataType.WKWebsiteDataTypeWebSQLDatabases,
    CygnusIOSWKWebsiteDataType.WKWebsiteDataTypeIndexedDBDatabases,
    CygnusIOSWKWebsiteDataType.WKWebsiteDataTypeServiceWorkerRegistrations,
  ].toSet();

  ///Cookies.
  static const WKWebsiteDataTypeCookies = CygnusIOSWKWebsiteDataType._internal(
    'WKWebsiteDataTypeCookies',
    'WKWebsiteDataTypeCookies',
  );

  ///On-disk caches.
  static const WKWebsiteDataTypeDiskCache =
      CygnusIOSWKWebsiteDataType._internal(
        'WKWebsiteDataTypeDiskCache',
        'WKWebsiteDataTypeDiskCache',
      );

  ///On-disk Fetch caches.
  ///
  ///**NOTE**: available on iOS 11.3+.
  static const WKWebsiteDataTypeFetchCache =
      CygnusIOSWKWebsiteDataType._internal(
        'WKWebsiteDataTypeFetchCache',
        'WKWebsiteDataTypeFetchCache',
      );

  ///IndexedDB databases.
  static const WKWebsiteDataTypeIndexedDBDatabases =
      CygnusIOSWKWebsiteDataType._internal(
        'WKWebsiteDataTypeIndexedDBDatabases',
        'WKWebsiteDataTypeIndexedDBDatabases',
      );

  ///HTML local storage.
  static const WKWebsiteDataTypeLocalStorage =
      CygnusIOSWKWebsiteDataType._internal(
        'WKWebsiteDataTypeLocalStorage',
        'WKWebsiteDataTypeLocalStorage',
      );

  ///In-memory caches.
  static const WKWebsiteDataTypeMemoryCache =
      CygnusIOSWKWebsiteDataType._internal(
        'WKWebsiteDataTypeMemoryCache',
        'WKWebsiteDataTypeMemoryCache',
      );

  ///HTML offline web application caches.
  static const WKWebsiteDataTypeOfflineWebApplicationCache =
      CygnusIOSWKWebsiteDataType._internal(
        'WKWebsiteDataTypeOfflineWebApplicationCache',
        'WKWebsiteDataTypeOfflineWebApplicationCache',
      );

  ///Service worker registrations.
  ///
  ///**NOTE**: available on iOS 11.3+.
  static const WKWebsiteDataTypeServiceWorkerRegistrations =
      CygnusIOSWKWebsiteDataType._internal(
        'WKWebsiteDataTypeServiceWorkerRegistrations',
        'WKWebsiteDataTypeServiceWorkerRegistrations',
      );

  ///HTML session storage.
  static const WKWebsiteDataTypeSessionStorage =
      CygnusIOSWKWebsiteDataType._internal(
        'WKWebsiteDataTypeSessionStorage',
        'WKWebsiteDataTypeSessionStorage',
      );

  ///WebSQL databases.
  static const WKWebsiteDataTypeWebSQLDatabases =
      CygnusIOSWKWebsiteDataType._internal(
        'WKWebsiteDataTypeWebSQLDatabases',
        'WKWebsiteDataTypeWebSQLDatabases',
      );

  ///Set of all values of [CygnusIOSWKWebsiteDataType].
  static final Set<CygnusIOSWKWebsiteDataType> values = [
    CygnusIOSWKWebsiteDataType.WKWebsiteDataTypeCookies,
    CygnusIOSWKWebsiteDataType.WKWebsiteDataTypeDiskCache,
    CygnusIOSWKWebsiteDataType.WKWebsiteDataTypeFetchCache,
    CygnusIOSWKWebsiteDataType.WKWebsiteDataTypeIndexedDBDatabases,
    CygnusIOSWKWebsiteDataType.WKWebsiteDataTypeLocalStorage,
    CygnusIOSWKWebsiteDataType.WKWebsiteDataTypeMemoryCache,
    CygnusIOSWKWebsiteDataType.WKWebsiteDataTypeOfflineWebApplicationCache,
    CygnusIOSWKWebsiteDataType.WKWebsiteDataTypeServiceWorkerRegistrations,
    CygnusIOSWKWebsiteDataType.WKWebsiteDataTypeSessionStorage,
    CygnusIOSWKWebsiteDataType.WKWebsiteDataTypeWebSQLDatabases,
  ].toSet();

  ///Gets a possible [CygnusIOSWKWebsiteDataType] instance from [String] value.
  static CygnusIOSWKWebsiteDataType? fromValue(String? value) {
    if (value != null) {
      try {
        return CygnusIOSWKWebsiteDataType.values.firstWhere(
          (element) => element.toValue() == value,
        );
      } catch (e) {
        return null;
      }
    }
    return null;
  }

  ///Gets a possible [CygnusIOSWKWebsiteDataType] instance from a native value.
  static CygnusIOSWKWebsiteDataType? fromNativeValue(String? value) {
    if (value != null) {
      try {
        return CygnusIOSWKWebsiteDataType.values.firstWhere(
          (element) => element.toNativeValue() == value,
        );
      } catch (e) {
        return null;
      }
    }
    return null;
  }

  /// Gets a possible [CygnusIOSWKWebsiteDataType] instance value with name [name].
  ///
  /// Goes through [CygnusIOSWKWebsiteDataType.values] looking for a value with
  /// name [name], as reported by [CygnusIOSWKWebsiteDataType.name].
  /// Returns the first value with the given name, otherwise `null`.
  static CygnusIOSWKWebsiteDataType? byName(String? name) {
    if (name != null) {
      try {
        return CygnusIOSWKWebsiteDataType.values.firstWhere(
          (element) => element.name() == name,
        );
      } catch (e) {
        return null;
      }
    }
    return null;
  }

  /// Creates a map from the names of [CygnusIOSWKWebsiteDataType] values to the values.
  ///
  /// The collection that this method is called on is expected to have
  /// values with distinct names, like the `values` list of an enum class.
  /// Only one value for each name can occur in the created map,
  /// so if two or more values have the same name (either being the
  /// same value, or being values of different enum type), at most one of
  /// them will be represented in the returned map.
  static Map<String, CygnusIOSWKWebsiteDataType> asNameMap() =>
      <String, CygnusIOSWKWebsiteDataType>{
        for (final value in CygnusIOSWKWebsiteDataType.values)
          value.name(): value,
      };

  ///Gets [String] value.
  String toValue() => _value;

  ///Gets [String] native value if supported by the current platform, otherwise `null`.
  String? toNativeValue() => _nativeValue;

  ///Gets the name of the value.
  String name() {
    switch (_value) {
      case 'WKWebsiteDataTypeCookies':
        return 'WKWebsiteDataTypeCookies';
      case 'WKWebsiteDataTypeDiskCache':
        return 'WKWebsiteDataTypeDiskCache';
      case 'WKWebsiteDataTypeFetchCache':
        return 'WKWebsiteDataTypeFetchCache';
      case 'WKWebsiteDataTypeIndexedDBDatabases':
        return 'WKWebsiteDataTypeIndexedDBDatabases';
      case 'WKWebsiteDataTypeLocalStorage':
        return 'WKWebsiteDataTypeLocalStorage';
      case 'WKWebsiteDataTypeMemoryCache':
        return 'WKWebsiteDataTypeMemoryCache';
      case 'WKWebsiteDataTypeOfflineWebApplicationCache':
        return 'WKWebsiteDataTypeOfflineWebApplicationCache';
      case 'WKWebsiteDataTypeServiceWorkerRegistrations':
        return 'WKWebsiteDataTypeServiceWorkerRegistrations';
      case 'WKWebsiteDataTypeSessionStorage':
        return 'WKWebsiteDataTypeSessionStorage';
      case 'WKWebsiteDataTypeWebSQLDatabases':
        return 'WKWebsiteDataTypeWebSQLDatabases';
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
