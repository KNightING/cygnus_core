import 'package:cygnus_core_internal_annotations/cygnus_core_internal_annotations.dart';

part 'safe_browsing_threat.g.dart';

///Class that represents the reason the resource was caught by Safe Browsing.
@ExchangeableEnum()
class CygnusSafeBrowsingThreat_ {
  // ignore: unused_field
  final int _value;
  const CygnusSafeBrowsingThreat_._internal(this._value);

  ///The resource was blocked for an unknown reason.
  static const SAFE_BROWSING_THREAT_UNKNOWN =
      const CygnusSafeBrowsingThreat_._internal(0);

  ///The resource was blocked because it contains malware.
  static const SAFE_BROWSING_THREAT_MALWARE =
      const CygnusSafeBrowsingThreat_._internal(1);

  ///The resource was blocked because it contains deceptive content.
  static const SAFE_BROWSING_THREAT_PHISHING =
      const CygnusSafeBrowsingThreat_._internal(2);

  ///The resource was blocked because it contains unwanted software.
  static const SAFE_BROWSING_THREAT_UNWANTED_SOFTWARE =
      const CygnusSafeBrowsingThreat_._internal(3);

  ///The resource was blocked because it may trick the user into a billing agreement.
  ///
  ///This constant is only used when `targetSdkVersion` is at least Android 29.
  ///Otherwise, [SAFE_BROWSING_THREAT_UNKNOWN] is used instead.
  static const SAFE_BROWSING_THREAT_BILLING =
      const CygnusSafeBrowsingThreat_._internal(4);
}
