import 'package:flutter_inappwebview_internal_annotations/flutter_inappwebview_internal_annotations.dart';

import '../webview/platform_webview_controller.dart';
import 'meta_tag_attribute.dart';
import 'enum_method.dart';

part 'meta_tag.g.dart';

///Class that represents a `<meta>` HTML tag. It is used by the [CygnusPlatformWebViewController.getMetaTags] method.
@ExchangeableObject()
class CygnusMetaTag_ {
  ///The meta tag name value.
  String? name;

  ///The meta tag content value.
  String? content;

  ///The meta tag attributes list.
  List<CygnusMetaTagAttribute_>? attrs;

  CygnusMetaTag_({this.name, this.content, this.attrs});
}
