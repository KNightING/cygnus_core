// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'screen_capture_starting_request.dart';

// **************************************************************************
// ExchangeableObjectGenerator
// **************************************************************************

///Class that represents the request used by the [CygnusPlatformWebViewCreationParams.onScreenCaptureStarting] event.
class CygnusScreenCaptureStartingRequest {
  ///Whether to cancel the screen capture.
  bool? cancel;

  ///The frame that requests screen capture.
  CygnusFrameInfo? frame;

  ///Whether the event has been handled.
  bool? handled;
  CygnusScreenCaptureStartingRequest({this.cancel, this.frame, this.handled});

  ///Gets a possible [CygnusScreenCaptureStartingRequest] instance from a [Map] value.
  static CygnusScreenCaptureStartingRequest? fromMap(
    Map<String, dynamic>? map, {
    CygnusEnumMethod? enumMethod,
  }) {
    if (map == null) {
      return null;
    }
    final instance = CygnusScreenCaptureStartingRequest(
      cancel: map['cancel'],
      frame: CygnusFrameInfo.fromMap(
        map['frame']?.cast<String, dynamic>(),
        enumMethod: enumMethod,
      ),
      handled: map['handled'],
    );
    return instance;
  }

  ///Converts instance to a map.
  Map<String, dynamic> toMap({CygnusEnumMethod? enumMethod}) {
    return {
      "cancel": cancel,
      "frame": frame?.toMap(enumMethod: enumMethod),
      "handled": handled,
    };
  }

  ///Converts instance to a map.
  Map<String, dynamic> toJson() {
    return toMap();
  }

  @override
  String toString() {
    return 'CygnusScreenCaptureStartingRequest{cancel: $cancel, frame: $frame, handled: $handled}';
  }
}
