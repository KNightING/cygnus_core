// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'print_job_pagination_mode.dart';

// **************************************************************************
// ExchangeableEnumGenerator
// **************************************************************************

///Class representing the constants that specify the different ways in which an image is divided into pages of a [CygnusPlatformPrintJobController].
class CygnusPrintJobPaginationMode {
  final String _value;
  final int? _nativeValue;
  const CygnusPrintJobPaginationMode._internal(this._value, this._nativeValue);
  // ignore: unused_element
  factory CygnusPrintJobPaginationMode._internalMultiPlatform(
    String value,
    Function nativeValue,
  ) => CygnusPrintJobPaginationMode._internal(value, nativeValue());

  ///
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- macOS WKWebView
  static final AUTOMATIC = CygnusPrintJobPaginationMode._internalMultiPlatform(
    'AUTOMATIC',
    () {
      switch (defaultTargetPlatform) {
        case TargetPlatform.macOS:
          return 0;
        default:
          break;
      }
      return null;
    },
  );

  ///
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- macOS WKWebView
  static final CLIP = CygnusPrintJobPaginationMode._internalMultiPlatform(
    'CLIP',
    () {
      switch (defaultTargetPlatform) {
        case TargetPlatform.macOS:
          return 2;
        default:
          break;
      }
      return null;
    },
  );

  ///
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- macOS WKWebView
  static final FIT = CygnusPrintJobPaginationMode._internalMultiPlatform(
    'FIT',
    () {
      switch (defaultTargetPlatform) {
        case TargetPlatform.macOS:
          return 1;
        default:
          break;
      }
      return null;
    },
  );

  ///Set of all values of [CygnusPrintJobPaginationMode].
  static final Set<CygnusPrintJobPaginationMode> values = [
    CygnusPrintJobPaginationMode.AUTOMATIC,
    CygnusPrintJobPaginationMode.CLIP,
    CygnusPrintJobPaginationMode.FIT,
  ].toSet();

  ///Gets a possible [CygnusPrintJobPaginationMode] instance from [String] value.
  static CygnusPrintJobPaginationMode? fromValue(String? value) {
    if (value != null) {
      try {
        return CygnusPrintJobPaginationMode.values.firstWhere(
          (element) => element.toValue() == value,
        );
      } catch (e) {
        return null;
      }
    }
    return null;
  }

  ///Gets a possible [CygnusPrintJobPaginationMode] instance from a native value.
  static CygnusPrintJobPaginationMode? fromNativeValue(int? value) {
    if (value != null) {
      try {
        return CygnusPrintJobPaginationMode.values.firstWhere(
          (element) => element.toNativeValue() == value,
        );
      } catch (e) {
        return null;
      }
    }
    return null;
  }

  /// Gets a possible [CygnusPrintJobPaginationMode] instance value with name [name].
  ///
  /// Goes through [CygnusPrintJobPaginationMode.values] looking for a value with
  /// name [name], as reported by [CygnusPrintJobPaginationMode.name].
  /// Returns the first value with the given name, otherwise `null`.
  static CygnusPrintJobPaginationMode? byName(String? name) {
    if (name != null) {
      try {
        return CygnusPrintJobPaginationMode.values.firstWhere(
          (element) => element.name() == name,
        );
      } catch (e) {
        return null;
      }
    }
    return null;
  }

  /// Creates a map from the names of [CygnusPrintJobPaginationMode] values to the values.
  ///
  /// The collection that this method is called on is expected to have
  /// values with distinct names, like the `values` list of an enum class.
  /// Only one value for each name can occur in the created map,
  /// so if two or more values have the same name (either being the
  /// same value, or being values of different enum type), at most one of
  /// them will be represented in the returned map.
  static Map<String, CygnusPrintJobPaginationMode> asNameMap() =>
      <String, CygnusPrintJobPaginationMode>{
        for (final value in CygnusPrintJobPaginationMode.values)
          value.name(): value,
      };

  ///Gets [String] value.
  String toValue() => _value;

  ///Gets [int] native value if supported by the current platform, otherwise `null`.
  int? toNativeValue() => _nativeValue;

  ///Gets the name of the value.
  String name() {
    switch (_value) {
      case 'AUTOMATIC':
        return 'AUTOMATIC';
      case 'CLIP':
        return 'CLIP';
      case 'FIT':
        return 'FIT';
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
    return _value;
  }
}
