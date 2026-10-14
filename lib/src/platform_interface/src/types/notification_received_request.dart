import 'package:flutter_inappwebview_internal_annotations/flutter_inappwebview_internal_annotations.dart';

import '../web_notification/platform_web_notification_controller.dart';
import '../web_uri.dart';
import 'enum_method.dart';

part 'notification_received_request.g.dart';

///Class that represents the request used by the [CygnusPlatformWebViewCreationParams.onNotificationReceived] event.
///
///This class bundles the [senderOrigin] and the [notificationController] that can be used
///to interact with the web notification (report shown, clicked, closed, etc.).
@ExchangeableObject(fromMapFactory: false)
class CygnusNotificationReceivedRequest_ {
  ///The origin of the web content that sends the notification.
  CygnusWebUri? senderOrigin;

  ///The notification controller that provides methods to interact with the notification.
  ///
  ///Use this controller to:
  ///- Report when the notification is shown via [CygnusPlatformWebNotificationController.reportShown]
  ///- Report when the notification is clicked via [CygnusPlatformWebNotificationController.reportClicked]
  ///- Report when the notification is closed via [CygnusPlatformWebNotificationController.reportClosed]
  ///- Listen for the close event via [CygnusPlatformWebNotificationController.onClose]
  ///- Access the notification data via [CygnusPlatformWebNotificationController.notification]
  CygnusPlatformWebNotificationController? notificationController;

  CygnusNotificationReceivedRequest_({
    this.senderOrigin,
    this.notificationController,
  });
}
