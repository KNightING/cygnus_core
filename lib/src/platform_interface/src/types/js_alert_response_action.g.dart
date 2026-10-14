// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'js_alert_response_action.dart';

// **************************************************************************
// ExchangeableEnumGenerator
// **************************************************************************

///Class used by [CygnusJsAlertResponse] class.
class CygnusJsAlertResponseAction {
  final int _value;
  final int? _nativeValue;
  const CygnusJsAlertResponseAction._internal(this._value, this._nativeValue);
  // ignore: unused_element
  factory CygnusJsAlertResponseAction._internalMultiPlatform(
    int value,
    Function nativeValue,
  ) => CygnusJsAlertResponseAction._internal(value, nativeValue());

  ///Confirm that the user hit confirm button.
  static const CONFIRM = CygnusJsAlertResponseAction._internal(0, 0);

  ///Set of all values of [CygnusJsAlertResponseAction].
  static final Set<CygnusJsAlertResponseAction> values = [
    CygnusJsAlertResponseAction.CONFIRM,
  ].toSet();

  ///Gets a possible [CygnusJsAlertResponseAction] instance from [int] value.
  static CygnusJsAlertResponseAction? fromValue(int? value) {
    if (value != null) {
      try {
        return CygnusJsAlertResponseAction.values.firstWhere(
          (element) => element.toValue() == value,
        );
      } catch (e) {
        return null;
      }
    }
    return null;
  }

  ///Gets a possible [CygnusJsAlertResponseAction] instance from a native value.
  static CygnusJsAlertResponseAction? fromNativeValue(int? value) {
    if (value != null) {
      try {
        return CygnusJsAlertResponseAction.values.firstWhere(
          (element) => element.toNativeValue() == value,
        );
      } catch (e) {
        return null;
      }
    }
    return null;
  }

  /// Gets a possible [CygnusJsAlertResponseAction] instance value with name [name].
  ///
  /// Goes through [CygnusJsAlertResponseAction.values] looking for a value with
  /// name [name], as reported by [CygnusJsAlertResponseAction.name].
  /// Returns the first value with the given name, otherwise `null`.
  static CygnusJsAlertResponseAction? byName(String? name) {
    if (name != null) {
      try {
        return CygnusJsAlertResponseAction.values.firstWhere(
          (element) => element.name() == name,
        );
      } catch (e) {
        return null;
      }
    }
    return null;
  }

  /// Creates a map from the names of [CygnusJsAlertResponseAction] values to the values.
  ///
  /// The collection that this method is called on is expected to have
  /// values with distinct names, like the `values` list of an enum class.
  /// Only one value for each name can occur in the created map,
  /// so if two or more values have the same name (either being the
  /// same value, or being values of different enum type), at most one of
  /// them will be represented in the returned map.
  static Map<String, CygnusJsAlertResponseAction> asNameMap() =>
      <String, CygnusJsAlertResponseAction>{
        for (final value in CygnusJsAlertResponseAction.values)
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
        return 'CONFIRM';
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
