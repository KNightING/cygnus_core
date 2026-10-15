import 'package:cygnus_core_internal_annotations/cygnus_core_internal_annotations.dart';

part 'url_request_network_service_type.g.dart';

///Class that represents the constants that specify how a request uses network resources.
@ExchangeableEnum()
class CygnusURLRequestNetworkServiceType_ {
  // ignore: unused_field
  final int _value;
  const CygnusURLRequestNetworkServiceType_._internal(this._value);

  ///A service type for standard network traffic.
  static const DEFAULT = const CygnusURLRequestNetworkServiceType_._internal(0);

  ///A service type for video traffic.
  static const VIDEO = const CygnusURLRequestNetworkServiceType_._internal(2);

  ///A service type for background traffic.
  ///
  ///You should specify this type if your app is performing a download that was not requested by the user—for example,
  ///prefetching content so that it will be available when the user chooses to view it.
  static const BACKGROUND = const CygnusURLRequestNetworkServiceType_._internal(3);

  ///A service type for voice traffic.
  static const VOICE = const CygnusURLRequestNetworkServiceType_._internal(4);

  ///A service type for data that the user is actively waiting for.
  ///
  ///Use this service type for interactive situations where the user is anticipating a quick response, like instant messaging or completing a purchase.
  static const RESPONSIVE_DATA = const CygnusURLRequestNetworkServiceType_._internal(
    6,
  );

  ///A service type for streaming audio/video data.
  static const AV_STREAMING = const CygnusURLRequestNetworkServiceType_._internal(8);

  ///A service type for responsive (time-sensitive) audio/video data.
  static const RESPONSIVE_AV = const CygnusURLRequestNetworkServiceType_._internal(9);

  ///A service type for call signaling.
  ///
  ///Use this service type with network traffic that establishes, maintains, or tears down a VoIP call.
  static const CALL_SIGNALING = const CygnusURLRequestNetworkServiceType_._internal(
    11,
  );
}

///An iOS-specific Class that represents the constants that specify how a request uses network resources.
///Use [CygnusURLRequestNetworkServiceType] instead.
@Deprecated("Use CygnusURLRequestNetworkServiceType instead")
@ExchangeableEnum()
class CygnusIOSURLRequestNetworkServiceType_ {
  // ignore: unused_field
  final int _value;
  const CygnusIOSURLRequestNetworkServiceType_._internal(this._value);

  ///A service type for standard network traffic.
  static const DEFAULT = const CygnusIOSURLRequestNetworkServiceType_._internal(0);

  ///A service type for video traffic.
  static const VIDEO = const CygnusIOSURLRequestNetworkServiceType_._internal(2);

  ///A service type for background traffic.
  ///
  ///You should specify this type if your app is performing a download that was not requested by the user—for example,
  ///prefetching content so that it will be available when the user chooses to view it.
  static const BACKGROUND = const CygnusIOSURLRequestNetworkServiceType_._internal(3);

  ///A service type for voice traffic.
  static const VOICE = const CygnusIOSURLRequestNetworkServiceType_._internal(4);

  ///A service type for data that the user is actively waiting for.
  ///
  ///Use this service type for interactive situations where the user is anticipating a quick response, like instant messaging or completing a purchase.
  static const RESPONSIVE_DATA =
      const CygnusIOSURLRequestNetworkServiceType_._internal(6);

  ///A service type for streaming audio/video data.
  static const AV_STREAMING = const CygnusIOSURLRequestNetworkServiceType_._internal(
    8,
  );

  ///A service type for responsive (time-sensitive) audio/video data.
  static const RESPONSIVE_AV = const CygnusIOSURLRequestNetworkServiceType_._internal(
    9,
  );

  ///A service type for call signaling.
  ///
  ///Use this service type with network traffic that establishes, maintains, or tears down a VoIP call.
  static const CALL_SIGNALING =
      const CygnusIOSURLRequestNetworkServiceType_._internal(11);
}
