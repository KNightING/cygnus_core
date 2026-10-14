// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'console_message.dart';

// **************************************************************************
// ExchangeableObjectGenerator
// **************************************************************************

///Class representing a JavaScript console message from WebCore.
///This could be a issued by a call to one of the console logging functions (e.g. console.log('...')) or a JavaScript error on the page.
///
///To receive notifications of these messages, use the [CygnusPlatformWebViewCreationParams.onConsoleMessage] event.
class CygnusConsoleMessage {
  ///Console message
  String message;

  ///Console message level
  CygnusConsoleMessageLevel messageLevel;
  CygnusConsoleMessage({
    this.message = "",
    CygnusConsoleMessageLevel? messageLevel,
  }) : messageLevel = messageLevel ?? CygnusConsoleMessageLevel.LOG;

  ///Gets a possible [CygnusConsoleMessage] instance from a [Map] value.
  static CygnusConsoleMessage? fromMap(
    Map<String, dynamic>? map, {
    CygnusEnumMethod? enumMethod,
  }) {
    if (map == null) {
      return null;
    }
    final instance = CygnusConsoleMessage();
    if (map['message'] != null) {
      instance.message = map['message'];
    }
    if (map['messageLevel'] != null) {
      instance.messageLevel = switch (enumMethod ??
          CygnusEnumMethod.nativeValue) {
        CygnusEnumMethod.nativeValue =>
          CygnusConsoleMessageLevel.fromNativeValue(map['messageLevel']),
        CygnusEnumMethod.value => CygnusConsoleMessageLevel.fromValue(
          map['messageLevel'],
        ),
        CygnusEnumMethod.name => CygnusConsoleMessageLevel.byName(
          map['messageLevel'],
        ),
      }!;
    }
    return instance;
  }

  ///Converts instance to a map.
  Map<String, dynamic> toMap({CygnusEnumMethod? enumMethod}) {
    return {
      "message": message,
      "messageLevel": switch (enumMethod ?? CygnusEnumMethod.nativeValue) {
        CygnusEnumMethod.nativeValue => messageLevel.toNativeValue(),
        CygnusEnumMethod.value => messageLevel.toValue(),
        CygnusEnumMethod.name => messageLevel.name(),
      },
    };
  }

  ///Converts instance to a map.
  Map<String, dynamic> toJson() {
    return toMap();
  }

  @override
  String toString() {
    return 'CygnusConsoleMessage{message: $message, messageLevel: $messageLevel}';
  }
}
