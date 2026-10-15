import 'package:cygnus_core_internal_annotations/cygnus_core_internal_annotations.dart';

part 'media_playback_state.g.dart';

///Class that describes whether an audio or video presentation is playing, paused, or suspended.
@ExchangeableEnum()
class CygnusMediaPlaybackState_ {
  // ignore: unused_field
  final int _value;
  const CygnusMediaPlaybackState_._internal(this._value);

  ///There is no media to play back.
  static const NONE = const CygnusMediaPlaybackState_._internal(0);

  ///The media is playing.
  static const PLAYING = const CygnusMediaPlaybackState_._internal(1);

  ///The media playback is paused.
  static const PAUSED = const CygnusMediaPlaybackState_._internal(2);

  ///The media is not playing, and cannot be resumed until the user revokes the suspension.
  static const SUSPENDED = const CygnusMediaPlaybackState_._internal(3);
}
