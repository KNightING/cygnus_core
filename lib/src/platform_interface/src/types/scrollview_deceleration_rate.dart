import 'package:flutter_inappwebview_internal_annotations/flutter_inappwebview_internal_annotations.dart';

part 'scrollview_deceleration_rate.g.dart';

///Class that represents a floating-point value that determines the rate of deceleration after the user lifts their finger.
@ExchangeableEnum()
class CygnusScrollViewDecelerationRate_ {
  // ignore: unused_field
  final String _value;
  const CygnusScrollViewDecelerationRate_._internal(this._value);

  ///The default deceleration rate for a scroll view: `0.998`.
  static const NORMAL = const CygnusScrollViewDecelerationRate_._internal("NORMAL");

  ///A fast deceleration rate for a scroll view: `0.99`.
  static const FAST = const CygnusScrollViewDecelerationRate_._internal("FAST");
}

///Class that represents a floating-point value that determines the rate of deceleration after the user lifts their finger.
///Use [CygnusScrollViewDecelerationRate] instead.
@Deprecated("Use CygnusScrollViewDecelerationRate instead")
@ExchangeableEnum()
class CygnusIOSUIScrollViewDecelerationRate_ {
  // ignore: unused_field
  final String _value;
  const CygnusIOSUIScrollViewDecelerationRate_._internal(this._value);

  ///The default deceleration rate for a scroll view: `0.998`.
  static const NORMAL = const CygnusIOSUIScrollViewDecelerationRate_._internal(
    "NORMAL",
  );

  ///A fast deceleration rate for a scroll view: `0.99`.
  static const FAST = const CygnusIOSUIScrollViewDecelerationRate_._internal("FAST");
}
