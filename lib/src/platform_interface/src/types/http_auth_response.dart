import 'package:flutter_inappwebview_internal_annotations/flutter_inappwebview_internal_annotations.dart';

import '../webview/platform_webview.dart';
import 'http_auth_response_action.dart';
import 'enum_method.dart';

part 'http_auth_response.g.dart';

///Class that represents the response used by the [CygnusPlatformWebViewCreationParams.onReceivedHttpAuthRequest] event.
@ExchangeableObject()
class CygnusHttpAuthResponse_ {
  ///Represents the username used for the authentication if the [action] corresponds to [CygnusHttpAuthResponseAction.PROCEED]
  String username;

  ///Represents the password used for the authentication if the [action] corresponds to [CygnusHttpAuthResponseAction.PROCEED]
  String password;

  ///Indicate if the given credentials need to be saved permanently.
  bool permanentPersistence;

  ///Indicate the [CygnusHttpAuthResponseAction] to take in response of the authentication challenge.
  CygnusHttpAuthResponseAction_? action;

  CygnusHttpAuthResponse_({
    this.username = "",
    this.password = "",
    this.permanentPersistence = false,
    this.action = CygnusHttpAuthResponseAction_.CANCEL,
  });
}
