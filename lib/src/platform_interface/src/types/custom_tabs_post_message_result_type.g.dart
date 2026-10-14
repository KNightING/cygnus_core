// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'custom_tabs_post_message_result_type.dart';

// **************************************************************************
// ExchangeableEnumGenerator
// **************************************************************************

///Custom Tabs postMessage result type.
class CygnusCustomTabsPostMessageResultType {
  final int _value;
  final int? _nativeValue;
  const CygnusCustomTabsPostMessageResultType._internal(
    this._value,
    this._nativeValue,
  );
  // ignore: unused_element
  factory CygnusCustomTabsPostMessageResultType._internalMultiPlatform(
    int value,
    Function nativeValue,
  ) => CygnusCustomTabsPostMessageResultType._internal(value, nativeValue());

  ///Indicates that the postMessage request was not allowed due to a bad argument
  ///or requesting at a disallowed time like when in background.
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView
  static final FAILURE_DISALLOWED =
      CygnusCustomTabsPostMessageResultType._internalMultiPlatform(-1, () {
        switch (defaultTargetPlatform) {
          case TargetPlatform.android:
            return -1;
          default:
            break;
        }
        return null;
      });

  ///Indicates that the postMessage request has failed due to an internal error on the browser message channel.
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView
  static final FAILURE_MESSAGING_ERROR =
      CygnusCustomTabsPostMessageResultType._internalMultiPlatform(-3, () {
        switch (defaultTargetPlatform) {
          case TargetPlatform.android:
            return -3;
          default:
            break;
        }
        return null;
      });

  ///Indicates that the postMessage request has failed due to a `RemoteException`.
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView
  static final FAILURE_REMOTE_ERROR =
      CygnusCustomTabsPostMessageResultType._internalMultiPlatform(-2, () {
        switch (defaultTargetPlatform) {
          case TargetPlatform.android:
            return -2;
          default:
            break;
        }
        return null;
      });

  ///Indicates that the postMessage request was accepted.
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView
  static final SUCCESS =
      CygnusCustomTabsPostMessageResultType._internalMultiPlatform(0, () {
        switch (defaultTargetPlatform) {
          case TargetPlatform.android:
            return 0;
          default:
            break;
        }
        return null;
      });

  ///Set of all values of [CygnusCustomTabsPostMessageResultType].
  static final Set<CygnusCustomTabsPostMessageResultType> values = [
    CygnusCustomTabsPostMessageResultType.FAILURE_DISALLOWED,
    CygnusCustomTabsPostMessageResultType.FAILURE_MESSAGING_ERROR,
    CygnusCustomTabsPostMessageResultType.FAILURE_REMOTE_ERROR,
    CygnusCustomTabsPostMessageResultType.SUCCESS,
  ].toSet();

  ///Gets a possible [CygnusCustomTabsPostMessageResultType] instance from [int] value.
  static CygnusCustomTabsPostMessageResultType? fromValue(int? value) {
    if (value != null) {
      try {
        return CygnusCustomTabsPostMessageResultType.values.firstWhere(
          (element) => element.toValue() == value,
        );
      } catch (e) {
        return null;
      }
    }
    return null;
  }

  ///Gets a possible [CygnusCustomTabsPostMessageResultType] instance from a native value.
  static CygnusCustomTabsPostMessageResultType? fromNativeValue(int? value) {
    if (value != null) {
      try {
        return CygnusCustomTabsPostMessageResultType.values.firstWhere(
          (element) => element.toNativeValue() == value,
        );
      } catch (e) {
        return null;
      }
    }
    return null;
  }

  /// Gets a possible [CygnusCustomTabsPostMessageResultType] instance value with name [name].
  ///
  /// Goes through [CygnusCustomTabsPostMessageResultType.values] looking for a value with
  /// name [name], as reported by [CygnusCustomTabsPostMessageResultType.name].
  /// Returns the first value with the given name, otherwise `null`.
  static CygnusCustomTabsPostMessageResultType? byName(String? name) {
    if (name != null) {
      try {
        return CygnusCustomTabsPostMessageResultType.values.firstWhere(
          (element) => element.name() == name,
        );
      } catch (e) {
        return null;
      }
    }
    return null;
  }

  /// Creates a map from the names of [CygnusCustomTabsPostMessageResultType] values to the values.
  ///
  /// The collection that this method is called on is expected to have
  /// values with distinct names, like the `values` list of an enum class.
  /// Only one value for each name can occur in the created map,
  /// so if two or more values have the same name (either being the
  /// same value, or being values of different enum type), at most one of
  /// them will be represented in the returned map.
  static Map<String, CygnusCustomTabsPostMessageResultType> asNameMap() =>
      <String, CygnusCustomTabsPostMessageResultType>{
        for (final value in CygnusCustomTabsPostMessageResultType.values)
          value.name(): value,
      };

  ///Gets [int] value.
  int toValue() => _value;

  ///Gets [int] native value if supported by the current platform, otherwise `null`.
  int? toNativeValue() => _nativeValue;

  ///Gets the name of the value.
  String name() {
    switch (_value) {
      case -1:
        return 'FAILURE_DISALLOWED';
      case -3:
        return 'FAILURE_MESSAGING_ERROR';
      case -2:
        return 'FAILURE_REMOTE_ERROR';
      case 0:
        return 'SUCCESS';
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
