// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'web_history_item.dart';

// **************************************************************************
// ExchangeableObjectGenerator
// **************************************************************************

///A convenience class for accessing fields in an entry in the back/forward list of a `WebView`.
///Each [CygnusWebHistoryItem] is a snapshot of the requested history item.
class CygnusWebHistoryItem {
  ///Unique id of the navigation history entry.
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Windows WebView2
  int? entryId;

  ///0-based position index in the back-forward [CygnusWebHistory.list].
  int? index;

  ///Position offset respect to the currentIndex of the back-forward [CygnusWebHistory.list].
  int? offset;

  ///Original url of this history item.
  CygnusWebUri? originalUrl;

  ///Document title of this history item.
  String? title;

  ///Url of this history item.
  CygnusWebUri? url;
  CygnusWebHistoryItem({
    this.entryId,
    this.index,
    this.offset,
    this.originalUrl,
    this.title,
    this.url,
  });

  ///Gets a possible [CygnusWebHistoryItem] instance from a [Map] value.
  static CygnusWebHistoryItem? fromMap(
    Map<String, dynamic>? map, {
    CygnusEnumMethod? enumMethod,
  }) {
    if (map == null) {
      return null;
    }
    final instance = CygnusWebHistoryItem(
      entryId: map['entryId'],
      index: map['index'],
      offset: map['offset'],
      originalUrl: map['originalUrl'] != null
          ? CygnusWebUri(map['originalUrl'])
          : null,
      title: map['title'],
      url: map['url'] != null ? CygnusWebUri(map['url']) : null,
    );
    return instance;
  }

  ///Converts instance to a map.
  Map<String, dynamic> toMap({CygnusEnumMethod? enumMethod}) {
    return {
      "entryId": entryId,
      "index": index,
      "offset": offset,
      "originalUrl": originalUrl?.toString(),
      "title": title,
      "url": url?.toString(),
    };
  }

  ///Converts instance to a map.
  Map<String, dynamic> toJson() {
    return toMap();
  }

  @override
  String toString() {
    return 'CygnusWebHistoryItem{entryId: $entryId, index: $index, offset: $offset, originalUrl: $originalUrl, title: $title, url: $url}';
  }
}
