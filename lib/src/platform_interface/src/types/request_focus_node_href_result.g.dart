// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'request_focus_node_href_result.dart';

// **************************************************************************
// ExchangeableObjectGenerator
// **************************************************************************

///Class that represents the result used by the [CygnusPlatformWebViewController.requestFocusNodeHref] method.
class CygnusRequestFocusNodeHrefResult {
  ///The image's src attribute.
  String? src;

  ///The anchor's text.
  String? title;

  ///The anchor's href attribute.
  CygnusWebUri? url;
  CygnusRequestFocusNodeHrefResult({this.src, this.title, this.url});

  ///Gets a possible [CygnusRequestFocusNodeHrefResult] instance from a [Map] value.
  static CygnusRequestFocusNodeHrefResult? fromMap(
    Map<String, dynamic>? map, {
    CygnusEnumMethod? enumMethod,
  }) {
    if (map == null) {
      return null;
    }
    final instance = CygnusRequestFocusNodeHrefResult(
      src: map['src'],
      title: map['title'],
      url: map['url'] != null ? CygnusWebUri(map['url']) : null,
    );
    return instance;
  }

  ///Converts instance to a map.
  Map<String, dynamic> toMap({CygnusEnumMethod? enumMethod}) {
    return {"src": src, "title": title, "url": url?.toString()};
  }

  ///Converts instance to a map.
  Map<String, dynamic> toJson() {
    return toMap();
  }

  @override
  String toString() {
    return 'CygnusRequestFocusNodeHrefResult{src: $src, title: $title, url: $url}';
  }
}
