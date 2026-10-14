// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'layout_in_display_cutout_mode.dart';

// **************************************************************************
// ExchangeableEnumGenerator
// **************************************************************************

///Class representing the share state that should be applied to the custom tab.
class CygnusLayoutInDisplayCutoutMode {
  final int _value;
  final int? _nativeValue;
  const CygnusLayoutInDisplayCutoutMode._internal(
    this._value,
    this._nativeValue,
  );
  // ignore: unused_element
  factory CygnusLayoutInDisplayCutoutMode._internalMultiPlatform(
    int value,
    Function nativeValue,
  ) => CygnusLayoutInDisplayCutoutMode._internal(value, nativeValue());

  ///The window is always allowed to extend into the DisplayCutout areas on the all edges of the screen.
  ///
  ///**NOTE**: available on Android 30+.
  static const ALWAYS = CygnusLayoutInDisplayCutoutMode._internal(3, 3);

  ///With this default setting, content renders into the cutout area when displayed in portrait mode, but content is letterboxed when displayed in landscape mode.
  ///
  ///**NOTE**: available on Android 28+.
  static const DEFAULT = CygnusLayoutInDisplayCutoutMode._internal(0, 0);

  ///Content never renders into the cutout area.
  ///
  ///**NOTE**: available on Android 28+.
  static const NEVER = CygnusLayoutInDisplayCutoutMode._internal(2, 2);

  ///Content renders into the cutout area in both portrait and landscape modes.
  ///
  ///**NOTE**: available on Android 28+.
  static const SHORT_EDGES = CygnusLayoutInDisplayCutoutMode._internal(1, 1);

  ///Set of all values of [CygnusLayoutInDisplayCutoutMode].
  static final Set<CygnusLayoutInDisplayCutoutMode> values = [
    CygnusLayoutInDisplayCutoutMode.ALWAYS,
    CygnusLayoutInDisplayCutoutMode.DEFAULT,
    CygnusLayoutInDisplayCutoutMode.NEVER,
    CygnusLayoutInDisplayCutoutMode.SHORT_EDGES,
  ].toSet();

  ///Gets a possible [CygnusLayoutInDisplayCutoutMode] instance from [int] value.
  static CygnusLayoutInDisplayCutoutMode? fromValue(int? value) {
    if (value != null) {
      try {
        return CygnusLayoutInDisplayCutoutMode.values.firstWhere(
          (element) => element.toValue() == value,
        );
      } catch (e) {
        return null;
      }
    }
    return null;
  }

  ///Gets a possible [CygnusLayoutInDisplayCutoutMode] instance from a native value.
  static CygnusLayoutInDisplayCutoutMode? fromNativeValue(int? value) {
    if (value != null) {
      try {
        return CygnusLayoutInDisplayCutoutMode.values.firstWhere(
          (element) => element.toNativeValue() == value,
        );
      } catch (e) {
        return null;
      }
    }
    return null;
  }

  /// Gets a possible [CygnusLayoutInDisplayCutoutMode] instance value with name [name].
  ///
  /// Goes through [CygnusLayoutInDisplayCutoutMode.values] looking for a value with
  /// name [name], as reported by [CygnusLayoutInDisplayCutoutMode.name].
  /// Returns the first value with the given name, otherwise `null`.
  static CygnusLayoutInDisplayCutoutMode? byName(String? name) {
    if (name != null) {
      try {
        return CygnusLayoutInDisplayCutoutMode.values.firstWhere(
          (element) => element.name() == name,
        );
      } catch (e) {
        return null;
      }
    }
    return null;
  }

  /// Creates a map from the names of [CygnusLayoutInDisplayCutoutMode] values to the values.
  ///
  /// The collection that this method is called on is expected to have
  /// values with distinct names, like the `values` list of an enum class.
  /// Only one value for each name can occur in the created map,
  /// so if two or more values have the same name (either being the
  /// same value, or being values of different enum type), at most one of
  /// them will be represented in the returned map.
  static Map<String, CygnusLayoutInDisplayCutoutMode> asNameMap() =>
      <String, CygnusLayoutInDisplayCutoutMode>{
        for (final value in CygnusLayoutInDisplayCutoutMode.values)
          value.name(): value,
      };

  ///Gets [int] value.
  int toValue() => _value;

  ///Gets [int] native value if supported by the current platform, otherwise `null`.
  int? toNativeValue() => _nativeValue;

