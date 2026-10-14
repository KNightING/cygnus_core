// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pull_to_refresh_settings.dart';

// **************************************************************************
// ExchangeableObjectGenerator
// **************************************************************************

///Pull-To-Refresh Settings for [CygnusPlatformPullToRefreshController].
///
///**Officially Supported Platforms/Implementations**:
///- Android WebView
///- iOS WKWebView
class CygnusPullToRefreshSettings {
  ///The title text to display in the refresh control.
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- iOS WKWebView
  CygnusAttributedString? attributedTitle;

  ///The background color of the refresh control.
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView
  ///- iOS WKWebView
  Color? backgroundColor;

  ///The color of the refresh control.
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView
  ///- iOS WKWebView
  Color? color;

  ///The distance to trigger a sync in dips.
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView
  int? distanceToTriggerSync;

  ///Sets whether the pull-to-refresh feature is enabled or not.
  ///The default value is `true`.
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView
  ///- iOS WKWebView
  bool? enabled;

  ///The size of the refresh indicator.
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView
  CygnusPullToRefreshSize? size;

  ///The distance in pixels that the refresh indicator can be pulled beyond its resting position.
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView
  int? slingshotDistance;

  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView
  ///- iOS WKWebView
  CygnusPullToRefreshSettings({
    this.attributedTitle,
    this.backgroundColor,
    this.color,
    this.distanceToTriggerSync,
    this.enabled = true,
    this.size,
    this.slingshotDistance,
  });

  ///Gets a possible [CygnusPullToRefreshSettings] instance from a [Map] value.
  static CygnusPullToRefreshSettings? fromMap(
    Map<String, dynamic>? map, {
    CygnusEnumMethod? enumMethod,
  }) {
    if (map == null) {
      return null;
    }
    final instance = CygnusPullToRefreshSettings(
      attributedTitle: CygnusAttributedString.fromMap(
        map['attributedTitle']?.cast<String, dynamic>(),
        enumMethod: enumMethod,
      ),
      backgroundColor: map['backgroundColor'] != null
          ? UtilColor.fromStringRepresentation(map['backgroundColor'])
          : null,
      color: map['color'] != null
          ? UtilColor.fromStringRepresentation(map['color'])
          : null,
      distanceToTriggerSync: map['distanceToTriggerSync'],
      size: switch (enumMethod ?? CygnusEnumMethod.nativeValue) {
        CygnusEnumMethod.nativeValue => CygnusPullToRefreshSize.fromNativeValue(
          map['size'],
        ),
        CygnusEnumMethod.value => CygnusPullToRefreshSize.fromValue(
          map['size'],
        ),
        CygnusEnumMethod.name => CygnusPullToRefreshSize.byName(map['size']),
      },
      slingshotDistance: map['slingshotDistance'],
    );
    instance.enabled = map['enabled'];
    return instance;
  }

  ///Check if the given [property] is supported by the [defaultTargetPlatform] or a specific [platform].
  static bool isPropertySupported(
    CygnusPullToRefreshSettingsProperty property, {
    TargetPlatform? platform,
  }) => _CygnusPullToRefreshSettingsPropertySupported.isPropertySupported(
    property,
    platform: platform,
  );

  ///Converts instance to a map.
  Map<String, dynamic> toMap({CygnusEnumMethod? enumMethod}) {
    return {
      "attributedTitle": attributedTitle?.toMap(enumMethod: enumMethod),
      "backgroundColor": backgroundColor?.toHex(),
      "color": color?.toHex(),
      "distanceToTriggerSync": distanceToTriggerSync,
      "enabled": enabled,
      "size": switch (enumMethod ?? CygnusEnumMethod.nativeValue) {
        CygnusEnumMethod.nativeValue => size?.toNativeValue(),
        CygnusEnumMethod.value => size?.toValue(),
        CygnusEnumMethod.name => size?.name(),
      },
      "slingshotDistance": slingshotDistance,
    };
  }

  ///Converts instance to a map.
  Map<String, dynamic> toJson() {
    return toMap();
  }

  ///Returns a copy of CygnusPullToRefreshSettings.
  CygnusPullToRefreshSettings copy() {
    return CygnusPullToRefreshSettings.fromMap(toMap()) ??
        CygnusPullToRefreshSettings();
  }

