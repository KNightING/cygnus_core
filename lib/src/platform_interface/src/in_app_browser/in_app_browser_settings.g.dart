// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'in_app_browser_settings.dart';

// **************************************************************************
// ExchangeableObjectGenerator
// **************************************************************************

///{@template cygnus_core.CygnusWebViewSettings}
///This class represents all [CygnusBrowser] settings available.
///{@endtemplate}
///
///**Officially Supported Platforms/Implementations**:
///- Android WebView
///- iOS WKWebView
///- macOS WKWebView
///- Windows WebView2
///- Linux WPE WebKit ([Official API - GtkWindow](https://docs.gtk.org/gtk3/class.Window.html))
class CygnusBrowserSettings
    implements CygnusBrowserOptions, CygnusAndroidOptions, CygnusIosOptions {
  ///Set to `false` to block the CygnusBrowser WebView going back when the user click on the Android back button. The default value is `true`.
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView
  bool? allowGoBackWithBackButton;

  ///Set the custom text for the close button.
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- iOS WKWebView
  String? closeButtonCaption;

  ///Set the custom color for the close button.
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- iOS WKWebView
  Color? closeButtonColor;

  ///Set to `false` to not close the CygnusBrowser when the user click on the Android back button and the WebView cannot go back to the history. The default value is `true`.
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView
  bool? closeOnCannotGoBack;

  ///Set to `true` to create the browser and load the page, but not show it. Omit or set to `false` to have the browser open and load normally.
  ///The default value is `false`.
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView
  ///- iOS WKWebView
  ///- macOS WKWebView
  ///- Windows WebView2
  ///- Linux WPE WebKit
  bool? hidden;

  ///Set to `true` to hide the close button. The default value is `false`.
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- iOS WKWebView
  bool? hideCloseButton;

  ///Set to `true` to hide the default menu items. The default value is `false`.
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView
  ///- iOS WKWebView
  ///- macOS WKWebView
  ///- Linux WPE WebKit
  bool? hideDefaultMenuItems;

  ///Set to `true` to hide the progress bar when the WebView is loading a page. The default value is `false`.
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView
  ///- iOS WKWebView
  ///- macOS WKWebView
  ///- Linux WPE WebKit
  bool? hideProgressBar;

  ///Set to `true` if you want the title should be displayed. The default value is `false`.
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView
  bool? hideTitleBar;

  ///Set to `true` to hide the toolbar at the bottom of the WebView. The default value is `false`.
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- iOS WKWebView
  bool? hideToolbarBottom;

  ///Set to `true` to hide the toolbar at the top of the WebView. The default value is `false`.
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView
  ///- iOS WKWebView
  ///- macOS WKWebView
  ///- Linux WPE WebKit
  bool? hideToolbarTop;

  ///Set to `true` to hide the url bar on the toolbar at the top. The default value is `false`.
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView
  ///- iOS WKWebView
  ///- macOS WKWebView
  ///- Linux WPE WebKit
  bool? hideUrlBar;

  ///Set the custom color for the menu button.
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- iOS WKWebView
  Color? menuButtonColor;

  ///Set the custom modal presentation style when presenting the WebView. The default value is [CygnusModalPresentationStyle.FULL_SCREEN].
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- iOS WKWebView
  CygnusModalPresentationStyle? presentationStyle;

  ///Set to `true` to close the CygnusBrowser when the user click on the Android back button. The default value is `false`.
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView
  bool? shouldCloseOnBackButtonPressed;

  ///Set the custom background color of the toolbar at the bottom.
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- iOS WKWebView
  Color? toolbarBottomBackgroundColor;

  ///Set the tint color to apply to the bar button items.
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- iOS WKWebView
  Color? toolbarBottomTintColor;

  ///Set to `true` to set the toolbar at the bottom translucent. The default value is `true`.
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- iOS WKWebView
  bool? toolbarBottomTranslucent;

  ///Set the custom background color of the toolbar at the top.
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView
  ///- iOS WKWebView
  ///- macOS WKWebView
  ///- Linux WPE WebKit
  Color? toolbarTopBackgroundColor;

  ///Set the tint color to apply to the navigation bar background.
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- iOS WKWebView
  Color? toolbarTopBarTintColor;

  ///Set the action bar's title.
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView
  ///- macOS WKWebView
  ///- Windows WebView2
  ///- Linux WPE WebKit
  String? toolbarTopFixedTitle;

  ///Set the tint color to apply to the navigation items and bar button items.
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- iOS WKWebView
  Color? toolbarTopTintColor;

  ///Set to `true` to set the toolbar at the top translucent. The default value is `true`.
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- iOS WKWebView
  bool? toolbarTopTranslucent;

  ///Set to the custom transition style when presenting the WebView. The default value is [CygnusModalTransitionStyle.COVER_VERTICAL].
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- iOS WKWebView
  CygnusModalTransitionStyle? transitionStyle;

  ///The window’s alpha value.
  ///The default value is `1.0`.
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- macOS WKWebView
  ///- Windows WebView2
  ///- Linux WPE WebKit
  double? windowAlphaValue;

  ///Sets the origin and size of the window’s frame rectangle according to a given frame rectangle,
  ///thereby setting its position and size onscreen.
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- macOS WKWebView
  ///- Windows WebView2
  ///- Linux WPE WebKit
  CygnusWebViewRect? windowFrame;

  ///Flags that describe the window’s current style, such as if it’s resizable or in full-screen mode.
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- macOS WKWebView
  CygnusWindowStyleMask? windowStyleMask;

  ///The type of separator that the app displays between the title bar and content of a window.
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- macOS WKWebView 11.0+
  CygnusWindowTitlebarSeparatorStyle? windowTitlebarSeparatorStyle;

  ///How the browser window should be added to the main window.
  ///The default value is [CygnusWindowType.WINDOW].
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- macOS WKWebView
  ///- Windows WebView2
  ///- Linux WPE WebKit
  CygnusWindowType? windowType;

  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView
  ///- iOS WKWebView
  ///- macOS WKWebView
  ///- Windows WebView2
  ///- Linux WPE WebKit ([Official API - GtkWindow](https://docs.gtk.org/gtk3/class.Window.html))
  CygnusBrowserSettings({
    this.allowGoBackWithBackButton = true,
    this.closeButtonCaption,
    this.closeButtonColor,
    this.closeOnCannotGoBack = true,
    this.hidden = false,
    this.hideCloseButton = false,
    this.hideDefaultMenuItems = false,
    this.hideProgressBar = false,
    this.hideTitleBar = false,
    this.hideToolbarBottom = false,
    this.hideToolbarTop = false,
    this.hideUrlBar = false,
    this.menuButtonColor,
    CygnusModalPresentationStyle? presentationStyle,
    this.shouldCloseOnBackButtonPressed = false,
    this.toolbarBottomBackgroundColor,
    this.toolbarBottomTintColor,
    this.toolbarBottomTranslucent = true,
    this.toolbarTopBackgroundColor,
    this.toolbarTopFixedTitle,
    this.toolbarTopTintColor,
    this.toolbarTopTranslucent = true,
    CygnusModalTransitionStyle? transitionStyle,
    this.windowAlphaValue = 1.0,
    this.windowFrame,
    this.windowStyleMask,
    this.windowTitlebarSeparatorStyle,
    this.windowType,
  }) : presentationStyle =
           presentationStyle ?? CygnusModalPresentationStyle.FULL_SCREEN,
       transitionStyle =
           transitionStyle ?? CygnusModalTransitionStyle.COVER_VERTICAL;

  ///Gets a possible [CygnusBrowserSettings] instance from a [Map] value.
  static CygnusBrowserSettings? fromMap(
    Map<String, dynamic>? map, {
    CygnusEnumMethod? enumMethod,
  }) {
    if (map == null) {
      return null;
    }
    final instance = CygnusBrowserSettings(
      closeButtonCaption: map['closeButtonCaption'],
      closeButtonColor: map['closeButtonColor'] != null
          ? UtilColor.fromStringRepresentation(map['closeButtonColor'])
          : null,
      menuButtonColor: map['menuButtonColor'] != null
          ? UtilColor.fromStringRepresentation(map['menuButtonColor'])
          : null,
      toolbarBottomBackgroundColor: map['toolbarBottomBackgroundColor'] != null
          ? UtilColor.fromStringRepresentation(
              map['toolbarBottomBackgroundColor'],
            )
          : null,
      toolbarBottomTintColor: map['toolbarBottomTintColor'] != null
          ? UtilColor.fromStringRepresentation(map['toolbarBottomTintColor'])
          : null,
      toolbarTopBackgroundColor: map['toolbarTopBackgroundColor'] != null
          ? UtilColor.fromStringRepresentation(map['toolbarTopBackgroundColor'])
          : null,
      toolbarTopFixedTitle: map['toolbarTopFixedTitle'],
      toolbarTopTintColor: map['toolbarTopTintColor'] != null
          ? UtilColor.fromStringRepresentation(map['toolbarTopTintColor'])
          : null,
      windowFrame: CygnusWebViewRect.fromMap(
        map['windowFrame']?.cast<String, dynamic>(),
        enumMethod: enumMethod,
      ),
      windowStyleMask: switch (enumMethod ?? CygnusEnumMethod.nativeValue) {
        CygnusEnumMethod.nativeValue => CygnusWindowStyleMask.fromNativeValue(
          map['windowStyleMask'],
        ),
        CygnusEnumMethod.value => CygnusWindowStyleMask.fromValue(
          map['windowStyleMask'],
        ),
        CygnusEnumMethod.name => CygnusWindowStyleMask.byName(
          map['windowStyleMask'],
        ),
      },
      windowTitlebarSeparatorStyle: switch (enumMethod ??
          CygnusEnumMethod.nativeValue) {
        CygnusEnumMethod.nativeValue =>
          CygnusWindowTitlebarSeparatorStyle.fromNativeValue(
            map['windowTitlebarSeparatorStyle'],
          ),
        CygnusEnumMethod.value => CygnusWindowTitlebarSeparatorStyle.fromValue(
          map['windowTitlebarSeparatorStyle'],
        ),
        CygnusEnumMethod.name => CygnusWindowTitlebarSeparatorStyle.byName(
          map['windowTitlebarSeparatorStyle'],
        ),
      },
      windowType: switch (enumMethod ?? CygnusEnumMethod.nativeValue) {
        CygnusEnumMethod.nativeValue => CygnusWindowType.fromNativeValue(
          map['windowType'],
        ),
        CygnusEnumMethod.value => CygnusWindowType.fromValue(map['windowType']),
        CygnusEnumMethod.name => CygnusWindowType.byName(map['windowType']),
      },
    );
    instance.allowGoBackWithBackButton = map['allowGoBackWithBackButton'];
    instance.closeOnCannotGoBack = map['closeOnCannotGoBack'];
    instance.hidden = map['hidden'];
    instance.hideCloseButton = map['hideCloseButton'];
    instance.hideDefaultMenuItems = map['hideDefaultMenuItems'];
    instance.hideProgressBar = map['hideProgressBar'];
    instance.hideTitleBar = map['hideTitleBar'];
    instance.hideToolbarBottom = map['hideToolbarBottom'];
    instance.hideToolbarTop = map['hideToolbarTop'];
    instance.hideUrlBar = map['hideUrlBar'];
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
    instance.shouldCloseOnBackButtonPressed =
        map['shouldCloseOnBackButtonPressed'];
    instance.toolbarBottomTranslucent = map['toolbarBottomTranslucent'];
    instance.toolbarTopBarTintColor = map['toolbarTopBarTintColor'] != null
        ? UtilColor.fromStringRepresentation(map['toolbarTopBarTintColor'])
        : null;
    instance.toolbarTopTranslucent = map['toolbarTopTranslucent'];
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
    instance.windowAlphaValue = map['windowAlphaValue'];
    return instance;
  }

  ///Check if the given [property] is supported by the [defaultTargetPlatform] or a specific [platform].
  static bool isPropertySupported(
    CygnusBrowserSettingsProperty property, {
    TargetPlatform? platform,
  }) => _CygnusBrowserSettingsPropertySupported.isPropertySupported(
    property,
    platform: platform,
  );

  ///Converts instance to a map.
  Map<String, dynamic> toMap({CygnusEnumMethod? enumMethod}) {
    return {
      "allowGoBackWithBackButton": allowGoBackWithBackButton,
      "closeButtonCaption": closeButtonCaption,
      "closeButtonColor": closeButtonColor?.toHex(),
      "closeOnCannotGoBack": closeOnCannotGoBack,
      "hidden": hidden,
      "hideCloseButton": hideCloseButton,
      "hideDefaultMenuItems": hideDefaultMenuItems,
      "hideProgressBar": hideProgressBar,
      "hideTitleBar": hideTitleBar,
      "hideToolbarBottom": hideToolbarBottom,
      "hideToolbarTop": hideToolbarTop,
      "hideUrlBar": hideUrlBar,
      "menuButtonColor": menuButtonColor?.toHex(),
      "presentationStyle": switch (enumMethod ?? CygnusEnumMethod.nativeValue) {
        CygnusEnumMethod.nativeValue => presentationStyle?.toNativeValue(),
        CygnusEnumMethod.value => presentationStyle?.toValue(),
        CygnusEnumMethod.name => presentationStyle?.name(),
      },
      "shouldCloseOnBackButtonPressed": shouldCloseOnBackButtonPressed,
      "toolbarBottomBackgroundColor": toolbarBottomBackgroundColor?.toHex(),
      "toolbarBottomTintColor": toolbarBottomTintColor?.toHex(),
      "toolbarBottomTranslucent": toolbarBottomTranslucent,
      "toolbarTopBackgroundColor": toolbarTopBackgroundColor?.toHex(),
      "toolbarTopBarTintColor": toolbarTopBarTintColor?.toHex(),
      "toolbarTopFixedTitle": toolbarTopFixedTitle,
      "toolbarTopTintColor": toolbarTopTintColor?.toHex(),
      "toolbarTopTranslucent": toolbarTopTranslucent,
      "transitionStyle": switch (enumMethod ?? CygnusEnumMethod.nativeValue) {
        CygnusEnumMethod.nativeValue => transitionStyle?.toNativeValue(),
        CygnusEnumMethod.value => transitionStyle?.toValue(),
        CygnusEnumMethod.name => transitionStyle?.name(),
      },
      "windowAlphaValue": windowAlphaValue,
      "windowFrame": windowFrame?.toMap(enumMethod: enumMethod),
      "windowStyleMask": switch (enumMethod ?? CygnusEnumMethod.nativeValue) {
        CygnusEnumMethod.nativeValue => windowStyleMask?.toNativeValue(),
        CygnusEnumMethod.value => windowStyleMask?.toValue(),
        CygnusEnumMethod.name => windowStyleMask?.name(),
      },
      "windowTitlebarSeparatorStyle": switch (enumMethod ??
          CygnusEnumMethod.nativeValue) {
        CygnusEnumMethod.nativeValue =>
          windowTitlebarSeparatorStyle?.toNativeValue(),
        CygnusEnumMethod.value => windowTitlebarSeparatorStyle?.toValue(),
        CygnusEnumMethod.name => windowTitlebarSeparatorStyle?.name(),
      },
      "windowType": switch (enumMethod ?? CygnusEnumMethod.nativeValue) {
        CygnusEnumMethod.nativeValue => windowType?.toNativeValue(),
        CygnusEnumMethod.value => windowType?.toValue(),
        CygnusEnumMethod.name => windowType?.name(),
      },
    };
  }

  ///Converts instance to a map.
  Map<String, dynamic> toJson() {
    return toMap();
  }

  ///Returns a copy of CygnusBrowserSettings.
  CygnusBrowserSettings copy() {
    return CygnusBrowserSettings.fromMap(toMap()) ?? CygnusBrowserSettings();
  }

  @override
  String toString() {
    return 'CygnusBrowserSettings{allowGoBackWithBackButton: $allowGoBackWithBackButton, closeButtonCaption: $closeButtonCaption, closeButtonColor: $closeButtonColor, closeOnCannotGoBack: $closeOnCannotGoBack, hidden: $hidden, hideCloseButton: $hideCloseButton, hideDefaultMenuItems: $hideDefaultMenuItems, hideProgressBar: $hideProgressBar, hideTitleBar: $hideTitleBar, hideToolbarBottom: $hideToolbarBottom, hideToolbarTop: $hideToolbarTop, hideUrlBar: $hideUrlBar, menuButtonColor: $menuButtonColor, presentationStyle: $presentationStyle, shouldCloseOnBackButtonPressed: $shouldCloseOnBackButtonPressed, toolbarBottomBackgroundColor: $toolbarBottomBackgroundColor, toolbarBottomTintColor: $toolbarBottomTintColor, toolbarBottomTranslucent: $toolbarBottomTranslucent, toolbarTopBackgroundColor: $toolbarTopBackgroundColor, toolbarTopBarTintColor: $toolbarTopBarTintColor, toolbarTopFixedTitle: $toolbarTopFixedTitle, toolbarTopTintColor: $toolbarTopTintColor, toolbarTopTranslucent: $toolbarTopTranslucent, transitionStyle: $transitionStyle, windowAlphaValue: $windowAlphaValue, windowFrame: $windowFrame, windowStyleMask: $windowStyleMask, windowTitlebarSeparatorStyle: $windowTitlebarSeparatorStyle, windowType: $windowType}';
  }
}

