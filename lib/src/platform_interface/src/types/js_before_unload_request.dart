import 'package:flutter_inappwebview_internal_annotations/flutter_inappwebview_internal_annotations.dart';

import '../in_app_webview/platform_webview.dart';
import '../web_uri.dart';
import 'enum_method.dart';

part 'js_before_unload_request.g.dart';

///Class that represents the request of the [CygnusPlatformWebViewCreationParams.onJsBeforeUnload] event.
@ExchangeableObject()
class CygnusJsBeforeUnloadRequest_ {
  ///The url of the page requesting the dialog.
  CygnusWebUri? url;

  ///Message to be displayed in the window.
  String? message;

  CygnusJsBeforeUnloadRequest_({this.url, this.message});
}
