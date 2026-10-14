// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'permission_request.dart';

// **************************************************************************
// ExchangeableObjectGenerator
// **************************************************************************

///Class that represents the response used by the [CygnusPlatformWebViewCreationParams.onPermissionRequest] event.
class CygnusPermissionRequest {
  ///The frame that initiates the request in the web view.
  CygnusFrameInfo? frame;

  ///The origin of web content which attempt to access the restricted resources.
  CygnusWebUri origin;

  ///List of resources the web content wants to access.
  ///
  ///**NOTE for iOS, macOS and Windows**: this list will have only 1 element and will be used by the [CygnusPermissionResponse.action]
  ///as the resource to consider when applying the corresponding action.
  List<CygnusPermissionResourceType> resources;
  CygnusPermissionRequest({
    this.frame,
    required this.origin,
    this.resources = const [],
  });

  ///Gets a possible [CygnusPermissionRequest] instance from a [Map] value.
  static CygnusPermissionRequest? fromMap(
    Map<String, dynamic>? map, {
    CygnusEnumMethod? enumMethod,
  }) {
    if (map == null) {
      return null;
    }
    final instance = CygnusPermissionRequest(
      frame: CygnusFrameInfo.fromMap(
        map['frame']?.cast<String, dynamic>(),
        enumMethod: enumMethod,
      ),
      origin: CygnusWebUri(map['origin']),
    );
    if (map['resources'] != null) {
      instance.resources = List<CygnusPermissionResourceType>.from(
        map['resources'].map(
          (e) => switch (enumMethod ?? CygnusEnumMethod.nativeValue) {
            CygnusEnumMethod.nativeValue =>
              CygnusPermissionResourceType.fromNativeValue(e),
            CygnusEnumMethod.value => CygnusPermissionResourceType.fromValue(e),
            CygnusEnumMethod.name => CygnusPermissionResourceType.byName(e),
          }!,
        ),
      );
    }
    return instance;
  }

  ///Converts instance to a map.
  Map<String, dynamic> toMap({CygnusEnumMethod? enumMethod}) {
    return {
      "frame": frame?.toMap(enumMethod: enumMethod),
      "origin": origin.toString(),
      "resources": resources
          .map(
            (e) => switch (enumMethod ?? CygnusEnumMethod.nativeValue) {
              CygnusEnumMethod.nativeValue => e.toNativeValue(),
              CygnusEnumMethod.value => e.toValue(),
              CygnusEnumMethod.name => e.name(),
            },
          )
          .toList(),
    };
  }

  ///Converts instance to a map.
  Map<String, dynamic> toJson() {
    return toMap();
  }

  @override
  String toString() {
    return 'CygnusPermissionRequest{frame: $frame, origin: $origin, resources: $resources}';
  }
}
