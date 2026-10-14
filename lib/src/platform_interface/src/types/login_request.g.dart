// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_request.dart';

// **************************************************************************
// ExchangeableObjectGenerator
// **************************************************************************

///Class used by [CygnusPlatformWebViewCreationParams.onReceivedLoginRequest] event.
class CygnusLoginRequest {
  ///An optional account. If not `null`, the account should be checked against accounts on the device.
  ///If it is a valid account, it should be used to log in the user. This value may be `null`.
  String? account;

  ///Authenticator specific arguments used to log in the user.
  String args;

  ///The account realm used to look up accounts.
  String realm;
  CygnusLoginRequest({this.account, required this.args, required this.realm});

  ///Gets a possible [CygnusLoginRequest] instance from a [Map] value.
  static CygnusLoginRequest? fromMap(
    Map<String, dynamic>? map, {
    CygnusEnumMethod? enumMethod,
  }) {
    if (map == null) {
      return null;
    }
    final instance = CygnusLoginRequest(
      account: map['account'],
      args: map['args'],
      realm: map['realm'],
    );
    return instance;
  }

  ///Converts instance to a map.
  Map<String, dynamic> toMap({CygnusEnumMethod? enumMethod}) {
    return {"account": account, "args": args, "realm": realm};
  }

  ///Converts instance to a map.
  Map<String, dynamic> toJson() {
    return toMap();
  }

  @override
  String toString() {
    return 'CygnusLoginRequest{account: $account, args: $args, realm: $realm}';
  }
}
