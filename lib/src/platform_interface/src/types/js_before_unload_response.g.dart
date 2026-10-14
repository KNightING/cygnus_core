// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'js_before_unload_response.dart';

// **************************************************************************
// ExchangeableObjectGenerator
// **************************************************************************

///Class that represents the response used by the [CygnusPlatformWebViewCreationParams.onJsBeforeUnload] event to control a JavaScript alert dialog.
class CygnusJsBeforeUnloadResponse {
  ///Action used to confirm that the user hit confirm or cancel button.
  CygnusJsBeforeUnloadResponseAction? action;

  ///Title of the cancel button.
  String cancelButtonTitle;

  ///Title of the confirm button.
  String confirmButtonTitle;

  ///Whether the client will handle the alert dialog.
  bool handledByClient;

  ///Message to be displayed in the window.
  String message;
  CygnusJsBeforeUnloadResponse({
    CygnusJsBeforeUnloadResponseAction? action,
    this.cancelButtonTitle = "",
    this.confirmButtonTitle = "",
    this.handledByClient = false,
    this.message = "",
  }) : action = action ?? CygnusJsBeforeUnloadResponseAction.CONFIRM;

  ///Gets a possible [CygnusJsBeforeUnloadResponse] instance from a [Map] value.
  static CygnusJsBeforeUnloadResponse? fromMap(
    Map<String, dynamic>? map, {
    CygnusEnumMethod? enumMethod,
  }) {
    if (map == null) {
      return null;
    }
    final instance = CygnusJsBeforeUnloadResponse();
    instance.action = switch (enumMethod ?? CygnusEnumMethod.nativeValue) {
      CygnusEnumMethod.nativeValue =>
        CygnusJsBeforeUnloadResponseAction.fromNativeValue(map['action']),
      CygnusEnumMethod.value => CygnusJsBeforeUnloadResponseAction.fromValue(
        map['action'],
      ),
      CygnusEnumMethod.name => CygnusJsBeforeUnloadResponseAction.byName(
        map['action'],
      ),
    };
    if (map['cancelButtonTitle'] != null) {
      instance.cancelButtonTitle = map['cancelButtonTitle'];
    }
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
      "cancelButtonTitle": cancelButtonTitle,
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
    return 'CygnusJsBeforeUnloadResponse{action: $action, cancelButtonTitle: $cancelButtonTitle, confirmButtonTitle: $confirmButtonTitle, handledByClient: $handledByClient, message: $message}';
  }
}
