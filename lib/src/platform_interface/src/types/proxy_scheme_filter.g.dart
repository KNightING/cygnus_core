// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'proxy_scheme_filter.dart';

// **************************************************************************
// ExchangeableEnumGenerator
// **************************************************************************

///Class that represent scheme filters used by [CygnusPlatformProxyController].
class CygnusProxySchemeFilter {
  final String _value;
  final String? _nativeValue;
  const CygnusProxySchemeFilter._internal(this._value, this._nativeValue);
  // ignore: unused_element
  factory CygnusProxySchemeFilter._internalMultiPlatform(
    String value,
    Function nativeValue,
  ) => CygnusProxySchemeFilter._internal(value, nativeValue());

  ///Matches all schemes.
  static const MATCH_ALL_SCHEMES = CygnusProxySchemeFilter._internal('*', '*');

  ///HTTP scheme.
  static const MATCH_HTTP = CygnusProxySchemeFilter._internal('http', 'http');

  ///HTTPS scheme.
  static const MATCH_HTTPS = CygnusProxySchemeFilter._internal(
    'https',
    'https',
  );

  ///Set of all values of [CygnusProxySchemeFilter].
  static final Set<CygnusProxySchemeFilter> values = [
    CygnusProxySchemeFilter.MATCH_ALL_SCHEMES,
    CygnusProxySchemeFilter.MATCH_HTTP,
    CygnusProxySchemeFilter.MATCH_HTTPS,
  ].toSet();

  ///Gets a possible [CygnusProxySchemeFilter] instance from [String] value.
  static CygnusProxySchemeFilter? fromValue(String? value) {
    if (value != null) {
      try {
        return CygnusProxySchemeFilter.values.firstWhere(
          (element) => element.toValue() == value,
        );
      } catch (e) {
        return null;
      }
    }
    return null;
  }

  ///Gets a possible [CygnusProxySchemeFilter] instance from a native value.
  static CygnusProxySchemeFilter? fromNativeValue(String? value) {
    if (value != null) {
      try {
        return CygnusProxySchemeFilter.values.firstWhere(
          (element) => element.toNativeValue() == value,
        );
      } catch (e) {
        return null;
      }
    }
    return null;
  }

  /// Gets a possible [CygnusProxySchemeFilter] instance value with name [name].
  ///
  /// Goes through [CygnusProxySchemeFilter.values] looking for a value with
  /// name [name], as reported by [CygnusProxySchemeFilter.name].
  /// Returns the first value with the given name, otherwise `null`.
  static CygnusProxySchemeFilter? byName(String? name) {
    if (name != null) {
      try {
        return CygnusProxySchemeFilter.values.firstWhere(
          (element) => element.name() == name,
        );
      } catch (e) {
        return null;
      }
    }
    return null;
  }

  /// Creates a map from the names of [CygnusProxySchemeFilter] values to the values.
  ///
  /// The collection that this method is called on is expected to have
  /// values with distinct names, like the `values` list of an enum class.
  /// Only one value for each name can occur in the created map,
  /// so if two or more values have the same name (either being the
  /// same value, or being values of different enum type), at most one of
  /// them will be represented in the returned map.
  static Map<String, CygnusProxySchemeFilter> asNameMap() =>
      <String, CygnusProxySchemeFilter>{
        for (final value in CygnusProxySchemeFilter.values) value.name(): value,
      };

  ///Gets [String] value.
  String toValue() => _value;

  ///Gets [String] native value if supported by the current platform, otherwise `null`.
  String? toNativeValue() => _nativeValue;

  ///Gets the name of the value.
  String name() {
    switch (_value) {
      case '*':
        return 'MATCH_ALL_SCHEMES';
      case 'http':
        return 'MATCH_HTTP';
      case 'https':
        return 'MATCH_HTTPS';
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
