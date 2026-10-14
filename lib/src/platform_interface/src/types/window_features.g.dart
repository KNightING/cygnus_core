// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'window_features.dart';

// **************************************************************************
// ExchangeableObjectGenerator
// **************************************************************************

///Class that specifies optional attributes for the containing window when a new web view is requested.
class CygnusWindowFeatures {
  ///A Boolean value indicating whether the containing window should be resizable, or `null` if resizability is not specified.
  bool? allowsResizing;

  ///A Double value specifying the height of the containing window, or `null` if the height is not specified.
  double? height;

  ///A Boolean value indicating whether the menu bar should be visible, or `null` if menu bar visibility is not specified.
  bool? menuBarVisibility;

  ///A Boolean value indicating whether the status bar should be visible, or `null` if status bar visibility is not specified.
  bool? statusBarVisibility;

  ///A Boolean value indicating whether toolbars should be visible, or `null` if toolbars visibility is not specified.
  bool? toolbarsVisibility;

  ///A Double value specifying the width of the containing window, or `null` if the width is not specified.
  double? width;

  ///A Double value specifying the x-coordinate of the containing window, or `null` if the x-coordinate is not specified.
  double? x;

  ///A Double value specifying the y-coordinate of the containing window, or `null` if the y-coordinate is not specified.
  double? y;
  CygnusWindowFeatures({
    this.allowsResizing,
    this.height,
    this.menuBarVisibility,
    this.statusBarVisibility,
    this.toolbarsVisibility,
    this.width,
    this.x,
    this.y,
  });

  ///Gets a possible [CygnusWindowFeatures] instance from a [Map] value.
  static CygnusWindowFeatures? fromMap(
    Map<String, dynamic>? map, {
    CygnusEnumMethod? enumMethod,
  }) {
    if (map == null) {
      return null;
    }
    final instance = CygnusWindowFeatures(
      allowsResizing: map['allowsResizing'],
      height: map['height'],
      menuBarVisibility: map['menuBarVisibility'],
      statusBarVisibility: map['statusBarVisibility'],
      toolbarsVisibility: map['toolbarsVisibility'],
      width: map['width'],
      x: map['x'],
      y: map['y'],
    );
    return instance;
  }

  ///Converts instance to a map.
  Map<String, dynamic> toMap({CygnusEnumMethod? enumMethod}) {
    return {
      "allowsResizing": allowsResizing,
      "height": height,
      "menuBarVisibility": menuBarVisibility,
      "statusBarVisibility": statusBarVisibility,
      "toolbarsVisibility": toolbarsVisibility,
      "width": width,
      "x": x,
      "y": y,
    };
  }

  ///Converts instance to a map.
  Map<String, dynamic> toJson() {
    return toMap();
  }

  @override
  String toString() {
    return 'CygnusWindowFeatures{allowsResizing: $allowsResizing, height: $height, menuBarVisibility: $menuBarVisibility, statusBarVisibility: $statusBarVisibility, toolbarsVisibility: $toolbarsVisibility, width: $width, x: $x, y: $y}';
  }
}

///An iOS-specific class that specifies optional attributes for the containing window when a new web view is requested.
///Use [CygnusWindowFeatures] instead.
@Deprecated('Use CygnusWindowFeatures instead')
class CygnusIOSWKWindowFeatures {
  ///A Boolean value indicating whether the containing window should be resizable, or `null` if resizability is not specified.
  bool? allowsResizing;

  ///A Double value specifying the height of the containing window, or `null` if the height is not specified.
  double? height;

  ///A Boolean value indicating whether the menu bar should be visible, or `null` if menu bar visibility is not specified.
  bool? menuBarVisibility;

  ///A Boolean value indicating whether the status bar should be visible, or `null` if status bar visibility is not specified.
  bool? statusBarVisibility;

  ///A Boolean value indicating whether toolbars should be visible, or `null` if toolbars visibility is not specified.
  bool? toolbarsVisibility;

  ///A Double value specifying the width of the containing window, or `null` if the width is not specified.
  double? width;

  ///A Double value specifying the x-coordinate of the containing window, or `null` if the x-coordinate is not specified.
  double? x;

  ///A Double value specifying the y-coordinate of the containing window, or `null` if the y-coordinate is not specified.
  double? y;
  CygnusIOSWKWindowFeatures({
    this.allowsResizing,
    this.height,
    this.menuBarVisibility,
    this.statusBarVisibility,
    this.toolbarsVisibility,
    this.width,
    this.x,
    this.y,
  });

  ///Gets a possible [CygnusIOSWKWindowFeatures] instance from a [Map] value.
  static CygnusIOSWKWindowFeatures? fromMap(
    Map<String, dynamic>? map, {
    CygnusEnumMethod? enumMethod,
  }) {
    if (map == null) {
      return null;
    }
    final instance = CygnusIOSWKWindowFeatures(
      allowsResizing: map['allowsResizing'],
      height: map['height'],
      menuBarVisibility: map['menuBarVisibility'],
      statusBarVisibility: map['statusBarVisibility'],
      toolbarsVisibility: map['toolbarsVisibility'],
      width: map['width'],
      x: map['x'],
      y: map['y'],
    );
    return instance;
  }

  ///Converts instance to a map.
  Map<String, dynamic> toMap({CygnusEnumMethod? enumMethod}) {
    return {
      "allowsResizing": allowsResizing,
      "height": height,
      "menuBarVisibility": menuBarVisibility,
      "statusBarVisibility": statusBarVisibility,
      "toolbarsVisibility": toolbarsVisibility,
      "width": width,
      "x": x,
      "y": y,
    };
  }

  ///Converts instance to a map.
  Map<String, dynamic> toJson() {
    return toMap();
  }

  @override
  String toString() {
    return 'CygnusIOSWKWindowFeatures{allowsResizing: $allowsResizing, height: $height, menuBarVisibility: $menuBarVisibility, statusBarVisibility: $statusBarVisibility, toolbarsVisibility: $toolbarsVisibility, width: $width, x: $x, y: $y}';
  }
}
