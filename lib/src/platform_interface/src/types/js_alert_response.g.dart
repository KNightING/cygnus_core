// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'js_alert_response.dart';

// **************************************************************************
// ExchangeableObjectGenerator
// **************************************************************************

///Class that represents the response used by the [CygnusPlatformWebViewCreationParams.onJsAlert] event to control a JavaScript alert dialog.
class CygnusJsAlertResponse {
  ///Action used to confirm that the user hit confirm button.
  CygnusJsAlertResponseAction? action;

  ///Title of the confirm button.
  String confirmButtonTitle;

  ///Whether the client will handle the alert dialog.
  bool handledByClient;

  ///Message to be displayed in the window.
  String message;
  CygnusJsAlertResponse({
    CygnusJsAlertResponseAction? action,
    this.confirmButtonTitle = "",
    this.handledByClient = false,
    this.message = "",
  }) : action = action ?? CygnusJsAlertResponseAction.CONFIRM;

  ///Gets a possible [CygnusJsAlertResponse] instance from a [Map] value.
  static CygnusJsAlertResponse? fromMap(
    Map<String, dynamic>? map, {
    CygnusEnumMethod? enumMethod,
  }) {
    if (map == null) {
      return null;
    }
    final instance = CygnusJsAlertResponse();
    instance.action = switch (enumMethod ?? CygnusEnumMethod.nativeValue) {
      CygnusEnumMethod.nativeValue =>
        CygnusJsAlertResponseAction.fromNativeValue(map['action']),
      CygnusEnumMethod.value => CygnusJsAlertResponseAction.fromValue(
        map['action'],
      ),
      CygnusEnumMethod.name => CygnusJsAlertResponseAction.byName(
        map['action'],
      ),
    };
    if (map['confirmButtonTitle'] != null) {
      instance.confirmButtonTitle = map['confirmButtonTitle'];
    }
    if (map['handledByClient'] != null) {
      instance.handledByClient = map['handledByClient'];
    }
    if (map['message'] != null) {
      instance.message = map['message'];
    }
    return instance;
  }

  ///Converts instance to a map.
  Map<String, dynamic> toMap({CygnusEnumMethod? enumMethod}) {
    return {
      "action": switch (enumMethod ?? CygnusEnumMethod.nativeValue) {
        CygnusEnumMethod.nativeValue => action?.toNativeValue(),
        CygnusEnumMethod.value => action?.toValue(),
        CygnusEnumMethod.name => action?.name(),
      },
      "confirmButtonTitle": confirmButtonTitle,
      "handledByClient": handledByClient,
      "message": message,
    };
  }

  ///Converts instance to a map.
  Map<String, dynamic> toJson() {
    return toMap();
  }

  @override
  String toString() {
    return 'CygnusJsAlertResponse{action: $action, confirmButtonTitle: $confirmButtonTitle, handledByClient: $handledByClient, message: $message}';
  }
}
