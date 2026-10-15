import 'package:cygnus_core_internal_annotations/cygnus_core_internal_annotations.dart';

import '../webview/platform_webview.dart';
import 'js_alert_response_action.dart';
import 'enum_method.dart';

part 'js_alert_response.g.dart';

///Class that represents the response used by the [CygnusPlatformWebViewCreationParams.onJsAlert] event to control a JavaScript alert dialog.
@ExchangeableObject()
class CygnusJsAlertResponse_ {
  ///Message to be displayed in the window.
  String message;

  ///Title of the confirm button.
  String confirmButtonTitle;

  ///Whether the client will handle the alert dialog.
  bool handledByClient;

  ///Action used to confirm that the user hit confirm button.
  CygnusJsAlertResponseAction_? action;

  CygnusJsAlertResponse_({
    this.message = "",
    this.handledByClient = false,
    this.confirmButtonTitle = "",
    this.action = CygnusJsAlertResponseAction_.CONFIRM,
  });
}
