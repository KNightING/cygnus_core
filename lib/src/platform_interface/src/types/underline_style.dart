import 'package:flutter_inappwebview_internal_annotations/flutter_inappwebview_internal_annotations.dart';

part 'underline_style.g.dart';

///Class that represents the constants for the underline style and strikethrough style attribute keys.
@ExchangeableEnum()
class CygnusUnderlineStyle_ {
  // ignore: unused_field
  final int _value;
  const CygnusUnderlineStyle_._internal(this._value);

  ///Do not draw a line.
  static const STYLE_NONE = const CygnusUnderlineStyle_._internal(0);

  ///Draw a single line.
  static const SINGLE = const CygnusUnderlineStyle_._internal(1);

  ///Draw a thick line.
  static const THICK = const CygnusUnderlineStyle_._internal(2);

  ///Draw a double line.
  static const DOUBLE = const CygnusUnderlineStyle_._internal(9);

  ///Draw a line of dots.
  static const PATTERN_DOT = const CygnusUnderlineStyle_._internal(256);

  ///Draw a line of dashes.
  static const PATTERN_DASH = const CygnusUnderlineStyle_._internal(512);

  ///Draw a line of alternating dashes and dots.
  static const PATTERN_DASH_DOT = const CygnusUnderlineStyle_._internal(768);

  ///Draw a line of alternating dashes and two dots.
  static const PATTERN_DASH_DOT_DOT = const CygnusUnderlineStyle_._internal(1024);

  ///Draw the line only beneath or through words, not whitespace.
  static const BY_WORD = const CygnusUnderlineStyle_._internal(32768);
}

///An iOS-specific Class that represents the constants for the underline style and strikethrough style attribute keys.
///Use [CygnusUnderlineStyle] instead.
@Deprecated("Use CygnusUnderlineStyle instead")
@ExchangeableEnum()
class CygnusIOSNSUnderlineStyle_ {
  // ignore: unused_field
  final int _value;
  const CygnusIOSNSUnderlineStyle_._internal(this._value);

  ///Do not draw a line.
  static const STYLE_NONE = const CygnusIOSNSUnderlineStyle_._internal(0);

  ///Draw a single line.
  static const SINGLE = const CygnusIOSNSUnderlineStyle_._internal(1);

  ///Draw a thick line.
  static const THICK = const CygnusIOSNSUnderlineStyle_._internal(2);

  ///Draw a double line.
  static const DOUBLE = const CygnusIOSNSUnderlineStyle_._internal(9);

  ///Draw a line of dots.
  static const PATTERN_DOT = const CygnusIOSNSUnderlineStyle_._internal(256);

  ///Draw a line of dashes.
  static const PATTERN_DASH = const CygnusIOSNSUnderlineStyle_._internal(512);

  ///Draw a line of alternating dashes and dots.
  static const PATTERN_DASH_DOT = const CygnusIOSNSUnderlineStyle_._internal(768);

  ///Draw a line of alternating dashes and two dots.
  static const PATTERN_DASH_DOT_DOT = const CygnusIOSNSUnderlineStyle_._internal(
    1024,
  );

  ///Draw the line only beneath or through words, not whitespace.
  static const BY_WORD = const CygnusIOSNSUnderlineStyle_._internal(32768);
}
