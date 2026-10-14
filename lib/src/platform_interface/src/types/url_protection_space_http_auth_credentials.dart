import 'package:flutter_inappwebview_internal_annotations/flutter_inappwebview_internal_annotations.dart';

import 'url_protection_space.dart';
import 'url_credential.dart';
import '../platform_http_auth_credentials_database.dart';
import 'enum_method.dart';

part 'url_protection_space_http_auth_credentials.g.dart';

///Class that represents a [CygnusURLProtectionSpace] with all of its [CygnusURLCredential]s.
///It used by [CygnusPlatformHttpAuthCredentialDatabase.getAllAuthCredentials].
@ExchangeableObject()
class CygnusURLProtectionSpaceHttpAuthCredentials_ {
  ///The protection space.
  CygnusURLProtectionSpace_? protectionSpace;

  ///The list of all its http authentication credentials.
  List<CygnusURLCredential_>? credentials;

  CygnusURLProtectionSpaceHttpAuthCredentials_({
    this.protectionSpace,
    this.credentials,
  });
}
