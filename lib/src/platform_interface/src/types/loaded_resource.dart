import 'package:flutter_inappwebview_internal_annotations/flutter_inappwebview_internal_annotations.dart';

import '../webview/platform_webview.dart';
import '../web_uri.dart';
import 'enum_method.dart';

part 'loaded_resource.g.dart';

///Class representing a resource response of the `WebView`.
///It is used by the method [CygnusPlatformWebViewCreationParams.onLoadResource].
@ExchangeableObject()
class CygnusLoadedResource_ {
  ///A string representing the type of resource.
  String? initiatorType;

  ///Resource URL.
  CygnusWebUri? url;

  ///Returns the [DOMHighResTimeStamp](https://developer.mozilla.org/en-US/docs/Web/API/DOMHighResTimeStamp) for the time a resource fetch started.
  double? startTime;

  ///Returns the [DOMHighResTimeStamp](https://developer.mozilla.org/en-US/docs/Web/API/DOMHighResTimeStamp) duration to fetch a resource.
  double? duration;

  CygnusLoadedResource_({
    this.initiatorType,
    this.url,
    this.startTime,
    this.duration,
  });
}
