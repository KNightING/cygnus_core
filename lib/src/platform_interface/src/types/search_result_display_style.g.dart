// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_result_display_style.dart';

// **************************************************************************
// ExchangeableEnumGenerator
// **************************************************************************

///Constants that describe the results summary the find panel UI includes.
class CygnusSearchResultDisplayStyle {
  final int _value;
  final int? _nativeValue;
  const CygnusSearchResultDisplayStyle._internal(
    this._value,
    this._nativeValue,
  );
  // ignore: unused_element
  factory CygnusSearchResultDisplayStyle._internalMultiPlatform(
    int value,
    Function nativeValue,
  ) => CygnusSearchResultDisplayStyle._internal(value, nativeValue());

  ///The find panel includes the total number of results the session reports and the index of the target result.
  static const CURRENT_AND_TOTAL = CygnusSearchResultDisplayStyle._internal(
    0,
    0,
  );

  ///The find panel doesn’t include the number of results the session reports.
  static const NONE = CygnusSearchResultDisplayStyle._internal(2, 2);

  ///The find panel includes the total number of results the session reports.
  static const TOTAL = CygnusSearchResultDisplayStyle._internal(1, 1);

  ///Set of all values of [CygnusSearchResultDisplayStyle].
  static final Set<CygnusSearchResultDisplayStyle> values = [
    CygnusSearchResultDisplayStyle.CURRENT_AND_TOTAL,
    CygnusSearchResultDisplayStyle.NONE,
    CygnusSearchResultDisplayStyle.TOTAL,
  ].toSet();

  ///Gets a possible [CygnusSearchResultDisplayStyle] instance from [int] value.
  static CygnusSearchResultDisplayStyle? fromValue(int? value) {
    if (value != null) {
      try {
        return CygnusSearchResultDisplayStyle.values.firstWhere(
          (element) => element.toValue() == value,
        );
      } catch (e) {
        return null;
      }
    }
    return null;
  }

  ///Gets a possible [CygnusSearchResultDisplayStyle] instance from a native value.
  static CygnusSearchResultDisplayStyle? fromNativeValue(int? value) {
    if (value != null) {
      try {
        return CygnusSearchResultDisplayStyle.values.firstWhere(
          (element) => element.toNativeValue() == value,
        );
      } catch (e) {
        return null;
      }
    }
    return null;
  }

  /// Gets a possible [CygnusSearchResultDisplayStyle] instance value with name [name].
  ///
  /// Goes through [CygnusSearchResultDisplayStyle.values] looking for a value with
  /// name [name], as reported by [CygnusSearchResultDisplayStyle.name].
  /// Returns the first value with the given name, otherwise `null`.
  static CygnusSearchResultDisplayStyle? byName(String? name) {
    if (name != null) {
      try {
        return CygnusSearchResultDisplayStyle.values.firstWhere(
          (element) => element.name() == name,
        );
      } catch (e) {
        return null;
      }
    }
    return null;
  }

  /// Creates a map from the names of [CygnusSearchResultDisplayStyle] values to the values.
  ///
  /// The collection that this method is called on is expected to have
  /// values with distinct names, like the `values` list of an enum class.
  /// Only one value for each name can occur in the created map,
  /// so if two or more values have the same name (either being the
  /// same value, or being values of different enum type), at most one of
  /// them will be represented in the returned map.
  static Map<String, CygnusSearchResultDisplayStyle> asNameMap() =>
      <String, CygnusSearchResultDisplayStyle>{
        for (final value in CygnusSearchResultDisplayStyle.values)
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
        return 'CURRENT_AND_TOTAL';
      case 2:
        return 'NONE';
      case 1:
        return 'TOTAL';
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
