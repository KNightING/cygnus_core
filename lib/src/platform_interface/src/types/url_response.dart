import 'package:flutter_inappwebview_internal_annotations/flutter_inappwebview_internal_annotations.dart';

import '../web_uri.dart';
import 'enum_method.dart';

part 'url_response.g.dart';

///The metadata associated with the response to a URL load request, independent of protocol and URL scheme.
@ExchangeableObject()
class CygnusURLResponse_ {
  ///The URL for the response.
  CygnusWebUri? url;

  ///The expected length of the response’s content.
  int expectedContentLength;

  ///The MIME type of the response.
  String? mimeType;

  ///A suggested filename for the response data.
  String? suggestedFilename;

  ///The name of the text encoding provided by the response’s originating source.
  String? textEncodingName;

  ///All HTTP header fields of the response.
  Map<String, String>? headers;

  ///The response’s HTTP status code.
  int? statusCode;

  CygnusURLResponse_({
    this.url,
    required this.expectedContentLength,
    this.mimeType,
    this.suggestedFilename,
    this.textEncodingName,
    this.headers,
    this.statusCode,
  });
}

///Use [CygnusURLResponse] instead.
@Deprecated("Use CygnusURLResponse instead")
@ExchangeableObject()
class CygnusIOSURLResponse_ {
  ///The URL for the response.
  Uri? url;

  ///The expected length of the response’s content.
  int expectedContentLength;

  ///The MIME type of the response.
  String? mimeType;

  ///A suggested filename for the response data.
  String? suggestedFilename;

  ///The name of the text encoding provided by the response’s originating source.
  String? textEncodingName;

  ///All HTTP header fields of the response.
  Map<String, String>? headers;

  ///The response’s HTTP status code.
  int? statusCode;

  CygnusIOSURLResponse_({
    this.url,
    required this.expectedContentLength,
    this.mimeType,
    this.suggestedFilename,
    this.textEncodingName,
    this.headers,
    this.statusCode,
  });
}
