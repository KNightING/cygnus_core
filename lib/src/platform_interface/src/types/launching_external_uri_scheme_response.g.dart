// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'launching_external_uri_scheme_response.dart';

// **************************************************************************
// ExchangeableObjectGenerator
// **************************************************************************

///Class that represents the response used by the [CygnusPlatformWebViewCreationParams.onLaunchingExternalUriScheme] event.
class CygnusLaunchingExternalUriSchemeResponse {
  ///Set to `true` to cancel the external URI scheme launch.
  bool cancel;
  CygnusLaunchingExternalUriSchemeResponse({required this.cancel});

  ///Gets a possible [CygnusLaunchingExternalUriSchemeResponse] instance from a [Map] value.
  static CygnusLaunchingExternalUriSchemeResponse? fromMap(
    Map<String, dynamic>? map, {
    CygnusEnumMethod? enumMethod,
  }) {
    if (map == null) {
      return null;
    }
    final instance = CygnusLaunchingExternalUriSchemeResponse(
      cancel: map['cancel'],
    );
    return instance;
  }

  ///Converts instance to a map.
  Map<String, dynamic> toMap({CygnusEnumMethod? enumMethod}) {
    return {"cancel": cancel};
  }

  ///Converts instance to a map.
  Map<String, dynamic> toJson() {
    return toMap();
  }

  @override
  String toString() {
    return 'CygnusLaunchingExternalUriSchemeResponse{cancel: $cancel}';
  }
}
