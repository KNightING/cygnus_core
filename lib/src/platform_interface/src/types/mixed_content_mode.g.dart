// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mixed_content_mode.dart';

// **************************************************************************
// ExchangeableEnumGenerator
// **************************************************************************

///Class used to configure the WebView's behavior when a secure origin attempts to load a resource from an insecure origin.
class CygnusMixedContentMode {
  final int _value;
  final int? _nativeValue;
  const CygnusMixedContentMode._internal(this._value, this._nativeValue);
  // ignore: unused_element
  factory CygnusMixedContentMode._internalMultiPlatform(
    int value,
    Function nativeValue,
  ) => CygnusMixedContentMode._internal(value, nativeValue());

  ///In this mode, the WebView will allow a secure origin to load content from any other origin, even if that origin is insecure.
  ///This is the least secure mode of operation for the WebView, and where possible apps should not set this mode.
  static const MIXED_CONTENT_ALWAYS_ALLOW = CygnusMixedContentMode._internal(
    0,
    0,
  );

  ///In this mode, the WebView will attempt to be compatible with the approach of a modern web browser with regard to mixed content.
  ///Some insecure content may be allowed to be loaded by a secure origin and other types of content will be blocked.
  ///The types of content are allowed or blocked may change release to release and are not explicitly defined.
  ///This mode is intended to be used by apps that are not in control of the content that they render but desire to operate in a reasonably secure environment.
  ///For highest security, apps are recommended to use [CygnusMixedContentMode.MIXED_CONTENT_NEVER_ALLOW].
  static const MIXED_CONTENT_COMPATIBILITY_MODE =
      CygnusMixedContentMode._internal(2, 2);

  ///In this mode, the WebView will not allow a secure origin to load content from an insecure origin.
  ///This is the preferred and most secure mode of operation for the WebView and apps are strongly advised to use this mode.
  static const MIXED_CONTENT_NEVER_ALLOW = CygnusMixedContentMode._internal(
    1,
    1,
  );

  ///Set of all values of [CygnusMixedContentMode].
  static final Set<CygnusMixedContentMode> values = [
    CygnusMixedContentMode.MIXED_CONTENT_ALWAYS_ALLOW,
    CygnusMixedContentMode.MIXED_CONTENT_COMPATIBILITY_MODE,
    CygnusMixedContentMode.MIXED_CONTENT_NEVER_ALLOW,
  ].toSet();

  ///Gets a possible [CygnusMixedContentMode] instance from [int] value.
  static CygnusMixedContentMode? fromValue(int? value) {
    if (value != null) {
      try {
        return CygnusMixedContentMode.values.firstWhere(
          (element) => element.toValue() == value,
        );
      } catch (e) {
        return null;
      }
    }
    return null;
  }

  ///Gets a possible [CygnusMixedContentMode] instance from a native value.
  static CygnusMixedContentMode? fromNativeValue(int? value) {
    if (value != null) {
      try {
        return CygnusMixedContentMode.values.firstWhere(
          (element) => element.toNativeValue() == value,
        );
      } catch (e) {
        return null;
      }
    }
    return null;
  }

  /// Gets a possible [CygnusMixedContentMode] instance value with name [name].
  ///
  /// Goes through [CygnusMixedContentMode.values] looking for a value with
  /// name [name], as reported by [CygnusMixedContentMode.name].
  /// Returns the first value with the given name, otherwise `null`.
  static CygnusMixedContentMode? byName(String? name) {
    if (name != null) {
      try {
        return CygnusMixedContentMode.values.firstWhere(
          (element) => element.name() == name,
        );
      } catch (e) {
        return null;
      }
    }
    return null;
  }

  /// Creates a map from the names of [CygnusMixedContentMode] values to the values.
  ///
  /// The collection that this method is called on is expected to have
  /// values with distinct names, like the `values` list of an enum class.
  /// Only one value for each name can occur in the created map,
  /// so if two or more values have the same name (either being the
  /// same value, or being values of different enum type), at most one of
  /// them will be represented in the returned map.
  static Map<String, CygnusMixedContentMode> asNameMap() =>
      <String, CygnusMixedContentMode>{
        for (final value in CygnusMixedContentMode.values) value.name(): value,
      };

  ///Gets [int] value.
  int toValue() => _value;

  ///Gets [int] native value if supported by the current platform, otherwise `null`.
  int? toNativeValue() => _nativeValue;

