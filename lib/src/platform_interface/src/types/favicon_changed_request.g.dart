// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'favicon_changed_request.dart';

// **************************************************************************
// ExchangeableObjectGenerator
// **************************************************************************

///Class that represents the request used by the [CygnusPlatformWebViewCreationParams.onFaviconChanged] event.
class CygnusFaviconChangedRequest {
  ///The favicon bytes for the current page, if available.
  Uint8List? icon;

  ///The favicon URL for the current page, if available.
  CygnusWebUri? url;
  CygnusFaviconChangedRequest({this.icon, this.url});

  ///Gets a possible [CygnusFaviconChangedRequest] instance from a [Map] value.
  static CygnusFaviconChangedRequest? fromMap(
    Map<String, dynamic>? map, {
    CygnusEnumMethod? enumMethod,
  }) {
    if (map == null) {
      return null;
    }
    final instance = CygnusFaviconChangedRequest(
      icon: map['icon'] != null
          ? Uint8List.fromList(map['icon'].cast<int>())
          : null,
      url: map['url'] != null ? CygnusWebUri(map['url']) : null,
    );
    return instance;
  }

  ///Converts instance to a map.
  Map<String, dynamic> toMap({CygnusEnumMethod? enumMethod}) {
    return {"icon": icon, "url": url?.toString()};
  }

  ///Converts instance to a map.
  Map<String, dynamic> toJson() {
    return toMap();
  }

  @override
  String toString() {
    return 'CygnusFaviconChangedRequest{icon: $icon, url: $url}';
  }
}
