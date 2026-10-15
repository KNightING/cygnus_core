import 'dart:typed_data';
import 'dart:ui';

import 'package:cygnus_core_internal_annotations/cygnus_core_internal_annotations.dart';

import '../util.dart';

import 'platform_browser.dart';
import '../types/main.dart';
import '../types/enum_method.dart';

part 'browser_menu_item.g.dart';

dynamic _serializeIcon(dynamic icon, {CygnusEnumMethod? enumMethod}) {
  return icon is Uint8List ? icon : icon?.toMap(enumMethod: enumMethod);
}

dynamic _deserializeIcon(dynamic icon, {CygnusEnumMethod? enumMethod}) {
  if (icon is Uint8List) {
    return icon;
  }
  if (icon is Map<String, dynamic>) {
    final iconMap = icon as Map<String, dynamic>;
    if (iconMap.containsKey('defType')) {
      return CygnusAndroidResource.fromMap(iconMap, enumMethod: enumMethod);
    }
    if (iconMap.containsKey('systemName')) {
      return CygnusUIImage.fromMap(iconMap, enumMethod: enumMethod);
    }
  }
  return null;
}

///Class that represents a custom menu item for a [CygnusPlatformBrowser] instance.
@SupportedPlatforms(
  platforms: [AndroidPlatform(), IOSPlatform(), MacOSPlatform()],
)
@ExchangeableObject()
class CygnusBrowserMenuItem_ {
  ///The menu item id.
  int id;

  ///The title of the menu item.
  String title;

  ///Item icon.
  @ExchangeableObjectProperty(
    serializer: _serializeIcon,
    deserializer: _deserializeIcon,
  )
  dynamic icon;

  ///Icon color.
  @SupportedPlatforms(
    platforms: [
      AndroidPlatform(),
      IOSPlatform(available: "13.0"),
      MacOSPlatform(),
    ],
  )
  Color_? iconColor;

  ///Item order.
  int? order;

  ///Show this item as a button in the Action Bar.
  bool showAsAction;

  ///Callback function to be invoked when the menu item is clicked
  void Function()? onClick;

  CygnusBrowserMenuItem_({
    required this.id,
    required this.title,
    this.icon,
    this.iconColor,
    this.onClick,
    this.order,
    this.showAsAction = false,
  }) {
    assert(
      this.icon == null ||
          this.icon is Uint8List ||
          this.icon is CygnusUIImage ||
          this.icon is CygnusAndroidResource,
    );
  }
}
