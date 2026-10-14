// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ajax_request_event_type.dart';

// **************************************************************************
// ExchangeableEnumGenerator
// **************************************************************************

///Class used by [CygnusAjaxRequestEvent] class.
class CygnusAjaxRequestEventType {
  final String _value;
  final String? _nativeValue;
  const CygnusAjaxRequestEventType._internal(this._value, this._nativeValue);
  // ignore: unused_element
  factory CygnusAjaxRequestEventType._internalMultiPlatform(
    String value,
    Function nativeValue,
  ) => CygnusAjaxRequestEventType._internal(value, nativeValue());

  ///The ABORT event is fired when a request has been aborted.
  static const ABORT = CygnusAjaxRequestEventType._internal('abort', 'abort');

  ///The ERROR event is fired when the request encountered an error.
  static const ERROR = CygnusAjaxRequestEventType._internal('error', 'error');

  ///The LOAD event is fired when an `XMLHttpRequest` transaction completes successfully.
  static const LOAD = CygnusAjaxRequestEventType._internal('load', 'load');

  ///The LOADEND event is fired when a request has completed, whether successfully (after [CygnusAjaxRequestEventType.LOAD]) or
  ///unsuccessfully (after [CygnusAjaxRequestEventType.ABORT] or [CygnusAjaxRequestEventType.ERROR]).
  static const LOADEND = CygnusAjaxRequestEventType._internal(
    'loadend',
    'loadend',
  );

  ///The LOADSTART event is fired when a request has started to load data.
  static const LOADSTART = CygnusAjaxRequestEventType._internal(
    'loadstart',
    'loadstart',
  );

  ///The PROGRESS event is fired periodically when a request receives more data.
  static const PROGRESS = CygnusAjaxRequestEventType._internal(
    'progress',
    'progress',
  );

  ///The TIMEOUT event is fired when progression is terminated due to preset time expiring.
  static const TIMEOUT = CygnusAjaxRequestEventType._internal(
    'timeout',
    'timeout',
  );

  ///Set of all values of [CygnusAjaxRequestEventType].
  static final Set<CygnusAjaxRequestEventType> values = [
    CygnusAjaxRequestEventType.ABORT,
    CygnusAjaxRequestEventType.ERROR,
    CygnusAjaxRequestEventType.LOAD,
    CygnusAjaxRequestEventType.LOADEND,
    CygnusAjaxRequestEventType.LOADSTART,
    CygnusAjaxRequestEventType.PROGRESS,
    CygnusAjaxRequestEventType.TIMEOUT,
  ].toSet();

  ///Gets a possible [CygnusAjaxRequestEventType] instance from [String] value.
  static CygnusAjaxRequestEventType? fromValue(String? value) {
    if (value != null) {
      try {
        return CygnusAjaxRequestEventType.values.firstWhere(
          (element) => element.toValue() == value,
        );
      } catch (e) {
        return null;
      }
    }
    return null;
  }

  ///Gets a possible [CygnusAjaxRequestEventType] instance from a native value.
  static CygnusAjaxRequestEventType? fromNativeValue(String? value) {
    if (value != null) {
      try {
        return CygnusAjaxRequestEventType.values.firstWhere(
          (element) => element.toNativeValue() == value,
        );
      } catch (e) {
        return null;
      }
    }
    return null;
  }

  /// Gets a possible [CygnusAjaxRequestEventType] instance value with name [name].
  ///
  /// Goes through [CygnusAjaxRequestEventType.values] looking for a value with
  /// name [name], as reported by [CygnusAjaxRequestEventType.name].
  /// Returns the first value with the given name, otherwise `null`.
  static CygnusAjaxRequestEventType? byName(String? name) {
    if (name != null) {
      try {
        return CygnusAjaxRequestEventType.values.firstWhere(
          (element) => element.name() == name,
        );
      } catch (e) {
        return null;
      }
    }
    return null;
  }

  /// Creates a map from the names of [CygnusAjaxRequestEventType] values to the values.
  ///
  /// The collection that this method is called on is expected to have
  /// values with distinct names, like the `values` list of an enum class.
  /// Only one value for each name can occur in the created map,
  /// so if two or more values have the same name (either being the
  /// same value, or being values of different enum type), at most one of
  /// them will be represented in the returned map.
  static Map<String, CygnusAjaxRequestEventType> asNameMap() =>
      <String, CygnusAjaxRequestEventType>{
        for (final value in CygnusAjaxRequestEventType.values)
          value.name(): value,
      };

  ///Gets [String] value.
  String toValue() => _value;

  ///Gets [String] native value if supported by the current platform, otherwise `null`.
  String? toNativeValue() => _nativeValue;

  ///Gets the name of the value.
  String name() {
    switch (_value) {
      case 'abort':
        return 'ABORT';
      case 'error':
        return 'ERROR';
      case 'load':
        return 'LOAD';
      case 'loadend':
        return 'LOADEND';
      case 'loadstart':
        return 'LOADSTART';
      case 'progress':
        return 'PROGRESS';
      case 'timeout':
        return 'TIMEOUT';
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
