// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'web_authentication_session_error.dart';

// **************************************************************************
// ExchangeableEnumGenerator
// **************************************************************************

///Class that represents the error code for a web authentication session error.
class CygnusWebAuthenticationSessionError {
  final int _value;
  final int? _nativeValue;
  const CygnusWebAuthenticationSessionError._internal(
    this._value,
    this._nativeValue,
  );
  // ignore: unused_element
  factory CygnusWebAuthenticationSessionError._internalMultiPlatform(
    int value,
    Function nativeValue,
  ) => CygnusWebAuthenticationSessionError._internal(value, nativeValue());

  ///The login has been canceled.
  static const CANCELED_LOGIN = CygnusWebAuthenticationSessionError._internal(
    1,
    1,
  );

  ///The context was invalid.
  static const PRESENTATION_CONTEXT_INVALID =
      CygnusWebAuthenticationSessionError._internal(3, 3);

  ///A context wasn’t provided.
  static const PRESENTATION_CONTEXT_NOT_PROVIDED =
      CygnusWebAuthenticationSessionError._internal(2, 2);

  ///Set of all values of [CygnusWebAuthenticationSessionError].
  static final Set<CygnusWebAuthenticationSessionError> values = [
    CygnusWebAuthenticationSessionError.CANCELED_LOGIN,
    CygnusWebAuthenticationSessionError.PRESENTATION_CONTEXT_INVALID,
    CygnusWebAuthenticationSessionError.PRESENTATION_CONTEXT_NOT_PROVIDED,
  ].toSet();

  ///Gets a possible [CygnusWebAuthenticationSessionError] instance from [int] value.
  static CygnusWebAuthenticationSessionError? fromValue(int? value) {
    if (value != null) {
      try {
        return CygnusWebAuthenticationSessionError.values.firstWhere(
          (element) => element.toValue() == value,
        );
      } catch (e) {
        return null;
      }
    }
    return null;
  }

  ///Gets a possible [CygnusWebAuthenticationSessionError] instance from a native value.
  static CygnusWebAuthenticationSessionError? fromNativeValue(int? value) {
    if (value != null) {
      try {
        return CygnusWebAuthenticationSessionError.values.firstWhere(
          (element) => element.toNativeValue() == value,
        );
      } catch (e) {
        return null;
      }
    }
    return null;
  }

  /// Gets a possible [CygnusWebAuthenticationSessionError] instance value with name [name].
  ///
  /// Goes through [CygnusWebAuthenticationSessionError.values] looking for a value with
  /// name [name], as reported by [CygnusWebAuthenticationSessionError.name].
  /// Returns the first value with the given name, otherwise `null`.
  static CygnusWebAuthenticationSessionError? byName(String? name) {
    if (name != null) {
      try {
        return CygnusWebAuthenticationSessionError.values.firstWhere(
          (element) => element.name() == name,
        );
      } catch (e) {
        return null;
      }
    }
    return null;
  }

  /// Creates a map from the names of [CygnusWebAuthenticationSessionError] values to the values.
  ///
  /// The collection that this method is called on is expected to have
  /// values with distinct names, like the `values` list of an enum class.
  /// Only one value for each name can occur in the created map,
  /// so if two or more values have the same name (either being the
  /// same value, or being values of different enum type), at most one of
  /// them will be represented in the returned map.
  static Map<String, CygnusWebAuthenticationSessionError> asNameMap() =>
      <String, CygnusWebAuthenticationSessionError>{
        for (final value in CygnusWebAuthenticationSessionError.values)
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
        return 'CANCELED_LOGIN';
      case 3:
        return 'PRESENTATION_CONTEXT_INVALID';
      case 2:
        return 'PRESENTATION_CONTEXT_NOT_PROVIDED';
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
