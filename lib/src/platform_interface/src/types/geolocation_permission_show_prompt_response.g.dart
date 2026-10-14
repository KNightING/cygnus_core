// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'geolocation_permission_show_prompt_response.dart';

// **************************************************************************
// ExchangeableObjectGenerator
// **************************************************************************

///Class used by the host application to set the Geolocation permission state for an origin during the [CygnusPlatformWebViewCreationParams.onGeolocationPermissionsShowPrompt] event.
class CygnusGeolocationPermissionShowPromptResponse {
  ///Whether or not the origin should be allowed to use the Geolocation API.
  bool allow;

  ///The origin for which permissions are set.
  String origin;

  ///Whether the permission should be retained beyond the lifetime of a page currently being displayed by a WebView
  ///The default value is `false`.
  bool retain;
  CygnusGeolocationPermissionShowPromptResponse({
    required this.allow,
    required this.origin,
    this.retain = false,
  });

  ///Gets a possible [CygnusGeolocationPermissionShowPromptResponse] instance from a [Map] value.
  static CygnusGeolocationPermissionShowPromptResponse? fromMap(
    Map<String, dynamic>? map, {
    CygnusEnumMethod? enumMethod,
  }) {
    if (map == null) {
      return null;
    }
    final instance = CygnusGeolocationPermissionShowPromptResponse(
      allow: map['allow'],
      origin: map['origin'],
    );
    if (map['retain'] != null) {
      instance.retain = map['retain'];
    }
    return instance;
  }

  ///Converts instance to a map.
  Map<String, dynamic> toMap({CygnusEnumMethod? enumMethod}) {
    return {"allow": allow, "origin": origin, "retain": retain};
  }

  ///Converts instance to a map.
  Map<String, dynamic> toJson() {
    return toMap();
  }

  @override
  String toString() {
    return 'CygnusGeolocationPermissionShowPromptResponse{allow: $allow, origin: $origin, retain: $retain}';
  }
}