// **************************************************************************
// SupportedPlatformsGenerator
// **************************************************************************

///List of [CygnusBrowserSettings]'s properties that can be used to check i they are supported or not by the current platform.
enum CygnusBrowserSettingsProperty {
  ///Can be used to check if the [CygnusBrowserSettings.allowGoBackWithBackButton] property is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusBrowserSettings.allowGoBackWithBackButton.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView
  ///
  ///Use the [CygnusBrowserSettings.isPropertySupported] method to check if this property is supported at runtime.
  ///{@endtemplate}
  allowGoBackWithBackButton,

  ///Can be used to check if the [CygnusBrowserSettings.closeButtonCaption] property is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusBrowserSettings.closeButtonCaption.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- iOS WKWebView
  ///
  ///Use the [CygnusBrowserSettings.isPropertySupported] method to check if this property is supported at runtime.
  ///{@endtemplate}
  closeButtonCaption,

  ///Can be used to check if the [CygnusBrowserSettings.closeButtonColor] property is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusBrowserSettings.closeButtonColor.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- iOS WKWebView
  ///
  ///Use the [CygnusBrowserSettings.isPropertySupported] method to check if this property is supported at runtime.
  ///{@endtemplate}
  closeButtonColor,

  ///Can be used to check if the [CygnusBrowserSettings.closeOnCannotGoBack] property is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusBrowserSettings.closeOnCannotGoBack.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView
  ///
  ///Use the [CygnusBrowserSettings.isPropertySupported] method to check if this property is supported at runtime.
  ///{@endtemplate}
  closeOnCannotGoBack,

