import 'package:cygnus_core_internal_annotations/cygnus_core_internal_annotations.dart';

import 'web_history_item.dart';
import 'enum_method.dart';

part 'web_history.g.dart';

///This class contains a snapshot of the current back/forward list for a `WebView`.
@ExchangeableObject()
class CygnusWebHistory_ {
  ///List of all [CygnusWebHistoryItem]s.
  List<CygnusWebHistoryItem_>? list;

  ///Index of the current [CygnusWebHistoryItem].
  int? currentIndex;

  CygnusWebHistory_({this.list, this.currentIndex});
}
