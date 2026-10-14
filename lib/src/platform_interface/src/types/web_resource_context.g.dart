// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'web_resource_context.dart';

// **************************************************************************
// ExchangeableEnumGenerator
// **************************************************************************

///Constants that describe the web resource request contexts.
class CygnusWebResourceContext {
  final int _value;
  final int? _nativeValue;
  const CygnusWebResourceContext._internal(this._value, this._nativeValue);
  // ignore: unused_element
  factory CygnusWebResourceContext._internalMultiPlatform(
    int value,
    Function nativeValue,
  ) => CygnusWebResourceContext._internal(value, nativeValue());

  ///All resources.
  static const ALL = CygnusWebResourceContext._internal(0, 0);

  ///CSP Violation Report resource.
  static const CSP_VIOLATION_REPORT = CygnusWebResourceContext._internal(
    15,
    15,
  );

  ///Document resource.
  static const DOCUMENT = CygnusWebResourceContext._internal(1, 1);

  ///EventSource resource.
  static const EVENT_SOURCE = CygnusWebResourceContext._internal(10, 10);

  ///Fetch API resource.
  static const FETCH = CygnusWebResourceContext._internal(8, 8);

  ///Font resource.
  static const FONT = CygnusWebResourceContext._internal(5, 5);

  ///Image resource.
  static const IMAGE = CygnusWebResourceContext._internal(3, 3);

  ///Web App Manifest resource.
  static const MANIFEST = CygnusWebResourceContext._internal(12, 12);

  ///Media resource.
  static const MEDIA = CygnusWebResourceContext._internal(4, 4);

  ///Other resource.
  static const OTHER = CygnusWebResourceContext._internal(16, 16);

  ///Ping request.
  static const PING = CygnusWebResourceContext._internal(14, 14);

  ///Script resource.
  static const SCRIPT = CygnusWebResourceContext._internal(6, 6);

  ///Signed HTTP Exchange resource.
  static const SIGNED_EXCHANGE = CygnusWebResourceContext._internal(13, 13);

  ///CSS resource.
  static const STYLESHEET = CygnusWebResourceContext._internal(2, 2);

  ///TextTrack resource.
  static const TEXT_TRACK = CygnusWebResourceContext._internal(9, 9);

  ///WebSocket resource.
  static const WEBSOCKET = CygnusWebResourceContext._internal(11, 11);

  ///XML HTTP request resource.
  static const XML_HTTP_REQUEST = CygnusWebResourceContext._internal(7, 7);

  ///Set of all values of [CygnusWebResourceContext].
  static final Set<CygnusWebResourceContext> values = [
    CygnusWebResourceContext.ALL,
    CygnusWebResourceContext.CSP_VIOLATION_REPORT,
    CygnusWebResourceContext.DOCUMENT,
    CygnusWebResourceContext.EVENT_SOURCE,
    CygnusWebResourceContext.FETCH,
    CygnusWebResourceContext.FONT,
    CygnusWebResourceContext.IMAGE,
    CygnusWebResourceContext.MANIFEST,
    CygnusWebResourceContext.MEDIA,
    CygnusWebResourceContext.OTHER,
    CygnusWebResourceContext.PING,
    CygnusWebResourceContext.SCRIPT,
    CygnusWebResourceContext.SIGNED_EXCHANGE,
    CygnusWebResourceContext.STYLESHEET,
    CygnusWebResourceContext.TEXT_TRACK,
    CygnusWebResourceContext.WEBSOCKET,
    CygnusWebResourceContext.XML_HTTP_REQUEST,
  ].toSet();

  ///Gets a possible [CygnusWebResourceContext] instance from [int] value.
  static CygnusWebResourceContext? fromValue(int? value) {
    if (value != null) {
      try {
        return CygnusWebResourceContext.values.firstWhere(
          (element) => element.toValue() == value,
        );
      } catch (e) {
        return null;
      }
    }
    return null;
  }

  ///Gets a possible [CygnusWebResourceContext] instance from a native value.
  static CygnusWebResourceContext? fromNativeValue(int? value) {
    if (value != null) {
      try {
        return CygnusWebResourceContext.values.firstWhere(
          (element) => element.toNativeValue() == value,
        );
      } catch (e) {
        return null;
      }
    }
    return null;
  }

  /// Gets a possible [CygnusWebResourceContext] instance value with name [name].
  ///
  /// Goes through [CygnusWebResourceContext.values] looking for a value with
  /// name [name], as reported by [CygnusWebResourceContext.name].
  /// Returns the first value with the given name, otherwise `null`.
  static CygnusWebResourceContext? byName(String? name) {
    if (name != null) {
      try {
        return CygnusWebResourceContext.values.firstWhere(
          (element) => element.name() == name,
        );
      } catch (e) {
        return null;
      }
    }
    return null;
  }

  /// Creates a map from the names of [CygnusWebResourceContext] values to the values.
  ///
  /// The collection that this method is called on is expected to have
  /// values with distinct names, like the `values` list of an enum class.
  /// Only one value for each name can occur in the created map,
  /// so if two or more values have the same name (either being the
  /// same value, or being values of different enum type), at most one of
  /// them will be represented in the returned map.
  static Map<String, CygnusWebResourceContext> asNameMap() =>
      <String, CygnusWebResourceContext>{
        for (final value in CygnusWebResourceContext.values)
          value.name(): value,
      };

  ///Gets [int] value.
  int toValue() => _value;

  ///Gets [int] native value if supported by the current platform, otherwise `null`.
  int? toNativeValue() => _nativeValue;

  ///Gets the name of the value.
  String name() {
    switch (_value) {
      case 0:
        return 'ALL';
      case 15:
        return 'CSP_VIOLATION_REPORT';
      case 1:
        return 'DOCUMENT';
      case 10:
        return 'EVENT_SOURCE';
      case 8:
        return 'FETCH';
      case 5:
        return 'FONT';
      case 3:
        return 'IMAGE';
      case 12:
        return 'MANIFEST';
      case 4:
        return 'MEDIA';
      case 16:
        return 'OTHER';
      case 14:
        return 'PING';
      case 6:
        return 'SCRIPT';
      case 13:
        return 'SIGNED_EXCHANGE';
      case 2:
        return 'STYLESHEET';
      case 9:
        return 'TEXT_TRACK';
      case 11:
        return 'WEBSOCKET';
      case 7:
        return 'XML_HTTP_REQUEST';
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
