import 'package:cygnus_core_internal_annotations/cygnus_core_internal_annotations.dart';

import '../webview/platform_webview.dart';
import 'server_trust_auth_response_action.dart';
import 'enum_method.dart';

part 'server_trust_auth_response.g.dart';

///Class that represents the response used by the [CygnusPlatformWebViewCreationParams.onReceivedServerTrustAuthRequest] event.
@ExchangeableObject()
class CygnusServerTrustAuthResponse_ {
  ///Indicate the [CygnusServerTrustAuthResponseAction] to take in response of the server trust authentication challenge.
  CygnusServerTrustAuthResponseAction_? action;

  CygnusServerTrustAuthResponse_({
    this.action = CygnusServerTrustAuthResponseAction_.CANCEL,
  });
}
