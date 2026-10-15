import 'dart:typed_data';

import 'package:cygnus_core_internal_annotations/cygnus_core_internal_annotations.dart';

import '../web_uri.dart';
import 'enum_method.dart';

part 'favicon_changed_request.g.dart';

///Class that represents the request used by the [CygnusPlatformWebViewCreationParams.onFaviconChanged] event.
@ExchangeableObject()
class CygnusFaviconChangedRequest_ {
  ///The favicon URL for the current page, if available.
  CygnusWebUri? url;

  ///The favicon bytes for the current page, if available.
  Uint8List? icon;

  CygnusFaviconChangedRequest_({this.url, this.icon});
}
