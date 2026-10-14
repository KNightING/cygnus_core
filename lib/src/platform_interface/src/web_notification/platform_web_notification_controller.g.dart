// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'platform_web_notification_controller.dart';

// **************************************************************************
// SupportedPlatformsGenerator
// **************************************************************************

extension _CygnusPlatformWebNotificationControllerCreationParamsClassSupported
    on CygnusPlatformWebNotificationControllerCreationParams {
  ///{@template cygnus_core.CygnusPlatformWebNotificationControllerCreationParams.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Windows WebView2
  ///
  ///Use the [CygnusPlatformWebNotificationControllerCreationParams.isClassSupported] method to check if this class is supported at runtime.
  ///{@endtemplate}
  static bool isClassSupported({TargetPlatform? platform}) {
    return ((kIsWeb && platform != null) || !kIsWeb) &&
        [TargetPlatform.windows].contains(platform ?? defaultTargetPlatform);
  }
}

///List of [CygnusPlatformWebNotificationControllerCreationParams]'s properties that can be used to check i they are supported or not by the current platform.
enum CygnusPlatformWebNotificationControllerCreationParamsProperty {
  ///Can be used to check if the [CygnusPlatformWebNotificationControllerCreationParams.id] property is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusPlatformWebNotificationControllerCreationParams.id.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Windows WebView2
  ///
  ///Use the [CygnusPlatformWebNotificationControllerCreationParams.isPropertySupported] method to check if this property is supported at runtime.
  ///{@endtemplate}
  id,

  ///Can be used to check if the [CygnusPlatformWebNotificationControllerCreationParams.notification] property is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusPlatformWebNotificationControllerCreationParams.notification.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Windows WebView2
  ///
  ///Use the [CygnusPlatformWebNotificationControllerCreationParams.isPropertySupported] method to check if this property is supported at runtime.
  ///{@endtemplate}
  notification,
}

extension _CygnusPlatformWebNotificationControllerCreationParamsPropertySupported
    on CygnusPlatformWebNotificationControllerCreationParams {
  static bool isPropertySupported(
    CygnusPlatformWebNotificationControllerCreationParamsProperty property, {
    TargetPlatform? platform,
  }) {
    switch (property) {
      case CygnusPlatformWebNotificationControllerCreationParamsProperty.id:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [
              TargetPlatform.windows,
            ].contains(platform ?? defaultTargetPlatform);
      case CygnusPlatformWebNotificationControllerCreationParamsProperty
          .notification:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [
              TargetPlatform.windows,
            ].contains(platform ?? defaultTargetPlatform);
    }
  }
}

extension _CygnusPlatformWebNotificationControllerClassSupported
    on CygnusPlatformWebNotificationController {
  ///{@template cygnus_core.CygnusPlatformWebNotificationController.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Windows WebView2
  ///
  ///Use the [CygnusPlatformWebNotificationController.isClassSupported] method to check if this class is supported at runtime.
  ///{@endtemplate}
  static bool isClassSupported({TargetPlatform? platform}) {
    return ((kIsWeb && platform != null) || !kIsWeb) &&
        [TargetPlatform.windows].contains(platform ?? defaultTargetPlatform);
  }
}

///List of [CygnusPlatformWebNotificationController]'s properties that can be used to check i they are supported or not by the current platform.
enum CygnusPlatformWebNotificationControllerProperty {
  ///Can be used to check if the [CygnusPlatformWebNotificationController.onClose] property is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusPlatformWebNotificationController.onClose.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Windows WebView2 ([Official API - ICoreWebView2Notification.add_CloseRequested](https://learn.microsoft.com/en-us/microsoft-edge/webview2/reference/win32/icorewebview2notification?view=webview2-1.0.3595.46#add_closerequested))
  ///
  ///Use the [CygnusPlatformWebNotificationController.isPropertySupported] method to check if this property is supported at runtime.
  ///{@endtemplate}
  onClose,
}

extension _CygnusPlatformWebNotificationControllerPropertySupported
    on CygnusPlatformWebNotificationController {
  static bool isPropertySupported(
    CygnusPlatformWebNotificationControllerProperty property, {
    TargetPlatform? platform,
  }) {
    switch (property) {
      case CygnusPlatformWebNotificationControllerProperty.onClose:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [
              TargetPlatform.windows,
            ].contains(platform ?? defaultTargetPlatform);
    }
  }
}

///List of [CygnusPlatformWebNotificationController]'s methods that can be used to check if they are supported or not by the current platform.
enum CygnusPlatformWebNotificationControllerMethod {
  ///Can be used to check if the [CygnusPlatformWebNotificationController.dispose] method is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusPlatformWebNotificationController.dispose.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Windows WebView2
  ///
  ///Use the [CygnusPlatformWebNotificationController.isMethodSupported] method to check if this method is supported at runtime.
  ///{@endtemplate}
  dispose,

  ///Can be used to check if the [CygnusPlatformWebNotificationController.reportClicked] method is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusPlatformWebNotificationController.reportClicked.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Windows WebView2 ([Official API - ICoreWebView2Notification.ReportClicked](https://learn.microsoft.com/en-us/microsoft-edge/webview2/reference/win32/icorewebview2notification?view=webview2-1.0.3595.46#reportclicked))
  ///
  ///Use the [CygnusPlatformWebNotificationController.isMethodSupported] method to check if this method is supported at runtime.
  ///{@endtemplate}
  reportClicked,

  ///Can be used to check if the [CygnusPlatformWebNotificationController.reportClosed] method is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusPlatformWebNotificationController.reportClosed.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Windows WebView2 ([Official API - ICoreWebView2Notification.ReportClosed](https://learn.microsoft.com/en-us/microsoft-edge/webview2/reference/win32/icorewebview2notification?view=webview2-1.0.3595.46#reportclosed))
  ///
  ///Use the [CygnusPlatformWebNotificationController.isMethodSupported] method to check if this method is supported at runtime.
  ///{@endtemplate}
  reportClosed,

  ///Can be used to check if the [CygnusPlatformWebNotificationController.reportShown] method is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusPlatformWebNotificationController.reportShown.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Windows WebView2 ([Official API - ICoreWebView2Notification.ReportShown](https://learn.microsoft.com/en-us/microsoft-edge/webview2/reference/win32/icorewebview2notification?view=webview2-1.0.3595.46#reportshown))
  ///
  ///Use the [CygnusPlatformWebNotificationController.isMethodSupported] method to check if this method is supported at runtime.
  ///{@endtemplate}
  reportShown,
}

extension _CygnusPlatformWebNotificationControllerMethodSupported
    on CygnusPlatformWebNotificationController {
  static bool isMethodSupported(
    CygnusPlatformWebNotificationControllerMethod method, {
    TargetPlatform? platform,
  }) {
    switch (method) {
      case CygnusPlatformWebNotificationControllerMethod.dispose:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [
              TargetPlatform.windows,
            ].contains(platform ?? defaultTargetPlatform);
      case CygnusPlatformWebNotificationControllerMethod.reportClicked:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [
              TargetPlatform.windows,
            ].contains(platform ?? defaultTargetPlatform);
      case CygnusPlatformWebNotificationControllerMethod.reportClosed:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [
              TargetPlatform.windows,
            ].contains(platform ?? defaultTargetPlatform);
      case CygnusPlatformWebNotificationControllerMethod.reportShown:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [
              TargetPlatform.windows,
            ].contains(platform ?? defaultTargetPlatform);
    }
  }
}
