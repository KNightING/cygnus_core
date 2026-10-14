import 'dart:ui';

import 'package:flutter/services.dart';
import 'package:cygnus_core/src/platform_interface/flutter_inappwebview_platform_interface.dart';

///{@macro cygnus_core.CygnusPlatformPullToRefreshController}
///
///{@macro cygnus_core.CygnusPlatformPullToRefreshController.supported_platforms}
class CygnusPullToRefreshController {
  ///{@macro cygnus_core.CygnusPlatformPullToRefreshController}
  ///
  ///{@macro cygnus_core.CygnusPlatformPullToRefreshController.supported_platforms}
  CygnusPullToRefreshController({
    void Function()? onRefresh,
    @Deprecated("Use settings instead") CygnusPullToRefreshOptions? options,
    CygnusPullToRefreshSettings? settings,
  }) : this.fromPlatformCreationParams(
         params: CygnusPlatformPullToRefreshControllerCreationParams(
           onRefresh: onRefresh,
           options: options,
           settings: settings,
         ),
       );

  /// Constructs a [CygnusPullToRefreshController].
  ///
  /// See [CygnusPullToRefreshController.fromPlatformCreationParams] for setting parameters for
  /// a specific platform.
  CygnusPullToRefreshController.fromPlatformCreationParams({
    required CygnusPlatformPullToRefreshControllerCreationParams params,
  }) : this.fromPlatform(platform: CygnusPlatformPullToRefreshController(params));

  /// Constructs a [CygnusPullToRefreshController] from a specific platform implementation.
  CygnusPullToRefreshController.fromPlatform({required this.platform});

  /// Implementation of [CygnusPlatformPullToRefreshController] for the current platform.
  final CygnusPlatformPullToRefreshController platform;

  ///{@macro cygnus_core.CygnusPlatformPullToRefreshController.options}
  ///
  ///{@macro cygnus_core.CygnusPlatformPullToRefreshController.options.supported_platforms}
  @Deprecated("Use settings instead")
  CygnusPullToRefreshOptions get options => platform.options;

  ///{@macro cygnus_core.CygnusPlatformPullToRefreshController.settings}
  ///
  ///{@macro cygnus_core.CygnusPlatformPullToRefreshController.settings.supported_platforms}
  CygnusPullToRefreshSettings get settings => platform.settings;

  ///{@macro cygnus_core.CygnusPlatformPullToRefreshController.onRefresh}
  ///
  ///{@macro cygnus_core.CygnusPlatformPullToRefreshController.onRefresh.supported_platforms}
  void Function()? get onRefresh => platform.onRefresh;

  ///{@macro cygnus_core.CygnusPlatformPullToRefreshController.setEnabled}
  ///
  ///{@macro cygnus_core.CygnusPlatformPullToRefreshController.setEnabled.supported_platforms}
  Future<void> setEnabled(bool enabled) => platform.setEnabled(enabled);

  ///{@macro cygnus_core.CygnusPlatformPullToRefreshController.isEnabled}
  ///
  ///{@macro cygnus_core.CygnusPlatformPullToRefreshController.isEnabled.supported_platforms}
  Future<bool> isEnabled() => platform.isEnabled();

  ///{@macro cygnus_core.CygnusPlatformPullToRefreshController.beginRefreshing}
  ///
  ///{@macro cygnus_core.CygnusPlatformPullToRefreshController.beginRefreshing.supported_platforms}
  Future<void> beginRefreshing() => platform.beginRefreshing();

  ///{@macro cygnus_core.CygnusPlatformPullToRefreshController.endRefreshing}
  ///
  ///{@macro cygnus_core.CygnusPlatformPullToRefreshController.endRefreshing.supported_platforms}
  Future<void> endRefreshing() => platform.endRefreshing();

  ///{@macro cygnus_core.CygnusPlatformPullToRefreshController.isRefreshing}
  ///
  ///{@macro cygnus_core.CygnusPlatformPullToRefreshController.isRefreshing.supported_platforms}
  Future<bool> isRefreshing() => platform.isRefreshing();

  ///{@macro cygnus_core.CygnusPlatformPullToRefreshController.setColor}
  ///
  ///{@macro cygnus_core.CygnusPlatformPullToRefreshController.setColor.supported_platforms}
  Future<void> setColor(Color color) => platform.setColor(color);

