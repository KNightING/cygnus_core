// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'navigation_response_action.dart';

// **************************************************************************
// ExchangeableEnumGenerator
// **************************************************************************

///Class that is used by [CygnusPlatformWebViewCreationParams.onNavigationResponse] event.
///It represents the policy to pass back to the decision handler.
class CygnusNavigationResponseAction {
  final int _value;
  final int? _nativeValue;
  const CygnusNavigationResponseAction._internal(
    this._value,
    this._nativeValue,
  );
  // ignore: unused_element
  factory CygnusNavigationResponseAction._internalMultiPlatform(
    int value,
    Function nativeValue,
  ) => CygnusNavigationResponseAction._internal(value, nativeValue());

  ///Allow the navigation to continue.
  static const ALLOW = CygnusNavigationResponseAction._internal(1, 1);

  ///Cancel the navigation.
  static const CANCEL = CygnusNavigationResponseAction._internal(0, 0);

  ///Turn the navigation into a download.
  ///
  ///**NOTE**: available only on iOS 14.5+. It will fallback to [CANCEL].
  static const DOWNLOAD = CygnusNavigationResponseAction._internal(2, 2);

  ///Set of all values of [CygnusNavigationResponseAction].
  static final Set<CygnusNavigationResponseAction> values = [
    CygnusNavigationResponseAction.ALLOW,
    CygnusNavigationResponseAction.CANCEL,
    CygnusNavigationResponseAction.DOWNLOAD,
  ].toSet();

  ///Gets a possible [CygnusNavigationResponseAction] instance from [int] value.
  static CygnusNavigationResponseAction? fromValue(int? value) {
    if (value != null) {
      try {
        return CygnusNavigationResponseAction.values.firstWhere(
          (element) => element.toValue() == value,
        );
      } catch (e) {
        return null;
      }
    }
    return null;
  }

  ///Gets a possible [CygnusNavigationResponseAction] instance from a native value.
  static CygnusNavigationResponseAction? fromNativeValue(int? value) {
    if (value != null) {
      try {
        return CygnusNavigationResponseAction.values.firstWhere(
          (element) => element.toNativeValue() == value,
        );
      } catch (e) {
        return null;
      }
    }
    return null;
  }

  /// Gets a possible [CygnusNavigationResponseAction] instance value with name [name].
  ///
  /// Goes through [CygnusNavigationResponseAction.values] looking for a value with
  /// name [name], as reported by [CygnusNavigationResponseAction.name].
  /// Returns the first value with the given name, otherwise `null`.
  static CygnusNavigationResponseAction? byName(String? name) {
    if (name != null) {
      try {
        return CygnusNavigationResponseAction.values.firstWhere(
          (element) => element.name() == name,
        );
      } catch (e) {
        return null;
      }
    }
    return null;
  }

  /// Creates a map from the names of [CygnusNavigationResponseAction] values to the values.
  ///
  /// The collection that this method is called on is expected to have
  /// values with distinct names, like the `values` list of an enum class.
  /// Only one value for each name can occur in the created map,
  /// so if two or more values have the same name (either being the
  /// same value, or being values of different enum type), at most one of
  /// them will be represented in the returned map.
  static Map<String, CygnusNavigationResponseAction> asNameMap() =>
      <String, CygnusNavigationResponseAction>{
        for (final value in CygnusNavigationResponseAction.values)
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
      case 2:
        return 'DOWNLOAD';
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

///Class that is used by [CygnusPlatformWebViewCreationParams.onNavigationResponse] event.
///It represents the policy to pass back to the decision handler.
///Use [CygnusNavigationResponseAction] instead.
@Deprecated('Use CygnusNavigationResponseAction instead')
class CygnusIOSNavigationResponseAction {
  final int _value;
  final int? _nativeValue;
  const CygnusIOSNavigationResponseAction._internal(
    this._value,
    this._nativeValue,
  );
  // ignore: unused_element
  factory CygnusIOSNavigationResponseAction._internalMultiPlatform(
    int value,
    Function nativeValue,
  ) => CygnusIOSNavigationResponseAction._internal(value, nativeValue());

  ///Allow the navigation to continue.
  static const ALLOW = CygnusIOSNavigationResponseAction._internal(1, 1);

  ///Cancel the navigation.
  static const CANCEL = CygnusIOSNavigationResponseAction._internal(0, 0);

  ///Set of all values of [CygnusIOSNavigationResponseAction].
  static final Set<CygnusIOSNavigationResponseAction> values = [
    CygnusIOSNavigationResponseAction.ALLOW,
    CygnusIOSNavigationResponseAction.CANCEL,
  ].toSet();

  ///Gets a possible [CygnusIOSNavigationResponseAction] instance from [int] value.
  static CygnusIOSNavigationResponseAction? fromValue(int? value) {
    if (value != null) {
      try {
        return CygnusIOSNavigationResponseAction.values.firstWhere(
          (element) => element.toValue() == value,
        );
      } catch (e) {
        return null;
      }
    }
    return null;
  }

  ///Gets a possible [CygnusIOSNavigationResponseAction] instance from a native value.
  static CygnusIOSNavigationResponseAction? fromNativeValue(int? value) {
    if (value != null) {
      try {
        return CygnusIOSNavigationResponseAction.values.firstWhere(
          (element) => element.toNativeValue() == value,
        );
      } catch (e) {
        return null;
      }
    }
    return null;
  }

  /// Gets a possible [CygnusIOSNavigationResponseAction] instance value with name [name].
  ///
  /// Goes through [CygnusIOSNavigationResponseAction.values] looking for a value with
  /// name [name], as reported by [CygnusIOSNavigationResponseAction.name].
  /// Returns the first value with the given name, otherwise `null`.
  static CygnusIOSNavigationResponseAction? byName(String? name) {
    if (name != null) {
      try {
        return CygnusIOSNavigationResponseAction.values.firstWhere(
          (element) => element.name() == name,
        );
      } catch (e) {
        return null;
      }
    }
    return null;
  }

  /// Creates a map from the names of [CygnusIOSNavigationResponseAction] values to the values.
  ///
  /// The collection that this method is called on is expected to have
  /// values with distinct names, like the `values` list of an enum class.
  /// Only one value for each name can occur in the created map,
  /// so if two or more values have the same name (either being the
  /// same value, or being values of different enum type), at most one of
  /// them will be represented in the returned map.
  static Map<String, CygnusIOSNavigationResponseAction> asNameMap() =>
      <String, CygnusIOSNavigationResponseAction>{
        for (final value in CygnusIOSNavigationResponseAction.values)
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
