// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'safe_browsing_response_action.dart';

// **************************************************************************
// ExchangeableEnumGenerator
// **************************************************************************

///Class used by [CygnusSafeBrowsingResponse] class.
class CygnusSafeBrowsingResponseAction {
  final int _value;
  final int? _nativeValue;
  const CygnusSafeBrowsingResponseAction._internal(
    this._value,
    this._nativeValue,
  );
  // ignore: unused_element
  factory CygnusSafeBrowsingResponseAction._internalMultiPlatform(
    int value,
    Function nativeValue,
  ) => CygnusSafeBrowsingResponseAction._internal(value, nativeValue());

  ///Act as if the user clicked the "back to safety" button.
  static const BACK_TO_SAFETY = CygnusSafeBrowsingResponseAction._internal(
    0,
    0,
  );

  ///Act as if the user clicked the "visit this unsafe site" button.
  static const PROCEED = CygnusSafeBrowsingResponseAction._internal(1, 1);

  ///Display the default interstitial.
  static const SHOW_INTERSTITIAL = CygnusSafeBrowsingResponseAction._internal(
    2,
    2,
  );

  ///Set of all values of [CygnusSafeBrowsingResponseAction].
  static final Set<CygnusSafeBrowsingResponseAction> values = [
    CygnusSafeBrowsingResponseAction.BACK_TO_SAFETY,
    CygnusSafeBrowsingResponseAction.PROCEED,
    CygnusSafeBrowsingResponseAction.SHOW_INTERSTITIAL,
  ].toSet();

  ///Gets a possible [CygnusSafeBrowsingResponseAction] instance from [int] value.
  static CygnusSafeBrowsingResponseAction? fromValue(int? value) {
    if (value != null) {
      try {
        return CygnusSafeBrowsingResponseAction.values.firstWhere(
          (element) => element.toValue() == value,
        );
      } catch (e) {
        return null;
      }
    }
    return null;
  }

  ///Gets a possible [CygnusSafeBrowsingResponseAction] instance from a native value.
  static CygnusSafeBrowsingResponseAction? fromNativeValue(int? value) {
    if (value != null) {
      try {
        return CygnusSafeBrowsingResponseAction.values.firstWhere(
          (element) => element.toNativeValue() == value,
        );
      } catch (e) {
        return null;
      }
    }
    return null;
  }

  /// Gets a possible [CygnusSafeBrowsingResponseAction] instance value with name [name].
  ///
  /// Goes through [CygnusSafeBrowsingResponseAction.values] looking for a value with
  /// name [name], as reported by [CygnusSafeBrowsingResponseAction.name].
  /// Returns the first value with the given name, otherwise `null`.
  static CygnusSafeBrowsingResponseAction? byName(String? name) {
    if (name != null) {
      try {
        return CygnusSafeBrowsingResponseAction.values.firstWhere(
          (element) => element.name() == name,
        );
      } catch (e) {
        return null;
      }
    }
    return null;
  }

  /// Creates a map from the names of [CygnusSafeBrowsingResponseAction] values to the values.
  ///
  /// The collection that this method is called on is expected to have
  /// values with distinct names, like the `values` list of an enum class.
  /// Only one value for each name can occur in the created map,
  /// so if two or more values have the same name (either being the
  /// same value, or being values of different enum type), at most one of
  /// them will be represented in the returned map.
  static Map<String, CygnusSafeBrowsingResponseAction> asNameMap() =>
      <String, CygnusSafeBrowsingResponseAction>{
        for (final value in CygnusSafeBrowsingResponseAction.values)
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
        return 'BACK_TO_SAFETY';
      case 1:
        return 'PROCEED';
      case 2:
        return 'SHOW_INTERSTITIAL';
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
