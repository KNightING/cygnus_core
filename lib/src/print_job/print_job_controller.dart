import 'package:flutter/foundation.dart';
import 'package:cygnus_core/src/platform_interface/flutter_inappwebview_platform_interface.dart';

///{@macro cygnus_core.PlatformPrintJobController}
///
///{@macro cygnus_core.PlatformPrintJobController.supported_platforms}
class PrintJobController {
  ///{@macro cygnus_core.PlatformPrintJobController}
  ///
  ///{@macro cygnus_core.PlatformPrintJobController.supported_platforms}
  PrintJobController({required String id})
    : this.fromPlatformCreationParams(
        params: PlatformPrintJobControllerCreationParams(id: id),
      );

  /// Constructs a [PrintJobController].
  ///
  /// See [PrintJobController.fromPlatformCreationParams] for setting parameters for
  /// a specific platform.
  PrintJobController.fromPlatformCreationParams({
    required PlatformPrintJobControllerCreationParams params,
  }) : this.fromPlatform(platform: PlatformPrintJobController(params));

  /// Constructs a [PrintJobController] from a specific platform implementation.
  PrintJobController.fromPlatform({required this.platform});

  /// Implementation of [PlatformPrintJobController] for the current platform.
  final PlatformPrintJobController platform;

  ///{@macro cygnus_core.PlatformPrintJobController.id}
  ///
  ///{@macro cygnus_core.PlatformPrintJobController.id.supported_platforms}
  String get id => platform.id;

  ///{@macro cygnus_core.PlatformPrintJobController.onComplete}
  ///
  ///{@macro cygnus_core.PlatformPrintJobController.onComplete.supported_platforms}
  PrintJobCompletionHandler? get onComplete => platform.onComplete;

  void set onComplete(PrintJobCompletionHandler? handler) {
    platform.onComplete = handler;
  }

  ///{@macro cygnus_core.PlatformPrintJobController.cancel}
  ///
  ///{@macro cygnus_core.PlatformPrintJobController.cancel.supported_platforms}
  Future<void> cancel() => platform.cancel();

  ///{@macro cygnus_core.PlatformPrintJobController.restart}
  ///
  ///{@macro cygnus_core.PlatformPrintJobController.restart.supported_platforms}
  Future<void> restart() => platform.restart();

  ///{@macro cygnus_core.PlatformPrintJobController.dismiss}
  ///
  ///{@macro cygnus_core.PlatformPrintJobController.dismiss.supported_platforms}
  Future<void> dismiss({bool animated = true}) =>
      platform.dismiss(animated: animated);

  ///{@macro cygnus_core.PlatformPrintJobController.getInfo}
  ///
  ///{@macro cygnus_core.PlatformPrintJobController.getInfo.supported_platforms}
  Future<PrintJobInfo?> getInfo() => platform.getInfo();

  ///{@macro cygnus_core.PlatformPrintJobController.dispose}
  ///
  ///{@macro cygnus_core.PlatformPrintJobController.dispose.supported_platforms}
  void dispose() => platform.dispose();

  ///{@macro cygnus_core.PlatformPrintJobControllerCreationParams.isClassSupported}
  static bool isClassSupported({TargetPlatform? platform}) =>
      PlatformPrintJobController.static().isClassSupported(platform: platform);

  ///{@macro cygnus_core.PlatformPrintJobController.isPropertySupported}
  static bool isPropertySupported(
    dynamic property, {
    TargetPlatform? platform,
  }) => PlatformPrintJobController.static().isPropertySupported(
    property,
    platform: platform,
  );

  ///{@macro cygnus_core.PlatformPrintJobController.isMethodSupported}
  static bool isMethodSupported(
    PlatformPrintJobControllerMethod method, {
    TargetPlatform? platform,
  }) => PlatformPrintJobController.static().isMethodSupported(
    method,
    platform: platform,
  );
}
