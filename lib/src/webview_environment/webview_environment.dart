import 'dart:core';

import 'package:flutter/foundation.dart';
import 'package:cygnus_core/src/platform_interface/flutter_inappwebview_platform_interface.dart';

///{@macro cygnus_core.CygnusPlatformWebViewEnvironment}
///
///{@macro cygnus_core.CygnusPlatformWebViewEnvironment.supported_platforms}
class CygnusWebViewEnvironment {
  /// Constructs a [CygnusWebViewEnvironment].
  ///
  /// See [CygnusWebViewEnvironment.fromPlatformCreationParams] for setting parameters for
  /// a specific platform.
  CygnusWebViewEnvironment.fromPlatformCreationParams({
    required CygnusPlatformWebViewEnvironmentCreationParams params,
  }) : this.fromPlatform(platform: CygnusPlatformWebViewEnvironment(params));

  /// Constructs a [CygnusWebViewEnvironment] from a specific platform implementation.
  CygnusWebViewEnvironment.fromPlatform({required this.platform});

  /// Implementation of [CygnusPlatformWebViewEnvironment] for the current platform.
  final CygnusPlatformWebViewEnvironment platform;

  ///{@macro cygnus_core.CygnusPlatformWebViewEnvironment.id}
  ///
  ///{@macro cygnus_core.CygnusPlatformWebViewEnvironment.id.supported_platforms}
  String get id => platform.id;

  ///{@macro cygnus_core.CygnusPlatformWebViewEnvironment.settings}
  ///
  ///{@macro cygnus_core.CygnusPlatformWebViewEnvironment.settings.supported_platforms}
  CygnusWebViewEnvironmentSettings? get settings => platform.settings;

  ///{@macro cygnus_core.CygnusPlatformWebViewEnvironment.isInterfaceSupported}
  ///
  ///{@macro cygnus_core.CygnusPlatformWebViewEnvironment.isInterfaceSupported.supported_platforms}
  Future<bool> isInterfaceSupported(CygnusWebViewInterface interface) =>
      platform.isInterfaceSupported(interface);

  ///{@macro cygnus_core.CygnusPlatformWebViewEnvironment.getProcessInfos}
  ///
  ///{@macro cygnus_core.CygnusPlatformWebViewEnvironment.getProcessInfos.supported_platforms}
  Future<List<CygnusBrowserProcessInfo>> getProcessInfos() =>
      platform.getProcessInfos();

  ///{@macro cygnus_core.CygnusPlatformWebViewEnvironment.getFailureReportFolderPath}
  ///
  ///{@macro cygnus_core.CygnusPlatformWebViewEnvironment.getFailureReportFolderPath.supported_platforms}
  Future<String?> getFailureReportFolderPath() =>
      platform.getFailureReportFolderPath();

  ///{@macro cygnus_core.CygnusPlatformWebViewEnvironment.create}
  ///
  ///{@macro cygnus_core.CygnusPlatformWebViewEnvironment.create.supported_platforms}
  static Future<CygnusWebViewEnvironment> create({
    CygnusWebViewEnvironmentSettings? settings,
  }) async {
    return CygnusWebViewEnvironment.fromPlatform(
      platform: await CygnusPlatformWebViewEnvironment.static().create(
        settings: settings,
      ),
    );
  }

  ///{@macro cygnus_core.CygnusPlatformWebViewEnvironment.getAvailableVersion}
  ///
  ///{@macro cygnus_core.CygnusPlatformWebViewEnvironment.getAvailableVersion.supported_platforms}
  static Future<String?> getAvailableVersion({
    String? browserExecutableFolder,
  }) => CygnusPlatformWebViewEnvironment.static().getAvailableVersion(
    browserExecutableFolder: browserExecutableFolder,
  );

  ///{@macro cygnus_core.CygnusPlatformWebViewEnvironment.getAvailableVersion}
  ///
  ///{@macro cygnus_core.CygnusPlatformWebViewEnvironment.getAvailableVersion.supported_platforms}
  static Future<int?> compareBrowserVersions({
    required String version1,
    required String version2,
  }) => CygnusPlatformWebViewEnvironment.static().compareBrowserVersions(
    version1: version1,
    version2: version2,
  );

