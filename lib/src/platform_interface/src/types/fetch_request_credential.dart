import 'package:cygnus_core_internal_annotations/cygnus_core_internal_annotations.dart';

import 'fetch_request_credential_default.dart';
import 'fetch_request_federated_credential.dart';
import 'fetch_request_password_credential.dart';
import 'enum_method.dart';

part 'fetch_request_credential.g.dart';

///Class that is an interface for [CygnusFetchRequestCredentialDefault], [CygnusFetchRequestFederatedCredential] and [CygnusFetchRequestPasswordCredential] classes.
@ExchangeableObject()
class CygnusFetchRequestCredential_ {
  ///Type of credentials.
  String? type;

  CygnusFetchRequestCredential_({this.type});
}
