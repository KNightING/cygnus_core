import 'package:cygnus_core_internal_annotations/cygnus_core_internal_annotations.dart';

part 'search_result_display_style.g.dart';

///Constants that describe the results summary the find panel UI includes.
@ExchangeableEnum()
class CygnusSearchResultDisplayStyle_ {
  // ignore: unused_field
  final int _value;
  const CygnusSearchResultDisplayStyle_._internal(this._value);

  ///The find panel includes the total number of results the session reports and the index of the target result.
  static const CURRENT_AND_TOTAL = const CygnusSearchResultDisplayStyle_._internal(0);

  ///The find panel includes the total number of results the session reports.
  static const TOTAL = const CygnusSearchResultDisplayStyle_._internal(1);

  ///The find panel doesn’t include the number of results the session reports.
  static const NONE = const CygnusSearchResultDisplayStyle_._internal(2);
}
