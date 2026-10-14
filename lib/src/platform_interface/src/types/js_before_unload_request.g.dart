// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'js_before_unload_request.dart';

// **************************************************************************
// ExchangeableObjectGenerator
// **************************************************************************

///Class that represents the request of the [CygnusPlatformWebViewCreationParams.onJsBeforeUnload] event.
class CygnusJsBeforeUnloadRequest {
  ///Message to be displayed in the window.
  String? message;

  ///The url of the page requesting the dialog.
  CygnusWebUri? url;
  CygnusJsBeforeUnloadRequest({this.message, this.url});

  ///Gets a possible [CygnusJsBeforeUnloadRequest] instance from a [Map] value.
  static CygnusJsBeforeUnloadRequest? fromMap(
    Map<String, dynamic>? map, {
    CygnusEnumMethod? enumMethod,
  }) {
    if (map == null) {
      return null;
    }
    final instance = CygnusJsBeforeUnloadRequest(
      message: map['message'],
      url: map['url'] != null ? CygnusWebUri(map['url']) : null,
    );
    return instance;
  }

  ///Converts instance to a map.
  Map<String, dynamic> toMap({CygnusEnumMethod? enumMethod}) {
    return {"message": message, "url": url?.toString()};
  }

  ///Converts instance to a map.
  Map<String, dynamic> toJson() {
    return toMap();
  }

  @override
  String toString() {
    return 'CygnusJsBeforeUnloadRequest{message: $message, url: $url}';
  }
}
