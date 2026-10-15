import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:cygnus_core_internal_annotations/cygnus_core_internal_annotations.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import '../debug_logging_settings.dart';
import '../browser/platform_browser.dart';
import '../webview/webview_settings.dart';
import '../webview/platform_webview.dart';
import '../webview_platform.dart';
import '../types/main.dart';
import 'pull_to_refresh_settings.dart';

// ignore: uri_has_not_been_generated
part 'platform_pull_to_refresh_controller.g.dart';

///{@template cygnus_core.CygnusPlatformPullToRefreshControllerCreationParams}
/// Object specifying creation parameters for creating a [CygnusPlatformPullToRefreshController].
///
/// Platform specific implementations can add additional fields by extending
/// this class.
///{@endtemplate}
///
///{@macro cygnus_core.CygnusPlatformPullToRefreshControllerCreationParams.supported_platforms}
@SupportedPlatforms(platforms: [AndroidPlatform(), IOSPlatform()])
class CygnusPlatformPullToRefreshControllerCreationParams {
  /// Used by the platform implementation to create a new [CygnusPlatformPullToRefreshController].
  CygnusPlatformPullToRefreshControllerCreationParams({
    @Deprecated("Use settings instead") CygnusPullToRefreshOptions? options,
    CygnusPullToRefreshSettings? settings,
    this.onRefresh,
  }) : this.options = options ?? CygnusPullToRefreshOptions(),
       this.settings = settings ?? CygnusPullToRefreshSettings();

  ///{@template cygnus_core.CygnusPlatformPullToRefreshControllerCreationParams.options}
  /// Use [settings] instead.
  ///{@endtemplate}
  ///
  ///{@macro cygnus_core.CygnusPlatformPullToRefreshControllerCreationParams.options.supported_platforms}
  @SupportedPlatforms(platforms: [AndroidPlatform(), IOSPlatform()])
  @Deprecated("Use settings instead")
  late CygnusPullToRefreshOptions options;

  ///{@template cygnus_core.CygnusPlatformPullToRefreshControllerCreationParams.settings}
  /// Initial settings.
  ///{@endtemplate}
  ///
  ///{@macro cygnus_core.CygnusPlatformPullToRefreshControllerCreationParams.settings.supported_platforms}
  @SupportedPlatforms(platforms: [AndroidPlatform(), IOSPlatform()])
  late CygnusPullToRefreshSettings settings;

  ///{@template cygnus_core.CygnusPlatformPullToRefreshControllerCreationParams.onRefresh}
  ///Event called when a swipe gesture triggers a refresh.
  ///{@endtemplate}
  ///
  ///{@macro cygnus_core.CygnusPlatformPullToRefreshControllerCreationParams.onRefresh.supported_platforms}
  @SupportedPlatforms(platforms: [AndroidPlatform(), IOSPlatform()])
  final void Function()? onRefresh;

  ///{@template cygnus_core.CygnusPlatformPullToRefreshControllerCreationParams.isClassSupported}
  ///Check if the current class is supported by the [defaultTargetPlatform] or a specific [platform].
  ///{@endtemplate}
  bool isClassSupported({TargetPlatform? platform}) =>
      _CygnusPlatformPullToRefreshControllerCreationParamsClassSupported.isClassSupported(
        platform: platform,
      );

  ///{@template cygnus_core.CygnusPlatformPullToRefreshControllerCreationParams.isPropertySupported}
  ///Check if the given [property] is supported by the [defaultTargetPlatform] or a specific [platform].
  ///{@endtemplate}
  bool isPropertySupported(
    CygnusPlatformPullToRefreshControllerCreationParamsProperty property, {
    TargetPlatform? platform,
  }) =>
      _CygnusPlatformPullToRefreshControllerCreationParamsPropertySupported.isPropertySupported(
        property,
        platform: platform,
      );
}

