import 'package:flutter/foundation.dart';
import 'package:cygnus_core/src/platform_interface/flutter_inappwebview_platform_interface.dart';

///{@macro cygnus_core.CygnusPlatformPrintJobController}
///
///{@macro cygnus_core.CygnusPlatformPrintJobController.supported_platforms}
class CygnusPrintJobController {
  ///{@macro cygnus_core.CygnusPlatformPrintJobController}
  ///
  ///{@macro cygnus_core.CygnusPlatformPrintJobController.supported_platforms}
  CygnusPrintJobController({required String id})
    : this.fromPlatformCreationParams(
        params: CygnusPlatformPrintJobControllerCreationParams(id: id),
      );

  /// Constructs a [CygnusPrintJobController].
  ///
  /// See [CygnusPrintJobController.fromPlatformCreationParams] for setting parameters for
  /// a specific platform.
  CygnusPrintJobController.fromPlatformCreationParams({
    required CygnusPlatformPrintJobControllerCreationParams params,
  }) : this.fromPlatform(platform: CygnusPlatformPrintJobController(params));

  /// Constructs a [CygnusPrintJobController] from a specific platform implementation.
  CygnusPrintJobController.fromPlatform({required this.platform});

  /// Implementation of [CygnusPlatformPrintJobController] for the current platform.
  final CygnusPlatformPrintJobController platform;

  ///{@macro cygnus_core.CygnusPlatformPrintJobController.id}
  ///
  ///{@macro cygnus_core.CygnusPlatformPrintJobController.id.supported_platforms}
  String get id => platform.id;

  ///{@macro cygnus_core.CygnusPlatformPrintJobController.onComplete}
  ///
  ///{@macro cygnus_core.CygnusPlatformPrintJobController.onComplete.supported_platforms}
  CygnusPrintJobCompletionHandler? get onComplete => platform.onComplete;

  void set onComplete(CygnusPrintJobCompletionHandler? handler) {
    platform.onComplete = handler;
  }

  ///{@macro cygnus_core.CygnusPlatformPrintJobController.cancel}
  ///
  ///{@macro cygnus_core.CygnusPlatformPrintJobController.cancel.supported_platforms}
  Future<void> cancel() => platform.cancel();

  ///{@macro cygnus_core.CygnusPlatformPrintJobController.restart}
  ///
  ///{@macro cygnus_core.CygnusPlatformPrintJobController.restart.supported_platforms}
  Future<void> restart() => platform.restart();

  ///{@macro cygnus_core.CygnusPlatformPrintJobController.dismiss}
  ///
  ///{@macro cygnus_core.CygnusPlatformPrintJobController.dismiss.supported_platforms}
  Future<void> dismiss({bool animated = true}) =>
      platform.dismiss(animated: animated);

  ///{@macro cygnus_core.CygnusPlatformPrintJobController.getInfo}
  ///
  ///{@macro cygnus_core.CygnusPlatformPrintJobController.getInfo.supported_platforms}
  Future<CygnusPrintJobInfo?> getInfo() => platform.getInfo();

  ///{@macro cygnus_core.CygnusPlatformPrintJobController.dispose}
  ///
  ///{@macro cygnus_core.CygnusPlatformPrintJobController.dispose.supported_platforms}
  void dispose() => platform.dispose();

  ///{@macro cygnus_core.CygnusPlatformPrintJobControllerCreationParams.isClassSupported}
  static bool isClassSupported({TargetPlatform? platform}) =>
      CygnusPlatformPrintJobController.static().isClassSupported(platform: platform);

  ///{@macro cygnus_core.CygnusPlatformPrintJobController.isPropertySupported}
  static bool isPropertySupported(
    dynamic property, {
    TargetPlatform? platform,
  }) => CygnusPlatformPrintJobController.static().isPropertySupported(
    property,
    platform: platform,
  );

  ///{@macro cygnus_core.CygnusPlatformPrintJobController.isMethodSupported}
  static bool isMethodSupported(
    CygnusPlatformPrintJobControllerMethod method, {
    TargetPlatform? platform,
  }) => CygnusPlatformPrintJobController.static().isMethodSupported(
    method,
    platform: platform,
  );
}
