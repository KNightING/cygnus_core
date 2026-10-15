import 'package:cygnus_core_internal_annotations/cygnus_core_internal_annotations.dart';

import 'enum_method.dart';

part 'save_file_security_check_starting_response.g.dart';

///Class that represents the response used by the [CygnusPlatformWebViewCreationParams.onSaveFileSecurityCheckStarting] event.
@ExchangeableObject()
class CygnusSaveFileSecurityCheckStartingResponse_ {
  ///Whether to cancel the save operation.
  bool? cancelSave;

  ///Whether to suppress the default policy check.
  bool? suppressDefaultPolicy;

  CygnusSaveFileSecurityCheckStartingResponse_({
    this.cancelSave,
    this.suppressDefaultPolicy,
  });
}
