import 'package:flutter/foundation.dart';
import 'package:flutter_inappwebview_internal_annotations/flutter_inappwebview_internal_annotations.dart';
import 'package:cygnus_core/src/platform_interface/src/types/disposable.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';
import '../webview/webview_settings.dart';
import '../debug_logging_settings.dart';
import '../webview_platform.dart';
import '../types/main.dart';

part 'platform_find_interaction_controller.g.dart';

///{@template cygnus_core.CygnusPlatformFindInteractionControllerCreationParams}
/// Object specifying creation parameters for creating a [CygnusPlatformFindInteractionController].
///
/// Platform specific implementations can add additional fields by extending
/// this class.
///{@endtemplate}
///
///{@macro cygnus_core.CygnusPlatformFindInteractionControllerCreationParams.supported_platforms}
@SupportedPlatforms(
  platforms: [
    AndroidPlatform(),
    IOSPlatform(),
    MacOSPlatform(),
    LinuxPlatform(),
    WindowsPlatform(),
  ],
)
@immutable
class CygnusPlatformFindInteractionControllerCreationParams {
  /// Used by the platform implementation to create a new [CygnusPlatformFindInteractionController].
  const CygnusPlatformFindInteractionControllerCreationParams({
    this.onFindResultReceived,
  });

  ///{@template cygnus_core.CygnusPlatformFindInteractionControllerCreationParams.onFindResultReceived}
  ///Event fired as find-on-page operations progress.
  ///The listener may be notified multiple times while the operation is underway, and the [numberOfMatches] value should not be considered final unless [isDoneCounting] is true.
  ///
  ///[activeMatchOrdinal] represents the zero-based ordinal of the currently selected match.
  ///
  ///[numberOfMatches] represents how many matches have been found.
  ///
  ///[isDoneCounting] whether the find operation has actually completed.
  ///{@endtemplate}
  ///
  ///{@macro cygnus_core.CygnusPlatformFindInteractionControllerCreationParams.onFindResultReceived.supported_platforms}
  @SupportedPlatforms(
    platforms: [
      AndroidPlatform(
        apiName: 'WebView.FindListener.onFindResultReceived',
        apiUrl:
            'https://developer.android.com/reference/android/webkit/WebView.FindListener#onFindResultReceived(int,%20int,%20boolean)',
      ),
      IOSPlatform(
        note:
            'If [CygnusWebViewSettings.isFindInteractionEnabled] is `true`, this event will not be called.',
      ),
      MacOSPlatform(),
      LinuxPlatform(
        apiName: 'WebKitFindController::counted-matches',
        apiUrl:
            'https://wpewebkit.org/reference/stable/wpe-webkit-2.0/signal.FindController.counted-matches.html',
      ),
      WindowsPlatform(
        apiName: 'ICoreWebView2Find.ActiveMatchIndexChanged/MatchCountChanged',
        apiUrl:
            'https://learn.microsoft.com/en-us/microsoft-edge/webview2/reference/win32/icorewebview2find',
      ),
    ],
  )
  final void Function(
    CygnusPlatformFindInteractionController controller,
    int activeMatchOrdinal,
    int numberOfMatches,
    bool isDoneCounting,
  )?
  onFindResultReceived;

  ///{@template cygnus_core.CygnusPlatformFindInteractionControllerCreationParams.isClassSupported}
  ///Check if the current class is supported by the [defaultTargetPlatform] or a specific [platform].
  ///{@endtemplate}
  bool isClassSupported({TargetPlatform? platform}) =>
      _CygnusPlatformFindInteractionControllerCreationParamsClassSupported.isClassSupported(
        platform: platform,
      );

  ///{@template cygnus_core.CygnusPlatformFindInteractionControllerCreationParams.isPropertySupported}
  ///Check if the given [property] is supported by the [defaultTargetPlatform] or a specific [platform].
  ///{@endtemplate}
  bool isPropertySupported(
    CygnusPlatformFindInteractionControllerCreationParamsProperty property, {
    TargetPlatform? platform,
  }) =>
      _CygnusPlatformFindInteractionControllerCreationParamsPropertySupported.isPropertySupported(
        property,
        platform: platform,
      );
}

