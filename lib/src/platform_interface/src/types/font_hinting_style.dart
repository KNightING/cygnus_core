import 'package:flutter_inappwebview_internal_annotations/flutter_inappwebview_internal_annotations.dart';

part 'font_hinting_style.g.dart';

///Font hinting style used for text rendering on Linux.
@ExchangeableEnum()
class CygnusFontHintingStyle_ {
  // ignore: unused_field
  final int _value;
  const CygnusFontHintingStyle_._internal(this._value);

  ///No hinting. Text is rendered without any hinting.
  static const NONE = const CygnusFontHintingStyle_._internal(0);

  ///Slight hinting. A minimal amount of hinting is applied.
  static const SLIGHT = const CygnusFontHintingStyle_._internal(1);

  ///Medium hinting. A moderate amount of hinting is applied.
  static const MEDIUM = const CygnusFontHintingStyle_._internal(2);

  ///Full hinting. Maximum hinting is applied for crispest text.
  static const FULL = const CygnusFontHintingStyle_._internal(3);
}
