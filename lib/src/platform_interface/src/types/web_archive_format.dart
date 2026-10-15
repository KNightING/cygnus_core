import 'package:flutter/foundation.dart';
import 'package:cygnus_core_internal_annotations/cygnus_core_internal_annotations.dart';

part 'web_archive_format.g.dart';

///Class that represents the known Web Archive formats used when saving a web page.
@ExchangeableEnum()
class CygnusWebArchiveFormat_ {
  // ignore: unused_field
  final String _value;
  // ignore: unused_field
  final String? _nativeValue = null;
  const CygnusWebArchiveFormat_._internal(this._value);

  ///MHT (MIME HTML) is a web Archive format that saves a web page's HTML code, images, CSS, and scripts into one document, allowing for offline viewing.
  @EnumSupportedPlatforms(
    platforms: [EnumAndroidPlatform(), EnumLinuxPlatform()],
  )
  static const MHT = const CygnusWebArchiveFormat_._internal("mht");

  ///WebArchive is a web Archive format used primarily on iOS and macOS platforms to save web pages, including HTML content, images, stylesheets, and scripts, into a single file for offline access.
  @EnumSupportedPlatforms(platforms: [EnumIOSPlatform(), EnumMacOSPlatform()])
  static const WEBARCHIVE = const CygnusWebArchiveFormat_._internal("webarchive");
}
