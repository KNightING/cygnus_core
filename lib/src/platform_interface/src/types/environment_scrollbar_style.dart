import 'package:flutter/foundation.dart';
import 'package:cygnus_core_internal_annotations/cygnus_core_internal_annotations.dart';

import '../webview_environment/platform_webview_environment.dart';

part 'environment_scrollbar_style.g.dart';

///The ScrollBar style used during [CygnusPlatformWebViewEnvironment] creation.
@ExchangeableEnum()
class CygnusEnvironmentScrollbarStyle_ {
  // ignore: unused_field
  final int _value;
  const CygnusEnvironmentScrollbarStyle_._internal(this._value);

  ///Browser default ScrollBar style.
  @EnumSupportedPlatforms(platforms: [EnumWindowsPlatform(value: 0)])
  static const DEFAULT = CygnusEnvironmentScrollbarStyle_._internal(0);

  ///Window style fluent overlay scroll bar.
  ///Please see [Fluent UI](https://developer.microsoft.com/fluentui#/) for more details on fluent UI.
  @EnumSupportedPlatforms(platforms: [EnumWindowsPlatform(value: 1)])
  static const FLUENT_OVERLAY = CygnusEnvironmentScrollbarStyle_._internal(1);
}
