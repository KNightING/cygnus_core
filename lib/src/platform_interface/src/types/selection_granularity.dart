import 'package:cygnus_core_internal_annotations/cygnus_core_internal_annotations.dart';

part 'selection_granularity.g.dart';

///Class used to set the level of granularity with which the user can interactively select content in the web view.
@ExchangeableEnum()
class CygnusSelectionGranularity_ {
  // ignore: unused_field
  final int _value;
  const CygnusSelectionGranularity_._internal(this._value);

  ///Selection granularity varies automatically based on the selection.
  static const DYNAMIC = const CygnusSelectionGranularity_._internal(0);

  ///Selection endpoints can be placed at any character boundary.
  static const CHARACTER = const CygnusSelectionGranularity_._internal(1);
}

///An iOS-specific class used to set the level of granularity with which the user can interactively select content in the web view.
///Use [CygnusSelectionGranularity] instead.
@Deprecated("Use CygnusSelectionGranularity instead")
@ExchangeableEnum()
class CygnusIOSWKSelectionGranularity_ {
  // ignore: unused_field
  final int _value;
  const CygnusIOSWKSelectionGranularity_._internal(this._value);

  ///Selection granularity varies automatically based on the selection.
  static const DYNAMIC = const CygnusIOSWKSelectionGranularity_._internal(0);

  ///Selection endpoints can be placed at any character boundary.
  static const CHARACTER = const CygnusIOSWKSelectionGranularity_._internal(1);
}
