// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'scrollbar_style.dart';

// **************************************************************************
// ExchangeableEnumGenerator
// **************************************************************************

///Class used to configure the style of the scrollbars.
///The scrollbars can be overlaid or inset.
///When inset, they add to the padding of the view. And the scrollbars can be drawn inside the padding area or on the edge of the view.
///For example, if a view has a background drawable and you want to draw the scrollbars inside the padding specified by the drawable,
///you can use [CygnusScrollBarStyle.SCROLLBARS_INSIDE_OVERLAY] or [CygnusScrollBarStyle.SCROLLBARS_INSIDE_INSET].
///If you want them to appear at the edge of the view, ignoring the padding,
///then you can use [CygnusScrollBarStyle.SCROLLBARS_OUTSIDE_OVERLAY] or [CygnusScrollBarStyle.SCROLLBARS_OUTSIDE_INSET].
class CygnusScrollBarStyle {
  final int _value;
  final int? _nativeValue;
  const CygnusScrollBarStyle._internal(this._value, this._nativeValue);
  // ignore: unused_element
  factory CygnusScrollBarStyle._internalMultiPlatform(
    int value,
    Function nativeValue,
  ) => CygnusScrollBarStyle._internal(value, nativeValue());

  ///The scrollbar style to display the scrollbars inside the padded area, increasing the padding of the view.
  ///The scrollbars will not overlap the content area of the view.
  static const SCROLLBARS_INSIDE_INSET = CygnusScrollBarStyle._internal(
    16777216,
    16777216,
  );

  ///The scrollbar style to display the scrollbars inside the content area, without increasing the padding.
  ///The scrollbars will be overlaid with translucency on the view's content.
  static const SCROLLBARS_INSIDE_OVERLAY = CygnusScrollBarStyle._internal(0, 0);

  ///The scrollbar style to display the scrollbars at the edge of the view, increasing the padding of the view.
  ///The scrollbars will only overlap the background, if any.
  static const SCROLLBARS_OUTSIDE_INSET = CygnusScrollBarStyle._internal(
    50331648,
    50331648,
  );

  ///The scrollbar style to display the scrollbars at the edge of the view, without increasing the padding.
  ///The scrollbars will be overlaid with translucency.
  static const SCROLLBARS_OUTSIDE_OVERLAY = CygnusScrollBarStyle._internal(
    33554432,
    33554432,
  );

  ///Set of all values of [CygnusScrollBarStyle].
  static final Set<CygnusScrollBarStyle> values = [
    CygnusScrollBarStyle.SCROLLBARS_INSIDE_INSET,
    CygnusScrollBarStyle.SCROLLBARS_INSIDE_OVERLAY,
    CygnusScrollBarStyle.SCROLLBARS_OUTSIDE_INSET,
    CygnusScrollBarStyle.SCROLLBARS_OUTSIDE_OVERLAY,
  ].toSet();

  ///Gets a possible [CygnusScrollBarStyle] instance from [int] value.
  static CygnusScrollBarStyle? fromValue(int? value) {
    if (value != null) {
      try {
        return CygnusScrollBarStyle.values.firstWhere(
          (element) => element.toValue() == value,
        );
      } catch (e) {
        return null;
      }
    }
    return null;
  }

  ///Gets a possible [CygnusScrollBarStyle] instance from a native value.
  static CygnusScrollBarStyle? fromNativeValue(int? value) {
    if (value != null) {
      try {
        return CygnusScrollBarStyle.values.firstWhere(
          (element) => element.toNativeValue() == value,
        );
      } catch (e) {
        return null;
      }
    }
    return null;
  }

  /// Gets a possible [CygnusScrollBarStyle] instance value with name [name].
  ///
  /// Goes through [CygnusScrollBarStyle.values] looking for a value with
  /// name [name], as reported by [CygnusScrollBarStyle.name].
  /// Returns the first value with the given name, otherwise `null`.
  static CygnusScrollBarStyle? byName(String? name) {
    if (name != null) {
      try {
        return CygnusScrollBarStyle.values.firstWhere(
          (element) => element.name() == name,
        );
      } catch (e) {
        return null;
      }
    }
    return null;
  }

  /// Creates a map from the names of [CygnusScrollBarStyle] values to the values.
  ///
  /// The collection that this method is called on is expected to have
  /// values with distinct names, like the `values` list of an enum class.
  /// Only one value for each name can occur in the created map,
  /// so if two or more values have the same name (either being the
  /// same value, or being values of different enum type), at most one of
  /// them will be represented in the returned map.
  static Map<String, CygnusScrollBarStyle> asNameMap() =>
      <String, CygnusScrollBarStyle>{
        for (final value in CygnusScrollBarStyle.values) value.name(): value,
      };

  ///Gets [int] value.
  int toValue() => _value;

  ///Gets [int] native value if supported by the current platform, otherwise `null`.
  int? toNativeValue() => _nativeValue;

