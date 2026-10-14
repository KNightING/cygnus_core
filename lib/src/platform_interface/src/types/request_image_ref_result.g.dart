// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'request_image_ref_result.dart';

// **************************************************************************
// ExchangeableObjectGenerator
// **************************************************************************

///Class that represents the result used by the [CygnusPlatformWebViewController.requestImageRef] method.
class CygnusRequestImageRefResult {
  ///The image's url.
  CygnusWebUri? url;
  CygnusRequestImageRefResult({this.url});

  ///Gets a possible [CygnusRequestImageRefResult] instance from a [Map] value.
  static CygnusRequestImageRefResult? fromMap(
    Map<String, dynamic>? map, {
    CygnusEnumMethod? enumMethod,
  }) {
    if (map == null) {
      return null;
    }
    final instance = CygnusRequestImageRefResult(
      url: map['url'] != null ? CygnusWebUri(map['url']) : null,
    );
    return instance;
  }

  ///Converts instance to a map.
  Map<String, dynamic> toMap({CygnusEnumMethod? enumMethod}) {
    return {"url": url?.toString()};
  }

  ///Converts instance to a map.
  Map<String, dynamic> toJson() {
    return toMap();
  }

  @override
  String toString() {
    return 'CygnusRequestImageRefResult{url: $url}';
  }
}
