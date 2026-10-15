import 'package:cygnus_core_internal_annotations/cygnus_core_internal_annotations.dart';

import 'ajax_request.dart';

part 'ajax_request_action.g.dart';

///Class used by [CygnusAjaxRequest] class.
@ExchangeableEnum()
class CygnusAjaxRequestAction_ {
  // ignore: unused_field
  final int _value;
  const CygnusAjaxRequestAction_._internal(this._value);

  ///Aborts the current [CygnusAjaxRequest].
  static const ABORT = const CygnusAjaxRequestAction_._internal(0);

  ///Proceeds with the current [CygnusAjaxRequest].
  static const PROCEED = const CygnusAjaxRequestAction_._internal(1);
}
