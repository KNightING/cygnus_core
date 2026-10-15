import 'package:cygnus_core_internal_annotations/cygnus_core_internal_annotations.dart';

import '../webview/platform_webview_controller.dart';
import '../web_uri.dart';
import 'enum_method.dart';

part 'favicon.g.dart';

///Class that represents a favicon of a website. It is used by [CygnusPlatformWebViewController.getFavicons] method.
@ExchangeableObject()
class CygnusFavicon_ {
  ///The url of the favicon image.
  CygnusWebUri url;

  ///The relationship between the current web page and the favicon image.
  String? rel;

  ///The width of the favicon image.
  int? width;

  ///The height of the favicon image.
  int? height;

  CygnusFavicon_({required this.url, this.rel, this.width, this.height});
}
