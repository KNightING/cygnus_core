import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:flutter_inappwebview_internal_annotations/flutter_inappwebview_internal_annotations.dart';

import '../types/in_app_webview_rect.dart';
import '../types/modal_presentation_style.dart';
import '../types/modal_transition_style.dart';
import '../types/window_style_mask.dart';
import '../types/window_titlebar_separator_style.dart';
import '../types/window_type.dart';
import '../util.dart';

import '../in_app_webview/in_app_webview_settings.dart';

import 'android/in_app_browser_options.dart';
import '../in_app_webview/android/in_app_webview_options.dart';

import 'apple/in_app_browser_options.dart';
import '../in_app_webview/apple/in_app_webview_options.dart';
import '../types/enum_method.dart';

part 'in_app_browser_settings.g.dart';

///Class that represents the settings that can be used for an [CygnusBrowser] instance.
class CygnusBrowserClassSettings {
  ///Browser settings.
  late CygnusBrowserSettings browserSettings;

  ///WebView settings.
  late CygnusWebViewSettings webViewSettings;

  CygnusBrowserClassSettings({
    CygnusBrowserSettings? browserSettings,
    CygnusWebViewSettings? webViewSettings,
  }) {
    this.browserSettings = browserSettings ?? CygnusBrowserSettings();
    this.webViewSettings = webViewSettings ?? CygnusWebViewSettings();
  }

  Map<String, dynamic> toMap() {
    Map<String, dynamic> options = {};

    options.addAll(browserSettings.toMap());
    options.addAll(webViewSettings.toMap());

    return options;
  }

  Map<String, dynamic> toJson() {
    return toMap();
  }

  String toString() {
    return toMap().toString();
  }

  factory CygnusBrowserClassSettings.fromMap(
    Map<String, dynamic> options, {
    CygnusBrowserClassSettings? instance,
    CygnusEnumMethod? enumMethod,
  }) {
    if (instance == null) {
      instance = CygnusBrowserClassSettings();
    }
    instance.browserSettings =
        CygnusBrowserSettings.fromMap(options, enumMethod: enumMethod) ??
        CygnusBrowserSettings();
    instance.webViewSettings =
        CygnusWebViewSettings.fromMap(options, enumMethod: enumMethod) ??
        CygnusWebViewSettings();
    return instance;
  }

  CygnusBrowserClassSettings copy() {
    return CygnusBrowserClassSettings.fromMap(toMap());
  }
}

class CygnusBrowserOptions {
  Map<String, dynamic> toMap() {
    return {};
  }

  static CygnusBrowserOptions fromMap(Map<String, dynamic> map) {
    return CygnusBrowserOptions();
  }

  CygnusBrowserOptions copy() {
    return CygnusBrowserOptions.fromMap(this.toMap());
  }

  Map<String, dynamic> toJson() {
    return this.toMap();
  }

  @override
  String toString() {
    return toMap().toString();
  }
}

