// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'favicon.dart';

// **************************************************************************
// ExchangeableObjectGenerator
// **************************************************************************

///Class that represents a favicon of a website. It is used by [CygnusPlatformWebViewController.getFavicons] method.
class CygnusFavicon {
  ///The height of the favicon image.
  int? height;

  ///The relationship between the current web page and the favicon image.
  String? rel;

  ///The url of the favicon image.
  CygnusWebUri url;

  ///The width of the favicon image.
  int? width;
  CygnusFavicon({this.height, this.rel, required this.url, this.width});

  ///Gets a possible [CygnusFavicon] instance from a [Map] value.
  static CygnusFavicon? fromMap(
    Map<String, dynamic>? map, {
    CygnusEnumMethod? enumMethod,
  }) {
    if (map == null) {
      return null;
    }
    final instance = CygnusFavicon(
      height: map['height'],
      rel: map['rel'],
      url: CygnusWebUri(map['url']),
      width: map['width'],
    );
    return instance;
  }

  ///Converts instance to a map.
  Map<String, dynamic> toMap({CygnusEnumMethod? enumMethod}) {
    return {
      "height": height,
      "rel": rel,
      "url": url.toString(),
      "width": width,
    };
  }

  ///Converts instance to a map.
  Map<String, dynamic> toJson() {
    return toMap();
  }

  @override
  String toString() {
    return 'CygnusFavicon{height: $height, rel: $rel, url: $url, width: $width}';
  }
}
