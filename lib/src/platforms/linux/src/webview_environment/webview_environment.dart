import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:cygnus_core/src/platform_interface/flutter_webview_platform_interface.dart';

/// Object specifying creation parameters for creating a [LinuxWebViewEnvironment].
///
/// Platform specific implementations can add additional fields by extending
/// this class.
@immutable
class LinuxWebViewEnvironmentCreationParams
    extends CygnusPlatformWebViewEnvironmentCreationParams {
  /// Creates a new [LinuxWebViewEnvironmentCreationParams] instance.
  const LinuxWebViewEnvironmentCreationParams({super.settings});

  /// Creates a [LinuxWebViewEnvironmentCreationParams] instance based on [CygnusPlatformWebViewEnvironmentCreationParams].
  factory LinuxWebViewEnvironmentCreationParams.fromPlatformWebViewEnvironmentCreationParams(
    // Recommended placeholder to prevent being broken by platform interface.
    // ignore: avoid_unused_constructor_parameters
    CygnusPlatformWebViewEnvironmentCreationParams params,
  ) {
    return LinuxWebViewEnvironmentCreationParams(settings: params.settings);
  }
}

/// Linux implementation of [CygnusPlatformWebViewEnvironment].
///
/// This class provides access to WPE WebKit version information and
/// WebKitWebContext management on Linux.
///
///**Officially Supported Platforms/Implementations**:
///- Linux
class LinuxWebViewEnvironment extends CygnusPlatformWebViewEnvironment
    with ChannelController {
  /// Static method channel for CygnusWebViewEnvironment operations.
  static final MethodChannel _staticChannel = MethodChannel(
    'com.github.knighting.cygnus/webview_environment',
  );

  @override
  final String id = IdGenerator.generate();

  /// Creates a new [LinuxWebViewEnvironment].
  LinuxWebViewEnvironment(CygnusPlatformWebViewEnvironmentCreationParams params)
    : super.implementation(
        params is LinuxWebViewEnvironmentCreationParams
            ? params
            : LinuxWebViewEnvironmentCreationParams.fromPlatformWebViewEnvironmentCreationParams(
                params,
              ),
      );

  /// Static instance for accessing static methods.
  static final LinuxWebViewEnvironment _staticValue = LinuxWebViewEnvironment(
    LinuxWebViewEnvironmentCreationParams(),
  );

  /// Factory constructor for accessing static methods.
  factory LinuxWebViewEnvironment.static() {
    return _staticValue;
  }

  _debugLog(String method, dynamic args) {
    debugLog(
      className: runtimeType.toString(),
      id: id,
      debugLoggingSettings: CygnusPlatformWebViewEnvironment.debugLoggingSettings,
      method: method,
      args: args,
    );
  }

  Future<dynamic> _handleMethod(MethodCall call) async {
    if (CygnusPlatformWebViewEnvironment.debugLoggingSettings.enabled) {
      _debugLog(call.method, call.arguments);
    }

    switch (call.method) {
      default:
        throw UnimplementedError("Unimplemented ${call.method} method");
    }
  }

  /// {@macro cygnus_core.CygnusPlatformWebViewEnvironment.create}
  ///
  /// On Linux, this creates a new WebKitWebContext instance.
  @override
  Future<LinuxWebViewEnvironment> create({
    CygnusWebViewEnvironmentSettings? settings,
  }) async {
    final env = LinuxWebViewEnvironment(
      LinuxWebViewEnvironmentCreationParams(settings: settings),
    );

    Map<String, dynamic> args = <String, dynamic>{};
    args.putIfAbsent('id', () => env.id);
    if (settings != null) {
      args.putIfAbsent('settings', () => settings.toMap());
    }
    await _staticChannel.invokeMethod('create', args);

    env.channel = MethodChannel(
      'com.github.knighting.cygnus/webview_environment_${env.id}',
    );
    env.handler = env.handleMethod;
    env.initMethodCallHandler();
    return env;
  }

  /// {@macro cygnus_core.CygnusPlatformWebViewEnvironment.getAvailableVersion}
  ///
  /// On Linux, this returns the WPE WebKit version (e.g., "2.42.0").
  ///
  /// The [browserExecutableFolder] parameter is ignored on Linux as WPE WebKit
  /// is a system library.
  @override
  Future<String?> getAvailableVersion({String? browserExecutableFolder}) async {
    return await _staticChannel.invokeMethod<String>('getAvailableVersion');
  }

  /// {@macro cygnus_core.CygnusPlatformWebViewEnvironment.isSpellCheckingEnabled}
  @override
  Future<bool> isSpellCheckingEnabled() async {
    return await channel?.invokeMethod<bool>('isSpellCheckingEnabled') ?? false;
  }

  /// {@macro cygnus_core.CygnusPlatformWebViewEnvironment.getSpellCheckingLanguages}
  @override
  Future<List<String>> getSpellCheckingLanguages() async {
    final result = await channel?.invokeMethod<List>(
      'getSpellCheckingLanguages',
    );
    return result?.cast<String>() ?? [];
  }

  /// {@macro cygnus_core.CygnusPlatformWebViewEnvironment.getCacheModel}
  @override
  Future<CygnusCacheModel?> getCacheModel() async {
    final result = await channel?.invokeMethod<int>('getCacheModel');
    return CygnusCacheModel.fromNativeValue(result);
  }

  /// {@macro cygnus_core.CygnusPlatformWebViewEnvironment.isAutomationAllowed}
  @override
  Future<bool> isAutomationAllowed() async {
    return await channel?.invokeMethod<bool>('isAutomationAllowed') ?? false;
  }

  @override
  Future<void> dispose() async {
    Map<String, dynamic> args = <String, dynamic>{};
    await channel?.invokeMethod('dispose', args);
    disposeChannel();
  }
}

extension InternalLinuxWebViewEnvironment on LinuxWebViewEnvironment {
  get handleMethod => _handleMethod;
}
