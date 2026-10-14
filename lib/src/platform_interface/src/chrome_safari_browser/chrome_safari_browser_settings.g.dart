// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chrome_safari_browser_settings.dart';

// **************************************************************************
// ExchangeableObjectGenerator
// **************************************************************************

///{@template cygnus_core.CygnusChromeSafariBrowserSettings}
///Class that represents the settings that can be used for an [CygnusChromeSafariBrowser] window.
///{@endtemplate}
///
///{@macro cygnus_core.CygnusChromeSafariBrowserSettings.supported_platforms}
///
///**Officially Supported Platforms/Implementations**:
///- Android Chrome Custom Tabs
///- iOS SFSafariViewController
class CygnusChromeSafariBrowserSettings
    implements CygnusChromeSafariBrowserOptions {
  ///An additional button to be shown in `SFSafariViewController`'s toolbar.
  ///This allows the user to access powerful functionality from your extension without needing to first show the `UIActivityViewController`.
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- iOS SFSafariViewController 15.0+
  CygnusActivityButton? activityButton;

  ///Sets a list of additional trusted origins that the user may navigate or be redirected to from the starting uri.
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android Chrome Custom Tabs:
  ///    - Not available in a Trusted Web Activity.
  List<String>? additionalTrustedOrigins;

  ///Adds the necessary flags and extras to signal any browser supporting custom tabs to use the browser UI
  ///at all times and avoid showing custom tab like UI.
  ///Calling this with an intent will override any custom tabs related customizations.
  ///The default value is `false`.
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android Chrome Custom Tabs
  bool? alwaysUseBrowserUI;

  ///Set to `true` to enable bar collapsing. The default value is `false`.
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- iOS SFSafariViewController
  bool? barCollapsingEnabled;

  ///Set the custom style for the dismiss button. The default value is [CygnusDismissButtonStyle.DONE].
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- iOS SFSafariViewController 11.0+
  CygnusDismissButtonStyle? dismissButtonStyle;

  ///Sets a display mode of a Trusted Web Activity.
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android Chrome Custom Tabs:
  ///    - Not available in a Trusted Web Activity.
  CygnusTrustedWebActivityDisplayMode? displayMode;

  ///Set to `true` to enable the url bar to hide as the user scrolls down on the page. The default value is `false`.
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android Chrome Custom Tabs:
  ///    - Not available in a Trusted Web Activity.
  bool? enableUrlBarHiding;

  ///Set to `true` if Reader mode should be entered automatically when it is available for the webpage. The default value is `false`.
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- iOS SFSafariViewController
  bool? entersReaderIfAvailable;

  ///An event attribution associated with a click that caused this `SFSafariViewController` to be opened.
  ///This attribute is ignored if the `SFSafariViewController` url has a scheme of 'http'.
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- iOS SFSafariViewController 15.2+
  CygnusUIEventAttribution? eventAttribution;

  ///Sets the exit animations.
  ///It must contain 2 [CygnusAndroidResource], where the first one represents the "enter" animation for the application
  ///and the second one represents the "exit" animation for the browser.
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android Chrome Custom Tabs
  List<CygnusAndroidResource>? exitAnimations;

  ///Set to `true` to enable Instant Apps. The default value is `false`.
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android Chrome Custom Tabs:
  ///    - Not available in a Trusted Web Activity.
  bool? instantAppsEnabled;

  ///Set to `true` to launch the Android activity in `singleInstance` mode. The default value is `false`.
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android Chrome Custom Tabs
  bool? isSingleInstance;

  ///Set to `true` to launch the Custom Tab as a Trusted Web Activity. The default value is `false`.
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android Chrome Custom Tabs
  bool? isTrustedWebActivity;

  ///Set to `true` to enable Keep Alive. The default value is `false`.
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android Chrome Custom Tabs
  bool? keepAliveEnabled;

  ///Sets the navigation bar color. Has no effect on Android API versions below L.
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android Chrome Custom Tabs
  Color? navigationBarColor;

  ///Sets the navigation bar divider color. Has no effect on Android API versions below P.
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android Chrome Custom Tabs
  Color? navigationBarDividerColor;

  ///Set to `true` to launch the Android intent with the flag `FLAG_ACTIVITY_NO_HISTORY`. The default value is `false`.
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android Chrome Custom Tabs
  bool? noHistory;

  ///Set an explicit application package name that limits
  ///the components this Intent will resolve to.  If left to the default
  ///value of null, all components in all applications will considered.
  ///If non-null, the Intent can only match the components in the given
  ///application package.
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android Chrome Custom Tabs
  String? packageName;

  ///Set the custom background color of the navigation bar and the toolbar.
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- iOS SFSafariViewController 10.0+
  Color? preferredBarTintColor;

  ///Set the custom color of the control buttons on the navigation bar and the toolbar.
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- iOS SFSafariViewController 10.0+
  Color? preferredControlTintColor;

  ///Set the custom modal presentation style when presenting the WebView. The default value is [CygnusModalPresentationStyle.FULL_SCREEN].
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- iOS SFSafariViewController
  CygnusModalPresentationStyle? presentationStyle;

  ///Sets a screen orientation. This can be used e.g. to enable the locking of an orientation lock type.
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android Chrome Custom Tabs:
  ///    - Not available in a Trusted Web Activity.
  CygnusTrustedWebActivityScreenOrientation? screenOrientation;

  ///Sets the color of the secondary toolbar.
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android Chrome Custom Tabs
  Color? secondaryToolbarColor;

  ///The share state that should be applied to the custom tab. The default value is [CygnusCustomTabsShareState.SHARE_STATE_DEFAULT].
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android Chrome Custom Tabs:
  ///    - Not available in a Trusted Web Activity.
  CygnusCustomTabsShareState? shareState;

  ///Set to `false` if the title shouldn't be shown in the custom tab. The default value is `true`.
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android Chrome Custom Tabs:
  ///    - Not available in a Trusted Web Activity.
  bool? showTitle;

  ///Sets the start animations.
  ///It must contain 2 [CygnusAndroidResource], where the first one represents the "enter" animation for the browser
  ///and the second one represents the "exit" animation for the application.
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android Chrome Custom Tabs
  List<CygnusAndroidResource>? startAnimations;

  ///Set the custom background color of the toolbar.
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android Chrome Custom Tabs
  Color? toolbarBackgroundColor;

  ///Set to the custom transition style when presenting the WebView. The default value is [CygnusModalTransitionStyle.COVER_VERTICAL].
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- iOS SFSafariViewController
  CygnusModalTransitionStyle? transitionStyle;

  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android Chrome Custom Tabs
  ///- iOS SFSafariViewController
  CygnusChromeSafariBrowserSettings({
    this.shareState = CygnusCustomTabsShareState.SHARE_STATE_DEFAULT,
    this.showTitle = true,
    this.toolbarBackgroundColor,
    this.navigationBarColor,
    this.navigationBarDividerColor,
    this.secondaryToolbarColor,
    this.enableUrlBarHiding = false,
    this.instantAppsEnabled = false,
    this.packageName,
    this.keepAliveEnabled = false,
    this.isSingleInstance = false,
    this.noHistory = false,
    this.isTrustedWebActivity = false,
    this.additionalTrustedOrigins = const [],
    this.displayMode,
    this.screenOrientation = CygnusTrustedWebActivityScreenOrientation.DEFAULT,
    this.startAnimations,
    this.exitAnimations,
    this.alwaysUseBrowserUI = false,
    this.entersReaderIfAvailable = false,
    this.barCollapsingEnabled = false,
    this.dismissButtonStyle = CygnusDismissButtonStyle.DONE,
    this.preferredBarTintColor,
    this.preferredControlTintColor,
    this.presentationStyle = CygnusModalPresentationStyle.FULL_SCREEN,
    this.transitionStyle = CygnusModalTransitionStyle.COVER_VERTICAL,
    this.activityButton,
    this.eventAttribution,
  }) {
    if (startAnimations != null) {
      assert(
        startAnimations!.length == 2,
        "start animations must be have 2 android resources",
      );
    }
    if (exitAnimations != null) {
      assert(
        exitAnimations!.length == 2,
        "exit animations must be have 2 android resources",
      );
    }
  }

  ///Gets a possible [CygnusChromeSafariBrowserSettings] instance from a [Map] value.
  static CygnusChromeSafariBrowserSettings? fromMap(
    Map<String, dynamic>? map, {
    CygnusEnumMethod? enumMethod,
  }) {
    if (map == null) {
      return null;
    }
    final instance = CygnusChromeSafariBrowserSettings(
      activityButton: CygnusActivityButton.fromMap(
        map['activityButton']?.cast<String, dynamic>(),
        enumMethod: enumMethod,
      ),
      displayMode: _deserializeDisplayMode(
        map['displayMode'],
        enumMethod: enumMethod,
      ),
      eventAttribution: CygnusUIEventAttribution.fromMap(
        map['eventAttribution']?.cast<String, dynamic>(),
        enumMethod: enumMethod,
      ),
      exitAnimations: map['exitAnimations'] != null
          ? List<CygnusAndroidResource>.from(
              map['exitAnimations'].map(
                (e) => CygnusAndroidResource.fromMap(
                  e?.cast<String, dynamic>(),
                  enumMethod: enumMethod,
                )!,
              ),
            )
          : null,
      navigationBarColor: map['navigationBarColor'] != null
          ? UtilColor.fromStringRepresentation(map['navigationBarColor'])
          : null,
      navigationBarDividerColor: map['navigationBarDividerColor'] != null
          ? UtilColor.fromStringRepresentation(map['navigationBarDividerColor'])
          : null,
      packageName: map['packageName'],
      preferredBarTintColor: map['preferredBarTintColor'] != null
          ? UtilColor.fromStringRepresentation(map['preferredBarTintColor'])
          : null,
      preferredControlTintColor: map['preferredControlTintColor'] != null
          ? UtilColor.fromStringRepresentation(map['preferredControlTintColor'])
          : null,
      secondaryToolbarColor: map['secondaryToolbarColor'] != null
          ? UtilColor.fromStringRepresentation(map['secondaryToolbarColor'])
          : null,
      startAnimations: map['startAnimations'] != null
          ? List<CygnusAndroidResource>.from(
              map['startAnimations'].map(
                (e) => CygnusAndroidResource.fromMap(
                  e?.cast<String, dynamic>(),
                  enumMethod: enumMethod,
                )!,
              ),
            )
          : null,
      toolbarBackgroundColor: map['toolbarBackgroundColor'] != null
          ? UtilColor.fromStringRepresentation(map['toolbarBackgroundColor'])
          : null,
    );
    instance.additionalTrustedOrigins = map['additionalTrustedOrigins'] != null
        ? List<String>.from(map['additionalTrustedOrigins']!.cast<String>())
        : null;
    instance.alwaysUseBrowserUI = map['alwaysUseBrowserUI'];
    instance.barCollapsingEnabled = map['barCollapsingEnabled'];
    instance.dismissButtonStyle = switch (enumMethod ??
        CygnusEnumMethod.nativeValue) {
      CygnusEnumMethod.nativeValue => CygnusDismissButtonStyle.fromNativeValue(
        map['dismissButtonStyle'],
      ),
      CygnusEnumMethod.value => CygnusDismissButtonStyle.fromValue(
        map['dismissButtonStyle'],
      ),
      CygnusEnumMethod.name => CygnusDismissButtonStyle.byName(
        map['dismissButtonStyle'],
      ),
    };
    instance.enableUrlBarHiding = map['enableUrlBarHiding'];
    instance.entersReaderIfAvailable = map['entersReaderIfAvailable'];
    instance.instantAppsEnabled = map['instantAppsEnabled'];
    instance.isSingleInstance = map['isSingleInstance'];
    instance.isTrustedWebActivity = map['isTrustedWebActivity'];
    instance.keepAliveEnabled = map['keepAliveEnabled'];
    instance.noHistory = map['noHistory'];
    instance.presentationStyle = switch (enumMethod ??
        CygnusEnumMethod.nativeValue) {
      CygnusEnumMethod.nativeValue =>
        CygnusModalPresentationStyle.fromNativeValue(map['presentationStyle']),
      CygnusEnumMethod.value => CygnusModalPresentationStyle.fromValue(
        map['presentationStyle'],
      ),
      CygnusEnumMethod.name => CygnusModalPresentationStyle.byName(
        map['presentationStyle'],
      ),
    };
    instance.screenOrientation = switch (enumMethod ??
        CygnusEnumMethod.nativeValue) {
      CygnusEnumMethod.nativeValue =>
        CygnusTrustedWebActivityScreenOrientation.fromNativeValue(
          map['screenOrientation'],
        ),
      CygnusEnumMethod.value =>
        CygnusTrustedWebActivityScreenOrientation.fromValue(
          map['screenOrientation'],
        ),
      CygnusEnumMethod.name => CygnusTrustedWebActivityScreenOrientation.byName(
        map['screenOrientation'],
      ),
    };
    instance.shareState = switch (enumMethod ?? CygnusEnumMethod.nativeValue) {
      CygnusEnumMethod.nativeValue =>
        CygnusCustomTabsShareState.fromNativeValue(map['shareState']),
      CygnusEnumMethod.value => CygnusCustomTabsShareState.fromValue(
        map['shareState'],
      ),
      CygnusEnumMethod.name => CygnusCustomTabsShareState.byName(
        map['shareState'],
      ),
    };
    instance.showTitle = map['showTitle'];
    instance.transitionStyle = switch (enumMethod ??
        CygnusEnumMethod.nativeValue) {
      CygnusEnumMethod.nativeValue =>
        CygnusModalTransitionStyle.fromNativeValue(map['transitionStyle']),
      CygnusEnumMethod.value => CygnusModalTransitionStyle.fromValue(
        map['transitionStyle'],
      ),
      CygnusEnumMethod.name => CygnusModalTransitionStyle.byName(
        map['transitionStyle'],
      ),
    };
    return instance;
  }

  ///Check if the given [property] is supported by the [defaultTargetPlatform] or a specific [platform].
  static bool isPropertySupported(
    CygnusChromeSafariBrowserSettingsProperty property, {
    TargetPlatform? platform,
  }) => _CygnusChromeSafariBrowserSettingsPropertySupported.isPropertySupported(
    property,
    platform: platform,
  );

  ///Converts instance to a map.
  Map<String, dynamic> toMap({CygnusEnumMethod? enumMethod}) {
    return {
      "activityButton": activityButton?.toMap(enumMethod: enumMethod),
      "additionalTrustedOrigins": additionalTrustedOrigins,
      "alwaysUseBrowserUI": alwaysUseBrowserUI,
      "barCollapsingEnabled": barCollapsingEnabled,
      "dismissButtonStyle": switch (enumMethod ??
          CygnusEnumMethod.nativeValue) {
        CygnusEnumMethod.nativeValue => dismissButtonStyle?.toNativeValue(),
        CygnusEnumMethod.value => dismissButtonStyle?.toValue(),
        CygnusEnumMethod.name => dismissButtonStyle?.name(),
      },
      "displayMode": displayMode?.toMap(enumMethod: enumMethod),
      "enableUrlBarHiding": enableUrlBarHiding,
      "entersReaderIfAvailable": entersReaderIfAvailable,
      "eventAttribution": eventAttribution?.toMap(enumMethod: enumMethod),
      "exitAnimations": exitAnimations
          ?.map((e) => e.toMap(enumMethod: enumMethod))
          .toList(),
      "instantAppsEnabled": instantAppsEnabled,
      "isSingleInstance": isSingleInstance,
      "isTrustedWebActivity": isTrustedWebActivity,
      "keepAliveEnabled": keepAliveEnabled,
      "navigationBarColor": navigationBarColor?.toHex(),
      "navigationBarDividerColor": navigationBarDividerColor?.toHex(),
      "noHistory": noHistory,
      "packageName": packageName,
      "preferredBarTintColor": preferredBarTintColor?.toHex(),
      "preferredControlTintColor": preferredControlTintColor?.toHex(),
      "presentationStyle": switch (enumMethod ?? CygnusEnumMethod.nativeValue) {
        CygnusEnumMethod.nativeValue => presentationStyle?.toNativeValue(),
        CygnusEnumMethod.value => presentationStyle?.toValue(),
        CygnusEnumMethod.name => presentationStyle?.name(),
      },
      "screenOrientation": switch (enumMethod ?? CygnusEnumMethod.nativeValue) {
        CygnusEnumMethod.nativeValue => screenOrientation?.toNativeValue(),
        CygnusEnumMethod.value => screenOrientation?.toValue(),
        CygnusEnumMethod.name => screenOrientation?.name(),
      },
      "secondaryToolbarColor": secondaryToolbarColor?.toHex(),
      "shareState": switch (enumMethod ?? CygnusEnumMethod.nativeValue) {
        CygnusEnumMethod.nativeValue => shareState?.toNativeValue(),
        CygnusEnumMethod.value => shareState?.toValue(),
        CygnusEnumMethod.name => shareState?.name(),
      },
      "showTitle": showTitle,
      "startAnimations": startAnimations
          ?.map((e) => e.toMap(enumMethod: enumMethod))
          .toList(),
      "toolbarBackgroundColor": toolbarBackgroundColor?.toHex(),
      "transitionStyle": switch (enumMethod ?? CygnusEnumMethod.nativeValue) {
        CygnusEnumMethod.nativeValue => transitionStyle?.toNativeValue(),
        CygnusEnumMethod.value => transitionStyle?.toValue(),
        CygnusEnumMethod.name => transitionStyle?.name(),
      },
    };
  }

  ///Converts instance to a map.
  Map<String, dynamic> toJson() {
    return toMap();
  }

  ///Returns a copy of CygnusChromeSafariBrowserSettings.
  CygnusChromeSafariBrowserSettings copy() {
    return CygnusChromeSafariBrowserSettings.fromMap(toMap()) ??
        CygnusChromeSafariBrowserSettings();
  }

  @override
  String toString() {
    return 'CygnusChromeSafariBrowserSettings{activityButton: $activityButton, additionalTrustedOrigins: $additionalTrustedOrigins, alwaysUseBrowserUI: $alwaysUseBrowserUI, barCollapsingEnabled: $barCollapsingEnabled, dismissButtonStyle: $dismissButtonStyle, displayMode: $displayMode, enableUrlBarHiding: $enableUrlBarHiding, entersReaderIfAvailable: $entersReaderIfAvailable, eventAttribution: $eventAttribution, exitAnimations: $exitAnimations, instantAppsEnabled: $instantAppsEnabled, isSingleInstance: $isSingleInstance, isTrustedWebActivity: $isTrustedWebActivity, keepAliveEnabled: $keepAliveEnabled, navigationBarColor: $navigationBarColor, navigationBarDividerColor: $navigationBarDividerColor, noHistory: $noHistory, packageName: $packageName, preferredBarTintColor: $preferredBarTintColor, preferredControlTintColor: $preferredControlTintColor, presentationStyle: $presentationStyle, screenOrientation: $screenOrientation, secondaryToolbarColor: $secondaryToolbarColor, shareState: $shareState, showTitle: $showTitle, startAnimations: $startAnimations, toolbarBackgroundColor: $toolbarBackgroundColor, transitionStyle: $transitionStyle}';
  }
}