///{@template cygnus_core.CygnusWebViewSettings}
///This class represents all [CygnusBrowser] settings available.
///{@endtemplate}
@ExchangeableObject(copyMethod: true)
@SupportedPlatforms(
  platforms: [
    AndroidPlatform(),
    IOSPlatform(),
    MacOSPlatform(),
    WindowsPlatform(),
    LinuxPlatform(
      apiName: 'GtkWindow',
      apiUrl: 'https://docs.gtk.org/gtk3/class.Window.html',
    ),
  ],
)
class CygnusBrowserSettings_
    implements CygnusBrowserOptions, CygnusAndroidOptions, CygnusIosOptions {
  ///Set to `true` to create the browser and load the page, but not show it. Omit or set to `false` to have the browser open and load normally.
  ///The default value is `false`.
  @SupportedPlatforms(
    platforms: [
      AndroidPlatform(),
      IOSPlatform(),
      MacOSPlatform(),
      WindowsPlatform(),
      LinuxPlatform(),
    ],
  )
  bool? hidden;

  ///Set to `true` to hide the toolbar at the top of the WebView. The default value is `false`.
  @SupportedPlatforms(
    platforms: [
      AndroidPlatform(),
      IOSPlatform(),
      MacOSPlatform(),
      LinuxPlatform(),
    ],
  )
  bool? hideToolbarTop;

  ///Set the custom background color of the toolbar at the top.
  @SupportedPlatforms(
    platforms: [
      AndroidPlatform(),
      IOSPlatform(),
      MacOSPlatform(),
      LinuxPlatform(),
    ],
  )
  Color_? toolbarTopBackgroundColor;

  ///Set to `true` to hide the url bar on the toolbar at the top. The default value is `false`.
  @SupportedPlatforms(
    platforms: [
      AndroidPlatform(),
      IOSPlatform(),
      MacOSPlatform(),
      LinuxPlatform(),
    ],
  )
  bool? hideUrlBar;

  ///Set to `true` to hide the progress bar when the WebView is loading a page. The default value is `false`.
  @SupportedPlatforms(
    platforms: [
      AndroidPlatform(),
      IOSPlatform(),
      MacOSPlatform(),
      LinuxPlatform(),
    ],
  )
  bool? hideProgressBar;

  ///Set to `true` to hide the default menu items. The default value is `false`.
  @SupportedPlatforms(
    platforms: [
      AndroidPlatform(),
      IOSPlatform(),
      MacOSPlatform(),
      LinuxPlatform(),
    ],
  )
  bool? hideDefaultMenuItems;

  ///Set to `true` if you want the title should be displayed. The default value is `false`.
  @SupportedPlatforms(platforms: [AndroidPlatform()])
  bool? hideTitleBar;

  ///Set the action bar's title.
  @SupportedPlatforms(
    platforms: [
      AndroidPlatform(),
      MacOSPlatform(),
      WindowsPlatform(),
      LinuxPlatform(),
    ],
  )
  String? toolbarTopFixedTitle;

  ///Set to `false` to not close the CygnusBrowser when the user click on the Android back button and the WebView cannot go back to the history. The default value is `true`.
  @SupportedPlatforms(platforms: [AndroidPlatform()])
  bool? closeOnCannotGoBack;

  ///Set to `false` to block the CygnusBrowser WebView going back when the user click on the Android back button. The default value is `true`.
  @SupportedPlatforms(platforms: [AndroidPlatform()])
  bool? allowGoBackWithBackButton;

  ///Set to `true` to close the CygnusBrowser when the user click on the Android back button. The default value is `false`.
  @SupportedPlatforms(platforms: [AndroidPlatform()])
  bool? shouldCloseOnBackButtonPressed;

  ///Set to `true` to set the toolbar at the top translucent. The default value is `true`.
  @SupportedPlatforms(platforms: [IOSPlatform()])
  bool? toolbarTopTranslucent;

  ///Set the tint color to apply to the navigation bar background.
  @SupportedPlatforms(platforms: [IOSPlatform()])
  Color_? toolbarTopBarTintColor;

  ///Set the tint color to apply to the navigation items and bar button items.
  @SupportedPlatforms(platforms: [IOSPlatform()])
  Color_? toolbarTopTintColor;

  ///Set to `true` to hide the toolbar at the bottom of the WebView. The default value is `false`.
  @SupportedPlatforms(platforms: [IOSPlatform()])
  bool? hideToolbarBottom;

  ///Set the custom background color of the toolbar at the bottom.
  @SupportedPlatforms(platforms: [IOSPlatform()])
  Color_? toolbarBottomBackgroundColor;

  ///Set the tint color to apply to the bar button items.
  @SupportedPlatforms(platforms: [IOSPlatform()])
  Color_? toolbarBottomTintColor;

  ///Set to `true` to set the toolbar at the bottom translucent. The default value is `true`.
  @SupportedPlatforms(platforms: [IOSPlatform()])
  bool? toolbarBottomTranslucent;

  ///Set the custom text for the close button.
  @SupportedPlatforms(platforms: [IOSPlatform()])
  String? closeButtonCaption;

  ///Set the custom color for the close button.
  @SupportedPlatforms(platforms: [IOSPlatform()])
  Color_? closeButtonColor;

  ///Set to `true` to hide the close button. The default value is `false`.
  @SupportedPlatforms(platforms: [IOSPlatform()])
  bool? hideCloseButton;

  ///Set the custom color for the menu button.
  @SupportedPlatforms(platforms: [IOSPlatform()])
  Color_? menuButtonColor;

  ///Set the custom modal presentation style when presenting the WebView. The default value is [CygnusModalPresentationStyle.FULL_SCREEN].
  @SupportedPlatforms(platforms: [IOSPlatform()])
  CygnusModalPresentationStyle_? presentationStyle;

  ///Set to the custom transition style when presenting the WebView. The default value is [CygnusModalTransitionStyle.COVER_VERTICAL].
  @SupportedPlatforms(platforms: [IOSPlatform()])
  CygnusModalTransitionStyle_? transitionStyle;

  ///How the browser window should be added to the main window.
  ///The default value is [CygnusWindowType.WINDOW].
  @SupportedPlatforms(
    platforms: [MacOSPlatform(), WindowsPlatform(), LinuxPlatform()],
  )
  CygnusWindowType_? windowType;

  ///The window’s alpha value.
  ///The default value is `1.0`.
  @SupportedPlatforms(
    platforms: [MacOSPlatform(), WindowsPlatform(), LinuxPlatform()],
  )
  double? windowAlphaValue;

  ///Flags that describe the window’s current style, such as if it’s resizable or in full-screen mode.
  @SupportedPlatforms(platforms: [MacOSPlatform()])
  CygnusWindowStyleMask_? windowStyleMask;

  ///The type of separator that the app displays between the title bar and content of a window.
  @SupportedPlatforms(platforms: [MacOSPlatform(available: '11.0')])
  CygnusWindowTitlebarSeparatorStyle_? windowTitlebarSeparatorStyle;

  ///Sets the origin and size of the window’s frame rectangle according to a given frame rectangle,
  ///thereby setting its position and size onscreen.
  @SupportedPlatforms(
    platforms: [MacOSPlatform(), WindowsPlatform(), LinuxPlatform()],
  )
  CygnusWebViewRect_? windowFrame;

  CygnusBrowserSettings_({
    this.hidden = false,
    this.hideToolbarTop = false,
    this.toolbarTopBackgroundColor,
    this.hideUrlBar = false,
    this.hideProgressBar = false,
    this.hideDefaultMenuItems = false,
    this.toolbarTopTranslucent = true,
    this.toolbarTopTintColor,
    this.hideToolbarBottom = false,
    this.toolbarBottomBackgroundColor,
    this.toolbarBottomTintColor,
    this.toolbarBottomTranslucent = true,
    this.closeButtonCaption,
    this.closeButtonColor,
    this.hideCloseButton = false,
    this.menuButtonColor,
    this.presentationStyle = CygnusModalPresentationStyle_.FULL_SCREEN,
    this.transitionStyle = CygnusModalTransitionStyle_.COVER_VERTICAL,
    this.hideTitleBar = false,
    this.toolbarTopFixedTitle,
    this.closeOnCannotGoBack = true,
    this.allowGoBackWithBackButton = true,
    this.shouldCloseOnBackButtonPressed = false,
    this.windowType,
    this.windowAlphaValue = 1.0,
    this.windowStyleMask,
    this.windowTitlebarSeparatorStyle,
    this.windowFrame,
  });

  @override
  @ExchangeableObjectMethod(ignore: true)
  CygnusBrowserSettings_ copy() {
    throw UnimplementedError();
  }

  @override
  @ExchangeableObjectMethod(ignore: true)
  Map<String, dynamic> toJson() {
    throw UnimplementedError();
  }

  @override
  @ExchangeableObjectMethod(ignore: true)
  Map<String, dynamic> toMap() {
    throw UnimplementedError();
  }

  ///Check if the given [property] is supported by the [defaultTargetPlatform] or a specific [platform].
  static bool isPropertySupported(
    CygnusBrowserSettingsProperty property, {
    TargetPlatform? platform,
  }) => _CygnusBrowserSettingsPropertySupported.isPropertySupported(
    property,
    platform: platform,
  );
}

