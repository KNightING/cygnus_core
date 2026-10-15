import 'package:flutter/foundation.dart';
import 'package:cygnus_core_internal_annotations/cygnus_core_internal_annotations.dart';
import '../webview/platform_webview.dart';
part 'webview_render_process_action.g.dart';

///Class that represents the action to take used by the [CygnusPlatformWebViewCreationParams.onRenderProcessUnresponsive] and [CygnusPlatformWebViewCreationParams.onRenderProcessResponsive] event
///to terminate the Android [WebViewRenderProcess](https://developer.android.com/reference/android/webkit/WebViewRenderProcess).
@ExchangeableEnum()
class CygnusWebViewRenderProcessAction_ {
  // ignore: unused_field
  final int _value;
  const CygnusWebViewRenderProcessAction_._internal(this._value);

  ///Cause this renderer to terminate.
  @EnumSupportedPlatforms(platforms: [EnumAndroidPlatform()])
  static const TERMINATE = const CygnusWebViewRenderProcessAction_._internal(0);
}
