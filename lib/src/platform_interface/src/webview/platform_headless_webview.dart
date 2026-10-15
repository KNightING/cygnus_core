import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:cygnus_core_internal_annotations/cygnus_core_internal_annotations.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import '../webview_platform.dart';
import '../types/disposable.dart';
import '../webview_environment/platform_webview_environment.dart';
import 'platform_webview_controller.dart';
import 'platform_webview.dart';

part 'platform_headless_webview.g.dart';

///{@template cygnus_core.CygnusPlatformHeadlessWebViewCreationParams}
///Object specifying creation parameters for creating a [CygnusPlatformWebViewWidget].
///
///Platform specific implementations can add additional fields by extending
///this class.
///{@endtemplate}
///
///{@macro cygnus_core.CygnusPlatformHeadlessWebViewCreationParams.supported_platforms}
@SupportedPlatforms(
  platforms: [
    AndroidPlatform(),
    IOSPlatform(),
    MacOSPlatform(),
    WebPlatform(requiresSameOrigin: false),
    WindowsPlatform(),
    LinuxPlatform(),
  ],
)
class CygnusPlatformHeadlessWebViewCreationParams
    extends CygnusPlatformWebViewCreationParams {
  ///{@macro cygnus_core.CygnusPlatformHeadlessWebViewCreationParams}
  ///
  ///{@macro cygnus_core.CygnusPlatformHeadlessWebViewCreationParams.supported_platforms}
  const CygnusPlatformHeadlessWebViewCreationParams({
    this.initialSize = const Size(-1, -1),
    this.webViewEnvironment,
    super.controllerFromPlatform,
    super.windowId,
    super.onWebViewCreated,
    super.onLoadStart,
    super.onLoadStop,
    super.onContentLoading,
    super.onDOMContentLoaded,
    @Deprecated('Use onReceivedError instead') super.onLoadError,
    super.onReceivedError,
    @Deprecated("Use onReceivedHttpError instead") super.onLoadHttpError,
    super.onReceivedHttpError,
    super.onProgressChanged,
    super.onConsoleMessage,
    super.shouldOverrideUrlLoading,
    super.onLaunchingExternalUriScheme,
    super.onLoadResource,
    super.onScrollChanged,
    @Deprecated('Use onDownloadStarting instead') super.onDownloadStart,
    @Deprecated('Use onDownloadStarting instead') super.onDownloadStartRequest,
    super.onDownloadStarting,
    @Deprecated('Use onLoadResourceWithCustomScheme instead')
    super.onLoadResourceCustomScheme,
    super.onLoadResourceWithCustomScheme,
    super.onCreateWindow,
    super.onCloseWindow,
    super.onJsAlert,
    super.onJsConfirm,
    super.onJsPrompt,
    super.onReceivedHttpAuthRequest,
    super.onReceivedServerTrustAuthRequest,
    super.onReceivedClientCertRequest,
    @Deprecated('Use CygnusFindInteractionController.onFindResultReceived instead')
    super.onFindResultReceived,
    super.shouldInterceptAjaxRequest,
    super.onAjaxReadyStateChange,
    super.onAjaxProgress,
    super.shouldInterceptFetchRequest,
    super.onUpdateVisitedHistory,
    @Deprecated("Use onPrintRequest instead") super.onPrint,
    super.onPrintRequest,
    super.onLongPressHitTestResult,
    super.onEnterFullscreen,
    super.onExitFullscreen,
    super.onPageCommitVisible,
    super.onTitleChanged,
    super.onWindowFocus,
    super.onWindowBlur,
    super.onOverScrolled,
    super.onZoomScaleChanged,
    @Deprecated('Use onSafeBrowsingHit instead') super.androidOnSafeBrowsingHit,
    super.onSafeBrowsingHit,
    @Deprecated('Use onPermissionRequest instead')
    super.androidOnPermissionRequest,
    super.onPermissionRequest,
    @Deprecated('Use onGeolocationPermissionsShowPrompt instead')
    super.androidOnGeolocationPermissionsShowPrompt,
    super.onGeolocationPermissionsShowPrompt,
    @Deprecated('Use onGeolocationPermissionsHidePrompt instead')
    super.androidOnGeolocationPermissionsHidePrompt,
    super.onGeolocationPermissionsHidePrompt,
    @Deprecated('Use shouldInterceptRequest instead')
    super.androidShouldInterceptRequest,
    super.shouldInterceptRequest,
    @Deprecated('Use onRenderProcessGone instead')
    super.androidOnRenderProcessGone,
    super.onRenderProcessGone,
    @Deprecated('Use onRenderProcessResponsive instead')
    super.androidOnRenderProcessResponsive,
    super.onRenderProcessResponsive,
    @Deprecated('Use onRenderProcessUnresponsive instead')
    super.androidOnRenderProcessUnresponsive,
    super.onRenderProcessUnresponsive,
    @Deprecated('Use onFormResubmission instead')
    super.androidOnFormResubmission,
    super.onFormResubmission,
    @Deprecated('Use onZoomScaleChanged instead') super.androidOnScaleChanged,
    @Deprecated('Use onReceivedIcon instead') super.androidOnReceivedIcon,
    @Deprecated('Use onFaviconChanged instead') super.onReceivedIcon,
    super.onFaviconChanged,
    @Deprecated('Use onReceivedTouchIconUrl instead')
    super.androidOnReceivedTouchIconUrl,
    super.onReceivedTouchIconUrl,
    @Deprecated('Use onJsBeforeUnload instead') super.androidOnJsBeforeUnload,
    super.onJsBeforeUnload,
    @Deprecated('Use onReceivedLoginRequest instead')
    super.androidOnReceivedLoginRequest,
    super.onReceivedLoginRequest,
    super.onPermissionRequestCanceled,
    super.onRequestFocus,
    @Deprecated('Use onWebContentProcessDidTerminate instead')
    super.iosOnWebContentProcessDidTerminate,
    super.onWebContentProcessDidTerminate,
    @Deprecated(
      'Use onDidReceiveServerRedirectForProvisionalNavigation instead',
    )
    super.iosOnDidReceiveServerRedirectForProvisionalNavigation,
    super.onDidReceiveServerRedirectForProvisionalNavigation,
    @Deprecated('Use onNavigationResponse instead')
    super.iosOnNavigationResponse,
    super.onNavigationResponse,
    @Deprecated('Use shouldAllowDeprecatedTLS instead')
    super.iosShouldAllowDeprecatedTLS,
    super.shouldAllowDeprecatedTLS,
    super.onCameraCaptureStateChanged,
    super.onMicrophoneCaptureStateChanged,
    super.onContentSizeChanged,
    super.onProcessFailed,
    super.onNotificationReceived,
    super.onSaveAsUIShowing,
    super.onSaveFileSecurityCheckStarting,
    super.onScreenCaptureStarting,
    super.onAcceleratorKeyPressed,
    super.onShowFileChooser,
    super.initialUrlRequest,
    super.initialFile,
    super.initialData,
    @Deprecated('Use initialSettings instead') super.initialOptions,
    super.initialSettings,
    super.contextMenu,
    super.initialUserScripts,
    super.pullToRefreshController,
    super.findInteractionController,
  });

  ///{@template cygnus_core.CygnusPlatformHeadlessWebViewCreationParams.initialSize}
  ///The WebView initial size in pixels.
  ///
  ///Set `-1` to match the corresponding width or height of the current device screen size.
  ///`Size(-1, -1)` will match both width and height of the current device screen size.
  ///{@endtemplate}
  ///
  ///{@macro cygnus_core.CygnusPlatformHeadlessWebViewCreationParams.initialSize.supported_platforms}
  @SupportedPlatforms(
    platforms: [
      AndroidPlatform(
        note:
            '`Size` width and height values will be converted to `int` values because they cannot have `double` values.',
      ),
      IOSPlatform(),
      MacOSPlatform(),
      WebPlatform(requiresSameOrigin: false),
      WindowsPlatform(),
      LinuxPlatform(),
    ],
  )
  final Size initialSize;

  ///{@template cygnus_core.CygnusPlatformHeadlessWebViewCreationParams.webViewEnvironment}
  ///Used to create the [CygnusPlatformHeadlessWebView] using the specified environment.
  ///{@endtemplate}
  ///
  ///{@macro cygnus_core.CygnusPlatformHeadlessWebViewCreationParams.webViewEnvironment.supported_platforms}
  @SupportedPlatforms(
    platforms: [
      WindowsPlatform(),
      LinuxPlatform(
        apiName: 'WebKitWebContext',
        apiUrl:
            'https://wpewebkit.org/reference/stable/wpe-webkit-2.0/class.WebContext.html',
      ),
    ],
  )
  final CygnusPlatformWebViewEnvironment? webViewEnvironment;

  ///{@template cygnus_core.CygnusPlatformHeadlessWebViewCreationParams.isClassSupported}
  ///Check if the current class is supported by the [defaultTargetPlatform] or a specific [platform].
  ///{@endtemplate}
  @override
  bool isClassSupported({TargetPlatform? platform}) =>
      _CygnusPlatformHeadlessWebViewCreationParamsClassSupported.isClassSupported(
        platform: platform,
      );

  ///{@template cygnus_core.CygnusPlatformHeadlessWebViewCreationParams.isPropertySupported}
  ///Check if the given [property] is supported by the [defaultTargetPlatform] or a specific [platform].
  ///The property should be one of the [CygnusPlatformWebViewCreationParamsProperty] or [CygnusPlatformHeadlessWebViewCreationParamsProperty] values.
  ///{@endtemplate}
  @override
  bool isPropertySupported(dynamic property, {TargetPlatform? platform}) =>
      property is CygnusPlatformWebViewCreationParamsProperty
      ? super.isPropertySupported(property, platform: platform)
      : _CygnusPlatformHeadlessWebViewCreationParamsPropertySupported.isPropertySupported(
          property,
          platform: platform,
        );
}

