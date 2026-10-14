import 'package:flutter_inappwebview_internal_annotations/flutter_inappwebview_internal_annotations.dart';

part 'website_data_type.g.dart';

///Class that represents a website data type.
@ExchangeableEnum()
class CygnusWebsiteDataType_ {
  // ignore: unused_field
  final String _value;
  const CygnusWebsiteDataType_._internal(this._value);

  ///On-disk Fetch caches.
  ///
  ///**NOTE**: available on iOS 11.3+.
  static const WKWebsiteDataTypeFetchCache = const CygnusWebsiteDataType_._internal(
    "WKWebsiteDataTypeFetchCache",
  );

  ///On-disk caches.
  static const WKWebsiteDataTypeDiskCache = const CygnusWebsiteDataType_._internal(
    "WKWebsiteDataTypeDiskCache",
  );

  ///In-memory caches.
  static const WKWebsiteDataTypeMemoryCache = const CygnusWebsiteDataType_._internal(
    "WKWebsiteDataTypeMemoryCache",
  );

  ///HTML offline web application caches.
  static const WKWebsiteDataTypeOfflineWebApplicationCache =
      const CygnusWebsiteDataType_._internal(
        "WKWebsiteDataTypeOfflineWebApplicationCache",
      );

  ///Cookies.
  static const WKWebsiteDataTypeCookies = const CygnusWebsiteDataType_._internal(
    "WKWebsiteDataTypeCookies",
  );

  ///HTML session storage.
  static const WKWebsiteDataTypeSessionStorage =
      const CygnusWebsiteDataType_._internal("WKWebsiteDataTypeSessionStorage");

  ///HTML local storage.
  static const WKWebsiteDataTypeLocalStorage = const CygnusWebsiteDataType_._internal(
    "WKWebsiteDataTypeLocalStorage",
  );

  ///WebSQL databases.
  static const WKWebsiteDataTypeWebSQLDatabases =
      const CygnusWebsiteDataType_._internal("WKWebsiteDataTypeWebSQLDatabases");

  ///IndexedDB databases.
  static const WKWebsiteDataTypeIndexedDBDatabases =
      const CygnusWebsiteDataType_._internal("WKWebsiteDataTypeIndexedDBDatabases");

  ///Service worker registrations.
  ///
  ///**NOTE**: available on iOS 11.3+.
  static const WKWebsiteDataTypeServiceWorkerRegistrations =
      const CygnusWebsiteDataType_._internal(
        "WKWebsiteDataTypeServiceWorkerRegistrations",
      );

  ///Returns a set of all available website data types.
  @ExchangeableEnumCustomValue()
  // ignore: non_constant_identifier_names
  static final Set<CygnusWebsiteDataType_> ALL = [
    CygnusWebsiteDataType_.WKWebsiteDataTypeFetchCache,
    CygnusWebsiteDataType_.WKWebsiteDataTypeDiskCache,
    CygnusWebsiteDataType_.WKWebsiteDataTypeMemoryCache,
    CygnusWebsiteDataType_.WKWebsiteDataTypeOfflineWebApplicationCache,
    CygnusWebsiteDataType_.WKWebsiteDataTypeCookies,
    CygnusWebsiteDataType_.WKWebsiteDataTypeSessionStorage,
    CygnusWebsiteDataType_.WKWebsiteDataTypeLocalStorage,
    CygnusWebsiteDataType_.WKWebsiteDataTypeWebSQLDatabases,
    CygnusWebsiteDataType_.WKWebsiteDataTypeIndexedDBDatabases,
    CygnusWebsiteDataType_.WKWebsiteDataTypeServiceWorkerRegistrations,
  ].toSet();
}

///Class that represents a website data type.
///
///**NOTE**: available on iOS 9.0+.
///
///Use [CygnusWebsiteDataType] instead.
@Deprecated("Use CygnusWebsiteDataType instead")
@ExchangeableEnum()
class CygnusIOSWKWebsiteDataType_ {
  // ignore: unused_field
  final String _value;
  const CygnusIOSWKWebsiteDataType_._internal(this._value);

  ///On-disk Fetch caches.
  ///
  ///**NOTE**: available on iOS 11.3+.
  static const WKWebsiteDataTypeFetchCache =
      const CygnusIOSWKWebsiteDataType_._internal("WKWebsiteDataTypeFetchCache");

  ///On-disk caches.
  static const WKWebsiteDataTypeDiskCache =
      const CygnusIOSWKWebsiteDataType_._internal("WKWebsiteDataTypeDiskCache");

  ///In-memory caches.
  static const WKWebsiteDataTypeMemoryCache =
      const CygnusIOSWKWebsiteDataType_._internal("WKWebsiteDataTypeMemoryCache");

  ///HTML offline web application caches.
  static const WKWebsiteDataTypeOfflineWebApplicationCache =
      const CygnusIOSWKWebsiteDataType_._internal(
        "WKWebsiteDataTypeOfflineWebApplicationCache",
      );

  ///Cookies.
  static const WKWebsiteDataTypeCookies = const CygnusIOSWKWebsiteDataType_._internal(
    "WKWebsiteDataTypeCookies",
  );

  ///HTML session storage.
  static const WKWebsiteDataTypeSessionStorage =
      const CygnusIOSWKWebsiteDataType_._internal("WKWebsiteDataTypeSessionStorage");

  ///HTML local storage.
  static const WKWebsiteDataTypeLocalStorage =
      const CygnusIOSWKWebsiteDataType_._internal("WKWebsiteDataTypeLocalStorage");

  ///WebSQL databases.
  static const WKWebsiteDataTypeWebSQLDatabases =
      const CygnusIOSWKWebsiteDataType_._internal("WKWebsiteDataTypeWebSQLDatabases");

  ///IndexedDB databases.
  static const WKWebsiteDataTypeIndexedDBDatabases =
      const CygnusIOSWKWebsiteDataType_._internal(
        "WKWebsiteDataTypeIndexedDBDatabases",
      );

  ///Service worker registrations.
  ///
  ///**NOTE**: available on iOS 11.3+.
  static const WKWebsiteDataTypeServiceWorkerRegistrations =
      const CygnusIOSWKWebsiteDataType_._internal(
        "WKWebsiteDataTypeServiceWorkerRegistrations",
      );

  ///Returns a set of all available website data types.
  @ExchangeableEnumCustomValue()
  // ignore: non_constant_identifier_names
  static final Set<CygnusIOSWKWebsiteDataType_> ALL = [
    CygnusIOSWKWebsiteDataType_.WKWebsiteDataTypeFetchCache,
    CygnusIOSWKWebsiteDataType_.WKWebsiteDataTypeDiskCache,
    CygnusIOSWKWebsiteDataType_.WKWebsiteDataTypeMemoryCache,
    CygnusIOSWKWebsiteDataType_.WKWebsiteDataTypeOfflineWebApplicationCache,
    CygnusIOSWKWebsiteDataType_.WKWebsiteDataTypeCookies,
    CygnusIOSWKWebsiteDataType_.WKWebsiteDataTypeSessionStorage,
    CygnusIOSWKWebsiteDataType_.WKWebsiteDataTypeLocalStorage,
    CygnusIOSWKWebsiteDataType_.WKWebsiteDataTypeWebSQLDatabases,
    CygnusIOSWKWebsiteDataType_.WKWebsiteDataTypeIndexedDBDatabases,
    CygnusIOSWKWebsiteDataType_.WKWebsiteDataTypeServiceWorkerRegistrations,
  ].toSet();
}
