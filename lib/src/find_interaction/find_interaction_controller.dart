import 'package:flutter/foundation.dart';
import 'package:cygnus_core/src/platform_interface/flutter_inappwebview_platform_interface.dart';

///{@macro cygnus_core.PlatformFindInteractionController}
///
///{@macro cygnus_core.PlatformFindInteractionController.supported_platforms}
class FindInteractionController {
  ///{@macro cygnus_core.PlatformFindInteractionController}
  ///
  ///{@macro cygnus_core.PlatformFindInteractionController.supported_platforms}
  FindInteractionController({
    void Function(
      PlatformFindInteractionController controller,
      int activeMatchOrdinal,
      int numberOfMatches,
      bool isDoneCounting,
    )?
    onFindResultReceived,
  }) : this.fromPlatformCreationParams(
         params: PlatformFindInteractionControllerCreationParams(
           onFindResultReceived: onFindResultReceived,
         ),
       );

  /// Constructs a [FindInteractionController].
  ///
  /// See [FindInteractionController.fromPlatformCreationParams] for setting parameters for
  /// a specific platform.
  FindInteractionController.fromPlatformCreationParams({
    required PlatformFindInteractionControllerCreationParams params,
  }) : this.fromPlatform(platform: PlatformFindInteractionController(params));

  /// Constructs a [FindInteractionController] from a specific platform implementation.
  FindInteractionController.fromPlatform({required this.platform});

  /// Implementation of [PlatformFindInteractionController] for the current platform.
  final PlatformFindInteractionController platform;

  ///{@macro cygnus_core.PlatformFindInteractionController.onFindResultReceived}
  ///
  ///{@macro cygnus_core.PlatformFindInteractionController.onFindResultReceived.supported_platforms}
  void Function(
    PlatformFindInteractionController controller,
    int activeMatchOrdinal,
    int numberOfMatches,
    bool isDoneCounting,
  )?
  get onFindResultReceived => platform.onFindResultReceived;

  ///{@macro cygnus_core.PlatformFindInteractionController.findAll}
  ///
  ///{@macro cygnus_core.PlatformFindInteractionController.findAll.supported_platforms}
  Future<void> findAll({String? find}) => platform.findAll(find: find);

  ///{@macro cygnus_core.PlatformFindInteractionController.findNext}
  ///
  ///{@macro cygnus_core.PlatformFindInteractionController.findNext.supported_platforms}
  Future<void> findNext({bool forward = true}) =>
      platform.findNext(forward: forward);

  ///{@macro cygnus_core.PlatformFindInteractionController.clearMatches}
  ///
  ///{@macro cygnus_core.PlatformFindInteractionController.clearMatches.supported_platforms}
  Future<void> clearMatches() => platform.clearMatches();

  ///{@macro cygnus_core.PlatformFindInteractionController.setSearchText}
  ///
  ///{@macro cygnus_core.PlatformFindInteractionController.setSearchText.supported_platforms}
  Future<void> setSearchText(String? searchText) =>
      platform.setSearchText(searchText);

  ///{@macro cygnus_core.PlatformFindInteractionController.getSearchText}
  ///
  ///{@macro cygnus_core.PlatformFindInteractionController.getSearchText.supported_platforms}
  Future<String?> getSearchText() => platform.getSearchText();

  ///{@macro cygnus_core.PlatformFindInteractionController.isFindNavigatorVisible}
  ///
  ///{@macro cygnus_core.PlatformFindInteractionController.isFindNavigatorVisible.supported_platforms}
  Future<bool?> isFindNavigatorVisible() => platform.isFindNavigatorVisible();

  ///{@macro cygnus_core.PlatformFindInteractionController.updateResultCount}
  ///
  ///{@macro cygnus_core.PlatformFindInteractionController.updateResultCount.supported_platforms}
  Future<void> updateResultCount() => platform.updateResultCount();

  ///{@macro cygnus_core.PlatformFindInteractionController.presentFindNavigator}
  ///
  ///{@macro cygnus_core.PlatformFindInteractionController.presentFindNavigator.supported_platforms}
  Future<void> presentFindNavigator() => platform.presentFindNavigator();

  ///{@macro cygnus_core.PlatformFindInteractionController.dismissFindNavigator}
  ///
  ///{@macro cygnus_core.PlatformFindInteractionController.dismissFindNavigator.supported_platforms}
  Future<void> dismissFindNavigator() => platform.dismissFindNavigator();

  ///{@macro cygnus_core.PlatformFindInteractionController.getActiveFindSession}
  ///
  ///{@macro cygnus_core.PlatformFindInteractionController.getActiveFindSession.supported_platforms}
  Future<FindSession?> getActiveFindSession() =>
      platform.getActiveFindSession();

  ///{@macro cygnus_core.PlatformFindInteractionController.dispose}
  ///
  ///{@macro cygnus_core.PlatformFindInteractionController.dispose.supported_platforms}
  void dispose({bool isKeepAlive = false}) => platform.dispose();

  ///{@macro cygnus_core.PlatformFindInteractionControllerCreationParams.isClassSupported}
  static bool isClassSupported({TargetPlatform? platform}) =>
      PlatformFindInteractionController.static().isClassSupported(
        platform: platform,
      );

  ///{@macro cygnus_core.PlatformFindInteractionController.isPropertySupported}
  static bool isPropertySupported(
    PlatformFindInteractionControllerCreationParamsProperty property, {
    TargetPlatform? platform,
  }) => PlatformFindInteractionController.static().isPropertySupported(
    property,
    platform: platform,
  );

  ///{@macro cygnus_core.PlatformFindInteractionController.isMethodSupported}
  static bool isMethodSupported(
    PlatformFindInteractionControllerMethod method, {
    TargetPlatform? platform,
  }) => PlatformFindInteractionController.static().isMethodSupported(
    method,
    platform: platform,
  );
}
