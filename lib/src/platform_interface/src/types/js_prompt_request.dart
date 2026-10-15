import 'package:cygnus_core_internal_annotations/cygnus_core_internal_annotations.dart';

import '../webview/platform_webview.dart';
import '../web_uri.dart';
import 'enum_method.dart';

part 'js_prompt_request.g.dart';

///Class that represents the request of the [CygnusPlatformWebViewCreationParams.onJsPrompt] event.
@ExchangeableObject()
class CygnusJsPromptRequest_ {
  ///The url of the page requesting the dialog.
  CygnusWebUri? url;

  ///Message to be displayed in the window.
  String? message;

  ///The default value displayed in the prompt dialog.
  String? defaultValue;

  ///Use [isMainFrame] instead.
  @Deprecated("Use isMainFrame instead")
  bool? iosIsMainFrame;

  ///Indicates whether the request was made for the main frame.
  @SupportedPlatforms(platforms: [IOSPlatform(), MacOSPlatform()])
  bool? isMainFrame;

  CygnusJsPromptRequest_({
    this.url,
    this.message,
    this.defaultValue,
    @Deprecated("Use isMainFrame instead") this.iosIsMainFrame,
    this.isMainFrame,
  });
}
