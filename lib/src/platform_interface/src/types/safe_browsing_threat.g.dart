// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'safe_browsing_threat.dart';

// **************************************************************************
// ExchangeableEnumGenerator
// **************************************************************************

///Class that represents the reason the resource was caught by Safe Browsing.
class CygnusSafeBrowsingThreat {
  final int _value;
  final int? _nativeValue;
  const CygnusSafeBrowsingThreat._internal(this._value, this._nativeValue);
  // ignore: unused_element
  factory CygnusSafeBrowsingThreat._internalMultiPlatform(
    int value,
    Function nativeValue,
  ) => CygnusSafeBrowsingThreat._internal(value, nativeValue());

  ///The resource was blocked because it may trick the user into a billing agreement.
  ///
  ///This constant is only used when `targetSdkVersion` is at least Android 29.
  ///Otherwise, [SAFE_BROWSING_THREAT_UNKNOWN] is used instead.
  static const SAFE_BROWSING_THREAT_BILLING =
      CygnusSafeBrowsingThreat._internal(4, 4);

  ///The resource was blocked because it contains malware.
  static const SAFE_BROWSING_THREAT_MALWARE =
      CygnusSafeBrowsingThreat._internal(1, 1);

  ///The resource was blocked because it contains deceptive content.
  static const SAFE_BROWSING_THREAT_PHISHING =
      CygnusSafeBrowsingThreat._internal(2, 2);

  ///The resource was blocked for an unknown reason.
  static const SAFE_BROWSING_THREAT_UNKNOWN =
      CygnusSafeBrowsingThreat._internal(0, 0);

  ///The resource was blocked because it contains unwanted software.
  static const SAFE_BROWSING_THREAT_UNWANTED_SOFTWARE =
      CygnusSafeBrowsingThreat._internal(3, 3);

  ///Set of all values of [CygnusSafeBrowsingThreat].
  static final Set<CygnusSafeBrowsingThreat> values = [
    CygnusSafeBrowsingThreat.SAFE_BROWSING_THREAT_BILLING,
    CygnusSafeBrowsingThreat.SAFE_BROWSING_THREAT_MALWARE,
    CygnusSafeBrowsingThreat.SAFE_BROWSING_THREAT_PHISHING,
    CygnusSafeBrowsingThreat.SAFE_BROWSING_THREAT_UNKNOWN,
    CygnusSafeBrowsingThreat.SAFE_BROWSING_THREAT_UNWANTED_SOFTWARE,
  ].toSet();

  ///Gets a possible [CygnusSafeBrowsingThreat] instance from [int] value.
  static CygnusSafeBrowsingThreat? fromValue(int? value) {
    if (value != null) {
      try {
        return CygnusSafeBrowsingThreat.values.firstWhere(
          (element) => element.toValue() == value,
        );
      } catch (e) {
        return null;
      }
    }
    return null;
  }

  ///Gets a possible [CygnusSafeBrowsingThreat] instance from a native value.
  static CygnusSafeBrowsingThreat? fromNativeValue(int? value) {
    if (value != null) {
      try {
        return CygnusSafeBrowsingThreat.values.firstWhere(
          (element) => element.toNativeValue() == value,
        );
      } catch (e) {
        return null;
      }
    }
    return null;
  }

  /// Gets a possible [CygnusSafeBrowsingThreat] instance value with name [name].
  ///
  /// Goes through [CygnusSafeBrowsingThreat.values] looking for a value with
  /// name [name], as reported by [CygnusSafeBrowsingThreat.name].
  /// Returns the first value with the given name, otherwise `null`.
  static CygnusSafeBrowsingThreat? byName(String? name) {
    if (name != null) {
      try {
        return CygnusSafeBrowsingThreat.values.firstWhere(
          (element) => element.name() == name,
        );
      } catch (e) {
        return null;
      }
    }
    return null;
  }

  /// Creates a map from the names of [CygnusSafeBrowsingThreat] values to the values.
  ///
  /// The collection that this method is called on is expected to have
  /// values with distinct names, like the `values` list of an enum class.
  /// Only one value for each name can occur in the created map,
  /// so if two or more values have the same name (either being the
  /// same value, or being values of different enum type), at most one of
  /// them will be represented in the returned map.
  static Map<String, CygnusSafeBrowsingThreat> asNameMap() =>
      <String, CygnusSafeBrowsingThreat>{
        for (final value in CygnusSafeBrowsingThreat.values)
          value.name(): value,
      };

  ///Gets [int] value.
  int toValue() => _value;

  ///Gets [int] native value if supported by the current platform, otherwise `null`.
  int? toNativeValue() => _nativeValue;

  ///Gets the name of the value.
  String name() {
    switch (_value) {
      case 4:
        return 'SAFE_BROWSING_THREAT_BILLING';
      case 1:
        return 'SAFE_BROWSING_THREAT_MALWARE';
      case 2:
        return 'SAFE_BROWSING_THREAT_PHISHING';
      case 0:
        return 'SAFE_BROWSING_THREAT_UNKNOWN';
      case 3:
        return 'SAFE_BROWSING_THREAT_UNWANTED_SOFTWARE';
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
