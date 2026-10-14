// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'permission_response.dart';

// **************************************************************************
// ExchangeableObjectGenerator
// **************************************************************************

///Class that represents the response used by the [CygnusPlatformWebViewCreationParams.onPermissionRequest] event.
class CygnusPermissionResponse {
  ///Indicate the [CygnusPermissionResponseAction] to take in response of a permission request.
  CygnusPermissionResponseAction? action;

  ///Resources granted to be accessed by origin.
  ///
  ///**NOTE for iOS, macOS and Windows**: not used. The [action] taken is based on the [CygnusPermissionRequest.resources].
  List<CygnusPermissionResourceType> resources;
  CygnusPermissionResponse({
    CygnusPermissionResponseAction? action,
    this.resources = const [],
  }) : action = action ?? CygnusPermissionResponseAction.DENY;

  ///Gets a possible [CygnusPermissionResponse] instance from a [Map] value.
  static CygnusPermissionResponse? fromMap(
    Map<String, dynamic>? map, {
    CygnusEnumMethod? enumMethod,
  }) {
    if (map == null) {
      return null;
    }
    final instance = CygnusPermissionResponse();
    instance.action = switch (enumMethod ?? CygnusEnumMethod.nativeValue) {
      CygnusEnumMethod.nativeValue =>
        CygnusPermissionResponseAction.fromNativeValue(map['action']),
      CygnusEnumMethod.value => CygnusPermissionResponseAction.fromValue(
        map['action'],
      ),
      CygnusEnumMethod.name => CygnusPermissionResponseAction.byName(
        map['action'],
      ),
    };
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
      "action": switch (enumMethod ?? CygnusEnumMethod.nativeValue) {
        CygnusEnumMethod.nativeValue => action?.toNativeValue(),
        CygnusEnumMethod.value => action?.toValue(),
        CygnusEnumMethod.name => action?.name(),
      },
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
    return 'CygnusPermissionResponse{action: $action, resources: $resources}';
  }
}

///Class that represents the response used by the [CygnusPlatformWebViewCreationParams.androidOnPermissionRequest] event.
///Use [CygnusPermissionResponse] instead.
@Deprecated('Use CygnusPermissionResponse instead')
class CygnusPermissionRequestResponse {
  ///Indicate the [CygnusPermissionRequestResponseAction] to take in response of a permission request.
  CygnusPermissionRequestResponseAction? action;

  ///Resources granted to be accessed by origin.
  List<String> resources;
  CygnusPermissionRequestResponse({
    CygnusPermissionRequestResponseAction? action,
    this.resources = const [],
  }) : action = action ?? CygnusPermissionRequestResponseAction.DENY;

  ///Gets a possible [CygnusPermissionRequestResponse] instance from a [Map] value.
  static CygnusPermissionRequestResponse? fromMap(
    Map<String, dynamic>? map, {
    CygnusEnumMethod? enumMethod,
  }) {
    if (map == null) {
      return null;
    }
    final instance = CygnusPermissionRequestResponse();
    instance.action = switch (enumMethod ?? CygnusEnumMethod.nativeValue) {
      CygnusEnumMethod.nativeValue =>
        CygnusPermissionRequestResponseAction.fromNativeValue(map['action']),
      CygnusEnumMethod.value => CygnusPermissionRequestResponseAction.fromValue(
        map['action'],
      ),
      CygnusEnumMethod.name => CygnusPermissionRequestResponseAction.byName(
        map['action'],
      ),
    };
    if (map['resources'] != null) {
      instance.resources = List<String>.from(map['resources']!.cast<String>());
    }
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
      "resources": resources,
    };
  }

  ///Converts instance to a map.
  Map<String, dynamic> toJson() {
    return toMap();
  }

  @override
  String toString() {
    return 'CygnusPermissionRequestResponse{action: $action, resources: $resources}';
  }
}