// **************************************************************************
// SupportedPlatformsGenerator
// **************************************************************************

///List of [CygnusChromeSafariBrowserSettings]'s properties that can be used to check i they are supported or not by the current platform.
enum CygnusChromeSafariBrowserSettingsProperty {
  ///Can be used to check if the [CygnusChromeSafariBrowserSettings.activityButton] property is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusChromeSafariBrowserSettings.activityButton.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- iOS SFSafariViewController 15.0+
  ///
  ///Use the [CygnusChromeSafariBrowserSettings.isPropertySupported] method to check if this property is supported at runtime.
  ///{@endtemplate}
  activityButton,

  ///Can be used to check if the [CygnusChromeSafariBrowserSettings.additionalTrustedOrigins] property is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusChromeSafariBrowserSettings.additionalTrustedOrigins.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android Chrome Custom Tabs:
  ///    - Not available in a Trusted Web Activity.
  ///
  ///Use the [CygnusChromeSafariBrowserSettings.isPropertySupported] method to check if this property is supported at runtime.
  ///{@endtemplate}
  additionalTrustedOrigins,

  ///Can be used to check if the [CygnusChromeSafariBrowserSettings.alwaysUseBrowserUI] property is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusChromeSafariBrowserSettings.alwaysUseBrowserUI.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android Chrome Custom Tabs
  ///
  ///Use the [CygnusChromeSafariBrowserSettings.isPropertySupported] method to check if this property is supported at runtime.
  ///{@endtemplate}
  alwaysUseBrowserUI,

