// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ajax_request_action.dart';

// **************************************************************************
// ExchangeableEnumGenerator
// **************************************************************************

///Class used by [CygnusAjaxRequest] class.
class CygnusAjaxRequestAction {
  final int _value;
  final int? _nativeValue;
  const CygnusAjaxRequestAction._internal(this._value, this._nativeValue);
  // ignore: unused_element
  factory CygnusAjaxRequestAction._internalMultiPlatform(
    int value,
    Function nativeValue,
  ) => CygnusAjaxRequestAction._internal(value, nativeValue());

  ///Aborts the current [CygnusAjaxRequest].
  static const ABORT = CygnusAjaxRequestAction._internal(0, 0);

  ///Proceeds with the current [CygnusAjaxRequest].
  static const PROCEED = CygnusAjaxRequestAction._internal(1, 1);

  ///Set of all values of [CygnusAjaxRequestAction].
  static final Set<CygnusAjaxRequestAction> values = [
    CygnusAjaxRequestAction.ABORT,
    CygnusAjaxRequestAction.PROCEED,
  ].toSet();

  ///Gets a possible [CygnusAjaxRequestAction] instance from [int] value.
  static CygnusAjaxRequestAction? fromValue(int? value) {
    if (value != null) {
      try {
        return CygnusAjaxRequestAction.values.firstWhere(
          (element) => element.toValue() == value,
        );
      } catch (e) {
        return null;
      }
    }
    return null;
  }

  ///Gets a possible [CygnusAjaxRequestAction] instance from a native value.
  static CygnusAjaxRequestAction? fromNativeValue(int? value) {
    if (value != null) {
      try {
        return CygnusAjaxRequestAction.values.firstWhere(
          (element) => element.toNativeValue() == value,
        );
      } catch (e) {
        return null;
      }
    }
    return null;
  }

  /// Gets a possible [CygnusAjaxRequestAction] instance value with name [name].
  ///
  /// Goes through [CygnusAjaxRequestAction.values] looking for a value with
  /// name [name], as reported by [CygnusAjaxRequestAction.name].
  /// Returns the first value with the given name, otherwise `null`.
  static CygnusAjaxRequestAction? byName(String? name) {
    if (name != null) {
      try {
        return CygnusAjaxRequestAction.values.firstWhere(
          (element) => element.name() == name,
        );
      } catch (e) {
        return null;
      }
    }
    return null;
  }

  /// Creates a map from the names of [CygnusAjaxRequestAction] values to the values.
  ///
  /// The collection that this method is called on is expected to have
  /// values with distinct names, like the `values` list of an enum class.
  /// Only one value for each name can occur in the created map,
  /// so if two or more values have the same name (either being the
  /// same value, or being values of different enum type), at most one of
  /// them will be represented in the returned map.
  static Map<String, CygnusAjaxRequestAction> asNameMap() =>
      <String, CygnusAjaxRequestAction>{
        for (final value in CygnusAjaxRequestAction.values) value.name(): value,
      };

  ///Gets [int] value.
  int toValue() => _value;

  ///Gets [int] native value if supported by the current platform, otherwise `null`.
  int? toNativeValue() => _nativeValue;

  ///Gets the name of the value.
  String name() {
    switch (_value) {
      case 0:
        return 'ABORT';
      case 1:
        return 'PROCEED';
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
