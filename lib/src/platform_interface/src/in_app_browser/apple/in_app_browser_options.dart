import 'dart:ui';

import '../../in_app_webview/apple/in_app_webview_options.dart';

import '../in_app_browser_settings.dart';
import '../platform_in_app_browser.dart';

import '../../types/main.dart';
import '../../util.dart';

///This class represents all the iOS-only [CygnusPlatformBrowser] options available.
///Use [CygnusBrowserSettings] instead.
@Deprecated('Use CygnusBrowserSettings instead')
class CygnusIOSBrowserOptions implements CygnusBrowserOptions, CygnusIosOptions {
  ///Set to `true` to set the toolbar at the top translucent. The default value is `true`.
  bool toolbarTopTranslucent;

  ///Set the tint color to apply to the navigation bar background.
  Color? toolbarTopBarTintColor;

  ///Set the tint color to apply to the navigation items and bar button items.
  Color? toolbarTopTintColor;

  ///Set to `true` to hide the toolbar at the bottom of the WebView. The default value is `false`.
  bool hideToolbarBottom;

  ///Set the custom background color of the toolbar at the bottom.
  Color? toolbarBottomBackgroundColor;

  ///Set the tint color to apply to the bar button items.
  Color? toolbarBottomTintColor;

  ///Set to `true` to set the toolbar at the bottom translucent. The default value is `true`.
  bool toolbarBottomTranslucent;

  ///Set the custom text for the close button.
  String? closeButtonCaption;

  ///Set the custom color for the close button.
  Color? closeButtonColor;

  ///Set the custom modal presentation style when presenting the WebView. The default value is [CygnusIOSUIModalPresentationStyle.FULL_SCREEN].
  CygnusIOSUIModalPresentationStyle presentationStyle;

  ///Set to the custom transition style when presenting the WebView. The default value is [CygnusIOSUIModalTransitionStyle.COVER_VERTICAL].
  CygnusIOSUIModalTransitionStyle transitionStyle;

  CygnusIOSBrowserOptions({
    this.toolbarTopTranslucent = true,
    this.toolbarTopTintColor,
    this.hideToolbarBottom = false,
    this.toolbarBottomBackgroundColor,
    this.toolbarBottomTintColor,
    this.toolbarBottomTranslucent = true,
    this.closeButtonCaption,
    this.closeButtonColor,
    this.presentationStyle = CygnusIOSUIModalPresentationStyle.FULL_SCREEN,
    this.transitionStyle = CygnusIOSUIModalTransitionStyle.COVER_VERTICAL,
  });

  @override
  Map<String, dynamic> toMap() {
    return {
      "toolbarTopTranslucent": toolbarTopTranslucent,
      "toolbarTopTintColor": toolbarTopTintColor?.toHex(),
      "hideToolbarBottom": hideToolbarBottom,
      "toolbarBottomBackgroundColor": toolbarBottomBackgroundColor?.toHex(),
      "toolbarBottomTintColor": toolbarBottomTintColor?.toHex(),
      "toolbarBottomTranslucent": toolbarBottomTranslucent,
      "closeButtonCaption": closeButtonCaption,
      "closeButtonColor": closeButtonColor?.toHex(),
      "presentationStyle": presentationStyle.toNativeValue(),
      "transitionStyle": transitionStyle.toNativeValue(),
    };
  }

  static CygnusIOSBrowserOptions fromMap(Map<String, dynamic> map) {
    var instance = CygnusIOSBrowserOptions();
    instance.toolbarTopTranslucent = map["toolbarTopTranslucent"];
    instance.toolbarTopTintColor = UtilColor.fromHex(
      map["toolbarTopTintColor"],
    );
    instance.hideToolbarBottom = map["hideToolbarBottom"];
    instance.toolbarBottomBackgroundColor = UtilColor.fromHex(
      map["toolbarBottomBackgroundColor"],
    );
    instance.toolbarBottomTintColor = UtilColor.fromHex(
      map["toolbarBottomTintColor"],
    );
    instance.toolbarBottomTranslucent = map["toolbarBottomTranslucent"];
    instance.closeButtonCaption = map["closeButtonCaption"];
    instance.closeButtonColor = UtilColor.fromHex(map["closeButtonColor"]);
    instance.presentationStyle = CygnusIOSUIModalPresentationStyle.fromNativeValue(
      map["presentationStyle"],
    )!;
    instance.transitionStyle = CygnusIOSUIModalTransitionStyle.fromNativeValue(
      map["transitionStyle"],
    )!;
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
  CygnusIOSBrowserOptions copy() {
    return CygnusIOSBrowserOptions.fromMap(this.toMap());
  }
}
