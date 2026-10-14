import 'package:flutter_inappwebview_internal_annotations/flutter_inappwebview_internal_annotations.dart';

part 'vertical_scrollbar_position.g.dart';

///Class used to configure the position of the vertical scroll bar.
@ExchangeableEnum()
class CygnusVerticalScrollbarPosition_ {
  // ignore: unused_field
  final int _value;
  const CygnusVerticalScrollbarPosition_._internal(this._value);

  ///Position the scroll bar at the default position as determined by the system.
  static const SCROLLBAR_POSITION_DEFAULT =
      const CygnusVerticalScrollbarPosition_._internal(0);

  ///Position the scroll bar along the left edge.
  static const SCROLLBAR_POSITION_LEFT =
      const CygnusVerticalScrollbarPosition_._internal(1);

  ///Position the scroll bar along the right edge.
  static const SCROLLBAR_POSITION_RIGHT =
      const CygnusVerticalScrollbarPosition_._internal(2);
}

///An Android-specific class used to configure the position of the vertical scroll bar.
///Use [CygnusVerticalScrollbarPosition] instead.
@Deprecated("Use CygnusVerticalScrollbarPosition instead")
@ExchangeableEnum()
class CygnusAndroidVerticalScrollbarPosition_ {
  // ignore: unused_field
  final int _value;
  const CygnusAndroidVerticalScrollbarPosition_._internal(this._value);

  ///Position the scroll bar at the default position as determined by the system.
  static const SCROLLBAR_POSITION_DEFAULT =
      const CygnusAndroidVerticalScrollbarPosition_._internal(0);

  ///Position the scroll bar along the left edge.
  static const SCROLLBAR_POSITION_LEFT =
      const CygnusAndroidVerticalScrollbarPosition_._internal(1);

  ///Position the scroll bar along the right edge.
  static const SCROLLBAR_POSITION_RIGHT =
      const CygnusAndroidVerticalScrollbarPosition_._internal(2);
}
