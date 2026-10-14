// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'favicon_image_format.dart';

// **************************************************************************
// ExchangeableEnumGenerator
// **************************************************************************

///Constants that describe the favicon image format.
class CygnusFaviconImageFormat {
  final int _value;
  final int? _nativeValue;
  const CygnusFaviconImageFormat._internal(this._value, this._nativeValue);
  // ignore: unused_element
  factory CygnusFaviconImageFormat._internalMultiPlatform(
    int value,
    Function nativeValue,
  ) => CygnusFaviconImageFormat._internal(value, nativeValue());

  ///JPEG image format.
  static const JPEG = CygnusFaviconImageFormat._internal(1, 1);

  ///PNG image format.
  static const PNG = CygnusFaviconImageFormat._internal(0, 0);

  ///Set of all values of [CygnusFaviconImageFormat].
  static final Set<CygnusFaviconImageFormat> values = [
    CygnusFaviconImageFormat.JPEG,
    CygnusFaviconImageFormat.PNG,
  ].toSet();

  ///Gets a possible [CygnusFaviconImageFormat] instance from [int] value.
  static CygnusFaviconImageFormat? fromValue(int? value) {
    if (value != null) {
      try {
        return CygnusFaviconImageFormat.values.firstWhere(
          (element) => element.toValue() == value,
        );
      } catch (e) {
        return null;
      }
    }
    return null;
  }

  ///Gets a possible [CygnusFaviconImageFormat] instance from a native value.
  static CygnusFaviconImageFormat? fromNativeValue(int? value) {
    if (value != null) {
      try {
        return CygnusFaviconImageFormat.values.firstWhere(
          (element) => element.toNativeValue() == value,
        );
      } catch (e) {
        return null;
      }
    }
    return null;
  }

  /// Gets a possible [CygnusFaviconImageFormat] instance value with name [name].
  ///
  /// Goes through [CygnusFaviconImageFormat.values] looking for a value with
  /// name [name], as reported by [CygnusFaviconImageFormat.name].
  /// Returns the first value with the given name, otherwise `null`.
  static CygnusFaviconImageFormat? byName(String? name) {
    if (name != null) {
      try {
        return CygnusFaviconImageFormat.values.firstWhere(
          (element) => element.name() == name,
        );
      } catch (e) {
        return null;
      }
    }
    return null;
  }

  /// Creates a map from the names of [CygnusFaviconImageFormat] values to the values.
  ///
  /// The collection that this method is called on is expected to have
  /// values with distinct names, like the `values` list of an enum class.
  /// Only one value for each name can occur in the created map,
  /// so if two or more values have the same name (either being the
  /// same value, or being values of different enum type), at most one of
  /// them will be represented in the returned map.
  static Map<String, CygnusFaviconImageFormat> asNameMap() =>
      <String, CygnusFaviconImageFormat>{
        for (final value in CygnusFaviconImageFormat.values)
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
        return 'JPEG';
      case 0:
        return 'PNG';
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
