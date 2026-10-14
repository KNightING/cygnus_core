// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'media_capture_state.dart';

// **************************************************************************
// ExchangeableEnumGenerator
// **************************************************************************

///Class that describes whether a media device, like a camera or microphone, is currently capturing audio or video.
class CygnusMediaCaptureState {
  final int _value;
  final int? _nativeValue;
  const CygnusMediaCaptureState._internal(this._value, this._nativeValue);
  // ignore: unused_element
  factory CygnusMediaCaptureState._internalMultiPlatform(
    int value,
    Function nativeValue,
  ) => CygnusMediaCaptureState._internal(value, nativeValue());

  ///The media device is actively capturing audio or video.
  static const ACTIVE = CygnusMediaCaptureState._internal(1, 1);

  ///The media device is muted, and not actively capturing audio or video.
  static const MUTED = CygnusMediaCaptureState._internal(2, 2);

  ///The media device is off.
  static const NONE = CygnusMediaCaptureState._internal(0, 0);

  ///Set of all values of [CygnusMediaCaptureState].
  static final Set<CygnusMediaCaptureState> values = [
    CygnusMediaCaptureState.ACTIVE,
    CygnusMediaCaptureState.MUTED,
    CygnusMediaCaptureState.NONE,
  ].toSet();

  ///Gets a possible [CygnusMediaCaptureState] instance from [int] value.
  static CygnusMediaCaptureState? fromValue(int? value) {
    if (value != null) {
      try {
        return CygnusMediaCaptureState.values.firstWhere(
          (element) => element.toValue() == value,
        );
      } catch (e) {
        return null;
      }
    }
    return null;
  }

  ///Gets a possible [CygnusMediaCaptureState] instance from a native value.
  static CygnusMediaCaptureState? fromNativeValue(int? value) {
    if (value != null) {
      try {
        return CygnusMediaCaptureState.values.firstWhere(
          (element) => element.toNativeValue() == value,
        );
      } catch (e) {
        return null;
      }
    }
    return null;
  }

  /// Gets a possible [CygnusMediaCaptureState] instance value with name [name].
  ///
  /// Goes through [CygnusMediaCaptureState.values] looking for a value with
  /// name [name], as reported by [CygnusMediaCaptureState.name].
  /// Returns the first value with the given name, otherwise `null`.
  static CygnusMediaCaptureState? byName(String? name) {
    if (name != null) {
      try {
        return CygnusMediaCaptureState.values.firstWhere(
          (element) => element.name() == name,
        );
      } catch (e) {
        return null;
      }
    }
    return null;
  }

  /// Creates a map from the names of [CygnusMediaCaptureState] values to the values.
  ///
  /// The collection that this method is called on is expected to have
  /// values with distinct names, like the `values` list of an enum class.
  /// Only one value for each name can occur in the created map,
  /// so if two or more values have the same name (either being the
  /// same value, or being values of different enum type), at most one of
  /// them will be represented in the returned map.
  static Map<String, CygnusMediaCaptureState> asNameMap() =>
      <String, CygnusMediaCaptureState>{
        for (final value in CygnusMediaCaptureState.values) value.name(): value,
      };

  ///Gets [int] value.
  int toValue() => _value;

  ///Gets [int] native value if supported by the current platform, otherwise `null`.
  int? toNativeValue() => _nativeValue;

  ///Gets the name of the value.
  String name() {
    switch (_value) {
      case 1:
        return 'ACTIVE';
      case 2:
        return 'MUTED';
      case 0:
        return 'NONE';
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
