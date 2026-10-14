// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'web_resource_request_source_kind.dart';

// **************************************************************************
// ExchangeableEnumGenerator
// **************************************************************************

///Constants that describe the source kinds for web resource requests.
class CygnusWebResourceRequestSourceKind {
  final int _value;
  final int? _nativeValue;
  const CygnusWebResourceRequestSourceKind._internal(
    this._value,
    this._nativeValue,
  );
  // ignore: unused_element
  factory CygnusWebResourceRequestSourceKind._internalMultiPlatform(
    int value,
    Function nativeValue,
  ) => CygnusWebResourceRequestSourceKind._internal(value, nativeValue());

  ///All request source kinds.
  static const ALL = CygnusWebResourceRequestSourceKind._internal(
    4294967295,
    4294967295,
  );

  ///Request originated from a document.
  static const DOCUMENT = CygnusWebResourceRequestSourceKind._internal(1, 1);

  ///No request source kind.
  static const NONE = CygnusWebResourceRequestSourceKind._internal(0, 0);

  ///Request originated from a service worker.
  static const SERVICE_WORKER = CygnusWebResourceRequestSourceKind._internal(
    4,
    4,
  );

  ///Request originated from a shared worker.
  static const SHARED_WORKER = CygnusWebResourceRequestSourceKind._internal(
    2,
    2,
  );

  ///Set of all values of [CygnusWebResourceRequestSourceKind].
  static final Set<CygnusWebResourceRequestSourceKind> values = [
    CygnusWebResourceRequestSourceKind.ALL,
    CygnusWebResourceRequestSourceKind.DOCUMENT,
    CygnusWebResourceRequestSourceKind.NONE,
    CygnusWebResourceRequestSourceKind.SERVICE_WORKER,
    CygnusWebResourceRequestSourceKind.SHARED_WORKER,
  ].toSet();

  ///Gets a possible [CygnusWebResourceRequestSourceKind] instance from [int] value.
  static CygnusWebResourceRequestSourceKind? fromValue(int? value) {
    if (value != null) {
      try {
        return CygnusWebResourceRequestSourceKind.values.firstWhere(
          (element) => element.toValue() == value,
        );
      } catch (e) {
        return null;
      }
    }
    return null;
  }

  ///Gets a possible [CygnusWebResourceRequestSourceKind] instance from a native value.
  static CygnusWebResourceRequestSourceKind? fromNativeValue(int? value) {
    if (value != null) {
      try {
        return CygnusWebResourceRequestSourceKind.values.firstWhere(
          (element) => element.toNativeValue() == value,
        );
      } catch (e) {
        return null;
      }
    }
    return null;
  }

  /// Gets a possible [CygnusWebResourceRequestSourceKind] instance value with name [name].
  ///
  /// Goes through [CygnusWebResourceRequestSourceKind.values] looking for a value with
  /// name [name], as reported by [CygnusWebResourceRequestSourceKind.name].
  /// Returns the first value with the given name, otherwise `null`.
  static CygnusWebResourceRequestSourceKind? byName(String? name) {
    if (name != null) {
      try {
        return CygnusWebResourceRequestSourceKind.values.firstWhere(
          (element) => element.name() == name,
        );
      } catch (e) {
        return null;
      }
    }
    return null;
  }

  /// Creates a map from the names of [CygnusWebResourceRequestSourceKind] values to the values.
  ///
  /// The collection that this method is called on is expected to have
  /// values with distinct names, like the `values` list of an enum class.
  /// Only one value for each name can occur in the created map,
  /// so if two or more values have the same name (either being the
  /// same value, or being values of different enum type), at most one of
  /// them will be represented in the returned map.
  static Map<String, CygnusWebResourceRequestSourceKind> asNameMap() =>
      <String, CygnusWebResourceRequestSourceKind>{
        for (final value in CygnusWebResourceRequestSourceKind.values)
          value.name(): value,
      };

  ///Gets [int] value.
  int toValue() => _value;

  ///Gets [int] native value if supported by the current platform, otherwise `null`.
  int? toNativeValue() => _nativeValue;

  ///Gets the name of the value.
  String name() {
    switch (_value) {
      case 4294967295:
        return 'ALL';
      case 1:
        return 'DOCUMENT';
      case 0:
        return 'NONE';
      case 4:
        return 'SERVICE_WORKER';
      case 2:
        return 'SHARED_WORKER';
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
