// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'permission_response_action.dart';

// **************************************************************************
// ExchangeableEnumGenerator
// **************************************************************************

///Class used by [CygnusPermissionResponse] class.
class CygnusPermissionResponseAction {
  final int _value;
  final int? _nativeValue;
  const CygnusPermissionResponseAction._internal(
    this._value,
    this._nativeValue,
  );
  // ignore: unused_element
  factory CygnusPermissionResponseAction._internalMultiPlatform(
    int value,
    Function nativeValue,
  ) => CygnusPermissionResponseAction._internal(value, nativeValue());

  ///Denies the request.
  static const DENY = CygnusPermissionResponseAction._internal(0, 0);

  ///Grants origin the permission to access the given resources.
  static const GRANT = CygnusPermissionResponseAction._internal(1, 1);

  ///Prompt the user for permission for the requested resource.
  static const PROMPT = CygnusPermissionResponseAction._internal(2, 2);

  ///Set of all values of [CygnusPermissionResponseAction].
  static final Set<CygnusPermissionResponseAction> values = [
    CygnusPermissionResponseAction.DENY,
    CygnusPermissionResponseAction.GRANT,
    CygnusPermissionResponseAction.PROMPT,
  ].toSet();

  ///Gets a possible [CygnusPermissionResponseAction] instance from [int] value.
  static CygnusPermissionResponseAction? fromValue(int? value) {
    if (value != null) {
      try {
        return CygnusPermissionResponseAction.values.firstWhere(
          (element) => element.toValue() == value,
        );
      } catch (e) {
        return null;
      }
    }
    return null;
  }

  ///Gets a possible [CygnusPermissionResponseAction] instance from a native value.
  static CygnusPermissionResponseAction? fromNativeValue(int? value) {
    if (value != null) {
      try {
        return CygnusPermissionResponseAction.values.firstWhere(
          (element) => element.toNativeValue() == value,
        );
      } catch (e) {
        return null;
      }
    }
    return null;
  }

  /// Gets a possible [CygnusPermissionResponseAction] instance value with name [name].
  ///
  /// Goes through [CygnusPermissionResponseAction.values] looking for a value with
  /// name [name], as reported by [CygnusPermissionResponseAction.name].
  /// Returns the first value with the given name, otherwise `null`.
  static CygnusPermissionResponseAction? byName(String? name) {
    if (name != null) {
      try {
        return CygnusPermissionResponseAction.values.firstWhere(
          (element) => element.name() == name,
        );
      } catch (e) {
        return null;
      }
    }
    return null;
  }

  /// Creates a map from the names of [CygnusPermissionResponseAction] values to the values.
  ///
  /// The collection that this method is called on is expected to have
  /// values with distinct names, like the `values` list of an enum class.
  /// Only one value for each name can occur in the created map,
  /// so if two or more values have the same name (either being the
  /// same value, or being values of different enum type), at most one of
  /// them will be represented in the returned map.
  static Map<String, CygnusPermissionResponseAction> asNameMap() =>
      <String, CygnusPermissionResponseAction>{
        for (final value in CygnusPermissionResponseAction.values)
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
        return 'DENY';
      case 1:
        return 'GRANT';
      case 2:
        return 'PROMPT';
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

///Class used by [CygnusPermissionRequestResponse] class.
///Use [CygnusPermissionResponseAction] instead.
@Deprecated('Use CygnusPermissionResponseAction instead')
class CygnusPermissionRequestResponseAction {
  final int _value;
  final int? _nativeValue;
  const CygnusPermissionRequestResponseAction._internal(
    this._value,
    this._nativeValue,
  );
  // ignore: unused_element
  factory CygnusPermissionRequestResponseAction._internalMultiPlatform(
    int value,
    Function nativeValue,
  ) => CygnusPermissionRequestResponseAction._internal(value, nativeValue());

  ///Denies the request.
  static const DENY = CygnusPermissionRequestResponseAction._internal(0, 0);

  ///Grants origin the permission to access the given resources.
  static const GRANT = CygnusPermissionRequestResponseAction._internal(1, 1);

  ///Set of all values of [CygnusPermissionRequestResponseAction].
  static final Set<CygnusPermissionRequestResponseAction> values = [
    CygnusPermissionRequestResponseAction.DENY,
    CygnusPermissionRequestResponseAction.GRANT,
  ].toSet();

  ///Gets a possible [CygnusPermissionRequestResponseAction] instance from [int] value.
  static CygnusPermissionRequestResponseAction? fromValue(int? value) {
    if (value != null) {
      try {
        return CygnusPermissionRequestResponseAction.values.firstWhere(
          (element) => element.toValue() == value,
        );
      } catch (e) {
        return null;
      }
    }
    return null;
  }

  ///Gets a possible [CygnusPermissionRequestResponseAction] instance from a native value.
  static CygnusPermissionRequestResponseAction? fromNativeValue(int? value) {
    if (value != null) {
      try {
        return CygnusPermissionRequestResponseAction.values.firstWhere(
          (element) => element.toNativeValue() == value,
        );
      } catch (e) {
        return null;
      }
    }
    return null;
  }

  /// Gets a possible [CygnusPermissionRequestResponseAction] instance value with name [name].
  ///
  /// Goes through [CygnusPermissionRequestResponseAction.values] looking for a value with
  /// name [name], as reported by [CygnusPermissionRequestResponseAction.name].
  /// Returns the first value with the given name, otherwise `null`.
  static CygnusPermissionRequestResponseAction? byName(String? name) {
    if (name != null) {
      try {
        return CygnusPermissionRequestResponseAction.values.firstWhere(
          (element) => element.name() == name,
        );
      } catch (e) {
        return null;
      }
    }
    return null;
  }

  /// Creates a map from the names of [CygnusPermissionRequestResponseAction] values to the values.
  ///
  /// The collection that this method is called on is expected to have
  /// values with distinct names, like the `values` list of an enum class.
  /// Only one value for each name can occur in the created map,
  /// so if two or more values have the same name (either being the
  /// same value, or being values of different enum type), at most one of
  /// them will be represented in the returned map.
  static Map<String, CygnusPermissionRequestResponseAction> asNameMap() =>
      <String, CygnusPermissionRequestResponseAction>{
        for (final value in CygnusPermissionRequestResponseAction.values)
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
        return 'DENY';
      case 1:
        return 'GRANT';
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
