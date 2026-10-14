// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'platform_webview_environment.dart';

// **************************************************************************
// SupportedPlatformsGenerator
// **************************************************************************

extension _CygnusPlatformWebViewEnvironmentCreationParamsClassSupported
    on CygnusPlatformWebViewEnvironmentCreationParams {
  ///{@template cygnus_core.CygnusPlatformWebViewEnvironmentCreationParams.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Windows WebView2
  ///- Linux WPE WebKit
  ///
  ///Use the [CygnusPlatformWebViewEnvironmentCreationParams.isClassSupported] method to check if this class is supported at runtime.
  ///{@endtemplate}
  static bool isClassSupported({TargetPlatform? platform}) {
    return ((kIsWeb && platform != null) || !kIsWeb) &&
        [
          TargetPlatform.windows,
          TargetPlatform.linux,
        ].contains(platform ?? defaultTargetPlatform);
  }
}

///List of [CygnusPlatformWebViewEnvironmentCreationParams]'s properties that can be used to check i they are supported or not by the current platform.
enum CygnusPlatformWebViewEnvironmentCreationParamsProperty {
  ///Can be used to check if the [CygnusPlatformWebViewEnvironmentCreationParams.settings] property is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusPlatformWebViewEnvironmentCreationParams.settings.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Windows WebView2
  ///
  ///Use the [CygnusPlatformWebViewEnvironmentCreationParams.isPropertySupported] method to check if this property is supported at runtime.
  ///{@endtemplate}
  settings,
}

extension _CygnusPlatformWebViewEnvironmentCreationParamsPropertySupported
    on CygnusPlatformWebViewEnvironmentCreationParams {
  static bool isPropertySupported(
    CygnusPlatformWebViewEnvironmentCreationParamsProperty property, {
    TargetPlatform? platform,
  }) {
    switch (property) {
      case CygnusPlatformWebViewEnvironmentCreationParamsProperty.settings:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [
              TargetPlatform.windows,
            ].contains(platform ?? defaultTargetPlatform);
    }
  }
}

extension _CygnusPlatformWebViewEnvironmentClassSupported
    on CygnusPlatformWebViewEnvironment {
  ///{@template cygnus_core.CygnusPlatformWebViewEnvironment.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Windows WebView2
  ///- Linux WPE WebKit
  ///
  ///Use the [CygnusPlatformWebViewEnvironment.isClassSupported] method to check if this class is supported at runtime.
  ///{@endtemplate}
  static bool isClassSupported({TargetPlatform? platform}) {
    return ((kIsWeb && platform != null) || !kIsWeb) &&
        [
          TargetPlatform.windows,
          TargetPlatform.linux,
        ].contains(platform ?? defaultTargetPlatform);
  }
}

///List of [CygnusPlatformWebViewEnvironment]'s properties that can be used to check i they are supported or not by the current platform.
enum CygnusPlatformWebViewEnvironmentProperty {
  ///Can be used to check if the [CygnusPlatformWebViewEnvironment.id] property is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusPlatformWebViewEnvironment.id.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Windows WebView2
  ///- Linux WPE WebKit
  ///
  ///Use the [CygnusPlatformWebViewEnvironment.isPropertySupported] method to check if this property is supported at runtime.
  ///{@endtemplate}
  id,

  ///Can be used to check if the [CygnusPlatformWebViewEnvironment.onBrowserProcessExited] property is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusPlatformWebViewEnvironment.onBrowserProcessExited.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Windows WebView2 1.0.992.28++ ([Official API - ICoreWebView2Environment5.add_BrowserProcessExited](https://learn.microsoft.com/en-us/microsoft-edge/webview2/reference/win32/icorewebview2environment5?view=webview2-1.0.2849.39#add_browserprocessexited))
  ///
  ///**Parameters - Officially Supported Platforms/Implementations**:
  ///- [detail]: all platforms
  ///
  ///Use the [CygnusPlatformWebViewEnvironment.isPropertySupported] method to check if this property is supported at runtime.
  ///{@endtemplate}
  onBrowserProcessExited,

