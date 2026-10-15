import 'package:cygnus_core_internal_annotations/cygnus_core_internal_annotations.dart';

part 'save_as_kind.g.dart';

///Constants that describe the Save As kind.
@ExchangeableEnum()
class CygnusSaveAsKind_ {
  // ignore: unused_field
  final int _value;
  const CygnusSaveAsKind_._internal(this._value);

  ///Default kind to save non-HTML content.
  static const DEFAULT = CygnusSaveAsKind_._internal(0);

  ///Save the page as HTML only.
  static const HTML_ONLY = CygnusSaveAsKind_._internal(1);

  ///Save the page as a single file (MHTML).
  static const SINGLE_FILE = CygnusSaveAsKind_._internal(2);

  ///Save the page with a resources directory.
  static const COMPLETE = CygnusSaveAsKind_._internal(3);
}
