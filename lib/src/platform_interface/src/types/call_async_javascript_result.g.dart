// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'call_async_javascript_result.dart';

// **************************************************************************
// ExchangeableObjectGenerator
// **************************************************************************

///Class that represents either a success or a failure, including an associated value in each case for [CygnusPlatformWebViewController.callAsyncJavaScript].
class CygnusCallAsyncJavaScriptResult {
  ///It contains the failure value.
  String? error;

  ///It contains the success value.
  dynamic value;
  CygnusCallAsyncJavaScriptResult({this.error, this.value});

  ///Gets a possible [CygnusCallAsyncJavaScriptResult] instance from a [Map] value.
  static CygnusCallAsyncJavaScriptResult? fromMap(
    Map<String, dynamic>? map, {
    CygnusEnumMethod? enumMethod,
  }) {
    if (map == null) {
      return null;
    }
    final instance = CygnusCallAsyncJavaScriptResult(
      error: map['error'],
      value: map['value'],
    );
    return instance;
  }

  ///Converts instance to a map.
  Map<String, dynamic> toMap({CygnusEnumMethod? enumMethod}) {
    return {"error": error, "value": value};
  }

  ///Converts instance to a map.
  Map<String, dynamic> toJson() {
    return toMap();
  }

  @override
  String toString() {
    return 'CygnusCallAsyncJavaScriptResult{error: $error, value: $value}';
  }
}
