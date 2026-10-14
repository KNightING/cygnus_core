// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'js_prompt_response_action.dart';

// **************************************************************************
// ExchangeableEnumGenerator
// **************************************************************************

///Class used by [CygnusJsPromptResponse] class.
class CygnusJsPromptResponseAction {
  final int _value;
  final int? _nativeValue;
  const CygnusJsPromptResponseAction._internal(this._value, this._nativeValue);
  // ignore: unused_element
  factory CygnusJsPromptResponseAction._internalMultiPlatform(
    int value,
    Function nativeValue,
  ) => CygnusJsPromptResponseAction._internal(value, nativeValue());

  ///Confirm that the user hit cancel button.
  static const CANCEL = CygnusJsPromptResponseAction._internal(1, 1);

  ///Confirm that the user hit confirm button.
  static const CONFIRM = CygnusJsPromptResponseAction._internal(0, 0);

  ///Set of all values of [CygnusJsPromptResponseAction].
  static final Set<CygnusJsPromptResponseAction> values = [
    CygnusJsPromptResponseAction.CANCEL,
    CygnusJsPromptResponseAction.CONFIRM,
  ].toSet();

  ///Gets a possible [CygnusJsPromptResponseAction] instance from [int] value.
  static CygnusJsPromptResponseAction? fromValue(int? value) {
    if (value != null) {
      try {
        return CygnusJsPromptResponseAction.values.firstWhere(
          (element) => element.toValue() == value,
        );
      } catch (e) {
        return null;
      }
    }
    return null;
  }

  ///Gets a possible [CygnusJsPromptResponseAction] instance from a native value.
  static CygnusJsPromptResponseAction? fromNativeValue(int? value) {
    if (value != null) {
      try {
        return CygnusJsPromptResponseAction.values.firstWhere(
          (element) => element.toNativeValue() == value,
        );
      } catch (e) {
        return null;
      }
    }
    return null;
  }

  /// Gets a possible [CygnusJsPromptResponseAction] instance value with name [name].
  ///
  /// Goes through [CygnusJsPromptResponseAction.values] looking for a value with
  /// name [name], as reported by [CygnusJsPromptResponseAction.name].
  /// Returns the first value with the given name, otherwise `null`.
  static CygnusJsPromptResponseAction? byName(String? name) {
    if (name != null) {
      try {
        return CygnusJsPromptResponseAction.values.firstWhere(
          (element) => element.name() == name,
        );
      } catch (e) {
        return null;
      }
    }
    return null;
  }

  /// Creates a map from the names of [CygnusJsPromptResponseAction] values to the values.
  ///
  /// The collection that this method is called on is expected to have
  /// values with distinct names, like the `values` list of an enum class.
  /// Only one value for each name can occur in the created map,
  /// so if two or more values have the same name (either being the
  /// same value, or being values of different enum type), at most one of
  /// them will be represented in the returned map.
  static Map<String, CygnusJsPromptResponseAction> asNameMap() =>
      <String, CygnusJsPromptResponseAction>{
        for (final value in CygnusJsPromptResponseAction.values)
          value.name(): value,
      };

  ///Gets [int] value.
  int toValue() => _value;

  ///Gets [int] native value if supported by the current platform, otherwise `null`.
  int? toNativeValue() => _nativeValue;

  ///Gets the name of the value.
  String name() {
    switch (_value) {
      case 1:
        return 'CANCEL';
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
