import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:cygnus_core/src/platform_interface/flutter_webview_platform_interface.dart';

/// Object specifying creation parameters for creating a [LinuxProxyController].
///
/// When adding additional fields make sure they can be null or have a default
/// value to avoid breaking changes. See [CygnusPlatformProxyControllerCreationParams] for
/// more information.
@immutable
class LinuxProxyControllerCreationParams
    extends CygnusPlatformProxyControllerCreationParams {
  /// Creates a new [LinuxProxyControllerCreationParams] instance.
  const LinuxProxyControllerCreationParams(
    // This parameter prevents breaking changes later.
    // ignore: avoid_unused_constructor_parameters
    CygnusPlatformProxyControllerCreationParams params,
  ) : super();

  /// Creates a [LinuxProxyControllerCreationParams] instance based on [CygnusPlatformProxyControllerCreationParams].
  factory LinuxProxyControllerCreationParams.fromPlatformProxyControllerCreationParams(
    CygnusPlatformProxyControllerCreationParams params,
  ) {
    return LinuxProxyControllerCreationParams(params);
  }
}

///{@macro cygnus_core.CygnusPlatformProxyController}
///
/// Linux implementation of [CygnusPlatformProxyController] using WPE WebKit's
/// [WebKitNetworkProxySettings](https://wpewebkit.org/reference/stable/wpe-webkit-2.0/struct.NetworkProxySettings.html).
class LinuxProxyController extends CygnusPlatformProxyController {
  static const MethodChannel _channel = MethodChannel(
    'com.pichillilorenzo/flutter_inappwebview_proxycontroller',
  );

  /// Creates a new [LinuxProxyController].
  LinuxProxyController(CygnusPlatformProxyControllerCreationParams params)
    : super.implementation(
        params is LinuxProxyControllerCreationParams
            ? params
            : LinuxProxyControllerCreationParams.fromPlatformProxyControllerCreationParams(
                params,
              ),
      );

  static LinuxProxyController? _instance;

  /// Gets the [LinuxProxyController] shared instance.
  static LinuxProxyController instance() {
    return (_instance != null) ? _instance! : _init();
  }

  static LinuxProxyController _init() {
    _instance = LinuxProxyController(
      LinuxProxyControllerCreationParams(
        const CygnusPlatformProxyControllerCreationParams(),
      ),
    );
    return _instance!;
  }

  static final LinuxProxyController _staticValue = LinuxProxyController(
    LinuxProxyControllerCreationParams(
      const CygnusPlatformProxyControllerCreationParams(),
    ),
  );

  /// Provide static access.
  factory LinuxProxyController.static() {
    return _staticValue;
  }

  @override
  Future<void> setProxyOverride({required CygnusProxySettings settings}) async {
    Map<String, dynamic> args = <String, dynamic>{};
    args.putIfAbsent("settings", () => settings.toMap());
    await _channel.invokeMethod('setProxyOverride', args);
  }

  @override
  Future<void> clearProxyOverride() async {
    Map<String, dynamic> args = <String, dynamic>{};
    await _channel.invokeMethod('clearProxyOverride', args);
  }
}
