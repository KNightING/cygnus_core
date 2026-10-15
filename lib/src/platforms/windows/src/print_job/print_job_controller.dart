import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:cygnus_core/src/platform_interface/flutter_webview_platform_interface.dart';

/// Object specifying creation parameters for creating a [WindowsPrintJobController].
///
/// When adding additional fields make sure they can be null or have a default
/// value to avoid breaking changes. See [CygnusPlatformPrintJobControllerCreationParams] for
/// more information.
@immutable
class WindowsPrintJobControllerCreationParams
    extends CygnusPlatformPrintJobControllerCreationParams {
  /// Creates a new [WindowsPrintJobControllerCreationParams] instance.
  const WindowsPrintJobControllerCreationParams({required super.id});

  /// Creates a [WindowsPrintJobControllerCreationParams] instance based on [CygnusPlatformPrintJobControllerCreationParams].
  factory WindowsPrintJobControllerCreationParams.fromPlatformPrintJobControllerCreationParams(
    // Recommended placeholder to prevent being broken by platform interface.
    // ignore: avoid_unused_constructor_parameters
    CygnusPlatformPrintJobControllerCreationParams params,
  ) {
    return WindowsPrintJobControllerCreationParams(id: params.id);
  }
}

///{@macro cygnus_core.CygnusPlatformPrintJobController}
class WindowsPrintJobController extends CygnusPlatformPrintJobController
    with ChannelController {
  /// Constructs a [WindowsPrintJobController].
  WindowsPrintJobController(CygnusPlatformPrintJobControllerCreationParams params)
    : super.implementation(
        params is WindowsPrintJobControllerCreationParams
            ? params
            : WindowsPrintJobControllerCreationParams.fromPlatformPrintJobControllerCreationParams(
                params,
              ),
      ) {
    channel = MethodChannel(
      'com.github.knighting.cygnus/webview_printjobcontroller_${params.id}',
    );
    handler = _handleMethod;
    initMethodCallHandler();
  }

  Future<dynamic> _handleMethod(MethodCall call) async {
    switch (call.method) {
      case "onComplete":
        bool completed = call.arguments["completed"];
        String? error = call.arguments["error"];
        if (onComplete != null) {
          onComplete!(completed, error);
        }
        break;
      default:
        throw UnimplementedError("Unimplemented ${call.method} method");
    }
  }

  @override
  Future<CygnusPrintJobInfo?> getInfo() async {
    Map<String, dynamic> args = <String, dynamic>{};
    Map<String, dynamic>? infoMap = (await channel?.invokeMethod(
      'getInfo',
      args,
    ))?.cast<String, dynamic>();
    return CygnusPrintJobInfo.fromMap(infoMap);
  }

  @override
  Future<void> dispose() async {
    Map<String, dynamic> args = <String, dynamic>{};
    await channel?.invokeMethod('dispose', args);
    disposeChannel();
  }
}
