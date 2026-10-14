// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'screen_capture_starting_response.dart';

// **************************************************************************
// ExchangeableObjectGenerator
// **************************************************************************

///Class that represents the response used by the [CygnusPlatformWebViewCreationParams.onScreenCaptureStarting] event.
class CygnusScreenCaptureStartingResponse {
  ///Whether to cancel the screen capture.
  bool? cancel;

  ///Whether the event has been handled.
  bool? handled;
  CygnusScreenCaptureStartingResponse({this.cancel, this.handled});

  ///Gets a possible [CygnusScreenCaptureStartingResponse] instance from a [Map] value.
  static CygnusScreenCaptureStartingResponse? fromMap(
    Map<String, dynamic>? map, {
    CygnusEnumMethod? enumMethod,
  }) {
    if (map == null) {
      return null;
    }
    final instance = CygnusScreenCaptureStartingResponse(
      cancel: map['cancel'],
      handled: map['handled'],
    );
    return instance;
  }

  ///Converts instance to a map.
  Map<String, dynamic> toMap({CygnusEnumMethod? enumMethod}) {
    return {"cancel": cancel, "handled": handled};
  }

  ///Converts instance to a map.
  Map<String, dynamic> toJson() {
    return toMap();
  }

  @override
  String toString() {
    return 'CygnusScreenCaptureStartingResponse{cancel: $cancel, handled: $handled}';
  }
}
