import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:cygnus_core/src/platform_interface/flutter_inappwebview_platform_interface.dart';

/// Object specifying creation parameters for creating a [IOSPrintJobController].
///
/// When adding additional fields make sure they can be null or have a default
/// value to avoid breaking changes. See [CygnusPlatformPrintJobControllerCreationParams] for
/// more information.
@immutable
class IOSPrintJobControllerCreationParams
    extends CygnusPlatformPrintJobControllerCreationParams {
  /// Creates a new [IOSPrintJobControllerCreationParams] instance.
  const IOSPrintJobControllerCreationParams({required super.id});

  /// Creates a [IOSPrintJobControllerCreationParams] instance based on [CygnusPlatformPrintJobControllerCreationParams].
  factory IOSPrintJobControllerCreationParams.fromPlatformPrintJobControllerCreationParams(
    // Recommended placeholder to prevent being broken by platform interface.
    // ignore: avoid_unused_constructor_parameters
    CygnusPlatformPrintJobControllerCreationParams params,
  ) {
    return IOSPrintJobControllerCreationParams(id: params.id);
  }
}

///{@macro cygnus_core.CygnusPlatformPrintJobController}
class IOSPrintJobController extends CygnusPlatformPrintJobController
    with ChannelController {
  /// Constructs a [IOSPrintJobController].
  IOSPrintJobController(CygnusPlatformPrintJobControllerCreationParams params)
    : super.implementation(
        params is IOSPrintJobControllerCreationParams
            ? params
            : IOSPrintJobControllerCreationParams.fromPlatformPrintJobControllerCreationParams(
                params,
              ),
      ) {
    channel = MethodChannel(
      'com.pichillilorenzo/flutter_inappwebview_printjobcontroller_${params.id}',
    );
    handler = _handleMethod;
    initMethodCallHandler();
  }

  static final IOSPrintJobController _staticValue = IOSPrintJobController(
    IOSPrintJobControllerCreationParams(id: ''),
  );

  /// Provide static access.
  factory IOSPrintJobController.static() {
    return _staticValue;
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
  Future<void> dismiss({bool animated = true}) async {
    Map<String, dynamic> args = <String, dynamic>{};
    args.putIfAbsent("animated", () => animated);
    await channel?.invokeMethod('dismiss', args);
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
