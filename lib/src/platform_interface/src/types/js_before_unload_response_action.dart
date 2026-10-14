import 'package:flutter_inappwebview_internal_annotations/flutter_inappwebview_internal_annotations.dart';

import 'js_before_unload_response.dart';

part 'js_before_unload_response_action.g.dart';

///Class used by [CygnusJsBeforeUnloadResponse] class.
@ExchangeableEnum()
class CygnusJsBeforeUnloadResponseAction_ {
  // ignore: unused_field
  final int _value;
  const CygnusJsBeforeUnloadResponseAction_._internal(this._value);

  ///Confirm that the user hit confirm button.
  static const CONFIRM = const CygnusJsBeforeUnloadResponseAction_._internal(0);

  ///Confirm that the user hit cancel button.
  static const CANCEL = const CygnusJsBeforeUnloadResponseAction_._internal(1);
}
