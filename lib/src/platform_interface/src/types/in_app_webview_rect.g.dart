// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'in_app_webview_rect.dart';

// **************************************************************************
// ExchangeableObjectGenerator
// **************************************************************************

///A class that represents a structure that contains the location and dimensions of a rectangle.
class CygnusWebViewRect {
  ///rect height
  double height;

  ///rect width
  double width;

  ///x position
  double x;

  ///y position
  double y;
  CygnusWebViewRect({
    required this.x,
    required this.y,
    required this.width,
    required this.height,
  }) {
    assert(this.width >= 0 && this.height >= 0);
  }

  ///Gets a possible [CygnusWebViewRect] instance from a [Map] value.
  static CygnusWebViewRect? fromMap(
    Map<String, dynamic>? map, {
    CygnusEnumMethod? enumMethod,
  }) {
    if (map == null) {
      return null;
    }
    final instance = CygnusWebViewRect(
      height: map['height'],
      width: map['width'],
      x: map['x'],
      y: map['y'],
    );
    return instance;
  }

  ///Converts instance to a map.
  Map<String, dynamic> toMap({CygnusEnumMethod? enumMethod}) {
    return {"height": height, "width": width, "x": x, "y": y};
  }

  ///Converts instance to a map.
  Map<String, dynamic> toJson() {
    return toMap();
  }

  @override
  String toString() {
    return 'CygnusWebViewRect{height: $height, width: $width, x: $x, y: $y}';
  }
}
