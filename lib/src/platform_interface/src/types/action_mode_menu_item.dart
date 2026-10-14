import 'package:flutter_inappwebview_internal_annotations/flutter_inappwebview_internal_annotations.dart';

part 'action_mode_menu_item.g.dart';

///Class used to disable the action mode menu items.
@ExchangeableEnum(bitwiseOrOperator: true)
class CygnusActionModeMenuItem_ {
  // ignore: unused_field
  final int _value;
  const CygnusActionModeMenuItem_._internal(this._value);

  ///No menu items should be disabled.
  static const MENU_ITEM_NONE = CygnusActionModeMenuItem_._internal(0);

  ///Disable menu item "Share".
  static const MENU_ITEM_SHARE = CygnusActionModeMenuItem_._internal(1);

  ///Disable menu item "Web Search".
  static const MENU_ITEM_WEB_SEARCH = CygnusActionModeMenuItem_._internal(2);

  ///Disable all the action mode menu items for text processing.
  static const MENU_ITEM_PROCESS_TEXT = CygnusActionModeMenuItem_._internal(4);
}

///An Android-specific class used to disable the action mode menu items.
///
///**NOTE**: available on Android 24+.
///
///Use [CygnusActionModeMenuItem] instead.
@Deprecated("Use CygnusActionModeMenuItem instead")
@ExchangeableEnum(bitwiseOrOperator: true)
class CygnusAndroidActionModeMenuItem_ {
  // ignore: unused_field
  final int _value;
  const CygnusAndroidActionModeMenuItem_._internal(this._value);

  ///No menu items should be disabled.
  static const MENU_ITEM_NONE = const CygnusAndroidActionModeMenuItem_._internal(0);

  ///Disable menu item "Share".
  static const MENU_ITEM_SHARE = const CygnusAndroidActionModeMenuItem_._internal(1);

  ///Disable menu item "Web Search".
  static const MENU_ITEM_WEB_SEARCH =
      const CygnusAndroidActionModeMenuItem_._internal(2);

  ///Disable all the action mode menu items for text processing.
  static const MENU_ITEM_PROCESS_TEXT =
      const CygnusAndroidActionModeMenuItem_._internal(4);
}
