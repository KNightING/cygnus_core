// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data_detector_types.dart';

// **************************************************************************
// ExchangeableEnumGenerator
// **************************************************************************

///Class used to specify a `dataDetectoryTypes` value that adds interactivity to web content that matches the value.
class CygnusDataDetectorTypes {
  final String _value;
  final String? _nativeValue;
  const CygnusDataDetectorTypes._internal(this._value, this._nativeValue);
  // ignore: unused_element
  factory CygnusDataDetectorTypes._internalMultiPlatform(
    String value,
    Function nativeValue,
  ) => CygnusDataDetectorTypes._internal(value, nativeValue());

  ///Addresses are detected and turned into links.
  static const ADDRESS = CygnusDataDetectorTypes._internal(
    'ADDRESS',
    'ADDRESS',
  );

  ///All of the above data types are turned into links when detected. Choosing this value will automatically include any new detection type that is added.
  static const ALL = CygnusDataDetectorTypes._internal('ALL', 'ALL');

  ///Dates and times that are in the future are detected and turned into links.
  static const CALENDAR_EVENT = CygnusDataDetectorTypes._internal(
    'CALENDAR_EVENT',
    'CALENDAR_EVENT',
  );

  ///Flight numbers are detected and turned into links.
  static const FLIGHT_NUMBER = CygnusDataDetectorTypes._internal(
    'FLIGHT_NUMBER',
    'FLIGHT_NUMBER',
  );

  ///URLs in text are detected and turned into links.
  static const LINK = CygnusDataDetectorTypes._internal('LINK', 'LINK');

  ///Lookup suggestions are detected and turned into links.
  static const LOOKUP_SUGGESTION = CygnusDataDetectorTypes._internal(
    'LOOKUP_SUGGESTION',
    'LOOKUP_SUGGESTION',
  );

  ///No detection is performed.
  static const NONE = CygnusDataDetectorTypes._internal('NONE', 'NONE');

  ///Phone numbers are detected and turned into links.
  static const PHONE_NUMBER = CygnusDataDetectorTypes._internal(
    'PHONE_NUMBER',
    'PHONE_NUMBER',
  );

  ///Spotlight suggestions are detected and turned into links.
  static const SPOTLIGHT_SUGGESTION = CygnusDataDetectorTypes._internal(
    'SPOTLIGHT_SUGGESTION',
    'SPOTLIGHT_SUGGESTION',
  );

  ///Tracking numbers are detected and turned into links.
  static const TRACKING_NUMBER = CygnusDataDetectorTypes._internal(
    'TRACKING_NUMBER',
    'TRACKING_NUMBER',
  );

  ///Set of all values of [CygnusDataDetectorTypes].
  static final Set<CygnusDataDetectorTypes> values = [
    CygnusDataDetectorTypes.ADDRESS,
    CygnusDataDetectorTypes.ALL,
    CygnusDataDetectorTypes.CALENDAR_EVENT,
    CygnusDataDetectorTypes.FLIGHT_NUMBER,
    CygnusDataDetectorTypes.LINK,
    CygnusDataDetectorTypes.LOOKUP_SUGGESTION,
    CygnusDataDetectorTypes.NONE,
    CygnusDataDetectorTypes.PHONE_NUMBER,
    CygnusDataDetectorTypes.SPOTLIGHT_SUGGESTION,
    CygnusDataDetectorTypes.TRACKING_NUMBER,
  ].toSet();

  ///Gets a possible [CygnusDataDetectorTypes] instance from [String] value.
  static CygnusDataDetectorTypes? fromValue(String? value) {
    if (value != null) {
      try {
        return CygnusDataDetectorTypes.values.firstWhere(
          (element) => element.toValue() == value,
        );
      } catch (e) {
        return null;
      }
    }
    return null;
  }

  ///Gets a possible [CygnusDataDetectorTypes] instance from a native value.
  static CygnusDataDetectorTypes? fromNativeValue(String? value) {
    if (value != null) {
      try {
        return CygnusDataDetectorTypes.values.firstWhere(
          (element) => element.toNativeValue() == value,
        );
      } catch (e) {
        return null;
      }
    }
    return null;
  }

