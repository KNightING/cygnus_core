import 'package:cygnus_core_internal_annotations/cygnus_core_internal_annotations.dart';

import 'url_protection_space.dart';
import 'enum_method.dart';

part 'url_authentication_challenge.g.dart';

///Class that represents a challenge from a server requiring authentication from the client.
///It provides all the information about the challenge.
@ExchangeableObject()
class CygnusURLAuthenticationChallenge_ {
  ///The protection space requiring authentication.
  CygnusURLProtectionSpace_ protectionSpace;

  CygnusURLAuthenticationChallenge_({required this.protectionSpace});
}
