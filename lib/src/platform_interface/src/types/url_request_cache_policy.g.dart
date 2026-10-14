// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'url_request_cache_policy.dart';

// **************************************************************************
// ExchangeableEnumGenerator
// **************************************************************************

///Class that represents the constants used to specify interaction with the cached responses.
class CygnusURLRequestCachePolicy {
  final int _value;
  final int? _nativeValue;
  const CygnusURLRequestCachePolicy._internal(this._value, this._nativeValue);
  // ignore: unused_element
  factory CygnusURLRequestCachePolicy._internalMultiPlatform(
    int value,
    Function nativeValue,
  ) => CygnusURLRequestCachePolicy._internal(value, nativeValue());

  ///Ignore local cache data, and instruct proxies and other intermediates to disregard their caches so far as the protocol allows.
  ///
  ///**NOTE**: Versions earlier than macOS 15, iOS 13, watchOS 6, and tvOS 13 don’t implement this constant.
  static const RELOAD_IGNORING_LOCAL_AND_REMOTE_CACHE_DATA =
      CygnusURLRequestCachePolicy._internal(4, 4);

  ///The URL load should be loaded only from the originating source.
  ///This policy specifies that no existing cache data should be used to satisfy a URL load request.
  ///
  ///**NOTE**: Always use this policy if you are making HTTP or HTTPS byte-range requests.
  static const RELOAD_IGNORING_LOCAL_CACHE_DATA =
      CygnusURLRequestCachePolicy._internal(1, 1);

  ///Use cache data if the origin source can validate it; otherwise, load from the origin.
  ///
  ///**NOTE**: Versions earlier than macOS 15, iOS 13, watchOS 6, and tvOS 13 don’t implement this constant.
  static const RELOAD_REVALIDATING_CACHE_DATA =
      CygnusURLRequestCachePolicy._internal(5, 5);

  ///Use existing cache data, regardless or age or expiration date, and fail if no cached data is available.
  ///
  ///If there is no existing data in the cache corresponding to a URL load request,
  ///no attempt is made to load the data from the originating source, and the load is considered to have failed.
  ///This constant specifies a behavior that is similar to an “offline” mode.
  static const RETURN_CACHE_DATA_DONT_LOAD =
      CygnusURLRequestCachePolicy._internal(3, 3);

  ///Use existing cache data, regardless or age or expiration date, loading from originating source only if there is no cached data.
  static const RETURN_CACHE_DATA_ELSE_LOAD =
      CygnusURLRequestCachePolicy._internal(2, 2);

  ///Use the caching logic defined in the protocol implementation, if any, for a particular URL load request.
  ///This is the default policy for URL load requests.
  static const USE_PROTOCOL_CACHE_POLICY =
      CygnusURLRequestCachePolicy._internal(0, 0);

  ///Set of all values of [CygnusURLRequestCachePolicy].
  static final Set<CygnusURLRequestCachePolicy> values = [
    CygnusURLRequestCachePolicy.RELOAD_IGNORING_LOCAL_AND_REMOTE_CACHE_DATA,
    CygnusURLRequestCachePolicy.RELOAD_IGNORING_LOCAL_CACHE_DATA,
    CygnusURLRequestCachePolicy.RELOAD_REVALIDATING_CACHE_DATA,
    CygnusURLRequestCachePolicy.RETURN_CACHE_DATA_DONT_LOAD,
    CygnusURLRequestCachePolicy.RETURN_CACHE_DATA_ELSE_LOAD,
    CygnusURLRequestCachePolicy.USE_PROTOCOL_CACHE_POLICY,
  ].toSet();

  ///Gets a possible [CygnusURLRequestCachePolicy] instance from [int] value.
  static CygnusURLRequestCachePolicy? fromValue(int? value) {
    if (value != null) {
      try {
        return CygnusURLRequestCachePolicy.values.firstWhere(
          (element) => element.toValue() == value,
        );
      } catch (e) {
        return null;
      }
    }
    return null;
  }

  ///Gets a possible [CygnusURLRequestCachePolicy] instance from a native value.
  static CygnusURLRequestCachePolicy? fromNativeValue(int? value) {
    if (value != null) {
      try {
        return CygnusURLRequestCachePolicy.values.firstWhere(
          (element) => element.toNativeValue() == value,
        );
      } catch (e) {
        return null;
      }
    }
    return null;
  }

