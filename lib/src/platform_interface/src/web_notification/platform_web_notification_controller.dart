import 'package:flutter/foundation.dart';
import 'package:flutter_inappwebview_internal_annotations/flutter_inappwebview_internal_annotations.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import '../webview_platform.dart';
import '../types/disposable.dart';
import '../types/web_notification.dart';

// ignore: uri_has_not_been_generated
part 'platform_web_notification_controller.g.dart';

///{@template cygnus_core.CygnusPlatformWebNotificationControllerCreationParams}
/// Object specifying creation parameters for creating a [CygnusPlatformWebNotificationController].
///
/// Platform specific implementations can add additional fields by extending
/// this class.
///{@endtemplate}
///
///{@macro cygnus_core.CygnusPlatformWebNotificationControllerCreationParams.supported_platforms}
@SupportedPlatforms(platforms: [WindowsPlatform()])
@immutable
class CygnusPlatformWebNotificationControllerCreationParams {
  /// Used by the platform implementation to create a new [CygnusPlatformWebNotificationController].
  const CygnusPlatformWebNotificationControllerCreationParams({
    required this.id,
    required this.notification,
  });

  ///{@template cygnus_core.CygnusPlatformWebNotificationControllerCreationParams.id}
  ///Web notification ID.
  ///{@endtemplate}
  ///
  ///{@macro cygnus_core.CygnusPlatformWebNotificationControllerCreationParams.id.supported_platforms}
  @SupportedPlatforms(platforms: [WindowsPlatform()])
  final String id;

  ///{@template cygnus_core.CygnusPlatformWebNotificationControllerCreationParams.notification}
  ///The notification data.
  ///{@endtemplate}
  ///
  ///{@macro cygnus_core.CygnusPlatformWebNotificationControllerCreationParams.notification.supported_platforms}
  @SupportedPlatforms(platforms: [WindowsPlatform()])
  final CygnusWebNotification notification;

  ///{@template cygnus_core.CygnusPlatformWebNotificationControllerCreationParams.isClassSupported}
  ///Check if the current class is supported by the [defaultTargetPlatform] or a specific [platform].
  ///{@endtemplate}
  bool isClassSupported({TargetPlatform? platform}) =>
      _CygnusPlatformWebNotificationControllerCreationParamsClassSupported.isClassSupported(
        platform: platform,
      );

  ///{@template cygnus_core.CygnusPlatformWebNotificationControllerCreationParams.isPropertySupported}
  ///Check if the given [property] is supported by the [defaultTargetPlatform] or a specific [platform].
  ///{@endtemplate}
  bool isPropertySupported(
    CygnusPlatformWebNotificationControllerCreationParamsProperty property, {
    TargetPlatform? platform,
  }) =>
      _CygnusPlatformWebNotificationControllerCreationParamsPropertySupported.isPropertySupported(
        property,
        platform: platform,
      );
}

///A completion handler for the [CygnusPlatformWebNotificationController.onClose] event.
typedef CygnusWebNotificationCloseHandler = Future<void> Function()?;