  ///Gets the name of the value.
  String name() {
    switch (_value) {
      case 16777216:
        return 'SCROLLBARS_INSIDE_INSET';
      case 0:
        return 'SCROLLBARS_INSIDE_OVERLAY';
      case 50331648:
        return 'SCROLLBARS_OUTSIDE_INSET';
      case 33554432:
        return 'SCROLLBARS_OUTSIDE_OVERLAY';
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

///An Android-specific class used to configure the style of the scrollbars.
///The scrollbars can be overlaid or inset.
///When inset, they add to the padding of the view. And the scrollbars can be drawn inside the padding area or on the edge of the view.
///For example, if a view has a background drawable and you want to draw the scrollbars inside the padding specified by the drawable,
///you can use [CygnusAndroidScrollBarStyle.SCROLLBARS_INSIDE_OVERLAY] or [CygnusAndroidScrollBarStyle.SCROLLBARS_INSIDE_INSET].
///If you want them to appear at the edge of the view, ignoring the padding,
///then you can use [CygnusAndroidScrollBarStyle.SCROLLBARS_OUTSIDE_OVERLAY] or [CygnusAndroidScrollBarStyle.SCROLLBARS_OUTSIDE_INSET].
///
///Use [CygnusScrollBarStyle] instead.
@Deprecated('Use CygnusScrollBarStyle instead')
class CygnusAndroidScrollBarStyle {
  final int _value;
  final int? _nativeValue;
  const CygnusAndroidScrollBarStyle._internal(this._value, this._nativeValue);
  // ignore: unused_element
  factory CygnusAndroidScrollBarStyle._internalMultiPlatform(
    int value,
    Function nativeValue,
  ) => CygnusAndroidScrollBarStyle._internal(value, nativeValue());

  ///The scrollbar style to display the scrollbars inside the padded area, increasing the padding of the view.
  ///The scrollbars will not overlap the content area of the view.
  static const SCROLLBARS_INSIDE_INSET = CygnusAndroidScrollBarStyle._internal(
    16777216,
    16777216,
  );

  ///The scrollbar style to display the scrollbars inside the content area, without increasing the padding.
  ///The scrollbars will be overlaid with translucency on the view's content.
  static const SCROLLBARS_INSIDE_OVERLAY =
      CygnusAndroidScrollBarStyle._internal(0, 0);

  ///The scrollbar style to display the scrollbars at the edge of the view, increasing the padding of the view.
  ///The scrollbars will only overlap the background, if any.
  static const SCROLLBARS_OUTSIDE_INSET = CygnusAndroidScrollBarStyle._internal(
    50331648,
    50331648,
  );

  ///The scrollbar style to display the scrollbars at the edge of the view, without increasing the padding.
  ///The scrollbars will be overlaid with translucency.
  static const SCROLLBARS_OUTSIDE_OVERLAY =
      CygnusAndroidScrollBarStyle._internal(33554432, 33554432);

  ///Set of all values of [CygnusAndroidScrollBarStyle].
  static final Set<CygnusAndroidScrollBarStyle> values = [
    CygnusAndroidScrollBarStyle.SCROLLBARS_INSIDE_INSET,
    CygnusAndroidScrollBarStyle.SCROLLBARS_INSIDE_OVERLAY,
    CygnusAndroidScrollBarStyle.SCROLLBARS_OUTSIDE_INSET,
    CygnusAndroidScrollBarStyle.SCROLLBARS_OUTSIDE_OVERLAY,
  ].toSet();

  ///Gets a possible [CygnusAndroidScrollBarStyle] instance from [int] value.
  static CygnusAndroidScrollBarStyle? fromValue(int? value) {
    if (value != null) {
      try {
        return CygnusAndroidScrollBarStyle.values.firstWhere(
          (element) => element.toValue() == value,
        );
      } catch (e) {
        return null;
      }
    }
    return null;
  }

  ///Gets a possible [CygnusAndroidScrollBarStyle] instance from a native value.
  static CygnusAndroidScrollBarStyle? fromNativeValue(int? value) {
    if (value != null) {
      try {
        return CygnusAndroidScrollBarStyle.values.firstWhere(
          (element) => element.toNativeValue() == value,
        );
      } catch (e) {
        return null;
      }
    }
    return null;
  }

  /// Gets a possible [CygnusAndroidScrollBarStyle] instance value with name [name].
  ///
  /// Goes through [CygnusAndroidScrollBarStyle.values] looking for a value with
  /// name [name], as reported by [CygnusAndroidScrollBarStyle.name].
  /// Returns the first value with the given name, otherwise `null`.
  static CygnusAndroidScrollBarStyle? byName(String? name) {
    if (name != null) {
      try {
        return CygnusAndroidScrollBarStyle.values.firstWhere(
          (element) => element.name() == name,
        );
      } catch (e) {
        return null;
      }
    }
    return null;
  }

  /// Creates a map from the names of [CygnusAndroidScrollBarStyle] values to the values.
  ///
  /// The collection that this method is called on is expected to have
  /// values with distinct names, like the `values` list of an enum class.
  /// Only one value for each name can occur in the created map,
  /// so if two or more values have the same name (either being the
  /// same value, or being values of different enum type), at most one of
  /// them will be represented in the returned map.
  static Map<String, CygnusAndroidScrollBarStyle> asNameMap() =>
      <String, CygnusAndroidScrollBarStyle>{
        for (final value in CygnusAndroidScrollBarStyle.values)
          value.name(): value,
      };

  ///Gets [int] value.
  int toValue() => _value;

  ///Gets [int] native value if supported by the current platform, otherwise `null`.
  int? toNativeValue() => _nativeValue;

  ///Gets the name of the value.
  String name() {
    switch (_value) {
      case 16777216:
        return 'SCROLLBARS_INSIDE_INSET';
      case 0:
        return 'SCROLLBARS_INSIDE_OVERLAY';
      case 50331648:
        return 'SCROLLBARS_OUTSIDE_INSET';
      case 33554432:
        return 'SCROLLBARS_OUTSIDE_OVERLAY';
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
