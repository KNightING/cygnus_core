import 'package:cygnus_core_internal_annotations/cygnus_core_internal_annotations.dart';

import 'url_authentication_challenge.dart';
import 'url_protection_space.dart';
import 'enum_method.dart';

part 'server_trust_challenge.g.dart';

///Class that represents the challenge of the [CygnusPlatformWebViewCreationParams.onReceivedServerTrustAuthRequest] event.
///It provides all the information about the challenge.
@ExchangeableObject()
class CygnusServerTrustChallenge_ extends CygnusURLAuthenticationChallenge_ {
  CygnusServerTrustChallenge_({required CygnusURLProtectionSpace_ protectionSpace})
    : super(protectionSpace: protectionSpace);
}
