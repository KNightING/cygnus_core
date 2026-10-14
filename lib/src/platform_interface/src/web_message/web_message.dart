import 'package:flutter/foundation.dart';
import 'package:flutter_inappwebview_internal_annotations/flutter_inappwebview_internal_annotations.dart';

import '../platform_webview_feature.dart';
import 'platform_web_message_port.dart';
import '../types/enum_method.dart';

part 'web_message.g.dart';

///The Dart representation of the HTML5 PostMessage event.
///See https://html.spec.whatwg.org/multipage/comms.html#the-messageevent-interfaces for definition of a MessageEvent in HTML5.
@ExchangeableObject(fromMapForceAllInline: true)
class CygnusWebMessage_ {
  ///The data of the message.
  dynamic data;

  ///The payload type of the message.
  CygnusWebMessageType_ type;

  ///The ports that are sent with the message.
  List<CygnusIWebMessagePort>? ports;

  @ExchangeableObjectConstructor()
  CygnusWebMessage_({this.data, this.type = CygnusWebMessageType_.STRING, this.ports}) {
    assert(
      ((this.data == null || this.data is String) &&
              this.type == CygnusWebMessageType_.STRING) ||
          (this.data != null &&
              this.data is Uint8List &&
              this.type == CygnusWebMessageType_.ARRAY_BUFFER),
    );
  }
}

///The type corresponding to the [CygnusWebMessage].
@ExchangeableEnum()
class CygnusWebMessageType_ {
  // ignore: unused_field
  final int _value;

  const CygnusWebMessageType_._internal(this._value);

  ///Indicates the payload of WebMessageCompat is String.
  static const STRING = const CygnusWebMessageType_._internal(0);

  ///Indicates the payload of WebMessageCompat is JavaScript ArrayBuffer.
  ///
  ///**NOTE**: available only if [CygnusWebViewFeature.WEB_MESSAGE_ARRAY_BUFFER] feature is supported.
  static const ARRAY_BUFFER = const CygnusWebMessageType_._internal(1);
}