  ///Can be used to check if the [CygnusChromeSafariBrowserSettings.barCollapsingEnabled] property is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusChromeSafariBrowserSettings.barCollapsingEnabled.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- iOS SFSafariViewController
  ///
  ///Use the [CygnusChromeSafariBrowserSettings.isPropertySupported] method to check if this property is supported at runtime.
  ///{@endtemplate}
  barCollapsingEnabled,

  ///Can be used to check if the [CygnusChromeSafariBrowserSettings.dismissButtonStyle] property is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusChromeSafariBrowserSettings.dismissButtonStyle.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- iOS SFSafariViewController 11.0+
  ///
  ///Use the [CygnusChromeSafariBrowserSettings.isPropertySupported] method to check if this property is supported at runtime.
  ///{@endtemplate}
  dismissButtonStyle,

  ///Can be used to check if the [CygnusChromeSafariBrowserSettings.displayMode] property is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusChromeSafariBrowserSettings.displayMode.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android Chrome Custom Tabs:
  ///    - Not available in a Trusted Web Activity.
  ///
  ///Use the [CygnusChromeSafariBrowserSettings.isPropertySupported] method to check if this property is supported at runtime.
  ///{@endtemplate}
  displayMode,

  ///Can be used to check if the [CygnusChromeSafariBrowserSettings.enableUrlBarHiding] property is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusChromeSafariBrowserSettings.enableUrlBarHiding.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android Chrome Custom Tabs:
  ///    - Not available in a Trusted Web Activity.
  ///
  ///Use the [CygnusChromeSafariBrowserSettings.isPropertySupported] method to check if this property is supported at runtime.
  ///{@endtemplate}
  enableUrlBarHiding,

