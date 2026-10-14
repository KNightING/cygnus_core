// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'context_menu.dart';

// **************************************************************************
// ExchangeableObjectGenerator
// **************************************************************************

///Class that represents the WebView context menu. It used by [CygnusPlatformWebViewCreationParams.contextMenu].
///
///**Officially Supported Platforms/Implementations**:
///- Android WebView:
///    - To make it work properly on Android, JavaScript should be enabled!
///- iOS WKWebView
class CygnusContextMenu {
  ///List of the custom [CygnusContextMenuItem].
  final List<CygnusContextMenuItem> menuItems;

  ///Event fired when a context menu item has been clicked.
  ///
  ///[contextMenuItemClicked] represents the [CygnusContextMenuItem] clicked.
  final void Function(CygnusContextMenuItem)? onContextMenuActionItemClicked;

  ///Event fired when the context menu for this WebView is being built.
  ///
  ///[hitTestResult] represents the hit result for hitting an HTML elements.
  final void Function(CygnusWebViewHitTestResult)? onCreateContextMenu;

  ///Event fired when the context menu for this WebView is being hidden.
  final void Function()? onHideContextMenu;

  ///Use [settings] instead
  @Deprecated('Use settings instead')
  final CygnusContextMenuOptions? options;

  ///Context menu settings.
  final CygnusContextMenuSettings? settings;

  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView:
  ///    - To make it work properly on Android, JavaScript should be enabled!
  ///- iOS WKWebView
  CygnusContextMenu({
    this.menuItems = const [],
    this.onCreateContextMenu,
    this.onHideContextMenu,
    @Deprecated("Use settings instead") this.options,
    this.settings,
    this.onContextMenuActionItemClicked,
  });

  ///Gets a possible [CygnusContextMenu] instance from a [Map] value.
  static CygnusContextMenu? fromMap(
    Map<String, dynamic>? map, {
    CygnusEnumMethod? enumMethod,
  }) {
    if (map == null) {
      return null;
    }
    final instance = CygnusContextMenu(
      menuItems: List<CygnusContextMenuItem>.from(
        map['menuItems'].map(
          (e) => CygnusContextMenuItem.fromMap(
            e?.cast<String, dynamic>(),
            enumMethod: enumMethod,
          )!,
        ),
      ),
      options: CygnusContextMenuOptions.fromMap(
        map['settings']?.cast<String, dynamic>(),
        enumMethod: enumMethod,
      ),
      settings: CygnusContextMenuSettings.fromMap(
        map['settings']?.cast<String, dynamic>(),
        enumMethod: enumMethod,
      ),
    );
    return instance;
  }

  @ExchangeableObjectMethod(toMapMergeWith: true)
  Map<String, dynamic> _toMapMergeWith({CygnusEnumMethod? enumMethod}) {
    return {
      "settings":
          (settings as CygnusContextMenuSettings?)?.toMap(
            enumMethod: enumMethod,
          ) ??
          (options as CygnusContextMenuOptions?)?.toMap(enumMethod: enumMethod),
    };
  }

  ///Converts instance to a map.
  Map<String, dynamic> toMap({CygnusEnumMethod? enumMethod}) {
    return {
      "menuItems": menuItems
          .map((e) => e.toMap(enumMethod: enumMethod))
          .toList(),
      "settings": settings?.toMap(enumMethod: enumMethod),
      ..._toMapMergeWith(enumMethod: enumMethod),
    };
  }

  ///Converts instance to a map.
  Map<String, dynamic> toJson() {
    return toMap();
  }

  @override
  String toString() {
    return 'CygnusContextMenu{menuItems: $menuItems, settings: $settings}';
  }
}