  ///Can be used to check if the [CygnusBrowserSettings.hidden] property is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusBrowserSettings.hidden.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView
  ///- iOS WKWebView
  ///- macOS WKWebView
  ///- Windows WebView2
  ///- Linux WPE WebKit
  ///
  ///Use the [CygnusBrowserSettings.isPropertySupported] method to check if this property is supported at runtime.
  ///{@endtemplate}
  hidden,

  ///Can be used to check if the [CygnusBrowserSettings.hideCloseButton] property is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusBrowserSettings.hideCloseButton.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- iOS WKWebView
  ///
  ///Use the [CygnusBrowserSettings.isPropertySupported] method to check if this property is supported at runtime.
  ///{@endtemplate}
  hideCloseButton,

  ///Can be used to check if the [CygnusBrowserSettings.hideDefaultMenuItems] property is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusBrowserSettings.hideDefaultMenuItems.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView
  ///- iOS WKWebView
  ///- macOS WKWebView
  ///- Linux WPE WebKit
  ///
  ///Use the [CygnusBrowserSettings.isPropertySupported] method to check if this property is supported at runtime.
  ///{@endtemplate}
  hideDefaultMenuItems,

  ///Can be used to check if the [CygnusBrowserSettings.hideProgressBar] property is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusBrowserSettings.hideProgressBar.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView
  ///- iOS WKWebView
  ///- macOS WKWebView
  ///- Linux WPE WebKit
  ///
  ///Use the [CygnusBrowserSettings.isPropertySupported] method to check if this property is supported at runtime.
  ///{@endtemplate}
  hideProgressBar,