  ///Can be used to check if the [CygnusChromeSafariBrowserSettings.entersReaderIfAvailable] property is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusChromeSafariBrowserSettings.entersReaderIfAvailable.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- iOS SFSafariViewController
  ///
  ///Use the [CygnusChromeSafariBrowserSettings.isPropertySupported] method to check if this property is supported at runtime.
  ///{@endtemplate}
  entersReaderIfAvailable,

  ///Can be used to check if the [CygnusChromeSafariBrowserSettings.eventAttribution] property is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusChromeSafariBrowserSettings.eventAttribution.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- iOS SFSafariViewController 15.2+
  ///
  ///Use the [CygnusChromeSafariBrowserSettings.isPropertySupported] method to check if this property is supported at runtime.
  ///{@endtemplate}
  eventAttribution,

  ///Can be used to check if the [CygnusChromeSafariBrowserSettings.exitAnimations] property is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusChromeSafariBrowserSettings.exitAnimations.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android Chrome Custom Tabs
  ///
  ///Use the [CygnusChromeSafariBrowserSettings.isPropertySupported] method to check if this property is supported at runtime.
  ///{@endtemplate}
  exitAnimations,

  ///Can be used to check if the [CygnusChromeSafariBrowserSettings.instantAppsEnabled] property is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusChromeSafariBrowserSettings.instantAppsEnabled.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android Chrome Custom Tabs:
  ///    - Not available in a Trusted Web Activity.
  ///
  ///Use the [CygnusChromeSafariBrowserSettings.isPropertySupported] method to check if this property is supported at runtime.
  ///{@endtemplate}
  instantAppsEnabled,

