import 'package:flutter_inappwebview_internal_annotations/flutter_inappwebview_internal_annotations.dart';

import '../web_storage/platform_web_storage_manager.dart';
import 'enum_method.dart';

part 'web_storage_origin.g.dart';

///Class that encapsulates information about the amount of storage currently used by an origin for the JavaScript storage APIs.
///An origin comprises the host, scheme and port of a URI. See [CygnusPlatformWebStorageManager] for details.
@ExchangeableObject()
class CygnusWebStorageOrigin_ {
  ///The string representation of this origin.
  String? origin;

  ///The quota for this origin, for the Web SQL Database API, in bytes.
  int? quota;

  ///The total amount of storage currently being used by this origin, for all JavaScript storage APIs, in bytes.
  int? usage;

  CygnusWebStorageOrigin_({this.origin, this.quota, this.usage});
}

///Class that encapsulates information about the amount of storage currently used by an origin for the JavaScript storage APIs.
///An origin comprises the host, scheme and port of a URI. See `CygnusAndroidWebStorageManager` for details.
///Use [CygnusWebStorageOrigin] instead.
@Deprecated("Use CygnusWebStorageOrigin instead")
@ExchangeableObject()
class CygnusAndroidWebStorageOrigin_ {
  ///The string representation of this origin.
  String? origin;

  ///The quota for this origin, for the Web SQL Database API, in bytes.
  int? quota;

  ///The total amount of storage currently being used by this origin, for all JavaScript storage APIs, in bytes.
  int? usage;

  CygnusAndroidWebStorageOrigin_({this.origin, this.quota, this.usage});
}