///Class that represents the options that can be used for an [CygnusBrowser] WebView.
///Use [CygnusBrowserClassSettings] instead.
@Deprecated('Use CygnusBrowserClassSettings instead')
class CygnusBrowserClassOptions {
  ///Cross-platform options.
  late CygnusInAppBrowserOptions crossPlatform;

  ///Android-specific options.
  late CygnusAndroidBrowserOptions android;

  ///iOS-specific options.
  late CygnusIOSBrowserOptions ios;

  ///WebView options.
  late CygnusWebViewGroupOptions webViewGroupOptions;

  CygnusBrowserClassOptions({
    CygnusInAppBrowserOptions? crossPlatform,
    CygnusAndroidBrowserOptions? android,
    CygnusIOSBrowserOptions? ios,
    CygnusWebViewGroupOptions? webViewGroupOptions,
  }) {
    this.crossPlatform = crossPlatform ?? CygnusInAppBrowserOptions();
    this.android = android ?? CygnusAndroidBrowserOptions();
    this.ios = ios ?? CygnusIOSBrowserOptions();
    this.webViewGroupOptions =
        webViewGroupOptions ?? CygnusWebViewGroupOptions();
  }

  Map<String, dynamic> toMap() {
    Map<String, dynamic> options = {};

    options.addAll(this.crossPlatform.toMap());
    options.addAll(this.webViewGroupOptions.crossPlatform.toMap());
    if (Util.isAndroid) {
      options.addAll(this.android.toMap());
      options.addAll(this.webViewGroupOptions.android.toMap());
    } else if (Util.isIOS) {
      options.addAll(this.ios.toMap());
      options.addAll(this.webViewGroupOptions.ios.toMap());
    }

    return options;
  }

