// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'javascript_handler_callback.dart';

// **************************************************************************
// ExchangeableObjectGenerator
// **************************************************************************

///A class that represents the data passed to a [CygnusJavaScriptHandlerFunction] added with [CygnusPlatformWebViewController.addJavaScriptHandler].
class CygnusJavaScriptHandlerFunctionData {
  List<dynamic> args;
  bool isMainFrame;
  CygnusWebUri origin;
  CygnusWebUri requestUrl;
  CygnusJavaScriptHandlerFunctionData({
    this.args = const [],
    required this.isMainFrame,
    required this.origin,
    required this.requestUrl,
  });

  ///Gets a possible [CygnusJavaScriptHandlerFunctionData] instance from a [Map] value.
  static CygnusJavaScriptHandlerFunctionData? fromMap(
    Map<String, dynamic>? map, {
    CygnusEnumMethod? enumMethod,
  }) {
    if (map == null) {
      return null;
    }
    final instance = CygnusJavaScriptHandlerFunctionData(
      isMainFrame: map['isMainFrame'],
      origin: CygnusWebUri(map['origin']),
      requestUrl: CygnusWebUri(map['requestUrl']),
    );
    if (map['args'] != null) {
      instance.args = List<dynamic>.from(map['args']!.cast<dynamic>());
    }
    return instance;
  }

  ///Converts instance to a map.
  Map<String, dynamic> toMap({CygnusEnumMethod? enumMethod}) {
    return {
      "args": args,
      "isMainFrame": isMainFrame,
      "origin": origin.toString(),
      "requestUrl": requestUrl.toString(),
    };
  }

  ///Converts instance to a map.
  Map<String, dynamic> toJson() {
    return toMap();
  }

  @override
  String toString() {
    return 'CygnusJavaScriptHandlerFunctionData{args: $args, isMainFrame: $isMainFrame, origin: $origin, requestUrl: $requestUrl}';
  }
}
