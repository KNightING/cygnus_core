// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'trusted_web_activity_screen_orientation.dart';

// **************************************************************************
// ExchangeableEnumGenerator
// **************************************************************************

///Class representing Screen Orientation Lock type value of a Trusted Web Activity:
///https://www.w3.org/TR/screen-orientation/#screenorientation-interface
class CygnusTrustedWebActivityScreenOrientation {
  final int _value;
  final int? _nativeValue;
  const CygnusTrustedWebActivityScreenOrientation._internal(
    this._value,
    this._nativeValue,
  );
  // ignore: unused_element
  factory CygnusTrustedWebActivityScreenOrientation._internalMultiPlatform(
    int value,
    Function nativeValue,
  ) =>
      CygnusTrustedWebActivityScreenOrientation._internal(value, nativeValue());

  /// Any is an orientation that means the screen can be locked to any one of portrait-primary,
  /// portrait-secondary, landscape-primary and landscape-secondary.
  static const ANY = CygnusTrustedWebActivityScreenOrientation._internal(5, 5);

  /// The default screen orientation is the set of orientations to which the screen is locked when
  /// there is no current orientation lock.
  static const DEFAULT = CygnusTrustedWebActivityScreenOrientation._internal(
    0,
    0,
  );

  /// Landscape is an orientation where the screen width is greater than the screen height and
  /// depending on platform convention locking the screen to landscape can represent
  /// landscape-primary, landscape-secondary or both.
  static const LANDSCAPE = CygnusTrustedWebActivityScreenOrientation._internal(
    6,
    6,
  );

  /// Landscape-primary is an orientation where the screen width is greater than the screen height.
  /// If the device's natural orientation is landscape, then it is in landscape-primary when held
  /// in that position.
  static const LANDSCAPE_PRIMARY =
      CygnusTrustedWebActivityScreenOrientation._internal(3, 3);

  /// Landscape-secondary is an orientation where the screen width is greater than the
  /// screen height. If the device's natural orientation is landscape, it is in
  /// landscape-secondary when rotated 180° from its natural orientation.
  static const LANDSCAPE_SECONDARY =
      CygnusTrustedWebActivityScreenOrientation._internal(4, 4);

  /// Natural is an orientation that refers to either portrait-primary or landscape-primary
  /// depending on the device's usual orientation. This orientation is usually provided by
  /// the underlying operating system.
  static const NATURAL = CygnusTrustedWebActivityScreenOrientation._internal(
    8,
    8,
  );

  /// Portrait is an orientation where the screen width is less than or equal to the screen height
  /// and depending on platform convention locking the screen to portrait can represent
  /// portrait-primary, portrait-secondary or both.
  static const PORTRAIT = CygnusTrustedWebActivityScreenOrientation._internal(
    7,
    7,
  );

  ///  Portrait-primary is an orientation where the screen width is less than or equal to the
  ///  screen height. If the device's natural orientation is portrait, then it is in
  ///  portrait-primary when held in that position.
  static const PORTRAIT_PRIMARY =
      CygnusTrustedWebActivityScreenOrientation._internal(1, 1);

  /// Portrait-secondary is an orientation where the screen width is less than or equal to the
  /// screen height. If the device's natural orientation is portrait, then it is in
  /// portrait-secondary when rotated 180° from its natural position.
  static const PORTRAIT_SECONDARY =
      CygnusTrustedWebActivityScreenOrientation._internal(2, 2);

  ///Set of all values of [CygnusTrustedWebActivityScreenOrientation].
  static final Set<CygnusTrustedWebActivityScreenOrientation> values = [
    CygnusTrustedWebActivityScreenOrientation.ANY,
    CygnusTrustedWebActivityScreenOrientation.DEFAULT,
    CygnusTrustedWebActivityScreenOrientation.LANDSCAPE,
    CygnusTrustedWebActivityScreenOrientation.LANDSCAPE_PRIMARY,
    CygnusTrustedWebActivityScreenOrientation.LANDSCAPE_SECONDARY,
    CygnusTrustedWebActivityScreenOrientation.NATURAL,
    CygnusTrustedWebActivityScreenOrientation.PORTRAIT,
    CygnusTrustedWebActivityScreenOrientation.PORTRAIT_PRIMARY,
    CygnusTrustedWebActivityScreenOrientation.PORTRAIT_SECONDARY,
  ].toSet();

  ///Gets a possible [CygnusTrustedWebActivityScreenOrientation] instance from [int] value.
  static CygnusTrustedWebActivityScreenOrientation? fromValue(int? value) {
    if (value != null) {
      try {
        return CygnusTrustedWebActivityScreenOrientation.values.firstWhere(
          (element) => element.toValue() == value,
        );
      } catch (e) {
        return null;
      }
    }
    return null;
  }

  ///Gets a possible [CygnusTrustedWebActivityScreenOrientation] instance from a native value.
  static CygnusTrustedWebActivityScreenOrientation? fromNativeValue(
    int? value,
  ) {
    if (value != null) {
      try {
        return CygnusTrustedWebActivityScreenOrientation.values.firstWhere(
          (element) => element.toNativeValue() == value,
        );
      } catch (e) {
        return null;
      }
    }
    return null;
  }

  /// Gets a possible [CygnusTrustedWebActivityScreenOrientation] instance value with name [name].
  ///
  /// Goes through [CygnusTrustedWebActivityScreenOrientation.values] looking for a value with
  /// name [name], as reported by [CygnusTrustedWebActivityScreenOrientation.name].
  /// Returns the first value with the given name, otherwise `null`.
  static CygnusTrustedWebActivityScreenOrientation? byName(String? name) {
    if (name != null) {
      try {
        return CygnusTrustedWebActivityScreenOrientation.values.firstWhere(
          (element) => element.name() == name,
        );
      } catch (e) {
        return null;
      }
    }
    return null;
  }

  /// Creates a map from the names of [CygnusTrustedWebActivityScreenOrientation] values to the values.
  ///
  /// The collection that this method is called on is expected to have
  /// values with distinct names, like the `values` list of an enum class.
  /// Only one value for each name can occur in the created map,
  /// so if two or more values have the same name (either being the
  /// same value, or being values of different enum type), at most one of
  /// them will be represented in the returned map.
  static Map<String, CygnusTrustedWebActivityScreenOrientation> asNameMap() =>
      <String, CygnusTrustedWebActivityScreenOrientation>{
        for (final value in CygnusTrustedWebActivityScreenOrientation.values)
          value.name(): value,
      };

  ///Gets [int] value.
  int toValue() => _value;

  ///Gets [int] native value if supported by the current platform, otherwise `null`.
  int? toNativeValue() => _nativeValue;

  ///Gets the name of the value.
  String name() {
    switch (_value) {
      case 5:
        return 'ANY';
      case 0:
        return 'DEFAULT';
      case 6:
        return 'LANDSCAPE';
      case 3:
        return 'LANDSCAPE_PRIMARY';
      case 4:
        return 'LANDSCAPE_SECONDARY';
      case 8:
        return 'NATURAL';
      case 7:
        return 'PORTRAIT';
      case 1:
        return 'PORTRAIT_PRIMARY';
      case 2:
        return 'PORTRAIT_SECONDARY';
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