  ///Can be used to check if the [CygnusBrowserSettings.hideTitleBar] property is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusBrowserSettings.hideTitleBar.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView
  ///
  ///Use the [CygnusBrowserSettings.isPropertySupported] method to check if this property is supported at runtime.
  ///{@endtemplate}
  hideTitleBar,

  ///Can be used to check if the [CygnusBrowserSettings.hideToolbarBottom] property is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusBrowserSettings.hideToolbarBottom.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- iOS WKWebView
  ///
  ///Use the [CygnusBrowserSettings.isPropertySupported] method to check if this property is supported at runtime.
  ///{@endtemplate}
  hideToolbarBottom,

  ///Can be used to check if the [CygnusBrowserSettings.hideToolbarTop] property is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusBrowserSettings.hideToolbarTop.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView
  ///- iOS WKWebView
  ///- macOS WKWebView
  ///- Linux WPE WebKit
  ///
  ///Use the [CygnusBrowserSettings.isPropertySupported] method to check if this property is supported at runtime.
  ///{@endtemplate}
  hideToolbarTop,

  ///Can be used to check if the [CygnusBrowserSettings.hideUrlBar] property is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusBrowserSettings.hideUrlBar.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView
  ///- iOS WKWebView
  ///- macOS WKWebView
  ///- Linux WPE WebKit
  ///
  ///Use the [CygnusBrowserSettings.isPropertySupported] method to check if this property is supported at runtime.
  ///{@endtemplate}
  hideUrlBar,

