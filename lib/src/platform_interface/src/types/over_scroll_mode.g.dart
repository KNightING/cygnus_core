// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'over_scroll_mode.dart';

// **************************************************************************
// ExchangeableEnumGenerator
// **************************************************************************

///Class used to configure the `WebView`'s over-scroll mode.
///Setting the over-scroll mode of a WebView will have an effect only if the `WebView` is capable of scrolling.
class CygnusOverScrollMode {
  final int _value;
  final int? _nativeValue;
  const CygnusOverScrollMode._internal(this._value, this._nativeValue);
  // ignore: unused_element
  factory CygnusOverScrollMode._internalMultiPlatform(
    int value,
    Function nativeValue,
  ) => CygnusOverScrollMode._internal(value, nativeValue());

  ///Always allow a user to over-scroll this view, provided it is a view that can scroll.
  static const ALWAYS = CygnusOverScrollMode._internal(0, 0);

  ///Allow a user to over-scroll this view only if the content is large enough to meaningfully scroll, provided it is a view that can scroll.
  static const IF_CONTENT_SCROLLS = CygnusOverScrollMode._internal(1, 1);

  ///Never allow a user to over-scroll this view.
  static const NEVER = CygnusOverScrollMode._internal(2, 2);

  ///Set of all values of [CygnusOverScrollMode].
  static final Set<CygnusOverScrollMode> values = [
    CygnusOverScrollMode.ALWAYS,
    CygnusOverScrollMode.IF_CONTENT_SCROLLS,
    CygnusOverScrollMode.NEVER,
  ].toSet();

  ///Gets a possible [CygnusOverScrollMode] instance from [int] value.
  static CygnusOverScrollMode? fromValue(int? value) {
    if (value != null) {
      try {
        return CygnusOverScrollMode.values.firstWhere(
          (element) => element.toValue() == value,
        );
      } catch (e) {
        return null;
      }
    }
    return null;
  }

  ///Gets a possible [CygnusOverScrollMode] instance from a native value.
  static CygnusOverScrollMode? fromNativeValue(int? value) {
    if (value != null) {
      try {
        return CygnusOverScrollMode.values.firstWhere(
          (element) => element.toNativeValue() == value,
        );
      } catch (e) {
        return null;
      }
    }
    return null;
  }

  /// Gets a possible [CygnusOverScrollMode] instance value with name [name].
  ///
  /// Goes through [CygnusOverScrollMode.values] looking for a value with
  /// name [name], as reported by [CygnusOverScrollMode.name].
  /// Returns the first value with the given name, otherwise `null`.
  static CygnusOverScrollMode? byName(String? name) {
    if (name != null) {
      try {
        return CygnusOverScrollMode.values.firstWhere(
          (element) => element.name() == name,
        );
      } catch (e) {
        return null;
      }
    }
    return null;
  }

  /// Creates a map from the names of [CygnusOverScrollMode] values to the values.
  ///
  /// The collection that this method is called on is expected to have
  /// values with distinct names, like the `values` list of an enum class.
  /// Only one value for each name can occur in the created map,
  /// so if two or more values have the same name (either being the
  /// same value, or being values of different enum type), at most one of
  /// them will be represented in the returned map.
  static Map<String, CygnusOverScrollMode> asNameMap() =>
      <String, CygnusOverScrollMode>{
        for (final value in CygnusOverScrollMode.values) value.name(): value,
      };

  ///Gets [int] value.
  int toValue() => _value;

  ///Gets [int] native value if supported by the current platform, otherwise `null`.
  int? toNativeValue() => _nativeValue;

  ///Gets the name of the value.
  String name() {
    switch (_value) {
      case 0:
        return 'ALWAYS';
      case 1:
        return 'IF_CONTENT_SCROLLS';
      case 2:
        return 'NEVER';
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

///An Android-specific class used to configure the `WebView`'s over-scroll mode.
///Setting the over-scroll mode of a WebView will have an effect only if the `WebView` is capable of scrolling.
///Use [CygnusOverScrollMode] instead.
@Deprecated('Use CygnusOverScrollMode instead')
class CygnusAndroidOverScrollMode {
  final int _value;
  final int? _nativeValue;
  const CygnusAndroidOverScrollMode._internal(this._value, this._nativeValue);
  // ignore: unused_element
  factory CygnusAndroidOverScrollMode._internalMultiPlatform(
    int value,
    Function nativeValue,
  ) => CygnusAndroidOverScrollMode._internal(value, nativeValue());

  ///Always allow a user to over-scroll this view, provided it is a view that can scroll.
  static const OVER_SCROLL_ALWAYS = CygnusAndroidOverScrollMode._internal(0, 0);

  ///Allow a user to over-scroll this view only if the content is large enough to meaningfully scroll, provided it is a view that can scroll.
  static const OVER_SCROLL_IF_CONTENT_SCROLLS =
      CygnusAndroidOverScrollMode._internal(1, 1);

  ///Never allow a user to over-scroll this view.
  static const OVER_SCROLL_NEVER = CygnusAndroidOverScrollMode._internal(2, 2);

  ///Set of all values of [CygnusAndroidOverScrollMode].
  static final Set<CygnusAndroidOverScrollMode> values = [
    CygnusAndroidOverScrollMode.OVER_SCROLL_ALWAYS,
    CygnusAndroidOverScrollMode.OVER_SCROLL_IF_CONTENT_SCROLLS,
    CygnusAndroidOverScrollMode.OVER_SCROLL_NEVER,
  ].toSet();

  ///Gets a possible [CygnusAndroidOverScrollMode] instance from [int] value.
  static CygnusAndroidOverScrollMode? fromValue(int? value) {
    if (value != null) {
      try {
        return CygnusAndroidOverScrollMode.values.firstWhere(
          (element) => element.toValue() == value,
        );
      } catch (e) {
        return null;
      }
    }
    return null;
  }

  ///Gets a possible [CygnusAndroidOverScrollMode] instance from a native value.
  static CygnusAndroidOverScrollMode? fromNativeValue(int? value) {
    if (value != null) {
      try {
        return CygnusAndroidOverScrollMode.values.firstWhere(
          (element) => element.toNativeValue() == value,
        );
      } catch (e) {
        return null;
      }
    }
    return null;
  }

  /// Gets a possible [CygnusAndroidOverScrollMode] instance value with name [name].
  ///
  /// Goes through [CygnusAndroidOverScrollMode.values] looking for a value with
  /// name [name], as reported by [CygnusAndroidOverScrollMode.name].
  /// Returns the first value with the given name, otherwise `null`.
  static CygnusAndroidOverScrollMode? byName(String? name) {
    if (name != null) {
      try {
        return CygnusAndroidOverScrollMode.values.firstWhere(
          (element) => element.name() == name,
        );
      } catch (e) {
        return null;
      }
    }
    return null;
  }

  /// Creates a map from the names of [CygnusAndroidOverScrollMode] values to the values.
  ///
  /// The collection that this method is called on is expected to have
  /// values with distinct names, like the `values` list of an enum class.
  /// Only one value for each name can occur in the created map,
  /// so if two or more values have the same name (either being the
  /// same value, or being values of different enum type), at most one of
  /// them will be represented in the returned map.
  static Map<String, CygnusAndroidOverScrollMode> asNameMap() =>
      <String, CygnusAndroidOverScrollMode>{
        for (final value in CygnusAndroidOverScrollMode.values)
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
        return 'OVER_SCROLL_ALWAYS';
      case 1:
        return 'OVER_SCROLL_IF_CONTENT_SCROLLS';
      case 2:
        return 'OVER_SCROLL_NEVER';
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
