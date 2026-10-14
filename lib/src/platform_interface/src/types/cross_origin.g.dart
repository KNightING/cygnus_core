// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cross_origin.dart';

// **************************************************************************
// ExchangeableEnumGenerator
// **************************************************************************

///Class that represents the `crossorigin` content attribute on media elements, which is a CORS settings attribute.
///It could be used with [CygnusScriptHtmlTagAttributes] and [CygnusCSSLinkHtmlTagAttributes]
///when fetching a resource `<link>` or a `<script>` (or resources fetched by the `<script>`).
class CygnusCrossOrigin {
  final String _value;
  final String? _nativeValue;
  const CygnusCrossOrigin._internal(this._value, this._nativeValue);
  // ignore: unused_element
  factory CygnusCrossOrigin._internalMultiPlatform(
    String value,
    Function nativeValue,
  ) => CygnusCrossOrigin._internal(value, nativeValue());

  ///CORS requests for this element will have the credentials flag set to 'same-origin'.
  static const ANONYMOUS = CygnusCrossOrigin._internal(
    'anonymous',
    'anonymous',
  );

  ///CORS requests for this element will have the credentials flag set to 'include'.
  static const USE_CREDENTIALS = CygnusCrossOrigin._internal(
    'use-credentials',
    'use-credentials',
  );

  ///Set of all values of [CygnusCrossOrigin].
  static final Set<CygnusCrossOrigin> values = [
    CygnusCrossOrigin.ANONYMOUS,
    CygnusCrossOrigin.USE_CREDENTIALS,
  ].toSet();

  ///Gets a possible [CygnusCrossOrigin] instance from [String] value.
  static CygnusCrossOrigin? fromValue(String? value) {
    if (value != null) {
      try {
        return CygnusCrossOrigin.values.firstWhere(
          (element) => element.toValue() == value,
        );
      } catch (e) {
        return null;
      }
    }
    return null;
  }

  ///Gets a possible [CygnusCrossOrigin] instance from a native value.
  static CygnusCrossOrigin? fromNativeValue(String? value) {
    if (value != null) {
      try {
        return CygnusCrossOrigin.values.firstWhere(
          (element) => element.toNativeValue() == value,
        );
      } catch (e) {
        return null;
      }
    }
    return null;
  }

  /// Gets a possible [CygnusCrossOrigin] instance value with name [name].
  ///
  /// Goes through [CygnusCrossOrigin.values] looking for a value with
  /// name [name], as reported by [CygnusCrossOrigin.name].
  /// Returns the first value with the given name, otherwise `null`.
  static CygnusCrossOrigin? byName(String? name) {
    if (name != null) {
      try {
        return CygnusCrossOrigin.values.firstWhere(
          (element) => element.name() == name,
        );
      } catch (e) {
        return null;
      }
    }
    return null;
  }

  /// Creates a map from the names of [CygnusCrossOrigin] values to the values.
  ///
  /// The collection that this method is called on is expected to have
  /// values with distinct names, like the `values` list of an enum class.
  /// Only one value for each name can occur in the created map,
  /// so if two or more values have the same name (either being the
  /// same value, or being values of different enum type), at most one of
  /// them will be represented in the returned map.
  static Map<String, CygnusCrossOrigin> asNameMap() =>
      <String, CygnusCrossOrigin>{
        for (final value in CygnusCrossOrigin.values) value.name(): value,
      };

  ///Gets [String] value.
  String toValue() => _value;

  ///Gets [String] native value if supported by the current platform, otherwise `null`.
  String? toNativeValue() => _nativeValue;

  ///Gets the name of the value.
  String name() {
    switch (_value) {
      case 'anonymous':
        return 'ANONYMOUS';
      case 'use-credentials':
        return 'USE_CREDENTIALS';
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
