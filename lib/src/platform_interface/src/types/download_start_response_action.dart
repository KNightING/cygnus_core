import 'package:flutter/foundation.dart';
import 'package:cygnus_core_internal_annotations/cygnus_core_internal_annotations.dart';

import 'download_start_response.dart';

part 'download_start_response_action.g.dart';

///Class representing the action of a [CygnusDownloadStartResponse].
@ExchangeableEnum()
class CygnusDownloadStartResponseAction_ {
  // ignore: unused_field
  final int _value;
  const CygnusDownloadStartResponseAction_._internal(this._value);

  ///Cancel the download.
  @EnumSupportedPlatforms(
    platforms: [EnumWindowsPlatform(value: 0), EnumLinuxPlatform(value: 0)],
  )
  static const CANCEL = const CygnusDownloadStartResponseAction_._internal(0);
}
