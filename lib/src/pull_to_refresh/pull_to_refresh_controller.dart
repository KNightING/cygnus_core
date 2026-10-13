import 'dart:ui';

import 'package:flutter/services.dart';
import 'package:cygnus_core/src/platform_interface/flutter_inappwebview_platform_interface.dart';

///{@macro cygnus_core.PlatformPullToRefreshController}
///
///{@macro cygnus_core.PlatformPullToRefreshController.supported_platforms}
class PullToRefreshController {
  ///{@macro cygnus_core.PlatformPullToRefreshController}
  ///
  ///{@macro cygnus_core.PlatformPullToRefreshController.supported_platforms}
  PullToRefreshController({
    void Function()? onRefresh,
    @Deprecated("Use settings instead") PullToRefreshOptions? options,
    PullToRefreshSettings? settings,
  }) : this.fromPlatformCreationParams(
         params: PlatformPullToRefreshControllerCreationParams(
           onRefresh: onRefresh,
           options: options,
           settings: settings,
         ),
       );

  /// Constructs a [PullToRefreshController].
  ///
  /// See [PullToRefreshController.fromPlatformCreationParams] for setting parameters for
  /// a specific platform.
  PullToRefreshController.fromPlatformCreationParams({
    required PlatformPullToRefreshControllerCreationParams params,
  }) : this.fromPlatform(platform: PlatformPullToRefreshController(params));

  /// Constructs a [PullToRefreshController] from a specific platform implementation.
  PullToRefreshController.fromPlatform({required this.platform});

  /// Implementation of [PlatformPullToRefreshController] for the current platform.
  final PlatformPullToRefreshController platform;

  ///{@macro cygnus_core.PlatformPullToRefreshController.options}
  ///
  ///{@macro cygnus_core.PlatformPullToRefreshController.options.supported_platforms}
  @Deprecated("Use settings instead")
  PullToRefreshOptions get options => platform.options;

  ///{@macro cygnus_core.PlatformPullToRefreshController.settings}
  ///
  ///{@macro cygnus_core.PlatformPullToRefreshController.settings.supported_platforms}
  PullToRefreshSettings get settings => platform.settings;

  ///{@macro cygnus_core.PlatformPullToRefreshController.onRefresh}
  ///
  ///{@macro cygnus_core.PlatformPullToRefreshController.onRefresh.supported_platforms}
  void Function()? get onRefresh => platform.onRefresh;

  ///{@macro cygnus_core.PlatformPullToRefreshController.setEnabled}
  ///
  ///{@macro cygnus_core.PlatformPullToRefreshController.setEnabled.supported_platforms}
  Future<void> setEnabled(bool enabled) => platform.setEnabled(enabled);

  ///{@macro cygnus_core.PlatformPullToRefreshController.isEnabled}
  ///
  ///{@macro cygnus_core.PlatformPullToRefreshController.isEnabled.supported_platforms}
  Future<bool> isEnabled() => platform.isEnabled();

  ///{@macro cygnus_core.PlatformPullToRefreshController.beginRefreshing}
  ///
  ///{@macro cygnus_core.PlatformPullToRefreshController.beginRefreshing.supported_platforms}
  Future<void> beginRefreshing() => platform.beginRefreshing();

  ///{@macro cygnus_core.PlatformPullToRefreshController.endRefreshing}
  ///
  ///{@macro cygnus_core.PlatformPullToRefreshController.endRefreshing.supported_platforms}
  Future<void> endRefreshing() => platform.endRefreshing();

  ///{@macro cygnus_core.PlatformPullToRefreshController.isRefreshing}
  ///
  ///{@macro cygnus_core.PlatformPullToRefreshController.isRefreshing.supported_platforms}
  Future<bool> isRefreshing() => platform.isRefreshing();

  ///{@macro cygnus_core.PlatformPullToRefreshController.setColor}
  ///
  ///{@macro cygnus_core.PlatformPullToRefreshController.setColor.supported_platforms}
  Future<void> setColor(Color color) => platform.setColor(color);

