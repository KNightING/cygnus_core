import 'package:cygnus_core_internal_annotations/cygnus_core_internal_annotations.dart';

import 'js_prompt_response.dart';

part 'js_prompt_response_action.g.dart';

///Class used by [CygnusJsPromptResponse] class.
@ExchangeableEnum()
class CygnusJsPromptResponseAction_ {
  // ignore: unused_field
  final int _value;
  const CygnusJsPromptResponseAction_._internal(this._value);

  ///Confirm that the user hit confirm button.
  static const CONFIRM = const CygnusJsPromptResponseAction_._internal(0);

  ///Confirm that the user hit cancel button.
  static const CANCEL = const CygnusJsPromptResponseAction_._internal(1);
}
