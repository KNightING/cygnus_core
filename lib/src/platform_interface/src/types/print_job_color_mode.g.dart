// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'print_job_color_mode.dart';

// **************************************************************************
// ExchangeableEnumGenerator
// **************************************************************************

///Class representing how the printed content of a [CygnusPlatformPrintJobController] should be laid out.
class CygnusPrintJobColorMode {
  final int _value;
  final dynamic _nativeValue;
  const CygnusPrintJobColorMode._internal(this._value, this._nativeValue);
  // ignore: unused_element
  factory CygnusPrintJobColorMode._internalMultiPlatform(
    int value,
    Function nativeValue,
  ) => CygnusPrintJobColorMode._internal(value, nativeValue());

  ///Color color scheme, for example many colors are used.
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView
  ///- macOS WKWebView
  ///- Windows WebView2
  static final COLOR = CygnusPrintJobColorMode._internalMultiPlatform(2, () {
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return 2;
      case TargetPlatform.macOS:
        return 'RGB';
      case TargetPlatform.windows:
        return 1;
      default:
        break;
    }
    return null;
  });

  ///Monochrome color scheme, for example one color is used.
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView
  ///- Windows WebView2
  static final DEFAULT = CygnusPrintJobColorMode._internalMultiPlatform(0, () {
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return 0;
      case TargetPlatform.windows:
        return 0;
      default:
        break;
    }
    return null;
  });

  ///Monochrome color scheme, for example one color is used.
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView
  ///- macOS WKWebView
  ///- Windows WebView2
  static final MONOCHROME = CygnusPrintJobColorMode._internalMultiPlatform(
    1,
    () {
      switch (defaultTargetPlatform) {
        case TargetPlatform.android:
          return 1;
        case TargetPlatform.macOS:
          return 'Gray';
        case TargetPlatform.windows:
          return 2;
        default:
          break;
      }
      return null;
    },
  );

  ///Set of all values of [CygnusPrintJobColorMode].
  static final Set<CygnusPrintJobColorMode> values = [
    CygnusPrintJobColorMode.COLOR,
    CygnusPrintJobColorMode.DEFAULT,
    CygnusPrintJobColorMode.MONOCHROME,
  ].toSet();

  ///Gets a possible [CygnusPrintJobColorMode] instance from [int] value.
  static CygnusPrintJobColorMode? fromValue(int? value) {
    if (value != null) {
      try {
        return CygnusPrintJobColorMode.values.firstWhere(
          (element) => element.toValue() == value,
        );
      } catch (e) {
        return null;
      }
    }
    return null;
  }

  ///Gets a possible [CygnusPrintJobColorMode] instance from a native value.
  static CygnusPrintJobColorMode? fromNativeValue(dynamic value) {
    if (value != null) {
      try {
        return CygnusPrintJobColorMode.values.firstWhere(
          (element) => element.toNativeValue() == value,
        );
      } catch (e) {
        return null;
      }
    }
    return null;
  }

  /// Gets a possible [CygnusPrintJobColorMode] instance value with name [name].
  ///
  /// Goes through [CygnusPrintJobColorMode.values] looking for a value with
  /// name [name], as reported by [CygnusPrintJobColorMode.name].
  /// Returns the first value with the given name, otherwise `null`.
  static CygnusPrintJobColorMode? byName(String? name) {
    if (name != null) {
      try {
        return CygnusPrintJobColorMode.values.firstWhere(
          (element) => element.name() == name,
        );
      } catch (e) {
        return null;
      }
    }
    return null;
  }

  /// Creates a map from the names of [CygnusPrintJobColorMode] values to the values.
  ///
  /// The collection that this method is called on is expected to have
  /// values with distinct names, like the `values` list of an enum class.
  /// Only one value for each name can occur in the created map,
  /// so if two or more values have the same name (either being the
  /// same value, or being values of different enum type), at most one of
  /// them will be represented in the returned map.
  static Map<String, CygnusPrintJobColorMode> asNameMap() =>
      <String, CygnusPrintJobColorMode>{
        for (final value in CygnusPrintJobColorMode.values) value.name(): value,
      };

  ///Gets [int] value.
  int toValue() => _value;

  ///Gets [dynamic] native value if supported by the current platform, otherwise `null`.
  dynamic toNativeValue() => _nativeValue;

  ///Gets the name of the value.
  String name() {
    switch (_value) {
      case 2:
        return 'COLOR';
      case 0:
        return 'DEFAULT';
      case 1:
        return 'MONOCHROME';
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
