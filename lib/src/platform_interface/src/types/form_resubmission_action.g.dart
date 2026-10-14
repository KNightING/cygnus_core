// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'form_resubmission_action.dart';

// **************************************************************************
// ExchangeableEnumGenerator
// **************************************************************************

///Class that represents the action to take used by the [CygnusPlatformWebViewCreationParams.onFormResubmission] event.
class CygnusFormResubmissionAction {
  final int _value;
  final int? _nativeValue;
  const CygnusFormResubmissionAction._internal(this._value, this._nativeValue);
  // ignore: unused_element
  factory CygnusFormResubmissionAction._internalMultiPlatform(
    int value,
    Function nativeValue,
  ) => CygnusFormResubmissionAction._internal(value, nativeValue());

  ///Don't resend data
  static const DONT_RESEND = CygnusFormResubmissionAction._internal(1, 1);

  ///Resend data
  static const RESEND = CygnusFormResubmissionAction._internal(0, 0);

  ///Set of all values of [CygnusFormResubmissionAction].
  static final Set<CygnusFormResubmissionAction> values = [
    CygnusFormResubmissionAction.DONT_RESEND,
    CygnusFormResubmissionAction.RESEND,
  ].toSet();

  ///Gets a possible [CygnusFormResubmissionAction] instance from [int] value.
  static CygnusFormResubmissionAction? fromValue(int? value) {
    if (value != null) {
      try {
        return CygnusFormResubmissionAction.values.firstWhere(
          (element) => element.toValue() == value,
        );
      } catch (e) {
        return null;
      }
    }
    return null;
  }

  ///Gets a possible [CygnusFormResubmissionAction] instance from a native value.
  static CygnusFormResubmissionAction? fromNativeValue(int? value) {
    if (value != null) {
      try {
        return CygnusFormResubmissionAction.values.firstWhere(
          (element) => element.toNativeValue() == value,
        );
      } catch (e) {
        return null;
      }
    }
    return null;
  }

  /// Gets a possible [CygnusFormResubmissionAction] instance value with name [name].
  ///
  /// Goes through [CygnusFormResubmissionAction.values] looking for a value with
  /// name [name], as reported by [CygnusFormResubmissionAction.name].
  /// Returns the first value with the given name, otherwise `null`.
  static CygnusFormResubmissionAction? byName(String? name) {
    if (name != null) {
      try {
        return CygnusFormResubmissionAction.values.firstWhere(
          (element) => element.name() == name,
        );
      } catch (e) {
        return null;
      }
    }
    return null;
  }

  /// Creates a map from the names of [CygnusFormResubmissionAction] values to the values.
  ///
  /// The collection that this method is called on is expected to have
  /// values with distinct names, like the `values` list of an enum class.
  /// Only one value for each name can occur in the created map,
  /// so if two or more values have the same name (either being the
  /// same value, or being values of different enum type), at most one of
  /// them will be represented in the returned map.
  static Map<String, CygnusFormResubmissionAction> asNameMap() =>
      <String, CygnusFormResubmissionAction>{
        for (final value in CygnusFormResubmissionAction.values)
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
        return 'DONT_RESEND';
      case 0:
        return 'RESEND';
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
