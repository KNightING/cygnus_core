import 'package:flutter_inappwebview_internal_annotations/flutter_inappwebview_internal_annotations.dart';

part 'dismiss_button_style.g.dart';

///Class used to set the custom style for the dismiss button.
@ExchangeableEnum()
class CygnusDismissButtonStyle_ {
  // ignore: unused_field
  final int _value;
  const CygnusDismissButtonStyle_._internal(this._value);

  ///Makes the button title the localized string "Done".
  static const DONE = const CygnusDismissButtonStyle_._internal(0);

  ///Makes the button title the localized string "Close".
  static const CLOSE = const CygnusDismissButtonStyle_._internal(1);

  ///Makes the button title the localized string "Cancel".
  static const CANCEL = const CygnusDismissButtonStyle_._internal(2);
}

///An iOS-specific class used to set the custom style for the dismiss button.
///
///**NOTE**: available on iOS 11.0+.
///
///Use [CygnusDismissButtonStyle] instead.
@Deprecated("Use CygnusDismissButtonStyle instead")
@ExchangeableEnum()
class CygnusIOSSafariDismissButtonStyle_ {
  // ignore: unused_field
  final int _value;
  const CygnusIOSSafariDismissButtonStyle_._internal(this._value);

  ///Makes the button title the localized string "Done".
  static const DONE = const CygnusIOSSafariDismissButtonStyle_._internal(0);

  ///Makes the button title the localized string "Close".
  static const CLOSE = const CygnusIOSSafariDismissButtonStyle_._internal(1);

  ///Makes the button title the localized string "Cancel".
  static const CANCEL = const CygnusIOSSafariDismissButtonStyle_._internal(2);
}
