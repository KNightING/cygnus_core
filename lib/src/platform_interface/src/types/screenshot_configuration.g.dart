// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'screenshot_configuration.dart';

// **************************************************************************
// ExchangeableObjectGenerator
// **************************************************************************

///Class that represents the configuration data to use when generating an image from a web view’s contents using [CygnusPlatformWebViewController.takeScreenshot].
class CygnusScreenshotConfiguration {
  ///A Boolean value that indicates whether to take the snapshot after incorporating any pending screen updates.
  ///The default value of this property is `true`, which causes the web view to incorporate any recent changes to the view’s content and then generate the snapshot.
  ///If you change the value to `false`, the `WebView` takes the snapshot immediately, and before incorporating any new changes.
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- iOS WKWebView 13.0+
  ///- macOS WKWebView 10.15+
  bool afterScreenUpdates;

  ///The compression format of the captured image.
  ///The default value is [CygnusCompressFormat.PNG].
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView
  ///- iOS WKWebView
  ///- macOS WKWebView
  ///- Windows WebView2
  CygnusCompressFormat compressFormat;

  ///Use [afterScreenUpdates] instead.
  @Deprecated('Use afterScreenUpdates instead')
  bool? iosAfterScreenUpdates;

  ///Hint to the compressor, `0-100`. The value is interpreted differently depending on the [CygnusCompressFormat].
  ///[CygnusCompressFormat.PNG] is lossless, so this value is ignored.
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView
  ///- iOS WKWebView
  ///- macOS WKWebView
  ///- Windows WebView2
  int quality;

  ///The portion of your web view to capture, specified as a rectangle in the view’s coordinate system.
  ///The default value of this property is `null`, which captures everything in the view’s bounds rectangle.
  ///If you specify a custom rectangle, it must lie within the bounds rectangle of the `WebView` object.
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView
  ///- iOS WKWebView
  ///- macOS WKWebView
  ///- Windows WebView2
  CygnusWebViewRect? rect;

  ///The width of the captured image, in points.
  ///Use this property to scale the generated image to the specified width.
  ///The web view maintains the aspect ratio of the captured content, but scales it to match the width you specify.
  ///
  ///The default value of this property is `null`, which returns an image whose size matches the original size of the captured rectangle.
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView
  ///- iOS WKWebView
  ///- macOS WKWebView
  double? snapshotWidth;
  CygnusScreenshotConfiguration({
    this.rect,
    this.snapshotWidth,
    CygnusCompressFormat? compressFormat,
    this.quality = 100,
    @Deprecated("Use afterScreenUpdates instead") this.iosAfterScreenUpdates,
    this.afterScreenUpdates = true,
  }) : compressFormat = compressFormat ?? CygnusCompressFormat.PNG {
    assert(this.quality >= 0);
    this.afterScreenUpdates = this.iosAfterScreenUpdates != null
        ? this.iosAfterScreenUpdates!
        : this.afterScreenUpdates;
  }

  ///Gets a possible [CygnusScreenshotConfiguration] instance from a [Map] value.
  static CygnusScreenshotConfiguration? fromMap(
    Map<String, dynamic>? map, {
    CygnusEnumMethod? enumMethod,
  }) {
    if (map == null) {
      return null;
    }
    final instance = CygnusScreenshotConfiguration(
      iosAfterScreenUpdates: map['afterScreenUpdates'],
      rect: CygnusWebViewRect.fromMap(
        map['rect']?.cast<String, dynamic>(),
        enumMethod: enumMethod,
      ),
      snapshotWidth: map['snapshotWidth'],
    );
    if (map['afterScreenUpdates'] != null) {
      instance.afterScreenUpdates = map['afterScreenUpdates'];
    }
    if (map['compressFormat'] != null) {
      instance.compressFormat = switch (enumMethod ??
          CygnusEnumMethod.nativeValue) {
        CygnusEnumMethod.nativeValue => CygnusCompressFormat.fromNativeValue(
          map['compressFormat'],
        ),
        CygnusEnumMethod.value => CygnusCompressFormat.fromValue(
          map['compressFormat'],
        ),
        CygnusEnumMethod.name => CygnusCompressFormat.byName(
          map['compressFormat'],
        ),
      }!;
    }
    if (map['quality'] != null) {
      instance.quality = map['quality'];
    }
    return instance;
  }

  ///Converts instance to a map.
  Map<String, dynamic> toMap({CygnusEnumMethod? enumMethod}) {
    return {
      "afterScreenUpdates": afterScreenUpdates,
      "compressFormat": switch (enumMethod ?? CygnusEnumMethod.nativeValue) {
        CygnusEnumMethod.nativeValue => compressFormat.toNativeValue(),
        CygnusEnumMethod.value => compressFormat.toValue(),
        CygnusEnumMethod.name => compressFormat.name(),
      },
      "quality": quality,
      "rect": rect?.toMap(enumMethod: enumMethod),
      "snapshotWidth": snapshotWidth,
    };
  }

  ///Converts instance to a map.
  Map<String, dynamic> toJson() {
    return toMap();
  }

  @override
  String toString() {
    return 'CygnusScreenshotConfiguration{afterScreenUpdates: $afterScreenUpdates, compressFormat: $compressFormat, quality: $quality, rect: $rect, snapshotWidth: $snapshotWidth}';
  }
}
