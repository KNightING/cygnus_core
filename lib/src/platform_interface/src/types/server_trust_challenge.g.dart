// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'server_trust_challenge.dart';

// **************************************************************************
// ExchangeableObjectGenerator
// **************************************************************************

///Class that represents the challenge of the [CygnusPlatformWebViewCreationParams.onReceivedServerTrustAuthRequest] event.
///It provides all the information about the challenge.
class CygnusServerTrustChallenge extends CygnusURLAuthenticationChallenge {
  CygnusServerTrustChallenge({
    required CygnusURLProtectionSpace protectionSpace,
  }) : super(protectionSpace: protectionSpace);

  ///Gets a possible [CygnusServerTrustChallenge] instance from a [Map] value.
  static CygnusServerTrustChallenge? fromMap(
    Map<String, dynamic>? map, {
    CygnusEnumMethod? enumMethod,
  }) {
    if (map == null) {
      return null;
    }
    final instance = CygnusServerTrustChallenge(
      protectionSpace: CygnusURLProtectionSpace.fromMap(
        map['protectionSpace']?.cast<String, dynamic>(),
        enumMethod: enumMethod,
      )!,
    );
    return instance;
  }

  ///Converts instance to a map.
  Map<String, dynamic> toMap({CygnusEnumMethod? enumMethod}) {
    return {"protectionSpace": protectionSpace.toMap(enumMethod: enumMethod)};
  }

  ///Converts instance to a map.
  Map<String, dynamic> toJson() {
    return toMap();
  }

  @override
  String toString() {
    return 'CygnusServerTrustChallenge{protectionSpace: $protectionSpace}';
  }
}
