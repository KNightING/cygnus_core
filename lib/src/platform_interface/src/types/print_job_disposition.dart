import 'package:flutter/foundation.dart';
import 'package:cygnus_core_internal_annotations/cygnus_core_internal_annotations.dart';

import '../print_job/main.dart';

part 'print_job_disposition.g.dart';

///Class representing the constants that specify values for the print job disposition of a [CygnusPlatformPrintJobController].
@ExchangeableEnum()
class CygnusPrintJobDisposition_ {
  // ignore: unused_field
  final String _value;
  const CygnusPrintJobDisposition_._internal(this._value);

  ///Normal print job.
  @EnumSupportedPlatforms(platforms: [EnumMacOSPlatform(value: 'spool')])
  static const SPOOL = const CygnusPrintJobDisposition_._internal('SPOOL');

  ///Send to Preview application.
  @EnumSupportedPlatforms(platforms: [EnumMacOSPlatform(value: 'preview')])
  static const PREVIEW = const CygnusPrintJobDisposition_._internal("PREVIEW");

  ///Save to a file.
  @EnumSupportedPlatforms(platforms: [EnumMacOSPlatform(value: 'save')])
  static const SAVE = const CygnusPrintJobDisposition_._internal("SAVE");

  ///Cancel print job.
  @EnumSupportedPlatforms(platforms: [EnumMacOSPlatform(value: 'cancel')])
  static const CANCEL = const CygnusPrintJobDisposition_._internal("CANCEL");
}
