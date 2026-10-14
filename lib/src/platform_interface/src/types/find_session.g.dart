// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'find_session.dart';

// **************************************************************************
// ExchangeableObjectGenerator
// **************************************************************************

class CygnusFindSession {
  ///Returns the index of the currently highlighted result.
  ///If no result is currently highlighted.
  int highlightedResultIndex;

  ///Returns the total number of results.
  int resultCount;

  /// Defines how results are reported through the find panel's UI.
  CygnusSearchResultDisplayStyle searchResultDisplayStyle;
  CygnusFindSession({
    required this.highlightedResultIndex,
    required this.resultCount,
    required this.searchResultDisplayStyle,
  });

  ///Gets a possible [CygnusFindSession] instance from a [Map] value.
  static CygnusFindSession? fromMap(
    Map<String, dynamic>? map, {
    CygnusEnumMethod? enumMethod,
  }) {
    if (map == null) {
      return null;
    }
    final instance = CygnusFindSession(
      highlightedResultIndex: map['highlightedResultIndex'],
      resultCount: map['resultCount'],
      searchResultDisplayStyle: switch (enumMethod ??
          CygnusEnumMethod.nativeValue) {
        CygnusEnumMethod.nativeValue =>
          CygnusSearchResultDisplayStyle.fromNativeValue(
            map['searchResultDisplayStyle'],
          ),
        CygnusEnumMethod.value => CygnusSearchResultDisplayStyle.fromValue(
          map['searchResultDisplayStyle'],
        ),
        CygnusEnumMethod.name => CygnusSearchResultDisplayStyle.byName(
          map['searchResultDisplayStyle'],
        ),
      }!,
    );
    return instance;
  }

  ///Converts instance to a map.
  Map<String, dynamic> toMap({CygnusEnumMethod? enumMethod}) {
    return {
      "highlightedResultIndex": highlightedResultIndex,
      "resultCount": resultCount,
      "searchResultDisplayStyle": switch (enumMethod ??
          CygnusEnumMethod.nativeValue) {
        CygnusEnumMethod.nativeValue =>
          searchResultDisplayStyle.toNativeValue(),
        CygnusEnumMethod.value => searchResultDisplayStyle.toValue(),
        CygnusEnumMethod.name => searchResultDisplayStyle.name(),
      },
    };
  }

  ///Converts instance to a map.
  Map<String, dynamic> toJson() {
    return toMap();
  }

  @override
  String toString() {
    return 'CygnusFindSession{highlightedResultIndex: $highlightedResultIndex, resultCount: $resultCount, searchResultDisplayStyle: $searchResultDisplayStyle}';
  }
}
