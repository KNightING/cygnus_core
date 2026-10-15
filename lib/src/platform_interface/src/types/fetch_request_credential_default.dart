import 'package:cygnus_core_internal_annotations/cygnus_core_internal_annotations.dart';

import 'fetch_request.dart';
import 'fetch_request_credential.dart';
import 'enum_method.dart';

part 'fetch_request_credential_default.g.dart';

///Class that represents the default credentials used by an [CygnusFetchRequest].
@ExchangeableObject()
class CygnusFetchRequestCredentialDefault_ extends CygnusFetchRequestCredential_ {
  ///The value of the credentials.
  String? value;

  CygnusFetchRequestCredentialDefault_({type, this.value}) : super(type: type);
}
