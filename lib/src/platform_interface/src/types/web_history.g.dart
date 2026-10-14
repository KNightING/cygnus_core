// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'web_history.dart';

// **************************************************************************
// ExchangeableObjectGenerator
// **************************************************************************

///This class contains a snapshot of the current back/forward list for a `WebView`.
class CygnusWebHistory {
  ///Index of the current [CygnusWebHistoryItem].
  int? currentIndex;

  ///List of all [CygnusWebHistoryItem]s.
  List<CygnusWebHistoryItem>? list;
  CygnusWebHistory({this.currentIndex, this.list});

  ///Gets a possible [CygnusWebHistory] instance from a [Map] value.
  static CygnusWebHistory? fromMap(
    Map<String, dynamic>? map, {
    CygnusEnumMethod? enumMethod,
  }) {
    if (map == null) {
      return null;
    }
    final instance = CygnusWebHistory(
      currentIndex: map['currentIndex'],
      list: map['list'] != null
          ? List<CygnusWebHistoryItem>.from(
              map['list'].map(
                (e) => CygnusWebHistoryItem.fromMap(
                  e?.cast<String, dynamic>(),
                  enumMethod: enumMethod,
                )!,
              ),
            )
          : null,
    );
    return instance;
  }

  ///Converts instance to a map.
  Map<String, dynamic> toMap({CygnusEnumMethod? enumMethod}) {
    return {
      "currentIndex": currentIndex,
      "list": list?.map((e) => e.toMap(enumMethod: enumMethod)).toList(),
    };
  }

  ///Converts instance to a map.
  Map<String, dynamic> toJson() {
    return toMap();
  }

  @override
  String toString() {
    return 'CygnusWebHistory{currentIndex: $currentIndex, list: $list}';
  }
}
