import 'package:cygnus_core_internal_annotations/cygnus_core_internal_annotations.dart';

import '../webview/platform_webview_controller.dart';
import '../web_uri.dart';
import 'enum_method.dart';

part 'request_image_ref_result.g.dart';

///Class that represents the result used by the [CygnusPlatformWebViewController.requestImageRef] method.
@ExchangeableObject()
class CygnusRequestImageRefResult_ {
  ///The image's url.
  CygnusWebUri? url;

  CygnusRequestImageRefResult_({this.url});
}