  ///Can be used to check if the [CygnusChromeSafariBrowserSettings.isSingleInstance] property is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusChromeSafariBrowserSettings.isSingleInstance.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android Chrome Custom Tabs
  ///
  ///Use the [CygnusChromeSafariBrowserSettings.isPropertySupported] method to check if this property is supported at runtime.
  ///{@endtemplate}
  isSingleInstance,

  ///Can be used to check if the [CygnusChromeSafariBrowserSettings.isTrustedWebActivity] property is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusChromeSafariBrowserSettings.isTrustedWebActivity.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android Chrome Custom Tabs
  ///
  ///Use the [CygnusChromeSafariBrowserSettings.isPropertySupported] method to check if this property is supported at runtime.
  ///{@endtemplate}
  isTrustedWebActivity,

  ///Can be used to check if the [CygnusChromeSafariBrowserSettings.keepAliveEnabled] property is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusChromeSafariBrowserSettings.keepAliveEnabled.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android Chrome Custom Tabs
  ///
  ///Use the [CygnusChromeSafariBrowserSettings.isPropertySupported] method to check if this property is supported at runtime.
  ///{@endtemplate}
  keepAliveEnabled,

  ///Can be used to check if the [CygnusChromeSafariBrowserSettings.navigationBarColor] property is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusChromeSafariBrowserSettings.navigationBarColor.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android Chrome Custom Tabs
  ///
  ///Use the [CygnusChromeSafariBrowserSettings.isPropertySupported] method to check if this property is supported at runtime.
  ///{@endtemplate}
  navigationBarColor,

