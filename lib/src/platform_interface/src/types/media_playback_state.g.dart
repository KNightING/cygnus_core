// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'media_playback_state.dart';

// **************************************************************************
// ExchangeableEnumGenerator
// **************************************************************************

///Class that describes whether an audio or video presentation is playing, paused, or suspended.
class CygnusMediaPlaybackState {
  final int _value;
  final int? _nativeValue;
  const CygnusMediaPlaybackState._internal(this._value, this._nativeValue);
  // ignore: unused_element
  factory CygnusMediaPlaybackState._internalMultiPlatform(
    int value,
    Function nativeValue,
  ) => CygnusMediaPlaybackState._internal(value, nativeValue());

  ///There is no media to play back.
  static const NONE = CygnusMediaPlaybackState._internal(0, 0);

  ///The media playback is paused.
  static const PAUSED = CygnusMediaPlaybackState._internal(2, 2);

  ///The media is playing.
  static const PLAYING = CygnusMediaPlaybackState._internal(1, 1);

  ///The media is not playing, and cannot be resumed until the user revokes the suspension.
  static const SUSPENDED = CygnusMediaPlaybackState._internal(3, 3);

  ///Set of all values of [CygnusMediaPlaybackState].
  static final Set<CygnusMediaPlaybackState> values = [
    CygnusMediaPlaybackState.NONE,
    CygnusMediaPlaybackState.PAUSED,
    CygnusMediaPlaybackState.PLAYING,
    CygnusMediaPlaybackState.SUSPENDED,
  ].toSet();

  ///Gets a possible [CygnusMediaPlaybackState] instance from [int] value.
  static CygnusMediaPlaybackState? fromValue(int? value) {
    if (value != null) {
      try {
        return CygnusMediaPlaybackState.values.firstWhere(
          (element) => element.toValue() == value,
        );
      } catch (e) {
        return null;
      }
    }
    return null;
  }

  ///Gets a possible [CygnusMediaPlaybackState] instance from a native value.
  static CygnusMediaPlaybackState? fromNativeValue(int? value) {
    if (value != null) {
      try {
        return CygnusMediaPlaybackState.values.firstWhere(
          (element) => element.toNativeValue() == value,
        );
      } catch (e) {
        return null;
      }
    }
    return null;
  }

  /// Gets a possible [CygnusMediaPlaybackState] instance value with name [name].
  ///
  /// Goes through [CygnusMediaPlaybackState.values] looking for a value with
  /// name [name], as reported by [CygnusMediaPlaybackState.name].
  /// Returns the first value with the given name, otherwise `null`.
  static CygnusMediaPlaybackState? byName(String? name) {
    if (name != null) {
      try {
        return CygnusMediaPlaybackState.values.firstWhere(
          (element) => element.name() == name,
        );
      } catch (e) {
        return null;
      }
    }
    return null;
  }

  /// Creates a map from the names of [CygnusMediaPlaybackState] values to the values.
  ///
  /// The collection that this method is called on is expected to have
  /// values with distinct names, like the `values` list of an enum class.
  /// Only one value for each name can occur in the created map,
  /// so if two or more values have the same name (either being the
  /// same value, or being values of different enum type), at most one of
  /// them will be represented in the returned map.
  static Map<String, CygnusMediaPlaybackState> asNameMap() =>
      <String, CygnusMediaPlaybackState>{
        for (final value in CygnusMediaPlaybackState.values)
          value.name(): value,
      };

  ///Gets [int] value.
  int toValue() => _value;

  ///Gets [int] native value if supported by the current platform, otherwise `null`.
  int? toNativeValue() => _nativeValue;

  ///Gets the name of the value.
  String name() {
    switch (_value) {
      case 0:
        return 'NONE';
      case 2:
        return 'PAUSED';
      case 1:
        return 'PLAYING';
      case 3:
        return 'SUSPENDED';
    }
    return _value.toString();
  }

  @override
  int get hashCode => _value.hashCode;

  @override
  bool operator ==(value) => value == _value;

  ///Checks if the value is supported by the [defaultTargetPlatform].
  bool isSupported() {
    return _nativeValue != null;
  }

  @override
  String toString() {
    return name();
  }
}
