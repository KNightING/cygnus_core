// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'server_trust_auth_response.dart';

// **************************************************************************
// ExchangeableObjectGenerator
// **************************************************************************

///Class that represents the response used by the [CygnusPlatformWebViewCreationParams.onReceivedServerTrustAuthRequest] event.
class CygnusServerTrustAuthResponse {
  ///Indicate the [CygnusServerTrustAuthResponseAction] to take in response of the server trust authentication challenge.
  CygnusServerTrustAuthResponseAction? action;
  CygnusServerTrustAuthResponse({CygnusServerTrustAuthResponseAction? action})
    : action = action ?? CygnusServerTrustAuthResponseAction.CANCEL;

  ///Gets a possible [CygnusServerTrustAuthResponse] instance from a [Map] value.
  static CygnusServerTrustAuthResponse? fromMap(
    Map<String, dynamic>? map, {
    CygnusEnumMethod? enumMethod,
  }) {
    if (map == null) {
      return null;
    }
    final instance = CygnusServerTrustAuthResponse();
    instance.action = switch (enumMethod ?? CygnusEnumMethod.nativeValue) {
      CygnusEnumMethod.nativeValue =>
        CygnusServerTrustAuthResponseAction.fromNativeValue(map['action']),
      CygnusEnumMethod.value => CygnusServerTrustAuthResponseAction.fromValue(
        map['action'],
      ),
      CygnusEnumMethod.name => CygnusServerTrustAuthResponseAction.byName(
        map['action'],
      ),
    };
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
    };
  }

  ///Converts instance to a map.
  Map<String, dynamic> toJson() {
    return toMap();
  }

  @override
  String toString() {
    return 'CygnusServerTrustAuthResponse{action: $action}';
  }
}