  /// Gets a possible [CygnusDataDetectorTypes] instance value with name [name].
  ///
  /// Goes through [CygnusDataDetectorTypes.values] looking for a value with
  /// name [name], as reported by [CygnusDataDetectorTypes.name].
  /// Returns the first value with the given name, otherwise `null`.
  static CygnusDataDetectorTypes? byName(String? name) {
    if (name != null) {
      try {
        return CygnusDataDetectorTypes.values.firstWhere(
          (element) => element.name() == name,
        );
      } catch (e) {
        return null;
      }
    }
    return null;
  }

  /// Creates a map from the names of [CygnusDataDetectorTypes] values to the values.
  ///
  /// The collection that this method is called on is expected to have
  /// values with distinct names, like the `values` list of an enum class.
  /// Only one value for each name can occur in the created map,
  /// so if two or more values have the same name (either being the
  /// same value, or being values of different enum type), at most one of
  /// them will be represented in the returned map.
  static Map<String, CygnusDataDetectorTypes> asNameMap() =>
      <String, CygnusDataDetectorTypes>{
        for (final value in CygnusDataDetectorTypes.values) value.name(): value,
      };

  ///Gets [String] value.
  String toValue() => _value;

  ///Gets [String] native value if supported by the current platform, otherwise `null`.
  String? toNativeValue() => _nativeValue;

  ///Gets the name of the value.
  String name() {
    switch (_value) {
      case 'ADDRESS':
        return 'ADDRESS';
      case 'ALL':
        return 'ALL';
      case 'CALENDAR_EVENT':
        return 'CALENDAR_EVENT';
      case 'FLIGHT_NUMBER':
        return 'FLIGHT_NUMBER';
      case 'LINK':
        return 'LINK';
      case 'LOOKUP_SUGGESTION':
        return 'LOOKUP_SUGGESTION';
      case 'NONE':
        return 'NONE';
      case 'PHONE_NUMBER':
        return 'PHONE_NUMBER';
      case 'SPOTLIGHT_SUGGESTION':
        return 'SPOTLIGHT_SUGGESTION';
      case 'TRACKING_NUMBER':
        return 'TRACKING_NUMBER';
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
    return _value;
  }
}

///An iOS-specific class used to specify a `dataDetectoryTypes` value that adds interactivity to web content that matches the value.
///
///**NOTE**: available on iOS 10.0+.
///
///Use [CygnusDataDetectorTypes] instead.
@Deprecated('Use CygnusDataDetectorTypes instead')
class CygnusIOSWKDataDetectorTypes {
  final String _value;
  final String? _nativeValue;
  const CygnusIOSWKDataDetectorTypes._internal(this._value, this._nativeValue);
  // ignore: unused_element
  factory CygnusIOSWKDataDetectorTypes._internalMultiPlatform(
    String value,
    Function nativeValue,
  ) => CygnusIOSWKDataDetectorTypes._internal(value, nativeValue());

  ///Addresses are detected and turned into links.
  static const ADDRESS = CygnusIOSWKDataDetectorTypes._internal(
    'ADDRESS',
    'ADDRESS',
  );

  ///All of the above data types are turned into links when detected. Choosing this value will automatically include any new detection type that is added.
  static const ALL = CygnusIOSWKDataDetectorTypes._internal('ALL', 'ALL');

  ///Dates and times that are in the future are detected and turned into links.
  static const CALENDAR_EVENT = CygnusIOSWKDataDetectorTypes._internal(
    'CALENDAR_EVENT',
    'CALENDAR_EVENT',
  );

  ///Flight numbers are detected and turned into links.
  static const FLIGHT_NUMBER = CygnusIOSWKDataDetectorTypes._internal(
    'FLIGHT_NUMBER',
    'FLIGHT_NUMBER',
  );

  ///URLs in text are detected and turned into links.
  static const LINK = CygnusIOSWKDataDetectorTypes._internal('LINK', 'LINK');

  ///Lookup suggestions are detected and turned into links.
  static const LOOKUP_SUGGESTION = CygnusIOSWKDataDetectorTypes._internal(
    'LOOKUP_SUGGESTION',
    'LOOKUP_SUGGESTION',
  );

  ///No detection is performed.
  static const NONE = CygnusIOSWKDataDetectorTypes._internal('NONE', 'NONE');

  ///Phone numbers are detected and turned into links.
  static const PHONE_NUMBER = CygnusIOSWKDataDetectorTypes._internal(
    'PHONE_NUMBER',
    'PHONE_NUMBER',
  );

  ///Spotlight suggestions are detected and turned into links.
  static const SPOTLIGHT_SUGGESTION = CygnusIOSWKDataDetectorTypes._internal(
    'SPOTLIGHT_SUGGESTION',
    'SPOTLIGHT_SUGGESTION',
  );

