import 'package:flutter/foundation.dart';
import 'package:cygnus_core/src/platform_interface/flutter_inappwebview_platform_interface.dart';

///{@macro cygnus_core.PlatformWebNotificationController}
///
///{@macro cygnus_core.PlatformWebNotificationController.supported_platforms}
class WebNotificationController {
  ///{@macro cygnus_core.PlatformWebNotificationController}
  ///
  ///{@macro cygnus_core.PlatformWebNotificationController.supported_platforms}
  WebNotificationController({
    required String id,
    required WebNotification notification,
  }) : this.fromPlatformCreationParams(
         params: PlatformWebNotificationControllerCreationParams(
           id: id,
           notification: notification,
         ),
       );

  /// Constructs a [WebNotificationController].
  ///
  /// See [WebNotificationController.fromPlatformCreationParams] for setting parameters for
  /// a specific platform.
  WebNotificationController.fromPlatformCreationParams({
    required PlatformWebNotificationControllerCreationParams params,
  }) : this.fromPlatform(platform: PlatformWebNotificationController(params));

  /// Constructs a [WebNotificationController] from a specific platform implementation.
  WebNotificationController.fromPlatform({required this.platform});

  /// Implementation of [PlatformWebNotificationController] for the current platform.
  final PlatformWebNotificationController platform;

  ///{@macro cygnus_core.PlatformWebNotificationControllerCreationParams.id}
  ///
  ///{@macro cygnus_core.PlatformWebNotificationControllerCreationParams.id.supported_platforms}
  String get id => platform.id;

  ///{@macro cygnus_core.PlatformWebNotificationControllerCreationParams.notification}
  ///
  ///{@macro cygnus_core.PlatformWebNotificationControllerCreationParams.notification.supported_platforms}
  WebNotification get notification => platform.notification;

  ///{@macro cygnus_core.PlatformWebNotificationController.onClose}
  ///
  ///{@macro cygnus_core.PlatformWebNotificationController.onClose.supported_platforms}
  WebNotificationCloseHandler? get onClose => platform.onClose;

  void set onClose(WebNotificationCloseHandler? handler) {
    platform.onClose = handler;
  }

  ///{@macro cygnus_core.PlatformWebNotificationController.reportShown}
  ///
  ///{@macro cygnus_core.PlatformWebNotificationController.reportShown.supported_platforms}
  Future<void> reportShown() => platform.reportShown();

  ///{@macro cygnus_core.PlatformWebNotificationController.reportClicked}
  ///
  ///{@macro cygnus_core.PlatformWebNotificationController.reportClicked.supported_platforms}
  Future<void> reportClicked() => platform.reportClicked();

  ///{@macro cygnus_core.PlatformWebNotificationController.reportClosed}
  ///
  ///{@macro cygnus_core.PlatformWebNotificationController.reportClosed.supported_platforms}
  Future<void> reportClosed() => platform.reportClosed();

  ///{@macro cygnus_core.PlatformWebNotificationController.dispose}
  ///
  ///{@macro cygnus_core.PlatformWebNotificationController.dispose.supported_platforms}
  void dispose() => platform.dispose();

  ///{@macro cygnus_core.PlatformWebNotificationControllerCreationParams.isClassSupported}
  static bool isClassSupported({TargetPlatform? platform}) =>
      PlatformWebNotificationController.static().isClassSupported(
        platform: platform,
      );

  ///{@macro cygnus_core.PlatformWebNotificationController.isPropertySupported}
  static bool isPropertySupported(
    dynamic property, {
    TargetPlatform? platform,
  }) => PlatformWebNotificationController.static().isPropertySupported(
    property,
    platform: platform,
  );

  ///{@macro cygnus_core.PlatformWebNotificationController.isMethodSupported}
  static bool isMethodSupported(
    PlatformWebNotificationControllerMethod method, {
    TargetPlatform? platform,
  }) => PlatformWebNotificationController.static().isMethodSupported(
    method,
    platform: platform,
  );
}
