// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'url_credential_persistence.dart';

// **************************************************************************
// ExchangeableEnumGenerator
// **************************************************************************

///Class that represents the constants that specify how long the credential will be kept.
class CygnusURLCredentialPersistence {
  final int _value;
  final int? _nativeValue;
  const CygnusURLCredentialPersistence._internal(
    this._value,
    this._nativeValue,
  );
  // ignore: unused_element
  factory CygnusURLCredentialPersistence._internalMultiPlatform(
    int value,
    Function nativeValue,
  ) => CygnusURLCredentialPersistence._internal(value, nativeValue());

  ///The credential should be stored only for this session
  static const FOR_SESSION = CygnusURLCredentialPersistence._internal(1, 1);

  ///The credential should not be stored.
  static const NONE = CygnusURLCredentialPersistence._internal(0, 0);

  ///The credential should be stored in the keychain.
  static const PERMANENT = CygnusURLCredentialPersistence._internal(2, 2);

  ///The credential should be stored permanently in the keychain,
  ///and in addition should be distributed to other devices based on the owning Apple ID.
  static const SYNCHRONIZABLE = CygnusURLCredentialPersistence._internal(3, 3);

  ///Set of all values of [CygnusURLCredentialPersistence].
  static final Set<CygnusURLCredentialPersistence> values = [
    CygnusURLCredentialPersistence.FOR_SESSION,
    CygnusURLCredentialPersistence.NONE,
    CygnusURLCredentialPersistence.PERMANENT,
    CygnusURLCredentialPersistence.SYNCHRONIZABLE,
  ].toSet();

  ///Gets a possible [CygnusURLCredentialPersistence] instance from [int] value.
  static CygnusURLCredentialPersistence? fromValue(int? value) {
    if (value != null) {
      try {
        return CygnusURLCredentialPersistence.values.firstWhere(
          (element) => element.toValue() == value,
        );
      } catch (e) {
        return null;
      }
    }
    return null;
  }

  ///Gets a possible [CygnusURLCredentialPersistence] instance from a native value.
  static CygnusURLCredentialPersistence? fromNativeValue(int? value) {
    if (value != null) {
      try {
        return CygnusURLCredentialPersistence.values.firstWhere(
          (element) => element.toNativeValue() == value,
        );
      } catch (e) {
        return null;
      }
    }
    return null;
  }

  /// Gets a possible [CygnusURLCredentialPersistence] instance value with name [name].
  ///
  /// Goes through [CygnusURLCredentialPersistence.values] looking for a value with
  /// name [name], as reported by [CygnusURLCredentialPersistence.name].
  /// Returns the first value with the given name, otherwise `null`.
  static CygnusURLCredentialPersistence? byName(String? name) {
    if (name != null) {
      try {
        return CygnusURLCredentialPersistence.values.firstWhere(
          (element) => element.name() == name,
        );
      } catch (e) {
        return null;
      }
    }
    return null;
  }

  /// Creates a map from the names of [CygnusURLCredentialPersistence] values to the values.
  ///
  /// The collection that this method is called on is expected to have
  /// values with distinct names, like the `values` list of an enum class.
  /// Only one value for each name can occur in the created map,
  /// so if two or more values have the same name (either being the
  /// same value, or being values of different enum type), at most one of
  /// them will be represented in the returned map.
  static Map<String, CygnusURLCredentialPersistence> asNameMap() =>
      <String, CygnusURLCredentialPersistence>{
        for (final value in CygnusURLCredentialPersistence.values)
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
        return 'FOR_SESSION';
      case 0:
        return 'NONE';
      case 2:
        return 'PERMANENT';
      case 3:
        return 'SYNCHRONIZABLE';
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

///An iOS-specific class that represents the constants that specify how long the credential will be kept.
///Use [CygnusURLCredentialPersistence] instead.
@Deprecated('Use CygnusURLCredentialPersistence instead')
class CygnusIOSURLCredentialPersistence {
  final int _value;
  final int? _nativeValue;
  const CygnusIOSURLCredentialPersistence._internal(
    this._value,
    this._nativeValue,
  );
  // ignore: unused_element
  factory CygnusIOSURLCredentialPersistence._internalMultiPlatform(
    int value,
    Function nativeValue,
  ) => CygnusIOSURLCredentialPersistence._internal(value, nativeValue());

  ///The credential should be stored only for this session
  static const FOR_SESSION = CygnusIOSURLCredentialPersistence._internal(1, 1);

  ///The credential should not be stored.
  static const NONE = CygnusIOSURLCredentialPersistence._internal(0, 0);

  ///The credential should be stored in the keychain.
  static const PERMANENT = CygnusIOSURLCredentialPersistence._internal(2, 2);

  ///The credential should be stored permanently in the keychain,
  ///and in addition should be distributed to other devices based on the owning Apple ID.
  static const SYNCHRONIZABLE = CygnusIOSURLCredentialPersistence._internal(
    3,
    3,
  );

  ///Set of all values of [CygnusIOSURLCredentialPersistence].
  static final Set<CygnusIOSURLCredentialPersistence> values = [
    CygnusIOSURLCredentialPersistence.FOR_SESSION,
    CygnusIOSURLCredentialPersistence.NONE,
    CygnusIOSURLCredentialPersistence.PERMANENT,
    CygnusIOSURLCredentialPersistence.SYNCHRONIZABLE,
  ].toSet();

  ///Gets a possible [CygnusIOSURLCredentialPersistence] instance from [int] value.
  static CygnusIOSURLCredentialPersistence? fromValue(int? value) {
    if (value != null) {
      try {
        return CygnusIOSURLCredentialPersistence.values.firstWhere(
          (element) => element.toValue() == value,
        );
      } catch (e) {
        return null;
      }
    }
    return null;
  }

  ///Gets a possible [CygnusIOSURLCredentialPersistence] instance from a native value.
  static CygnusIOSURLCredentialPersistence? fromNativeValue(int? value) {
    if (value != null) {
      try {
        return CygnusIOSURLCredentialPersistence.values.firstWhere(
          (element) => element.toNativeValue() == value,
        );
      } catch (e) {
        return null;
      }
    }
    return null;
  }

  /// Gets a possible [CygnusIOSURLCredentialPersistence] instance value with name [name].
  ///
  /// Goes through [CygnusIOSURLCredentialPersistence.values] looking for a value with
  /// name [name], as reported by [CygnusIOSURLCredentialPersistence.name].
  /// Returns the first value with the given name, otherwise `null`.
  static CygnusIOSURLCredentialPersistence? byName(String? name) {
    if (name != null) {
      try {
        return CygnusIOSURLCredentialPersistence.values.firstWhere(
          (element) => element.name() == name,
        );
      } catch (e) {
        return null;
      }
    }
    return null;
  }

  /// Creates a map from the names of [CygnusIOSURLCredentialPersistence] values to the values.
  ///
  /// The collection that this method is called on is expected to have
  /// values with distinct names, like the `values` list of an enum class.
  /// Only one value for each name can occur in the created map,
  /// so if two or more values have the same name (either being the
  /// same value, or being values of different enum type), at most one of
  /// them will be represented in the returned map.
  static Map<String, CygnusIOSURLCredentialPersistence> asNameMap() =>
      <String, CygnusIOSURLCredentialPersistence>{
        for (final value in CygnusIOSURLCredentialPersistence.values)
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
        return 'FOR_SESSION';
      case 0:
        return 'NONE';
      case 2:
        return 'PERMANENT';
      case 3:
        return 'SYNCHRONIZABLE';
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
