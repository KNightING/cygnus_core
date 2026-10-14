// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'save_as_kind.dart';

// **************************************************************************
// ExchangeableEnumGenerator
// **************************************************************************

///Constants that describe the Save As kind.
class CygnusSaveAsKind {
  final int _value;
  final int? _nativeValue;
  const CygnusSaveAsKind._internal(this._value, this._nativeValue);
  // ignore: unused_element
  factory CygnusSaveAsKind._internalMultiPlatform(
    int value,
    Function nativeValue,
  ) => CygnusSaveAsKind._internal(value, nativeValue());

  ///Save the page with a resources directory.
  static const COMPLETE = CygnusSaveAsKind._internal(3, 3);

  ///Default kind to save non-HTML content.
  static const DEFAULT = CygnusSaveAsKind._internal(0, 0);

  ///Save the page as HTML only.
  static const HTML_ONLY = CygnusSaveAsKind._internal(1, 1);

  ///Save the page as a single file (MHTML).
  static const SINGLE_FILE = CygnusSaveAsKind._internal(2, 2);

  ///Set of all values of [CygnusSaveAsKind].
  static final Set<CygnusSaveAsKind> values = [
    CygnusSaveAsKind.COMPLETE,
    CygnusSaveAsKind.DEFAULT,
    CygnusSaveAsKind.HTML_ONLY,
    CygnusSaveAsKind.SINGLE_FILE,
  ].toSet();

  ///Gets a possible [CygnusSaveAsKind] instance from [int] value.
  static CygnusSaveAsKind? fromValue(int? value) {
    if (value != null) {
      try {
        return CygnusSaveAsKind.values.firstWhere(
          (element) => element.toValue() == value,
        );
      } catch (e) {
        return null;
      }
    }
    return null;
  }

  ///Gets a possible [CygnusSaveAsKind] instance from a native value.
  static CygnusSaveAsKind? fromNativeValue(int? value) {
    if (value != null) {
      try {
        return CygnusSaveAsKind.values.firstWhere(
          (element) => element.toNativeValue() == value,
        );
      } catch (e) {
        return null;
      }
    }
    return null;
  }

  /// Gets a possible [CygnusSaveAsKind] instance value with name [name].
  ///
  /// Goes through [CygnusSaveAsKind.values] looking for a value with
  /// name [name], as reported by [CygnusSaveAsKind.name].
  /// Returns the first value with the given name, otherwise `null`.
  static CygnusSaveAsKind? byName(String? name) {
    if (name != null) {
      try {
        return CygnusSaveAsKind.values.firstWhere(
          (element) => element.name() == name,
        );
      } catch (e) {
        return null;
      }
    }
    return null;
  }

  /// Creates a map from the names of [CygnusSaveAsKind] values to the values.
  ///
  /// The collection that this method is called on is expected to have
  /// values with distinct names, like the `values` list of an enum class.
  /// Only one value for each name can occur in the created map,
  /// so if two or more values have the same name (either being the
  /// same value, or being values of different enum type), at most one of
  /// them will be represented in the returned map.
  static Map<String, CygnusSaveAsKind> asNameMap() =>
      <String, CygnusSaveAsKind>{
        for (final value in CygnusSaveAsKind.values) value.name(): value,
      };

  ///Gets [int] value.
  int toValue() => _value;

  ///Gets [int] native value if supported by the current platform, otherwise `null`.
  int? toNativeValue() => _nativeValue;

  ///Gets the name of the value.
  String name() {
    switch (_value) {
      case 3:
        return 'COMPLETE';
      case 0:
        return 'DEFAULT';
      case 1:
        return 'HTML_ONLY';
      case 2:
        return 'SINGLE_FILE';
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
