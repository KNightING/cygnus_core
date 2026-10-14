// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'content_blocker_trigger_load_context.dart';

// **************************************************************************
// ExchangeableEnumGenerator
// **************************************************************************

///Class that represents the kind of load context that can be used with a [CygnusContentBlockerTrigger].
class CygnusContentBlockerTriggerLoadContext {
  final String _value;
  final String? _nativeValue;
  const CygnusContentBlockerTriggerLoadContext._internal(
    this._value,
    this._nativeValue,
  );
  // ignore: unused_element
  factory CygnusContentBlockerTriggerLoadContext._internalMultiPlatform(
    String value,
    Function nativeValue,
  ) => CygnusContentBlockerTriggerLoadContext._internal(value, nativeValue());

  ///Child frame load context
  static const CHILD_FRAME = CygnusContentBlockerTriggerLoadContext._internal(
    'child-frame',
    'child-frame',
  );

  ///Top frame load context
  static const TOP_FRAME = CygnusContentBlockerTriggerLoadContext._internal(
    'top-frame',
    'top-frame',
  );

  ///Set of all values of [CygnusContentBlockerTriggerLoadContext].
  static final Set<CygnusContentBlockerTriggerLoadContext> values = [
    CygnusContentBlockerTriggerLoadContext.CHILD_FRAME,
    CygnusContentBlockerTriggerLoadContext.TOP_FRAME,
  ].toSet();

  ///Gets a possible [CygnusContentBlockerTriggerLoadContext] instance from [String] value.
  static CygnusContentBlockerTriggerLoadContext? fromValue(String? value) {
    if (value != null) {
      try {
        return CygnusContentBlockerTriggerLoadContext.values.firstWhere(
          (element) => element.toValue() == value,
        );
      } catch (e) {
        return null;
      }
    }
    return null;
  }

  ///Gets a possible [CygnusContentBlockerTriggerLoadContext] instance from a native value.
  static CygnusContentBlockerTriggerLoadContext? fromNativeValue(
    String? value,
  ) {
    if (value != null) {
      try {
        return CygnusContentBlockerTriggerLoadContext.values.firstWhere(
          (element) => element.toNativeValue() == value,
        );
      } catch (e) {
        return null;
      }
    }
    return null;
  }

  /// Gets a possible [CygnusContentBlockerTriggerLoadContext] instance value with name [name].
  ///
  /// Goes through [CygnusContentBlockerTriggerLoadContext.values] looking for a value with
  /// name [name], as reported by [CygnusContentBlockerTriggerLoadContext.name].
  /// Returns the first value with the given name, otherwise `null`.
  static CygnusContentBlockerTriggerLoadContext? byName(String? name) {
    if (name != null) {
      try {
        return CygnusContentBlockerTriggerLoadContext.values.firstWhere(
          (element) => element.name() == name,
        );
      } catch (e) {
        return null;
      }
    }
    return null;
  }

  /// Creates a map from the names of [CygnusContentBlockerTriggerLoadContext] values to the values.
  ///
  /// The collection that this method is called on is expected to have
  /// values with distinct names, like the `values` list of an enum class.
  /// Only one value for each name can occur in the created map,
  /// so if two or more values have the same name (either being the
  /// same value, or being values of different enum type), at most one of
  /// them will be represented in the returned map.
  static Map<String, CygnusContentBlockerTriggerLoadContext> asNameMap() =>
      <String, CygnusContentBlockerTriggerLoadContext>{
        for (final value in CygnusContentBlockerTriggerLoadContext.values)
          value.name(): value,
      };

  ///Gets [String] value.
  String toValue() => _value;

  ///Gets [String] native value if supported by the current platform, otherwise `null`.
  String? toNativeValue() => _nativeValue;

  ///Gets the name of the value.
  String name() {
    switch (_value) {
      case 'child-frame':
        return 'CHILD_FRAME';
      case 'top-frame':
        return 'TOP_FRAME';
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