  ///Can be used to check if the [CygnusPlatformWebViewEnvironment.onNewBrowserVersionAvailable] property is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusPlatformWebViewEnvironment.onNewBrowserVersionAvailable.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Windows WebView2 ([Official API - ICoreWebView2Environment.add_NewBrowserVersionAvailable](https://learn.microsoft.com/en-us/microsoft-edge/webview2/reference/win32/icorewebview2environment?view=webview2-1.0.2849.39#add_newbrowserversionavailable))
  ///
  ///Use the [CygnusPlatformWebViewEnvironment.isPropertySupported] method to check if this property is supported at runtime.
  ///{@endtemplate}
  onNewBrowserVersionAvailable,

  ///Can be used to check if the [CygnusPlatformWebViewEnvironment.onProcessInfosChanged] property is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusPlatformWebViewEnvironment.onProcessInfosChanged.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Windows WebView2 1.0.1108.44++ ([Official API - ICoreWebView2Environment8.add_ProcessInfosChanged](https://learn.microsoft.com/en-us/microsoft-edge/webview2/reference/win32/icorewebview2environment8?view=webview2-1.0.2849.39#add_processinfoschanged))
  ///
  ///**Parameters - Officially Supported Platforms/Implementations**:
  ///- [detail]: all platforms
  ///
  ///Use the [CygnusPlatformWebViewEnvironment.isPropertySupported] method to check if this property is supported at runtime.
  ///{@endtemplate}
  onProcessInfosChanged,
}

extension _CygnusPlatformWebViewEnvironmentPropertySupported
    on CygnusPlatformWebViewEnvironment {
  static bool isPropertySupported(
    CygnusPlatformWebViewEnvironmentProperty property, {
    TargetPlatform? platform,
  }) {
    switch (property) {
      case CygnusPlatformWebViewEnvironmentProperty.id:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [
              TargetPlatform.windows,
              TargetPlatform.linux,
            ].contains(platform ?? defaultTargetPlatform);
      case CygnusPlatformWebViewEnvironmentProperty.onBrowserProcessExited:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [
              TargetPlatform.windows,
            ].contains(platform ?? defaultTargetPlatform);
      case CygnusPlatformWebViewEnvironmentProperty
          .onNewBrowserVersionAvailable:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [
              TargetPlatform.windows,
            ].contains(platform ?? defaultTargetPlatform);
      case CygnusPlatformWebViewEnvironmentProperty.onProcessInfosChanged:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [
              TargetPlatform.windows,
            ].contains(platform ?? defaultTargetPlatform);
    }
  }
}

///List of [CygnusPlatformWebViewEnvironment]'s methods that can be used to check if they are supported or not by the current platform.
enum CygnusPlatformWebViewEnvironmentMethod {
  ///Can be used to check if the [CygnusPlatformWebViewEnvironment.compareBrowserVersions] method is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusPlatformWebViewEnvironment.compareBrowserVersions.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Windows WebView2 ([Official API - CompareBrowserVersions](https://learn.microsoft.com/en-us/microsoft-edge/webview2/reference/win32/webview2-idl?view=webview2-1.0.2210.55#comparebrowserversions))
  ///
  ///**Parameters - Officially Supported Platforms/Implementations**:
  ///- [version1]: all platforms
  ///- [version2]: all platforms
  ///
  ///Use the [CygnusPlatformWebViewEnvironment.isMethodSupported] method to check if this method is supported at runtime.
  ///{@endtemplate}
  compareBrowserVersions,

  ///Can be used to check if the [CygnusPlatformWebViewEnvironment.create] method is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusPlatformWebViewEnvironment.create.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Windows WebView2 ([Official API - CreateCoreWebView2EnvironmentWithOptions](https://learn.microsoft.com/en-us/microsoft-edge/webview2/reference/win32/webview2-idl?view=webview2-1.0.2210.55#createcorewebview2environmentwithoptions))
  ///- Linux WPE WebKit ([Official API - WebKitWebContext](https://webkitgtk.org/reference/webkit2gtk/stable/class.WebContext.html)):
  ///    - Creates a new WebKitWebContext for shared WebView configuration.
  ///
  ///**Parameters - Officially Supported Platforms/Implementations**:
  ///- [settings]: all platforms
  ///
  ///Use the [CygnusPlatformWebViewEnvironment.isMethodSupported] method to check if this method is supported at runtime.
  ///{@endtemplate}
  create,