  @override
  String toString() {
    return 'CygnusPullToRefreshSettings{attributedTitle: $attributedTitle, backgroundColor: $backgroundColor, color: $color, distanceToTriggerSync: $distanceToTriggerSync, enabled: $enabled, size: $size, slingshotDistance: $slingshotDistance}';
  }
}

// **************************************************************************
// SupportedPlatformsGenerator
// **************************************************************************

///List of [CygnusPullToRefreshSettings]'s properties that can be used to check i they are supported or not by the current platform.
enum CygnusPullToRefreshSettingsProperty {
  ///Can be used to check if the [CygnusPullToRefreshSettings.attributedTitle] property is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusPullToRefreshSettings.attributedTitle.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- iOS WKWebView
  ///
  ///Use the [CygnusPullToRefreshSettings.isPropertySupported] method to check if this property is supported at runtime.
  ///{@endtemplate}
  attributedTitle,

  ///Can be used to check if the [CygnusPullToRefreshSettings.backgroundColor] property is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusPullToRefreshSettings.backgroundColor.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView
  ///- iOS WKWebView
  ///
  ///Use the [CygnusPullToRefreshSettings.isPropertySupported] method to check if this property is supported at runtime.
  ///{@endtemplate}
  backgroundColor,

  ///Can be used to check if the [CygnusPullToRefreshSettings.color] property is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusPullToRefreshSettings.color.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView
  ///- iOS WKWebView
  ///
  ///Use the [CygnusPullToRefreshSettings.isPropertySupported] method to check if this property is supported at runtime.
  ///{@endtemplate}
  color,

  ///Can be used to check if the [CygnusPullToRefreshSettings.distanceToTriggerSync] property is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusPullToRefreshSettings.distanceToTriggerSync.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView
  ///
  ///Use the [CygnusPullToRefreshSettings.isPropertySupported] method to check if this property is supported at runtime.
  ///{@endtemplate}
  distanceToTriggerSync,

  ///Can be used to check if the [CygnusPullToRefreshSettings.enabled] property is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusPullToRefreshSettings.enabled.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView
  ///- iOS WKWebView
  ///
  ///Use the [CygnusPullToRefreshSettings.isPropertySupported] method to check if this property is supported at runtime.
  ///{@endtemplate}
  enabled,

  ///Can be used to check if the [CygnusPullToRefreshSettings.size] property is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusPullToRefreshSettings.size.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView
  ///
  ///Use the [CygnusPullToRefreshSettings.isPropertySupported] method to check if this property is supported at runtime.
  ///{@endtemplate}
  size,

  ///Can be used to check if the [CygnusPullToRefreshSettings.slingshotDistance] property is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusPullToRefreshSettings.slingshotDistance.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView
  ///
  ///Use the [CygnusPullToRefreshSettings.isPropertySupported] method to check if this property is supported at runtime.
  ///{@endtemplate}
  slingshotDistance,
}

extension _CygnusPullToRefreshSettingsPropertySupported
    on CygnusPullToRefreshSettings {
  static bool isPropertySupported(
    CygnusPullToRefreshSettingsProperty property, {
    TargetPlatform? platform,
  }) {
    switch (property) {
      case CygnusPullToRefreshSettingsProperty.attributedTitle:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [TargetPlatform.iOS].contains(platform ?? defaultTargetPlatform);
      case CygnusPullToRefreshSettingsProperty.backgroundColor:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [
              TargetPlatform.android,
              TargetPlatform.iOS,
            ].contains(platform ?? defaultTargetPlatform);
      case CygnusPullToRefreshSettingsProperty.color:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [
              TargetPlatform.android,
              TargetPlatform.iOS,
            ].contains(platform ?? defaultTargetPlatform);
      case CygnusPullToRefreshSettingsProperty.distanceToTriggerSync:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [
              TargetPlatform.android,
            ].contains(platform ?? defaultTargetPlatform);
      case CygnusPullToRefreshSettingsProperty.enabled:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [
              TargetPlatform.android,
              TargetPlatform.iOS,
            ].contains(platform ?? defaultTargetPlatform);
      case CygnusPullToRefreshSettingsProperty.size:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [
              TargetPlatform.android,
            ].contains(platform ?? defaultTargetPlatform);
      case CygnusPullToRefreshSettingsProperty.slingshotDistance:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [
              TargetPlatform.android,
            ].contains(platform ?? defaultTargetPlatform);
    }
  }
}
