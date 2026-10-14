// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'url_response.dart';

// **************************************************************************
// ExchangeableObjectGenerator
// **************************************************************************

///The metadata associated with the response to a URL load request, independent of protocol and URL scheme.
class CygnusURLResponse {
  ///The expected length of the response’s content.
  int expectedContentLength;

  ///All HTTP header fields of the response.
  Map<String, String>? headers;

  ///The MIME type of the response.
  String? mimeType;

  ///The response’s HTTP status code.
  int? statusCode;

  ///A suggested filename for the response data.
  String? suggestedFilename;

  ///The name of the text encoding provided by the response’s originating source.
  String? textEncodingName;

  ///The URL for the response.
  CygnusWebUri? url;
  CygnusURLResponse({
    required this.expectedContentLength,
    this.headers,
    this.mimeType,
    this.statusCode,
    this.suggestedFilename,
    this.textEncodingName,
    this.url,
  });

  ///Gets a possible [CygnusURLResponse] instance from a [Map] value.
  static CygnusURLResponse? fromMap(
    Map<String, dynamic>? map, {
    CygnusEnumMethod? enumMethod,
  }) {
    if (map == null) {
      return null;
    }
    final instance = CygnusURLResponse(
      expectedContentLength: map['expectedContentLength'],
      headers: map['headers']?.cast<String, String>(),
      mimeType: map['mimeType'],
      statusCode: map['statusCode'],
      suggestedFilename: map['suggestedFilename'],
      textEncodingName: map['textEncodingName'],
      url: map['url'] != null ? CygnusWebUri(map['url']) : null,
    );
    return instance;
  }

  ///Converts instance to a map.
  Map<String, dynamic> toMap({CygnusEnumMethod? enumMethod}) {
    return {
      "expectedContentLength": expectedContentLength,
      "headers": headers,
      "mimeType": mimeType,
      "statusCode": statusCode,
      "suggestedFilename": suggestedFilename,
      "textEncodingName": textEncodingName,
      "url": url?.toString(),
    };
  }

  ///Converts instance to a map.
  Map<String, dynamic> toJson() {
    return toMap();
  }

  @override
  String toString() {
    return 'CygnusURLResponse{expectedContentLength: $expectedContentLength, headers: $headers, mimeType: $mimeType, statusCode: $statusCode, suggestedFilename: $suggestedFilename, textEncodingName: $textEncodingName, url: $url}';
  }
}

///Use [CygnusURLResponse] instead.
@Deprecated('Use CygnusURLResponse instead')
class CygnusIOSURLResponse {
  ///The expected length of the response’s content.
  int expectedContentLength;

  ///All HTTP header fields of the response.
  Map<String, String>? headers;

  ///The MIME type of the response.
  String? mimeType;

  ///The response’s HTTP status code.
  int? statusCode;

  ///A suggested filename for the response data.
  String? suggestedFilename;

  ///The name of the text encoding provided by the response’s originating source.
  String? textEncodingName;

  ///The URL for the response.
  Uri? url;
  CygnusIOSURLResponse({
    required this.expectedContentLength,
    this.headers,
    this.mimeType,
    this.statusCode,
    this.suggestedFilename,
    this.textEncodingName,
    this.url,
  });

  ///Gets a possible [CygnusIOSURLResponse] instance from a [Map] value.
  static CygnusIOSURLResponse? fromMap(
    Map<String, dynamic>? map, {
    CygnusEnumMethod? enumMethod,
  }) {
    if (map == null) {
      return null;
    }
    final instance = CygnusIOSURLResponse(
      expectedContentLength: map['expectedContentLength'],
      headers: map['headers']?.cast<String, String>(),
      mimeType: map['mimeType'],
      statusCode: map['statusCode'],
      suggestedFilename: map['suggestedFilename'],
      textEncodingName: map['textEncodingName'],
      url: map['url'] != null ? Uri.tryParse(map['url']) : null,
    );
    return instance;
  }

  ///Converts instance to a map.
  Map<String, dynamic> toMap({CygnusEnumMethod? enumMethod}) {
    return {
      "expectedContentLength": expectedContentLength,
      "headers": headers,
      "mimeType": mimeType,
      "statusCode": statusCode,
      "suggestedFilename": suggestedFilename,
      "textEncodingName": textEncodingName,
      "url": url?.toString(),
    };
  }

  ///Converts instance to a map.
  Map<String, dynamic> toJson() {
    return toMap();
  }

  @override
  String toString() {
    return 'CygnusIOSURLResponse{expectedContentLength: $expectedContentLength, headers: $headers, mimeType: $mimeType, statusCode: $statusCode, suggestedFilename: $suggestedFilename, textEncodingName: $textEncodingName, url: $url}';
  }
}
