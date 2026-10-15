import 'package:cygnus_core_internal_annotations/cygnus_core_internal_annotations.dart';

part 'pdf_toolbar_items.g.dart';

///Class used to customize the PDF toolbar items.
@ExchangeableEnum(bitwiseOrOperator: true)
class CygnusPdfToolbarItems_ {
  // ignore: unused_field
  final int _value;
  const CygnusPdfToolbarItems_._internal(this._value);

  ///No item.
  static const NONE = const CygnusPdfToolbarItems_._internal(0);

  ///The save button.
  static const SAVE = const CygnusPdfToolbarItems_._internal(1);

  ///The print button.
  static const PRINT = const CygnusPdfToolbarItems_._internal(2);

  ///The save as button.
  static const SAVE_AS = const CygnusPdfToolbarItems_._internal(4);

  ///The zoom in button.
  static const ZOOM_IN = const CygnusPdfToolbarItems_._internal(8);

  ///The zoom out button.
  static const ZOOM_OUT = const CygnusPdfToolbarItems_._internal(16);

  ///The rotate button.
  static const ROTATE = const CygnusPdfToolbarItems_._internal(32);

  ///The fit page button.
  static const FIT_PAGE = const CygnusPdfToolbarItems_._internal(64);

  ///The page layout button.
  static const PAGE_LAYOUT = const CygnusPdfToolbarItems_._internal(128);

  ///The bookmarks button.
  static const BOOKMARKS = const CygnusPdfToolbarItems_._internal(256);

  ///The page select button.
  static const PAGE_SELECTOR = const CygnusPdfToolbarItems_._internal(512);

  ///The search button.
  static const SEARCH = const CygnusPdfToolbarItems_._internal(1024);

  ///The full screen button.
  static const FULL_SCREEN = const CygnusPdfToolbarItems_._internal(2048);

  ///The more settings button.
  static const MORE_SETTINGS = const CygnusPdfToolbarItems_._internal(4096);
}
