import 'package:flutter_inappwebview_internal_annotations/flutter_inappwebview_internal_annotations.dart';

part 'layout_in_display_cutout_mode.g.dart';

///Class representing the share state that should be applied to the custom tab.
@ExchangeableEnum()
class CygnusLayoutInDisplayCutoutMode_ {
  // ignore: unused_field
  final int _value;
  const CygnusLayoutInDisplayCutoutMode_._internal(this._value);

  ///With this default setting, content renders into the cutout area when displayed in portrait mode, but content is letterboxed when displayed in landscape mode.
  ///
  ///**NOTE**: available on Android 28+.
  static const DEFAULT = const CygnusLayoutInDisplayCutoutMode_._internal(0);

  ///Content renders into the cutout area in both portrait and landscape modes.
  ///
  ///**NOTE**: available on Android 28+.
  static const SHORT_EDGES = const CygnusLayoutInDisplayCutoutMode_._internal(1);

  ///Content never renders into the cutout area.
  ///
  ///**NOTE**: available on Android 28+.
  static const NEVER = const CygnusLayoutInDisplayCutoutMode_._internal(2);

  ///The window is always allowed to extend into the DisplayCutout areas on the all edges of the screen.
  ///
  ///**NOTE**: available on Android 30+.
  static const ALWAYS = const CygnusLayoutInDisplayCutoutMode_._internal(3);

  @ExchangeableObjectMethod(ignore: true)
  static CygnusLayoutInDisplayCutoutMode_? fromNativeValue(int? value) {
    return null;
  }
}

///Android-specific class representing the share state that should be applied to the custom tab.
///
///**NOTE**: available on Android 28+.
///
///Use [CygnusLayoutInDisplayCutoutMode] instead.
@Deprecated("Use CygnusLayoutInDisplayCutoutMode instead")
@ExchangeableEnum()
class CygnusAndroidLayoutInDisplayCutoutMode_ {
  // ignore: unused_field
  final int _value;
  const CygnusAndroidLayoutInDisplayCutoutMode_._internal(this._value);

  ///With this default setting, content renders into the cutout area when displayed in portrait mode, but content is letterboxed when displayed in landscape mode.
  ///
  ///**NOTE**: available on Android 28+.
  static const DEFAULT = const CygnusAndroidLayoutInDisplayCutoutMode_._internal(0);

  ///Content renders into the cutout area in both portrait and landscape modes.
  ///
  ///**NOTE**: available on Android 28+.
  static const SHORT_EDGES = const CygnusAndroidLayoutInDisplayCutoutMode_._internal(
    1,
  );

  ///Content never renders into the cutout area.
  ///
  ///**NOTE**: available on Android 28+.
  static const NEVER = const CygnusAndroidLayoutInDisplayCutoutMode_._internal(2);

  ///The window is always allowed to extend into the DisplayCutout areas on the all edges of the screen.
  ///
  ///**NOTE**: available on Android 30+.
  static const ALWAYS = const CygnusAndroidLayoutInDisplayCutoutMode_._internal(3);

  @ExchangeableObjectMethod(ignore: true)
  int toNativeValue() => 0;
}
