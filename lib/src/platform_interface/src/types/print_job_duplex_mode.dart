import 'package:flutter/foundation.dart';
import 'package:cygnus_core_internal_annotations/cygnus_core_internal_annotations.dart';

import '../print_job/main.dart';

part 'print_job_duplex_mode.g.dart';

///Class representing the orientation of a [CygnusPlatformPrintJobController].
@ExchangeableEnum()
class CygnusPrintJobDuplexMode_ {
  // ignore: unused_field
  final String _value;
  // ignore: unused_field
  final int? _nativeValue = null;

  const CygnusPrintJobDuplexMode_._internal(this._value);

  ///No double-sided (duplex) printing; single-sided printing only.
  @EnumSupportedPlatforms(
    platforms: [
      EnumAndroidPlatform(value: 1),
      EnumIOSPlatform(value: 0),
      EnumMacOSPlatform(value: 1),
      EnumWindowsPlatform(value: 1),
    ],
  )
  static const NONE = CygnusPrintJobDuplexMode_._internal('NONE');

  ///Duplex printing that flips the back page along the long edge of the paper.
  ///Pages are turned sideways along the long edge - like a book.
  @EnumSupportedPlatforms(
    platforms: [
      EnumAndroidPlatform(value: 2),
      EnumIOSPlatform(value: 1),
      EnumMacOSPlatform(value: 2),
      EnumWindowsPlatform(value: 2),
    ],
  )
  static const LONG_EDGE = CygnusPrintJobDuplexMode_._internal('LONG_EDGE');

  ///Duplex print that flips the back page along the short edge of the paper.
  ///Pages are turned upwards along the short edge - like a notepad.
  @EnumSupportedPlatforms(
    platforms: [
      EnumAndroidPlatform(value: 4),
      EnumIOSPlatform(value: 2),
      EnumMacOSPlatform(value: 3),
      EnumWindowsPlatform(value: 3),
    ],
  )
  static const SHORT_EDGE = CygnusPrintJobDuplexMode_._internal('SHORT_EDGE');
}