  /// Gets a possible [CygnusURLRequestCachePolicy] instance value with name [name].
  ///
  /// Goes through [CygnusURLRequestCachePolicy.values] looking for a value with
  /// name [name], as reported by [CygnusURLRequestCachePolicy.name].
  /// Returns the first value with the given name, otherwise `null`.
  static CygnusURLRequestCachePolicy? byName(String? name) {
    if (name != null) {
      try {
        return CygnusURLRequestCachePolicy.values.firstWhere(
          (element) => element.name() == name,
        );
      } catch (e) {
        return null;
      }
    }
    return null;
  }

  /// Creates a map from the names of [CygnusURLRequestCachePolicy] values to the values.
  ///
  /// The collection that this method is called on is expected to have
  /// values with distinct names, like the `values` list of an enum class.
  /// Only one value for each name can occur in the created map,
  /// so if two or more values have the same name (either being the
  /// same value, or being values of different enum type), at most one of
  /// them will be represented in the returned map.
  static Map<String, CygnusURLRequestCachePolicy> asNameMap() =>
      <String, CygnusURLRequestCachePolicy>{
        for (final value in CygnusURLRequestCachePolicy.values)
          value.name(): value,
      };

  ///Gets [int] value.
  int toValue() => _value;

  ///Gets [int] native value if supported by the current platform, otherwise `null`.
  int? toNativeValue() => _nativeValue;

