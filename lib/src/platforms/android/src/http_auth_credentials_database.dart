import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:cygnus_core/src/platform_interface/flutter_webview_platform_interface.dart';

/// Object specifying creation parameters for creating a [AndroidHttpAuthCredentialDatabase].
///
/// When adding additional fields make sure they can be null or have a default
/// value to avoid breaking changes. See [CygnusPlatformHttpAuthCredentialDatabaseCreationParams] for
/// more information.
@immutable
class AndroidHttpAuthCredentialDatabaseCreationParams
    extends CygnusPlatformHttpAuthCredentialDatabaseCreationParams {
  /// Creates a new [AndroidHttpAuthCredentialDatabaseCreationParams] instance.
  const AndroidHttpAuthCredentialDatabaseCreationParams(
    // This parameter prevents breaking changes later.
    // ignore: avoid_unused_constructor_parameters
    CygnusPlatformHttpAuthCredentialDatabaseCreationParams params,
  ) : super();

  /// Creates a [AndroidHttpAuthCredentialDatabaseCreationParams] instance based on [CygnusPlatformHttpAuthCredentialDatabaseCreationParams].
  factory AndroidHttpAuthCredentialDatabaseCreationParams.fromPlatformHttpAuthCredentialDatabaseCreationParams(
    CygnusPlatformHttpAuthCredentialDatabaseCreationParams params,
  ) {
    return AndroidHttpAuthCredentialDatabaseCreationParams(params);
  }
}

///{@macro cygnus_core.CygnusPlatformHttpAuthCredentialDatabase}
class AndroidHttpAuthCredentialDatabase
    extends CygnusPlatformHttpAuthCredentialDatabase
    with ChannelController {
  /// Creates a new [AndroidHttpAuthCredentialDatabase].
  AndroidHttpAuthCredentialDatabase(
    CygnusPlatformHttpAuthCredentialDatabaseCreationParams params,
  ) : super.implementation(
        params is AndroidHttpAuthCredentialDatabaseCreationParams
            ? params
            : AndroidHttpAuthCredentialDatabaseCreationParams.fromPlatformHttpAuthCredentialDatabaseCreationParams(
                params,
              ),
      ) {
    channel = const MethodChannel(
      'com.github.knighting.cygnus/webview_credential_database',
    );
    handler = handleMethod;
    initMethodCallHandler();
  }

  static AndroidHttpAuthCredentialDatabase? _instance;

  ///Gets the database shared instance.
  static AndroidHttpAuthCredentialDatabase instance() {
    return (_instance != null) ? _instance! : _init();
  }

  static AndroidHttpAuthCredentialDatabase _init() {
    _instance = AndroidHttpAuthCredentialDatabase(
      AndroidHttpAuthCredentialDatabaseCreationParams(
        const CygnusPlatformHttpAuthCredentialDatabaseCreationParams(),
      ),
    );
    return _instance!;
  }

  static final AndroidHttpAuthCredentialDatabase _staticValue =
      AndroidHttpAuthCredentialDatabase(
        AndroidHttpAuthCredentialDatabaseCreationParams(
          const CygnusPlatformHttpAuthCredentialDatabaseCreationParams(),
        ),
      );

  factory AndroidHttpAuthCredentialDatabase.static() {
    return _staticValue;
  }

  Future<dynamic> _handleMethod(MethodCall call) async {}

  @override
  Future<List<CygnusURLProtectionSpaceHttpAuthCredentials>>
  getAllAuthCredentials() async {
    Map<String, dynamic> args = <String, dynamic>{};
    List<dynamic> allCredentials =
        await channel?.invokeMethod<List>('getAllAuthCredentials', args) ?? [];

    List<CygnusURLProtectionSpaceHttpAuthCredentials> result = [];

    for (Map<dynamic, dynamic> map in allCredentials) {
      var element = CygnusURLProtectionSpaceHttpAuthCredentials.fromMap(
        map.cast<String, dynamic>(),
      );
      if (element != null) {
        result.add(element);
      }
    }
    return result;
  }

  @override
  Future<List<CygnusURLCredential>> getHttpAuthCredentials({
    required CygnusURLProtectionSpace protectionSpace,
  }) async {
    Map<String, dynamic> args = <String, dynamic>{};
    args.putIfAbsent("host", () => protectionSpace.host);
    args.putIfAbsent("protocol", () => protectionSpace.protocol);
    args.putIfAbsent("realm", () => protectionSpace.realm);
    args.putIfAbsent("port", () => protectionSpace.port);
    List<dynamic> credentialList =
        await channel?.invokeMethod<List>('getHttpAuthCredentials', args) ?? [];
    List<CygnusURLCredential> credentials = [];
    for (Map<dynamic, dynamic> map in credentialList) {
      var credential = CygnusURLCredential.fromMap(map.cast<String, dynamic>());
      if (credential != null) {
        credentials.add(credential);
      }
    }
    return credentials;
  }

  @override
  Future<void> setHttpAuthCredential({
    required CygnusURLProtectionSpace protectionSpace,
    required CygnusURLCredential credential,
  }) async {
    Map<String, dynamic> args = <String, dynamic>{};
    args.putIfAbsent("host", () => protectionSpace.host);
    args.putIfAbsent("protocol", () => protectionSpace.protocol);
    args.putIfAbsent("realm", () => protectionSpace.realm);
    args.putIfAbsent("port", () => protectionSpace.port);
    args.putIfAbsent("username", () => credential.username);
    args.putIfAbsent("password", () => credential.password);
    await channel?.invokeMethod('setHttpAuthCredential', args);
  }

  @override
  Future<void> removeHttpAuthCredential({
    required CygnusURLProtectionSpace protectionSpace,
    required CygnusURLCredential credential,
  }) async {
    Map<String, dynamic> args = <String, dynamic>{};
    args.putIfAbsent("host", () => protectionSpace.host);
    args.putIfAbsent("protocol", () => protectionSpace.protocol);
    args.putIfAbsent("realm", () => protectionSpace.realm);
    args.putIfAbsent("port", () => protectionSpace.port);
    args.putIfAbsent("username", () => credential.username);
    args.putIfAbsent("password", () => credential.password);
    await channel?.invokeMethod('removeHttpAuthCredential', args);
  }

  @override
  Future<void> removeHttpAuthCredentials({
    required CygnusURLProtectionSpace protectionSpace,
  }) async {
    Map<String, dynamic> args = <String, dynamic>{};
    args.putIfAbsent("host", () => protectionSpace.host);
    args.putIfAbsent("protocol", () => protectionSpace.protocol);
    args.putIfAbsent("realm", () => protectionSpace.realm);
    args.putIfAbsent("port", () => protectionSpace.port);
    await channel?.invokeMethod('removeHttpAuthCredentials', args);
  }

  @override
  Future<void> clearAllAuthCredentials() async {
    Map<String, dynamic> args = <String, dynamic>{};
    await channel?.invokeMethod('clearAllAuthCredentials', args);
  }

  @override
  void dispose() {
    // empty
  }
}

extension InternalHttpAuthCredentialDatabase
    on AndroidHttpAuthCredentialDatabase {
  get handleMethod => _handleMethod;
}
