// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'should_allow_deprecated_tls_action.dart';

// **************************************************************************
// ExchangeableEnumGenerator
// **************************************************************************

///Class that is used by [CygnusPlatformWebViewCreationParams.shouldAllowDeprecatedTLS] event.
///It represents the policy to pass back to the decision handler.
class CygnusShouldAllowDeprecatedTLSAction {
  final int _value;
  final int? _nativeValue;
  const CygnusShouldAllowDeprecatedTLSAction._internal(
    this._value,
    this._nativeValue,
  );
  // ignore: unused_element
  factory CygnusShouldAllowDeprecatedTLSAction._internalMultiPlatform(
    int value,
    Function nativeValue,
  ) => CygnusShouldAllowDeprecatedTLSAction._internal(value, nativeValue());

  ///Allow the navigation to continue.
  static const ALLOW = CygnusShouldAllowDeprecatedTLSAction._internal(1, 1);

  ///Cancel the navigation.
  static const CANCEL = CygnusShouldAllowDeprecatedTLSAction._internal(0, 0);

  ///Set of all values of [CygnusShouldAllowDeprecatedTLSAction].
  static final Set<CygnusShouldAllowDeprecatedTLSAction> values = [
    CygnusShouldAllowDeprecatedTLSAction.ALLOW,
    CygnusShouldAllowDeprecatedTLSAction.CANCEL,
  ].toSet();

  ///Gets a possible [CygnusShouldAllowDeprecatedTLSAction] instance from [int] value.
  static CygnusShouldAllowDeprecatedTLSAction? fromValue(int? value) {
    if (value != null) {
      try {
        return CygnusShouldAllowDeprecatedTLSAction.values.firstWhere(
          (element) => element.toValue() == value,
        );
      } catch (e) {
        return null;
      }
    }
    return null;
  }

  ///Gets a possible [CygnusShouldAllowDeprecatedTLSAction] instance from a native value.
  static CygnusShouldAllowDeprecatedTLSAction? fromNativeValue(int? value) {
    if (value != null) {
      try {
        return CygnusShouldAllowDeprecatedTLSAction.values.firstWhere(
          (element) => element.toNativeValue() == value,
        );
      } catch (e) {
        return null;
      }
    }
    return null;
  }

  /// Gets a possible [CygnusShouldAllowDeprecatedTLSAction] instance value with name [name].
  ///
  /// Goes through [CygnusShouldAllowDeprecatedTLSAction.values] looking for a value with
  /// name [name], as reported by [CygnusShouldAllowDeprecatedTLSAction.name].
  /// Returns the first value with the given name, otherwise `null`.
  static CygnusShouldAllowDeprecatedTLSAction? byName(String? name) {
    if (name != null) {
      try {
        return CygnusShouldAllowDeprecatedTLSAction.values.firstWhere(
          (element) => element.name() == name,
        );
      } catch (e) {
        return null;
      }
    }
    return null;
  }

  /// Creates a map from the names of [CygnusShouldAllowDeprecatedTLSAction] values to the values.
  ///
  /// The collection that this method is called on is expected to have
  /// values with distinct names, like the `values` list of an enum class.
  /// Only one value for each name can occur in the created map,
  /// so if two or more values have the same name (either being the
  /// same value, or being values of different enum type), at most one of
  /// them will be represented in the returned map.
  static Map<String, CygnusShouldAllowDeprecatedTLSAction> asNameMap() =>
      <String, CygnusShouldAllowDeprecatedTLSAction>{
        for (final value in CygnusShouldAllowDeprecatedTLSAction.values)
          value.name(): value,
      };

  ///Gets [int] value.
  int toValue() => _value;

  ///Gets [int] native value if supported by the current platform, otherwise `null`.
  int? toNativeValue() => _nativeValue;