  ///Gets the name of the value.
  String name() {
    switch (_value) {
      case 0:
        return 'MIXED_CONTENT_ALWAYS_ALLOW';
      case 2:
        return 'MIXED_CONTENT_COMPATIBILITY_MODE';
      case 1:
        return 'MIXED_CONTENT_NEVER_ALLOW';
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

///An Android-specific class used to configure the WebView's behavior when a secure origin attempts to load a resource from an insecure origin.
///
///**NOTE**: available on Android 21+.
///
///Use [CygnusMixedContentMode] instead.
@Deprecated('Use CygnusMixedContentMode instead')
class CygnusAndroidMixedContentMode {
  final int _value;
  final int? _nativeValue;
  const CygnusAndroidMixedContentMode._internal(this._value, this._nativeValue);
  // ignore: unused_element
  factory CygnusAndroidMixedContentMode._internalMultiPlatform(
    int value,
    Function nativeValue,
  ) => CygnusAndroidMixedContentMode._internal(value, nativeValue());

  ///In this mode, the WebView will allow a secure origin to load content from any other origin, even if that origin is insecure.
  ///This is the least secure mode of operation for the WebView, and where possible apps should not set this mode.
  static const MIXED_CONTENT_ALWAYS_ALLOW =
      CygnusAndroidMixedContentMode._internal(0, 0);

  ///In this mode, the WebView will attempt to be compatible with the approach of a modern web browser with regard to mixed content.
  ///Some insecure content may be allowed to be loaded by a secure origin and other types of content will be blocked.
  ///The types of content are allowed or blocked may change release to release and are not explicitly defined.
  ///This mode is intended to be used by apps that are not in control of the content that they render but desire to operate in a reasonably secure environment.
  ///For highest security, apps are recommended to use [CygnusAndroidMixedContentMode.MIXED_CONTENT_NEVER_ALLOW].
  static const MIXED_CONTENT_COMPATIBILITY_MODE =
      CygnusAndroidMixedContentMode._internal(2, 2);

  ///In this mode, the WebView will not allow a secure origin to load content from an insecure origin.
  ///This is the preferred and most secure mode of operation for the WebView and apps are strongly advised to use this mode.
  static const MIXED_CONTENT_NEVER_ALLOW =
      CygnusAndroidMixedContentMode._internal(1, 1);

  ///Set of all values of [CygnusAndroidMixedContentMode].
  static final Set<CygnusAndroidMixedContentMode> values = [
    CygnusAndroidMixedContentMode.MIXED_CONTENT_ALWAYS_ALLOW,
    CygnusAndroidMixedContentMode.MIXED_CONTENT_COMPATIBILITY_MODE,
    CygnusAndroidMixedContentMode.MIXED_CONTENT_NEVER_ALLOW,
  ].toSet();

  ///Gets a possible [CygnusAndroidMixedContentMode] instance from [int] value.
  static CygnusAndroidMixedContentMode? fromValue(int? value) {
    if (value != null) {
      try {
        return CygnusAndroidMixedContentMode.values.firstWhere(
          (element) => element.toValue() == value,
        );
      } catch (e) {
        return null;
      }
    }
    return null;
  }

  ///Gets a possible [CygnusAndroidMixedContentMode] instance from a native value.
  static CygnusAndroidMixedContentMode? fromNativeValue(int? value) {
    if (value != null) {
      try {
        return CygnusAndroidMixedContentMode.values.firstWhere(
          (element) => element.toNativeValue() == value,
        );
      } catch (e) {
        return null;
      }
    }
    return null;
  }

  /// Gets a possible [CygnusAndroidMixedContentMode] instance value with name [name].
  ///
  /// Goes through [CygnusAndroidMixedContentMode.values] looking for a value with
  /// name [name], as reported by [CygnusAndroidMixedContentMode.name].
  /// Returns the first value with the given name, otherwise `null`.
  static CygnusAndroidMixedContentMode? byName(String? name) {
    if (name != null) {
      try {
        return CygnusAndroidMixedContentMode.values.firstWhere(
          (element) => element.name() == name,
        );
      } catch (e) {
        return null;
      }
    }
    return null;
  }

  /// Creates a map from the names of [CygnusAndroidMixedContentMode] values to the values.
  ///
  /// The collection that this method is called on is expected to have
  /// values with distinct names, like the `values` list of an enum class.
  /// Only one value for each name can occur in the created map,
  /// so if two or more values have the same name (either being the
  /// same value, or being values of different enum type), at most one of
  /// them will be represented in the returned map.
  static Map<String, CygnusAndroidMixedContentMode> asNameMap() =>
      <String, CygnusAndroidMixedContentMode>{
        for (final value in CygnusAndroidMixedContentMode.values)
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
        return 'MIXED_CONTENT_ALWAYS_ALLOW';
      case 2:
        return 'MIXED_CONTENT_COMPATIBILITY_MODE';
      case 1:
        return 'MIXED_CONTENT_NEVER_ALLOW';
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
