import 'package:flutter_inappwebview_internal_annotations/flutter_inappwebview_internal_annotations.dart';

import '../webview/platform_webview.dart';
import 'enum_method.dart';
import 'physical_key_status.dart';

part 'accelerator_key_pressed_detail.g.dart';

///Class that represents details of the [CygnusPlatformWebViewCreationParams.onAcceleratorKeyPressed] event.
@ExchangeableObject()
class CygnusAcceleratorKeyPressedDetail_ {
  int? keyEventKind;
  CygnusPhysicalKeyStatus_? physicalKeyStatus;
  int? virtualKey;

  @ExchangeableObjectConstructor()
  CygnusAcceleratorKeyPressedDetail_({
    this.keyEventKind,
    this.physicalKeyStatus,
    this.virtualKey,
  });
}
