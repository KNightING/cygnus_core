// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'referrer_policy.dart';

// **************************************************************************
// ExchangeableEnumGenerator
// **************************************************************************

///Class that represents a Referrer-Policy HTTP header.
///It could be used with [CygnusScriptHtmlTagAttributes] and [CygnusCSSLinkHtmlTagAttributes]
///when fetching a resource `<link>` or a `<script>` (or resources fetched by the `<script>`).
class CygnusReferrerPolicy {
  final String _value;
  final String? _nativeValue;
  const CygnusReferrerPolicy._internal(this._value, this._nativeValue);
  // ignore: unused_element
  factory CygnusReferrerPolicy._internalMultiPlatform(
    String value,
    Function nativeValue,
  ) => CygnusReferrerPolicy._internal(value, nativeValue());

  ///The Referer header will not be sent.
  static const NO_REFERRER = CygnusReferrerPolicy._internal(
    'no-referrer',
    'no-referrer',
  );

  ///The Referer header will not be sent to origins without TLS (HTTPS).
  static const NO_REFERRER_WHEN_DOWNGRADE = CygnusReferrerPolicy._internal(
    'no-referrer-when-downgrade',
    'no-referrer-when-downgrade',
  );

  ///The sent referrer will be limited to the origin of the referring page: its scheme, host, and port.
  static const ORIGIN = CygnusReferrerPolicy._internal('origin', 'origin');

  ///The referrer sent to other origins will be limited to the scheme, the host, and the port.
  ///Navigations on the same origin will still include the path.
  static const ORIGIN_WHEN_CROSS_ORIGIN = CygnusReferrerPolicy._internal(
    'origin-when-cross-origin',
    'origin-when-cross-origin',
  );

  ///A referrer will be sent for same origin, but cross-origin requests will contain no referrer information.
  static const SAME_ORIGIN = CygnusReferrerPolicy._internal(
    'same-origin',
    'same-origin',
  );

  ///Only send the origin of the document as the referrer when the protocol security level stays the same (e.g. HTTPS -> HTTPS),
  ///but don't send it to a less secure destination (e.g. HTTPS -> HTTP).
  static const STRICT_ORIGIN = CygnusReferrerPolicy._internal(
    'strict-origin',
    'strict-origin',
  );

  ///Send a full URL when performing a same-origin request, but only send the origin when the protocol security level stays the same (e.g.HTTPS -> HTTPS),
  ///and send no header to a less secure destination (e.g. HTTPS -> HTTP).
  static const STRICT_ORIGIN_WHEN_CROSS_ORIGIN = CygnusReferrerPolicy._internal(
    'strict-origin-when-cross-origin',
    'strict-origin-when-cross-origin',
  );

  ///The referrer will include the origin and the path (but not the fragment, password, or username).
  ///This value is unsafe, because it leaks origins and paths from TLS-protected resources to insecure origins.
  static const UNSAFE_URL = CygnusReferrerPolicy._internal(
    'unsafe-url',
    'unsafe-url',
  );

  ///Set of all values of [CygnusReferrerPolicy].
  static final Set<CygnusReferrerPolicy> values = [
    CygnusReferrerPolicy.NO_REFERRER,
    CygnusReferrerPolicy.NO_REFERRER_WHEN_DOWNGRADE,
    CygnusReferrerPolicy.ORIGIN,
    CygnusReferrerPolicy.ORIGIN_WHEN_CROSS_ORIGIN,
    CygnusReferrerPolicy.SAME_ORIGIN,
    CygnusReferrerPolicy.STRICT_ORIGIN,
    CygnusReferrerPolicy.STRICT_ORIGIN_WHEN_CROSS_ORIGIN,
    CygnusReferrerPolicy.UNSAFE_URL,
  ].toSet();

  ///Gets a possible [CygnusReferrerPolicy] instance from [String] value.
  static CygnusReferrerPolicy? fromValue(String? value) {
    if (value != null) {
      try {
        return CygnusReferrerPolicy.values.firstWhere(
          (element) => element.toValue() == value,
        );
      } catch (e) {
        return null;
      }
    }
    return null;
  }

  ///Gets a possible [CygnusReferrerPolicy] instance from a native value.
  static CygnusReferrerPolicy? fromNativeValue(String? value) {
    if (value != null) {
      try {
        return CygnusReferrerPolicy.values.firstWhere(
          (element) => element.toNativeValue() == value,
        );
      } catch (e) {
        return null;
      }
    }
    return null;
  }

  /// Gets a possible [CygnusReferrerPolicy] instance value with name [name].
  ///
  /// Goes through [CygnusReferrerPolicy.values] looking for a value with
  /// name [name], as reported by [CygnusReferrerPolicy.name].
  /// Returns the first value with the given name, otherwise `null`.
  static CygnusReferrerPolicy? byName(String? name) {
    if (name != null) {
      try {
        return CygnusReferrerPolicy.values.firstWhere(
          (element) => element.name() == name,
        );
      } catch (e) {
        return null;
      }
    }
    return null;
  }

  /// Creates a map from the names of [CygnusReferrerPolicy] values to the values.
  ///
  /// The collection that this method is called on is expected to have
  /// values with distinct names, like the `values` list of an enum class.
  /// Only one value for each name can occur in the created map,
  /// so if two or more values have the same name (either being the
  /// same value, or being values of different enum type), at most one of
  /// them will be represented in the returned map.
  static Map<String, CygnusReferrerPolicy> asNameMap() =>
      <String, CygnusReferrerPolicy>{
        for (final value in CygnusReferrerPolicy.values) value.name(): value,
      };

  ///Gets [String] value.
  String toValue() => _value;

  ///Gets [String] native value if supported by the current platform, otherwise `null`.
  String? toNativeValue() => _nativeValue;

  ///Gets the name of the value.
  String name() {
    switch (_value) {
      case 'no-referrer':
        return 'NO_REFERRER';
      case 'no-referrer-when-downgrade':
        return 'NO_REFERRER_WHEN_DOWNGRADE';
      case 'origin':
        return 'ORIGIN';
      case 'origin-when-cross-origin':
        return 'ORIGIN_WHEN_CROSS_ORIGIN';
      case 'same-origin':
        return 'SAME_ORIGIN';
      case 'strict-origin':
        return 'STRICT_ORIGIN';
      case 'strict-origin-when-cross-origin':
        return 'STRICT_ORIGIN_WHEN_CROSS_ORIGIN';
      case 'unsafe-url':
        return 'UNSAFE_URL';
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
