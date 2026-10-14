// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ajax_request_ready_state.dart';

// **************************************************************************
// ExchangeableEnumGenerator
// **************************************************************************

///Class used by [CygnusAjaxRequest] class. It represents the state of an [CygnusAjaxRequest].
class CygnusAjaxRequestReadyState {
  final int _value;
  final int? _nativeValue;
  const CygnusAjaxRequestReadyState._internal(this._value, this._nativeValue);
  // ignore: unused_element
  factory CygnusAjaxRequestReadyState._internalMultiPlatform(
    int value,
    Function nativeValue,
  ) => CygnusAjaxRequestReadyState._internal(value, nativeValue());

  ///The operation is complete.
  static const DONE = CygnusAjaxRequestReadyState._internal(4, 4);

  ///`XMLHttpRequest.send()` has been called, and [CygnusAjaxRequest.headers] and [CygnusAjaxRequest.status] are available.
  static const HEADERS_RECEIVED = CygnusAjaxRequestReadyState._internal(2, 2);

  ///Downloading; [CygnusAjaxRequest.responseText] holds partial data.
  static const LOADING = CygnusAjaxRequestReadyState._internal(3, 3);

  ///`XMLHttpRequest.open()` has been called.
  static const OPENED = CygnusAjaxRequestReadyState._internal(1, 1);

  ///Client has been created. `XMLHttpRequest.open()` not called yet.
  static const UNSENT = CygnusAjaxRequestReadyState._internal(0, 0);

  ///Set of all values of [CygnusAjaxRequestReadyState].
  static final Set<CygnusAjaxRequestReadyState> values = [
    CygnusAjaxRequestReadyState.DONE,
    CygnusAjaxRequestReadyState.HEADERS_RECEIVED,
    CygnusAjaxRequestReadyState.LOADING,
    CygnusAjaxRequestReadyState.OPENED,
    CygnusAjaxRequestReadyState.UNSENT,
  ].toSet();

  ///Gets a possible [CygnusAjaxRequestReadyState] instance from [int] value.
  static CygnusAjaxRequestReadyState? fromValue(int? value) {
    if (value != null) {
      try {
        return CygnusAjaxRequestReadyState.values.firstWhere(
          (element) => element.toValue() == value,
        );
      } catch (e) {
        return null;
      }
    }
    return null;
  }

  ///Gets a possible [CygnusAjaxRequestReadyState] instance from a native value.
  static CygnusAjaxRequestReadyState? fromNativeValue(int? value) {
    if (value != null) {
      try {
        return CygnusAjaxRequestReadyState.values.firstWhere(
          (element) => element.toNativeValue() == value,
        );
      } catch (e) {
        return null;
      }
    }
    return null;
  }

  /// Gets a possible [CygnusAjaxRequestReadyState] instance value with name [name].
  ///
  /// Goes through [CygnusAjaxRequestReadyState.values] looking for a value with
  /// name [name], as reported by [CygnusAjaxRequestReadyState.name].
  /// Returns the first value with the given name, otherwise `null`.
  static CygnusAjaxRequestReadyState? byName(String? name) {
    if (name != null) {
      try {
        return CygnusAjaxRequestReadyState.values.firstWhere(
          (element) => element.name() == name,
        );
      } catch (e) {
        return null;
      }
    }
    return null;
  }

  /// Creates a map from the names of [CygnusAjaxRequestReadyState] values to the values.
  ///
  /// The collection that this method is called on is expected to have
  /// values with distinct names, like the `values` list of an enum class.
  /// Only one value for each name can occur in the created map,
  /// so if two or more values have the same name (either being the
  /// same value, or being values of different enum type), at most one of
  /// them will be represented in the returned map.
  static Map<String, CygnusAjaxRequestReadyState> asNameMap() =>
      <String, CygnusAjaxRequestReadyState>{
        for (final value in CygnusAjaxRequestReadyState.values)
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
        return 'DONE';
      case 2:
        return 'HEADERS_RECEIVED';
      case 3:
        return 'LOADING';
      case 1:
        return 'OPENED';
      case 0:
        return 'UNSENT';
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
