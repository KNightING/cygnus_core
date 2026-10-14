// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'loaded_resource.dart';

// **************************************************************************
// ExchangeableObjectGenerator
// **************************************************************************

///Class representing a resource response of the `WebView`.
///It is used by the method [CygnusPlatformWebViewCreationParams.onLoadResource].
class CygnusLoadedResource {
  ///Returns the [DOMHighResTimeStamp](https://developer.mozilla.org/en-US/docs/Web/API/DOMHighResTimeStamp) duration to fetch a resource.
  double? duration;

  ///A string representing the type of resource.
  String? initiatorType;

  ///Returns the [DOMHighResTimeStamp](https://developer.mozilla.org/en-US/docs/Web/API/DOMHighResTimeStamp) for the time a resource fetch started.
  double? startTime;

  ///Resource URL.
  CygnusWebUri? url;
  CygnusLoadedResource({
    this.duration,
    this.initiatorType,
    this.startTime,
    this.url,
  });

  ///Gets a possible [CygnusLoadedResource] instance from a [Map] value.
  static CygnusLoadedResource? fromMap(
    Map<String, dynamic>? map, {
    CygnusEnumMethod? enumMethod,
  }) {
    if (map == null) {
      return null;
    }
    final instance = CygnusLoadedResource(
      duration: map['duration'],
      initiatorType: map['initiatorType'],
      startTime: map['startTime'],
      url: map['url'] != null ? CygnusWebUri(map['url']) : null,
    );
    return instance;
  }

  ///Converts instance to a map.
  Map<String, dynamic> toMap({CygnusEnumMethod? enumMethod}) {
    return {
      "duration": duration,
      "initiatorType": initiatorType,
      "startTime": startTime,
      "url": url?.toString(),
    };
  }

  ///Converts instance to a map.
  Map<String, dynamic> toJson() {
    return toMap();
  }

  @override
  String toString() {
    return 'CygnusLoadedResource{duration: $duration, initiatorType: $initiatorType, startTime: $startTime, url: $url}';
  }
}
