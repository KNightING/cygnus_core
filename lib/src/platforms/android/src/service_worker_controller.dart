import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:cygnus_core/src/platform_interface/flutter_webview_platform_interface.dart';

/// Object specifying creation parameters for creating a [AndroidServiceWorkerController].
///
/// When adding additional fields make sure they can be null or have a default
/// value to avoid breaking changes. See [CygnusPlatformServiceWorkerControllerCreationParams] for
/// more information.
@immutable
class AndroidServiceWorkerControllerCreationParams
    extends CygnusPlatformServiceWorkerControllerCreationParams {
  /// Creates a new [AndroidServiceWorkerControllerCreationParams] instance.
  const AndroidServiceWorkerControllerCreationParams(
    // This parameter prevents breaking changes later.
    // ignore: avoid_unused_constructor_parameters
    CygnusPlatformServiceWorkerControllerCreationParams params,
  ) : super();

  /// Creates a [AndroidServiceWorkerControllerCreationParams] instance based on [CygnusPlatformServiceWorkerControllerCreationParams].
  factory AndroidServiceWorkerControllerCreationParams.fromPlatformServiceWorkerControllerCreationParams(
    CygnusPlatformServiceWorkerControllerCreationParams params,
  ) {
    return AndroidServiceWorkerControllerCreationParams(params);
  }
}

///{@macro cygnus_core.CygnusPlatformServiceWorkerController}
class AndroidServiceWorkerController extends CygnusPlatformServiceWorkerController
    with ChannelController {
  /// Creates a new [AndroidServiceWorkerController].
  AndroidServiceWorkerController(
    CygnusPlatformServiceWorkerControllerCreationParams params,
  ) : super.implementation(
        params is AndroidServiceWorkerControllerCreationParams
            ? params
            : AndroidServiceWorkerControllerCreationParams.fromPlatformServiceWorkerControllerCreationParams(
                params,
              ),
      ) {
    channel = const MethodChannel(
      'com.pichillilorenzo/flutter_inappwebview_serviceworkercontroller',
    );
    handler = handleMethod;
    initMethodCallHandler();
  }

  factory AndroidServiceWorkerController.static() {
    return instance();
  }

  static AndroidServiceWorkerController? _instance;

  ///Gets the [AndroidServiceWorkerController] shared instance.
  static AndroidServiceWorkerController instance() {
    return (_instance != null) ? _instance! : _init();
  }

  static AndroidServiceWorkerController _init() {
    _instance = AndroidServiceWorkerController(
      AndroidServiceWorkerControllerCreationParams(
        const CygnusPlatformServiceWorkerControllerCreationParams(),
      ),
    );
    return _instance!;
  }

  CygnusServiceWorkerClient? _serviceWorkerClient;

  @override
  CygnusServiceWorkerClient? get serviceWorkerClient => _serviceWorkerClient;

  @override
  Future<void> setServiceWorkerClient(CygnusServiceWorkerClient? value) async {
    Map<String, dynamic> args = <String, dynamic>{};
    args.putIfAbsent('isNull', () => value == null);
    await channel?.invokeMethod("setServiceWorkerClient", args);
    _serviceWorkerClient = value;
  }

  Future<dynamic> _handleMethod(MethodCall call) async {
    switch (call.method) {
      case "shouldInterceptRequest":
        if (serviceWorkerClient != null &&
            serviceWorkerClient!.shouldInterceptRequest != null) {
          Map<String, dynamic> arguments = call.arguments
              .cast<String, dynamic>();
          CygnusWebResourceRequest request = CygnusWebResourceRequest.fromMap(arguments)!;

          return (await serviceWorkerClient!.shouldInterceptRequest!(
            request,
          ))?.toMap();
        }
        break;
      default:
        throw UnimplementedError("Unimplemented ${call.method} method");
    }

    return null;
  }

  @override
  Future<bool> getAllowContentAccess() async {
    Map<String, dynamic> args = <String, dynamic>{};
    return await channel?.invokeMethod<bool>('getAllowContentAccess', args) ??
        false;
  }

  @override
  Future<bool> getAllowFileAccess() async {
    Map<String, dynamic> args = <String, dynamic>{};
    return await channel?.invokeMethod<bool>('getAllowFileAccess', args) ??
        false;
  }

  @override
  Future<bool> getBlockNetworkLoads() async {
    Map<String, dynamic> args = <String, dynamic>{};
    return await channel?.invokeMethod<bool>('getBlockNetworkLoads', args) ??
        false;
  }

  @override
  Future<CygnusCacheMode?> getCacheMode() async {
    Map<String, dynamic> args = <String, dynamic>{};
    return CygnusCacheMode.fromNativeValue(
      await channel?.invokeMethod<int?>('getCacheMode', args),
    );
  }

  @override
  Future<void> setAllowContentAccess(bool allow) async {
    Map<String, dynamic> args = <String, dynamic>{};
    args.putIfAbsent("allow", () => allow);
    await channel?.invokeMethod('setAllowContentAccess', args);
  }

  @override
  Future<void> setAllowFileAccess(bool allow) async {
    Map<String, dynamic> args = <String, dynamic>{};
    args.putIfAbsent("allow", () => allow);
    await channel?.invokeMethod('setAllowFileAccess', args);
  }

  @override
  Future<void> setBlockNetworkLoads(bool flag) async {
    Map<String, dynamic> args = <String, dynamic>{};
    args.putIfAbsent("flag", () => flag);
    await channel?.invokeMethod('setBlockNetworkLoads', args);
  }

  @override
  Future<void> setCacheMode(CygnusCacheMode mode) async {
    Map<String, dynamic> args = <String, dynamic>{};
    args.putIfAbsent("mode", () => mode.toNativeValue());
    await channel?.invokeMethod('setCacheMode', args);
  }

  @override
  void dispose() {
    // empty
  }
}

extension InternalServiceWorkerController on AndroidServiceWorkerController {
  get handleMethod => _handleMethod;
}
