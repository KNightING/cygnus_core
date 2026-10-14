// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'safe_browsing_response.dart';

// **************************************************************************
// ExchangeableObjectGenerator
// **************************************************************************

///Class that represents the response used by the [CygnusPlatformWebViewCreationParams.onSafeBrowsingHit] event.
///It is used to indicate an action to take when hitting a malicious URL.
class CygnusSafeBrowsingResponse {
  ///Indicate the [CygnusSafeBrowsingResponseAction] to take when hitting a malicious URL.
  CygnusSafeBrowsingResponseAction? action;

  ///If reporting is enabled, all reports will be sent according to the privacy policy referenced by [CygnusPlatformWebViewController.getSafeBrowsingPrivacyPolicyUrl].
  bool report;
  CygnusSafeBrowsingResponse({
    CygnusSafeBrowsingResponseAction? action,
    this.report = true,
  }) : action = action ?? CygnusSafeBrowsingResponseAction.SHOW_INTERSTITIAL;

  ///Gets a possible [CygnusSafeBrowsingResponse] instance from a [Map] value.
  static CygnusSafeBrowsingResponse? fromMap(
    Map<String, dynamic>? map, {
    CygnusEnumMethod? enumMethod,
  }) {
    if (map == null) {
      return null;
    }
    final instance = CygnusSafeBrowsingResponse();
    instance.action = switch (enumMethod ?? CygnusEnumMethod.nativeValue) {
      CygnusEnumMethod.nativeValue =>
        CygnusSafeBrowsingResponseAction.fromNativeValue(map['action']),
      CygnusEnumMethod.value => CygnusSafeBrowsingResponseAction.fromValue(
        map['action'],
      ),
      CygnusEnumMethod.name => CygnusSafeBrowsingResponseAction.byName(
        map['action'],
      ),
    };
    if (map['report'] != null) {
      instance.report = map['report'];
    }
    return instance;
  }

  ///Converts instance to a map.
  Map<String, dynamic> toMap({CygnusEnumMethod? enumMethod}) {
    return {
      "action": switch (enumMethod ?? CygnusEnumMethod.nativeValue) {
        CygnusEnumMethod.nativeValue => action?.toNativeValue(),
        CygnusEnumMethod.value => action?.toValue(),
        CygnusEnumMethod.name => action?.name(),
      },
      "report": report,
    };
  }

  ///Converts instance to a map.
  Map<String, dynamic> toJson() {
    return toMap();
  }

  @override
  String toString() {
    return 'CygnusSafeBrowsingResponse{action: $action, report: $report}';
  }
}