  ///Can be used to check if the [CygnusChromeSafariBrowserSettings.navigationBarDividerColor] property is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusChromeSafariBrowserSettings.navigationBarDividerColor.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android Chrome Custom Tabs
  ///
  ///Use the [CygnusChromeSafariBrowserSettings.isPropertySupported] method to check if this property is supported at runtime.
  ///{@endtemplate}
  navigationBarDividerColor,

  ///Can be used to check if the [CygnusChromeSafariBrowserSettings.noHistory] property is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusChromeSafariBrowserSettings.noHistory.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android Chrome Custom Tabs
  ///
  ///Use the [CygnusChromeSafariBrowserSettings.isPropertySupported] method to check if this property is supported at runtime.
  ///{@endtemplate}
  noHistory,

  ///Can be used to check if the [CygnusChromeSafariBrowserSettings.packageName] property is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusChromeSafariBrowserSettings.packageName.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android Chrome Custom Tabs
  ///
  ///Use the [CygnusChromeSafariBrowserSettings.isPropertySupported] method to check if this property is supported at runtime.
  ///{@endtemplate}
  packageName,

  ///Can be used to check if the [CygnusChromeSafariBrowserSettings.preferredBarTintColor] property is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusChromeSafariBrowserSettings.preferredBarTintColor.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- iOS SFSafariViewController 10.0+
  ///
  ///Use the [CygnusChromeSafariBrowserSettings.isPropertySupported] method to check if this property is supported at runtime.
  ///{@endtemplate}
  preferredBarTintColor,

