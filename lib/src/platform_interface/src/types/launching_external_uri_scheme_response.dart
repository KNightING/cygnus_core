import 'package:flutter_inappwebview_internal_annotations/flutter_inappwebview_internal_annotations.dart';

import 'enum_method.dart';

part 'launching_external_uri_scheme_response.g.dart';

///Class that represents the response used by the [CygnusPlatformWebViewCreationParams.onLaunchingExternalUriScheme] event.
@ExchangeableObject()
class CygnusLaunchingExternalUriSchemeResponse_ {
  ///Set to `true` to cancel the external URI scheme launch.
  bool cancel;

  CygnusLaunchingExternalUriSchemeResponse_({required this.cancel});
}
