import 'package:cygnus_core_internal_annotations/cygnus_core_internal_annotations.dart';

import 'client_cert_response.dart';

part 'client_cert_response_action.g.dart';

///Class used by [CygnusClientCertResponse] class.
@ExchangeableEnum()
class CygnusClientCertResponseAction_ {
  // ignore: unused_field
  final int _value;
  const CygnusClientCertResponseAction_._internal(this._value);

  ///Cancel this request.
  static const CANCEL = const CygnusClientCertResponseAction_._internal(0);

  ///Proceed with the specified certificate.
  static const PROCEED = const CygnusClientCertResponseAction_._internal(1);

  ///Ignore the request for now.
  static const IGNORE = const CygnusClientCertResponseAction_._internal(2);
}
