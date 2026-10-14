import 'package:flutter_inappwebview_internal_annotations/flutter_inappwebview_internal_annotations.dart';

part 'webview_hit_test_result_type.g.dart';

///Class representing the [CygnusWebViewHitTestResult] type.
@ExchangeableEnum()
class CygnusWebViewHitTestResultType_ {
  // ignore: unused_field
  final int _value;
  const CygnusWebViewHitTestResultType_._internal(this._value);

  ///Default [CygnusWebViewHitTestResult], where the target is unknown.
  static const UNKNOWN_TYPE = const CygnusWebViewHitTestResultType_._internal(0);

  ///[CygnusWebViewHitTestResult] for hitting a phone number.
  static const PHONE_TYPE = const CygnusWebViewHitTestResultType_._internal(2);

  ///[CygnusWebViewHitTestResult] for hitting a map address.
  static const GEO_TYPE = const CygnusWebViewHitTestResultType_._internal(3);

  ///[CygnusWebViewHitTestResult] for hitting an email address.
  static const EMAIL_TYPE = const CygnusWebViewHitTestResultType_._internal(4);

  ///[CygnusWebViewHitTestResult] for hitting an HTML::img tag.
  static const IMAGE_TYPE = const CygnusWebViewHitTestResultType_._internal(5);

  ///[CygnusWebViewHitTestResult] for hitting a HTML::a tag with src=http.
  static const SRC_ANCHOR_TYPE = const CygnusWebViewHitTestResultType_._internal(
    7,
  );

  ///[CygnusWebViewHitTestResult] for hitting a HTML::a tag with src=http + HTML::img.
  static const SRC_IMAGE_ANCHOR_TYPE =
      const CygnusWebViewHitTestResultType_._internal(8);

  ///[CygnusWebViewHitTestResult] for hitting an edit text area.
  static const EDIT_TEXT_TYPE = const CygnusWebViewHitTestResultType_._internal(
    9,
  );
}
