import 'package:cygnus_core_internal_annotations/cygnus_core_internal_annotations.dart';

part 'media_capture_state.g.dart';

///Class that describes whether a media device, like a camera or microphone, is currently capturing audio or video.
@ExchangeableEnum()
class CygnusMediaCaptureState_ {
  // ignore: unused_field
  final int _value;
  const CygnusMediaCaptureState_._internal(this._value);

  ///The media device is off.
  static const NONE = const CygnusMediaCaptureState_._internal(0);

  ///The media device is actively capturing audio or video.
  static const ACTIVE = const CygnusMediaCaptureState_._internal(1);

  ///The media device is muted, and not actively capturing audio or video.
  static const MUTED = const CygnusMediaCaptureState_._internal(2);
}