  Map<String, dynamic> toJson() {
    return this.toMap();
  }

  @override
  String toString() {
    return toMap().toString();
  }

  static CygnusBrowserClassOptions fromMap(
    Map<String, dynamic> options, {
    CygnusEnumMethod? enumMethod,
  }) {
    CygnusBrowserClassOptions browserClassOptions =
        CygnusBrowserClassOptions();

    browserClassOptions.crossPlatform = CygnusInAppBrowserOptions.fromMap(
      options,
    );
    browserClassOptions.webViewGroupOptions =
        CygnusWebViewGroupOptions();
    browserClassOptions.webViewGroupOptions.crossPlatform =
        CygnusInAppWebViewOptions.fromMap(options);
    if (Util.isAndroid) {
      browserClassOptions.android = CygnusAndroidBrowserOptions.fromMap(
        options,
      );
      browserClassOptions.webViewGroupOptions.android =
          CygnusAndroidWebViewOptions.fromMap(options);
    } else if (Util.isIOS) {
      browserClassOptions.ios = CygnusIOSBrowserOptions.fromMap(options);
      browserClassOptions.webViewGroupOptions.ios =
          CygnusIOSWebViewOptions.fromMap(options);
    }

    return browserClassOptions;
  }

  CygnusBrowserClassOptions copy() {
    return CygnusBrowserClassOptions.fromMap(this.toMap());
  }
}

///This class represents all the cross-platform [CygnusBrowser] options available.
///Use [CygnusBrowserClassSettings] instead.
@Deprecated('Use CygnusBrowserClassSettings instead')
class CygnusInAppBrowserOptions
    implements CygnusBrowserOptions, CygnusAndroidOptions, CygnusIosOptions {
  ///Set to `true` to create the browser and load the page, but not show it. Omit or set to `false` to have the browser open and load normally.
  ///The default value is `false`.
  bool hidden;

  ///Set to `true` to hide the toolbar at the top of the WebView. The default value is `false`.
  bool hideToolbarTop;

  ///Set the custom background color of the toolbar at the top.
  Color? toolbarTopBackgroundColor;

  ///Set to `true` to hide the url bar on the toolbar at the top. The default value is `false`.
  bool hideUrlBar;

  ///Set to `true` to hide the progress bar when the WebView is loading a page. The default value is `false`.
  bool hideProgressBar;

  CygnusInAppBrowserOptions({
    this.hidden = false,
    this.hideToolbarTop = false,
    this.toolbarTopBackgroundColor,
    this.hideUrlBar = false,
    this.hideProgressBar = false,
  });

  @override
  Map<String, dynamic> toMap() {
    return {
      "hidden": hidden,
      "hideToolbarTop": hideToolbarTop,
      "toolbarTopBackgroundColor": toolbarTopBackgroundColor?.toHex(),
      "hideUrlBar": hideUrlBar,
      "hideProgressBar": hideProgressBar,
    };
  }

  static CygnusInAppBrowserOptions fromMap(Map<String, dynamic> map) {
    var instance = CygnusInAppBrowserOptions();
    instance.hidden = map["hidden"];
    instance.hideToolbarTop = map["hideToolbarTop"];
    instance.toolbarTopBackgroundColor = UtilColor.fromHex(
      map["toolbarTopBackgroundColor"],
    );
    instance.hideUrlBar = map["hideUrlBar"];
    instance.hideProgressBar = map["hideProgressBar"];
    return instance;
  }

  @override
  Map<String, dynamic> toJson() {
    return this.toMap();
  }

  @override
  String toString() {
    return toMap().toString();
  }

  @override
  CygnusInAppBrowserOptions copy() {
    return CygnusInAppBrowserOptions.fromMap(this.toMap());
  }
}