///{@template cygnus_core.CygnusPlatformWebNotificationController}
///Class representing a web notification controller.
///
///This class provides methods to report the notification has been displayed, clicked, or closed
///as required by the [ICoreWebView2Notification](https://learn.microsoft.com/en-us/microsoft-edge/webview2/reference/win32/icorewebview2notification?view=webview2-1.0.3595.46) interface.
///{@endtemplate}
///
///{@macro cygnus_core.CygnusPlatformWebNotificationController.supported_platforms}
@SupportedPlatforms(platforms: [WindowsPlatform()])
abstract class CygnusPlatformWebNotificationController extends PlatformInterface
    implements CygnusDisposable {
  /// Creates a new [CygnusPlatformWebNotificationController]
  factory CygnusPlatformWebNotificationController(
    CygnusPlatformWebNotificationControllerCreationParams params,
  ) {
    assert(
      CygnusWebViewPlatform.instance != null,
      'A platform implementation for `cygnus` has not been set. Please '
      'ensure that an implementation of `CygnusWebViewPlatform` has been set to '
      '`CygnusWebViewPlatform.instance` before use. For unit testing, '
      '`CygnusWebViewPlatform.instance` can be set with your own test implementation.',
    );
    final CygnusPlatformWebNotificationController webNotificationController =
        CygnusWebViewPlatform.instance!.createPlatformWebNotificationController(
          params,
        );
    PlatformInterface.verify(webNotificationController, _token);
    return webNotificationController;
  }

  /// Creates a new empty [CygnusPlatformWebNotificationController] to access static methods.
  factory CygnusPlatformWebNotificationController.static() {
    assert(
      CygnusWebViewPlatform.instance != null,
      'A platform implementation for `cygnus` has not been set. Please '
      'ensure that an implementation of `CygnusWebViewPlatform` has been set to '
      '`WebViewPlatform.instance` before use. For unit testing, '
      '`WebViewPlatform.instance` can be set with your own test implementation.',
    );
    final CygnusPlatformWebNotificationController webNotificationControllerStatic =
        CygnusWebViewPlatform.instance!
            .createPlatformWebNotificationControllerStatic();
    PlatformInterface.verify(webNotificationControllerStatic, _token);
    return webNotificationControllerStatic;
  }

  /// Used by the platform implementation to create a new [CygnusPlatformWebNotificationController].
  ///
  /// Should only be used by platform implementations because they can't extend
  /// a class that only contains a factory constructor.
  @protected
  CygnusPlatformWebNotificationController.implementation(this.params)
    : super(token: _token);

  static final Object _token = Object();

  /// The parameters used to initialize the [CygnusPlatformWebNotificationController].
  final CygnusPlatformWebNotificationControllerCreationParams params;

  ///{@macro cygnus_core.CygnusPlatformWebNotificationControllerCreationParams.id}
  ///
  ///{@macro cygnus_core.CygnusPlatformWebNotificationControllerCreationParams.id.supported_platforms}
  String get id => params.id;

  ///{@macro cygnus_core.CygnusPlatformWebNotificationControllerCreationParams.notification}
  ///
  ///{@macro cygnus_core.CygnusPlatformWebNotificationControllerCreationParams.notification.supported_platforms}
  CygnusWebNotification get notification => params.notification;

  ///{@template cygnus_core.CygnusPlatformWebNotificationController.onClose}
  ///Event fired when the notification is closed by the web code, such as through `notification.close()`.
  ///
  ///You don't need to call [reportClosed] since this is coming from the web code.
  ///{@endtemplate}
  ///
  ///{@macro cygnus_core.CygnusPlatformWebNotificationController.onClose.supported_platforms}
  @SupportedPlatforms(
    platforms: [
      WindowsPlatform(
        apiName: 'ICoreWebView2Notification.add_CloseRequested',
        apiUrl:
            'https://learn.microsoft.com/en-us/microsoft-edge/webview2/reference/win32/icorewebview2notification?view=webview2-1.0.3595.46#add_closerequested',
      ),
    ],
  )
  CygnusWebNotificationCloseHandler? onClose;

  ///{@template cygnus_core.CygnusPlatformWebNotificationController.reportShown}
  ///The host may run this to report the notification has been displayed
  ///and it will cause the [show](https://developer.mozilla.org/docs/Web/API/Notification/show_event) event
  ///to be raised for non-persistent notifications.
  ///
  ///You must not run this unless you are handling the `onNotificationReceived` event.
  ///Returns `HRESULT_FROM_WIN32(ERROR_INVALID_STATE)` if `handled` is `false` when this is called.
  ///{@endtemplate}
  ///
  ///{@macro cygnus_core.CygnusPlatformWebNotificationController.reportShown.supported_platforms}
  @SupportedPlatforms(
    platforms: [
      WindowsPlatform(
        apiName: 'ICoreWebView2Notification.ReportShown',
        apiUrl:
            'https://learn.microsoft.com/en-us/microsoft-edge/webview2/reference/win32/icorewebview2notification?view=webview2-1.0.3595.46#reportshown',
      ),
    ],
  )
  Future<void> reportShown() {
    throw UnimplementedError(
      'reportShown is not implemented on the current platform',
    );
  }

  ///{@template cygnus_core.CygnusPlatformWebNotificationController.reportClicked}
  ///The host may run this to report the notification has been clicked,
  ///and it will cause the [click](https://developer.mozilla.org/docs/Web/API/Notification/click_event) event
  ///to be raised for non-persistent notifications and the
  ///[notificationclick](https://developer.mozilla.org/docs/Web/API/ServiceWorkerGlobalScope/notificationclick_event)
  ///event for persistent notifications.
  ///
  ///You must not run this unless you are handling the `onNotificationReceived` event.
  ///Returns `HRESULT_FROM_WIN32(ERROR_INVALID_STATE)` if `handled` is `false` or [reportShown] has not been run when this is called.
  ///{@endtemplate}
  ///
  ///{@macro cygnus_core.CygnusPlatformWebNotificationController.reportClicked.supported_platforms}
  @SupportedPlatforms(
    platforms: [
      WindowsPlatform(
        apiName: 'ICoreWebView2Notification.ReportClicked',
        apiUrl:
            'https://learn.microsoft.com/en-us/microsoft-edge/webview2/reference/win32/icorewebview2notification?view=webview2-1.0.3595.46#reportclicked',
      ),
    ],
  )
  Future<void> reportClicked() {
    throw UnimplementedError(
      'reportClicked is not implemented on the current platform',
    );
  }

  ///{@template cygnus_core.CygnusPlatformWebNotificationController.reportClosed}
  ///The host may run this to report the notification was dismissed,
  ///and it will cause the [close](https://developer.mozilla.org/docs/Web/API/Notification/close_event) event
  ///to be raised for non-persistent notifications and the
  ///[notificationclose](https://developer.mozilla.org/docs/Web/API/ServiceWorkerGlobalScope/notificationclose_event)
  ///event for persistent notifications.
  ///
  ///You must not run this unless you are handling the `onNotificationReceived` event.
  ///Returns `HRESULT_FROM_WIN32(ERROR_INVALID_STATE)` if `handled` is `false` or [reportShown] has not been run when this is called.
  ///{@endtemplate}
  ///
  ///{@macro cygnus_core.CygnusPlatformWebNotificationController.reportClosed.supported_platforms}
  @SupportedPlatforms(
    platforms: [
      WindowsPlatform(
        apiName: 'ICoreWebView2Notification.ReportClosed',
        apiUrl:
            'https://learn.microsoft.com/en-us/microsoft-edge/webview2/reference/win32/icorewebview2notification?view=webview2-1.0.3595.46#reportclosed',
      ),
    ],
  )
  Future<void> reportClosed() {
    throw UnimplementedError(
      'reportClosed is not implemented on the current platform',
    );
  }

  ///{@template cygnus_core.CygnusPlatformWebNotificationController.dispose}
  ///Disposes the web notification controller.
  ///{@endtemplate}
  ///
  ///{@macro cygnus_core.CygnusPlatformWebNotificationController.dispose.supported_platforms}
  @SupportedPlatforms(platforms: [WindowsPlatform()])
  @override
  void dispose() {
    throw UnimplementedError(
      'dispose is not implemented on the current platform',
    );
  }

  ///{@macro cygnus_core.CygnusPlatformWebNotificationControllerCreationParams.isClassSupported}
  bool isClassSupported({TargetPlatform? platform}) =>
      params.isClassSupported(platform: platform);

  ///{@template cygnus_core.CygnusPlatformWebNotificationController.isPropertySupported}
  ///Check if the given [property] is supported by the [defaultTargetPlatform] or a specific [platform].
  ///The property should be one of the [CygnusPlatformWebNotificationControllerProperty] or [CygnusPlatformWebNotificationControllerCreationParamsProperty] values.
  ///{@endtemplate}
  bool isPropertySupported(dynamic property, {TargetPlatform? platform}) =>
      property is CygnusPlatformWebNotificationControllerCreationParamsProperty
      ? params.isPropertySupported(property, platform: platform)
      : _CygnusPlatformWebNotificationControllerPropertySupported.isPropertySupported(
          property,
          platform: platform,
        );

  ///{@template cygnus_core.CygnusPlatformWebNotificationController.isMethodSupported}
  ///Check if the given [method] is supported by the [defaultTargetPlatform] or a specific [platform].
  ///{@endtemplate}
  bool isMethodSupported(
    CygnusPlatformWebNotificationControllerMethod method, {
    TargetPlatform? platform,
  }) => _CygnusPlatformWebNotificationControllerMethodSupported.isMethodSupported(
    method,
    platform: platform,
  );
}
