// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fetch_request.dart';

// **************************************************************************
// ExchangeableObjectGenerator
// **************************************************************************

///Class that represents a HTTP request created with JavaScript using the [Fetch API](https://developer.mozilla.org/en-US/docs/Web/API/Fetch_API/Using_Fetch).
class CygnusFetchRequest {
  ///Indicates the [CygnusFetchRequestAction] that can be used to control the request.
  CygnusFetchRequestAction? action;

  ///Body of the request.
  dynamic body;

  ///The cache mode used by the request.
  String? cache;

  ///The request credentials used by the request.
  CygnusFetchRequestCredential? credentials;

  ///The HTTP request headers.
  Map<String, dynamic>? headers;

  ///Contains the subresource integrity value of the request.
  String? integrity;

  ///The keepalive option used to allow the request to outlive the page.
  bool? keepalive;

  ///The HTTP request method used of the request.
  String? method;

  ///The mode used by the request.
  String? mode;

  ///The redirect mode used by the request.
  String? redirect;

  ///A String specifying no-referrer, client, or a URL.
  String? referrer;

  ///The value of the referer HTTP header.
  CygnusReferrerPolicy? referrerPolicy;

  ///The URL of the request.
  CygnusWebUri? url;
  CygnusFetchRequest({
    CygnusFetchRequestAction? action,
    this.body,
    this.cache,
    this.credentials,
    this.headers,
    this.integrity,
    this.keepalive,
    this.method,
    this.mode,
    this.redirect,
    this.referrer,
    this.referrerPolicy,
    this.url,
  }) : action = action ?? CygnusFetchRequestAction.PROCEED;

  ///Gets a possible [CygnusFetchRequest] instance from a [Map] value.
  static CygnusFetchRequest? fromMap(
    Map<String, dynamic>? map, {
    CygnusEnumMethod? enumMethod,
  }) {
    if (map == null) {
      return null;
    }
    final instance = CygnusFetchRequest(
      body: map['body'],
      cache: map['cache'],
      credentials: _fetchRequestCredentialDeserializer(
        map['credentials'],
        enumMethod: enumMethod,
      ),
      headers: map['headers']?.cast<String, dynamic>(),
      integrity: map['integrity'],
      keepalive: map['keepalive'],
      method: map['method'],
      mode: map['mode'],
      redirect: map['redirect'],
      referrer: map['referrer'],
      referrerPolicy: switch (enumMethod ?? CygnusEnumMethod.nativeValue) {
        CygnusEnumMethod.nativeValue => CygnusReferrerPolicy.fromNativeValue(
          map['referrerPolicy'],
        ),
        CygnusEnumMethod.value => CygnusReferrerPolicy.fromValue(
          map['referrerPolicy'],
        ),
        CygnusEnumMethod.name => CygnusReferrerPolicy.byName(
          map['referrerPolicy'],
        ),
      },
      url: map['url'] != null ? CygnusWebUri(map['url']) : null,
    );
    instance.action = switch (enumMethod ?? CygnusEnumMethod.nativeValue) {
      CygnusEnumMethod.nativeValue => CygnusFetchRequestAction.fromNativeValue(
        map['action'],
      ),
      CygnusEnumMethod.value => CygnusFetchRequestAction.fromValue(
        map['action'],
      ),
      CygnusEnumMethod.name => CygnusFetchRequestAction.byName(map['action']),
    };
    return instance;
  }

  ///Converts instance to a map.
  Map<String, dynamic> toMap({CygnusEnumMethod? enumMethod}) {
    return {
      "action": switch (enumMethod ?? CygnusEnumMethod.nativeValue) {
        CygnusEnumMethod.nativeValue => action?.toNativeValue(),
        CygnusEnumMethod.value => action?.toValue(),
        CygnusEnumMethod.name => action?.name(),
      },
      "body": body,
      "cache": cache,
      "credentials": credentials?.toMap(enumMethod: enumMethod),
      "headers": headers,
      "integrity": integrity,
      "keepalive": keepalive,
      "method": method,
      "mode": mode,
      "redirect": redirect,
      "referrer": referrer,
      "referrerPolicy": switch (enumMethod ?? CygnusEnumMethod.nativeValue) {
        CygnusEnumMethod.nativeValue => referrerPolicy?.toNativeValue(),
        CygnusEnumMethod.value => referrerPolicy?.toValue(),
        CygnusEnumMethod.name => referrerPolicy?.name(),
      },
      "url": url?.toString(),
    };
  }

  ///Converts instance to a map.
  Map<String, dynamic> toJson() {
    return toMap();
  }

  @override
  String toString() {
    return 'CygnusFetchRequest{action: $action, body: $body, cache: $cache, credentials: $credentials, headers: $headers, integrity: $integrity, keepalive: $keepalive, method: $method, mode: $mode, redirect: $redirect, referrer: $referrer, referrerPolicy: $referrerPolicy, url: $url}';
  }
}
