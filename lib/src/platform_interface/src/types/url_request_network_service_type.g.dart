// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'url_request_network_service_type.dart';

// **************************************************************************
// ExchangeableEnumGenerator
// **************************************************************************

///Class that represents the constants that specify how a request uses network resources.
class CygnusURLRequestNetworkServiceType {
  final int _value;
  final int? _nativeValue;
  const CygnusURLRequestNetworkServiceType._internal(
    this._value,
    this._nativeValue,
  );
  // ignore: unused_element
  factory CygnusURLRequestNetworkServiceType._internalMultiPlatform(
    int value,
    Function nativeValue,
  ) => CygnusURLRequestNetworkServiceType._internal(value, nativeValue());

  ///A service type for streaming audio/video data.
  static const AV_STREAMING = CygnusURLRequestNetworkServiceType._internal(
    8,
    8,
  );

  ///A service type for background traffic.
  ///
  ///You should specify this type if your app is performing a download that was not requested by the user—for example,
  ///prefetching content so that it will be available when the user chooses to view it.
  static const BACKGROUND = CygnusURLRequestNetworkServiceType._internal(3, 3);

  ///A service type for call signaling.
  ///
  ///Use this service type with network traffic that establishes, maintains, or tears down a VoIP call.
  static const CALL_SIGNALING = CygnusURLRequestNetworkServiceType._internal(
    11,
    11,
  );

  ///A service type for standard network traffic.
  static const DEFAULT = CygnusURLRequestNetworkServiceType._internal(0, 0);

  ///A service type for responsive (time-sensitive) audio/video data.
  static const RESPONSIVE_AV = CygnusURLRequestNetworkServiceType._internal(
    9,
    9,
  );

  ///A service type for data that the user is actively waiting for.
  ///
  ///Use this service type for interactive situations where the user is anticipating a quick response, like instant messaging or completing a purchase.
  static const RESPONSIVE_DATA = CygnusURLRequestNetworkServiceType._internal(
    6,
    6,
  );

  ///A service type for video traffic.
  static const VIDEO = CygnusURLRequestNetworkServiceType._internal(2, 2);

  ///A service type for voice traffic.
  static const VOICE = CygnusURLRequestNetworkServiceType._internal(4, 4);

  ///Set of all values of [CygnusURLRequestNetworkServiceType].
  static final Set<CygnusURLRequestNetworkServiceType> values = [
    CygnusURLRequestNetworkServiceType.AV_STREAMING,
    CygnusURLRequestNetworkServiceType.BACKGROUND,
    CygnusURLRequestNetworkServiceType.CALL_SIGNALING,
    CygnusURLRequestNetworkServiceType.DEFAULT,
    CygnusURLRequestNetworkServiceType.RESPONSIVE_AV,
    CygnusURLRequestNetworkServiceType.RESPONSIVE_DATA,
    CygnusURLRequestNetworkServiceType.VIDEO,
    CygnusURLRequestNetworkServiceType.VOICE,
  ].toSet();

  ///Gets a possible [CygnusURLRequestNetworkServiceType] instance from [int] value.
  static CygnusURLRequestNetworkServiceType? fromValue(int? value) {
    if (value != null) {
      try {
        return CygnusURLRequestNetworkServiceType.values.firstWhere(
          (element) => element.toValue() == value,
        );
      } catch (e) {
        return null;
      }
    }
    return null;
  }

  ///Gets a possible [CygnusURLRequestNetworkServiceType] instance from a native value.
  static CygnusURLRequestNetworkServiceType? fromNativeValue(int? value) {
    if (value != null) {
      try {
        return CygnusURLRequestNetworkServiceType.values.firstWhere(
          (element) => element.toNativeValue() == value,
        );
      } catch (e) {
        return null;
      }
    }
    return null;
  }

