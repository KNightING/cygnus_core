// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'action_mode_menu_item.dart';

// **************************************************************************
// ExchangeableEnumGenerator
// **************************************************************************

///Class used to disable the action mode menu items.
class CygnusActionModeMenuItem {
  final int _value;
  final int? _nativeValue;
  const CygnusActionModeMenuItem._internal(this._value, this._nativeValue);
  // ignore: unused_element
  factory CygnusActionModeMenuItem._internalMultiPlatform(
    int value,
    Function nativeValue,
  ) => CygnusActionModeMenuItem._internal(value, nativeValue());

  ///No menu items should be disabled.
  static const MENU_ITEM_NONE = CygnusActionModeMenuItem._internal(0, 0);

  ///Disable all the action mode menu items for text processing.
  static const MENU_ITEM_PROCESS_TEXT = CygnusActionModeMenuItem._internal(
    4,
    4,
  );

  ///Disable menu item "Share".
  static const MENU_ITEM_SHARE = CygnusActionModeMenuItem._internal(1, 1);

  ///Disable menu item "Web Search".
  static const MENU_ITEM_WEB_SEARCH = CygnusActionModeMenuItem._internal(2, 2);

  ///Set of all values of [CygnusActionModeMenuItem].
  static final Set<CygnusActionModeMenuItem> values = [
    CygnusActionModeMenuItem.MENU_ITEM_NONE,
    CygnusActionModeMenuItem.MENU_ITEM_PROCESS_TEXT,
    CygnusActionModeMenuItem.MENU_ITEM_SHARE,
    CygnusActionModeMenuItem.MENU_ITEM_WEB_SEARCH,
  ].toSet();

  ///Gets a possible [CygnusActionModeMenuItem] instance from [int] value.
  static CygnusActionModeMenuItem? fromValue(int? value) {
    if (value != null) {
      try {
        return CygnusActionModeMenuItem.values.firstWhere(
          (element) => element.toValue() == value,
        );
      } catch (e) {
        return CygnusActionModeMenuItem._internal(value, value);
      }
    }
    return null;
  }

  ///Gets a possible [CygnusActionModeMenuItem] instance from a native value.
  static CygnusActionModeMenuItem? fromNativeValue(int? value) {
    if (value != null) {
      try {
        return CygnusActionModeMenuItem.values.firstWhere(
          (element) => element.toNativeValue() == value,
        );
      } catch (e) {
        return null;
      }
    }
    return null;
  }

  /// Gets a possible [CygnusActionModeMenuItem] instance value with name [name].
  ///
  /// Goes through [CygnusActionModeMenuItem.values] looking for a value with
  /// name [name], as reported by [CygnusActionModeMenuItem.name].
  /// Returns the first value with the given name, otherwise `null`.
  static CygnusActionModeMenuItem? byName(String? name) {
    if (name != null) {
      try {
        return CygnusActionModeMenuItem.values.firstWhere(
          (element) => element.name() == name,
        );
      } catch (e) {
        return null;
      }
    }
    return null;
  }

  /// Creates a map from the names of [CygnusActionModeMenuItem] values to the values.
  ///
  /// The collection that this method is called on is expected to have
  /// values with distinct names, like the `values` list of an enum class.
  /// Only one value for each name can occur in the created map,
  /// so if two or more values have the same name (either being the
  /// same value, or being values of different enum type), at most one of
  /// them will be represented in the returned map.
  static Map<String, CygnusActionModeMenuItem> asNameMap() =>
      <String, CygnusActionModeMenuItem>{
        for (final value in CygnusActionModeMenuItem.values)
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
        return 'MENU_ITEM_NONE';
      case 4:
        return 'MENU_ITEM_PROCESS_TEXT';
      case 1:
        return 'MENU_ITEM_SHARE';
      case 2:
        return 'MENU_ITEM_WEB_SEARCH';
    }
    return _value.toString();
  }

  @override
  int get hashCode => _value.hashCode;

  @override
  bool operator ==(value) => value == _value;

  CygnusActionModeMenuItem operator |(CygnusActionModeMenuItem value) =>
      CygnusActionModeMenuItem._internal(
        value.toValue() | _value,
        value.toNativeValue() != null && _nativeValue != null
            ? value.toNativeValue()! | _nativeValue!
            : null,
      );

  ///Checks if the value is supported by the [defaultTargetPlatform].
  bool isSupported() {
    return _nativeValue != null;
  }

  @override
  String toString() {
    return name();
  }
}

