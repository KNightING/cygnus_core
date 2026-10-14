// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pdf_configuration.dart';

// **************************************************************************
// ExchangeableObjectGenerator
// **************************************************************************

///Class that represents the configuration data to use when generating a PDF representation of a web view's contents.
class CygnusPDFConfiguration {
  ///The portion of your web view to capture, specified as a rectangle in the view's coordinate system.
  ///The default value of this property is `null`, which captures everything in the view's bounds rectangle.
  ///If you specify a custom rectangle, it must lie within the bounds rectangle of the `WebView` object.
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- iOS WKWebView
  ///- macOS WKWebView
  CygnusWebViewRect? rect;

  ///The print settings to use when generating the PDF.
  ///These settings control page size, orientation, margins, and other printing options.
  ///If not specified, default print settings will be used.
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Windows WebView2
  CygnusPrintJobSettings? settings;
  CygnusPDFConfiguration({this.rect, this.settings});

  ///Gets a possible [CygnusPDFConfiguration] instance from a [Map] value.
  static CygnusPDFConfiguration? fromMap(
    Map<String, dynamic>? map, {
    CygnusEnumMethod? enumMethod,
  }) {
    if (map == null) {
      return null;
    }
    final instance = CygnusPDFConfiguration(
      rect: CygnusWebViewRect.fromMap(
        map['rect']?.cast<String, dynamic>(),
        enumMethod: enumMethod,
      ),
      settings: CygnusPrintJobSettings.fromMap(
        map['settings']?.cast<String, dynamic>(),
        enumMethod: enumMethod,
      ),
    );
    return instance;
  }

  ///Converts instance to a map.
  Map<String, dynamic> toMap({CygnusEnumMethod? enumMethod}) {
    return {
      "rect": rect?.toMap(enumMethod: enumMethod),
      "settings": settings?.toMap(enumMethod: enumMethod),
    };
  }

  ///Converts instance to a map.
  Map<String, dynamic> toJson() {
    return toMap();
  }

  @override
  String toString() {
    return 'CygnusPDFConfiguration{rect: $rect, settings: $settings}';
  }
}

///An iOS-specific class that represents the configuration data to use when generating a PDF representation of a web view’s contents.
///
///**NOTE**: available on iOS 14.0+.
///
///Use [CygnusPDFConfiguration] instead.
@Deprecated('Use CygnusPDFConfiguration instead')
class CygnusIOSWKPDFConfiguration {
  ///The portion of your web view to capture, specified as a rectangle in the view’s coordinate system.
  ///The default value of this property is `null`, which captures everything in the view’s bounds rectangle.
  ///If you specify a custom rectangle, it must lie within the bounds rectangle of the `WebView` object.
  CygnusWebViewRect? rect;
  CygnusIOSWKPDFConfiguration({this.rect});

  ///Gets a possible [CygnusIOSWKPDFConfiguration] instance from a [Map] value.
  static CygnusIOSWKPDFConfiguration? fromMap(
    Map<String, dynamic>? map, {
    CygnusEnumMethod? enumMethod,
  }) {
    if (map == null) {
      return null;
    }
    final instance = CygnusIOSWKPDFConfiguration(
      rect: CygnusWebViewRect.fromMap(
        map['rect']?.cast<String, dynamic>(),
        enumMethod: enumMethod,
      ),
    );
    return instance;
  }

  ///Converts instance to a map.
  Map<String, dynamic> toMap({CygnusEnumMethod? enumMethod}) {
    return {"rect": rect?.toMap(enumMethod: enumMethod)};
  }

  ///Converts instance to a map.
  Map<String, dynamic> toJson() {
    return toMap();
  }

  @override
  String toString() {
    return 'CygnusIOSWKPDFConfiguration{rect: $rect}';
  }
}