  ///Gets the name of the value.
  String name() {
    switch (_value) {
      case 3:
        return 'ALWAYS';
      case 0:
        return 'DEFAULT';
      case 2:
        return 'NEVER';
      case 1:
        return 'SHORT_EDGES';
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

///Android-specific class representing the share state that should be applied to the custom tab.
///
///**NOTE**: available on Android 28+.
///
///Use [CygnusLayoutInDisplayCutoutMode] instead.
@Deprecated('Use CygnusLayoutInDisplayCutoutMode instead')
class CygnusAndroidLayoutInDisplayCutoutMode {
  final int _value;
  final int? _nativeValue;
  const CygnusAndroidLayoutInDisplayCutoutMode._internal(
    this._value,
    this._nativeValue,
  );
  // ignore: unused_element
  factory CygnusAndroidLayoutInDisplayCutoutMode._internalMultiPlatform(
    int value,
    Function nativeValue,
  ) => CygnusAndroidLayoutInDisplayCutoutMode._internal(value, nativeValue());

  ///The window is always allowed to extend into the DisplayCutout areas on the all edges of the screen.
  ///
  ///**NOTE**: available on Android 30+.
  static const ALWAYS = CygnusAndroidLayoutInDisplayCutoutMode._internal(3, 3);

  ///With this default setting, content renders into the cutout area when displayed in portrait mode, but content is letterboxed when displayed in landscape mode.
  ///
  ///**NOTE**: available on Android 28+.
  static const DEFAULT = CygnusAndroidLayoutInDisplayCutoutMode._internal(0, 0);

  ///Content never renders into the cutout area.
  ///
  ///**NOTE**: available on Android 28+.
  static const NEVER = CygnusAndroidLayoutInDisplayCutoutMode._internal(2, 2);

  ///Content renders into the cutout area in both portrait and landscape modes.
  ///
  ///**NOTE**: available on Android 28+.
  static const SHORT_EDGES = CygnusAndroidLayoutInDisplayCutoutMode._internal(
    1,
    1,
  );

  ///Set of all values of [CygnusAndroidLayoutInDisplayCutoutMode].
  static final Set<CygnusAndroidLayoutInDisplayCutoutMode> values = [
    CygnusAndroidLayoutInDisplayCutoutMode.ALWAYS,
    CygnusAndroidLayoutInDisplayCutoutMode.DEFAULT,
    CygnusAndroidLayoutInDisplayCutoutMode.NEVER,
    CygnusAndroidLayoutInDisplayCutoutMode.SHORT_EDGES,
  ].toSet();

  ///Gets a possible [CygnusAndroidLayoutInDisplayCutoutMode] instance from [int] value.
  static CygnusAndroidLayoutInDisplayCutoutMode? fromValue(int? value) {
    if (value != null) {
      try {
        return CygnusAndroidLayoutInDisplayCutoutMode.values.firstWhere(
          (element) => element.toValue() == value,
        );
      } catch (e) {
        return null;
      }
    }
    return null;
  }

  ///Gets a possible [CygnusAndroidLayoutInDisplayCutoutMode] instance from a native value.
  static CygnusAndroidLayoutInDisplayCutoutMode? fromNativeValue(int? value) {
    if (value != null) {
      try {
        return CygnusAndroidLayoutInDisplayCutoutMode.values.firstWhere(
          (element) => element.toNativeValue() == value,
        );
      } catch (e) {
        return null;
      }
    }
    return null;
  }

  /// Gets a possible [CygnusAndroidLayoutInDisplayCutoutMode] instance value with name [name].
  ///
  /// Goes through [CygnusAndroidLayoutInDisplayCutoutMode.values] looking for a value with
  /// name [name], as reported by [CygnusAndroidLayoutInDisplayCutoutMode.name].
  /// Returns the first value with the given name, otherwise `null`.
  static CygnusAndroidLayoutInDisplayCutoutMode? byName(String? name) {
    if (name != null) {
      try {
        return CygnusAndroidLayoutInDisplayCutoutMode.values.firstWhere(
          (element) => element.name() == name,
        );
      } catch (e) {
        return null;
      }
    }
    return null;
  }

  /// Creates a map from the names of [CygnusAndroidLayoutInDisplayCutoutMode] values to the values.
  ///
  /// The collection that this method is called on is expected to have
  /// values with distinct names, like the `values` list of an enum class.
  /// Only one value for each name can occur in the created map,
  /// so if two or more values have the same name (either being the
  /// same value, or being values of different enum type), at most one of
  /// them will be represented in the returned map.
  static Map<String, CygnusAndroidLayoutInDisplayCutoutMode> asNameMap() =>
      <String, CygnusAndroidLayoutInDisplayCutoutMode>{
        for (final value in CygnusAndroidLayoutInDisplayCutoutMode.values)
          value.name(): value,
      };

  ///Gets [int] value.
  int toValue() => _value;

  ///Gets [int] native value if supported by the current platform, otherwise `null`.
  int? toNativeValue() => _nativeValue;

  ///Gets the name of the value.
  String name() {
    switch (_value) {
      case 3:
        return 'ALWAYS';
      case 0:
        return 'DEFAULT';
      case 2:
        return 'NEVER';
      case 1:
        return 'SHORT_EDGES';
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