  ///Gets the name of the value.
  String name() {
    switch (_value) {
      case 4:
        return 'RELOAD_IGNORING_LOCAL_AND_REMOTE_CACHE_DATA';
      case 1:
        return 'RELOAD_IGNORING_LOCAL_CACHE_DATA';
      case 5:
        return 'RELOAD_REVALIDATING_CACHE_DATA';
      case 3:
        return 'RETURN_CACHE_DATA_DONT_LOAD';
      case 2:
        return 'RETURN_CACHE_DATA_ELSE_LOAD';
      case 0:
        return 'USE_PROTOCOL_CACHE_POLICY';
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

///An iOS-specific Class that represents the constants used to specify interaction with the cached responses.
///Use [CygnusURLRequestCachePolicy] instead.
@Deprecated('Use CygnusURLRequestCachePolicy instead')
class CygnusIOSURLRequestCachePolicy {
  final int _value;
  final int? _nativeValue;
  const CygnusIOSURLRequestCachePolicy._internal(
    this._value,
    this._nativeValue,
  );
  // ignore: unused_element
  factory CygnusIOSURLRequestCachePolicy._internalMultiPlatform(
    int value,
    Function nativeValue,
  ) => CygnusIOSURLRequestCachePolicy._internal(value, nativeValue());

  ///Ignore local cache data, and instruct proxies and other intermediates to disregard their caches so far as the protocol allows.
  ///
  ///**NOTE**: Versions earlier than macOS 15, iOS 13, watchOS 6, and tvOS 13 don’t implement this constant.
  static const RELOAD_IGNORING_LOCAL_AND_REMOTE_CACHE_DATA =
      CygnusIOSURLRequestCachePolicy._internal(4, 4);

  ///The URL load should be loaded only from the originating source.
  ///This policy specifies that no existing cache data should be used to satisfy a URL load request.
  ///
  ///**NOTE**: Always use this policy if you are making HTTP or HTTPS byte-range requests.
  static const RELOAD_IGNORING_LOCAL_CACHE_DATA =
      CygnusIOSURLRequestCachePolicy._internal(1, 1);

  ///Use cache data if the origin source can validate it; otherwise, load from the origin.
  ///
  ///**NOTE**: Versions earlier than macOS 15, iOS 13, watchOS 6, and tvOS 13 don’t implement this constant.
  static const RELOAD_REVALIDATING_CACHE_DATA =
      CygnusIOSURLRequestCachePolicy._internal(5, 5);

  ///Use existing cache data, regardless or age or expiration date, and fail if no cached data is available.
  ///
  ///If there is no existing data in the cache corresponding to a URL load request,
  ///no attempt is made to load the data from the originating source, and the load is considered to have failed.
  ///This constant specifies a behavior that is similar to an “offline” mode.
  static const RETURN_CACHE_DATA_DONT_LOAD =
      CygnusIOSURLRequestCachePolicy._internal(3, 3);

  ///Use existing cache data, regardless or age or expiration date, loading from originating source only if there is no cached data.
  static const RETURN_CACHE_DATA_ELSE_LOAD =
      CygnusIOSURLRequestCachePolicy._internal(2, 2);

  ///Use the caching logic defined in the protocol implementation, if any, for a particular URL load request.
  ///This is the default policy for URL load requests.
  static const USE_PROTOCOL_CACHE_POLICY =
      CygnusIOSURLRequestCachePolicy._internal(0, 0);

  ///Set of all values of [CygnusIOSURLRequestCachePolicy].
  static final Set<CygnusIOSURLRequestCachePolicy> values = [
    CygnusIOSURLRequestCachePolicy.RELOAD_IGNORING_LOCAL_AND_REMOTE_CACHE_DATA,
    CygnusIOSURLRequestCachePolicy.RELOAD_IGNORING_LOCAL_CACHE_DATA,
    CygnusIOSURLRequestCachePolicy.RELOAD_REVALIDATING_CACHE_DATA,
    CygnusIOSURLRequestCachePolicy.RETURN_CACHE_DATA_DONT_LOAD,
    CygnusIOSURLRequestCachePolicy.RETURN_CACHE_DATA_ELSE_LOAD,
    CygnusIOSURLRequestCachePolicy.USE_PROTOCOL_CACHE_POLICY,
  ].toSet();

  ///Gets a possible [CygnusIOSURLRequestCachePolicy] instance from [int] value.
  static CygnusIOSURLRequestCachePolicy? fromValue(int? value) {
    if (value != null) {
      try {
        return CygnusIOSURLRequestCachePolicy.values.firstWhere(
          (element) => element.toValue() == value,
        );
      } catch (e) {
        return null;
      }
    }
    return null;
  }

  ///Gets a possible [CygnusIOSURLRequestCachePolicy] instance from a native value.
  static CygnusIOSURLRequestCachePolicy? fromNativeValue(int? value) {
    if (value != null) {
      try {
        return CygnusIOSURLRequestCachePolicy.values.firstWhere(
          (element) => element.toNativeValue() == value,
        );
      } catch (e) {
        return null;
      }
    }
    return null;
  }

  /// Gets a possible [CygnusIOSURLRequestCachePolicy] instance value with name [name].
  ///
  /// Goes through [CygnusIOSURLRequestCachePolicy.values] looking for a value with
  /// name [name], as reported by [CygnusIOSURLRequestCachePolicy.name].
  /// Returns the first value with the given name, otherwise `null`.
  static CygnusIOSURLRequestCachePolicy? byName(String? name) {
    if (name != null) {
      try {
        return CygnusIOSURLRequestCachePolicy.values.firstWhere(
          (element) => element.name() == name,
        );
      } catch (e) {
        return null;
      }
    }
    return null;
  }

  /// Creates a map from the names of [CygnusIOSURLRequestCachePolicy] values to the values.
  ///
  /// The collection that this method is called on is expected to have
  /// values with distinct names, like the `values` list of an enum class.
  /// Only one value for each name can occur in the created map,
  /// so if two or more values have the same name (either being the
  /// same value, or being values of different enum type), at most one of
  /// them will be represented in the returned map.
  static Map<String, CygnusIOSURLRequestCachePolicy> asNameMap() =>
      <String, CygnusIOSURLRequestCachePolicy>{
        for (final value in CygnusIOSURLRequestCachePolicy.values)
          value.name(): value,
      };

  ///Gets [int] value.
  int toValue() => _value;

  ///Gets [int] native value if supported by the current platform, otherwise `null`.
  int? toNativeValue() => _nativeValue;

  ///Gets the name of the value.
  String name() {
    switch (_value) {
      case 4:
        return 'RELOAD_IGNORING_LOCAL_AND_REMOTE_CACHE_DATA';
      case 1:
        return 'RELOAD_IGNORING_LOCAL_CACHE_DATA';
      case 5:
        return 'RELOAD_REVALIDATING_CACHE_DATA';
      case 3:
        return 'RETURN_CACHE_DATA_DONT_LOAD';
      case 2:
        return 'RETURN_CACHE_DATA_ELSE_LOAD';
      case 0:
        return 'USE_PROTOCOL_CACHE_POLICY';
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
