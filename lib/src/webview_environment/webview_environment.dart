import 'dart:core';

import 'package:flutter/foundation.dart';
import 'package:cygnus_core/src/platform_interface/flutter_inappwebview_platform_interface.dart';

///{@macro cygnus_core.PlatformWebViewEnvironment}
///
///{@macro cygnus_core.PlatformWebViewEnvironment.supported_platforms}
class WebViewEnvironment {
  /// Constructs a [WebViewEnvironment].
  ///
  /// See [WebViewEnvironment.fromPlatformCreationParams] for setting parameters for
  /// a specific platform.
  WebViewEnvironment.fromPlatformCreationParams({
    required PlatformWebViewEnvironmentCreationParams params,
  }) : this.fromPlatform(platform: PlatformWebViewEnvironment(params));

  /// Constructs a [WebViewEnvironment] from a specific platform implementation.
  WebViewEnvironment.fromPlatform({required this.platform});

  /// Implementation of [PlatformWebViewEnvironment] for the current platform.
  final PlatformWebViewEnvironment platform;

  ///{@macro cygnus_core.PlatformWebViewEnvironment.id}
  ///
  ///{@macro cygnus_core.PlatformWebViewEnvironment.id.supported_platforms}
  String get id => platform.id;

  ///{@macro cygnus_core.PlatformWebViewEnvironment.settings}
  ///
  ///{@macro cygnus_core.PlatformWebViewEnvironment.settings.supported_platforms}
  WebViewEnvironmentSettings? get settings => platform.settings;

  ///{@macro cygnus_core.PlatformWebViewEnvironment.isInterfaceSupported}
  ///
  ///{@macro cygnus_core.PlatformWebViewEnvironment.isInterfaceSupported.supported_platforms}
  Future<bool> isInterfaceSupported(WebViewInterface interface) =>
      platform.isInterfaceSupported(interface);

  ///{@macro cygnus_core.PlatformWebViewEnvironment.getProcessInfos}
  ///
  ///{@macro cygnus_core.PlatformWebViewEnvironment.getProcessInfos.supported_platforms}
  Future<List<BrowserProcessInfo>> getProcessInfos() =>
      platform.getProcessInfos();

  ///{@macro cygnus_core.PlatformWebViewEnvironment.getFailureReportFolderPath}
  ///
  ///{@macro cygnus_core.PlatformWebViewEnvironment.getFailureReportFolderPath.supported_platforms}
  Future<String?> getFailureReportFolderPath() =>
      platform.getFailureReportFolderPath();

  ///{@macro cygnus_core.PlatformWebViewEnvironment.create}
  ///
  ///{@macro cygnus_core.PlatformWebViewEnvironment.create.supported_platforms}
  static Future<WebViewEnvironment> create({
    WebViewEnvironmentSettings? settings,
  }) async {
    return WebViewEnvironment.fromPlatform(
      platform: await PlatformWebViewEnvironment.static().create(
        settings: settings,
      ),
    );
  }

  ///{@macro cygnus_core.PlatformWebViewEnvironment.getAvailableVersion}
  ///
  ///{@macro cygnus_core.PlatformWebViewEnvironment.getAvailableVersion.supported_platforms}
  static Future<String?> getAvailableVersion({
    String? browserExecutableFolder,
  }) => PlatformWebViewEnvironment.static().getAvailableVersion(
    browserExecutableFolder: browserExecutableFolder,
  );

  ///{@macro cygnus_core.PlatformWebViewEnvironment.getAvailableVersion}
  ///
  ///{@macro cygnus_core.PlatformWebViewEnvironment.getAvailableVersion.supported_platforms}
  static Future<int?> compareBrowserVersions({
    required String version1,
    required String version2,
  }) => PlatformWebViewEnvironment.static().compareBrowserVersions(
    version1: version1,
    version2: version2,
  );

  ///{@macro cygnus_core.PlatformWebViewEnvironment.onNewBrowserVersionAvailable}
  ///
  ///{@macro cygnus_core.PlatformWebViewEnvironment.onNewBrowserVersionAvailable.supported_platforms}
  void Function()? get onNewBrowserVersionAvailable =>
      platform.onNewBrowserVersionAvailable;
  set onNewBrowserVersionAvailable(void Function()? value) =>
      platform.onNewBrowserVersionAvailable = value;

  ///{@macro cygnus_core.PlatformWebViewEnvironment.onBrowserProcessExited}
  ///
  ///{@macro cygnus_core.PlatformWebViewEnvironment.onBrowserProcessExited.supported_platforms}
  void Function(BrowserProcessExitedDetail detail)?
  get onBrowserProcessExited => platform.onBrowserProcessExited;
  set onBrowserProcessExited(
    void Function(BrowserProcessExitedDetail detail)? value,
  ) => platform.onBrowserProcessExited = value;

  ///{@macro cygnus_core.PlatformWebViewEnvironment.onProcessInfosChanged}
  ///
  ///{@macro cygnus_core.PlatformWebViewEnvironment.onProcessInfosChanged.supported_platforms}
  void Function(BrowserProcessInfosChangedDetail detail)?
  get onProcessInfosChanged => platform.onProcessInfosChanged;
  set onProcessInfosChanged(
    void Function(BrowserProcessInfosChangedDetail detail)? value,
  ) => platform.onProcessInfosChanged = value;

  ///{@macro cygnus_core.PlatformWebViewEnvironment.getCacheModel}
  ///
  ///{@macro cygnus_core.PlatformWebViewEnvironment.getCacheModel.supported_platforms}
  Future<CacheModel?> getCacheModel() => platform.getCacheModel();

  ///{@macro cygnus_core.PlatformWebViewEnvironment.isSpellCheckingEnabled}
  ///
  ///{@macro cygnus_core.PlatformWebViewEnvironment.isSpellCheckingEnabled.supported_platforms}
  Future<bool> isSpellCheckingEnabled() => platform.isSpellCheckingEnabled();

  ///{@macro cygnus_core.PlatformWebViewEnvironment.getSpellCheckingLanguages}
  ///
  ///{@macro cygnus_core.PlatformWebViewEnvironment.getSpellCheckingLanguages.supported_platforms}
  Future<List<String>> getSpellCheckingLanguages() =>
      platform.getSpellCheckingLanguages();

  ///{@macro cygnus_core.PlatformWebViewEnvironment.isAutomationAllowed}
  ///
  ///{@macro cygnus_core.PlatformWebViewEnvironment.isAutomationAllowed.supported_platforms}
  Future<bool> isAutomationAllowed() => platform.isAutomationAllowed();

  ///{@macro cygnus_core.PlatformWebViewEnvironment.dispose}
  ///
  ///{@macro cygnus_core.PlatformWebViewEnvironment.dispose.supported_platforms}
  Future<void> dispose() => platform.dispose();

  ///{@macro cygnus_core.PlatformWebViewEnvironmentCreationParams.isClassSupported}
  static bool isClassSupported({TargetPlatform? platform}) =>
      PlatformWebViewEnvironment.static().isClassSupported(platform: platform);

  ///{@macro cygnus_core.PlatformWebViewEnvironment.isPropertySupported}
  static bool isPropertySupported(
    dynamic property, {
    TargetPlatform? platform,
  }) => PlatformWebViewEnvironment.static().isPropertySupported(
    property,
    platform: platform,
  );

  ///{@macro cygnus_core.PlatformWebViewEnvironment.isMethodSupported}
  static bool isMethodSupported(
    PlatformWebViewEnvironmentMethod method, {
    TargetPlatform? platform,
  }) => PlatformWebViewEnvironment.static().isMethodSupported(
    method,
    platform: platform,
  );
}
