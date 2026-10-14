import 'package:flutter_inappwebview_internal_annotations/flutter_inappwebview_internal_annotations.dart';

import '../webview/platform_webview_controller.dart';
import 'enum_method.dart';

part 'call_async_javascript_result.g.dart';

///Class that represents either a success or a failure, including an associated value in each case for [CygnusPlatformWebViewController.callAsyncJavaScript].
@ExchangeableObject()
class CygnusCallAsyncJavaScriptResult_ {
  ///It contains the success value.
  dynamic value;

  ///It contains the failure value.
  String? error;

  CygnusCallAsyncJavaScriptResult_({this.value, this.error});
}
