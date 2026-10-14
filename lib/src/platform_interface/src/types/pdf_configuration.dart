import 'package:flutter_inappwebview_internal_annotations/flutter_inappwebview_internal_annotations.dart';

import 'webview_rect.dart';
import 'enum_method.dart';
import '../print_job/print_job_settings.dart';

part 'pdf_configuration.g.dart';

///Class that represents the configuration data to use when generating a PDF representation of a web view's contents.
@ExchangeableObject()
class CygnusPDFConfiguration_ {
  ///The portion of your web view to capture, specified as a rectangle in the view's coordinate system.
  ///The default value of this property is `null`, which captures everything in the view's bounds rectangle.
  ///If you specify a custom rectangle, it must lie within the bounds rectangle of the `WebView` object.
  @SupportedPlatforms(platforms: [IOSPlatform(), MacOSPlatform()])
  CygnusWebViewRect_? rect;

  ///The print settings to use when generating the PDF.
  ///These settings control page size, orientation, margins, and other printing options.
  ///If not specified, default print settings will be used.
  @SupportedPlatforms(platforms: [WindowsPlatform()])
  CygnusPrintJobSettings_? settings;

  CygnusPDFConfiguration_({this.rect, this.settings});
}

///An iOS-specific class that represents the configuration data to use when generating a PDF representation of a web view’s contents.
///
///**NOTE**: available on iOS 14.0+.
///
///Use [CygnusPDFConfiguration] instead.
@Deprecated("Use CygnusPDFConfiguration instead")
@ExchangeableObject()
class CygnusIOSWKPDFConfiguration_ {
  ///The portion of your web view to capture, specified as a rectangle in the view’s coordinate system.
  ///The default value of this property is `null`, which captures everything in the view’s bounds rectangle.
  ///If you specify a custom rectangle, it must lie within the bounds rectangle of the `WebView` object.
  CygnusWebViewRect_? rect;

  CygnusIOSWKPDFConfiguration_({this.rect});
}
