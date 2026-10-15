import 'package:cygnus_core_internal_annotations/cygnus_core_internal_annotations.dart';

import '../webview_environment/platform_webview_environment.dart';
import 'browser_process_info.dart';
import 'enum_method.dart';

part 'browser_process_infos_changed_detail.g.dart';

///An object that contains information for the [CygnusPlatformWebViewEnvironment.onProcessInfosChanged] event.
@ExchangeableObject()
class CygnusBrowserProcessInfosChangedDetail_ {
  ///The kind of the process.
  @SupportedPlatforms(platforms: [WindowsPlatform()])
  List<CygnusBrowserProcessInfo_> infos;

  CygnusBrowserProcessInfosChangedDetail_({this.infos = const []});
}
