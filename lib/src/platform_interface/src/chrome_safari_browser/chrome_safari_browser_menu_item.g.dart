// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chrome_safari_browser_menu_item.dart';

// **************************************************************************
// ExchangeableObjectGenerator
// **************************************************************************

///Class that represents a custom menu item for a [CygnusPlatformChromeSafariBrowser] instance.
///
///**Officially Supported Platforms/Implementations**:
///- Android WebView:
///    - Not available in an Android Trusted Web Activity.
///- iOS WKWebView
class CygnusChromeSafariBrowserMenuItem {
  ///Use onClick instead.
  @Deprecated('Use onClick instead')
  void Function(String, String)? action;

  ///The menu item id. It should be different from [CygnusChromeSafariBrowserActionButton.id].
  int id;

  ///Item image.
  CygnusUIImage? image;

  ///The label of the menu item.
  String label;

  ///Callback function to be invoked when the menu item is clicked
  void Function(CygnusWebUri?, String)? onClick;

  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView:
  ///    - Not available in an Android Trusted Web Activity.
  ///- iOS WKWebView
  CygnusChromeSafariBrowserMenuItem({
    required this.id,
    required this.label,
    this.image,
    @Deprecated("Use onClick instead") this.action,
    this.onClick,
  });

  ///Gets a possible [CygnusChromeSafariBrowserMenuItem] instance from a [Map] value.
  static CygnusChromeSafariBrowserMenuItem? fromMap(
    Map<String, dynamic>? map, {
    CygnusEnumMethod? enumMethod,
  }) {
    if (map == null) {
      return null;
    }
    final instance = CygnusChromeSafariBrowserMenuItem(
      id: map['id'],
      image: CygnusUIImage.fromMap(
        map['image']?.cast<String, dynamic>(),
        enumMethod: enumMethod,
      ),
      label: map['label'],
    );
    return instance;
  }

  ///Converts instance to a map.
  Map<String, dynamic> toMap({CygnusEnumMethod? enumMethod}) {
    return {
      "id": id,
      "image": image?.toMap(enumMethod: enumMethod),
      "label": label,
    };
  }

  ///Converts instance to a map.
  Map<String, dynamic> toJson() {
    return toMap();
  }

  @override
  String toString() {
    return 'CygnusChromeSafariBrowserMenuItem{id: $id, image: $image, label: $label}';
  }
}
