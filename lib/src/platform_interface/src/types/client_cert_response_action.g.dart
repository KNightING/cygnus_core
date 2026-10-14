// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'client_cert_response_action.dart';

// **************************************************************************
// ExchangeableEnumGenerator
// **************************************************************************

///Class used by [CygnusClientCertResponse] class.
class CygnusClientCertResponseAction {
  final int _value;
  final int? _nativeValue;
  const CygnusClientCertResponseAction._internal(
    this._value,
    this._nativeValue,
  );
  // ignore: unused_element
  factory CygnusClientCertResponseAction._internalMultiPlatform(
    int value,
    Function nativeValue,
  ) => CygnusClientCertResponseAction._internal(value, nativeValue());

  ///Cancel this request.
  static const CANCEL = CygnusClientCertResponseAction._internal(0, 0);

  ///Ignore the request for now.
  static const IGNORE = CygnusClientCertResponseAction._internal(2, 2);

  ///Proceed with the specified certificate.
  static const PROCEED = CygnusClientCertResponseAction._internal(1, 1);

  ///Set of all values of [CygnusClientCertResponseAction].
  static final Set<CygnusClientCertResponseAction> values = [
    CygnusClientCertResponseAction.CANCEL,
    CygnusClientCertResponseAction.IGNORE,
    CygnusClientCertResponseAction.PROCEED,
  ].toSet();

  ///Gets a possible [CygnusClientCertResponseAction] instance from [int] value.
  static CygnusClientCertResponseAction? fromValue(int? value) {
    if (value != null) {
      try {
        return CygnusClientCertResponseAction.values.firstWhere(
          (element) => element.toValue() == value,
        );
      } catch (e) {
        return null;
      }
    }
    return null;
  }

  ///Gets a possible [CygnusClientCertResponseAction] instance from a native value.
  static CygnusClientCertResponseAction? fromNativeValue(int? value) {
    if (value != null) {
      try {
        return CygnusClientCertResponseAction.values.firstWhere(
          (element) => element.toNativeValue() == value,
        );
      } catch (e) {
        return null;
      }
    }
    return null;
  }

  /// Gets a possible [CygnusClientCertResponseAction] instance value with name [name].
  ///
  /// Goes through [CygnusClientCertResponseAction.values] looking for a value with
  /// name [name], as reported by [CygnusClientCertResponseAction.name].
  /// Returns the first value with the given name, otherwise `null`.
  static CygnusClientCertResponseAction? byName(String? name) {
    if (name != null) {
      try {
        return CygnusClientCertResponseAction.values.firstWhere(
          (element) => element.name() == name,
        );
      } catch (e) {
        return null;
      }
    }
    return null;
  }

  /// Creates a map from the names of [CygnusClientCertResponseAction] values to the values.
  ///
  /// The collection that this method is called on is expected to have
  /// values with distinct names, like the `values` list of an enum class.
  /// Only one value for each name can occur in the created map,
  /// so if two or more values have the same name (either being the
  /// same value, or being values of different enum type), at most one of
  /// them will be represented in the returned map.
  static Map<String, CygnusClientCertResponseAction> asNameMap() =>
      <String, CygnusClientCertResponseAction>{
        for (final value in CygnusClientCertResponseAction.values)
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
        return 'CANCEL';
      case 2:
        return 'IGNORE';
      case 1:
        return 'PROCEED';
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
