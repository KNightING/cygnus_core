import 'package:flutter/foundation.dart';
import 'package:cygnus_core/src/platform_interface/flutter_inappwebview_platform_interface.dart';

///{@macro cygnus_core.CygnusPlatformWebNotificationController}
///
///{@macro cygnus_core.CygnusPlatformWebNotificationController.supported_platforms}
class CygnusWebNotificationController {
  ///{@macro cygnus_core.CygnusPlatformWebNotificationController}
  ///
  ///{@macro cygnus_core.CygnusPlatformWebNotificationController.supported_platforms}
  CygnusWebNotificationController({
    required String id,
    required CygnusWebNotification notification,
  }) : this.fromPlatformCreationParams(
         params: CygnusPlatformWebNotificationControllerCreationParams(
           id: id,
           notification: notification,
         ),
       );

  /// Constructs a [CygnusWebNotificationController].
  ///
  /// See [CygnusWebNotificationController.fromPlatformCreationParams] for setting parameters for
  /// a specific platform.
  CygnusWebNotificationController.fromPlatformCreationParams({
    required CygnusPlatformWebNotificationControllerCreationParams params,
  }) : this.fromPlatform(platform: CygnusPlatformWebNotificationController(params));

  /// Constructs a [CygnusWebNotificationController] from a specific platform implementation.
  CygnusWebNotificationController.fromPlatform({required this.platform});

  /// Implementation of [CygnusPlatformWebNotificationController] for the current platform.
  final CygnusPlatformWebNotificationController platform;

  ///{@macro cygnus_core.CygnusPlatformWebNotificationControllerCreationParams.id}
  ///
  ///{@macro cygnus_core.CygnusPlatformWebNotificationControllerCreationParams.id.supported_platforms}
  String get id => platform.id;

  ///{@macro cygnus_core.CygnusPlatformWebNotificationControllerCreationParams.notification}
  ///
  ///{@macro cygnus_core.CygnusPlatformWebNotificationControllerCreationParams.notification.supported_platforms}
  CygnusWebNotification get notification => platform.notification;

  ///{@macro cygnus_core.CygnusPlatformWebNotificationController.onClose}
  ///
  ///{@macro cygnus_core.CygnusPlatformWebNotificationController.onClose.supported_platforms}
  CygnusWebNotificationCloseHandler? get onClose => platform.onClose;

  void set onClose(CygnusWebNotificationCloseHandler? handler) {
    platform.onClose = handler;
  }

  ///{@macro cygnus_core.CygnusPlatformWebNotificationController.reportShown}
  ///
  ///{@macro cygnus_core.CygnusPlatformWebNotificationController.reportShown.supported_platforms}
  Future<void> reportShown() => platform.reportShown();

  ///{@macro cygnus_core.CygnusPlatformWebNotificationController.reportClicked}
  ///
  ///{@macro cygnus_core.CygnusPlatformWebNotificationController.reportClicked.supported_platforms}
  Future<void> reportClicked() => platform.reportClicked();

  ///{@macro cygnus_core.CygnusPlatformWebNotificationController.reportClosed}
  ///
  ///{@macro cygnus_core.CygnusPlatformWebNotificationController.reportClosed.supported_platforms}
  Future<void> reportClosed() => platform.reportClosed();

  ///{@macro cygnus_core.CygnusPlatformWebNotificationController.dispose}
  ///
  ///{@macro cygnus_core.CygnusPlatformWebNotificationController.dispose.supported_platforms}
  void dispose() => platform.dispose();

  ///{@macro cygnus_core.CygnusPlatformWebNotificationControllerCreationParams.isClassSupported}
  static bool isClassSupported({TargetPlatform? platform}) =>
      CygnusPlatformWebNotificationController.static().isClassSupported(
        platform: platform,
      );

  ///{@macro cygnus_core.CygnusPlatformWebNotificationController.isPropertySupported}
  static bool isPropertySupported(
    dynamic property, {
    TargetPlatform? platform,
  }) => CygnusPlatformWebNotificationController.static().isPropertySupported(
    property,
    platform: platform,
  );

  ///{@macro cygnus_core.CygnusPlatformWebNotificationController.isMethodSupported}
  static bool isMethodSupported(
    CygnusPlatformWebNotificationControllerMethod method, {
    TargetPlatform? platform,
  }) => CygnusPlatformWebNotificationController.static().isMethodSupported(
    method,
    platform: platform,
  );
}
