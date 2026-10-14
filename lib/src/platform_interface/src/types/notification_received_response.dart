import 'package:flutter_inappwebview_internal_annotations/flutter_inappwebview_internal_annotations.dart';

import 'enum_method.dart';

part 'notification_received_response.g.dart';

///Class that represents the response used by the [CygnusPlatformWebViewCreationParams.onNotificationReceived] event.
@ExchangeableObject()
class CygnusNotificationReceivedResponse_ {
  ///Set to `true` to indicate the notification has been handled by the host.
  bool handled;

  CygnusNotificationReceivedResponse_({required this.handled});
}
