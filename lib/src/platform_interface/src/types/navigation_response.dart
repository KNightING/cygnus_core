import 'package:cygnus_core_internal_annotations/cygnus_core_internal_annotations.dart';

import '../webview/platform_webview.dart';
import 'url_response.dart';
import 'enum_method.dart';

part 'navigation_response.g.dart';

///Class that represents the navigation response used by the [CygnusPlatformWebViewCreationParams.onNavigationResponse] event.
@ExchangeableObject()
class CygnusNavigationResponse_ {
  ///The URL for the response.
  CygnusURLResponse_? response;

  ///A Boolean value that indicates whether the response targets the web view’s main frame.
  bool isForMainFrame;

  ///A Boolean value that indicates whether WebKit is capable of displaying the response’s MIME type natively.
  bool canShowMIMEType;

  CygnusNavigationResponse_({
    this.response,
    required this.isForMainFrame,
    required this.canShowMIMEType,
  });
}

///An iOS-specific Class that represents the navigation response used by the [CygnusPlatformWebViewCreationParams.onNavigationResponse] event.
///Use [CygnusNavigationResponse] instead.
@Deprecated("Use CygnusNavigationResponse instead")
@ExchangeableObject()
class CygnusIOSWKNavigationResponse_ {
  ///The URL for the response.
  CygnusIOSURLResponse_? response;

  ///A Boolean value that indicates whether the response targets the web view’s main frame.
  bool isForMainFrame;

  ///A Boolean value that indicates whether WebKit is capable of displaying the response’s MIME type natively.
  bool canShowMIMEType;

  CygnusIOSWKNavigationResponse_({
    this.response,
    required this.isForMainFrame,
    required this.canShowMIMEType,
  });
}