  ///Gets the name of the value.
  String name() {
    switch (_value) {
      case 1:
        return 'ALLOW';
      case 0:
        return 'CANCEL';
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

///Class that is used by [CygnusPlatformWebViewCreationParams.shouldAllowDeprecatedTLS] event.
///It represents the policy to pass back to the decision handler.
///Use [CygnusShouldAllowDeprecatedTLSAction] instead.
@Deprecated('Use CygnusShouldAllowDeprecatedTLSAction instead')
class CygnusIOSShouldAllowDeprecatedTLSAction {
  final int _value;
  final int? _nativeValue;
  const CygnusIOSShouldAllowDeprecatedTLSAction._internal(
    this._value,
    this._nativeValue,
  );
  // ignore: unused_element
  factory CygnusIOSShouldAllowDeprecatedTLSAction._internalMultiPlatform(
    int value,
    Function nativeValue,
  ) => CygnusIOSShouldAllowDeprecatedTLSAction._internal(value, nativeValue());

  ///Allow the navigation to continue.
  static const ALLOW = CygnusIOSShouldAllowDeprecatedTLSAction._internal(1, 1);

  ///Cancel the navigation.
  static const CANCEL = CygnusIOSShouldAllowDeprecatedTLSAction._internal(0, 0);

  ///Set of all values of [CygnusIOSShouldAllowDeprecatedTLSAction].
  static final Set<CygnusIOSShouldAllowDeprecatedTLSAction> values = [
    CygnusIOSShouldAllowDeprecatedTLSAction.ALLOW,
    CygnusIOSShouldAllowDeprecatedTLSAction.CANCEL,
  ].toSet();

  ///Gets a possible [CygnusIOSShouldAllowDeprecatedTLSAction] instance from [int] value.
  static CygnusIOSShouldAllowDeprecatedTLSAction? fromValue(int? value) {
    if (value != null) {
      try {
        return CygnusIOSShouldAllowDeprecatedTLSAction.values.firstWhere(
          (element) => element.toValue() == value,
        );
      } catch (e) {
        return null;
      }
    }
    return null;
  }

  ///Gets a possible [CygnusIOSShouldAllowDeprecatedTLSAction] instance from a native value.
  static CygnusIOSShouldAllowDeprecatedTLSAction? fromNativeValue(int? value) {
    if (value != null) {
      try {
        return CygnusIOSShouldAllowDeprecatedTLSAction.values.firstWhere(
          (element) => element.toNativeValue() == value,
        );
      } catch (e) {
        return null;
      }
    }
    return null;
  }

  /// Gets a possible [CygnusIOSShouldAllowDeprecatedTLSAction] instance value with name [name].
  ///
  /// Goes through [CygnusIOSShouldAllowDeprecatedTLSAction.values] looking for a value with
  /// name [name], as reported by [CygnusIOSShouldAllowDeprecatedTLSAction.name].
  /// Returns the first value with the given name, otherwise `null`.
  static CygnusIOSShouldAllowDeprecatedTLSAction? byName(String? name) {
    if (name != null) {
      try {
        return CygnusIOSShouldAllowDeprecatedTLSAction.values.firstWhere(
          (element) => element.name() == name,
        );
      } catch (e) {
        return null;
      }
    }
    return null;
  }

  /// Creates a map from the names of [CygnusIOSShouldAllowDeprecatedTLSAction] values to the values.
  ///
  /// The collection that this method is called on is expected to have
  /// values with distinct names, like the `values` list of an enum class.
  /// Only one value for each name can occur in the created map,
  /// so if two or more values have the same name (either being the
  /// same value, or being values of different enum type), at most one of
  /// them will be represented in the returned map.
  static Map<String, CygnusIOSShouldAllowDeprecatedTLSAction> asNameMap() =>
      <String, CygnusIOSShouldAllowDeprecatedTLSAction>{
        for (final value in CygnusIOSShouldAllowDeprecatedTLSAction.values)
          value.name(): value,
      };

  ///Gets [int] value.
  int toValue() => _value;

  ///Gets [int] native value if supported by the current platform, otherwise `null`.
  int? toNativeValue() => _nativeValue;

  ///Gets the name of the value.
  String name() {
    switch (_value) {
      case 1:
        return 'ALLOW';
      case 0:
        return 'CANCEL';
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