  ///{@macro cygnus_core.CygnusPlatformWebViewEnvironment.onNewBrowserVersionAvailable}
  ///
  ///{@macro cygnus_core.CygnusPlatformWebViewEnvironment.onNewBrowserVersionAvailable.supported_platforms}
  void Function()? get onNewBrowserVersionAvailable =>
      platform.onNewBrowserVersionAvailable;
  set onNewBrowserVersionAvailable(void Function()? value) =>
      platform.onNewBrowserVersionAvailable = value;

  ///{@macro cygnus_core.CygnusPlatformWebViewEnvironment.onBrowserProcessExited}
  ///
  ///{@macro cygnus_core.CygnusPlatformWebViewEnvironment.onBrowserProcessExited.supported_platforms}
  void Function(CygnusBrowserProcessExitedDetail detail)?
  get onBrowserProcessExited => platform.onBrowserProcessExited;
  set onBrowserProcessExited(
    void Function(CygnusBrowserProcessExitedDetail detail)? value,
  ) => platform.onBrowserProcessExited = value;

  ///{@macro cygnus_core.CygnusPlatformWebViewEnvironment.onProcessInfosChanged}
  ///
  ///{@macro cygnus_core.CygnusPlatformWebViewEnvironment.onProcessInfosChanged.supported_platforms}
  void Function(CygnusBrowserProcessInfosChangedDetail detail)?
  get onProcessInfosChanged => platform.onProcessInfosChanged;
  set onProcessInfosChanged(
    void Function(CygnusBrowserProcessInfosChangedDetail detail)? value,
  ) => platform.onProcessInfosChanged = value;

  ///{@macro cygnus_core.CygnusPlatformWebViewEnvironment.getCacheModel}
  ///
  ///{@macro cygnus_core.CygnusPlatformWebViewEnvironment.getCacheModel.supported_platforms}
  Future<CygnusCacheModel?> getCacheModel() => platform.getCacheModel();

  ///{@macro cygnus_core.CygnusPlatformWebViewEnvironment.isSpellCheckingEnabled}
  ///
  ///{@macro cygnus_core.CygnusPlatformWebViewEnvironment.isSpellCheckingEnabled.supported_platforms}
  Future<bool> isSpellCheckingEnabled() => platform.isSpellCheckingEnabled();

  ///{@macro cygnus_core.CygnusPlatformWebViewEnvironment.getSpellCheckingLanguages}
  ///
  ///{@macro cygnus_core.CygnusPlatformWebViewEnvironment.getSpellCheckingLanguages.supported_platforms}
  Future<List<String>> getSpellCheckingLanguages() =>
      platform.getSpellCheckingLanguages();

  ///{@macro cygnus_core.CygnusPlatformWebViewEnvironment.isAutomationAllowed}
  ///
  ///{@macro cygnus_core.CygnusPlatformWebViewEnvironment.isAutomationAllowed.supported_platforms}
  Future<bool> isAutomationAllowed() => platform.isAutomationAllowed();

  ///{@macro cygnus_core.CygnusPlatformWebViewEnvironment.dispose}
  ///
  ///{@macro cygnus_core.CygnusPlatformWebViewEnvironment.dispose.supported_platforms}
  Future<void> dispose() => platform.dispose();

  ///{@macro cygnus_core.CygnusPlatformWebViewEnvironmentCreationParams.isClassSupported}
  static bool isClassSupported({TargetPlatform? platform}) =>
      CygnusPlatformWebViewEnvironment.static().isClassSupported(platform: platform);

  ///{@macro cygnus_core.CygnusPlatformWebViewEnvironment.isPropertySupported}
  static bool isPropertySupported(
    dynamic property, {
    TargetPlatform? platform,
  }) => CygnusPlatformWebViewEnvironment.static().isPropertySupported(
    property,
    platform: platform,
  );

  ///{@macro cygnus_core.CygnusPlatformWebViewEnvironment.isMethodSupported}
  static bool isMethodSupported(
    CygnusPlatformWebViewEnvironmentMethod method, {
    TargetPlatform? platform,
  }) => CygnusPlatformWebViewEnvironment.static().isMethodSupported(
    method,
    platform: platform,
  );
}