  ///Can be used to check if the [CygnusPlatformWebViewEnvironment.dispose] method is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusPlatformWebViewEnvironment.dispose.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Windows WebView2
  ///- Linux WPE WebKit
  ///
  ///Use the [CygnusPlatformWebViewEnvironment.isMethodSupported] method to check if this method is supported at runtime.
  ///{@endtemplate}
  dispose,

  ///Can be used to check if the [CygnusPlatformWebViewEnvironment.getAvailableVersion] method is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusPlatformWebViewEnvironment.getAvailableVersion.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Windows WebView2 ([Official API - GetAvailableCoreWebView2BrowserVersionString](https://learn.microsoft.com/en-us/microsoft-edge/webview2/reference/win32/webview2-idl?view=webview2-1.0.2849.39#getavailablecorewebview2browserversionstring))
  ///- Linux WPE WebKit ([Official API - webkit_get_major_version](https://wpewebkit.org/reference/stable/wpe-webkit-2.0/func.get_major_version.html)):
  ///    - Returns WPE WebKit version string composed of major.minor.micro versions.
  ///
  ///**Parameters - Officially Supported Platforms/Implementations**:
  ///- [browserExecutableFolder]: all platforms
  ///
  ///Use the [CygnusPlatformWebViewEnvironment.isMethodSupported] method to check if this method is supported at runtime.
  ///{@endtemplate}
  getAvailableVersion,

  ///Can be used to check if the [CygnusPlatformWebViewEnvironment.getCacheModel] method is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusPlatformWebViewEnvironment.getCacheModel.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Linux WPE WebKit ([Official API - webkit_web_context_get_cache_model](https://wpewebkit.org/reference/stable/wpe-webkit-2.0/method.WebContext.get_cache_model.html))
  ///
  ///Use the [CygnusPlatformWebViewEnvironment.isMethodSupported] method to check if this method is supported at runtime.
  ///{@endtemplate}
  getCacheModel,

  ///Can be used to check if the [CygnusPlatformWebViewEnvironment.getFailureReportFolderPath] method is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusPlatformWebViewEnvironment.getFailureReportFolderPath.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Windows WebView2 1.0.1518.46++ ([Official API - ICoreWebView2Environment11.get_FailureReportFolderPath](https://learn.microsoft.com/en-us/microsoft-edge/webview2/reference/win32/icorewebview2environment11?view=webview2-1.0.2849.39#get_failurereportfolderpath))
  ///
  ///Use the [CygnusPlatformWebViewEnvironment.isMethodSupported] method to check if this method is supported at runtime.
  ///{@endtemplate}
  getFailureReportFolderPath,

  ///Can be used to check if the [CygnusPlatformWebViewEnvironment.getProcessInfos] method is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusPlatformWebViewEnvironment.getProcessInfos.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Windows WebView2 1.0.1108.44++ ([Official API - ICoreWebView2Environment8.GetProcessInfos](https://learn.microsoft.com/en-us/microsoft-edge/webview2/reference/win32/icorewebview2environment8?view=webview2-1.0.2849.39#getprocessinfos))
  ///
  ///Use the [CygnusPlatformWebViewEnvironment.isMethodSupported] method to check if this method is supported at runtime.
  ///{@endtemplate}
  getProcessInfos,

  ///Can be used to check if the [CygnusPlatformWebViewEnvironment.getSpellCheckingLanguages] method is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusPlatformWebViewEnvironment.getSpellCheckingLanguages.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Linux WPE WebKit ([Official API - webkit_web_context_get_spell_checking_languages](https://wpewebkit.org/reference/stable/wpe-webkit-2.0/method.WebContext.get_spell_checking_languages.html))
  ///
  ///Use the [CygnusPlatformWebViewEnvironment.isMethodSupported] method to check if this method is supported at runtime.
  ///{@endtemplate}
  getSpellCheckingLanguages,

