// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'url_request_attribution.dart';

// **************************************************************************
// ExchangeableEnumGenerator
// **************************************************************************

///Class that represents the constants used to indicate the entities that can make a network request.
class CygnusURLRequestAttribution {
  final int _value;
  final int? _nativeValue;
  const CygnusURLRequestAttribution._internal(this._value, this._nativeValue);
  // ignore: unused_element
  factory CygnusURLRequestAttribution._internalMultiPlatform(
    int value,
    Function nativeValue,
  ) => CygnusURLRequestAttribution._internal(value, nativeValue());

  ///A developer-initiated network request.
  ///
  ///Use this value for the attribution parameter of a [CygnusURLRequest] that your app makes for any purpose other than when the user explicitly accesses a link.
  ///This includes requests that your app makes to get user data. This is the default value.
  ///
  ///For cases where the user enters a URL, like in the navigation bar of a web browser, or taps or clicks a URL to load the content it represents, use the [CygnusURLRequestAttribution.USER] value instead.
  static const DEVELOPER = CygnusURLRequestAttribution._internal(0, 0);

  ///Use this value for the attribution parameter of a [CygnusURLRequest] that satisfies a user request to access an explicit, unmodified URL.
  ///In all other cases, use the [CygnusURLRequestAttribution.DEVELOPER] value instead.
  static const USER = CygnusURLRequestAttribution._internal(1, 1);

  ///Set of all values of [CygnusURLRequestAttribution].
  static final Set<CygnusURLRequestAttribution> values = [
    CygnusURLRequestAttribution.DEVELOPER,
    CygnusURLRequestAttribution.USER,
  ].toSet();

  ///Gets a possible [CygnusURLRequestAttribution] instance from [int] value.
  static CygnusURLRequestAttribution? fromValue(int? value) {
    if (value != null) {
      try {
        return CygnusURLRequestAttribution.values.firstWhere(
          (element) => element.toValue() == value,
        );
      } catch (e) {
        return null;
      }
    }
    return null;
  }

  ///Gets a possible [CygnusURLRequestAttribution] instance from a native value.
  static CygnusURLRequestAttribution? fromNativeValue(int? value) {
    if (value != null) {
      try {
        return CygnusURLRequestAttribution.values.firstWhere(
          (element) => element.toNativeValue() == value,
        );
      } catch (e) {
        return null;
      }
    }
    return null;
  }

  /// Gets a possible [CygnusURLRequestAttribution] instance value with name [name].
  ///
  /// Goes through [CygnusURLRequestAttribution.values] looking for a value with
  /// name [name], as reported by [CygnusURLRequestAttribution.name].
  /// Returns the first value with the given name, otherwise `null`.
  static CygnusURLRequestAttribution? byName(String? name) {
    if (name != null) {
      try {
        return CygnusURLRequestAttribution.values.firstWhere(
          (element) => element.name() == name,
        );
      } catch (e) {
        return null;
      }
    }
    return null;
  }

  /// Creates a map from the names of [CygnusURLRequestAttribution] values to the values.
  ///
  /// The collection that this method is called on is expected to have
  /// values with distinct names, like the `values` list of an enum class.
  /// Only one value for each name can occur in the created map,
  /// so if two or more values have the same name (either being the
  /// same value, or being values of different enum type), at most one of
  /// them will be represented in the returned map.
  static Map<String, CygnusURLRequestAttribution> asNameMap() =>
      <String, CygnusURLRequestAttribution>{
        for (final value in CygnusURLRequestAttribution.values)
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
        return 'DEVELOPER';
      case 1:
        return 'USER';
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