  /// Gets a possible [CygnusURLRequestNetworkServiceType] instance value with name [name].
  ///
  /// Goes through [CygnusURLRequestNetworkServiceType.values] looking for a value with
  /// name [name], as reported by [CygnusURLRequestNetworkServiceType.name].
  /// Returns the first value with the given name, otherwise `null`.
  static CygnusURLRequestNetworkServiceType? byName(String? name) {
    if (name != null) {
      try {
        return CygnusURLRequestNetworkServiceType.values.firstWhere(
          (element) => element.name() == name,
        );
      } catch (e) {
        return null;
      }
    }
    return null;
  }

  /// Creates a map from the names of [CygnusURLRequestNetworkServiceType] values to the values.
  ///
  /// The collection that this method is called on is expected to have
  /// values with distinct names, like the `values` list of an enum class.
  /// Only one value for each name can occur in the created map,
  /// so if two or more values have the same name (either being the
  /// same value, or being values of different enum type), at most one of
  /// them will be represented in the returned map.
  static Map<String, CygnusURLRequestNetworkServiceType> asNameMap() =>
      <String, CygnusURLRequestNetworkServiceType>{
        for (final value in CygnusURLRequestNetworkServiceType.values)
          value.name(): value,
      };

  ///Gets [int] value.
  int toValue() => _value;

  ///Gets [int] native value if supported by the current platform, otherwise `null`.
  int? toNativeValue() => _nativeValue;