  ///Can be used to check if the [CygnusBrowserSettings.menuButtonColor] property is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusBrowserSettings.menuButtonColor.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- iOS WKWebView
  ///
  ///Use the [CygnusBrowserSettings.isPropertySupported] method to check if this property is supported at runtime.
  ///{@endtemplate}
  menuButtonColor,

  ///Can be used to check if the [CygnusBrowserSettings.presentationStyle] property is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusBrowserSettings.presentationStyle.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- iOS WKWebView
  ///
  ///Use the [CygnusBrowserSettings.isPropertySupported] method to check if this property is supported at runtime.
  ///{@endtemplate}
  presentationStyle,

  ///Can be used to check if the [CygnusBrowserSettings.shouldCloseOnBackButtonPressed] property is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusBrowserSettings.shouldCloseOnBackButtonPressed.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView
  ///
  ///Use the [CygnusBrowserSettings.isPropertySupported] method to check if this property is supported at runtime.
  ///{@endtemplate}
  shouldCloseOnBackButtonPressed,

  ///Can be used to check if the [CygnusBrowserSettings.toolbarBottomBackgroundColor] property is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusBrowserSettings.toolbarBottomBackgroundColor.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- iOS WKWebView
  ///
  ///Use the [CygnusBrowserSettings.isPropertySupported] method to check if this property is supported at runtime.
  ///{@endtemplate}
  toolbarBottomBackgroundColor,

