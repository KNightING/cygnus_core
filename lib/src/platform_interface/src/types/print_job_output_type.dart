import 'package:cygnus_core_internal_annotations/cygnus_core_internal_annotations.dart';

import '../print_job/main.dart';

part 'print_job_output_type.g.dart';

///Class representing the kind of printable content of a [CygnusPlatformPrintJobController].
@ExchangeableEnum()
class CygnusPrintJobOutputType_ {
  // ignore: unused_field
  final int _value;
  const CygnusPrintJobOutputType_._internal(this._value);

  ///Specifies that the printed content consists of mixed text, graphics, and images.
  ///The default paper is Letter, A4, or similar locale-specific designation.
  ///Output is normal quality, duplex.
  static const GENERAL = const CygnusPrintJobOutputType_._internal(0);

  ///Specifies that the printed content consists of black-and-white or color images.
  ///The default paper is 4x6, A6, or similar locale-specific designation.
  ///Output is high quality, simplex.
  static const PHOTO = const CygnusPrintJobOutputType_._internal(1);

  ///Specifies that the printed content is grayscale.
  ///Set the output type to this value when your printable content contains no color—for example, it’s black text only.
  ///The default paper is Letter/A4. Output is grayscale quality, duplex.
  ///This content type can produce a performance improvement in some cases.
  static const GRAYSCALE = const CygnusPrintJobOutputType_._internal(2);

  ///Specifies that the printed content is a grayscale image.
  ///Set the output type to this value when your printable content contains no color—for example, it’s black text only.
  ///The default paper is Letter/A4.
  ///Output is high quality grayscale, duplex.
  static const PHOTO_GRAYSCALE = const CygnusPrintJobOutputType_._internal(3);
}
