import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:cygnus_core/src/platform_interface/flutter_webview_platform_interface.dart';

/// Object specifying creation parameters for creating a [IOSHttpAuthCredentialDatabase].
///
/// When adding additional fields make sure they can be null or have a default
/// value to avoid breaking changes. See [CygnusPlatformHttpAuthCredentialDatabaseCreationParams] for
/// more information.
@immutable
class IOSHttpAuthCredentialDatabaseCreationParams
    extends CygnusPlatformHttpAuthCredentialDatabaseCreationParams {
  /// Creates a new [IOSHttpAuthCredentialDatabaseCreationParams] instance.
  const IOSHttpAuthCredentialDatabaseCreationParams(
    // This parameter prevents breaking changes later.
    // ignore: avoid_unused_constructor_parameters
    CygnusPlatformHttpAuthCredentialDatabaseCreationParams params,
  ) : super();

  /// Creates a [IOSHttpAuthCredentialDatabaseCreationParams] instance based on [CygnusPlatformHttpAuthCredentialDatabaseCreationParams].
  factory IOSHttpAuthCredentialDatabaseCreationParams.fromPlatformHttpAuthCredentialDatabaseCreationParams(
    CygnusPlatformHttpAuthCredentialDatabaseCreationParams params,
  ) {
    return IOSHttpAuthCredentialDatabaseCreationParams(params);
  }
}

///{@macro cygnus_core.CygnusPlatformHttpAuthCredentialDatabase}
class IOSHttpAuthCredentialDatabase extends CygnusPlatformHttpAuthCredentialDatabase
    with ChannelController {
  /// Creates a new [IOSHttpAuthCredentialDatabase].
  IOSHttpAuthCredentialDatabase(
    CygnusPlatformHttpAuthCredentialDatabaseCreationParams params,
  ) : super.implementation(
        params is IOSHttpAuthCredentialDatabaseCreationParams
            ? params
            : IOSHttpAuthCredentialDatabaseCreationParams.fromPlatformHttpAuthCredentialDatabaseCreationParams(
                params,
              ),
      ) {
    channel = const MethodChannel(
      'com.github.knighting.cygnus/webview_credential_database',
    );
    handler = handleMethod;
    initMethodCallHandler();
  }

  static IOSHttpAuthCredentialDatabase? _instance;

  ///Gets the database shared instance.
  static IOSHttpAuthCredentialDatabase instance() {
    return (_instance != null) ? _instance! : _init();
  }

  static IOSHttpAuthCredentialDatabase _init() {
    _instance = IOSHttpAuthCredentialDatabase(
      IOSHttpAuthCredentialDatabaseCreationParams(
        const CygnusPlatformHttpAuthCredentialDatabaseCreationParams(),
      ),
    );
    return _instance!;
  }

  static final IOSHttpAuthCredentialDatabase _staticValue =
      IOSHttpAuthCredentialDatabase(
        IOSHttpAuthCredentialDatabaseCreationParams(
          const CygnusPlatformHttpAuthCredentialDatabaseCreationParams(),
        ),
      );

  factory IOSHttpAuthCredentialDatabase.static() {
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

extension InternalHttpAuthCredentialDatabase on IOSHttpAuthCredentialDatabase {
  get handleMethod => _handleMethod;
}
