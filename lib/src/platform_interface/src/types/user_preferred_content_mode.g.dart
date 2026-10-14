// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_preferred_content_mode.dart';

// **************************************************************************
// ExchangeableEnumGenerator
// **************************************************************************

///Class that represents the content mode to prefer when loading and rendering a webpage.
class CygnusUserPreferredContentMode {
  final int _value;
  final int? _nativeValue;
  const CygnusUserPreferredContentMode._internal(
    this._value,
    this._nativeValue,
  );
  // ignore: unused_element
  factory CygnusUserPreferredContentMode._internalMultiPlatform(
    int value,
    Function nativeValue,
  ) => CygnusUserPreferredContentMode._internal(value, nativeValue());

  ///Represents content targeting desktop browsers.
  static const DESKTOP = CygnusUserPreferredContentMode._internal(2, 2);

  ///Represents content targeting mobile browsers.
  static const MOBILE = CygnusUserPreferredContentMode._internal(1, 1);

  ///The recommended content mode for the current platform.
  static const RECOMMENDED = CygnusUserPreferredContentMode._internal(0, 0);

  ///Set of all values of [CygnusUserPreferredContentMode].
  static final Set<CygnusUserPreferredContentMode> values = [
    CygnusUserPreferredContentMode.DESKTOP,
    CygnusUserPreferredContentMode.MOBILE,
    CygnusUserPreferredContentMode.RECOMMENDED,
  ].toSet();

  ///Gets a possible [CygnusUserPreferredContentMode] instance from [int] value.
  static CygnusUserPreferredContentMode? fromValue(int? value) {
    if (value != null) {
      try {
        return CygnusUserPreferredContentMode.values.firstWhere(
          (element) => element.toValue() == value,
        );
      } catch (e) {
        return null;
      }
    }
    return null;
  }

  ///Gets a possible [CygnusUserPreferredContentMode] instance from a native value.
  static CygnusUserPreferredContentMode? fromNativeValue(int? value) {
    if (value != null) {
      try {
        return CygnusUserPreferredContentMode.values.firstWhere(
          (element) => element.toNativeValue() == value,
        );
      } catch (e) {
        return null;
      }
    }
    return null;
  }

  /// Gets a possible [CygnusUserPreferredContentMode] instance value with name [name].
  ///
  /// Goes through [CygnusUserPreferredContentMode.values] looking for a value with
  /// name [name], as reported by [CygnusUserPreferredContentMode.name].
  /// Returns the first value with the given name, otherwise `null`.
  static CygnusUserPreferredContentMode? byName(String? name) {
    if (name != null) {
      try {
        return CygnusUserPreferredContentMode.values.firstWhere(
          (element) => element.name() == name,
        );
      } catch (e) {
        return null;
      }
    }
    return null;
  }

  /// Creates a map from the names of [CygnusUserPreferredContentMode] values to the values.
  ///
  /// The collection that this method is called on is expected to have
  /// values with distinct names, like the `values` list of an enum class.
  /// Only one value for each name can occur in the created map,
  /// so if two or more values have the same name (either being the
  /// same value, or being values of different enum type), at most one of
  /// them will be represented in the returned map.
  static Map<String, CygnusUserPreferredContentMode> asNameMap() =>
      <String, CygnusUserPreferredContentMode>{
        for (final value in CygnusUserPreferredContentMode.values)
          value.name(): value,
      };

  ///Gets [int] value.
  int toValue() => _value;

  ///Gets [int] native value if supported by the current platform, otherwise `null`.
  int? toNativeValue() => _nativeValue;

  ///Gets the name of the value.
  String name() {
    switch (_value) {
      case 2:
        return 'DESKTOP';
      case 1:
        return 'MOBILE';
      case 0:
        return 'RECOMMENDED';
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