  ///{@macro cygnus_core.CygnusPlatformPullToRefreshController.setBackgroundColor}
  ///
  ///{@macro cygnus_core.CygnusPlatformPullToRefreshController.setBackgroundColor.supported_platforms}
  Future<void> setBackgroundColor(Color color) =>
      platform.setBackgroundColor(color);

  ///{@macro cygnus_core.CygnusPlatformPullToRefreshController.setDistanceToTriggerSync}
  ///
  ///{@macro cygnus_core.CygnusPlatformPullToRefreshController.setDistanceToTriggerSync.supported_platforms}
  Future<void> setDistanceToTriggerSync(int distanceToTriggerSync) =>
      platform.setDistanceToTriggerSync(distanceToTriggerSync);

  ///{@macro cygnus_core.CygnusPlatformPullToRefreshController.setSlingshotDistance}
  ///
  ///{@macro cygnus_core.CygnusPlatformPullToRefreshController.setSlingshotDistance.supported_platforms}
  Future<void> setSlingshotDistance(int slingshotDistance) =>
      platform.setSlingshotDistance(slingshotDistance);

  ///{@macro cygnus_core.CygnusPlatformPullToRefreshController.getDefaultSlingshotDistance}
  ///
  ///{@macro cygnus_core.CygnusPlatformPullToRefreshController.getDefaultSlingshotDistance.supported_platforms}
  Future<int> getDefaultSlingshotDistance() =>
      platform.getDefaultSlingshotDistance();

  ///{@macro cygnus_core.CygnusPlatformPullToRefreshController.setSize}
  ///
  ///{@macro cygnus_core.CygnusPlatformPullToRefreshController.setSize.supported_platforms}
  @Deprecated("Use setIndicatorSize instead")
  Future<void> setSize(CygnusAndroidPullToRefreshSize size) => platform.setSize(size);

  ///{@macro cygnus_core.CygnusPlatformPullToRefreshController.setIndicatorSize}
  ///
  ///{@macro cygnus_core.CygnusPlatformPullToRefreshController.setIndicatorSize.supported_platforms}
  Future<void> setIndicatorSize(CygnusPullToRefreshSize size) =>
      platform.setIndicatorSize(size);

  ///{@macro cygnus_core.CygnusPlatformPullToRefreshController.setAttributedTitle}
  ///
  ///{@macro cygnus_core.CygnusPlatformPullToRefreshController.setAttributedTitle.supported_platforms}
  @Deprecated("Use setStyledTitle instead")
  Future<void> setAttributedTitle(CygnusIOSNSAttributedString attributedTitle) =>
      platform.setAttributedTitle(attributedTitle);

  ///{@macro cygnus_core.CygnusPlatformPullToRefreshController.setStyledTitle}
  ///
  ///{@macro cygnus_core.CygnusPlatformPullToRefreshController.setStyledTitle.supported_platforms}
  Future<void> setStyledTitle(CygnusAttributedString attributedTitle) =>
      platform.setStyledTitle(attributedTitle);

  ///{@macro cygnus_core.CygnusPlatformPullToRefreshController.dispose}
  ///
  ///{@macro cygnus_core.CygnusPlatformPullToRefreshController.dispose.supported_platforms}
  void dispose({bool isKeepAlive = false}) =>
      platform.dispose(isKeepAlive: isKeepAlive);

  ///{@macro cygnus_core.CygnusPlatformPullToRefreshController.isClassSupported}
  static bool isClassSupported({TargetPlatform? platform}) =>
      CygnusPlatformPullToRefreshController.static().isClassSupported(
        platform: platform,
      );

  ///{@macro cygnus_core.CygnusPlatformPullToRefreshController.isPropertySupported}
  static bool isPropertySupported(
    CygnusPlatformPullToRefreshControllerCreationParamsProperty property, {
    TargetPlatform? platform,
  }) => CygnusPlatformPullToRefreshController.static().isPropertySupported(
    property,
    platform: platform,
  );

  ///{@macro cygnus_core.CygnusPlatformPullToRefreshController.isMethodSupported}
  static bool isMethodSupported(
    CygnusPlatformPullToRefreshControllerMethod method, {
    TargetPlatform? platform,
  }) => CygnusPlatformPullToRefreshController.static().isMethodSupported(
    method,
    platform: platform,
  );
}
