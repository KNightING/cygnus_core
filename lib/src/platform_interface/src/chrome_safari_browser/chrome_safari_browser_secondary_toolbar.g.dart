// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chrome_safari_browser_secondary_toolbar.dart';

// **************************************************************************
// ExchangeableObjectGenerator
// **************************************************************************

///Class that represents the [RemoteViews](https://developer.android.com/reference/android/widget/RemoteViews.html)
///that will be shown on the secondary toolbar of a custom tab.
///
///This class describes a view hierarchy that can be displayed in another process.
///The hierarchy is inflated from an Android layout resource file.
///
///RemoteViews has limited to support to Android layouts.
///Check the [RemoteViews Official API](https://developer.android.com/reference/android/widget/RemoteViews.html) for more details.
///
///**Officially Supported Platforms/Implementations**:
///- Android WebView:
///    - Not available in an Android Trusted Web Activity.
class CygnusChromeSafariBrowserSecondaryToolbar {
  ///The IDs of clickable views. The `onClick` event of these views will be handled by custom tabs.
  List<CygnusChromeSafariBrowserSecondaryToolbarClickableID> clickableIDs;

  ///The android layout resource.
  CygnusAndroidResource layout;

  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView:
  ///    - Not available in an Android Trusted Web Activity.
  CygnusChromeSafariBrowserSecondaryToolbar({
    this.clickableIDs = const [],
    required this.layout,
  });

  ///Gets a possible [CygnusChromeSafariBrowserSecondaryToolbar] instance from a [Map] value.
  static CygnusChromeSafariBrowserSecondaryToolbar? fromMap(
    Map<String, dynamic>? map, {
    CygnusEnumMethod? enumMethod,
  }) {
    if (map == null) {
      return null;
    }
    final instance = CygnusChromeSafariBrowserSecondaryToolbar(
      layout: CygnusAndroidResource.fromMap(
        map['layout']?.cast<String, dynamic>(),
        enumMethod: enumMethod,
      )!,
    );
    if (map['clickableIDs'] != null) {
      instance.clickableIDs =
          List<CygnusChromeSafariBrowserSecondaryToolbarClickableID>.from(
            map['clickableIDs'].map(
              (e) =>
                  CygnusChromeSafariBrowserSecondaryToolbarClickableID.fromMap(
                    e?.cast<String, dynamic>(),
                    enumMethod: enumMethod,
                  )!,
            ),
          );
    }
    return instance;
  }

  ///Converts instance to a map.
  Map<String, dynamic> toMap({CygnusEnumMethod? enumMethod}) {
    return {
      "clickableIDs": clickableIDs
          .map((e) => e.toMap(enumMethod: enumMethod))
          .toList(),
      "layout": layout.toMap(enumMethod: enumMethod),
    };
  }

  ///Converts instance to a map.
  Map<String, dynamic> toJson() {
    return toMap();
  }

  @override
  String toString() {
    return 'CygnusChromeSafariBrowserSecondaryToolbar{clickableIDs: $clickableIDs, layout: $layout}';
  }
}

///Class that represents a clickable ID item of the secondary toolbar for a [CygnusPlatformChromeSafariBrowser] instance.
///
///**Officially Supported Platforms/Implementations**:
///- Android WebView:
///    - Not available in an Android Trusted Web Activity.
class CygnusChromeSafariBrowserSecondaryToolbarClickableID {
  ///The android id resource
  CygnusAndroidResource id;

  ///Callback function to be invoked when the item is clicked
  void Function(CygnusWebUri?)? onClick;

  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView:
  ///    - Not available in an Android Trusted Web Activity.
  CygnusChromeSafariBrowserSecondaryToolbarClickableID({
    required this.id,
    this.onClick,
  });

  ///Gets a possible [CygnusChromeSafariBrowserSecondaryToolbarClickableID] instance from a [Map] value.
  static CygnusChromeSafariBrowserSecondaryToolbarClickableID? fromMap(
    Map<String, dynamic>? map, {
    CygnusEnumMethod? enumMethod,
  }) {
    if (map == null) {
      return null;
    }
    final instance = CygnusChromeSafariBrowserSecondaryToolbarClickableID(
      id: CygnusAndroidResource.fromMap(
        map['id']?.cast<String, dynamic>(),
        enumMethod: enumMethod,
      )!,
    );
    return instance;
  }

  ///Converts instance to a map.
  Map<String, dynamic> toMap({CygnusEnumMethod? enumMethod}) {
    return {"id": id.toMap(enumMethod: enumMethod)};
  }

  ///Converts instance to a map.
  Map<String, dynamic> toJson() {
    return toMap();
  }

  @override
  String toString() {
    return 'CygnusChromeSafariBrowserSecondaryToolbarClickableID{id: $id}';
  }
}
