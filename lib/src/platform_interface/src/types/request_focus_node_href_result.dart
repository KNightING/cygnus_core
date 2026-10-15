import 'package:cygnus_core_internal_annotations/cygnus_core_internal_annotations.dart';

import '../webview/platform_webview_controller.dart';
import '../web_uri.dart';
import 'enum_method.dart';

part 'request_focus_node_href_result.g.dart';

///Class that represents the result used by the [CygnusPlatformWebViewController.requestFocusNodeHref] method.
@ExchangeableObject()
class CygnusRequestFocusNodeHrefResult_ {
  ///The anchor's href attribute.
  CygnusWebUri? url;

  ///The anchor's text.
  String? title;

  ///The image's src attribute.
  String? src;

  CygnusRequestFocusNodeHrefResult_({this.url, this.title, this.src});
}
