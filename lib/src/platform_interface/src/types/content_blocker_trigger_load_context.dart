import 'package:cygnus_core_internal_annotations/cygnus_core_internal_annotations.dart';

import '../content_blocker.dart';

part 'content_blocker_trigger_load_context.g.dart';

///Class that represents the kind of load context that can be used with a [CygnusContentBlockerTrigger].
@ExchangeableEnum()
class CygnusContentBlockerTriggerLoadContext_ {
  // ignore: unused_field
  final String _value;

  const CygnusContentBlockerTriggerLoadContext_._internal(this._value);

  ///Top frame load context
  static const TOP_FRAME = const CygnusContentBlockerTriggerLoadContext_._internal(
    'top-frame',
  );

  ///Child frame load context
  static const CHILD_FRAME = const CygnusContentBlockerTriggerLoadContext_._internal(
    'child-frame',
  );
}
