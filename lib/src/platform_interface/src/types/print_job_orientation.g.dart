// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'print_job_orientation.dart';

// **************************************************************************
// ExchangeableEnumGenerator
// **************************************************************************

///Class representing the orientation of a [CygnusPlatformPrintJobController].
class CygnusPrintJobOrientation {
  final int _value;
  final int? _nativeValue;
  const CygnusPrintJobOrientation._internal(this._value, this._nativeValue);
  // ignore: unused_element
  factory CygnusPrintJobOrientation._internalMultiPlatform(
    int value,
    Function nativeValue,
  ) => CygnusPrintJobOrientation._internal(value, nativeValue());

  ///Pages are printed in landscape orientation.
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView
  ///- iOS WKWebView
  ///- macOS WKWebView
  ///- Windows WebView2
  static final LANDSCAPE = CygnusPrintJobOrientation._internalMultiPlatform(
    1,
    () {
      switch (defaultTargetPlatform) {
        case TargetPlatform.android:
          return 1;
        case TargetPlatform.iOS:
          return 1;
        case TargetPlatform.macOS:
          return 1;
        case TargetPlatform.windows:
          return 1;
        default:
          break;
      }
      return null;
    },
  );

  ///Pages are printed in portrait orientation.
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView
  ///- iOS WKWebView
  ///- macOS WKWebView
  ///- Windows WebView2
  static final PORTRAIT = CygnusPrintJobOrientation._internalMultiPlatform(
    0,
    () {
      switch (defaultTargetPlatform) {
        case TargetPlatform.android:
          return 0;
        case TargetPlatform.iOS:
          return 0;
        case TargetPlatform.macOS:
          return 0;
        case TargetPlatform.windows:
          return 0;
        default:
          break;
      }
      return null;
    },
  );

  ///Set of all values of [CygnusPrintJobOrientation].
  static final Set<CygnusPrintJobOrientation> values = [
    CygnusPrintJobOrientation.LANDSCAPE,
    CygnusPrintJobOrientation.PORTRAIT,
  ].toSet();

  ///Gets a possible [CygnusPrintJobOrientation] instance from [int] value.
  static CygnusPrintJobOrientation? fromValue(int? value) {
    if (value != null) {
      try {
        return CygnusPrintJobOrientation.values.firstWhere(
          (element) => element.toValue() == value,
        );
      } catch (e) {
        return null;
      }
    }
    return null;
  }

  ///Gets a possible [CygnusPrintJobOrientation] instance from a native value.
  static CygnusPrintJobOrientation? fromNativeValue(int? value) {
    if (value != null) {
      try {
        return CygnusPrintJobOrientation.values.firstWhere(
          (element) => element.toNativeValue() == value,
        );
      } catch (e) {
        return null;
      }
    }
    return null;
  }

  /// Gets a possible [CygnusPrintJobOrientation] instance value with name [name].
  ///
  /// Goes through [CygnusPrintJobOrientation.values] looking for a value with
  /// name [name], as reported by [CygnusPrintJobOrientation.name].
  /// Returns the first value with the given name, otherwise `null`.
  static CygnusPrintJobOrientation? byName(String? name) {
    if (name != null) {
      try {
        return CygnusPrintJobOrientation.values.firstWhere(
          (element) => element.name() == name,
        );
      } catch (e) {
        return null;
      }
    }
    return null;
  }

  /// Creates a map from the names of [CygnusPrintJobOrientation] values to the values.
  ///
  /// The collection that this method is called on is expected to have
  /// values with distinct names, like the `values` list of an enum class.
  /// Only one value for each name can occur in the created map,
  /// so if two or more values have the same name (either being the
  /// same value, or being values of different enum type), at most one of
  /// them will be represented in the returned map.
  static Map<String, CygnusPrintJobOrientation> asNameMap() =>
      <String, CygnusPrintJobOrientation>{
        for (final value in CygnusPrintJobOrientation.values)
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
        return 'LANDSCAPE';
      case 0:
        return 'PORTRAIT';
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
