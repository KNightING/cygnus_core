// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'find_options.dart';

// **************************************************************************
// ExchangeableObjectGenerator
// **************************************************************************

///Class that represents find options for find-on-page operations.
class CygnusFindOptions {
  ///The text to find.
  String? findTerm;

  ///Whether to highlight all matches.
  bool? shouldHighlightAllMatches;

  ///Whether to match case.
  bool? shouldMatchCase;

  ///Whether to match whole word only.
  bool? shouldMatchWord;

  ///Whether to suppress the default find dialog.
  bool? suppressDefaultFindDialog;
  CygnusFindOptions({
    this.findTerm,
    this.shouldHighlightAllMatches,
    this.shouldMatchCase,
    this.shouldMatchWord,
    this.suppressDefaultFindDialog,
  });

  ///Gets a possible [CygnusFindOptions] instance from a [Map] value.
  static CygnusFindOptions? fromMap(
    Map<String, dynamic>? map, {
    CygnusEnumMethod? enumMethod,
  }) {
    if (map == null) {
      return null;
    }
    final instance = CygnusFindOptions(
      findTerm: map['findTerm'],
      shouldHighlightAllMatches: map['shouldHighlightAllMatches'],
      shouldMatchCase: map['shouldMatchCase'],
      shouldMatchWord: map['shouldMatchWord'],
      suppressDefaultFindDialog: map['suppressDefaultFindDialog'],
    );
    return instance;
  }

  ///Converts instance to a map.
  Map<String, dynamic> toMap({CygnusEnumMethod? enumMethod}) {
    return {
      "findTerm": findTerm,
      "shouldHighlightAllMatches": shouldHighlightAllMatches,
      "shouldMatchCase": shouldMatchCase,
      "shouldMatchWord": shouldMatchWord,
      "suppressDefaultFindDialog": suppressDefaultFindDialog,
    };
  }

  ///Converts instance to a map.
  Map<String, dynamic> toJson() {
    return toMap();
  }

  @override
  String toString() {
    return 'CygnusFindOptions{findTerm: $findTerm, shouldHighlightAllMatches: $shouldHighlightAllMatches, shouldMatchCase: $shouldMatchCase, shouldMatchWord: $shouldMatchWord, suppressDefaultFindDialog: $suppressDefaultFindDialog}';
  }
}
