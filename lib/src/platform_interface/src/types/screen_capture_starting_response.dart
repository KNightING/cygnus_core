import 'package:cygnus_core_internal_annotations/cygnus_core_internal_annotations.dart';

import 'enum_method.dart';

part 'screen_capture_starting_response.g.dart';

///Class that represents the response used by the [CygnusPlatformWebViewCreationParams.onScreenCaptureStarting] event.
@ExchangeableObject()
class CygnusScreenCaptureStartingResponse_ {
  ///Whether to cancel the screen capture.
  bool? cancel;

  ///Whether the event has been handled.
  bool? handled;

  CygnusScreenCaptureStartingResponse_({this.cancel, this.handled});
}
