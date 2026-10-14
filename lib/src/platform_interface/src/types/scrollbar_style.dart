import 'package:flutter_inappwebview_internal_annotations/flutter_inappwebview_internal_annotations.dart';

part 'scrollbar_style.g.dart';

///Class used to configure the style of the scrollbars.
///The scrollbars can be overlaid or inset.
///When inset, they add to the padding of the view. And the scrollbars can be drawn inside the padding area or on the edge of the view.
///For example, if a view has a background drawable and you want to draw the scrollbars inside the padding specified by the drawable,
///you can use [CygnusScrollBarStyle.SCROLLBARS_INSIDE_OVERLAY] or [CygnusScrollBarStyle.SCROLLBARS_INSIDE_INSET].
///If you want them to appear at the edge of the view, ignoring the padding,
///then you can use [CygnusScrollBarStyle.SCROLLBARS_OUTSIDE_OVERLAY] or [CygnusScrollBarStyle.SCROLLBARS_OUTSIDE_INSET].
@ExchangeableEnum()
class CygnusScrollBarStyle_ {
  // ignore: unused_field
  final int _value;
  const CygnusScrollBarStyle_._internal(this._value);

  ///The scrollbar style to display the scrollbars inside the content area, without increasing the padding.
  ///The scrollbars will be overlaid with translucency on the view's content.
  static const SCROLLBARS_INSIDE_OVERLAY = const CygnusScrollBarStyle_._internal(0);

  ///The scrollbar style to display the scrollbars inside the padded area, increasing the padding of the view.
  ///The scrollbars will not overlap the content area of the view.
  static const SCROLLBARS_INSIDE_INSET = const CygnusScrollBarStyle_._internal(
    16777216,
  );

  ///The scrollbar style to display the scrollbars at the edge of the view, without increasing the padding.
  ///The scrollbars will be overlaid with translucency.
  static const SCROLLBARS_OUTSIDE_OVERLAY = const CygnusScrollBarStyle_._internal(
    33554432,
  );

  ///The scrollbar style to display the scrollbars at the edge of the view, increasing the padding of the view.
  ///The scrollbars will only overlap the background, if any.
  static const SCROLLBARS_OUTSIDE_INSET = const CygnusScrollBarStyle_._internal(
    50331648,
  );
}

///An Android-specific class used to configure the style of the scrollbars.
///The scrollbars can be overlaid or inset.
///When inset, they add to the padding of the view. And the scrollbars can be drawn inside the padding area or on the edge of the view.
///For example, if a view has a background drawable and you want to draw the scrollbars inside the padding specified by the drawable,
///you can use [CygnusAndroidScrollBarStyle.SCROLLBARS_INSIDE_OVERLAY] or [CygnusAndroidScrollBarStyle.SCROLLBARS_INSIDE_INSET].
///If you want them to appear at the edge of the view, ignoring the padding,
///then you can use [CygnusAndroidScrollBarStyle.SCROLLBARS_OUTSIDE_OVERLAY] or [CygnusAndroidScrollBarStyle.SCROLLBARS_OUTSIDE_INSET].
///
///Use [CygnusScrollBarStyle] instead.
@Deprecated("Use CygnusScrollBarStyle instead")
@ExchangeableEnum()
class CygnusAndroidScrollBarStyle_ {
  // ignore: unused_field
  final int _value;
  const CygnusAndroidScrollBarStyle_._internal(this._value);

  ///The scrollbar style to display the scrollbars inside the content area, without increasing the padding.
  ///The scrollbars will be overlaid with translucency on the view's content.
  static const SCROLLBARS_INSIDE_OVERLAY =
      const CygnusAndroidScrollBarStyle_._internal(0);

  ///The scrollbar style to display the scrollbars inside the padded area, increasing the padding of the view.
  ///The scrollbars will not overlap the content area of the view.
  static const SCROLLBARS_INSIDE_INSET = const CygnusAndroidScrollBarStyle_._internal(
    16777216,
  );

  ///The scrollbar style to display the scrollbars at the edge of the view, without increasing the padding.
  ///The scrollbars will be overlaid with translucency.
  static const SCROLLBARS_OUTSIDE_OVERLAY =
      const CygnusAndroidScrollBarStyle_._internal(33554432);

  ///The scrollbar style to display the scrollbars at the edge of the view, increasing the padding of the view.
  ///The scrollbars will only overlap the background, if any.
  static const SCROLLBARS_OUTSIDE_INSET =
      const CygnusAndroidScrollBarStyle_._internal(50331648);
}
