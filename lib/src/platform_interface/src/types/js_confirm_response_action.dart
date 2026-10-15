import 'package:cygnus_core_internal_annotations/cygnus_core_internal_annotations.dart';

import 'js_confirm_response.dart';

part 'js_confirm_response_action.g.dart';

///Class used by [CygnusJsConfirmResponse] class.
@ExchangeableEnum()
class CygnusJsConfirmResponseAction_ {
  // ignore: unused_field
  final int _value;
  const CygnusJsConfirmResponseAction_._internal(this._value);

  ///Confirm that the user hit confirm button.
  static const CONFIRM = const CygnusJsConfirmResponseAction_._internal(0);

  ///Confirm that the user hit cancel button.
  static const CANCEL = const CygnusJsConfirmResponseAction_._internal(1);
}
