import 'package:flutter_inappwebview_internal_annotations/flutter_inappwebview_internal_annotations.dart';

import 'enum_method.dart';

part 'security_origin.g.dart';

///An object that identifies the origin of a particular resource.
@ExchangeableObject()
class CygnusSecurityOrigin_ {
  ///The security origin’s host.
  String host;

  ///The security origin's port.
  int port;

  ///The security origin's protocol.
  String protocol;

  CygnusSecurityOrigin_({
    required this.host,
    required this.port,
    required this.protocol,
  });
}

///An object that identifies the origin of a particular resource.
///
///**NOTE**: available only on iOS 9.0+.
///
///Use [CygnusSecurityOrigin] instead.
@Deprecated("Use CygnusSecurityOrigin instead")
@ExchangeableObject()
class CygnusIOSWKSecurityOrigin_ {
  ///The security origin’s host.
  String host;

  ///The security origin's port.
  int port;

  ///The security origin's protocol.
  String protocol;

  CygnusIOSWKSecurityOrigin_({
    required this.host,
    required this.port,
    required this.protocol,
  });
}
