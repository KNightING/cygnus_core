// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'console_message_level.dart';

// **************************************************************************
// ExchangeableEnumGenerator
// **************************************************************************

///Class representing the level of a console message.
class CygnusConsoleMessageLevel {
  final int _value;
  final int? _nativeValue;
  const CygnusConsoleMessageLevel._internal(this._value, this._nativeValue);
  // ignore: unused_element
  factory CygnusConsoleMessageLevel._internalMultiPlatform(
    int value,
    Function nativeValue,
  ) => CygnusConsoleMessageLevel._internal(value, nativeValue());

  ///Console DEBUG level
  static const DEBUG = CygnusConsoleMessageLevel._internal(4, 4);

  ///Console ERROR level
  static const ERROR = CygnusConsoleMessageLevel._internal(3, 3);

  ///Console LOG level
  static const LOG = CygnusConsoleMessageLevel._internal(1, 1);

  ///Console TIP level
  static const TIP = CygnusConsoleMessageLevel._internal(0, 0);

  ///Console WARNING level
  static const WARNING = CygnusConsoleMessageLevel._internal(2, 2);

  ///Set of all values of [CygnusConsoleMessageLevel].
  static final Set<CygnusConsoleMessageLevel> values = [
    CygnusConsoleMessageLevel.DEBUG,
    CygnusConsoleMessageLevel.ERROR,
    CygnusConsoleMessageLevel.LOG,
    CygnusConsoleMessageLevel.TIP,
    CygnusConsoleMessageLevel.WARNING,
  ].toSet();

  ///Gets a possible [CygnusConsoleMessageLevel] instance from [int] value.
  static CygnusConsoleMessageLevel? fromValue(int? value) {
    if (value != null) {
      try {
        return CygnusConsoleMessageLevel.values.firstWhere(
          (element) => element.toValue() == value,
        );
      } catch (e) {
        return null;
      }
    }
    return null;
  }

  ///Gets a possible [CygnusConsoleMessageLevel] instance from a native value.
  static CygnusConsoleMessageLevel? fromNativeValue(int? value) {
    if (value != null) {
      try {
        return CygnusConsoleMessageLevel.values.firstWhere(
          (element) => element.toNativeValue() == value,
        );
      } catch (e) {
        return null;
      }
    }
    return null;
  }

  /// Gets a possible [CygnusConsoleMessageLevel] instance value with name [name].
  ///
  /// Goes through [CygnusConsoleMessageLevel.values] looking for a value with
  /// name [name], as reported by [CygnusConsoleMessageLevel.name].
  /// Returns the first value with the given name, otherwise `null`.
  static CygnusConsoleMessageLevel? byName(String? name) {
    if (name != null) {
      try {
        return CygnusConsoleMessageLevel.values.firstWhere(
          (element) => element.name() == name,
        );
      } catch (e) {
        return null;
      }
    }
    return null;
  }

  /// Creates a map from the names of [CygnusConsoleMessageLevel] values to the values.
  ///
  /// The collection that this method is called on is expected to have
  /// values with distinct names, like the `values` list of an enum class.
  /// Only one value for each name can occur in the created map,
  /// so if two or more values have the same name (either being the
  /// same value, or being values of different enum type), at most one of
  /// them will be represented in the returned map.
  static Map<String, CygnusConsoleMessageLevel> asNameMap() =>
      <String, CygnusConsoleMessageLevel>{
        for (final value in CygnusConsoleMessageLevel.values)
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
        return 'DEBUG';
      case 3:
        return 'ERROR';
      case 1:
        return 'LOG';
      case 0:
        return 'TIP';
      case 2:
        return 'WARNING';
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
