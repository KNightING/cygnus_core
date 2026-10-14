import 'package:flutter_inappwebview_internal_annotations/flutter_inappwebview_internal_annotations.dart';

import '../web_uri.dart';
import 'enum_method.dart';

part 'launching_external_uri_scheme_request.g.dart';

///Class that represents the request used by the [CygnusPlatformWebViewCreationParams.onLaunchingExternalUriScheme] event.
@ExchangeableObject()
class CygnusLaunchingExternalUriSchemeRequest_ {
  ///The URI with the external URI scheme to be launched.
  CygnusWebUri uri;

  ///The origin initiating the external URI scheme launch.
  CygnusWebUri? initiatingOrigin;

  ///Whether the external URI scheme request was initiated through a user gesture.
  bool? isUserInitiated;

  CygnusLaunchingExternalUriSchemeRequest_({
    required this.uri,
    this.initiatingOrigin,
    this.isUserInitiated,
  });
}
