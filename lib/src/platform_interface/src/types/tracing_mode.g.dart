// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tracing_mode.dart';

// **************************************************************************
// ExchangeableEnumGenerator
// **************************************************************************

///Constants that describe the results summary the find panel UI includes.
class CygnusTracingMode {
  final int _value;
  final int? _nativeValue;
  const CygnusTracingMode._internal(this._value, this._nativeValue);
  // ignore: unused_element
  factory CygnusTracingMode._internalMultiPlatform(
    int value,
    Function nativeValue,
  ) => CygnusTracingMode._internal(value, nativeValue());

  ///Record trace events continuously using an internal ring buffer.
  ///Default tracing mode.
  ///Overwrites old events if they exceed buffer capacity.
  ///Uses less memory than the [RECORD_UNTIL_FULL] mode.
  ///Depending on the implementation typically allows up to 64k events to be stored.
  static const RECORD_CONTINUOUSLY = CygnusTracingMode._internal(1, 1);

  ///Record trace events until the internal tracing buffer is full.
  ///Typically the buffer memory usage is larger than [RECORD_CONTINUOUSLY].
  ///Depending on the implementation typically allows up to 256k events to be stored.
  static const RECORD_UNTIL_FULL = CygnusTracingMode._internal(0, 0);

  ///Set of all values of [CygnusTracingMode].
  static final Set<CygnusTracingMode> values = [
    CygnusTracingMode.RECORD_CONTINUOUSLY,
    CygnusTracingMode.RECORD_UNTIL_FULL,
  ].toSet();

  ///Gets a possible [CygnusTracingMode] instance from [int] value.
  static CygnusTracingMode? fromValue(int? value) {
    if (value != null) {
      try {
        return CygnusTracingMode.values.firstWhere(
          (element) => element.toValue() == value,
        );
      } catch (e) {
        return null;
      }
    }
    return null;
  }

  ///Gets a possible [CygnusTracingMode] instance from a native value.
  static CygnusTracingMode? fromNativeValue(int? value) {
    if (value != null) {
      try {
        return CygnusTracingMode.values.firstWhere(
          (element) => element.toNativeValue() == value,
        );
      } catch (e) {
        return null;
      }
    }
    return null;
  }

  /// Gets a possible [CygnusTracingMode] instance value with name [name].
  ///
  /// Goes through [CygnusTracingMode.values] looking for a value with
  /// name [name], as reported by [CygnusTracingMode.name].
  /// Returns the first value with the given name, otherwise `null`.
  static CygnusTracingMode? byName(String? name) {
    if (name != null) {
      try {
        return CygnusTracingMode.values.firstWhere(
          (element) => element.name() == name,
        );
      } catch (e) {
        return null;
      }
    }
    return null;
  }

  /// Creates a map from the names of [CygnusTracingMode] values to the values.
  ///
  /// The collection that this method is called on is expected to have
  /// values with distinct names, like the `values` list of an enum class.
  /// Only one value for each name can occur in the created map,
  /// so if two or more values have the same name (either being the
  /// same value, or being values of different enum type), at most one of
  /// them will be represented in the returned map.
  static Map<String, CygnusTracingMode> asNameMap() =>
      <String, CygnusTracingMode>{
        for (final value in CygnusTracingMode.values) value.name(): value,
      };

  ///Gets [int] value.
  int toValue() => _value;

  ///Gets [int] native value if supported by the current platform, otherwise `null`.
  int? toNativeValue() => _nativeValue;

  ///Gets the name of the value.
  String name() {
    switch (_value) {
      case 1:
        return 'RECORD_CONTINUOUSLY';
      case 0:
        return 'RECORD_UNTIL_FULL';
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
