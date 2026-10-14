import 'package:flutter_inappwebview_internal_annotations/flutter_inappwebview_internal_annotations.dart';

part 'data_detector_types.g.dart';

///Class used to specify a `dataDetectoryTypes` value that adds interactivity to web content that matches the value.
@ExchangeableEnum()
class CygnusDataDetectorTypes_ {
  // ignore: unused_field
  final String _value;
  const CygnusDataDetectorTypes_._internal(this._value);

  ///No detection is performed.
  static const NONE = const CygnusDataDetectorTypes_._internal("NONE");

  ///Phone numbers are detected and turned into links.
  static const PHONE_NUMBER = const CygnusDataDetectorTypes_._internal(
    "PHONE_NUMBER",
  );

  ///URLs in text are detected and turned into links.
  static const LINK = const CygnusDataDetectorTypes_._internal("LINK");

  ///Addresses are detected and turned into links.
  static const ADDRESS = const CygnusDataDetectorTypes_._internal("ADDRESS");

  ///Dates and times that are in the future are detected and turned into links.
  static const CALENDAR_EVENT = const CygnusDataDetectorTypes_._internal(
    "CALENDAR_EVENT",
  );

  ///Tracking numbers are detected and turned into links.
  static const TRACKING_NUMBER = const CygnusDataDetectorTypes_._internal(
    "TRACKING_NUMBER",
  );

  ///Flight numbers are detected and turned into links.
  static const FLIGHT_NUMBER = const CygnusDataDetectorTypes_._internal(
    "FLIGHT_NUMBER",
  );

  ///Lookup suggestions are detected and turned into links.
  static const LOOKUP_SUGGESTION = const CygnusDataDetectorTypes_._internal(
    "LOOKUP_SUGGESTION",
  );

  ///Spotlight suggestions are detected and turned into links.
  static const SPOTLIGHT_SUGGESTION = const CygnusDataDetectorTypes_._internal(
    "SPOTLIGHT_SUGGESTION",
  );

  ///All of the above data types are turned into links when detected. Choosing this value will automatically include any new detection type that is added.
  static const ALL = const CygnusDataDetectorTypes_._internal("ALL");
}

///An iOS-specific class used to specify a `dataDetectoryTypes` value that adds interactivity to web content that matches the value.
///
///**NOTE**: available on iOS 10.0+.
///
///Use [CygnusDataDetectorTypes] instead.
@Deprecated("Use CygnusDataDetectorTypes instead")
@ExchangeableEnum()
class CygnusIOSWKDataDetectorTypes_ {
  // ignore: unused_field
  final String _value;
  const CygnusIOSWKDataDetectorTypes_._internal(this._value);

  ///No detection is performed.
  static const NONE = const CygnusIOSWKDataDetectorTypes_._internal("NONE");

  ///Phone numbers are detected and turned into links.
  static const PHONE_NUMBER = const CygnusIOSWKDataDetectorTypes_._internal(
    "PHONE_NUMBER",
  );

  ///URLs in text are detected and turned into links.
  static const LINK = const CygnusIOSWKDataDetectorTypes_._internal("LINK");

  ///Addresses are detected and turned into links.
  static const ADDRESS = const CygnusIOSWKDataDetectorTypes_._internal("ADDRESS");

  ///Dates and times that are in the future are detected and turned into links.
  static const CALENDAR_EVENT = const CygnusIOSWKDataDetectorTypes_._internal(
    "CALENDAR_EVENT",
  );

  ///Tracking numbers are detected and turned into links.
  static const TRACKING_NUMBER = const CygnusIOSWKDataDetectorTypes_._internal(
    "TRACKING_NUMBER",
  );

  ///Flight numbers are detected and turned into links.
  static const FLIGHT_NUMBER = const CygnusIOSWKDataDetectorTypes_._internal(
    "FLIGHT_NUMBER",
  );

  ///Lookup suggestions are detected and turned into links.
  static const LOOKUP_SUGGESTION = const CygnusIOSWKDataDetectorTypes_._internal(
    "LOOKUP_SUGGESTION",
  );

  ///Spotlight suggestions are detected and turned into links.
  static const SPOTLIGHT_SUGGESTION = const CygnusIOSWKDataDetectorTypes_._internal(
    "SPOTLIGHT_SUGGESTION",
  );

  ///All of the above data types are turned into links when detected. Choosing this value will automatically include any new detection type that is added.
  static const ALL = const CygnusIOSWKDataDetectorTypes_._internal("ALL");
}
