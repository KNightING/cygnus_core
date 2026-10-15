import 'package:cygnus_core_internal_annotations/cygnus_core_internal_annotations.dart';

import 'js_alert_response.dart';

part 'js_alert_response_action.g.dart';

///Class used by [CygnusJsAlertResponse] class.
@ExchangeableEnum()
class CygnusJsAlertResponseAction_ {
  // ignore: unused_field
  final int _value;
  const CygnusJsAlertResponseAction_._internal(this._value);

  ///Confirm that the user hit confirm button.
  static const CONFIRM = const CygnusJsAlertResponseAction_._internal(0);
}
