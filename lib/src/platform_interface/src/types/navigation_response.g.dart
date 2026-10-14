// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'navigation_response.dart';

// **************************************************************************
// ExchangeableObjectGenerator
// **************************************************************************

///Class that represents the navigation response used by the [CygnusPlatformWebViewCreationParams.onNavigationResponse] event.
class CygnusNavigationResponse {
  ///A Boolean value that indicates whether WebKit is capable of displaying the response’s MIME type natively.
  bool canShowMIMEType;

  ///A Boolean value that indicates whether the response targets the web view’s main frame.
  bool isForMainFrame;

  ///The URL for the response.
  CygnusURLResponse? response;
  CygnusNavigationResponse({
    required this.canShowMIMEType,
    required this.isForMainFrame,
    this.response,
  });

  ///Gets a possible [CygnusNavigationResponse] instance from a [Map] value.
  static CygnusNavigationResponse? fromMap(
    Map<String, dynamic>? map, {
    CygnusEnumMethod? enumMethod,
  }) {
    if (map == null) {
      return null;
    }
    final instance = CygnusNavigationResponse(
      canShowMIMEType: map['canShowMIMEType'],
      isForMainFrame: map['isForMainFrame'],
      response: CygnusURLResponse.fromMap(
        map['response']?.cast<String, dynamic>(),
        enumMethod: enumMethod,
      ),
    );
    return instance;
  }

  ///Converts instance to a map.
  Map<String, dynamic> toMap({CygnusEnumMethod? enumMethod}) {
    return {
      "canShowMIMEType": canShowMIMEType,
      "isForMainFrame": isForMainFrame,
      "response": response?.toMap(enumMethod: enumMethod),
    };
  }

  ///Converts instance to a map.
  Map<String, dynamic> toJson() {
    return toMap();
  }

  @override
  String toString() {
    return 'CygnusNavigationResponse{canShowMIMEType: $canShowMIMEType, isForMainFrame: $isForMainFrame, response: $response}';
  }
}

///An iOS-specific Class that represents the navigation response used by the [CygnusPlatformWebViewCreationParams.onNavigationResponse] event.
///Use [CygnusNavigationResponse] instead.
@Deprecated('Use CygnusNavigationResponse instead')
class CygnusIOSWKNavigationResponse {
  ///A Boolean value that indicates whether WebKit is capable of displaying the response’s MIME type natively.
  bool canShowMIMEType;

  ///A Boolean value that indicates whether the response targets the web view’s main frame.
  bool isForMainFrame;

  ///The URL for the response.
  CygnusIOSURLResponse? response;
  CygnusIOSWKNavigationResponse({
    required this.canShowMIMEType,
    required this.isForMainFrame,
    this.response,
  });

  ///Gets a possible [CygnusIOSWKNavigationResponse] instance from a [Map] value.
  static CygnusIOSWKNavigationResponse? fromMap(
    Map<String, dynamic>? map, {
    CygnusEnumMethod? enumMethod,
  }) {
    if (map == null) {
      return null;
    }
    final instance = CygnusIOSWKNavigationResponse(
      canShowMIMEType: map['canShowMIMEType'],
      isForMainFrame: map['isForMainFrame'],
      response: CygnusIOSURLResponse.fromMap(
        map['response']?.cast<String, dynamic>(),
        enumMethod: enumMethod,
      ),
    );
    return instance;
  }

  ///Converts instance to a map.
  Map<String, dynamic> toMap({CygnusEnumMethod? enumMethod}) {
    return {
      "canShowMIMEType": canShowMIMEType,
      "isForMainFrame": isForMainFrame,
      "response": response?.toMap(enumMethod: enumMethod),
    };
  }

  ///Converts instance to a map.
  Map<String, dynamic> toJson() {
    return toMap();
  }

  @override
  String toString() {
    return 'CygnusIOSWKNavigationResponse{canShowMIMEType: $canShowMIMEType, isForMainFrame: $isForMainFrame, response: $response}';
  }
}
