// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification_received_response.dart';

// **************************************************************************
// ExchangeableObjectGenerator
// **************************************************************************

///Class that represents the response used by the [CygnusPlatformWebViewCreationParams.onNotificationReceived] event.
class CygnusNotificationReceivedResponse {
  ///Set to `true` to indicate the notification has been handled by the host.
  bool handled;
  CygnusNotificationReceivedResponse({required this.handled});

  ///Gets a possible [CygnusNotificationReceivedResponse] instance from a [Map] value.
  static CygnusNotificationReceivedResponse? fromMap(
    Map<String, dynamic>? map, {
    CygnusEnumMethod? enumMethod,
  }) {
    if (map == null) {
      return null;
    }
    final instance = CygnusNotificationReceivedResponse(
      handled: map['handled'],
    );
    return instance;
  }

  ///Converts instance to a map.
  Map<String, dynamic> toMap({CygnusEnumMethod? enumMethod}) {
    return {"handled": handled};
  }

  ///Converts instance to a map.
  Map<String, dynamic> toJson() {
    return toMap();
  }

  @override
  String toString() {
    return 'CygnusNotificationReceivedResponse{handled: $handled}';
  }
}