  ///{@macro cygnus_core.PlatformPullToRefreshController.setBackgroundColor}
  ///
  ///{@macro cygnus_core.PlatformPullToRefreshController.setBackgroundColor.supported_platforms}
  Future<void> setBackgroundColor(Color color) =>
      platform.setBackgroundColor(color);

  ///{@macro cygnus_core.PlatformPullToRefreshController.setDistanceToTriggerSync}
  ///
  ///{@macro cygnus_core.PlatformPullToRefreshController.setDistanceToTriggerSync.supported_platforms}
  Future<void> setDistanceToTriggerSync(int distanceToTriggerSync) =>
      platform.setDistanceToTriggerSync(distanceToTriggerSync);

  ///{@macro cygnus_core.PlatformPullToRefreshController.setSlingshotDistance}
  ///
  ///{@macro cygnus_core.PlatformPullToRefreshController.setSlingshotDistance.supported_platforms}
  Future<void> setSlingshotDistance(int slingshotDistance) =>
      platform.setSlingshotDistance(slingshotDistance);

  ///{@macro cygnus_core.PlatformPullToRefreshController.getDefaultSlingshotDistance}
  ///
  ///{@macro cygnus_core.PlatformPullToRefreshController.getDefaultSlingshotDistance.supported_platforms}
  Future<int> getDefaultSlingshotDistance() =>
      platform.getDefaultSlingshotDistance();

  ///{@macro cygnus_core.PlatformPullToRefreshController.setSize}
  ///
  ///{@macro cygnus_core.PlatformPullToRefreshController.setSize.supported_platforms}
  @Deprecated("Use setIndicatorSize instead")
  Future<void> setSize(AndroidPullToRefreshSize size) => platform.setSize(size);

  ///{@macro cygnus_core.PlatformPullToRefreshController.setIndicatorSize}
  ///
  ///{@macro cygnus_core.PlatformPullToRefreshController.setIndicatorSize.supported_platforms}
  Future<void> setIndicatorSize(PullToRefreshSize size) =>
      platform.setIndicatorSize(size);

  ///{@macro cygnus_core.PlatformPullToRefreshController.setAttributedTitle}
  ///
  ///{@macro cygnus_core.PlatformPullToRefreshController.setAttributedTitle.supported_platforms}
  @Deprecated("Use setStyledTitle instead")
  Future<void> setAttributedTitle(IOSNSAttributedString attributedTitle) =>
      platform.setAttributedTitle(attributedTitle);

  ///{@macro cygnus_core.PlatformPullToRefreshController.setStyledTitle}
  ///
  ///{@macro cygnus_core.PlatformPullToRefreshController.setStyledTitle.supported_platforms}
  Future<void> setStyledTitle(AttributedString attributedTitle) =>
      platform.setStyledTitle(attributedTitle);

  ///{@macro cygnus_core.PlatformPullToRefreshController.dispose}
  ///
  ///{@macro cygnus_core.PlatformPullToRefreshController.dispose.supported_platforms}
  void dispose({bool isKeepAlive = false}) =>
      platform.dispose(isKeepAlive: isKeepAlive);

  ///{@macro cygnus_core.PlatformPullToRefreshController.isClassSupported}
  static bool isClassSupported({TargetPlatform? platform}) =>
      PlatformPullToRefreshController.static().isClassSupported(
        platform: platform,
      );

  ///{@macro cygnus_core.PlatformPullToRefreshController.isPropertySupported}
  static bool isPropertySupported(
    PlatformPullToRefreshControllerCreationParamsProperty property, {
    TargetPlatform? platform,
  }) => PlatformPullToRefreshController.static().isPropertySupported(
    property,
    platform: platform,
  );

  ///{@macro cygnus_core.PlatformPullToRefreshController.isMethodSupported}
  static bool isMethodSupported(
    PlatformPullToRefreshControllerMethod method, {
    TargetPlatform? platform,
  }) => PlatformPullToRefreshController.static().isMethodSupported(
    method,
    platform: platform,
  );
}