///{@template cygnus_core.CygnusPlatformPullToRefreshController}
///A standard controller that can initiate the refreshing of a scroll view’s contents.
///This should be used whenever the user can refresh the contents of a WebView via a vertical swipe gesture.
///
///All the methods should be called only when the WebView has been created or is already running
///(for example [CygnusPlatformWebViewCreationParams.onWebViewCreated] or [CygnusPlatformBrowserEvents.onBrowserCreated]).
///{@endtemplate}
///
///{@macro cygnus_core.CygnusPlatformPullToRefreshController.supported_platforms}
@SupportedPlatforms(
  platforms: [
    AndroidPlatform(
      note:
          '**NOTE**: to be able to use the "pull-to-refresh" feature, [CygnusWebViewSettings.useHybridComposition] must be `true`.',
    ),
    IOSPlatform(),
  ],
)
abstract class CygnusPlatformPullToRefreshController extends PlatformInterface
    implements CygnusDisposable {
  ///Debug settings.
  static CygnusDebugLoggingSettings debugLoggingSettings = CygnusDebugLoggingSettings();

  /// Creates a new [CygnusPlatformPullToRefreshController]
  factory CygnusPlatformPullToRefreshController(
    CygnusPlatformPullToRefreshControllerCreationParams params,
  ) {
    assert(
      CygnusWebViewPlatform.instance != null,
      'A platform implementation for `cygnus` has not been set. Please '
      'ensure that an implementation of `CygnusWebViewPlatform` has been set to '
      '`CygnusWebViewPlatform.instance` before use. For unit testing, '
      '`CygnusWebViewPlatform.instance` can be set with your own test implementation.',
    );
    final CygnusPlatformPullToRefreshController webViewControllerDelegate =
        CygnusWebViewPlatform.instance!.createPlatformPullToRefreshController(
          params,
        );
    PlatformInterface.verify(webViewControllerDelegate, _token);
    return webViewControllerDelegate;
  }

  /// Creates a new empty [CygnusPlatformPullToRefreshController] to access static methods.
  factory CygnusPlatformPullToRefreshController.static() {
    assert(
      CygnusWebViewPlatform.instance != null,
      'A platform implementation for `cygnus` has not been set. Please '
      'ensure that an implementation of `cygnus` has been set to '
      '`CygnusWebViewPlatform.instance` before use. For unit testing, '
      '`CygnusWebViewPlatform.instance` can be set with your own test implementation.',
    );
    final CygnusPlatformPullToRefreshController controllerStatic =
        CygnusWebViewPlatform.instance!
            .createPlatformPullToRefreshControllerStatic();
    PlatformInterface.verify(controllerStatic, _token);
    return controllerStatic;
  }

  /// Used by the platform implementation to create a new [CygnusPlatformPullToRefreshController].
  ///
  /// Should only be used by platform implementations because they can't extend
  /// a class that only contains a factory constructor.
  @protected
  CygnusPlatformPullToRefreshController.implementation(this.params)
    : super(token: _token);

  static final Object _token = Object();

  /// The parameters used to initialize the [CygnusPlatformPullToRefreshController].
  final CygnusPlatformPullToRefreshControllerCreationParams params;

  ///{@macro cygnus_core.CygnusPlatformPullToRefreshControllerCreationParams.options}
  ///
  ///{@macro cygnus_core.CygnusPlatformPullToRefreshControllerCreationParams.options.supported_platforms}
  @Deprecated("Use settings instead")
  CygnusPullToRefreshOptions get options => params.options;

  ///{@macro cygnus_core.CygnusPlatformPullToRefreshControllerCreationParams.settings}
  ///
  ///{@macro cygnus_core.CygnusPlatformPullToRefreshControllerCreationParams.settings.supported_platforms}
  CygnusPullToRefreshSettings get settings => params.settings;

  ///{@macro cygnus_core.CygnusPlatformPullToRefreshControllerCreationParams.onRefresh}
  ///
  ///{@macro cygnus_core.CygnusPlatformPullToRefreshControllerCreationParams.onRefresh.supported_platforms}
  void Function()? get onRefresh => params.onRefresh;

  ///{@template cygnus_core.CygnusPlatformPullToRefreshController.setEnabled}
  ///Sets whether the pull-to-refresh feature is enabled or not.
  ///{@endtemplate}
  ///
  ///{@macro cygnus_core.CygnusPlatformPullToRefreshController.setEnabled.supported_platforms}
  @SupportedPlatforms(
    platforms: [
      AndroidPlatform(
        apiName: 'SwipeRefreshLayout.setEnabled',
        apiUrl:
            'https://developer.android.com/reference/androidx/swiperefreshlayout/widget/SwipeRefreshLayout#setEnabled(boolean)',
      ),
      IOSPlatform(
        apiName: 'UIScrollView.refreshControl',
        apiUrl:
            'https://developer.apple.com/documentation/uikit/uiscrollview/2127691-refreshcontrol',
      ),
    ],
  )
  Future<void> setEnabled(bool enabled) {
    throw UnimplementedError(
      'setEnabled is not implemented on the current platform',
    );
  }

  ///{@template cygnus_core.CygnusPlatformPullToRefreshController.isEnabled}
  ///Returns `true` is pull-to-refresh feature is enabled, otherwise `false`.
  ///{@endtemplate}
  ///
  ///{@macro cygnus_core.CygnusPlatformPullToRefreshController.isEnabled.supported_platforms}
  @SupportedPlatforms(
    platforms: [
      AndroidPlatform(
        apiName: 'View.isEnabled',
        apiUrl:
            'https://developer.android.com/reference/android/view/View#isEnabled()',
      ),
      IOSPlatform(
        apiName: 'UIScrollView.refreshControl',
        apiUrl:
            'https://developer.apple.com/documentation/uikit/uiscrollview/2127691-refreshcontrol',
      ),
    ],
  )
  Future<bool> isEnabled() {
    throw UnimplementedError(
      'isEnabled is not implemented on the current platform',
    );
  }

  ///{@template cygnus_core.CygnusPlatformPullToRefreshController.beginRefreshing}
  ///Tells the controller that a refresh operation was started programmatically.
  ///
  ///Call this method when an external event source triggers a programmatic refresh of your scrolling view.
  ///This method updates the state of the refresh control to reflect the in-progress refresh operation.
  ///When the refresh operation ends, be sure to call the [endRefreshing] method to return the controller to its default state.
  ///{@endtemplate}
  ///
  ///{@macro cygnus_core.CygnusPlatformPullToRefreshController.beginRefreshing.supported_platforms}
  @SupportedPlatforms(
    platforms: [
      AndroidPlatform(
        apiName: 'SwipeRefreshLayout.setRefreshing',
        apiUrl:
            'https://developer.android.com/reference/androidx/swiperefreshlayout/widget/SwipeRefreshLayout#setRefreshing(boolean)',
      ),
      IOSPlatform(
        apiName: 'UIRefreshControl.beginRefreshing',
        apiUrl:
            'https://developer.apple.com/documentation/uikit/uirefreshcontrol/1624842-beginrefreshing',
      ),
    ],
  )
  Future<void> beginRefreshing() {
    throw UnimplementedError(
      'beginRefreshing is not implemented on the current platform',
    );
  }

  ///{@template cygnus_core.CygnusPlatformPullToRefreshController.endRefreshing}
  ///Tells the controller that a refresh operation has ended.
  ///
  ///Call this method at the end of any refresh operation (whether it was initiated programmatically or by the user)
  ///to return the refresh control to its default state.
  ///If the refresh control is at least partially visible, calling this method also hides it.
  ///If animations are also enabled, the control is hidden using an animation.
  ///{@endtemplate}
  ///
  ///{@macro cygnus_core.CygnusPlatformPullToRefreshController.endRefreshing.supported_platforms}
  @SupportedPlatforms(
    platforms: [
      AndroidPlatform(
        apiName: 'SwipeRefreshLayout.setRefreshing',
        apiUrl:
            'https://developer.android.com/reference/androidx/swiperefreshlayout/widget/SwipeRefreshLayout#setRefreshing(boolean)',
      ),
      IOSPlatform(
        apiName: 'UIRefreshControl.endRefreshing',
        apiUrl:
            'https://developer.apple.com/documentation/uikit/uirefreshcontrol/1624846-endrefreshing',
      ),
    ],
  )
  Future<void> endRefreshing() {
    throw UnimplementedError(
      'endRefreshing is not implemented on the current platform',
    );
  }

  ///{@template cygnus_core.CygnusPlatformPullToRefreshController.isRefreshing}
  ///Returns whether a refresh operation has been triggered and is in progress.
  ///{@endtemplate}
  ///
  ///{@macro cygnus_core.CygnusPlatformPullToRefreshController.isRefreshing.supported_platforms}
  @SupportedPlatforms(
    platforms: [
      AndroidPlatform(
        apiName: 'SwipeRefreshLayout.isRefreshing',
        apiUrl:
            'https://developer.android.com/reference/androidx/swiperefreshlayout/widget/SwipeRefreshLayout#isRefreshing()',
      ),
      IOSPlatform(
        apiName: 'UIRefreshControl.isRefreshing',
        apiUrl:
            'https://developer.apple.com/documentation/uikit/uirefreshcontrol/1624844-isrefreshing',
      ),
    ],
  )
  Future<bool> isRefreshing() {
    throw UnimplementedError(
      'isRefreshing is not implemented on the current platform',
    );
  }

  ///{@template cygnus_core.CygnusPlatformPullToRefreshController.setColor}
  ///Sets the color of the refresh control.
  ///{@endtemplate}
  ///
  ///{@macro cygnus_core.CygnusPlatformPullToRefreshController.setColor.supported_platforms}
  @SupportedPlatforms(
    platforms: [
      AndroidPlatform(
        apiName: 'SwipeRefreshLayout.setColorSchemeColors',
        apiUrl:
            'https://developer.android.com/reference/androidx/swiperefreshlayout/widget/SwipeRefreshLayout#setColorSchemeColors(int...)',
      ),
      IOSPlatform(
        apiName: 'UIRefreshControl.tintColor',
        apiUrl:
            'https://developer.apple.com/documentation/uikit/uirefreshcontrol/1624847-tintcolor',
      ),
    ],
  )
  Future<void> setColor(Color color) {
    throw UnimplementedError(
      'setColor is not implemented on the current platform',
    );
  }

  ///{@template cygnus_core.CygnusPlatformPullToRefreshController.setBackgroundColor}
  ///Sets the background color of the refresh control.
  ///{@endtemplate}
  ///
  ///{@macro cygnus_core.CygnusPlatformPullToRefreshController.setBackgroundColor.supported_platforms}
  @SupportedPlatforms(
    platforms: [
      AndroidPlatform(
        apiName: 'SwipeRefreshLayout.setProgressBackgroundColorSchemeColor',
        apiUrl:
            'https://developer.android.com/reference/androidx/swiperefreshlayout/widget/SwipeRefreshLayout#setProgressBackgroundColorSchemeColor(int)',
      ),
      IOSPlatform(
        apiName: 'UIView.backgroundColor',
        apiUrl:
            'https://developer.apple.com/documentation/uikit/uiview/1622591-backgroundcolor',
      ),
    ],
  )
  Future<void> setBackgroundColor(Color color) {
    throw UnimplementedError(
      'setBackgroundColor is not implemented on the current platform',
    );
  }

  ///{@template cygnus_core.CygnusPlatformPullToRefreshController.setDistanceToTriggerSync}
  ///Set the distance to trigger a sync in dips.
  ///{@endtemplate}
  ///
  ///{@macro cygnus_core.CygnusPlatformPullToRefreshController.setDistanceToTriggerSync.supported_platforms}
  @SupportedPlatforms(
    platforms: [
      AndroidPlatform(
        apiName: 'SwipeRefreshLayout.setDistanceToTriggerSync',
        apiUrl:
            'https://developer.android.com/reference/androidx/swiperefreshlayout/widget/SwipeRefreshLayout#setDistanceToTriggerSync(int)',
      ),
    ],
  )
  Future<void> setDistanceToTriggerSync(int distanceToTriggerSync) {
    throw UnimplementedError(
      'setDistanceToTriggerSync is not implemented on the current platform',
    );
  }

  ///{@template cygnus_core.CygnusPlatformPullToRefreshController.setSlingshotDistance}
  ///Sets the distance that the refresh indicator can be pulled beyond its resting position during a swipe gesture.
  ///{@endtemplate}
  ///
  ///{@macro cygnus_core.CygnusPlatformPullToRefreshController.setSlingshotDistance.supported_platforms}
  @SupportedPlatforms(
    platforms: [
      AndroidPlatform(
        apiName: 'SwipeRefreshLayout.setSlingshotDistance',
        apiUrl:
            'https://developer.android.com/reference/androidx/swiperefreshlayout/widget/SwipeRefreshLayout#setSlingshotDistance(int)',
      ),
    ],
  )
  Future<void> setSlingshotDistance(int slingshotDistance) {
    throw UnimplementedError(
      'setSlingshotDistance is not implemented on the current platform',
    );
  }

  ///{@template cygnus_core.CygnusPlatformPullToRefreshController.getDefaultSlingshotDistance}
  ///Gets the default distance that the refresh indicator can be pulled beyond its resting position during a swipe gesture.
  ///{@endtemplate}
  ///
  ///{@macro cygnus_core.CygnusPlatformPullToRefreshController.getDefaultSlingshotDistance.supported_platforms}
  @SupportedPlatforms(
    platforms: [
      AndroidPlatform(
        apiName: 'SwipeRefreshLayout.DEFAULT_SLINGSHOT_DISTANCE',
        apiUrl:
            'https://developer.android.com/reference/androidx/swiperefreshlayout/widget/SwipeRefreshLayout#DEFAULT_SLINGSHOT_DISTANCE()',
      ),
    ],
  )
  Future<int> getDefaultSlingshotDistance() {
    throw UnimplementedError(
      'getDefaultSlingshotDistance is not implemented on the current platform',
    );
  }

  ///{@template cygnus_core.CygnusPlatformPullToRefreshController.setSize}
  ///Use [setIndicatorSize] instead.
  ///{@endtemplate}
  ///
  ///{@macro cygnus_core.CygnusPlatformPullToRefreshController.setSize.supported_platforms}
  @SupportedPlatforms(
    platforms: [
      AndroidPlatform(
        apiName: 'SwipeRefreshLayout.setSize',
        apiUrl:
            'https://developer.android.com/reference/androidx/swiperefreshlayout/widget/SwipeRefreshLayout#setSize(int)',
      ),
    ],
  )
  @Deprecated("Use setIndicatorSize instead")
  Future<void> setSize(CygnusAndroidPullToRefreshSize size) {
    throw UnimplementedError(
      'setSize is not implemented on the current platform',
    );
  }

  ///{@template cygnus_core.CygnusPlatformPullToRefreshController.setIndicatorSize}
  ///Sets the size of the refresh indicator. One of [CygnusPullToRefreshSize.DEFAULT], or [CygnusPullToRefreshSize.LARGE].
  ///{@endtemplate}
  ///
  ///{@macro cygnus_core.CygnusPlatformPullToRefreshController.setIndicatorSize.supported_platforms}
  @SupportedPlatforms(
    platforms: [
      AndroidPlatform(
        apiName: 'SwipeRefreshLayout.setSize',
        apiUrl:
            'https://developer.android.com/reference/androidx/swiperefreshlayout/widget/SwipeRefreshLayout#setSize(int)',
      ),
    ],
  )
  Future<void> setIndicatorSize(CygnusPullToRefreshSize size) {
    throw UnimplementedError(
      'setIndicatorSize is not implemented on the current platform',
    );
  }

  ///{@template cygnus_core.CygnusPlatformPullToRefreshController.setAttributedTitle}
  ///Use [setStyledTitle] instead.
  ///{@endtemplate}
  ///
  ///{@macro cygnus_core.CygnusPlatformPullToRefreshController.setAttributedTitle.supported_platforms}
  @SupportedPlatforms(
    platforms: [
      IOSPlatform(
        apiName: 'UIRefreshControl.attributedTitle',
        apiUrl:
            'https://developer.apple.com/documentation/uikit/uirefreshcontrol/1624845-attributedtitle',
      ),
    ],
  )
  @Deprecated("Use setStyledTitle instead")
  Future<void> setAttributedTitle(CygnusIOSNSAttributedString attributedTitle) {
    throw UnimplementedError(
      'setAttributedTitle is not implemented on the current platform',
    );
  }

  ///{@template cygnus_core.CygnusPlatformPullToRefreshController.setStyledTitle}
  ///Sets the styled title text to display in the refresh control.
  ///{@endtemplate}
  ///
  ///{@macro cygnus_core.CygnusPlatformPullToRefreshController.setStyledTitle.supported_platforms}
  @SupportedPlatforms(
    platforms: [
      IOSPlatform(
        apiName: 'UIRefreshControl.attributedTitle',
        apiUrl:
            'https://developer.apple.com/documentation/uikit/uirefreshcontrol/1624845-attributedtitle',
      ),
    ],
  )
  Future<void> setStyledTitle(CygnusAttributedString attributedTitle) {
    throw UnimplementedError(
      'setStyledTitle is not implemented on the current platform',
    );
  }

  ///{@template cygnus_core.CygnusPlatformPullToRefreshController.dispose}
  ///Disposes the controller.
  ///{@endtemplate}
  ///
  ///{@macro cygnus_core.CygnusPlatformPullToRefreshController.dispose.supported_platforms}
  @SupportedPlatforms(platforms: [AndroidPlatform(), IOSPlatform()])
  @override
  void dispose({bool isKeepAlive = false}) {
    throw UnimplementedError(
      'dispose is not implemented on the current platform',
    );
  }

  ///{@macro cygnus_core.CygnusPlatformPullToRefreshControllerCreationParams.isClassSupported}
  bool isClassSupported({TargetPlatform? platform}) =>
      _CygnusPlatformPullToRefreshControllerClassSupported.isClassSupported(
        platform: platform,
      );

  ///{@template cygnus_core.CygnusPlatformPullToRefreshController.isPropertySupported}
  ///Check if the given [property] is supported by the [defaultTargetPlatform] or a specific [platform].
  ///{@endtemplate}
  bool isPropertySupported(
    CygnusPlatformPullToRefreshControllerCreationParamsProperty property, {
    TargetPlatform? platform,
  }) => params.isPropertySupported(property, platform: platform);

  ///{@template cygnus_core.CygnusPlatformPullToRefreshController.isMethodSupported}
  ///Check if the given [method] is supported by the [defaultTargetPlatform] or a specific [platform].
  ///{@endtemplate}
  bool isMethodSupported(
    CygnusPlatformPullToRefreshControllerMethod method, {
    TargetPlatform? platform,
  }) => _CygnusPlatformPullToRefreshControllerMethodSupported.isMethodSupported(
    method,
    platform: platform,
  );
}
