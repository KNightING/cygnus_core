// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'window_type.dart';

// **************************************************************************
// ExchangeableEnumGenerator
// **************************************************************************

///Class that represents how a browser window should be added to the main window.
class CygnusWindowType {
  final String _value;
  final String? _nativeValue;
  const CygnusWindowType._internal(this._value, this._nativeValue);
  // ignore: unused_element
  factory CygnusWindowType._internalMultiPlatform(
    String value,
    Function nativeValue,
  ) => CygnusWindowType._internal(value, nativeValue());

  ///Adds the new browser window as a child window of the main window.
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- macOS WKWebView
  ///- Windows WebView2
  static final CHILD = CygnusWindowType._internalMultiPlatform('CHILD', () {
    switch (defaultTargetPlatform) {
      case TargetPlatform.macOS:
        return 'CHILD';
      case TargetPlatform.windows:
        return 'CHILD';
      default:
        break;
    }
    return null;
  });

  ///Adds the new browser window as a new tab in a tabbed window of the main window.
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- macOS WKWebView 10.12++
  static final TABBED = CygnusWindowType._internalMultiPlatform('TABBED', () {
    switch (defaultTargetPlatform) {
      case TargetPlatform.macOS:
        return 'TABBED';
      default:
        break;
    }
    return null;
  });

  ///Adds the new browser window as a separate new window from the main window.
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- macOS WKWebView
  ///- Windows WebView2
  static final WINDOW = CygnusWindowType._internalMultiPlatform('WINDOW', () {
    switch (defaultTargetPlatform) {
      case TargetPlatform.macOS:
        return 'WINDOW';
      case TargetPlatform.windows:
        return 'WINDOW';
      default:
        break;
    }
    return null;
  });

  ///Set of all values of [CygnusWindowType].
  static final Set<CygnusWindowType> values = [
    CygnusWindowType.CHILD,
    CygnusWindowType.TABBED,
    CygnusWindowType.WINDOW,
  ].toSet();

  ///Gets a possible [CygnusWindowType] instance from [String] value.
  static CygnusWindowType? fromValue(String? value) {
    if (value != null) {
      try {
        return CygnusWindowType.values.firstWhere(
          (element) => element.toValue() == value,
        );
      } catch (e) {
        return null;
      }
    }
    return null;
  }

  ///Gets a possible [CygnusWindowType] instance from a native value.
  static CygnusWindowType? fromNativeValue(String? value) {
    if (value != null) {
      try {
        return CygnusWindowType.values.firstWhere(
          (element) => element.toNativeValue() == value,
        );
      } catch (e) {
        return null;
      }
    }
    return null;
  }

  /// Gets a possible [CygnusWindowType] instance value with name [name].
  ///
  /// Goes through [CygnusWindowType.values] looking for a value with
  /// name [name], as reported by [CygnusWindowType.name].
  /// Returns the first value with the given name, otherwise `null`.
  static CygnusWindowType? byName(String? name) {
    if (name != null) {
      try {
        return CygnusWindowType.values.firstWhere(
          (element) => element.name() == name,
        );
      } catch (e) {
        return null;
      }
    }
    return null;
  }

  /// Creates a map from the names of [CygnusWindowType] values to the values.
  ///
  /// The collection that this method is called on is expected to have
  /// values with distinct names, like the `values` list of an enum class.
  /// Only one value for each name can occur in the created map,
  /// so if two or more values have the same name (either being the
  /// same value, or being values of different enum type), at most one of
  /// them will be represented in the returned map.
  static Map<String, CygnusWindowType> asNameMap() =>
      <String, CygnusWindowType>{
        for (final value in CygnusWindowType.values) value.name(): value,
      };

  ///Gets [String] value.
  String toValue() => _value;

  ///Gets [String] native value if supported by the current platform, otherwise `null`.
  String? toNativeValue() => _nativeValue;

  ///Gets the name of the value.
  String name() {
    switch (_value) {
      case 'CHILD':
        return 'CHILD';
      case 'TABBED':
        return 'TABBED';
      case 'WINDOW':
        return 'WINDOW';
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