  ///Can be used to check if the [CygnusChromeSafariBrowserSettings.preferredControlTintColor] property is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusChromeSafariBrowserSettings.preferredControlTintColor.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- iOS SFSafariViewController 10.0+
  ///
  ///Use the [CygnusChromeSafariBrowserSettings.isPropertySupported] method to check if this property is supported at runtime.
  ///{@endtemplate}
  preferredControlTintColor,

  ///Can be used to check if the [CygnusChromeSafariBrowserSettings.presentationStyle] property is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusChromeSafariBrowserSettings.presentationStyle.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- iOS SFSafariViewController
  ///
  ///Use the [CygnusChromeSafariBrowserSettings.isPropertySupported] method to check if this property is supported at runtime.
  ///{@endtemplate}
  presentationStyle,

  ///Can be used to check if the [CygnusChromeSafariBrowserSettings.screenOrientation] property is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusChromeSafariBrowserSettings.screenOrientation.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android Chrome Custom Tabs:
  ///    - Not available in a Trusted Web Activity.
  ///
  ///Use the [CygnusChromeSafariBrowserSettings.isPropertySupported] method to check if this property is supported at runtime.
  ///{@endtemplate}
  screenOrientation,

  ///Can be used to check if the [CygnusChromeSafariBrowserSettings.secondaryToolbarColor] property is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusChromeSafariBrowserSettings.secondaryToolbarColor.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android Chrome Custom Tabs
  ///
  ///Use the [CygnusChromeSafariBrowserSettings.isPropertySupported] method to check if this property is supported at runtime.
  ///{@endtemplate}
  secondaryToolbarColor,

  ///Can be used to check if the [CygnusChromeSafariBrowserSettings.shareState] property is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusChromeSafariBrowserSettings.shareState.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android Chrome Custom Tabs:
  ///    - Not available in a Trusted Web Activity.
  ///
  ///Use the [CygnusChromeSafariBrowserSettings.isPropertySupported] method to check if this property is supported at runtime.
  ///{@endtemplate}
  shareState,

  ///Can be used to check if the [CygnusChromeSafariBrowserSettings.showTitle] property is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusChromeSafariBrowserSettings.showTitle.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android Chrome Custom Tabs:
  ///    - Not available in a Trusted Web Activity.
  ///
  ///Use the [CygnusChromeSafariBrowserSettings.isPropertySupported] method to check if this property is supported at runtime.
  ///{@endtemplate}
  showTitle,

  ///Can be used to check if the [CygnusChromeSafariBrowserSettings.startAnimations] property is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusChromeSafariBrowserSettings.startAnimations.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android Chrome Custom Tabs
  ///
  ///Use the [CygnusChromeSafariBrowserSettings.isPropertySupported] method to check if this property is supported at runtime.
  ///{@endtemplate}
  startAnimations,

  ///Can be used to check if the [CygnusChromeSafariBrowserSettings.toolbarBackgroundColor] property is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusChromeSafariBrowserSettings.toolbarBackgroundColor.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android Chrome Custom Tabs
  ///
  ///Use the [CygnusChromeSafariBrowserSettings.isPropertySupported] method to check if this property is supported at runtime.
  ///{@endtemplate}
  toolbarBackgroundColor,

  ///Can be used to check if the [CygnusChromeSafariBrowserSettings.transitionStyle] property is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusChromeSafariBrowserSettings.transitionStyle.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- iOS SFSafariViewController
  ///
  ///Use the [CygnusChromeSafariBrowserSettings.isPropertySupported] method to check if this property is supported at runtime.
  ///{@endtemplate}
  transitionStyle,
}

