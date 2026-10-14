// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'url_protection_space_proxy_type.dart';

// **************************************************************************
// ExchangeableEnumGenerator
// **************************************************************************

///Class that represents the supported proxy types.
class CygnusURLProtectionSpaceProxyType {
  final String _value;
  final String? _nativeValue;
  const CygnusURLProtectionSpaceProxyType._internal(
    this._value,
    this._nativeValue,
  );
  // ignore: unused_element
  factory CygnusURLProtectionSpaceProxyType._internalMultiPlatform(
    String value,
    Function nativeValue,
  ) => CygnusURLProtectionSpaceProxyType._internal(value, nativeValue());

  ///The proxy type for FTP proxies.
  static const URL_PROTECTION_SPACE_FTP_PROXY =
      CygnusURLProtectionSpaceProxyType._internal(
        'NSURLProtectionSpaceFTPProxy',
        'NSURLProtectionSpaceFTPProxy',
      );

  ///The proxy type for HTTPS proxies.
  static const URL_PROTECTION_SPACE_HTTPS_PROXY =
      CygnusURLProtectionSpaceProxyType._internal(
        'NSURLProtectionSpaceHTTPSProxy',
        'NSURLProtectionSpaceHTTPSProxy',
      );

  ///The proxy type for HTTP proxies.
  static const URL_PROTECTION_SPACE_HTTP_PROXY =
      CygnusURLProtectionSpaceProxyType._internal(
        'NSURLProtectionSpaceHTTPProxy',
        'NSURLProtectionSpaceHTTPProxy',
      );

  ///The proxy type for SOCKS proxies.
  static const URL_PROTECTION_SPACE_SOCKS_PROXY =
      CygnusURLProtectionSpaceProxyType._internal(
        'NSURLProtectionSpaceSOCKSProxy',
        'NSURLProtectionSpaceSOCKSProxy',
      );

  ///Set of all values of [CygnusURLProtectionSpaceProxyType].
  static final Set<CygnusURLProtectionSpaceProxyType> values = [
    CygnusURLProtectionSpaceProxyType.URL_PROTECTION_SPACE_FTP_PROXY,
    CygnusURLProtectionSpaceProxyType.URL_PROTECTION_SPACE_HTTPS_PROXY,
    CygnusURLProtectionSpaceProxyType.URL_PROTECTION_SPACE_HTTP_PROXY,
    CygnusURLProtectionSpaceProxyType.URL_PROTECTION_SPACE_SOCKS_PROXY,
  ].toSet();

  ///Gets a possible [CygnusURLProtectionSpaceProxyType] instance from [String] value.
  static CygnusURLProtectionSpaceProxyType? fromValue(String? value) {
    if (value != null) {
      try {
        return CygnusURLProtectionSpaceProxyType.values.firstWhere(
          (element) => element.toValue() == value,
        );
      } catch (e) {
        return null;
      }
    }
    return null;
  }

  ///Gets a possible [CygnusURLProtectionSpaceProxyType] instance from a native value.
  static CygnusURLProtectionSpaceProxyType? fromNativeValue(String? value) {
    if (value != null) {
      try {
        return CygnusURLProtectionSpaceProxyType.values.firstWhere(
          (element) => element.toNativeValue() == value,
        );
      } catch (e) {
        return null;
      }
    }
    return null;
  }

  /// Gets a possible [CygnusURLProtectionSpaceProxyType] instance value with name [name].
  ///
  /// Goes through [CygnusURLProtectionSpaceProxyType.values] looking for a value with
  /// name [name], as reported by [CygnusURLProtectionSpaceProxyType.name].
  /// Returns the first value with the given name, otherwise `null`.
  static CygnusURLProtectionSpaceProxyType? byName(String? name) {
    if (name != null) {
      try {
        return CygnusURLProtectionSpaceProxyType.values.firstWhere(
          (element) => element.name() == name,
        );
      } catch (e) {
        return null;
      }
    }
    return null;
  }

  /// Creates a map from the names of [CygnusURLProtectionSpaceProxyType] values to the values.
  ///
  /// The collection that this method is called on is expected to have
  /// values with distinct names, like the `values` list of an enum class.
  /// Only one value for each name can occur in the created map,
  /// so if two or more values have the same name (either being the
  /// same value, or being values of different enum type), at most one of
  /// them will be represented in the returned map.
  static Map<String, CygnusURLProtectionSpaceProxyType> asNameMap() =>
      <String, CygnusURLProtectionSpaceProxyType>{
        for (final value in CygnusURLProtectionSpaceProxyType.values)
          value.name(): value,
      };

  ///Gets [String] value.
  String toValue() => _value;

  ///Gets [String] native value if supported by the current platform, otherwise `null`.
  String? toNativeValue() => _nativeValue;