  ///Can be used to check if the [CygnusBrowserSettings.toolbarBottomTintColor] property is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusBrowserSettings.toolbarBottomTintColor.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- iOS WKWebView
  ///
  ///Use the [CygnusBrowserSettings.isPropertySupported] method to check if this property is supported at runtime.
  ///{@endtemplate}
  toolbarBottomTintColor,

  ///Can be used to check if the [CygnusBrowserSettings.toolbarBottomTranslucent] property is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusBrowserSettings.toolbarBottomTranslucent.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- iOS WKWebView
  ///
  ///Use the [CygnusBrowserSettings.isPropertySupported] method to check if this property is supported at runtime.
  ///{@endtemplate}
  toolbarBottomTranslucent,

  ///Can be used to check if the [CygnusBrowserSettings.toolbarTopBackgroundColor] property is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusBrowserSettings.toolbarTopBackgroundColor.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView
  ///- iOS WKWebView
  ///- macOS WKWebView
  ///- Linux WPE WebKit
  ///
  ///Use the [CygnusBrowserSettings.isPropertySupported] method to check if this property is supported at runtime.
  ///{@endtemplate}
  toolbarTopBackgroundColor,

  ///Can be used to check if the [CygnusBrowserSettings.toolbarTopBarTintColor] property is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusBrowserSettings.toolbarTopBarTintColor.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- iOS WKWebView
  ///
  ///Use the [CygnusBrowserSettings.isPropertySupported] method to check if this property is supported at runtime.
  ///{@endtemplate}
  toolbarTopBarTintColor,

  ///Can be used to check if the [CygnusBrowserSettings.toolbarTopFixedTitle] property is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusBrowserSettings.toolbarTopFixedTitle.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView
  ///- macOS WKWebView
  ///- Windows WebView2
  ///- Linux WPE WebKit
  ///
  ///Use the [CygnusBrowserSettings.isPropertySupported] method to check if this property is supported at runtime.
  ///{@endtemplate}
  toolbarTopFixedTitle,

