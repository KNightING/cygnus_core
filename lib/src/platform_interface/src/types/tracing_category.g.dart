// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tracing_category.dart';

// **************************************************************************
// ExchangeableEnumGenerator
// **************************************************************************

///Constants that describe the results summary the find panel UI includes.
class CygnusTracingCategory {
  final int _value;
  final int? _nativeValue;
  const CygnusTracingCategory._internal(this._value, this._nativeValue);
  // ignore: unused_element
  factory CygnusTracingCategory._internalMultiPlatform(
    int value,
    Function nativeValue,
  ) => CygnusTracingCategory._internal(value, nativeValue());

  ///Predefined set of categories, includes all categories enabled by default in chromium.
  ///Use with caution: this setting may produce large trace output.
  static const CATEGORIES_ALL = CygnusTracingCategory._internal(1, 1);

  ///Predefined set of categories typically useful for analyzing WebViews.
  ///Typically includes "android_webview" and "Java" categories.
  static const CATEGORIES_ANDROID_WEBVIEW = CygnusTracingCategory._internal(
    2,
    2,
  );

  ///Predefined set of categories for studying difficult rendering performance problems.
  ///Typically includes "blink", "compositor", "gpu", "renderer.scheduler", "v8"
  ///and some other compositor categories which are disabled by default.
  static const CATEGORIES_FRAME_VIEWER = CygnusTracingCategory._internal(
    64,
    64,
  );

  ///Predefined set of categories for analyzing input latency issues.
  ///Typically includes "input", "renderer.scheduler" categories.
  static const CATEGORIES_INPUT_LATENCY = CygnusTracingCategory._internal(8, 8);

  ///Predefined set of categories for analyzing javascript and rendering issues.
  ///Typically includes "blink", "compositor", "gpu", "renderer.scheduler" and "v8" categories.
  static const CATEGORIES_JAVASCRIPT_AND_RENDERING =
      CygnusTracingCategory._internal(32, 32);

  ///Indicates that there are no predefined categories.
  static const CATEGORIES_NONE = CygnusTracingCategory._internal(0, 0);

  ///Predefined set of categories for analyzing rendering issues.
  ///Typically includes "blink", "compositor" and "gpu" categories.
  static const CATEGORIES_RENDERING = CygnusTracingCategory._internal(16, 16);

  ///Predefined set of categories typically useful for web developers.
  ///Typically includes "blink", "compositor", "renderer.scheduler" and "v8" categories.
  static const CATEGORIES_WEB_DEVELOPER = CygnusTracingCategory._internal(4, 4);

  ///Set of all values of [CygnusTracingCategory].
  static final Set<CygnusTracingCategory> values = [
    CygnusTracingCategory.CATEGORIES_ALL,
    CygnusTracingCategory.CATEGORIES_ANDROID_WEBVIEW,
    CygnusTracingCategory.CATEGORIES_FRAME_VIEWER,
    CygnusTracingCategory.CATEGORIES_INPUT_LATENCY,
    CygnusTracingCategory.CATEGORIES_JAVASCRIPT_AND_RENDERING,
    CygnusTracingCategory.CATEGORIES_NONE,
    CygnusTracingCategory.CATEGORIES_RENDERING,
    CygnusTracingCategory.CATEGORIES_WEB_DEVELOPER,
  ].toSet();

  ///Gets a possible [CygnusTracingCategory] instance from [int] value.
  static CygnusTracingCategory? fromValue(int? value) {
    if (value != null) {
      try {
        return CygnusTracingCategory.values.firstWhere(
          (element) => element.toValue() == value,
        );
      } catch (e) {
        return null;
      }
    }
    return null;
  }

  ///Gets a possible [CygnusTracingCategory] instance from a native value.
  static CygnusTracingCategory? fromNativeValue(int? value) {
    if (value != null) {
      try {
        return CygnusTracingCategory.values.firstWhere(
          (element) => element.toNativeValue() == value,
        );
      } catch (e) {
        return null;
      }
    }
    return null;
  }

  /// Gets a possible [CygnusTracingCategory] instance value with name [name].
  ///
  /// Goes through [CygnusTracingCategory.values] looking for a value with
  /// name [name], as reported by [CygnusTracingCategory.name].
  /// Returns the first value with the given name, otherwise `null`.
  static CygnusTracingCategory? byName(String? name) {
    if (name != null) {
      try {
        return CygnusTracingCategory.values.firstWhere(
          (element) => element.name() == name,
        );
      } catch (e) {
        return null;
      }
    }
    return null;
  }

  /// Creates a map from the names of [CygnusTracingCategory] values to the values.
  ///
  /// The collection that this method is called on is expected to have
  /// values with distinct names, like the `values` list of an enum class.
  /// Only one value for each name can occur in the created map,
  /// so if two or more values have the same name (either being the
  /// same value, or being values of different enum type), at most one of
  /// them will be represented in the returned map.
  static Map<String, CygnusTracingCategory> asNameMap() =>
      <String, CygnusTracingCategory>{
        for (final value in CygnusTracingCategory.values) value.name(): value,
      };

  ///Gets [int] value.
  int toValue() => _value;

  ///Gets [int] native value if supported by the current platform, otherwise `null`.
  int? toNativeValue() => _nativeValue;

  ///Gets the name of the value.
  String name() {
    switch (_value) {
      case 1:
        return 'CATEGORIES_ALL';
      case 2:
        return 'CATEGORIES_ANDROID_WEBVIEW';
      case 64:
        return 'CATEGORIES_FRAME_VIEWER';
      case 8:
        return 'CATEGORIES_INPUT_LATENCY';
      case 32:
        return 'CATEGORIES_JAVASCRIPT_AND_RENDERING';
      case 0:
        return 'CATEGORIES_NONE';
      case 16:
        return 'CATEGORIES_RENDERING';
      case 4:
        return 'CATEGORIES_WEB_DEVELOPER';
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
