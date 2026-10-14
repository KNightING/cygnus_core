// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'print_job_output_type.dart';

// **************************************************************************
// ExchangeableEnumGenerator
// **************************************************************************

///Class representing the kind of printable content of a [CygnusPlatformPrintJobController].
class CygnusPrintJobOutputType {
  final int _value;
  final int? _nativeValue;
  const CygnusPrintJobOutputType._internal(this._value, this._nativeValue);
  // ignore: unused_element
  factory CygnusPrintJobOutputType._internalMultiPlatform(
    int value,
    Function nativeValue,
  ) => CygnusPrintJobOutputType._internal(value, nativeValue());

  ///Specifies that the printed content consists of mixed text, graphics, and images.
  ///The default paper is Letter, A4, or similar locale-specific designation.
  ///Output is normal quality, duplex.
  static const GENERAL = CygnusPrintJobOutputType._internal(0, 0);

  ///Specifies that the printed content is grayscale.
  ///Set the output type to this value when your printable content contains no color—for example, it’s black text only.
  ///The default paper is Letter/A4. Output is grayscale quality, duplex.
  ///This content type can produce a performance improvement in some cases.
  static const GRAYSCALE = CygnusPrintJobOutputType._internal(2, 2);

  ///Specifies that the printed content consists of black-and-white or color images.
  ///The default paper is 4x6, A6, or similar locale-specific designation.
  ///Output is high quality, simplex.
  static const PHOTO = CygnusPrintJobOutputType._internal(1, 1);

  ///Specifies that the printed content is a grayscale image.
  ///Set the output type to this value when your printable content contains no color—for example, it’s black text only.
  ///The default paper is Letter/A4.
  ///Output is high quality grayscale, duplex.
  static const PHOTO_GRAYSCALE = CygnusPrintJobOutputType._internal(3, 3);

  ///Set of all values of [CygnusPrintJobOutputType].
  static final Set<CygnusPrintJobOutputType> values = [
    CygnusPrintJobOutputType.GENERAL,
    CygnusPrintJobOutputType.GRAYSCALE,
    CygnusPrintJobOutputType.PHOTO,
    CygnusPrintJobOutputType.PHOTO_GRAYSCALE,
  ].toSet();

  ///Gets a possible [CygnusPrintJobOutputType] instance from [int] value.
  static CygnusPrintJobOutputType? fromValue(int? value) {
    if (value != null) {
      try {
        return CygnusPrintJobOutputType.values.firstWhere(
          (element) => element.toValue() == value,
        );
      } catch (e) {
        return null;
      }
    }
    return null;
  }

  ///Gets a possible [CygnusPrintJobOutputType] instance from a native value.
  static CygnusPrintJobOutputType? fromNativeValue(int? value) {
    if (value != null) {
      try {
        return CygnusPrintJobOutputType.values.firstWhere(
          (element) => element.toNativeValue() == value,
        );
      } catch (e) {
        return null;
      }
    }
    return null;
  }

  /// Gets a possible [CygnusPrintJobOutputType] instance value with name [name].
  ///
  /// Goes through [CygnusPrintJobOutputType.values] looking for a value with
  /// name [name], as reported by [CygnusPrintJobOutputType.name].
  /// Returns the first value with the given name, otherwise `null`.
  static CygnusPrintJobOutputType? byName(String? name) {
    if (name != null) {
      try {
        return CygnusPrintJobOutputType.values.firstWhere(
          (element) => element.name() == name,
        );
      } catch (e) {
        return null;
      }
    }
    return null;
  }

  /// Creates a map from the names of [CygnusPrintJobOutputType] values to the values.
  ///
  /// The collection that this method is called on is expected to have
  /// values with distinct names, like the `values` list of an enum class.
  /// Only one value for each name can occur in the created map,
  /// so if two or more values have the same name (either being the
  /// same value, or being values of different enum type), at most one of
  /// them will be represented in the returned map.
  static Map<String, CygnusPrintJobOutputType> asNameMap() =>
      <String, CygnusPrintJobOutputType>{
        for (final value in CygnusPrintJobOutputType.values)
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
        return 'GENERAL';
      case 2:
        return 'GRAYSCALE';
      case 1:
        return 'PHOTO';
      case 3:
        return 'PHOTO_GRAYSCALE';
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
