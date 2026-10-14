import 'package:flutter_inappwebview_internal_annotations/flutter_inappwebview_internal_annotations.dart';

import 'context_menu.dart';
import '../types/enum_method.dart';

part 'context_menu_settings.g.dart';

///Class that represents available settings used by [CygnusContextMenu].
@ExchangeableObject(copyMethod: true)
class CygnusContextMenuSettings_ {
  ///Whether all the default system context menu items should be hidden or not. The default value is `false`.
  bool hideDefaultSystemContextMenuItems;

  CygnusContextMenuSettings_({this.hideDefaultSystemContextMenuItems = false});
}

///Use [CygnusContextMenuSettings] instead.
@Deprecated("Use CygnusContextMenuSettings instead")
@ExchangeableObject(copyMethod: true)
class CygnusContextMenuOptions_ {
  ///Whether all the default system context menu items should be hidden or not. The default value is `false`.
  bool hideDefaultSystemContextMenuItems;

  CygnusContextMenuOptions_({this.hideDefaultSystemContextMenuItems = false});
}
