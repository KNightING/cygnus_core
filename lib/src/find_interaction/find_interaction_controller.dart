import 'package:flutter/foundation.dart';
import 'package:cygnus_core/src/platform_interface/flutter_webview_platform_interface.dart';

///{@macro cygnus_core.CygnusPlatformFindInteractionController}
///
///{@macro cygnus_core.CygnusPlatformFindInteractionController.supported_platforms}
class CygnusFindInteractionController {
  ///{@macro cygnus_core.CygnusPlatformFindInteractionController}
  ///
  ///{@macro cygnus_core.CygnusPlatformFindInteractionController.supported_platforms}
  CygnusFindInteractionController({
    void Function(
      CygnusPlatformFindInteractionController controller,
      int activeMatchOrdinal,
      int numberOfMatches,
      bool isDoneCounting,
    )?
    onFindResultReceived,
  }) : this.fromPlatformCreationParams(
         params: CygnusPlatformFindInteractionControllerCreationParams(
           onFindResultReceived: onFindResultReceived,
         ),
       );

  /// Constructs a [CygnusFindInteractionController].
  ///
  /// See [CygnusFindInteractionController.fromPlatformCreationParams] for setting parameters for
  /// a specific platform.
  CygnusFindInteractionController.fromPlatformCreationParams({
    required CygnusPlatformFindInteractionControllerCreationParams params,
  }) : this.fromPlatform(platform: CygnusPlatformFindInteractionController(params));

  /// Constructs a [CygnusFindInteractionController] from a specific platform implementation.
  CygnusFindInteractionController.fromPlatform({required this.platform});

  /// Implementation of [CygnusPlatformFindInteractionController] for the current platform.
  final CygnusPlatformFindInteractionController platform;

  ///{@macro cygnus_core.CygnusPlatformFindInteractionController.onFindResultReceived}
  ///
  ///{@macro cygnus_core.CygnusPlatformFindInteractionController.onFindResultReceived.supported_platforms}
  void Function(
    CygnusPlatformFindInteractionController controller,
    int activeMatchOrdinal,
    int numberOfMatches,
    bool isDoneCounting,
  )?
  get onFindResultReceived => platform.onFindResultReceived;

  ///{@macro cygnus_core.CygnusPlatformFindInteractionController.findAll}
  ///
  ///{@macro cygnus_core.CygnusPlatformFindInteractionController.findAll.supported_platforms}
  Future<void> findAll({String? find}) => platform.findAll(find: find);

  ///{@macro cygnus_core.CygnusPlatformFindInteractionController.findNext}
  ///
  ///{@macro cygnus_core.CygnusPlatformFindInteractionController.findNext.supported_platforms}
  Future<void> findNext({bool forward = true}) =>
      platform.findNext(forward: forward);

  ///{@macro cygnus_core.CygnusPlatformFindInteractionController.clearMatches}
  ///
  ///{@macro cygnus_core.CygnusPlatformFindInteractionController.clearMatches.supported_platforms}
  Future<void> clearMatches() => platform.clearMatches();

  ///{@macro cygnus_core.CygnusPlatformFindInteractionController.setSearchText}
  ///
  ///{@macro cygnus_core.CygnusPlatformFindInteractionController.setSearchText.supported_platforms}
  Future<void> setSearchText(String? searchText) =>
      platform.setSearchText(searchText);

  ///{@macro cygnus_core.CygnusPlatformFindInteractionController.getSearchText}
  ///
  ///{@macro cygnus_core.CygnusPlatformFindInteractionController.getSearchText.supported_platforms}
  Future<String?> getSearchText() => platform.getSearchText();

  ///{@macro cygnus_core.CygnusPlatformFindInteractionController.isFindNavigatorVisible}
  ///
  ///{@macro cygnus_core.CygnusPlatformFindInteractionController.isFindNavigatorVisible.supported_platforms}
  Future<bool?> isFindNavigatorVisible() => platform.isFindNavigatorVisible();

  ///{@macro cygnus_core.CygnusPlatformFindInteractionController.updateResultCount}
  ///
  ///{@macro cygnus_core.CygnusPlatformFindInteractionController.updateResultCount.supported_platforms}
  Future<void> updateResultCount() => platform.updateResultCount();

  ///{@macro cygnus_core.CygnusPlatformFindInteractionController.presentFindNavigator}
  ///
  ///{@macro cygnus_core.CygnusPlatformFindInteractionController.presentFindNavigator.supported_platforms}
  Future<void> presentFindNavigator() => platform.presentFindNavigator();

  ///{@macro cygnus_core.CygnusPlatformFindInteractionController.dismissFindNavigator}
  ///
  ///{@macro cygnus_core.CygnusPlatformFindInteractionController.dismissFindNavigator.supported_platforms}
  Future<void> dismissFindNavigator() => platform.dismissFindNavigator();

  ///{@macro cygnus_core.CygnusPlatformFindInteractionController.getActiveFindSession}
  ///
  ///{@macro cygnus_core.CygnusPlatformFindInteractionController.getActiveFindSession.supported_platforms}
  Future<CygnusFindSession?> getActiveFindSession() =>
      platform.getActiveFindSession();

  ///{@macro cygnus_core.CygnusPlatformFindInteractionController.dispose}
  ///
  ///{@macro cygnus_core.CygnusPlatformFindInteractionController.dispose.supported_platforms}
  void dispose({bool isKeepAlive = false}) => platform.dispose();

  ///{@macro cygnus_core.CygnusPlatformFindInteractionControllerCreationParams.isClassSupported}
  static bool isClassSupported({TargetPlatform? platform}) =>
      CygnusPlatformFindInteractionController.static().isClassSupported(
        platform: platform,
      );

  ///{@macro cygnus_core.CygnusPlatformFindInteractionController.isPropertySupported}
  static bool isPropertySupported(
    CygnusPlatformFindInteractionControllerCreationParamsProperty property, {
    TargetPlatform? platform,
  }) => CygnusPlatformFindInteractionController.static().isPropertySupported(
    property,
    platform: platform,
  );

  ///{@macro cygnus_core.CygnusPlatformFindInteractionController.isMethodSupported}
  static bool isMethodSupported(
    CygnusPlatformFindInteractionControllerMethod method, {
    TargetPlatform? platform,
  }) => CygnusPlatformFindInteractionController.static().isMethodSupported(
    method,
    platform: platform,
  );
}
