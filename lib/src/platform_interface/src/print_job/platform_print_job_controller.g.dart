// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'platform_print_job_controller.dart';

// **************************************************************************
// SupportedPlatformsGenerator
// **************************************************************************

extension _CygnusPlatformPrintJobControllerCreationParamsClassSupported
    on CygnusPlatformPrintJobControllerCreationParams {
  ///{@template cygnus_core.CygnusPlatformPrintJobControllerCreationParams.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView
  ///- iOS WKWebView
  ///- macOS WKWebView
  ///- Windows WebView2
  ///
  ///Use the [CygnusPlatformPrintJobControllerCreationParams.isClassSupported] method to check if this class is supported at runtime.
  ///{@endtemplate}
  static bool isClassSupported({TargetPlatform? platform}) {
    return ((kIsWeb && platform != null) || !kIsWeb) &&
        [
          TargetPlatform.android,
          TargetPlatform.iOS,
          TargetPlatform.macOS,
          TargetPlatform.windows,
        ].contains(platform ?? defaultTargetPlatform);
  }
}

///List of [CygnusPlatformPrintJobControllerCreationParams]'s properties that can be used to check i they are supported or not by the current platform.
enum CygnusPlatformPrintJobControllerCreationParamsProperty {
  ///Can be used to check if the [CygnusPlatformPrintJobControllerCreationParams.id] property is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusPlatformPrintJobControllerCreationParams.id.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView
  ///- iOS WKWebView
  ///- macOS WKWebView
  ///- Windows WebView2
  ///
  ///Use the [CygnusPlatformPrintJobControllerCreationParams.isPropertySupported] method to check if this property is supported at runtime.
  ///{@endtemplate}
  id,
}

extension _CygnusPlatformPrintJobControllerCreationParamsPropertySupported
    on CygnusPlatformPrintJobControllerCreationParams {
  static bool isPropertySupported(
    CygnusPlatformPrintJobControllerCreationParamsProperty property, {
    TargetPlatform? platform,
  }) {
    switch (property) {
      case CygnusPlatformPrintJobControllerCreationParamsProperty.id:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [
              TargetPlatform.android,
              TargetPlatform.iOS,
              TargetPlatform.macOS,
              TargetPlatform.windows,
            ].contains(platform ?? defaultTargetPlatform);
    }
  }
}

extension _CygnusPlatformPrintJobControllerClassSupported
    on CygnusPlatformPrintJobController {
  ///{@template cygnus_core.CygnusPlatformPrintJobController.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView
  ///- iOS WKWebView
  ///- macOS WKWebView
  ///- Windows WebView2
  ///
  ///Use the [CygnusPlatformPrintJobController.isClassSupported] method to check if this class is supported at runtime.
  ///{@endtemplate}
  static bool isClassSupported({TargetPlatform? platform}) {
    return ((kIsWeb && platform != null) || !kIsWeb) &&
        [
          TargetPlatform.android,
          TargetPlatform.iOS,
          TargetPlatform.macOS,
          TargetPlatform.windows,
        ].contains(platform ?? defaultTargetPlatform);
  }
}

///List of [CygnusPlatformPrintJobController]'s properties that can be used to check i they are supported or not by the current platform.
enum CygnusPlatformPrintJobControllerProperty {
  ///Can be used to check if the [CygnusPlatformPrintJobController.onComplete] property is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusPlatformPrintJobController.onComplete.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView ([Official API - PrintDocumentAdapter.onFinish](https://developer.android.com/reference/android/print/PrintDocumentAdapter#onFinish())):
  ///    - `completed` is always `true` and `error` is always `null`.
  ///- iOS WKWebView ([Official API - UIPrintInteractionController.CompletionHandler](https://developer.apple.com/documentation/uikit/uiprintinteractioncontroller/completionhandler))
  ///- macOS WKWebView ([Official API - NSPrintOperation.runModal](https://developer.apple.com/documentation/appkit/nsprintoperation/1532065-runmodal))
  ///- Windows WebView2
  ///
  ///**Parameters - Officially Supported Platforms/Implementations**:
  ///- [completed]: all platforms
  ///- [error]: all platforms
  ///
  ///Use the [CygnusPlatformPrintJobController.isPropertySupported] method to check if this property is supported at runtime.
  ///{@endtemplate}
  onComplete,
}