extension _CygnusChromeSafariBrowserSettingsPropertySupported
    on CygnusChromeSafariBrowserSettings {
  static bool isPropertySupported(
    CygnusChromeSafariBrowserSettingsProperty property, {
    TargetPlatform? platform,
  }) {
    switch (property) {
      case CygnusChromeSafariBrowserSettingsProperty.activityButton:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [TargetPlatform.iOS].contains(platform ?? defaultTargetPlatform);
      case CygnusChromeSafariBrowserSettingsProperty.additionalTrustedOrigins:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [
              TargetPlatform.android,
            ].contains(platform ?? defaultTargetPlatform);
      case CygnusChromeSafariBrowserSettingsProperty.alwaysUseBrowserUI:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [
              TargetPlatform.android,
            ].contains(platform ?? defaultTargetPlatform);
      case CygnusChromeSafariBrowserSettingsProperty.barCollapsingEnabled:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [TargetPlatform.iOS].contains(platform ?? defaultTargetPlatform);
      case CygnusChromeSafariBrowserSettingsProperty.dismissButtonStyle:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [TargetPlatform.iOS].contains(platform ?? defaultTargetPlatform);
      case CygnusChromeSafariBrowserSettingsProperty.displayMode:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [
              TargetPlatform.android,
            ].contains(platform ?? defaultTargetPlatform);
      case CygnusChromeSafariBrowserSettingsProperty.enableUrlBarHiding:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [
              TargetPlatform.android,
            ].contains(platform ?? defaultTargetPlatform);
      case CygnusChromeSafariBrowserSettingsProperty.entersReaderIfAvailable:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [TargetPlatform.iOS].contains(platform ?? defaultTargetPlatform);
      case CygnusChromeSafariBrowserSettingsProperty.eventAttribution:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [TargetPlatform.iOS].contains(platform ?? defaultTargetPlatform);
      case CygnusChromeSafariBrowserSettingsProperty.exitAnimations:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [
              TargetPlatform.android,
            ].contains(platform ?? defaultTargetPlatform);
      case CygnusChromeSafariBrowserSettingsProperty.instantAppsEnabled:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [
              TargetPlatform.android,
            ].contains(platform ?? defaultTargetPlatform);
      case CygnusChromeSafariBrowserSettingsProperty.isSingleInstance:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [
              TargetPlatform.android,
            ].contains(platform ?? defaultTargetPlatform);
      case CygnusChromeSafariBrowserSettingsProperty.isTrustedWebActivity:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [
              TargetPlatform.android,
            ].contains(platform ?? defaultTargetPlatform);
      case CygnusChromeSafariBrowserSettingsProperty.keepAliveEnabled:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [
              TargetPlatform.android,
            ].contains(platform ?? defaultTargetPlatform);
      case CygnusChromeSafariBrowserSettingsProperty.navigationBarColor:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [
              TargetPlatform.android,
            ].contains(platform ?? defaultTargetPlatform);
      case CygnusChromeSafariBrowserSettingsProperty.navigationBarDividerColor:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [
              TargetPlatform.android,
            ].contains(platform ?? defaultTargetPlatform);
      case CygnusChromeSafariBrowserSettingsProperty.noHistory:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [
              TargetPlatform.android,
            ].contains(platform ?? defaultTargetPlatform);
      case CygnusChromeSafariBrowserSettingsProperty.packageName:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [
              TargetPlatform.android,
            ].contains(platform ?? defaultTargetPlatform);
      case CygnusChromeSafariBrowserSettingsProperty.preferredBarTintColor:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [TargetPlatform.iOS].contains(platform ?? defaultTargetPlatform);
      case CygnusChromeSafariBrowserSettingsProperty.preferredControlTintColor:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [TargetPlatform.iOS].contains(platform ?? defaultTargetPlatform);
      case CygnusChromeSafariBrowserSettingsProperty.presentationStyle:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [TargetPlatform.iOS].contains(platform ?? defaultTargetPlatform);
      case CygnusChromeSafariBrowserSettingsProperty.screenOrientation:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [
              TargetPlatform.android,
            ].contains(platform ?? defaultTargetPlatform);
      case CygnusChromeSafariBrowserSettingsProperty.secondaryToolbarColor:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [
              TargetPlatform.android,
            ].contains(platform ?? defaultTargetPlatform);
      case CygnusChromeSafariBrowserSettingsProperty.shareState:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [
              TargetPlatform.android,
            ].contains(platform ?? defaultTargetPlatform);
      case CygnusChromeSafariBrowserSettingsProperty.showTitle:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [
              TargetPlatform.android,
            ].contains(platform ?? defaultTargetPlatform);
      case CygnusChromeSafariBrowserSettingsProperty.startAnimations:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [
              TargetPlatform.android,
            ].contains(platform ?? defaultTargetPlatform);
      case CygnusChromeSafariBrowserSettingsProperty.toolbarBackgroundColor:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [
              TargetPlatform.android,
            ].contains(platform ?? defaultTargetPlatform);
      case CygnusChromeSafariBrowserSettingsProperty.transitionStyle:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [TargetPlatform.iOS].contains(platform ?? defaultTargetPlatform);
    }
  }
}
