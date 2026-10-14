// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification_received_request.dart';

// **************************************************************************
// ExchangeableObjectGenerator
// **************************************************************************

///Class that represents the request used by the [CygnusPlatformWebViewCreationParams.onNotificationReceived] event.
///
///This class bundles the [senderOrigin] and the [notificationController] that can be used
///to interact with the web notification (report shown, clicked, closed, etc.).
class CygnusNotificationReceivedRequest {
  ///The notification controller that provides methods to interact with the notification.
  ///
  ///Use this controller to:
  ///- Report when the notification is shown via [CygnusPlatformWebNotificationController.reportShown]
  ///- Report when the notification is clicked via [CygnusPlatformWebNotificationController.reportClicked]
  ///- Report when the notification is closed via [CygnusPlatformWebNotificationController.reportClosed]
  ///- Listen for the close event via [CygnusPlatformWebNotificationController.onClose]
  ///- Access the notification data via [CygnusPlatformWebNotificationController.notification]
  CygnusPlatformWebNotificationController? notificationController;

  ///The origin of the web content that sends the notification.
  CygnusWebUri? senderOrigin;
  CygnusNotificationReceivedRequest({
    this.notificationController,
    this.senderOrigin,
  });

  ///Converts instance to a map.
  Map<String, dynamic> toMap({CygnusEnumMethod? enumMethod}) {
    return {
      "notificationController": notificationController,
      "senderOrigin": senderOrigin?.toString(),
    };
  }

  ///Converts instance to a map.
  Map<String, dynamic> toJson() {
    return toMap();
  }

  @override
  String toString() {
    return 'CygnusNotificationReceivedRequest{notificationController: $notificationController, senderOrigin: $senderOrigin}';
  }
}
