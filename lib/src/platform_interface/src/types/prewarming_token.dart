import 'package:flutter_inappwebview_internal_annotations/flutter_inappwebview_internal_annotations.dart';

import '../chrome_safari_browser/platform_chrome_safari_browser.dart';
import 'enum_method.dart';

part 'prewarming_token.g.dart';

///Class that represents the Prewarming Token returned by [CygnusPlatformChromeSafariBrowser.prewarmConnections].
@ExchangeableObject()
class CygnusPrewarmingToken_ {
  ///Prewarming Token id.
  final String id;

  CygnusPrewarmingToken_({required this.id});
}
