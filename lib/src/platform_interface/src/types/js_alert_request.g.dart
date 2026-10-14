// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'js_alert_request.dart';

// **************************************************************************
// ExchangeableObjectGenerator
// **************************************************************************

///Class that represents the request of the [CygnusPlatformWebViewCreationParams.onJsAlert] event.
class CygnusJsAlertRequest {
  ///Use [isMainFrame] instead.
  @Deprecated('Use isMainFrame instead')
  bool? iosIsMainFrame;

  ///Indicates whether the request was made for the main frame.
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- iOS WKWebView
  ///- macOS WKWebView
  bool? isMainFrame;

  ///Message to be displayed in the window.
  String? message;

  ///The url of the page requesting the dialog.
  CygnusWebUri? url;
  CygnusJsAlertRequest({
    @Deprecated('Use isMainFrame instead') this.iosIsMainFrame,
    this.isMainFrame,
    this.message,
    this.url,
  }) {
    isMainFrame = isMainFrame ?? iosIsMainFrame;
  }

  ///Gets a possible [CygnusJsAlertRequest] instance from a [Map] value.
  static CygnusJsAlertRequest? fromMap(
    Map<String, dynamic>? map, {
    CygnusEnumMethod? enumMethod,
  }) {
    if (map == null) {
      return null;
    }
    final instance = CygnusJsAlertRequest(
      iosIsMainFrame: map['isMainFrame'],
      isMainFrame: map['isMainFrame'],
      message: map['message'],
      url: map['url'] != null ? CygnusWebUri(map['url']) : null,
    );
    return instance;
  }

  ///Converts instance to a map.
  Map<String, dynamic> toMap({CygnusEnumMethod? enumMethod}) {
    return {
      "isMainFrame": isMainFrame,
      "message": message,
      "url": url?.toString(),
    };
  }

  ///Converts instance to a map.
  Map<String, dynamic> toJson() {
    return toMap();
  }

  @override
  String toString() {
    return 'CygnusJsAlertRequest{isMainFrame: $isMainFrame, message: $message, url: $url}';
  }
}