///{@template cygnus_core.CygnusPlatformFindInteractionController}
///This class represents the controller used by the `WebView` to add
///text-finding capabilities, such as the "Find on page" feature.
///{@endtemplate}
///
///{@macro cygnus_core.CygnusPlatformFindInteractionController.supported_platforms}
@SupportedPlatforms(
  platforms: [
    AndroidPlatform(),
    IOSPlatform(),
    MacOSPlatform(),
    LinuxPlatform(),
    WindowsPlatform(),
  ],
)
abstract class CygnusPlatformFindInteractionController extends PlatformInterface
    implements CygnusDisposable {
  ///Debug settings.
  static CygnusDebugLoggingSettings debugLoggingSettings = CygnusDebugLoggingSettings();

  /// Creates a new [CygnusPlatformFindInteractionController]
  factory CygnusPlatformFindInteractionController(
    CygnusPlatformFindInteractionControllerCreationParams params,
  ) {
    assert(
      CygnusWebViewPlatform.instance != null,
      'A platform implementation for `cygnus` has not been set. Please '
      'ensure that an implementation of `CygnusWebViewPlatform` has been set to '
      '`CygnusWebViewPlatform.instance` before use. For unit testing, '
      '`CygnusWebViewPlatform.instance` can be set with your own test implementation.',
    );
    final CygnusPlatformFindInteractionController webViewControllerDelegate =
        CygnusWebViewPlatform.instance!.createPlatformFindInteractionController(
          params,
        );
    PlatformInterface.verify(webViewControllerDelegate, _token);
    return webViewControllerDelegate;
  }

  /// Creates a new [CygnusPlatformFindInteractionController]
  factory CygnusPlatformFindInteractionController.static() {
    assert(
      CygnusWebViewPlatform.instance != null,
      'A platform implementation for `cygnus` has not been set. Please '
      'ensure that an implementation of `CygnusWebViewPlatform` has been set to '
      '`WebViewPlatform.instance` before use. For unit testing, '
      '`WebViewPlatform.instance` can be set with your own test implementation.',
    );
    final CygnusPlatformFindInteractionController findInteractionControllerStatic =
        CygnusWebViewPlatform.instance!
            .createPlatformFindInteractionControllerStatic();
    PlatformInterface.verify(findInteractionControllerStatic, _token);
    return findInteractionControllerStatic;
  }

  /// Used by the platform implementation to create a new [CygnusPlatformFindInteractionController].
  ///
  /// Should only be used by platform implementations because they can't extend
  /// a class that only contains a factory constructor.
  @protected
  CygnusPlatformFindInteractionController.implementation(this.params)
    : super(token: _token);

  static final Object _token = Object();

  /// The parameters used to initialize the [CygnusPlatformFindInteractionController].
  final CygnusPlatformFindInteractionControllerCreationParams params;

  ///{@macro cygnus_core.CygnusPlatformFindInteractionControllerCreationParams.onFindResultReceived}
  ///
  ///{@macro cygnus_core.CygnusPlatformFindInteractionControllerCreationParams.onFindResultReceived.supported_platforms}
  void Function(
    CygnusPlatformFindInteractionController controller,
    int activeMatchOrdinal,
    int numberOfMatches,
    bool isDoneCounting,
  )?
  get onFindResultReceived => params.onFindResultReceived;

  ///{@template cygnus_core.CygnusPlatformFindInteractionController.findAll}
  ///Finds all instances of find on the page and highlights them. Notifies [CygnusPlatformFindInteractionController.onFindResultReceived] listener.
  ///
  ///[find] represents the string to find.
  ///{@endtemplate}
  ///
  ///{@macro cygnus_core.CygnusPlatformFindInteractionController.findAll.supported_platforms}
  @SupportedPlatforms(
    platforms: [
      AndroidPlatform(
        apiName: 'WebView.findAllAsync',
        apiUrl:
            'https://developer.android.com/reference/android/webkit/WebView#findAllAsync(java.lang.String)',
        note:
            'It finds all instances asynchronously. Successive calls to this will cancel any pending searches.',
      ),
      IOSPlatform(
        note:
            'If [CygnusWebViewSettings.isFindInteractionEnabled] is `true`, it uses the built-in find interaction native UI, otherwise this is implemented using CSS and Javascript. In this case, it will use the [Official API - UIFindInteraction.presentFindNavigator](https://developer.apple.com/documentation/uikit/uifindinteraction/3975832-presentfindnavigator?changes=_2) with [Official API - UIFindInteraction.searchText](https://developer.apple.com/documentation/uikit/uifindinteraction/3975834-searchtext?changes=_2)',
      ),
      MacOSPlatform(),
      LinuxPlatform(
        apiName: 'webkit_find_controller_search',
        apiUrl:
            'https://wpewebkit.org/reference/stable/wpe-webkit-2.0/method.FindController.search.html',
      ),
      WindowsPlatform(
        apiName: 'ICoreWebView2Find.Start',
        apiUrl:
            'https://learn.microsoft.com/en-us/microsoft-edge/webview2/reference/win32/icorewebview2find#start',
      ),
    ],
  )
  Future<void> findAll({String? find}) {
    throw UnimplementedError(
      'findAll is not implemented on the current platform',
    );
  }

  ///{@template cygnus_core.CygnusPlatformFindInteractionController.setFindOptions}
  ///Sets the options used for find-on-page operations.
  ///{@endtemplate}
  ///
  ///{@macro cygnus_core.CygnusPlatformFindInteractionController.setFindOptions.supported_platforms}
  @SupportedPlatforms(
    platforms: [
      WindowsPlatform(
        apiName: 'ICoreWebView2Environment15.CreateFindOptions',
        apiUrl:
            'https://learn.microsoft.com/en-us/microsoft-edge/webview2/reference/win32/icorewebview2environment15?view=webview2-1.0.2849.39#createfindoptions',
      ),
    ],
  )
  Future<void> setFindOptions({CygnusFindOptions? options}) {
    throw UnimplementedError(
      'setFindOptions is not implemented on the current platform',
    );
  }

  ///{@template cygnus_core.CygnusPlatformFindInteractionController.findNext}
  ///Highlights and scrolls to the next match found by [findAll]. Notifies [CygnusPlatformFindInteractionController.onFindResultReceived] listener.
  ///
  ///[forward] represents the direction to search. The default value is `true`, meaning forward.
  ///{@endtemplate}
  ///
  ///{@macro cygnus_core.CygnusPlatformFindInteractionController.findNext.supported_platforms}
  @SupportedPlatforms(
    platforms: [
      AndroidPlatform(
        apiName: 'WebView.findNext',
        apiUrl:
            'https://developer.android.com/reference/android/webkit/WebView#findNext(boolean)',
      ),
      IOSPlatform(
        note:
            'If [CygnusWebViewSettings.isFindInteractionEnabled] is `true`, it uses the built-in find interaction native UI, otherwise this is implemented using CSS and Javascript. In this case, it will use the [Official API - UIFindInteraction.findNext](https://developer.apple.com/documentation/uikit/uifindinteraction/3975829-findnext?changes=_2) and ([Official API - UIFindInteraction.findPrevious](https://developer.apple.com/documentation/uikit/uifindinteraction/3975830-findprevious?changes=_2)',
      ),
      MacOSPlatform(),
      LinuxPlatform(
        apiName: 'webkit_find_controller_search_next',
        apiUrl:
            'https://wpewebkit.org/reference/stable/wpe-webkit-2.0/method.FindController.search_next.html',
      ),
      WindowsPlatform(
        apiName: 'ICoreWebView2Find.FindNext/FindPrevious',
        apiUrl:
            'https://learn.microsoft.com/en-us/microsoft-edge/webview2/reference/win32/icorewebview2find#findnext',
      ),
    ],
  )
  Future<void> findNext({bool forward = true}) {
    throw UnimplementedError(
      'findNext is not implemented on the current platform',
    );
  }

  ///{@template cygnus_core.CygnusPlatformFindInteractionController.clearMatches}
  ///Clears the highlighting surrounding text matches created by [findAll].
  ///{@endtemplate}
  ///
  ///{@macro cygnus_core.CygnusPlatformFindInteractionController.clearMatches.supported_platforms}
  @SupportedPlatforms(
    platforms: [
      AndroidPlatform(
        apiName: 'WebView.clearMatches',
        apiUrl:
            'https://developer.android.com/reference/android/webkit/WebView#clearMatches()',
      ),
      IOSPlatform(
        note:
            'If [CygnusWebViewSettings.isFindInteractionEnabled] is `true`, it uses the built-in find interaction native UI, otherwise this is implemented using CSS and Javascript. In this case, it will use the [Official API - UIFindInteraction.dismissFindNavigator](https://developer.apple.com/documentation/uikit/uifindinteraction/3975827-dismissfindnavigator?changes=_2)',
      ),
      MacOSPlatform(),
      LinuxPlatform(
        apiName: 'webkit_find_controller_search_finish',
        apiUrl:
            'https://wpewebkit.org/reference/stable/wpe-webkit-2.0/method.FindController.search_finish.html',
      ),
      WindowsPlatform(
        apiName: 'ICoreWebView2Find.Stop',
        apiUrl:
            'https://learn.microsoft.com/en-us/microsoft-edge/webview2/reference/win32/icorewebview2find#stop',
      ),
    ],
  )
  Future<void> clearMatches() {
    throw UnimplementedError(
      'clearMatches is not implemented on the current platform',
    );
  }

  ///{@template cygnus_core.CygnusPlatformFindInteractionController.setSearchText}
  ///Pre-populate the search text to be used.
  ///{@endtemplate}
  ///
  ///{@macro cygnus_core.CygnusPlatformFindInteractionController.setSearchText.supported_platforms}
  @SupportedPlatforms(
    platforms: [
      AndroidPlatform(),
      IOSPlatform(
        apiName: 'UIFindInteraction.searchText',
        apiUrl:
            'https://developer.apple.com/documentation/uikit/uifindinteraction/3975834-searchtext?changes=_2',
        note:
            'If [CygnusWebViewSettings.isFindInteractionEnabled] is `true`, it will pre-populate the system find panel\'s search text field with a search query.',
      ),
      MacOSPlatform(),
      LinuxPlatform(
        apiName: 'webkit_find_controller_search',
        apiUrl:
            'https://wpewebkit.org/reference/stable/wpe-webkit-2.0/method.FindController.search.html',
      ),
      WindowsPlatform(
        apiName: 'ICoreWebView2FindOptions.put_FindTerm',
        apiUrl:
            'https://learn.microsoft.com/en-us/microsoft-edge/webview2/reference/win32/icorewebview2findoptions',
      ),
    ],
  )
  Future<void> setSearchText(String? searchText) {
    throw UnimplementedError(
      'setSearchText is not implemented on the current platform',
    );
  }

  ///{@template cygnus_core.CygnusPlatformFindInteractionController.getSearchText}
  ///Get the search text used.
  ///{@endtemplate}
  ///
  ///{@macro cygnus_core.CygnusPlatformFindInteractionController.getSearchText.supported_platforms}
  @SupportedPlatforms(
    platforms: [
      AndroidPlatform(),
      IOSPlatform(
        apiName: 'UIFindInteraction.getSearchText',
        apiUrl:
            'https://developer.apple.com/documentation/uikit/uifindinteraction/3975834-searchtext?changes=_2',
        note:
            'If [CygnusWebViewSettings.isFindInteractionEnabled] is `true`, it will get the system find panel\'s search text field value.',
      ),
      MacOSPlatform(),
      LinuxPlatform(
        apiName: 'webkit_find_controller_get_search_text',
        apiUrl:
            'https://wpewebkit.org/reference/stable/wpe-webkit-2.0/method.FindController.get_search_text.html',
      ),
      WindowsPlatform(),
    ],
  )
  Future<String?> getSearchText() {
    throw UnimplementedError(
      'getSearchText is not implemented on the current platform',
    );
  }

  ///{@template cygnus_core.CygnusPlatformFindInteractionController.isFindNavigatorVisible}
  ///A Boolean value that indicates when the find panel displays onscreen.
  ///{@endtemplate}
  ///
  ///{@macro cygnus_core.CygnusPlatformFindInteractionController.isFindNavigatorVisible.supported_platforms}
  @SupportedPlatforms(
    platforms: [
      IOSPlatform(
        apiName: 'UIFindInteraction.isFindNavigatorVisible',
        apiUrl:
            'https://developer.apple.com/documentation/uikit/uifindinteraction/3975828-isfindnavigatorvisible?changes=_2',
        note:
            'Available only if [CygnusWebViewSettings.isFindInteractionEnabled] is `true`.',
      ),
    ],
  )
  Future<bool?> isFindNavigatorVisible() {
    throw UnimplementedError(
      'isFindNavigatorVisible is not implemented on the current platform',
    );
  }

  ///{@template cygnus_core.CygnusPlatformFindInteractionController.updateResultCount}
  ///Updates the results the interface displays for the active search.
  ///{@endtemplate}
  ///
  ///{@macro cygnus_core.CygnusPlatformFindInteractionController.updateResultCount.supported_platforms}
  @SupportedPlatforms(
    platforms: [
      IOSPlatform(
        apiName: 'UIFindInteraction.updateResultCount',
        apiUrl:
            'https://developer.apple.com/documentation/uikit/uifindinteraction/3975835-updateresultcount?changes=_2',
        note:
            'Available only if [CygnusWebViewSettings.isFindInteractionEnabled] is `true`.',
      ),
    ],
  )
  Future<void> updateResultCount() {
    throw UnimplementedError(
      'updateResultCount is not implemented on the current platform',
    );
  }

  ///{@template cygnus_core.CygnusPlatformFindInteractionController.presentFindNavigator}
  ///Begins a search, displaying the find panel.
  ///{@endtemplate}
  ///
  ///{@macro cygnus_core.CygnusPlatformFindInteractionController.presentFindNavigator.supported_platforms}
  @SupportedPlatforms(
    platforms: [
      IOSPlatform(
        apiName: 'UIFindInteraction.presentFindNavigator',
        apiUrl:
            'https://developer.apple.com/documentation/uikit/uifindinteraction/3975832-presentfindnavigator?changes=_2',
        note:
            'Available only if [CygnusWebViewSettings.isFindInteractionEnabled] is `true`.',
      ),
    ],
  )
  Future<void> presentFindNavigator() {
    throw UnimplementedError(
      'presentFindNavigator is not implemented on the current platform',
    );
  }

  ///{@template cygnus_core.CygnusPlatformFindInteractionController.dismissFindNavigator}
  ///Dismisses the find panel, if present.
  ///{@endtemplate}
  ///
  ///{@macro cygnus_core.CygnusPlatformFindInteractionController.dismissFindNavigator.supported_platforms}
  @SupportedPlatforms(
    platforms: [
      IOSPlatform(
        apiName: 'UIFindInteraction.dismissFindNavigator',
        apiUrl:
            'https://developer.apple.com/documentation/uikit/uifindinteraction/3975827-dismissfindnavigator?changes=_2',
        note:
            'Available only if [CygnusWebViewSettings.isFindInteractionEnabled] is `true`.',
      ),
    ],
  )
  Future<void> dismissFindNavigator() {
    throw UnimplementedError(
      'dismissFindNavigator is not implemented on the current platform',
    );
  }

  ///{@template cygnus_core.CygnusPlatformFindInteractionController.getActiveFindSession}
  ///If there's a currently active find session, returns the active find session.
  ///{@endtemplate}
  ///
  ///{@macro cygnus_core.CygnusPlatformFindInteractionController.getActiveFindSession.supported_platforms}
  @SupportedPlatforms(
    platforms: [
      AndroidPlatform(),
      IOSPlatform(
        apiName: 'UIFindInteraction.activeFindSession',
        apiUrl:
            'https://developer.apple.com/documentation/uikit/uifindinteraction/3975825-activefindsession?changes=_7____4_8&language=objc',
      ),
      MacOSPlatform(),
      LinuxPlatform(
        apiName: 'WebKitFindController',
        apiUrl:
            'https://wpewebkit.org/reference/stable/wpe-webkit-2.0/class.FindController.html',
      ),
      WindowsPlatform(
        apiName: 'ICoreWebView2Find',
        apiUrl:
            'https://learn.microsoft.com/en-us/microsoft-edge/webview2/reference/win32/icorewebview2find',
      ),
    ],
  )
  Future<CygnusFindSession?> getActiveFindSession() {
    throw UnimplementedError(
      'getActiveFindSession is not implemented on the current platform',
    );
  }

  ///{@template cygnus_core.CygnusPlatformFindInteractionController.dispose}
  ///Disposes the controller.
  ///{@endtemplate}
  ///
  ///{@macro cygnus_core.CygnusPlatformFindInteractionController.dispose.supported_platforms}
  @SupportedPlatforms(
    platforms: [
      AndroidPlatform(),
      IOSPlatform(),
      MacOSPlatform(),
      LinuxPlatform(),
      WindowsPlatform(),
    ],
  )
  @override
  void dispose({bool isKeepAlive = false}) {
    throw UnimplementedError(
      'dispose is not implemented on the current platform',
    );
  }

  ///{@macro cygnus_core.CygnusPlatformFindInteractionControllerCreationParams.isClassSupported}
  bool isClassSupported({TargetPlatform? platform}) =>
      params.isClassSupported(platform: platform);

  ///{@macro cygnus_core.CygnusPlatformFindInteractionControllerCreationParams.isPropertySupported}
  bool isPropertySupported(
    CygnusPlatformFindInteractionControllerCreationParamsProperty property, {
    TargetPlatform? platform,
  }) => params.isPropertySupported(property, platform: platform);

  ///{@template cygnus_core.CygnusPlatformFindInteractionController.isMethodSupported}
  ///Check if the given [method] is supported by the [defaultTargetPlatform] or a specific [platform].
  ///{@endtemplate}
  bool isMethodSupported(
    CygnusPlatformFindInteractionControllerMethod method, {
    TargetPlatform? platform,
  }) => _CygnusPlatformFindInteractionControllerMethodSupported.isMethodSupported(
    method,
    platform: platform,
  );
}