///An Android-specific class used to disable the action mode menu items.
///
///**NOTE**: available on Android 24+.
///
///Use [CygnusActionModeMenuItem] instead.
@Deprecated('Use CygnusActionModeMenuItem instead')
class CygnusAndroidActionModeMenuItem {
  final int _value;
  final int? _nativeValue;
  const CygnusAndroidActionModeMenuItem._internal(
    this._value,
    this._nativeValue,
  );
  // ignore: unused_element
  factory CygnusAndroidActionModeMenuItem._internalMultiPlatform(
    int value,
    Function nativeValue,
  ) => CygnusAndroidActionModeMenuItem._internal(value, nativeValue());

  ///No menu items should be disabled.
  static const MENU_ITEM_NONE = CygnusAndroidActionModeMenuItem._internal(0, 0);

  ///Disable all the action mode menu items for text processing.
  static const MENU_ITEM_PROCESS_TEXT =
      CygnusAndroidActionModeMenuItem._internal(4, 4);

  ///Disable menu item "Share".
  static const MENU_ITEM_SHARE = CygnusAndroidActionModeMenuItem._internal(
    1,
    1,
  );

  ///Disable menu item "Web Search".
  static const MENU_ITEM_WEB_SEARCH = CygnusAndroidActionModeMenuItem._internal(
    2,
    2,
  );

  ///Set of all values of [CygnusAndroidActionModeMenuItem].
  static final Set<CygnusAndroidActionModeMenuItem> values = [
    CygnusAndroidActionModeMenuItem.MENU_ITEM_NONE,
    CygnusAndroidActionModeMenuItem.MENU_ITEM_PROCESS_TEXT,
    CygnusAndroidActionModeMenuItem.MENU_ITEM_SHARE,
    CygnusAndroidActionModeMenuItem.MENU_ITEM_WEB_SEARCH,
  ].toSet();

  ///Gets a possible [CygnusAndroidActionModeMenuItem] instance from [int] value.
  static CygnusAndroidActionModeMenuItem? fromValue(int? value) {
    if (value != null) {
      try {
        return CygnusAndroidActionModeMenuItem.values.firstWhere(
          (element) => element.toValue() == value,
        );
      } catch (e) {
        return CygnusAndroidActionModeMenuItem._internal(value, value);
      }
    }
    return null;
  }

  ///Gets a possible [CygnusAndroidActionModeMenuItem] instance from a native value.
  static CygnusAndroidActionModeMenuItem? fromNativeValue(int? value) {
    if (value != null) {
      try {
        return CygnusAndroidActionModeMenuItem.values.firstWhere(
          (element) => element.toNativeValue() == value,
        );
      } catch (e) {
        return null;
      }
    }
    return null;
  }

  /// Gets a possible [CygnusAndroidActionModeMenuItem] instance value with name [name].
  ///
  /// Goes through [CygnusAndroidActionModeMenuItem.values] looking for a value with
  /// name [name], as reported by [CygnusAndroidActionModeMenuItem.name].
  /// Returns the first value with the given name, otherwise `null`.
  static CygnusAndroidActionModeMenuItem? byName(String? name) {
    if (name != null) {
      try {
        return CygnusAndroidActionModeMenuItem.values.firstWhere(
          (element) => element.name() == name,
        );
      } catch (e) {
        return null;
      }
    }
    return null;
  }

  /// Creates a map from the names of [CygnusAndroidActionModeMenuItem] values to the values.
  ///
  /// The collection that this method is called on is expected to have
  /// values with distinct names, like the `values` list of an enum class.
  /// Only one value for each name can occur in the created map,
  /// so if two or more values have the same name (either being the
  /// same value, or being values of different enum type), at most one of
  /// them will be represented in the returned map.
  static Map<String, CygnusAndroidActionModeMenuItem> asNameMap() =>
      <String, CygnusAndroidActionModeMenuItem>{
        for (final value in CygnusAndroidActionModeMenuItem.values)
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
        return 'MENU_ITEM_NONE';
      case 4:
        return 'MENU_ITEM_PROCESS_TEXT';
      case 1:
        return 'MENU_ITEM_SHARE';
      case 2:
        return 'MENU_ITEM_WEB_SEARCH';
    }
    return _value.toString();
  }

  @override
  int get hashCode => _value.hashCode;

  @override
  bool operator ==(value) => value == _value;

  CygnusAndroidActionModeMenuItem operator |(
    CygnusAndroidActionModeMenuItem value,
  ) => CygnusAndroidActionModeMenuItem._internal(
    value.toValue() | _value,
    value.toNativeValue() != null && _nativeValue != null
        ? value.toNativeValue()! | _nativeValue!
        : null,
  );

  ///Checks if the value is supported by the [defaultTargetPlatform].
  bool isSupported() {
    return _nativeValue != null;
  }

  @override
  String toString() {
    return name();
  }
}