  ///Tracking numbers are detected and turned into links.
  static const TRACKING_NUMBER = CygnusIOSWKDataDetectorTypes._internal(
    'TRACKING_NUMBER',
    'TRACKING_NUMBER',
  );

  ///Set of all values of [CygnusIOSWKDataDetectorTypes].
  static final Set<CygnusIOSWKDataDetectorTypes> values = [
    CygnusIOSWKDataDetectorTypes.ADDRESS,
    CygnusIOSWKDataDetectorTypes.ALL,
    CygnusIOSWKDataDetectorTypes.CALENDAR_EVENT,
    CygnusIOSWKDataDetectorTypes.FLIGHT_NUMBER,
    CygnusIOSWKDataDetectorTypes.LINK,
    CygnusIOSWKDataDetectorTypes.LOOKUP_SUGGESTION,
    CygnusIOSWKDataDetectorTypes.NONE,
    CygnusIOSWKDataDetectorTypes.PHONE_NUMBER,
    CygnusIOSWKDataDetectorTypes.SPOTLIGHT_SUGGESTION,
    CygnusIOSWKDataDetectorTypes.TRACKING_NUMBER,
  ].toSet();

  ///Gets a possible [CygnusIOSWKDataDetectorTypes] instance from [String] value.
  static CygnusIOSWKDataDetectorTypes? fromValue(String? value) {
    if (value != null) {
      try {
        return CygnusIOSWKDataDetectorTypes.values.firstWhere(
          (element) => element.toValue() == value,
        );
      } catch (e) {
        return null;
      }
    }
    return null;
  }

  ///Gets a possible [CygnusIOSWKDataDetectorTypes] instance from a native value.
  static CygnusIOSWKDataDetectorTypes? fromNativeValue(String? value) {
    if (value != null) {
      try {
        return CygnusIOSWKDataDetectorTypes.values.firstWhere(
          (element) => element.toNativeValue() == value,
        );
      } catch (e) {
        return null;
      }
    }
    return null;
  }

  /// Gets a possible [CygnusIOSWKDataDetectorTypes] instance value with name [name].
  ///
  /// Goes through [CygnusIOSWKDataDetectorTypes.values] looking for a value with
  /// name [name], as reported by [CygnusIOSWKDataDetectorTypes.name].
  /// Returns the first value with the given name, otherwise `null`.
  static CygnusIOSWKDataDetectorTypes? byName(String? name) {
    if (name != null) {
      try {
        return CygnusIOSWKDataDetectorTypes.values.firstWhere(
          (element) => element.name() == name,
        );
      } catch (e) {
        return null;
      }
    }
    return null;
  }

  /// Creates a map from the names of [CygnusIOSWKDataDetectorTypes] values to the values.
  ///
  /// The collection that this method is called on is expected to have
  /// values with distinct names, like the `values` list of an enum class.
  /// Only one value for each name can occur in the created map,
  /// so if two or more values have the same name (either being the
  /// same value, or being values of different enum type), at most one of
  /// them will be represented in the returned map.
  static Map<String, CygnusIOSWKDataDetectorTypes> asNameMap() =>
      <String, CygnusIOSWKDataDetectorTypes>{
        for (final value in CygnusIOSWKDataDetectorTypes.values)
          value.name(): value,
      };

  ///Gets [String] value.
  String toValue() => _value;

  ///Gets [String] native value if supported by the current platform, otherwise `null`.
  String? toNativeValue() => _nativeValue;

  ///Gets the name of the value.
  String name() {
    switch (_value) {
      case 'ADDRESS':
        return 'ADDRESS';
      case 'ALL':
        return 'ALL';
      case 'CALENDAR_EVENT':
        return 'CALENDAR_EVENT';
      case 'FLIGHT_NUMBER':
        return 'FLIGHT_NUMBER';
      case 'LINK':
        return 'LINK';
      case 'LOOKUP_SUGGESTION':
        return 'LOOKUP_SUGGESTION';
      case 'NONE':
        return 'NONE';
      case 'PHONE_NUMBER':
        return 'PHONE_NUMBER';
      case 'SPOTLIGHT_SUGGESTION':
        return 'SPOTLIGHT_SUGGESTION';
      case 'TRACKING_NUMBER':
        return 'TRACKING_NUMBER';
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
    return _value;
  }
}
