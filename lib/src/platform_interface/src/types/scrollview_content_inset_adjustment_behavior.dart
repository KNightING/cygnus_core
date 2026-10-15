import 'package:cygnus_core_internal_annotations/cygnus_core_internal_annotations.dart';

part 'scrollview_content_inset_adjustment_behavior.g.dart';

///Class used to configure how safe area insets are added to the adjusted content inset.
@ExchangeableEnum()
class CygnusScrollViewContentInsetAdjustmentBehavior_ {
  // ignore: unused_field
  final int _value;
  const CygnusScrollViewContentInsetAdjustmentBehavior_._internal(this._value);

  ///Automatically adjust the scroll view insets.
  static const AUTOMATIC =
      const CygnusScrollViewContentInsetAdjustmentBehavior_._internal(0);

  ///Adjust the insets only in the scrollable directions.
  static const SCROLLABLE_AXES =
      const CygnusScrollViewContentInsetAdjustmentBehavior_._internal(1);

  ///Do not adjust the scroll view insets.
  static const NEVER =
      const CygnusScrollViewContentInsetAdjustmentBehavior_._internal(2);

  ///Always include the safe area insets in the content adjustment.
  static const ALWAYS =
      const CygnusScrollViewContentInsetAdjustmentBehavior_._internal(3);
}

///An iOS-specific class used to configure how safe area insets are added to the adjusted content inset.
///
///**NOTE**: available on iOS 11.0+.
///
///Use [CygnusScrollViewContentInsetAdjustmentBehavior] instead.
@Deprecated("Use CygnusScrollViewContentInsetAdjustmentBehavior instead")
@ExchangeableEnum()
class CygnusIOSUIScrollViewContentInsetAdjustmentBehavior_ {
  // ignore: unused_field
  final int _value;
  const CygnusIOSUIScrollViewContentInsetAdjustmentBehavior_._internal(this._value);

  ///Automatically adjust the scroll view insets.
  static const AUTOMATIC =
      const CygnusIOSUIScrollViewContentInsetAdjustmentBehavior_._internal(0);

  ///Adjust the insets only in the scrollable directions.
  static const SCROLLABLE_AXES =
      const CygnusIOSUIScrollViewContentInsetAdjustmentBehavior_._internal(1);

  ///Do not adjust the scroll view insets.
  static const NEVER =
      const CygnusIOSUIScrollViewContentInsetAdjustmentBehavior_._internal(2);

  ///Always include the safe area insets in the content adjustment.
  static const ALWAYS =
      const CygnusIOSUIScrollViewContentInsetAdjustmentBehavior_._internal(3);
}