///{@template cygnus_core.CygnusPlatformHeadlessWebView}
///Class that represents a WebView in headless mode.
///It can be used to run a WebView in background without attaching an `CygnusWebView` to the widget tree.
///
///**NOTE**: Remember to dispose it when you don't need it anymore.
///{@endtemplate}
///
///{@macro cygnus_core.CygnusPlatformHeadlessWebView.supported_platforms}
@SupportedPlatforms(
  platforms: [
    AndroidPlatform(),
    IOSPlatform(),
    MacOSPlatform(),
    WebPlatform(requiresSameOrigin: false),
    WindowsPlatform(),
    LinuxPlatform(),
  ],
)
abstract class CygnusPlatformHeadlessWebView extends PlatformInterface
    implements CygnusDisposable {
  /// Creates a new [CygnusPlatformHeadlessWebView]
  factory CygnusPlatformHeadlessWebView(
    CygnusPlatformHeadlessWebViewCreationParams params,
  ) {
    assert(
      CygnusWebViewPlatform.instance != null,
      'A platform implementation for `cygnus` has not been set. Please '
      'ensure that an implementation of `CygnusWebViewPlatform` has been set to '
      '`CygnusWebViewPlatform.instance` before use. For unit testing, '
      '`CygnusWebViewPlatform.instance` can be set with your own test implementation.',
    );
    final CygnusPlatformHeadlessWebView webViewControllerDelegate =
        CygnusWebViewPlatform.instance!.createPlatformHeadlessWebView(
          params,
        );
    PlatformInterface.verify(webViewControllerDelegate, _token);
    return webViewControllerDelegate;
  }

  /// Creates a new [CygnusPlatformHeadlessWebView] to access static methods.
  factory CygnusPlatformHeadlessWebView.static() {
    assert(
      CygnusWebViewPlatform.instance != null,
      'A platform implementation for `cygnus` has not been set. Please '
      'ensure that an implementation of `CygnusWebViewPlatform` has been set to '
      '`CygnusWebViewPlatform.instance` before use. For unit testing, '
      '`CygnusWebViewPlatform.instance` can be set with your own test implementation.',
    );
    final CygnusPlatformHeadlessWebView headlessWebViewStatic =
        CygnusWebViewPlatform.instance!
            .createPlatformHeadlessWebViewStatic();
    PlatformInterface.verify(headlessWebViewStatic, _token);
    return headlessWebViewStatic;
  }

  /// Used by the platform implementation to create a new [CygnusPlatformHeadlessWebView].
  ///
  /// Should only be used by platform implementations because they can't extend
  /// a class that only contains a factory constructor.
  @protected
  CygnusPlatformHeadlessWebView.implementation(this.params)
    : super(token: _token);

  static final Object _token = Object();

  /// The parameters used to initialize the [CygnusPlatformHeadlessWebView].
  final CygnusPlatformHeadlessWebViewCreationParams params;

  ///{@template cygnus_core.CygnusPlatformHeadlessWebView.id}
  ///View ID.
  ///{@endtemplate}
  String get id =>
      throw UnimplementedError('id is not implemented on the current platform');

  ///{@template cygnus_core.CygnusPlatformHeadlessWebView.webViewController}
  ///WebView Controller that can be used to access the [CygnusWebViewController] API.
  ///{@endtemplate}
  CygnusPlatformWebViewController? get webViewController =>
      throw UnimplementedError(
        'webViewController is not implemented on the current platform',
      );

  ///{@template cygnus_core.CygnusPlatformHeadlessWebView.run}
  ///Runs the headless WebView.
  ///{@endtemplate}
  ///
  ///{@macro cygnus_core.CygnusPlatformHeadlessWebView.run.supported_platforms}
  @SupportedPlatforms(
    platforms: [
      AndroidPlatform(),
      IOSPlatform(),
      MacOSPlatform(),
      WebPlatform(
        requiresSameOrigin: false,
        note: 'It will append a new `iframe` to the body.',
      ),
      WindowsPlatform(),
      LinuxPlatform(),
    ],
  )
  Future<void> run() {
    throw UnimplementedError('run is not implemented on the current platform');
  }

  ///{@template cygnus_core.CygnusPlatformHeadlessWebView.isRunning}
  ///Indicates if the headless WebView is running or not.
  ///{@endtemplate}
  ///
  ///{@macro cygnus_core.CygnusPlatformHeadlessWebView.isRunning.supported_platforms}
  @SupportedPlatforms(
    platforms: [
      AndroidPlatform(),
      IOSPlatform(),
      MacOSPlatform(),
      WebPlatform(requiresSameOrigin: false),
      WindowsPlatform(),
      LinuxPlatform(),
    ],
  )
  bool isRunning() {
    throw UnimplementedError(
      'isRunning is not implemented on the current platform',
    );
  }

  ///{@template cygnus_core.CygnusPlatformHeadlessWebView.setSize}
  ///Set the size of the WebView in pixels.
  ///
  ///Set `-1` to match the corresponding width or height of the current device screen size.
  ///`Size(-1, -1)` will match both width and height of the current device screen size.
  ///
  ///Note that if the [CygnusPlatformHeadlessWebView] is not running, this method won't have effect.
  ///{@endtemplate}
  ///
  ///{@macro cygnus_core.CygnusPlatformHeadlessWebView.setSize.supported_platforms}
  @SupportedPlatforms(
    platforms: [
      AndroidPlatform(
        note:
            '`Size` width and height values will be converted to `int` values because they cannot have `double` values.',
      ),
      IOSPlatform(),
      MacOSPlatform(),
      WebPlatform(requiresSameOrigin: false),
      LinuxPlatform(),
    ],
  )
  Future<void> setSize(Size size) {
    throw UnimplementedError(
      'setSize is not implemented on the current platform',
    );
  }

  ///{@template cygnus_core.CygnusPlatformHeadlessWebView.getSize}
  ///Gets the current size in pixels of the WebView.
  ///
  ///Note that if the [CygnusPlatformHeadlessWebView] is not running, this method will return `null`.
  ///{@endtemplate}
  ///
  ///{@macro cygnus_core.CygnusPlatformHeadlessWebView.getSize.supported_platforms}
  @SupportedPlatforms(
    platforms: [
      AndroidPlatform(),
      IOSPlatform(),
      MacOSPlatform(),
      WebPlatform(requiresSameOrigin: false),
      LinuxPlatform(),
    ],
  )
  Future<Size?> getSize() {
    throw UnimplementedError(
      'getSize is not implemented on the current platform',
    );
  }

  ///{@template cygnus_core.CygnusPlatformHeadlessWebView.dispose}
  ///Disposes the headless WebView.
  ///{@endtemplate}
  ///
  ///{@macro cygnus_core.CygnusPlatformHeadlessWebView.dispose.supported_platforms}
  @SupportedPlatforms(
    platforms: [
      AndroidPlatform(),
      IOSPlatform(),
      MacOSPlatform(),
      WebPlatform(requiresSameOrigin: false),
      WindowsPlatform(),
      LinuxPlatform(),
    ],
  )
  Future<void> dispose() {
    throw UnimplementedError(
      'dispose is not implemented on the current platform',
    );
  }

  ///{@macro cygnus_core.CygnusPlatformHeadlessWebViewCreationParams.isClassSupported}
  bool isClassSupported({TargetPlatform? platform}) =>
      params.isClassSupported(platform: platform);

  ///{@macro cygnus_core.CygnusPlatformHeadlessWebViewCreationParams.isPropertySupported}
  bool isPropertySupported(dynamic property, {TargetPlatform? platform}) =>
      params.isPropertySupported(property, platform: platform);

  ///{@template cygnus_core.CygnusPlatformHeadlessWebView.isMethodSupported}
  ///Check if the given [method] is supported by the [defaultTargetPlatform] or a specific [platform].
  ///{@endtemplate}
  bool isMethodSupported(
    CygnusPlatformHeadlessWebViewMethod method, {
    TargetPlatform? platform,
  }) => _CygnusPlatformHeadlessWebViewMethodSupported.isMethodSupported(
    method,
    platform: platform,
  );
}
