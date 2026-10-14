// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'webview_hit_test_result.dart';

// **************************************************************************
// ExchangeableObjectGenerator
// **************************************************************************

///Class that represents the hit result for hitting an HTML elements.
class CygnusWebViewHitTestResult {
  ///Additional type-dependant information about the result.
  String? extra;

  ///The type of the hit test result.
  CygnusWebViewHitTestResultType? type;
  CygnusWebViewHitTestResult({this.extra, this.type});

  ///Gets a possible [CygnusWebViewHitTestResult] instance from a [Map] value.
  static CygnusWebViewHitTestResult? fromMap(
    Map<String, dynamic>? map, {
    CygnusEnumMethod? enumMethod,
  }) {
    if (map == null) {
      return null;
    }
    final instance = CygnusWebViewHitTestResult(
      extra: map['extra'],
      type: switch (enumMethod ?? CygnusEnumMethod.nativeValue) {
        CygnusEnumMethod.nativeValue =>
          CygnusWebViewHitTestResultType.fromNativeValue(map['type']),
        CygnusEnumMethod.value => CygnusWebViewHitTestResultType.fromValue(
          map['type'],
        ),
        CygnusEnumMethod.name => CygnusWebViewHitTestResultType.byName(
          map['type'],
        ),
      },
    );
    return instance;
  }

  ///Converts instance to a map.
  Map<String, dynamic> toMap({CygnusEnumMethod? enumMethod}) {
    return {
      "extra": extra,
      "type": switch (enumMethod ?? CygnusEnumMethod.nativeValue) {
        CygnusEnumMethod.nativeValue => type?.toNativeValue(),
        CygnusEnumMethod.value => type?.toValue(),
        CygnusEnumMethod.name => type?.name(),
      },
    };
  }

  ///Converts instance to a map.
  Map<String, dynamic> toJson() {
    return toMap();
  }

  @override
  String toString() {
    return 'CygnusWebViewHitTestResult{extra: $extra, type: $type}';
  }
}
