// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'content_blocker_trigger_load_type.dart';

// **************************************************************************
// ExchangeableEnumGenerator
// **************************************************************************

///Class that represents the possible load type for a [CygnusContentBlockerTrigger].
class CygnusContentBlockerTriggerLoadType {
  final String _value;
  final String? _nativeValue;
  const CygnusContentBlockerTriggerLoadType._internal(
    this._value,
    this._nativeValue,
  );
  // ignore: unused_element
  factory CygnusContentBlockerTriggerLoadType._internalMultiPlatform(
    String value,
    Function nativeValue,
  ) => CygnusContentBlockerTriggerLoadType._internal(value, nativeValue());

  ///FIRST_PARTY is triggered only if the resource has the same scheme, domain, and port as the main page resource.
  static const FIRST_PARTY = CygnusContentBlockerTriggerLoadType._internal(
    'first-party',
    'first-party',
  );

  ///THIRD_PARTY is triggered if the resource is not from the same domain as the main page resource.
  static const THIRD_PARTY = CygnusContentBlockerTriggerLoadType._internal(
    'third-party',
    'third-party',
  );

  ///Set of all values of [CygnusContentBlockerTriggerLoadType].
  static final Set<CygnusContentBlockerTriggerLoadType> values = [
    CygnusContentBlockerTriggerLoadType.FIRST_PARTY,
    CygnusContentBlockerTriggerLoadType.THIRD_PARTY,
  ].toSet();

  ///Gets a possible [CygnusContentBlockerTriggerLoadType] instance from [String] value.
  static CygnusContentBlockerTriggerLoadType? fromValue(String? value) {
    if (value != null) {
      try {
        return CygnusContentBlockerTriggerLoadType.values.firstWhere(
          (element) => element.toValue() == value,
        );
      } catch (e) {
        return null;
      }
    }
    return null;
  }

  ///Gets a possible [CygnusContentBlockerTriggerLoadType] instance from a native value.
  static CygnusContentBlockerTriggerLoadType? fromNativeValue(String? value) {
    if (value != null) {
      try {
        return CygnusContentBlockerTriggerLoadType.values.firstWhere(
          (element) => element.toNativeValue() == value,
        );
      } catch (e) {
        return null;
      }
    }
    return null;
  }

  /// Gets a possible [CygnusContentBlockerTriggerLoadType] instance value with name [name].
  ///
  /// Goes through [CygnusContentBlockerTriggerLoadType.values] looking for a value with
  /// name [name], as reported by [CygnusContentBlockerTriggerLoadType.name].
  /// Returns the first value with the given name, otherwise `null`.
  static CygnusContentBlockerTriggerLoadType? byName(String? name) {
    if (name != null) {
      try {
        return CygnusContentBlockerTriggerLoadType.values.firstWhere(
          (element) => element.name() == name,
        );
      } catch (e) {
        return null;
      }
    }
    return null;
  }

  /// Creates a map from the names of [CygnusContentBlockerTriggerLoadType] values to the values.
  ///
  /// The collection that this method is called on is expected to have
  /// values with distinct names, like the `values` list of an enum class.
  /// Only one value for each name can occur in the created map,
  /// so if two or more values have the same name (either being the
  /// same value, or being values of different enum type), at most one of
  /// them will be represented in the returned map.
  static Map<String, CygnusContentBlockerTriggerLoadType> asNameMap() =>
      <String, CygnusContentBlockerTriggerLoadType>{
        for (final value in CygnusContentBlockerTriggerLoadType.values)
          value.name(): value,
      };

  ///Gets [String] value.
  String toValue() => _value;

  ///Gets [String] native value if supported by the current platform, otherwise `null`.
  String? toNativeValue() => _nativeValue;

  ///Gets the name of the value.
  String name() {
    switch (_value) {
      case 'first-party':
        return 'FIRST_PARTY';
      case 'third-party':
        return 'THIRD_PARTY';
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