  ///Gets the name of the value.
  String name() {
    switch (_value) {
      case 8:
        return 'AV_STREAMING';
      case 3:
        return 'BACKGROUND';
      case 11:
        return 'CALL_SIGNALING';
      case 0:
        return 'DEFAULT';
      case 9:
        return 'RESPONSIVE_AV';
      case 6:
        return 'RESPONSIVE_DATA';
      case 2:
        return 'VIDEO';
      case 4:
        return 'VOICE';
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

///An iOS-specific Class that represents the constants that specify how a request uses network resources.
///Use [CygnusURLRequestNetworkServiceType] instead.
@Deprecated('Use CygnusURLRequestNetworkServiceType instead')
class CygnusIOSURLRequestNetworkServiceType {
  final int _value;
  final int? _nativeValue;
  const CygnusIOSURLRequestNetworkServiceType._internal(
    this._value,
    this._nativeValue,
  );
  // ignore: unused_element
  factory CygnusIOSURLRequestNetworkServiceType._internalMultiPlatform(
    int value,
    Function nativeValue,
  ) => CygnusIOSURLRequestNetworkServiceType._internal(value, nativeValue());

  ///A service type for streaming audio/video data.
  static const AV_STREAMING = CygnusIOSURLRequestNetworkServiceType._internal(
    8,
    8,
  );

  ///A service type for background traffic.
  ///
  ///You should specify this type if your app is performing a download that was not requested by the user—for example,
  ///prefetching content so that it will be available when the user chooses to view it.
  static const BACKGROUND = CygnusIOSURLRequestNetworkServiceType._internal(
    3,
    3,
  );

  ///A service type for call signaling.
  ///
  ///Use this service type with network traffic that establishes, maintains, or tears down a VoIP call.
  static const CALL_SIGNALING = CygnusIOSURLRequestNetworkServiceType._internal(
    11,
    11,
  );

  ///A service type for standard network traffic.
  static const DEFAULT = CygnusIOSURLRequestNetworkServiceType._internal(0, 0);

  ///A service type for responsive (time-sensitive) audio/video data.
  static const RESPONSIVE_AV = CygnusIOSURLRequestNetworkServiceType._internal(
    9,
    9,
  );

  ///A service type for data that the user is actively waiting for.
  ///
  ///Use this service type for interactive situations where the user is anticipating a quick response, like instant messaging or completing a purchase.
  static const RESPONSIVE_DATA =
      CygnusIOSURLRequestNetworkServiceType._internal(6, 6);

  ///A service type for video traffic.
  static const VIDEO = CygnusIOSURLRequestNetworkServiceType._internal(2, 2);

  ///A service type for voice traffic.
  static const VOICE = CygnusIOSURLRequestNetworkServiceType._internal(4, 4);

  ///Set of all values of [CygnusIOSURLRequestNetworkServiceType].
  static final Set<CygnusIOSURLRequestNetworkServiceType> values = [
    CygnusIOSURLRequestNetworkServiceType.AV_STREAMING,
    CygnusIOSURLRequestNetworkServiceType.BACKGROUND,
    CygnusIOSURLRequestNetworkServiceType.CALL_SIGNALING,
    CygnusIOSURLRequestNetworkServiceType.DEFAULT,
    CygnusIOSURLRequestNetworkServiceType.RESPONSIVE_AV,
    CygnusIOSURLRequestNetworkServiceType.RESPONSIVE_DATA,
    CygnusIOSURLRequestNetworkServiceType.VIDEO,
    CygnusIOSURLRequestNetworkServiceType.VOICE,
  ].toSet();

  ///Gets a possible [CygnusIOSURLRequestNetworkServiceType] instance from [int] value.
  static CygnusIOSURLRequestNetworkServiceType? fromValue(int? value) {
    if (value != null) {
      try {
        return CygnusIOSURLRequestNetworkServiceType.values.firstWhere(
          (element) => element.toValue() == value,
        );
      } catch (e) {
        return null;
      }
    }
    return null;
  }

  ///Gets a possible [CygnusIOSURLRequestNetworkServiceType] instance from a native value.
  static CygnusIOSURLRequestNetworkServiceType? fromNativeValue(int? value) {
    if (value != null) {
      try {
        return CygnusIOSURLRequestNetworkServiceType.values.firstWhere(
          (element) => element.toNativeValue() == value,
        );
      } catch (e) {
        return null;
      }
    }
    return null;
  }

  /// Gets a possible [CygnusIOSURLRequestNetworkServiceType] instance value with name [name].
  ///
  /// Goes through [CygnusIOSURLRequestNetworkServiceType.values] looking for a value with
  /// name [name], as reported by [CygnusIOSURLRequestNetworkServiceType.name].
  /// Returns the first value with the given name, otherwise `null`.
  static CygnusIOSURLRequestNetworkServiceType? byName(String? name) {
    if (name != null) {
      try {
        return CygnusIOSURLRequestNetworkServiceType.values.firstWhere(
          (element) => element.name() == name,
        );
      } catch (e) {
        return null;
      }
    }
    return null;
  }

  /// Creates a map from the names of [CygnusIOSURLRequestNetworkServiceType] values to the values.
  ///
  /// The collection that this method is called on is expected to have
  /// values with distinct names, like the `values` list of an enum class.
  /// Only one value for each name can occur in the created map,
  /// so if two or more values have the same name (either being the
  /// same value, or being values of different enum type), at most one of
  /// them will be represented in the returned map.
  static Map<String, CygnusIOSURLRequestNetworkServiceType> asNameMap() =>
      <String, CygnusIOSURLRequestNetworkServiceType>{
        for (final value in CygnusIOSURLRequestNetworkServiceType.values)
          value.name(): value,
      };

  ///Gets [int] value.
  int toValue() => _value;

  ///Gets [int] native value if supported by the current platform, otherwise `null`.
  int? toNativeValue() => _nativeValue;

  ///Gets the name of the value.
  String name() {
    switch (_value) {
      case 8:
        return 'AV_STREAMING';
      case 3:
        return 'BACKGROUND';
      case 11:
        return 'CALL_SIGNALING';
      case 0:
        return 'DEFAULT';
      case 9:
        return 'RESPONSIVE_AV';
      case 6:
        return 'RESPONSIVE_DATA';
      case 2:
        return 'VIDEO';
      case 4:
        return 'VOICE';
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
