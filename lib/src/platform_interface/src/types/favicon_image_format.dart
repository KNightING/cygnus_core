import 'package:flutter_inappwebview_internal_annotations/flutter_inappwebview_internal_annotations.dart';

part 'favicon_image_format.g.dart';

///Constants that describe the favicon image format.
@ExchangeableEnum()
class CygnusFaviconImageFormat_ {
  // ignore: unused_field
  final int _value;
  const CygnusFaviconImageFormat_._internal(this._value);

  ///PNG image format.
  static const PNG = CygnusFaviconImageFormat_._internal(0);

  ///JPEG image format.
  static const JPEG = CygnusFaviconImageFormat_._internal(1);
}