  ///Can be used to check if the [CygnusBrowserSettings.toolbarTopTintColor] property is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusBrowserSettings.toolbarTopTintColor.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- iOS WKWebView
  ///
  ///Use the [CygnusBrowserSettings.isPropertySupported] method to check if this property is supported at runtime.
  ///{@endtemplate}
  toolbarTopTintColor,

  ///Can be used to check if the [CygnusBrowserSettings.toolbarTopTranslucent] property is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusBrowserSettings.toolbarTopTranslucent.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- iOS WKWebView
  ///
  ///Use the [CygnusBrowserSettings.isPropertySupported] method to check if this property is supported at runtime.
  ///{@endtemplate}
  toolbarTopTranslucent,

  ///Can be used to check if the [CygnusBrowserSettings.transitionStyle] property is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusBrowserSettings.transitionStyle.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- iOS WKWebView
  ///
  ///Use the [CygnusBrowserSettings.isPropertySupported] method to check if this property is supported at runtime.
  ///{@endtemplate}
  transitionStyle,

  ///Can be used to check if the [CygnusBrowserSettings.windowAlphaValue] property is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusBrowserSettings.windowAlphaValue.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- macOS WKWebView
  ///- Windows WebView2
  ///- Linux WPE WebKit
  ///
  ///Use the [CygnusBrowserSettings.isPropertySupported] method to check if this property is supported at runtime.
  ///{@endtemplate}
  windowAlphaValue,

  ///Can be used to check if the [CygnusBrowserSettings.windowFrame] property is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusBrowserSettings.windowFrame.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- macOS WKWebView
  ///- Windows WebView2
  ///- Linux WPE WebKit
  ///
  ///Use the [CygnusBrowserSettings.isPropertySupported] method to check if this property is supported at runtime.
  ///{@endtemplate}
  windowFrame,

  ///Can be used to check if the [CygnusBrowserSettings.windowStyleMask] property is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusBrowserSettings.windowStyleMask.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- macOS WKWebView
  ///
  ///Use the [CygnusBrowserSettings.isPropertySupported] method to check if this property is supported at runtime.
  ///{@endtemplate}
  windowStyleMask,

  ///Can be used to check if the [CygnusBrowserSettings.windowTitlebarSeparatorStyle] property is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusBrowserSettings.windowTitlebarSeparatorStyle.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- macOS WKWebView 11.0+
  ///
  ///Use the [CygnusBrowserSettings.isPropertySupported] method to check if this property is supported at runtime.
  ///{@endtemplate}
  windowTitlebarSeparatorStyle,

  ///Can be used to check if the [CygnusBrowserSettings.windowType] property is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusBrowserSettings.windowType.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- macOS WKWebView
  ///- Windows WebView2
  ///- Linux WPE WebKit
  ///
  ///Use the [CygnusBrowserSettings.isPropertySupported] method to check if this property is supported at runtime.
  ///{@endtemplate}
  windowType,
}

