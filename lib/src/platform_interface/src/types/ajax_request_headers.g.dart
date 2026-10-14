// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ajax_request_headers.dart';

// **************************************************************************
// ExchangeableObjectGenerator
// **************************************************************************

///Class that represents the HTTP headers of an [CygnusAjaxRequest].
class CygnusAjaxRequestHeaders {
  Map<String, dynamic> _headers;
  Map<String, dynamic> _newHeaders = {};
  CygnusAjaxRequestHeaders(this._headers);

  ///Gets a possible [CygnusAjaxRequestHeaders] instance from a [Map] value.
  static CygnusAjaxRequestHeaders? fromMap(
    Map<String, dynamic>? map, {
    CygnusEnumMethod? enumMethod,
  }) {
    if (map == null) {
      return null;
    }
    return CygnusAjaxRequestHeaders(map);
  }

  ///Gets the HTTP headers of the [CygnusAjaxRequest].
  Map<String, dynamic> getHeaders() {
    return this._headers;
  }

  ///Sets/updates an HTTP header of the [CygnusAjaxRequest]. If there is already an existing [header] with the same name, the values are merged into one single request header.
  ///For security reasons, some headers can only be controlled by the user agent.
  ///These headers include the [forbidden header names](https://developer.mozilla.org/en-US/docs/Glossary/Forbidden_header_name)
  ///and [forbidden response header names](https://developer.mozilla.org/en-US/docs/Glossary/Forbidden_response_header_name).
  void setRequestHeader(String header, String value) {
    _newHeaders[header] = value;
  }

  ///Converts instance to a map.
  Map<String, dynamic> toMap({CygnusEnumMethod? enumMethod}) {
    return _newHeaders;
  }

  @override
  String toString() {
    return 'CygnusAjaxRequestHeaders{headers: $_headers, requestHeaders: $_newHeaders}';
  }

  ///Converts instance to a map.
  Map<String, dynamic> toJson() {
    return toMap();
  }
}