extension _CygnusPlatformPrintJobControllerPropertySupported
    on CygnusPlatformPrintJobController {
  static bool isPropertySupported(
    CygnusPlatformPrintJobControllerProperty property, {
    TargetPlatform? platform,
  }) {
    switch (property) {
      case CygnusPlatformPrintJobControllerProperty.onComplete:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [
              TargetPlatform.android,
              TargetPlatform.iOS,
              TargetPlatform.macOS,
              TargetPlatform.windows,
            ].contains(platform ?? defaultTargetPlatform);
    }
  }
}

///List of [CygnusPlatformPrintJobController]'s methods that can be used to check if they are supported or not by the current platform.
enum CygnusPlatformPrintJobControllerMethod {
  ///Can be used to check if the [CygnusPlatformPrintJobController.cancel] method is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusPlatformPrintJobController.cancel.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView ([Official API - PrintJob.cancel](https://developer.android.com/reference/android/print/PrintJob#cancel()))
  ///
  ///Use the [CygnusPlatformPrintJobController.isMethodSupported] method to check if this method is supported at runtime.
  ///{@endtemplate}
  cancel,

  ///Can be used to check if the [CygnusPlatformPrintJobController.dismiss] method is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusPlatformPrintJobController.dismiss.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- iOS WKWebView
  ///
  ///**Parameters - Officially Supported Platforms/Implementations**:
  ///- [animated]: all platforms
  ///
  ///Use the [CygnusPlatformPrintJobController.isMethodSupported] method to check if this method is supported at runtime.
  ///{@endtemplate}
  dismiss,

  ///Can be used to check if the [CygnusPlatformPrintJobController.dispose] method is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusPlatformPrintJobController.dispose.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView
  ///- iOS WKWebView
  ///- macOS WKWebView
  ///- Windows WebView2
  ///
  ///Use the [CygnusPlatformPrintJobController.isMethodSupported] method to check if this method is supported at runtime.
  ///{@endtemplate}
  dispose,

  ///Can be used to check if the [CygnusPlatformPrintJobController.getInfo] method is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusPlatformPrintJobController.getInfo.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView ([Official API - PrintJob.getInfo](https://developer.android.com/reference/android/print/PrintJob#getInfo()))
  ///- iOS WKWebView
  ///- macOS WKWebView
  ///- Windows WebView2
  ///
  ///Use the [CygnusPlatformPrintJobController.isMethodSupported] method to check if this method is supported at runtime.
  ///{@endtemplate}
  getInfo,

  ///Can be used to check if the [CygnusPlatformPrintJobController.restart] method is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusPlatformPrintJobController.restart.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView ([Official API - PrintJob.restart](https://developer.android.com/reference/android/print/PrintJob#restart()))
  ///
  ///Use the [CygnusPlatformPrintJobController.isMethodSupported] method to check if this method is supported at runtime.
  ///{@endtemplate}
  restart,
}

extension _CygnusPlatformPrintJobControllerMethodSupported
    on CygnusPlatformPrintJobController {
  static bool isMethodSupported(
    CygnusPlatformPrintJobControllerMethod method, {
    TargetPlatform? platform,
  }) {
    switch (method) {
      case CygnusPlatformPrintJobControllerMethod.cancel:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [
              TargetPlatform.android,
            ].contains(platform ?? defaultTargetPlatform);
      case CygnusPlatformPrintJobControllerMethod.dismiss:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [TargetPlatform.iOS].contains(platform ?? defaultTargetPlatform);
      case CygnusPlatformPrintJobControllerMethod.dispose:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [
              TargetPlatform.android,
              TargetPlatform.iOS,
              TargetPlatform.macOS,
              TargetPlatform.windows,
            ].contains(platform ?? defaultTargetPlatform);
      case CygnusPlatformPrintJobControllerMethod.getInfo:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [
              TargetPlatform.android,
              TargetPlatform.iOS,
              TargetPlatform.macOS,
              TargetPlatform.windows,
            ].contains(platform ?? defaultTargetPlatform);
      case CygnusPlatformPrintJobControllerMethod.restart:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [
              TargetPlatform.android,
            ].contains(platform ?? defaultTargetPlatform);
    }
  }
}