extension _CygnusBrowserSettingsPropertySupported on CygnusBrowserSettings {
  static bool isPropertySupported(
    CygnusBrowserSettingsProperty property, {
    TargetPlatform? platform,
  }) {
    switch (property) {
      case CygnusBrowserSettingsProperty.allowGoBackWithBackButton:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [
              TargetPlatform.android,
            ].contains(platform ?? defaultTargetPlatform);
      case CygnusBrowserSettingsProperty.closeButtonCaption:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [TargetPlatform.iOS].contains(platform ?? defaultTargetPlatform);
      case CygnusBrowserSettingsProperty.closeButtonColor:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [TargetPlatform.iOS].contains(platform ?? defaultTargetPlatform);
      case CygnusBrowserSettingsProperty.closeOnCannotGoBack:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [
              TargetPlatform.android,
            ].contains(platform ?? defaultTargetPlatform);
      case CygnusBrowserSettingsProperty.hidden:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [
              TargetPlatform.android,
              TargetPlatform.iOS,
              TargetPlatform.macOS,
              TargetPlatform.windows,
              TargetPlatform.linux,
            ].contains(platform ?? defaultTargetPlatform);
      case CygnusBrowserSettingsProperty.hideCloseButton:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [TargetPlatform.iOS].contains(platform ?? defaultTargetPlatform);
      case CygnusBrowserSettingsProperty.hideDefaultMenuItems:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [
              TargetPlatform.android,
              TargetPlatform.iOS,
              TargetPlatform.macOS,
              TargetPlatform.linux,
            ].contains(platform ?? defaultTargetPlatform);
      case CygnusBrowserSettingsProperty.hideProgressBar:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [
              TargetPlatform.android,
              TargetPlatform.iOS,
              TargetPlatform.macOS,
              TargetPlatform.linux,
            ].contains(platform ?? defaultTargetPlatform);
      case CygnusBrowserSettingsProperty.hideTitleBar:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [
              TargetPlatform.android,
            ].contains(platform ?? defaultTargetPlatform);
      case CygnusBrowserSettingsProperty.hideToolbarBottom:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [TargetPlatform.iOS].contains(platform ?? defaultTargetPlatform);
      case CygnusBrowserSettingsProperty.hideToolbarTop:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [
              TargetPlatform.android,
              TargetPlatform.iOS,
              TargetPlatform.macOS,
              TargetPlatform.linux,
            ].contains(platform ?? defaultTargetPlatform);
      case CygnusBrowserSettingsProperty.hideUrlBar:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [
              TargetPlatform.android,
              TargetPlatform.iOS,
              TargetPlatform.macOS,
              TargetPlatform.linux,
            ].contains(platform ?? defaultTargetPlatform);
      case CygnusBrowserSettingsProperty.menuButtonColor:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [TargetPlatform.iOS].contains(platform ?? defaultTargetPlatform);
      case CygnusBrowserSettingsProperty.presentationStyle:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [TargetPlatform.iOS].contains(platform ?? defaultTargetPlatform);
      case CygnusBrowserSettingsProperty.shouldCloseOnBackButtonPressed:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [
              TargetPlatform.android,
            ].contains(platform ?? defaultTargetPlatform);
      case CygnusBrowserSettingsProperty.toolbarBottomBackgroundColor:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [TargetPlatform.iOS].contains(platform ?? defaultTargetPlatform);
      case CygnusBrowserSettingsProperty.toolbarBottomTintColor:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [TargetPlatform.iOS].contains(platform ?? defaultTargetPlatform);
      case CygnusBrowserSettingsProperty.toolbarBottomTranslucent:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [TargetPlatform.iOS].contains(platform ?? defaultTargetPlatform);
      case CygnusBrowserSettingsProperty.toolbarTopBackgroundColor:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [
              TargetPlatform.android,
              TargetPlatform.iOS,
              TargetPlatform.macOS,
              TargetPlatform.linux,
            ].contains(platform ?? defaultTargetPlatform);
      case CygnusBrowserSettingsProperty.toolbarTopBarTintColor:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [TargetPlatform.iOS].contains(platform ?? defaultTargetPlatform);
      case CygnusBrowserSettingsProperty.toolbarTopFixedTitle:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [
              TargetPlatform.android,
              TargetPlatform.macOS,
              TargetPlatform.windows,
              TargetPlatform.linux,
            ].contains(platform ?? defaultTargetPlatform);
      case CygnusBrowserSettingsProperty.toolbarTopTintColor:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [TargetPlatform.iOS].contains(platform ?? defaultTargetPlatform);
      case CygnusBrowserSettingsProperty.toolbarTopTranslucent:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [TargetPlatform.iOS].contains(platform ?? defaultTargetPlatform);
      case CygnusBrowserSettingsProperty.transitionStyle:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [TargetPlatform.iOS].contains(platform ?? defaultTargetPlatform);
      case CygnusBrowserSettingsProperty.windowAlphaValue:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [
              TargetPlatform.macOS,
              TargetPlatform.windows,
              TargetPlatform.linux,
            ].contains(platform ?? defaultTargetPlatform);
      case CygnusBrowserSettingsProperty.windowFrame:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [
              TargetPlatform.macOS,
              TargetPlatform.windows,
              TargetPlatform.linux,
            ].contains(platform ?? defaultTargetPlatform);
      case CygnusBrowserSettingsProperty.windowStyleMask:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [TargetPlatform.macOS].contains(platform ?? defaultTargetPlatform);
      case CygnusBrowserSettingsProperty.windowTitlebarSeparatorStyle:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [TargetPlatform.macOS].contains(platform ?? defaultTargetPlatform);
      case CygnusBrowserSettingsProperty.windowType:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [
              TargetPlatform.macOS,
              TargetPlatform.windows,
              TargetPlatform.linux,
            ].contains(platform ?? defaultTargetPlatform);
    }
  }
}
