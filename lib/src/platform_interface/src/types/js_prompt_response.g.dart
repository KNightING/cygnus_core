// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'js_prompt_response.dart';

// **************************************************************************
// ExchangeableObjectGenerator
// **************************************************************************

///Class that represents the response used by the [CygnusPlatformWebViewCreationParams.onJsPrompt] event to control a JavaScript prompt dialog.
class CygnusJsPromptResponse {
  ///Action used to confirm that the user hit confirm or cancel button.
  CygnusJsPromptResponseAction? action;

  ///Title of the cancel button.
  String cancelButtonTitle;

  ///Title of the confirm button.
  String confirmButtonTitle;

  ///The default value displayed in the prompt dialog.
  String defaultValue;

  ///Whether the client will handle the prompt dialog.
  bool handledByClient;

  ///Message to be displayed in the window.
  String message;

  ///Value of the prompt dialog.
  String? value;
  CygnusJsPromptResponse({
    CygnusJsPromptResponseAction? action,
    this.cancelButtonTitle = "",
    this.confirmButtonTitle = "",
    this.defaultValue = "",
    this.handledByClient = false,
    this.message = "",
    this.value,
  }) : action = action ?? CygnusJsPromptResponseAction.CANCEL;

  ///Gets a possible [CygnusJsPromptResponse] instance from a [Map] value.
  static CygnusJsPromptResponse? fromMap(
    Map<String, dynamic>? map, {
    CygnusEnumMethod? enumMethod,
  }) {
    if (map == null) {
      return null;
    }
    final instance = CygnusJsPromptResponse(value: map['value']);
    instance.action = switch (enumMethod ?? CygnusEnumMethod.nativeValue) {
      CygnusEnumMethod.nativeValue =>
        CygnusJsPromptResponseAction.fromNativeValue(map['action']),
      CygnusEnumMethod.value => CygnusJsPromptResponseAction.fromValue(
        map['action'],
      ),
      CygnusEnumMethod.name => CygnusJsPromptResponseAction.byName(
        map['action'],
      ),
    };
    if (map['cancelButtonTitle'] != null) {
      instance.cancelButtonTitle = map['cancelButtonTitle'];
    }
    if (map['confirmButtonTitle'] != null) {
      instance.confirmButtonTitle = map['confirmButtonTitle'];
    }
    if (map['defaultValue'] != null) {
      instance.defaultValue = map['defaultValue'];
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
      "defaultValue": defaultValue,
      "handledByClient": handledByClient,
      "message": message,
      "value": value,
    };
  }

  ///Converts instance to a map.
  Map<String, dynamic> toJson() {
    return toMap();
  }

  @override
  String toString() {
    return 'CygnusJsPromptResponse{action: $action, cancelButtonTitle: $cancelButtonTitle, confirmButtonTitle: $confirmButtonTitle, defaultValue: $defaultValue, handledByClient: $handledByClient, message: $message, value: $value}';
  }
}
