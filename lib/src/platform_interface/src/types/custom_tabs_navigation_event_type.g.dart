// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'custom_tabs_navigation_event_type.dart';

// **************************************************************************
// ExchangeableEnumGenerator
// **************************************************************************

///The type corresponding to the navigation event of [CygnusPlatformChromeSafariBrowserEvents.onNavigationEvent].
class CygnusCustomTabsNavigationEventType {
  final int _value;
  final int? _nativeValue;
  const CygnusCustomTabsNavigationEventType._internal(
    this._value,
    this._nativeValue,
  );
  // ignore: unused_element
  factory CygnusCustomTabsNavigationEventType._internalMultiPlatform(
    int value,
    Function nativeValue,
  ) => CygnusCustomTabsNavigationEventType._internal(value, nativeValue());

  ///Sent when loading was aborted by a user action before it finishes like clicking on a link or refreshing the page.
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView
  static final ABORTED =
      CygnusCustomTabsNavigationEventType._internalMultiPlatform(4, () {
        switch (defaultTargetPlatform) {
          case TargetPlatform.android:
            return 4;
          default:
            break;
        }
        return null;
      });

  ///Sent when the tab couldn't finish loading due to a failure.
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView
  static final FAILED =
      CygnusCustomTabsNavigationEventType._internalMultiPlatform(3, () {
        switch (defaultTargetPlatform) {
          case TargetPlatform.android:
            return 3;
          default:
            break;
        }
        return null;
      });

  ///Sent when the tab has finished loading a page.
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView
  static final FINISHED =
      CygnusCustomTabsNavigationEventType._internalMultiPlatform(2, () {
        switch (defaultTargetPlatform) {
          case TargetPlatform.android:
            return 2;
          default:
            break;
        }
        return null;
      });

  ///Sent when the tab has started loading a page.
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView
  static final STARTED =
      CygnusCustomTabsNavigationEventType._internalMultiPlatform(1, () {
        switch (defaultTargetPlatform) {
          case TargetPlatform.android:
            return 1;
          default:
            break;
        }
        return null;
      });

  ///Sent when the tab becomes hidden.
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView
  static final TAB_HIDDEN =
      CygnusCustomTabsNavigationEventType._internalMultiPlatform(6, () {
        switch (defaultTargetPlatform) {
          case TargetPlatform.android:
            return 6;
          default:
            break;
        }
        return null;
      });

  ///Sent when the tab becomes visible.
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView
  static final TAB_SHOWN =
      CygnusCustomTabsNavigationEventType._internalMultiPlatform(5, () {
        switch (defaultTargetPlatform) {
          case TargetPlatform.android:
            return 5;
          default:
            break;
        }
        return null;
      });

  ///Set of all values of [CygnusCustomTabsNavigationEventType].
  static final Set<CygnusCustomTabsNavigationEventType> values = [
    CygnusCustomTabsNavigationEventType.ABORTED,
    CygnusCustomTabsNavigationEventType.FAILED,
    CygnusCustomTabsNavigationEventType.FINISHED,
    CygnusCustomTabsNavigationEventType.STARTED,
    CygnusCustomTabsNavigationEventType.TAB_HIDDEN,
    CygnusCustomTabsNavigationEventType.TAB_SHOWN,
  ].toSet();

  ///Gets a possible [CygnusCustomTabsNavigationEventType] instance from [int] value.
  static CygnusCustomTabsNavigationEventType? fromValue(int? value) {
    if (value != null) {
      try {
        return CygnusCustomTabsNavigationEventType.values.firstWhere(
          (element) => element.toValue() == value,
        );
      } catch (e) {
        return null;
      }
    }
    return null;
  }

  ///Gets a possible [CygnusCustomTabsNavigationEventType] instance from a native value.
  static CygnusCustomTabsNavigationEventType? fromNativeValue(int? value) {
    if (value != null) {
      try {
        return CygnusCustomTabsNavigationEventType.values.firstWhere(
          (element) => element.toNativeValue() == value,
        );
      } catch (e) {
        return null;
      }
    }
    return null;
  }

  /// Gets a possible [CygnusCustomTabsNavigationEventType] instance value with name [name].
  ///
  /// Goes through [CygnusCustomTabsNavigationEventType.values] looking for a value with
  /// name [name], as reported by [CygnusCustomTabsNavigationEventType.name].
  /// Returns the first value with the given name, otherwise `null`.
  static CygnusCustomTabsNavigationEventType? byName(String? name) {
    if (name != null) {
      try {
        return CygnusCustomTabsNavigationEventType.values.firstWhere(
          (element) => element.name() == name,
        );
      } catch (e) {
        return null;
      }
    }
    return null;
  }

  /// Creates a map from the names of [CygnusCustomTabsNavigationEventType] values to the values.
  ///
  /// The collection that this method is called on is expected to have
  /// values with distinct names, like the `values` list of an enum class.
  /// Only one value for each name can occur in the created map,
  /// so if two or more values have the same name (either being the
  /// same value, or being values of different enum type), at most one of
  /// them will be represented in the returned map.
  static Map<String, CygnusCustomTabsNavigationEventType> asNameMap() =>
      <String, CygnusCustomTabsNavigationEventType>{
        for (final value in CygnusCustomTabsNavigationEventType.values)
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
        return 'ABORTED';
      case 3:
        return 'FAILED';
      case 2:
        return 'FINISHED';
      case 1:
        return 'STARTED';
      case 6:
        return 'TAB_HIDDEN';
      case 5:
        return 'TAB_SHOWN';
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
