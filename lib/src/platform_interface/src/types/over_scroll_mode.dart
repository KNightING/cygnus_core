import 'package:flutter_inappwebview_internal_annotations/flutter_inappwebview_internal_annotations.dart';

part 'over_scroll_mode.g.dart';

///Class used to configure the `WebView`'s over-scroll mode.
///Setting the over-scroll mode of a WebView will have an effect only if the `WebView` is capable of scrolling.
@ExchangeableEnum()
class CygnusOverScrollMode_ {
  // ignore: unused_field
  final int _value;
  const CygnusOverScrollMode_._internal(this._value);

  ///Always allow a user to over-scroll this view, provided it is a view that can scroll.
  static const ALWAYS = const CygnusOverScrollMode_._internal(0);

  ///Allow a user to over-scroll this view only if the content is large enough to meaningfully scroll, provided it is a view that can scroll.
  static const IF_CONTENT_SCROLLS = const CygnusOverScrollMode_._internal(1);

  ///Never allow a user to over-scroll this view.
  static const NEVER = const CygnusOverScrollMode_._internal(2);
}

///An Android-specific class used to configure the `WebView`'s over-scroll mode.
///Setting the over-scroll mode of a WebView will have an effect only if the `WebView` is capable of scrolling.
///Use [CygnusOverScrollMode] instead.
@Deprecated("Use CygnusOverScrollMode instead")
@ExchangeableEnum()
class CygnusAndroidOverScrollMode_ {
  // ignore: unused_field
  final int _value;
  const CygnusAndroidOverScrollMode_._internal(this._value);

  ///Always allow a user to over-scroll this view, provided it is a view that can scroll.
  static const OVER_SCROLL_ALWAYS = const CygnusAndroidOverScrollMode_._internal(0);

  ///Allow a user to over-scroll this view only if the content is large enough to meaningfully scroll, provided it is a view that can scroll.
  static const OVER_SCROLL_IF_CONTENT_SCROLLS =
      const CygnusAndroidOverScrollMode_._internal(1);

  ///Never allow a user to over-scroll this view.
  static const OVER_SCROLL_NEVER = const CygnusAndroidOverScrollMode_._internal(2);
}
