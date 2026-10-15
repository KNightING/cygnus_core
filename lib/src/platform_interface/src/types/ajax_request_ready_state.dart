import 'package:cygnus_core_internal_annotations/cygnus_core_internal_annotations.dart';

import 'ajax_request.dart';

part 'ajax_request_ready_state.g.dart';

///Class used by [CygnusAjaxRequest] class. It represents the state of an [CygnusAjaxRequest].
@ExchangeableEnum()
class CygnusAjaxRequestReadyState_ {
  // ignore: unused_field
  final int _value;
  const CygnusAjaxRequestReadyState_._internal(this._value);

  ///Client has been created. `XMLHttpRequest.open()` not called yet.
  static const UNSENT = const CygnusAjaxRequestReadyState_._internal(0);

  ///`XMLHttpRequest.open()` has been called.
  static const OPENED = const CygnusAjaxRequestReadyState_._internal(1);

  ///`XMLHttpRequest.send()` has been called, and [CygnusAjaxRequest.headers] and [CygnusAjaxRequest.status] are available.
  static const HEADERS_RECEIVED = const CygnusAjaxRequestReadyState_._internal(2);

  ///Downloading; [CygnusAjaxRequest.responseText] holds partial data.
  static const LOADING = const CygnusAjaxRequestReadyState_._internal(3);

  ///The operation is complete.
  static const DONE = const CygnusAjaxRequestReadyState_._internal(4);
}
