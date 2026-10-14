// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fetch_request_action.dart';

// **************************************************************************
// ExchangeableEnumGenerator
// **************************************************************************

///Class used by [CygnusFetchRequest] class.
class CygnusFetchRequestAction {
  final int _value;
  final int? _nativeValue;
  const CygnusFetchRequestAction._internal(this._value, this._nativeValue);
  // ignore: unused_element
  factory CygnusFetchRequestAction._internalMultiPlatform(
    int value,
    Function nativeValue,
  ) => CygnusFetchRequestAction._internal(value, nativeValue());

  ///Aborts the fetch request.
  static const ABORT = CygnusFetchRequestAction._internal(0, 0);

  ///Proceeds with the fetch request.
  static const PROCEED = CygnusFetchRequestAction._internal(1, 1);

  ///Set of all values of [CygnusFetchRequestAction].
  static final Set<CygnusFetchRequestAction> values = [
    CygnusFetchRequestAction.ABORT,
    CygnusFetchRequestAction.PROCEED,
  ].toSet();

  ///Gets a possible [CygnusFetchRequestAction] instance from [int] value.
  static CygnusFetchRequestAction? fromValue(int? value) {
    if (value != null) {
      try {
        return CygnusFetchRequestAction.values.firstWhere(
          (element) => element.toValue() == value,
        );
      } catch (e) {
        return null;
      }
    }
    return null;
  }

  ///Gets a possible [CygnusFetchRequestAction] instance from a native value.
  static CygnusFetchRequestAction? fromNativeValue(int? value) {
    if (value != null) {
      try {
        return CygnusFetchRequestAction.values.firstWhere(
          (element) => element.toNativeValue() == value,
        );
      } catch (e) {
        return null;
      }
    }
    return null;
  }

  /// Gets a possible [CygnusFetchRequestAction] instance value with name [name].
  ///
  /// Goes through [CygnusFetchRequestAction.values] looking for a value with
  /// name [name], as reported by [CygnusFetchRequestAction.name].
  /// Returns the first value with the given name, otherwise `null`.
  static CygnusFetchRequestAction? byName(String? name) {
    if (name != null) {
      try {
        return CygnusFetchRequestAction.values.firstWhere(
          (element) => element.name() == name,
        );
      } catch (e) {
        return null;
      }
    }
    return null;
  }

  /// Creates a map from the names of [CygnusFetchRequestAction] values to the values.
  ///
  /// The collection that this method is called on is expected to have
  /// values with distinct names, like the `values` list of an enum class.
  /// Only one value for each name can occur in the created map,
  /// so if two or more values have the same name (either being the
  /// same value, or being values of different enum type), at most one of
  /// them will be represented in the returned map.
  static Map<String, CygnusFetchRequestAction> asNameMap() =>
      <String, CygnusFetchRequestAction>{
        for (final value in CygnusFetchRequestAction.values)
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
