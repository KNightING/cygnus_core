import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:cygnus_core/src/platform_interface/flutter_webview_platform_interface.dart';

/// Object specifying creation parameters for creating a [WindowsWebViewEnvironment].
///
/// Platform specific implementations can add additional fields by extending
/// this class.
@immutable
class WindowsWebViewEnvironmentCreationParams
    extends CygnusPlatformWebViewEnvironmentCreationParams {
  /// Creates a new [WindowsInAppWebViewControllerCreationParams] instance.
  const WindowsWebViewEnvironmentCreationParams({super.settings});

  /// Creates a [WindowsInAppWebViewControllerCreationParams] instance based on [CygnusPlatformWebViewControllerCreationParams].
  factory WindowsWebViewEnvironmentCreationParams.fromPlatformWebViewEnvironmentCreationParams(
    // Recommended placeholder to prevent being broken by platform interface.
    // ignore: avoid_unused_constructor_parameters
    CygnusPlatformWebViewEnvironmentCreationParams params,
  ) {
    return WindowsWebViewEnvironmentCreationParams(settings: params.settings);
  }
}

///Controls a WebView Environment used by WebView instances.
///
///**Officially Supported Platforms/Implementations**:
///- Windows
class WindowsWebViewEnvironment extends CygnusPlatformWebViewEnvironment
    with ChannelController {
  static final MethodChannel _staticChannel = MethodChannel(
    'com.github.knighting.cygnus/webview_environment',
  );

  @override
  final String id = IdGenerator.generate();

  WindowsWebViewEnvironment(CygnusPlatformWebViewEnvironmentCreationParams params)
    : super.implementation(
        params is WindowsWebViewEnvironmentCreationParams
            ? params
            : WindowsWebViewEnvironmentCreationParams.fromPlatformWebViewEnvironmentCreationParams(
                params,
              ),
      );

  static final WindowsWebViewEnvironment _staticValue =
      WindowsWebViewEnvironment(WindowsWebViewEnvironmentCreationParams());

  factory WindowsWebViewEnvironment.static() {
    return _staticValue;
  }

  _debugLog(String method, dynamic args) {
    debugLog(
      className: this.runtimeType.toString(),
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
      case 'onNewBrowserVersionAvailable':
        if (onNewBrowserVersionAvailable != null) {
          onNewBrowserVersionAvailable?.call();
        }
        break;
      case 'onBrowserProcessExited':
        if (onBrowserProcessExited != null) {
          Map<String, dynamic> arguments = call.arguments
              .cast<String, dynamic>();
          final detail = CygnusBrowserProcessExitedDetail.fromMap(arguments)!;
          onBrowserProcessExited?.call(detail);
        }
        break;
      case 'onProcessInfosChanged':
        if (onProcessInfosChanged != null) {
          Map<String, dynamic> arguments = call.arguments
              .cast<String, dynamic>();
          final detail = CygnusBrowserProcessInfosChangedDetail.fromMap(arguments)!;
          onProcessInfosChanged?.call(detail);
        }
      default:
        throw UnimplementedError("Unimplemented ${call.method} method");
    }
    return null;
  }

  @override
  Future<bool> isInterfaceSupported(CygnusWebViewInterface interface) async {
    Map<String, dynamic> args = <String, dynamic>{};
    args.putIfAbsent('interface', () => interface.toNativeValue());
    return await channel?.invokeMethod<bool>('isInterfaceSupported', args) ??
        false;
  }

  @override
  Future<List<CygnusBrowserProcessInfo>> getProcessInfos() async {
    Map<String, dynamic> args = <String, dynamic>{};
    final result = await channel?.invokeMethod<List<dynamic>>(
      'getProcessInfos',
      args,
    );
    return result
            ?.map((e) => CygnusBrowserProcessInfo.fromMap(e.cast<String, dynamic>()))
            .whereType<CygnusBrowserProcessInfo>()
            .toList() ??
        [];
  }

  @override
  Future<String?> getFailureReportFolderPath() async {
    Map<String, dynamic> args = <String, dynamic>{};
    return await channel?.invokeMethod<String>(
      'getFailureReportFolderPath',
      args,
    );
  }

  @override
  Future<WindowsWebViewEnvironment> create({
    CygnusWebViewEnvironmentSettings? settings,
  }) async {
    final env = WindowsWebViewEnvironment(
      WindowsWebViewEnvironmentCreationParams(settings: settings),
    );

    Map<String, dynamic> args = <String, dynamic>{};
    args.putIfAbsent('id', () => env.id);
    args.putIfAbsent('settings', () => env.settings?.toMap());
    await _staticChannel.invokeMethod('create', args);

    env.channel = MethodChannel(
      'com.github.knighting.cygnus/webview_environment_${env.id}',
    );
    env.handler = env.handleMethod;
    env.initMethodCallHandler();
    return env;
  }

  @override
  Future<String?> getAvailableVersion({String? browserExecutableFolder}) async {
    Map<String, dynamic> args = <String, dynamic>{};
    args.putIfAbsent('browserExecutableFolder', () => browserExecutableFolder);
    return await _staticChannel.invokeMethod<String>(
      'getAvailableVersion',
      args,
    );
  }

  @override
  Future<int?> compareBrowserVersions({
    required String version1,
    required String version2,
  }) async {
    Map<String, dynamic> args = <String, dynamic>{};
    args.putIfAbsent('version1', () => version1);
    args.putIfAbsent('version2', () => version2);
    return await _staticChannel.invokeMethod<int>(
      'compareBrowserVersions',
      args,
    );
  }

  @override
  Future<void> dispose() async {
    Map<String, dynamic> args = <String, dynamic>{};
    await channel?.invokeMethod('dispose', args);
    disposeChannel();
  }
}

extension InternalWindowsWebViewEnvironment on WindowsWebViewEnvironment {
  get handleMethod => _handleMethod;
}