  ///Gets the name of the value.
  String name() {
    switch (_value) {
      case 'NSURLProtectionSpaceFTPProxy':
        return 'URL_PROTECTION_SPACE_FTP_PROXY';
      case 'NSURLProtectionSpaceHTTPSProxy':
        return 'URL_PROTECTION_SPACE_HTTPS_PROXY';
      case 'NSURLProtectionSpaceHTTPProxy':
        return 'URL_PROTECTION_SPACE_HTTP_PROXY';
      case 'NSURLProtectionSpaceSOCKSProxy':
        return 'URL_PROTECTION_SPACE_SOCKS_PROXY';
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
///Use [CygnusURLProtectionSpaceProxyType] instead.
@Deprecated('Use CygnusURLProtectionSpaceProxyType instead')
class CygnusIOSNSURLProtectionSpaceProxyType {
  final String _value;
  final String? _nativeValue;
  const CygnusIOSNSURLProtectionSpaceProxyType._internal(
    this._value,
    this._nativeValue,
  );
  // ignore: unused_element
  factory CygnusIOSNSURLProtectionSpaceProxyType._internalMultiPlatform(
    String value,
    Function nativeValue,
  ) => CygnusIOSNSURLProtectionSpaceProxyType._internal(value, nativeValue());

  ///The proxy type for FTP proxies.
  static const NSURL_PROTECTION_SPACE_FTP_PROXY =
      CygnusIOSNSURLProtectionSpaceProxyType._internal(
        'NSURLProtectionSpaceFTPProxy',
        'NSURLProtectionSpaceFTPProxy',
      );

  ///The proxy type for HTTPS proxies.
  static const NSURL_PROTECTION_SPACE_HTTPS_PROXY =
      CygnusIOSNSURLProtectionSpaceProxyType._internal(
        'NSURLProtectionSpaceHTTPSProxy',
        'NSURLProtectionSpaceHTTPSProxy',
      );

  ///The proxy type for SOCKS proxies.
  static const NSURL_PROTECTION_SPACE_SOCKS_PROXY =
      CygnusIOSNSURLProtectionSpaceProxyType._internal(
        'NSURLProtectionSpaceSOCKSProxy',
        'NSURLProtectionSpaceSOCKSProxy',
      );

  ///The proxy type for HTTP proxies.
  static const NSUR_PROTECTION_SPACE_HTTP_PROXY =
      CygnusIOSNSURLProtectionSpaceProxyType._internal(
        'NSURLProtectionSpaceHTTPProxy',
        'NSURLProtectionSpaceHTTPProxy',
      );

  ///Set of all values of [CygnusIOSNSURLProtectionSpaceProxyType].
  static final Set<CygnusIOSNSURLProtectionSpaceProxyType> values = [
    CygnusIOSNSURLProtectionSpaceProxyType.NSURL_PROTECTION_SPACE_FTP_PROXY,
    CygnusIOSNSURLProtectionSpaceProxyType.NSURL_PROTECTION_SPACE_HTTPS_PROXY,
    CygnusIOSNSURLProtectionSpaceProxyType.NSURL_PROTECTION_SPACE_SOCKS_PROXY,
    CygnusIOSNSURLProtectionSpaceProxyType.NSUR_PROTECTION_SPACE_HTTP_PROXY,
  ].toSet();

  ///Gets a possible [CygnusIOSNSURLProtectionSpaceProxyType] instance from [String] value.
  static CygnusIOSNSURLProtectionSpaceProxyType? fromValue(String? value) {
    if (value != null) {
      try {
        return CygnusIOSNSURLProtectionSpaceProxyType.values.firstWhere(
          (element) => element.toValue() == value,
        );
      } catch (e) {
        return null;
      }
    }
    return null;
  }

  ///Gets a possible [CygnusIOSNSURLProtectionSpaceProxyType] instance from a native value.
  static CygnusIOSNSURLProtectionSpaceProxyType? fromNativeValue(
    String? value,
  ) {
    if (value != null) {
      try {
        return CygnusIOSNSURLProtectionSpaceProxyType.values.firstWhere(
          (element) => element.toNativeValue() == value,
        );
      } catch (e) {
        return null;
      }
    }
    return null;
  }

  /// Gets a possible [CygnusIOSNSURLProtectionSpaceProxyType] instance value with name [name].
  ///
  /// Goes through [CygnusIOSNSURLProtectionSpaceProxyType.values] looking for a value with
  /// name [name], as reported by [CygnusIOSNSURLProtectionSpaceProxyType.name].
  /// Returns the first value with the given name, otherwise `null`.
  static CygnusIOSNSURLProtectionSpaceProxyType? byName(String? name) {
    if (name != null) {
      try {
        return CygnusIOSNSURLProtectionSpaceProxyType.values.firstWhere(
          (element) => element.name() == name,
        );
      } catch (e) {
        return null;
      }
    }
    return null;
  }

  /// Creates a map from the names of [CygnusIOSNSURLProtectionSpaceProxyType] values to the values.
  ///
  /// The collection that this method is called on is expected to have
  /// values with distinct names, like the `values` list of an enum class.
  /// Only one value for each name can occur in the created map,
  /// so if two or more values have the same name (either being the
  /// same value, or being values of different enum type), at most one of
  /// them will be represented in the returned map.
  static Map<String, CygnusIOSNSURLProtectionSpaceProxyType> asNameMap() =>
      <String, CygnusIOSNSURLProtectionSpaceProxyType>{
        for (final value in CygnusIOSNSURLProtectionSpaceProxyType.values)
          value.name(): value,
      };

  ///Gets [String] value.
  String toValue() => _value;

  ///Gets [String] native value if supported by the current platform, otherwise `null`.
  String? toNativeValue() => _nativeValue;

  ///Gets the name of the value.
  String name() {
    switch (_value) {
      case 'NSURLProtectionSpaceFTPProxy':
        return 'NSURL_PROTECTION_SPACE_FTP_PROXY';
      case 'NSURLProtectionSpaceHTTPSProxy':
        return 'NSURL_PROTECTION_SPACE_HTTPS_PROXY';
      case 'NSURLProtectionSpaceSOCKSProxy':
        return 'NSURL_PROTECTION_SPACE_SOCKS_PROXY';
      case 'NSURLProtectionSpaceHTTPProxy':
        return 'NSUR_PROTECTION_SPACE_HTTP_PROXY';
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
