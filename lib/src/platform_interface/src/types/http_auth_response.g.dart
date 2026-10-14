// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'http_auth_response.dart';

// **************************************************************************
// ExchangeableObjectGenerator
// **************************************************************************

///Class that represents the response used by the [CygnusPlatformWebViewCreationParams.onReceivedHttpAuthRequest] event.
class CygnusHttpAuthResponse {
  ///Indicate the [CygnusHttpAuthResponseAction] to take in response of the authentication challenge.
  CygnusHttpAuthResponseAction? action;

  ///Represents the password used for the authentication if the [action] corresponds to [CygnusHttpAuthResponseAction.PROCEED]
  String password;

  ///Indicate if the given credentials need to be saved permanently.
  bool permanentPersistence;

  ///Represents the username used for the authentication if the [action] corresponds to [CygnusHttpAuthResponseAction.PROCEED]
  String username;
  CygnusHttpAuthResponse({
    CygnusHttpAuthResponseAction? action,
    this.password = "",
    this.permanentPersistence = false,
    this.username = "",
  }) : action = action ?? CygnusHttpAuthResponseAction.CANCEL;

  ///Gets a possible [CygnusHttpAuthResponse] instance from a [Map] value.
  static CygnusHttpAuthResponse? fromMap(
    Map<String, dynamic>? map, {
    CygnusEnumMethod? enumMethod,
  }) {
    if (map == null) {
      return null;
    }
    final instance = CygnusHttpAuthResponse();
    instance.action = switch (enumMethod ?? CygnusEnumMethod.nativeValue) {
      CygnusEnumMethod.nativeValue =>
        CygnusHttpAuthResponseAction.fromNativeValue(map['action']),
      CygnusEnumMethod.value => CygnusHttpAuthResponseAction.fromValue(
        map['action'],
      ),
      CygnusEnumMethod.name => CygnusHttpAuthResponseAction.byName(
        map['action'],
      ),
    };
    if (map['password'] != null) {
      instance.password = map['password'];
    }
    if (map['permanentPersistence'] != null) {
      instance.permanentPersistence = map['permanentPersistence'];
    }
    if (map['username'] != null) {
      instance.username = map['username'];
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
      "password": password,
      "permanentPersistence": permanentPersistence,
      "username": username,
    };
  }

  ///Converts instance to a map.
  Map<String, dynamic> toJson() {
    return toMap();
  }

  @override
  String toString() {
    return 'CygnusHttpAuthResponse{action: $action, password: $password, permanentPersistence: $permanentPersistence, username: $username}';
  }
}
