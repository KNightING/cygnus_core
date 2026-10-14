// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'context_menu_settings.dart';

// **************************************************************************
// ExchangeableObjectGenerator
// **************************************************************************

///Class that represents available settings used by [CygnusContextMenu].
class CygnusContextMenuSettings {
  ///Whether all the default system context menu items should be hidden or not. The default value is `false`.
  bool hideDefaultSystemContextMenuItems;
  CygnusContextMenuSettings({this.hideDefaultSystemContextMenuItems = false});

  ///Gets a possible [CygnusContextMenuSettings] instance from a [Map] value.
  static CygnusContextMenuSettings? fromMap(
    Map<String, dynamic>? map, {
    CygnusEnumMethod? enumMethod,
  }) {
    if (map == null) {
      return null;
    }
    final instance = CygnusContextMenuSettings();
    if (map['hideDefaultSystemContextMenuItems'] != null) {
      instance.hideDefaultSystemContextMenuItems =
          map['hideDefaultSystemContextMenuItems'];
    }
    return instance;
  }

  ///Converts instance to a map.
  Map<String, dynamic> toMap({CygnusEnumMethod? enumMethod}) {
    return {
      "hideDefaultSystemContextMenuItems": hideDefaultSystemContextMenuItems,
    };
  }

  ///Converts instance to a map.
  Map<String, dynamic> toJson() {
    return toMap();
  }

  ///Returns a copy of CygnusContextMenuSettings.
  CygnusContextMenuSettings copy() {
    return CygnusContextMenuSettings.fromMap(toMap()) ??
        CygnusContextMenuSettings();
  }

  @override
  String toString() {
    return 'CygnusContextMenuSettings{hideDefaultSystemContextMenuItems: $hideDefaultSystemContextMenuItems}';
  }
}

///Use [CygnusContextMenuSettings] instead.
@Deprecated('Use CygnusContextMenuSettings instead')
class CygnusContextMenuOptions {
  ///Whether all the default system context menu items should be hidden or not. The default value is `false`.
  bool hideDefaultSystemContextMenuItems;
  CygnusContextMenuOptions({this.hideDefaultSystemContextMenuItems = false});

  ///Gets a possible [CygnusContextMenuOptions] instance from a [Map] value.
  static CygnusContextMenuOptions? fromMap(
    Map<String, dynamic>? map, {
    CygnusEnumMethod? enumMethod,
  }) {
    if (map == null) {
      return null;
    }
    final instance = CygnusContextMenuOptions();
    if (map['hideDefaultSystemContextMenuItems'] != null) {
      instance.hideDefaultSystemContextMenuItems =
          map['hideDefaultSystemContextMenuItems'];
    }
    return instance;
  }

  ///Converts instance to a map.
  Map<String, dynamic> toMap({CygnusEnumMethod? enumMethod}) {
    return {
      "hideDefaultSystemContextMenuItems": hideDefaultSystemContextMenuItems,
    };
  }

  ///Converts instance to a map.
  Map<String, dynamic> toJson() {
    return toMap();
  }

  ///Returns a copy of CygnusContextMenuOptions.
  CygnusContextMenuOptions copy() {
    return CygnusContextMenuOptions.fromMap(toMap()) ??
        CygnusContextMenuOptions();
  }

  @override
  String toString() {
    return 'CygnusContextMenuOptions{hideDefaultSystemContextMenuItems: $hideDefaultSystemContextMenuItems}';
  }
}
