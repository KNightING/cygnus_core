import 'package:flutter/foundation.dart';
import 'package:cygnus_core_internal_annotations/cygnus_core_internal_annotations.dart';

import '../webview_environment/platform_webview_environment.dart';

part 'environment_release_channels.g.dart';

///The WebView2 release channels searched for during [CygnusPlatformWebViewEnvironment] creation.
@ExchangeableEnum(bitwiseOrOperator: true)
class CygnusEnvironmentReleaseChannels_ {
  // ignore: unused_field
  final int _value;
  const CygnusEnvironmentReleaseChannels_._internal(this._value);

  ///No release channel. Passing only this value results in `HRESULT_FROM_WIN32(ERROR_FILE_NOT_FOUND)`.
  @EnumSupportedPlatforms(platforms: [EnumWindowsPlatform(value: 0)])
  static const NONE = CygnusEnvironmentReleaseChannels_._internal(0);

  ///The stable WebView2 Runtime that is released every 4 weeks.
  @EnumSupportedPlatforms(platforms: [EnumWindowsPlatform(value: 1)])
  static const STABLE = CygnusEnvironmentReleaseChannels_._internal(1);

  ///The Beta release channel that is released every 4 weeks, a week before the stable release.
  @EnumSupportedPlatforms(platforms: [EnumWindowsPlatform(value: 2)])
  static const BETA = CygnusEnvironmentReleaseChannels_._internal(2);

  ///The Dev release channel that is released weekly.
  @EnumSupportedPlatforms(platforms: [EnumWindowsPlatform(value: 4)])
  static const DEV = CygnusEnvironmentReleaseChannels_._internal(4);

  ///The Canary release channel that is released daily.
  @EnumSupportedPlatforms(platforms: [EnumWindowsPlatform(value: 8)])
  static const CANARY = CygnusEnvironmentReleaseChannels_._internal(8);
}
