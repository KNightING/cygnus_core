// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'launching_external_uri_scheme_request.dart';

// **************************************************************************
// ExchangeableObjectGenerator
// **************************************************************************

///Class that represents the request used by the [CygnusPlatformWebViewCreationParams.onLaunchingExternalUriScheme] event.
class CygnusLaunchingExternalUriSchemeRequest {
  ///The origin initiating the external URI scheme launch.
  CygnusWebUri? initiatingOrigin;

  ///Whether the external URI scheme request was initiated through a user gesture.
  bool? isUserInitiated;

  ///The URI with the external URI scheme to be launched.
  CygnusWebUri uri;
  CygnusLaunchingExternalUriSchemeRequest({
    this.initiatingOrigin,
    this.isUserInitiated,
    required this.uri,
  });

  ///Gets a possible [CygnusLaunchingExternalUriSchemeRequest] instance from a [Map] value.
  static CygnusLaunchingExternalUriSchemeRequest? fromMap(
    Map<String, dynamic>? map, {
    CygnusEnumMethod? enumMethod,
  }) {
    if (map == null) {
      return null;
    }
    final instance = CygnusLaunchingExternalUriSchemeRequest(
      initiatingOrigin: map['initiatingOrigin'] != null
          ? CygnusWebUri(map['initiatingOrigin'])
          : null,
      isUserInitiated: map['isUserInitiated'],
      uri: CygnusWebUri(map['uri']),
    );
    return instance;
  }

  ///Converts instance to a map.
  Map<String, dynamic> toMap({CygnusEnumMethod? enumMethod}) {
    return {
      "initiatingOrigin": initiatingOrigin?.toString(),
      "isUserInitiated": isUserInitiated,
      "uri": uri.toString(),
    };
  }

  ///Converts instance to a map.
  Map<String, dynamic> toJson() {
    return toMap();
  }

  @override
  String toString() {
    return 'CygnusLaunchingExternalUriSchemeRequest{initiatingOrigin: $initiatingOrigin, isUserInitiated: $isUserInitiated, uri: $uri}';
  }
}