  ///Can be used to check if the [CygnusPlatformWebViewEnvironment.isAutomationAllowed] method is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusPlatformWebViewEnvironment.isAutomationAllowed.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Linux WPE WebKit ([Official API - webkit_web_context_is_automation_allowed](https://wpewebkit.org/reference/stable/wpe-webkit-2.0/method.WebContext.is_automation_allowed.html))
  ///
  ///Use the [CygnusPlatformWebViewEnvironment.isMethodSupported] method to check if this method is supported at runtime.
  ///{@endtemplate}
  isAutomationAllowed,

  ///Can be used to check if the [CygnusPlatformWebViewEnvironment.isInterfaceSupported] method is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusPlatformWebViewEnvironment.isInterfaceSupported.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Windows WebView2
  ///
  ///**Parameters - Officially Supported Platforms/Implementations**:
  ///- [interface]: all platforms
  ///
  ///Use the [CygnusPlatformWebViewEnvironment.isMethodSupported] method to check if this method is supported at runtime.
  ///{@endtemplate}
  isInterfaceSupported,

  ///Can be used to check if the [CygnusPlatformWebViewEnvironment.isSpellCheckingEnabled] method is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusPlatformWebViewEnvironment.isSpellCheckingEnabled.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Linux WPE WebKit ([Official API - webkit_web_context_get_spell_checking_enabled](https://wpewebkit.org/reference/stable/wpe-webkit-2.0/method.WebContext.get_spell_checking_enabled.html))
  ///
  ///Use the [CygnusPlatformWebViewEnvironment.isMethodSupported] method to check if this method is supported at runtime.
  ///{@endtemplate}
  isSpellCheckingEnabled,
}

extension _CygnusPlatformWebViewEnvironmentMethodSupported
    on CygnusPlatformWebViewEnvironment {
  static bool isMethodSupported(
    CygnusPlatformWebViewEnvironmentMethod method, {
    TargetPlatform? platform,
  }) {
    switch (method) {
      case CygnusPlatformWebViewEnvironmentMethod.compareBrowserVersions:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [
              TargetPlatform.windows,
            ].contains(platform ?? defaultTargetPlatform);
      case CygnusPlatformWebViewEnvironmentMethod.create:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [
              TargetPlatform.windows,
              TargetPlatform.linux,
            ].contains(platform ?? defaultTargetPlatform);
      case CygnusPlatformWebViewEnvironmentMethod.dispose:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [
              TargetPlatform.windows,
              TargetPlatform.linux,
            ].contains(platform ?? defaultTargetPlatform);
      case CygnusPlatformWebViewEnvironmentMethod.getAvailableVersion:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [
              TargetPlatform.windows,
              TargetPlatform.linux,
            ].contains(platform ?? defaultTargetPlatform);
      case CygnusPlatformWebViewEnvironmentMethod.getCacheModel:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [TargetPlatform.linux].contains(platform ?? defaultTargetPlatform);
      case CygnusPlatformWebViewEnvironmentMethod.getFailureReportFolderPath:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [
              TargetPlatform.windows,
            ].contains(platform ?? defaultTargetPlatform);
      case CygnusPlatformWebViewEnvironmentMethod.getProcessInfos:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [
              TargetPlatform.windows,
            ].contains(platform ?? defaultTargetPlatform);
      case CygnusPlatformWebViewEnvironmentMethod.getSpellCheckingLanguages:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [TargetPlatform.linux].contains(platform ?? defaultTargetPlatform);
      case CygnusPlatformWebViewEnvironmentMethod.isAutomationAllowed:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [TargetPlatform.linux].contains(platform ?? defaultTargetPlatform);
      case CygnusPlatformWebViewEnvironmentMethod.isInterfaceSupported:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [
              TargetPlatform.windows,
            ].contains(platform ?? defaultTargetPlatform);
      case CygnusPlatformWebViewEnvironmentMethod.isSpellCheckingEnabled:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [TargetPlatform.linux].contains(platform ?? defaultTargetPlatform);
    }
  }
}
