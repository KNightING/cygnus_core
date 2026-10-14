import 'package:flutter_inappwebview_internal_annotations/flutter_inappwebview_internal_annotations.dart';

import '../webview_environment/platform_webview_environment.dart';
import 'browser_process_kind.dart';
import 'frame_info.dart';
import 'enum_method.dart';

part 'browser_process_info.g.dart';

///An object that contains information for a process in the [CygnusPlatformWebViewEnvironment].
@ExchangeableObject()
class CygnusBrowserProcessInfo_ {
  ///The kind of the process.
  @SupportedPlatforms(platforms: [WindowsPlatform()])
  CygnusBrowserProcessKind_ kind;

  ///The process id of the process.
  @SupportedPlatforms(platforms: [WindowsPlatform()])
  int? processId;

  ///A list of associated [CygnusFrameInfo]s which are actively running
  ///(showing or hiding UI elements) in the renderer process.
  @SupportedPlatforms(platforms: [WindowsPlatform(available: '1.0.2210.55')])
  List<CygnusFrameInfo_>? frameInfos;

  CygnusBrowserProcessInfo_({required this.kind, this.processId, this.frameInfos});
}
