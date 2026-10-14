import 'package:flutter_inappwebview_internal_annotations/flutter_inappwebview_internal_annotations.dart';

part 'attributed_string_text_effect_style.g.dart';

///Class that represents the supported proxy types.
@ExchangeableEnum()
class CygnusAttributedStringTextEffectStyle_ {
  // ignore: unused_field
  final String _value;
  const CygnusAttributedStringTextEffectStyle_._internal(this._value);

  ///A graphical text effect that gives glyphs the appearance of letterpress printing, which involves pressing the type into the paper.
  static const LETTERPRESS_STYLE =
      const CygnusAttributedStringTextEffectStyle_._internal("letterpressStyle");
}

///An iOS-specific Class that represents the supported proxy types.
///Use [CygnusAttributedStringTextEffectStyle] instead.
@Deprecated("Use CygnusAttributedStringTextEffectStyle instead")
@ExchangeableEnum()
class CygnusIOSNSAttributedStringTextEffectStyle_ {
  // ignore: unused_field
  final String _value;
  const CygnusIOSNSAttributedStringTextEffectStyle_._internal(this._value);

  ///A graphical text effect that gives glyphs the appearance of letterpress printing, which involves pressing the type into the paper.
  static const LETTERPRESS_STYLE =
      const CygnusIOSNSAttributedStringTextEffectStyle_._internal("letterpressStyle");
}
