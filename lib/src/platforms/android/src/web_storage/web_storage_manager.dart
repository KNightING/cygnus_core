import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:cygnus_core/src/platform_interface/flutter_webview_platform_interface.dart';

/// Object specifying creation parameters for creating a [AndroidWebStorageManager].
///
/// When adding additional fields make sure they can be null or have a default
/// value to avoid breaking changes. See [CygnusPlatformWebStorageManagerCreationParams] for
/// more information.
@immutable
class AndroidWebStorageManagerCreationParams
    extends CygnusPlatformWebStorageManagerCreationParams {
  /// Creates a new [AndroidWebStorageManagerCreationParams] instance.
  const AndroidWebStorageManagerCreationParams(
    // This parameter prevents breaking changes later.
    // ignore: avoid_unused_constructor_parameters
    CygnusPlatformWebStorageManagerCreationParams params,
  ) : super();

  /// Creates a [AndroidWebStorageManagerCreationParams] instance based on [CygnusPlatformWebStorageManagerCreationParams].
  factory AndroidWebStorageManagerCreationParams.fromPlatformWebStorageManagerCreationParams(
    CygnusPlatformWebStorageManagerCreationParams params,
  ) {
    return AndroidWebStorageManagerCreationParams(params);
  }
}

///{@macro cygnus_core.CygnusPlatformWebStorageManager}
class AndroidWebStorageManager extends CygnusPlatformWebStorageManager
    with ChannelController {
  /// Creates a new [AndroidWebStorageManager].
  AndroidWebStorageManager(CygnusPlatformWebStorageManagerCreationParams params)
    : super.implementation(
        params is AndroidWebStorageManagerCreationParams
            ? params
            : AndroidWebStorageManagerCreationParams.fromPlatformWebStorageManagerCreationParams(
                params,
              ),
      ) {
    channel = const MethodChannel(
      'com.pichillilorenzo/flutter_inappwebview_webstoragemanager',
    );
    handler = _handleMethod;
    initMethodCallHandler();
  }

  static AndroidWebStorageManager? _instance;

  ///Gets the CygnusWebStorage manager shared instance.
  static AndroidWebStorageManager instance() {
    return (_instance != null) ? _instance! : _init();
  }

  static AndroidWebStorageManager _init() {
    _instance = AndroidWebStorageManager(
      AndroidWebStorageManagerCreationParams(
        const CygnusPlatformWebStorageManagerCreationParams(),
      ),
    );
    return _instance!;
  }

  static AndroidWebStorageManager? _static;

  /// Provide static access.
  factory AndroidWebStorageManager.static() {
    _static ??= AndroidWebStorageManager(
      AndroidWebStorageManagerCreationParams(
        const CygnusPlatformWebStorageManagerCreationParams(),
      ),
    );
    return _static!;
  }

  Future<dynamic> _handleMethod(MethodCall call) async {}

  @override
  Future<List<CygnusWebStorageOrigin>> getOrigins() async {
    List<CygnusWebStorageOrigin> originsList = [];

    Map<String, dynamic> args = <String, dynamic>{};
    List<Map<dynamic, dynamic>> origins =
        (await channel?.invokeMethod<List>(
          'getOrigins',
          args,
        ))?.cast<Map<dynamic, dynamic>>() ??
        [];

    for (var origin in origins) {
      originsList.add(
        CygnusWebStorageOrigin(
          origin: origin["origin"],
          quota: origin["quota"],
          usage: origin["usage"],
        ),
      );
    }

    return originsList;
  }

  @override
  Future<void> deleteAllData() async {
    Map<String, dynamic> args = <String, dynamic>{};
    await channel?.invokeMethod('deleteAllData', args);
  }

  @override
  Future<void> deleteOrigin({required String origin}) async {
    Map<String, dynamic> args = <String, dynamic>{};
    args.putIfAbsent("origin", () => origin);
    await channel?.invokeMethod('deleteOrigin', args);
  }

  @override
  Future<int> getQuotaForOrigin({required String origin}) async {
    Map<String, dynamic> args = <String, dynamic>{};
    args.putIfAbsent("origin", () => origin);
    return await channel?.invokeMethod<int>('getQuotaForOrigin', args) ?? 0;
  }

  @override
  Future<int> getUsageForOrigin({required String origin}) async {
    Map<String, dynamic> args = <String, dynamic>{};
    args.putIfAbsent("origin", () => origin);
    return await channel?.invokeMethod<int>('getUsageForOrigin', args) ?? 0;
  }

  @override
  void dispose() {
    // empty
  }
}
