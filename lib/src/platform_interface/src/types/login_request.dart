import 'package:flutter_inappwebview_internal_annotations/flutter_inappwebview_internal_annotations.dart';

import '../webview/platform_webview.dart';
import 'enum_method.dart';

part 'login_request.g.dart';

///Class used by [CygnusPlatformWebViewCreationParams.onReceivedLoginRequest] event.
@ExchangeableObject()
class CygnusLoginRequest_ {
  ///The account realm used to look up accounts.
  String realm;

  ///An optional account. If not `null`, the account should be checked against accounts on the device.
  ///If it is a valid account, it should be used to log in the user. This value may be `null`.
  String? account;

  ///Authenticator specific arguments used to log in the user.
  String args;

  CygnusLoginRequest_({required this.realm, this.account, required this.args});
}
