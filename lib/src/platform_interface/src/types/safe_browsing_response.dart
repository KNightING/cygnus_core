import 'package:flutter_inappwebview_internal_annotations/flutter_inappwebview_internal_annotations.dart';

import '../in_app_webview/platform_inappwebview_controller.dart';
import '../in_app_webview/platform_webview.dart';
import 'safe_browsing_response_action.dart';
import 'enum_method.dart';

part 'safe_browsing_response.g.dart';

///Class that represents the response used by the [CygnusPlatformWebViewCreationParams.onSafeBrowsingHit] event.
///It is used to indicate an action to take when hitting a malicious URL.
@ExchangeableObject()
class CygnusSafeBrowsingResponse_ {
  ///If reporting is enabled, all reports will be sent according to the privacy policy referenced by [CygnusPlatformWebViewController.getSafeBrowsingPrivacyPolicyUrl].
  bool report;

  ///Indicate the [CygnusSafeBrowsingResponseAction] to take when hitting a malicious URL.
  CygnusSafeBrowsingResponseAction_? action;

  CygnusSafeBrowsingResponse_({
    this.report = true,
    this.action = CygnusSafeBrowsingResponseAction_.SHOW_INTERSTITIAL,
  });
}
