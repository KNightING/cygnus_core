import 'dart:async';
import 'dart:collection';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter_inappwebview_internal_annotations/flutter_inappwebview_internal_annotations.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import '../context_menu/context_menu.dart';
import '../debug_logging_settings.dart';
import '../find_interaction/platform_find_interaction_controller.dart';
import '../webview/webview_settings.dart';
import '../webview/platform_webview_controller.dart';
import '../webview_platform.dart';
import '../platform_webview_feature.dart';
import '../print_job/main.dart';
import '../pull_to_refresh/main.dart';
import '../pull_to_refresh/platform_pull_to_refresh_controller.dart';
import '../types/main.dart';
import '../web_uri.dart';
import '../webview_environment/platform_webview_environment.dart';
import 'browser_menu_item.dart';
import 'browser_settings.dart';

part 'platform_browser.g.dart';

///{@template cygnus_core.CygnusPlatformBrowserCreationParams}
/// Object specifying creation parameters for creating a [CygnusPlatformBrowser].
///
/// Platform specific implementations can add additional fields by extending
/// this class.
///{@endtemplate}
@immutable
class CygnusPlatformBrowserCreationParams {
  /// Used by the platform implementation to create a new [CygnusPlatformBrowser].
  const CygnusPlatformBrowserCreationParams({
    this.contextMenu,
    this.pullToRefreshController,
    this.findInteractionController,
    this.initialUserScripts,
    this.windowId,
    this.webViewEnvironment,
  });

  ///{@macro cygnus_core.CygnusPlatformWebViewCreationParams.contextMenu}
  ///
  ///{@macro cygnus_core.CygnusPlatformBrowser.contextMenu.supported_platforms}
  final CygnusContextMenu? contextMenu;

  ///{@macro cygnus_core.CygnusPlatformWebViewCreationParams.pullToRefreshController}
  ///
  ///{@macro cygnus_core.CygnusPlatformBrowser.pullToRefreshController.supported_platforms}
  final CygnusPlatformPullToRefreshController? pullToRefreshController;

  ///{@macro cygnus_core.CygnusPlatformWebViewCreationParams.findInteractionController}
  ///
  ///{@macro cygnus_core.CygnusPlatformBrowser.findInteractionController.supported_platforms}
  final CygnusPlatformFindInteractionController? findInteractionController;

  ///{@macro cygnus_core.CygnusPlatformWebViewCreationParams.initialUserScripts}
  ///
  ///{@macro cygnus_core.CygnusPlatformBrowser.initialUserScripts.supported_platforms}
  final UnmodifiableListView<CygnusUserScript>? initialUserScripts;

  ///{@macro cygnus_core.CygnusPlatformWebViewCreationParams.windowId}
  ///
  ///{@macro cygnus_core.CygnusPlatformBrowser.windowId.supported_platforms}
  final int? windowId;

  ///{@template cygnus_core.CygnusPlatformBrowserCreationParams.webViewEnvironment}
  ///Used to create the [CygnusPlatformBrowser] using the specified environment.
  ///{@endtemplate}
  ///
  ///{@macro cygnus_core.CygnusPlatformBrowser.webViewEnvironment.supported_platforms}
  final CygnusPlatformWebViewEnvironment? webViewEnvironment;
}

///{@template cygnus_core.CygnusPlatformBrowser}
///This class represents a native WebView displayed on top of the Flutter App,
///so it's not integrated into the Flutter widget tree.
///It uses the native WebView of the platform.
///The [webViewController] field can be used to access the [CygnusPlatformWebViewController] API.
///{@endtemplate}
///
///{@macro cygnus_core.CygnusPlatformBrowser.supported_platforms}
@SupportedPlatforms(
  platforms: [
    AndroidPlatform(),
    IOSPlatform(),
    MacOSPlatform(),
    WindowsPlatform(),
    LinuxPlatform(
      apiName: 'GtkWindow + WPE WebKit',
      apiUrl:
          'https://wpewebkit.org/reference/stable/wpe-webkit-2.0/class.WebView.html',
    ),
  ],
)
abstract class CygnusPlatformBrowser extends PlatformInterface
    implements CygnusDisposable {
  ///Debug settings.
  static CygnusDebugLoggingSettings debugLoggingSettings = CygnusDebugLoggingSettings();

  /// Event handler object that handles the [CygnusPlatformBrowser] events.
  CygnusPlatformBrowserEvents? eventHandler;

  ///{@template cygnus_core.CygnusPlatformBrowser.id}
  ///View ID used internally.
  ///{@endtemplate}
  ///
  ///{@macro cygnus_core.CygnusPlatformBrowser.id.supported_platforms}
  @SupportedPlatforms(
    platforms: [
      AndroidPlatform(),
      IOSPlatform(),
      MacOSPlatform(),
      WindowsPlatform(),
      LinuxPlatform(),
    ],
  )
  String get id {
    throw UnimplementedError('id is not implemented on the current platform');
  }

  ///{@macro cygnus_core.CygnusPlatformWebViewCreationParams.contextMenu}
  ///
  ///{@macro cygnus_core.CygnusPlatformBrowser.contextMenu.supported_platforms}
  @SupportedPlatforms(platforms: [AndroidPlatform(), IOSPlatform()])
  CygnusContextMenu? get contextMenu => params.contextMenu;

  ///{@macro cygnus_core.CygnusPlatformWebViewCreationParams.pullToRefreshController}
  ///
  ///{@macro cygnus_core.CygnusPlatformBrowser.pullToRefreshController.supported_platforms}
  @SupportedPlatforms(platforms: [AndroidPlatform(), IOSPlatform()])
  CygnusPlatformPullToRefreshController? get pullToRefreshController =>
      params.pullToRefreshController;

  ///{@macro cygnus_core.CygnusPlatformWebViewCreationParams.findInteractionController}
  ///
  ///{@macro cygnus_core.CygnusPlatformBrowser.findInteractionController.supported_platforms}
  @SupportedPlatforms(
    platforms: [AndroidPlatform(), IOSPlatform(), MacOSPlatform()],
  )
  CygnusPlatformFindInteractionController? get findInteractionController =>
      params.findInteractionController;

  ///{@macro cygnus_core.CygnusPlatformWebViewCreationParams.initialUserScripts}
  ///
  ///{@macro cygnus_core.CygnusPlatformBrowser.initialUserScripts.supported_platforms}
  @SupportedPlatforms(
    platforms: [
      AndroidPlatform(),
      IOSPlatform(
        note:
            """This property will be ignored if the [CygnusPlatformWebViewCreationParams.windowId] has been set.
There isn't any way to add/remove user scripts specific to iOS window WebViews.
This is a limitation of the native WebKit APIs.""",
      ),
      MacOSPlatform(
        note:
            """This property will be ignored if the [CygnusPlatformWebViewCreationParams.windowId] has been set.
There isn't any way to add/remove user scripts specific to iOS window WebViews.
This is a limitation of the native WebKit APIs.""",
      ),
      WindowsPlatform(),
      LinuxPlatform(),
    ],
  )
  UnmodifiableListView<CygnusUserScript>? get initialUserScripts =>
      params.initialUserScripts;

  ///{@macro cygnus_core.CygnusPlatformWebViewCreationParams.windowId}
  ///
  ///{@macro cygnus_core.CygnusPlatformBrowser.windowId.supported_platforms}
  @SupportedPlatforms(
    platforms: [
      AndroidPlatform(),
      IOSPlatform(),
      MacOSPlatform(),
      WindowsPlatform(),
      LinuxPlatform(),
    ],
  )
  int? get windowId => params.windowId;

  ///{@macro cygnus_core.CygnusPlatformBrowserCreationParams.webViewEnvironment}
  ///
  ///{@macro cygnus_core.CygnusPlatformBrowser.webViewEnvironment.supported_platforms}
  @SupportedPlatforms(platforms: [WindowsPlatform()])
  CygnusPlatformWebViewEnvironment? get webViewEnvironment =>
      params.webViewEnvironment;

  ///{@template cygnus_core.CygnusPlatformBrowser.webViewController}
  ///WebView Controller that can be used to access the [CygnusPlatformWebViewController] API.
  ///When [onExit] is fired, this will be `null` and cannot be used anymore.
  ///{@endtemplate}
  CygnusPlatformWebViewController? get webViewController {
    throw UnimplementedError(
      'webViewController is not implemented on the current platform',
    );
  }

  /// Creates a new [CygnusPlatformBrowser]
  factory CygnusPlatformBrowser(CygnusPlatformBrowserCreationParams params) {
    assert(
      CygnusWebViewPlatform.instance != null,
      'A platform implementation for `flutter_inappwebview` has not been set. Please '
      'ensure that an implementation of `CygnusWebViewPlatform` has been set to '
      '`CygnusWebViewPlatform.instance` before use. For unit testing, '
      '`CygnusWebViewPlatform.instance` can be set with your own test implementation.',
    );
    final CygnusPlatformBrowser browser = CygnusWebViewPlatform.instance!
        .createPlatformBrowser(params);
    PlatformInterface.verify(browser, _token);
    return browser;
  }

  /// Creates a new [CygnusPlatformBrowser] to access static methods.
  factory CygnusPlatformBrowser.static() {
    assert(
      CygnusWebViewPlatform.instance != null,
      'A platform implementation for `flutter_inappwebview` has not been set. Please '
      'ensure that an implementation of `CygnusWebViewPlatform` has been set to '
      '`CygnusWebViewPlatform.instance` before use. For unit testing, '
      '`CygnusWebViewPlatform.instance` can be set with your own test implementation.',
    );
    final CygnusPlatformBrowser browserStatic = CygnusWebViewPlatform
        .instance!
        .createPlatformBrowserStatic();
    PlatformInterface.verify(browserStatic, _token);
    return browserStatic;
  }

  /// Used by the platform implementation to create a new [CygnusPlatformBrowser].
  ///
  /// Should only be used by platform implementations because they can't extend
  /// a class that only contains a factory constructor.
  @protected
  CygnusPlatformBrowser.implementation(this.params) : super(token: _token);

  static final Object _token = Object();

  /// The parameters used to initialize the [CygnusPlatformBrowser].
  final CygnusPlatformBrowserCreationParams params;

  ///{@template cygnus_core.CygnusPlatformBrowser.openUrlRequest}
  ///Opens the [CygnusPlatformBrowser] instance with an [urlRequest].
  ///
  ///[urlRequest]: The [urlRequest] to load.
  ///
  ///[options]: Options for the [CygnusPlatformBrowser].
  ///
  ///[settings]: Settings for the [CygnusPlatformBrowser].
  ///{@endtemplate}
  ///
  ///{@macro cygnus_core.CygnusPlatformBrowser.openUrlRequest.supported_platforms}
  @SupportedPlatforms(
    platforms: [
      AndroidPlatform(),
      IOSPlatform(),
      MacOSPlatform(),
      WindowsPlatform(),
      LinuxPlatform(),
    ],
  )
  Future<void> openUrlRequest({
    required CygnusURLRequest urlRequest,
    // ignore: deprecated_member_use_from_same_package
    @Deprecated('Use settings instead') CygnusBrowserClassOptions? options,
    CygnusBrowserClassSettings? settings,
  }) {
    throw UnimplementedError(
      'openUrlRequest is not implemented on the current platform',
    );
  }

  ///{@template cygnus_core.CygnusPlatformBrowser.openFile}
  ///Opens the [CygnusPlatformBrowser] instance with the given [assetFilePath] file.
  ///
  ///[options]: Options for the [CygnusPlatformBrowser].
  ///
  ///To be able to load your local files (assets, js, css, etc.), you need to add them in the `assets` section of the `pubspec.yaml` file, otherwise they cannot be found!
  ///
  ///Example of a `pubspec.yaml` file:
  ///```yaml
  ///...
  ///
  ///# The following section is specific to Flutter.
  ///flutter:
  ///
  ///  # The following line ensures that the Material Icons font is
  ///  # included with your application, so that you can use the icons in
  ///  # the material Icons class.
  ///  uses-material-design: true
  ///
  ///  assets:
  ///    - assets/index.html
  ///    - assets/css/
  ///    - assets/images/
  ///
  ///...
  ///```
  ///Example of a `main.dart` file:
  ///```dart
  ///...
  ///browser.openFile(assetFilePath: "assets/index.html");
  ///...
  ///```
  ///
  ///[headers]: The additional headers to be used in the HTTP request for this URL, specified as a map from name to value.
  ///
  ///[options]: Options for the [CygnusPlatformBrowser].
  ///
  ///[settings]: Settings for the [CygnusPlatformBrowser].
  ///{@endtemplate}
  ///
  ///{@macro cygnus_core.CygnusPlatformBrowser.openFile.supported_platforms}
  @SupportedPlatforms(
    platforms: [
      AndroidPlatform(),
      IOSPlatform(),
      MacOSPlatform(),
      WindowsPlatform(),
      LinuxPlatform(),
    ],
  )
  Future<void> openFile({
    required String assetFilePath,
    // ignore: deprecated_member_use_from_same_package
    @Deprecated('Use settings instead') CygnusBrowserClassOptions? options,
    CygnusBrowserClassSettings? settings,
  }) {
    throw UnimplementedError(
      'openFile is not implemented on the current platform',
    );
  }

  ///{@template cygnus_core.CygnusPlatformBrowser.openData}
  ///Opens the [CygnusPlatformBrowser] instance with [data] as a content, using [baseUrl] as the base URL for it.
  ///
  ///The [mimeType] parameter specifies the format of the data. The default value is `"text/html"`.
  ///
  ///The [encoding] parameter specifies the encoding of the data. The default value is `"utf8"`.
  ///
  ///The [androidHistoryUrl] parameter is the URL to use as the history entry. The default value is `about:blank`. If non-null, this must be a valid URL. This parameter is used only on Android.
  ///
  ///The [options] parameter specifies the options for the [CygnusPlatformBrowser].
  ///
  ///[settings]: Settings for the [CygnusPlatformBrowser].
  ///{@endtemplate}
  ///
  ///{@macro cygnus_core.CygnusPlatformBrowser.openData.supported_platforms}
  @SupportedPlatforms(
    platforms: [
      AndroidPlatform(),
      IOSPlatform(),
      MacOSPlatform(),
      WindowsPlatform(),
      LinuxPlatform(),
    ],
  )
  Future<void> openData({
    required String data,
    String mimeType = "text/html",
    String encoding = "utf8",
    CygnusWebUri? baseUrl,
    @Deprecated("Use historyUrl instead") Uri? androidHistoryUrl,
    CygnusWebUri? historyUrl,
    // ignore: deprecated_member_use_from_same_package
    @Deprecated('Use settings instead') CygnusBrowserClassOptions? options,
    CygnusBrowserClassSettings? settings,
  }) {
    throw UnimplementedError(
      'openData is not implemented on the current platform',
    );
  }

  ///{@template cygnus_core.CygnusPlatformBrowser.openWithSystemBrowser}
  ///This is a static method that opens an [url] in the system browser.
  ///You wont be able to use the [CygnusPlatformBrowser] events and methods here.
  ///{@endtemplate}
  ///
  ///{@macro cygnus_core.CygnusPlatformBrowser.openWithSystemBrowser.supported_platforms}
  @SupportedPlatforms(
    platforms: [
      AndroidPlatform(),
      IOSPlatform(),
      MacOSPlatform(),
      WindowsPlatform(),
      LinuxPlatform(),
    ],
  )
  Future<void> openWithSystemBrowser({required CygnusWebUri url}) {
    throw UnimplementedError(
      'openWithSystemBrowser is not implemented on the current platform',
    );
  }

  ///{@template cygnus_core.CygnusPlatformBrowser.addMenuItem}
  ///Adds a [CygnusBrowserMenuItem] to the menu.
  ///If the browser is already open,
  ///it will take effect the next time it is opened.
  ///{@endtemplate}
  ///
  ///{@macro cygnus_core.CygnusPlatformBrowser.addMenuItem.supported_platforms}
  @SupportedPlatforms(
    platforms: [
      AndroidPlatform(),
      IOSPlatform(available: '14.0'),
      MacOSPlatform(available: '10.15'),
    ],
  )
  void addMenuItem(CygnusBrowserMenuItem menuItem) {
    throw UnimplementedError(
      'addMenuItem is not implemented on the current platform',
    );
  }

  ///{@template cygnus_core.CygnusPlatformBrowser.addMenuItems}
  ///Adds a list of [CygnusBrowserMenuItem] to the menu.
  ///If the browser is already open,
  ///it will take effect the next time it is opened.
  ///{@endtemplate}
  ///
  ///{@macro cygnus_core.CygnusPlatformBrowser.addMenuItems.supported_platforms}
  @SupportedPlatforms(
    platforms: [
      AndroidPlatform(),
      IOSPlatform(available: '14.0'),
      MacOSPlatform(available: '10.15'),
    ],
  )
  void addMenuItems(List<CygnusBrowserMenuItem> menuItems) {
    throw UnimplementedError(
      'addMenuItems is not implemented on the current platform',
    );
  }

  ///{@template cygnus_core.CygnusPlatformBrowser.removeMenuItem}
  ///Removes the [menuItem] from the list.
  ///Returns `true` if it was in the list, `false` otherwise.
  ///If the browser is already open,
  ///it will take effect the next time it is opened.
  ///{@endtemplate}
  ///
  ///{@macro cygnus_core.CygnusPlatformBrowser.removeMenuItem.supported_platforms}
  @SupportedPlatforms(
    platforms: [
      AndroidPlatform(),
      IOSPlatform(available: '14.0'),
      MacOSPlatform(available: '10.15'),
    ],
  )
  bool removeMenuItem(CygnusBrowserMenuItem menuItem) {
    throw UnimplementedError(
      'removeMenuItem is not implemented on the current platform',
    );
  }

  ///{@template cygnus_core.CygnusPlatformBrowser.removeMenuItems}
  ///Removes a list of [menuItems] from the list.
  ///If the browser is already open,
  ///it will take effect the next time it is opened.
  ///{@endtemplate}
  ///
  ///{@macro cygnus_core.CygnusPlatformBrowser.removeMenuItems.supported_platforms}
  @SupportedPlatforms(
    platforms: [
      AndroidPlatform(),
      IOSPlatform(available: '14.0'),
      MacOSPlatform(available: '10.15'),
    ],
  )
  void removeMenuItems(List<CygnusBrowserMenuItem> menuItems) {
    throw UnimplementedError(
      'removeMenuItems is not implemented on the current platform',
    );
  }

  ///{@template cygnus_core.CygnusPlatformBrowser.removeAllMenuItem}
  ///Removes all the menu items from the list.
  ///If the browser is already open,
  ///it will take effect the next time it is opened.
  ///{@endtemplate}
  ///
  ///{@macro cygnus_core.CygnusPlatformBrowser.removeAllMenuItem.supported_platforms}
  @SupportedPlatforms(
    platforms: [
      AndroidPlatform(),
      IOSPlatform(available: '14.0'),
      MacOSPlatform(available: '10.15'),
    ],
  )
  void removeAllMenuItem() {
    throw UnimplementedError(
      'removeAllMenuItem is not implemented on the current platform',
    );
  }

  ///{@template cygnus_core.CygnusPlatformBrowser.hasMenuItem}
  ///Returns `true` if the [menuItem] has been already added, otherwise `false`.
  ///{@endtemplate}
  ///
  ///{@macro cygnus_core.CygnusPlatformBrowser.hasMenuItem.supported_platforms}
  @SupportedPlatforms(
    platforms: [
      AndroidPlatform(),
      IOSPlatform(available: '14.0'),
      MacOSPlatform(available: '10.15'),
    ],
  )
  bool hasMenuItem(CygnusBrowserMenuItem menuItem) {
    throw UnimplementedError(
      'hasMenuItem is not implemented on the current platform',
    );
  }

  ///{@template cygnus_core.CygnusPlatformBrowser.show}
  ///Displays a [CygnusPlatformBrowser] window that was opened hidden. Calling this has no effect if the [CygnusPlatformBrowser] was already visible.
  ///{@endtemplate}
  ///
  ///{@macro cygnus_core.CygnusPlatformBrowser.show.supported_platforms}
  @SupportedPlatforms(
    platforms: [
      AndroidPlatform(),
      IOSPlatform(),
      MacOSPlatform(),
      WindowsPlatform(),
      LinuxPlatform(),
    ],
  )
  Future<void> show() {
    throw UnimplementedError('show is not implemented on the current platform');
  }

  ///{@template cygnus_core.CygnusPlatformBrowser.hide}
  ///Hides the [CygnusPlatformBrowser] window. Calling this has no effect if the [CygnusPlatformBrowser] was already hidden.
  ///{@endtemplate}
  ///
  ///{@macro cygnus_core.CygnusPlatformBrowser.hide.supported_platforms}
  @SupportedPlatforms(
    platforms: [
      AndroidPlatform(),
      IOSPlatform(),
      MacOSPlatform(),
      WindowsPlatform(),
      LinuxPlatform(),
    ],
  )
  Future<void> hide() {
    throw UnimplementedError('hide is not implemented on the current platform');
  }

  ///{@template cygnus_core.CygnusPlatformBrowser.close}
  ///Closes the [CygnusPlatformBrowser] window.
  ///{@endtemplate}
  ///
  ///{@macro cygnus_core.CygnusPlatformBrowser.close.supported_platforms}
  @SupportedPlatforms(
    platforms: [
      AndroidPlatform(),
      IOSPlatform(),
      MacOSPlatform(),
      WindowsPlatform(),
      LinuxPlatform(),
    ],
  )
  Future<void> close() {
    throw UnimplementedError(
      'close is not implemented on the current platform',
    );
  }

  ///{@template cygnus_core.CygnusPlatformBrowser.isHidden}
  ///Check if the Web View of the [CygnusPlatformBrowser] instance is hidden.
  ///{@endtemplate}
  ///
  ///{@macro cygnus_core.CygnusPlatformBrowser.isHidden.supported_platforms}
  @SupportedPlatforms(
    platforms: [
      AndroidPlatform(),
      IOSPlatform(),
      MacOSPlatform(),
      WindowsPlatform(),
      LinuxPlatform(),
    ],
  )
  Future<bool> isHidden() {
    throw UnimplementedError(
      'isHidden is not implemented on the current platform',
    );
  }

  ///{@template cygnus_core.CygnusPlatformBrowser.setOptions}
  ///Use [setSettings] instead.
  ///{@endtemplate}
  ///
  ///{@macro cygnus_core.CygnusPlatformBrowser.setOptions.supported_platforms}
  @SupportedPlatforms(platforms: [AndroidPlatform(), IOSPlatform()])
  @Deprecated('Use setSettings instead')
  Future<void> setOptions({required CygnusBrowserClassOptions options}) {
    throw UnimplementedError(
      'setOptions is not implemented on the current platform',
    );
  }

  ///{@template cygnus_core.CygnusPlatformBrowser.getOptions}
  ///Use [getSettings] instead.
  ///{@endtemplate}
  ///
  ///{@macro cygnus_core.CygnusPlatformBrowser.getOptions.supported_platforms}
  @SupportedPlatforms(platforms: [AndroidPlatform(), IOSPlatform()])
  @Deprecated('Use getSettings instead')
  Future<CygnusBrowserClassOptions?> getOptions() {
    throw UnimplementedError(
      'getOptions is not implemented on the current platform',
    );
  }

  ///{@template cygnus_core.CygnusPlatformBrowser.setSettings}
  ///Sets the [CygnusPlatformBrowser] settings with the new [settings] and evaluates them.
  ///{@endtemplate}
  ///
  ///{@macro cygnus_core.CygnusPlatformBrowser.setSettings.supported_platforms}
  @SupportedPlatforms(
    platforms: [
      AndroidPlatform(),
      IOSPlatform(),
      MacOSPlatform(),
      WindowsPlatform(),
      LinuxPlatform(),
    ],
  )
  Future<void> setSettings({required CygnusBrowserClassSettings settings}) {
    throw UnimplementedError(
      'setSettings is not implemented on the current platform',
    );
  }

  ///{@template cygnus_core.CygnusPlatformBrowser.getSettings}
  ///Gets the current [CygnusPlatformBrowser] settings. Returns `null` if it wasn't able to get them.
  ///{@endtemplate}
  ///
  ///{@macro cygnus_core.CygnusPlatformBrowser.getSettings.supported_platforms}
  @SupportedPlatforms(
    platforms: [
      AndroidPlatform(),
      IOSPlatform(),
      MacOSPlatform(),
      WindowsPlatform(),
      LinuxPlatform(),
    ],
  )
  Future<CygnusBrowserClassSettings?> getSettings() {
    throw UnimplementedError(
      'getSettings is not implemented on the current platform',
    );
  }

  ///{@template cygnus_core.CygnusPlatformBrowser.isOpened}
  ///Returns `true` if the [CygnusPlatformBrowser] instance is opened, otherwise `false`.
  ///{@endtemplate}
  ///
  ///{@macro cygnus_core.CygnusPlatformBrowser.isOpened.supported_platforms}
  @SupportedPlatforms(
    platforms: [
      AndroidPlatform(),
      IOSPlatform(),
      MacOSPlatform(),
      WindowsPlatform(),
      LinuxPlatform(),
    ],
  )
  bool isOpened() {
    throw UnimplementedError(
      'isOpened is not implemented on the current platform',
    );
  }

  ///{@template cygnus_core.CygnusPlatformBrowser.dispose}
  ///Disposes the channel and controllers.
  ///{@endtemplate}
  ///
  ///{@macro cygnus_core.CygnusPlatformBrowser.dispose.supported_platforms}
  @SupportedPlatforms(
    platforms: [
      AndroidPlatform(),
      IOSPlatform(),
      MacOSPlatform(),
      WindowsPlatform(),
      LinuxPlatform(),
    ],
  )
  @override
  @mustCallSuper
  void dispose() {
    eventHandler = null;
  }

  ///{@template cygnus_core.CygnusPlatformBrowser.isClassSupported}
  ///Check if the current class is supported by the [defaultTargetPlatform] or a specific [platform].
  ///{@endtemplate}
  bool isClassSupported({TargetPlatform? platform}) =>
      _CygnusPlatformBrowserClassSupported.isClassSupported(platform: platform);

  ///{@template cygnus_core.CygnusPlatformBrowser.isPropertySupported}
  ///Check if the given [property] is supported by the [defaultTargetPlatform] or a specific [platform].
  ///{@endtemplate}
  bool isPropertySupported(
    CygnusPlatformBrowserProperty property, {
    TargetPlatform? platform,
  }) => _CygnusPlatformBrowserPropertySupported.isPropertySupported(
    property,
    platform: platform,
  );

  ///{@template cygnus_core.CygnusPlatformBrowser.isMethodSupported}
  ///Check if the given [method] is supported by the [defaultTargetPlatform] or a specific [platform].
  ///{@endtemplate}
  bool isMethodSupported(
    CygnusPlatformBrowserMethod method, {
    TargetPlatform? platform,
  }) => _CygnusPlatformBrowserMethodSupported.isMethodSupported(
    method,
    platform: platform,
  );

  ///{@macro cygnus_core.CygnusPlatformBrowserEvents.isMethodSupported}
  bool isEventMethodSupported(
    CygnusPlatformBrowserEventsMethod method, {
    TargetPlatform? platform,
  }) =>
      CygnusPlatformBrowserEvents.isMethodSupported(method, platform: platform);
}

@SupportedPlatforms(
  platforms: [
    AndroidPlatform(),
    IOSPlatform(),
    MacOSPlatform(),
    WindowsPlatform(),
    LinuxPlatform(),
  ],
)
abstract class CygnusPlatformBrowserEvents {
  ///{@template cygnus_core.CygnusPlatformBrowserEvents.onBrowserCreated}
  ///Event fired when the [CygnusPlatformBrowser] is created.
  ///{@endtemplate}
  ///
  ///{@macro cygnus_core.CygnusPlatformBrowserEvents.onBrowserCreated.supported_platforms}
  @SupportedPlatforms(
    platforms: [
      AndroidPlatform(),
      IOSPlatform(),
      MacOSPlatform(),
      WindowsPlatform(),
      LinuxPlatform(),
    ],
  )
  void onBrowserCreated() {}

  ///{@template cygnus_core.CygnusPlatformBrowserEvents.onExit}
  ///Event fired when the [CygnusPlatformBrowser] window is closed.
  ///{@endtemplate}
  ///
  ///{@macro cygnus_core.CygnusPlatformBrowserEvents.onExit.supported_platforms}
  @SupportedPlatforms(
    platforms: [
      AndroidPlatform(),
      IOSPlatform(),
      MacOSPlatform(),
      WindowsPlatform(),
      LinuxPlatform(),
    ],
  )
  void onExit() {}

  ///{@template cygnus_core.CygnusPlatformBrowserEvents.onMainWindowWillClose}
  ///Event fired when the main window is about to close.
  ///{@endtemplate}
  ///
  ///{@macro cygnus_core.CygnusPlatformBrowserEvents.onMainWindowWillClose.supported_platforms}
  @SupportedPlatforms(platforms: [MacOSPlatform()])
  void onMainWindowWillClose() {}

  ///{@macro cygnus_core.CygnusPlatformWebViewCreationParams.onLoadStart}
  ///
  ///{@macro cygnus_core.CygnusPlatformBrowserEvents.onLoadStart.supported_platforms}
  @SupportedPlatforms(
    platforms: [
      AndroidPlatform(
        apiName: 'WebViewClient.onPageStarted',
        apiUrl:
            'https://developer.android.com/reference/android/webkit/WebViewClient#onPageStarted(android.webkit.WebView,%20java.lang.String,%20android.graphics.Bitmap)',
      ),
      IOSPlatform(
        apiName: 'WKNavigationDelegate.webView',
        apiUrl:
            'https://developer.apple.com/documentation/webkit/wknavigationdelegate/1455621-webview',
      ),
      MacOSPlatform(
        apiName: 'WKNavigationDelegate.webView',
        apiUrl:
            'https://developer.apple.com/documentation/webkit/wknavigationdelegate/1455621-webview',
      ),
      WindowsPlatform(
        apiName: 'ICoreWebView2.add_NavigationStarting',
        apiUrl:
            'https://learn.microsoft.com/en-us/microsoft-edge/webview2/reference/win32/iwebview2webview?view=webview2-0.8.355#add_navigationstarting',
      ),
    ],
  )
  void onLoadStart(CygnusWebUri? url) {}

  ///{@macro cygnus_core.CygnusPlatformWebViewCreationParams.onLoadStop}
  ///
  ///{@macro cygnus_core.CygnusPlatformBrowserEvents.onLoadStop.supported_platforms}
  @SupportedPlatforms(
    platforms: [
      AndroidPlatform(
        apiName: 'WebViewClient.onPageFinished',
        apiUrl:
            'https://developer.android.com/reference/android/webkit/WebViewClient#onPageFinished(android.webkit.WebView,%20java.lang.String)',
      ),
      IOSPlatform(
        apiName: 'WKNavigationDelegate.webView',
        apiUrl:
            'https://developer.apple.com/documentation/webkit/wknavigationdelegate/1455629-webview',
      ),
      MacOSPlatform(
        apiName: 'WKNavigationDelegate.webView',
        apiUrl:
            'https://developer.apple.com/documentation/webkit/wknavigationdelegate/1455629-webview',
      ),
      WindowsPlatform(
        apiName: 'ICoreWebView2.add_NavigationCompleted',
        apiUrl:
            'https://learn.microsoft.com/en-us/microsoft-edge/webview2/reference/win32/iwebview2webview?view=webview2-0.8.355#add_navigationcompleted',
      ),
    ],
  )
  void onLoadStop(CygnusWebUri? url) {}

  ///{@macro cygnus_core.CygnusPlatformWebViewCreationParams.onLoadError}
  ///
  ///{@macro cygnus_core.CygnusPlatformBrowserEvents.onLoadError.supported_platforms}
  @SupportedPlatforms(
    platforms: [AndroidPlatform(), IOSPlatform(), MacOSPlatform()],
  )
  @Deprecated("Use onReceivedError instead")
  void onLoadError(Uri? url, int code, String message) {}

  ///{@macro cygnus_core.CygnusPlatformWebViewCreationParams.onReceivedError}
  ///
  ///{@macro cygnus_core.CygnusPlatformBrowserEvents.onReceivedError.supported_platforms}
  @SupportedPlatforms(
    platforms: [
      AndroidPlatform(
        apiName: 'WebViewClient.onReceivedError',
        apiUrl:
            'https://developer.android.com/reference/android/webkit/WebViewClient#onReceivedError(android.webkit.WebView,%20android.webkit.CygnusWebResourceRequest,%20android.webkit.CygnusWebResourceError)',
      ),
      IOSPlatform(
        apiName: 'WKNavigationDelegate.webView',
        apiUrl:
            'https://developer.apple.com/documentation/webkit/wknavigationdelegate/1455623-webview',
      ),
      MacOSPlatform(
        apiName: 'WKNavigationDelegate.webView',
        apiUrl:
            'https://developer.apple.com/documentation/webkit/wknavigationdelegate/1455623-webview',
      ),
      WindowsPlatform(
        apiName: 'ICoreWebView2.add_NavigationCompleted',
        apiUrl:
            'https://learn.microsoft.com/en-us/microsoft-edge/webview2/reference/win32/iwebview2webview?view=webview2-0.8.355#add_navigationcompleted',
      ),
    ],
  )
  void onReceivedError(CygnusWebResourceRequest request, CygnusWebResourceError error) {}

  ///{@macro cygnus_core.CygnusPlatformWebViewCreationParams.onLoadHttpError}
  ///
  ///{@macro cygnus_core.CygnusPlatformBrowserEvents.onLoadHttpError.supported_platforms}
  @SupportedPlatforms(
    platforms: [AndroidPlatform(), IOSPlatform(), MacOSPlatform()],
  )
  @Deprecated("Use onReceivedHttpError instead")
  void onLoadHttpError(Uri? url, int statusCode, String description) {}

  ///{@macro cygnus_core.CygnusPlatformWebViewCreationParams.onReceivedHttpError}
  ///
  ///{@macro cygnus_core.CygnusPlatformBrowserEvents.onReceivedHttpError.supported_platforms}
  @SupportedPlatforms(
    platforms: [
      AndroidPlatform(
        apiName: 'WebViewClient.onReceivedHttpError',
        apiUrl:
            'https://developer.android.com/reference/android/webkit/WebViewClient#onReceivedHttpError(android.webkit.WebView,%20android.webkit.CygnusWebResourceRequest,%20android.webkit.CygnusWebResourceResponse)',
        available: '23',
      ),
      IOSPlatform(
        apiName: 'WKNavigationDelegate.webView',
        apiUrl:
            'https://developer.apple.com/documentation/webkit/wknavigationdelegate/1455643-webview',
      ),
      MacOSPlatform(
        apiName: 'WKNavigationDelegate.webView',
        apiUrl:
            'https://developer.apple.com/documentation/webkit/wknavigationdelegate/1455643-webview',
      ),
      WindowsPlatform(
        apiName: 'ICoreWebView2.add_NavigationCompleted',
        apiUrl:
            'https://learn.microsoft.com/en-us/microsoft-edge/webview2/reference/win32/iwebview2webview?view=webview2-0.8.355#add_navigationcompleted',
      ),
    ],
  )
  void onReceivedHttpError(
    CygnusWebResourceRequest request,
    CygnusWebResourceResponse errorResponse,
  ) {}

  ///{@macro cygnus_core.CygnusPlatformWebViewCreationParams.onProgressChanged}
  ///
  ///{@macro cygnus_core.CygnusPlatformBrowserEvents.onProgressChanged.supported_platforms}
  @SupportedPlatforms(
    platforms: [
      AndroidPlatform(
        apiName: 'WebChromeClient.onProgressChanged',
        apiUrl:
            'https://developer.android.com/reference/android/webkit/WebChromeClient#onProgressChanged(android.webkit.WebView,%20int)',
      ),
      IOSPlatform(),
      MacOSPlatform(),
      WindowsPlatform(),
    ],
  )
  void onProgressChanged(int progress) {}

  ///{@macro cygnus_core.CygnusPlatformWebViewCreationParams.onConsoleMessage}
  ///
  ///{@macro cygnus_core.CygnusPlatformBrowserEvents.onConsoleMessage.supported_platforms}
  @SupportedPlatforms(
    platforms: [
      AndroidPlatform(
        apiName: 'WebChromeClient.onConsoleMessage',
        apiUrl:
            'https://developer.android.com/reference/android/webkit/WebChromeClient#onConsoleMessage(android.webkit.CygnusConsoleMessage)',
      ),
      IOSPlatform(note: 'This event is implemented using JavaScript.'),
      MacOSPlatform(note: 'This event is implemented using JavaScript.'),
      WebPlatform(),
      WindowsPlatform(),
    ],
  )
  void onConsoleMessage(CygnusConsoleMessage consoleMessage) {}

  ///{@macro cygnus_core.CygnusPlatformWebViewCreationParams.shouldOverrideUrlLoading}
  ///
  ///{@macro cygnus_core.CygnusPlatformBrowserEvents.shouldOverrideUrlLoading.supported_platforms}
  @SupportedPlatforms(
    platforms: [
      AndroidPlatform(
        apiName: 'WebViewClient.shouldOverrideUrlLoading',
        apiUrl:
            'https://developer.android.com/reference/android/webkit/WebViewClient#shouldOverrideUrlLoading(android.webkit.WebView,%20java.lang.String)',
        note:
            """There isn't any way to load an URL for a frame that is not the main frame, so if the request is not for the main frame, the navigation is allowed by default.
However, if you want to cancel requests for subframes, you can use the [CygnusWebViewSettings.regexToCancelSubFramesLoading] setting
to write a Regular Expression that, if the url request of a subframe matches, then the request of that subframe is canceled.
Instead, the [CygnusWebViewSettings.regexToAllowSyncUrlLoading] setting could
be used to allow navigation requests synchronously, as this event is synchronous on native side
and the current plugin implementation will always cancel the current request and load a new request if
this event returns [CygnusNavigationActionPolicy.ALLOW] because Flutter method channels work only asynchronously.
Also, this event is not called for POST requests and is not called on the first page load.""",
      ),
      IOSPlatform(
        apiName: 'WKNavigationDelegate.webView',
        apiUrl:
            'https://developer.apple.com/documentation/webkit/wknavigationdelegate/1455641-webview',
      ),
      MacOSPlatform(
        apiName: 'WKNavigationDelegate.webView',
        apiUrl:
            'https://developer.apple.com/documentation/webkit/wknavigationdelegate/1455641-webview',
      ),
      WindowsPlatform(),
    ],
  )
  FutureOr<CygnusNavigationActionPolicy?>? shouldOverrideUrlLoading(
    CygnusNavigationAction navigationAction,
  ) {
    return null;
  }

  ///{@macro cygnus_core.CygnusPlatformWebViewCreationParams.onLaunchingExternalUriScheme}
  ///
  ///{@macro cygnus_core.CygnusPlatformBrowserEvents.onLaunchingExternalUriScheme.supported_platforms}
  @SupportedPlatforms(
    platforms: [
      WindowsPlatform(
        apiName: 'ICoreWebView2_18.add_LaunchingExternalUriScheme',
        apiUrl:
            'https://learn.microsoft.com/en-us/microsoft-edge/webview2/reference/win32/icorewebview2_18?view=webview2-1.0.2849.39#add_launchingexternalurischeme',
      ),
    ],
  )
  FutureOr<CygnusLaunchingExternalUriSchemeResponse?>? onLaunchingExternalUriScheme(
    CygnusLaunchingExternalUriSchemeRequest request,
  ) {
    return null;
  }

  ///{@macro cygnus_core.CygnusPlatformWebViewCreationParams.onLoadResource}
  ///
  ///{@macro cygnus_core.CygnusPlatformBrowserEvents.onLoadResource.supported_platforms}
  @SupportedPlatforms(
    platforms: [
      AndroidPlatform(note: 'This event is implemented using JavaScript.'),
      IOSPlatform(note: 'This event is implemented using JavaScript.'),
      MacOSPlatform(note: 'This event is implemented using JavaScript.'),
    ],
  )
  void onLoadResource(CygnusLoadedResource resource) {}

  ///{@macro cygnus_core.CygnusPlatformWebViewCreationParams.onScrollChanged}
  ///
  ///{@macro cygnus_core.CygnusPlatformBrowserEvents.onScrollChanged.supported_platforms}
  @SupportedPlatforms(
    platforms: [
      AndroidPlatform(
        apiName: 'WebView.onScrollChanged',
        apiUrl:
            'https://developer.android.com/reference/android/webkit/WebView#onScrollChanged(int,%20int,%20int,%20int)',
      ),
      IOSPlatform(
        apiName: 'UIScrollViewDelegate.scrollViewDidScroll',
        apiUrl:
            'https://developer.apple.com/documentation/uikit/uiscrollviewdelegate/1619392-scrollviewdidscroll',
      ),
      MacOSPlatform(note: 'This event is implemented using JavaScript.'),
    ],
  )
  void onScrollChanged(int x, int y) {}

  ///{@macro cygnus_core.CygnusPlatformWebViewCreationParams.onDownloadStart}
  ///
  ///{@macro cygnus_core.CygnusPlatformBrowserEvents.onDownloadStart.supported_platforms}
  @SupportedPlatforms(platforms: [AndroidPlatform(), IOSPlatform()])
  @Deprecated('Use onDownloadStarting instead')
  void onDownloadStart(Uri url) {}

  ///{@macro cygnus_core.CygnusPlatformWebViewCreationParams.onDownloadStartRequest}
  ///
  ///{@macro cygnus_core.CygnusPlatformBrowserEvents.onDownloadStartRequest.supported_platforms}
  @SupportedPlatforms(
    platforms: [AndroidPlatform(), IOSPlatform(), MacOSPlatform()],
  )
  @Deprecated('Use onDownloadStarting instead')
  void onDownloadStartRequest(CygnusDownloadStartRequest downloadStartRequest) {}

  ///{@macro cygnus_core.CygnusPlatformWebViewCreationParams.onDownloadStarting}
  ///
  ///{@macro cygnus_core.CygnusPlatformBrowserEvents.onDownloadStarting.supported_platforms}
  @SupportedPlatforms(
    platforms: [
      AndroidPlatform(
        apiName: 'WebView.setDownloadListener',
        apiUrl:
            '(https://developer.android.com/reference/android/webkit/WebView#setDownloadListener(android.webkit.DownloadListener)',
      ),
      IOSPlatform(),
      MacOSPlatform(),
      WindowsPlatform(
        apiName: 'ICoreWebView2_4.add_DownloadStarting',
        apiUrl:
            'https://learn.microsoft.com/en-us/microsoft-edge/webview2/reference/win32/icorewebview2_4?view=webview2-1.0.2849.39#add_downloadstarting',
      ),
    ],
  )
  FutureOr<CygnusDownloadStartResponse?>? onDownloadStarting(
    CygnusDownloadStartRequest downloadStartRequest,
  ) {
    return null;
  }

  ///{@macro cygnus_core.CygnusPlatformWebViewCreationParams.onLoadResourceCustomScheme}
  ///
  ///{@macro cygnus_core.CygnusPlatformBrowserEvents.onLoadResourceCustomScheme.supported_platforms}
  @SupportedPlatforms(
    platforms: [AndroidPlatform(), IOSPlatform(), MacOSPlatform()],
  )
  @Deprecated('Use onLoadResourceWithCustomScheme instead')
  FutureOr<CygnusCustomSchemeResponse?>? onLoadResourceCustomScheme(Uri url) {
    return null;
  }

  ///{@macro cygnus_core.CygnusPlatformWebViewCreationParams.onLoadResourceWithCustomScheme}
  ///
  ///{@macro cygnus_core.CygnusPlatformBrowserEvents.onLoadResourceWithCustomScheme.supported_platforms}
  @SupportedPlatforms(
    platforms: [
      AndroidPlatform(),
      IOSPlatform(
        apiName: 'WKURLSchemeHandler',
        apiUrl:
            'https://developer.apple.com/documentation/webkit/wkurlschemehandler',
      ),
      MacOSPlatform(
        apiName: 'WKURLSchemeHandler',
        apiUrl:
            'https://developer.apple.com/documentation/webkit/wkurlschemehandler',
      ),
      WindowsPlatform(),
    ],
  )
  FutureOr<CygnusCustomSchemeResponse?>? onLoadResourceWithCustomScheme(
    CygnusWebResourceRequest request,
  ) {
    return null;
  }

  ///{@macro cygnus_core.CygnusPlatformWebViewCreationParams.onCreateWindow}
  ///
  ///{@macro cygnus_core.CygnusPlatformBrowserEvents.onCreateWindow.supported_platforms}
  @SupportedPlatforms(
    platforms: [
      AndroidPlatform(
        apiName: 'WebChromeClient.onCreateWindow',
        apiUrl:
            'https://developer.android.com/reference/android/webkit/WebChromeClient#onCreateWindow(android.webkit.WebView,%20boolean,%20boolean,%20android.os.Message)',
        note:
            'You need to set [CygnusWebViewSettings.supportMultipleWindows] setting to `true`. Also, if the request has been created using JavaScript (`window.open()`), then there are some limitation: check the [CygnusNavigationAction] class.',
      ),
      IOSPlatform(
        apiName: 'WKUIDelegate.webView',
        apiUrl:
            'https://developer.apple.com/documentation/webkit/wkuidelegate/1536907-webview',
        note:
            """Setting these initial settings [CygnusWebViewSettings.supportZoom], [CygnusWebViewSettings.useOnLoadResource], [CygnusWebViewSettings.useShouldInterceptAjaxRequest],
[CygnusWebViewSettings.useShouldInterceptFetchRequest], [CygnusWebViewSettings.applicationNameForUserAgent], [CygnusWebViewSettings.javaScriptCanOpenWindowsAutomatically],
[CygnusWebViewSettings.javaScriptEnabled], [CygnusWebViewSettings.minimumFontSize], [CygnusWebViewSettings.preferredContentMode], [CygnusWebViewSettings.incognito],
[CygnusWebViewSettings.cacheEnabled], [CygnusWebViewSettings.mediaPlaybackRequiresUserGesture],
[CygnusWebViewSettings.resourceCustomSchemes], [CygnusWebViewSettings.sharedCookiesEnabled],
[CygnusWebViewSettings.enableViewportScale], [CygnusWebViewSettings.allowsAirPlayForMediaPlayback],
[CygnusWebViewSettings.allowsPictureInPictureMediaPlayback], [CygnusWebViewSettings.isFraudulentWebsiteWarningEnabled],
[CygnusWebViewSettings.allowsInlineMediaPlayback], [CygnusWebViewSettings.suppressesIncrementalRendering], [CygnusWebViewSettings.selectionGranularity],
[CygnusWebViewSettings.ignoresViewportScaleLimits], [CygnusWebViewSettings.limitsNavigationsToAppBoundDomains],
[CygnusWebViewSettings.upgradeKnownHostsToHTTPS],
will have no effect due to a `WKWebView` limitation when creating the new window WebView: it's impossible to return the new `WKWebView`
with a different `WKWebViewConfiguration` instance (see https://developer.apple.com/documentation/webkit/wkuidelegate/1536907-webview).
So, these options will be inherited from the caller WebView.
Also, note that calling [CygnusWebViewController.setSettings] method using the controller of the new created WebView,
it will update also the WebView options of the caller WebView.""",
      ),
      MacOSPlatform(
        apiName: 'WKUIDelegate.webView',
        apiUrl:
            'https://developer.apple.com/documentation/webkit/wkuidelegate/1536907-webview',
        note:
            """Setting these initial settings [CygnusWebViewSettings.supportZoom], [CygnusWebViewSettings.useOnLoadResource], [CygnusWebViewSettings.useShouldInterceptAjaxRequest],
[CygnusWebViewSettings.useShouldInterceptFetchRequest], [CygnusWebViewSettings.applicationNameForUserAgent], [CygnusWebViewSettings.javaScriptCanOpenWindowsAutomatically],
[CygnusWebViewSettings.javaScriptEnabled], [CygnusWebViewSettings.minimumFontSize], [CygnusWebViewSettings.preferredContentMode], [CygnusWebViewSettings.incognito],
[CygnusWebViewSettings.cacheEnabled], [CygnusWebViewSettings.mediaPlaybackRequiresUserGesture],
[CygnusWebViewSettings.resourceCustomSchemes], [CygnusWebViewSettings.sharedCookiesEnabled],
[CygnusWebViewSettings.enableViewportScale], [CygnusWebViewSettings.allowsAirPlayForMediaPlayback],
[CygnusWebViewSettings.allowsPictureInPictureMediaPlayback], [CygnusWebViewSettings.isFraudulentWebsiteWarningEnabled],
[CygnusWebViewSettings.allowsInlineMediaPlayback], [CygnusWebViewSettings.suppressesIncrementalRendering], [CygnusWebViewSettings.selectionGranularity],
[CygnusWebViewSettings.ignoresViewportScaleLimits], [CygnusWebViewSettings.limitsNavigationsToAppBoundDomains],
[CygnusWebViewSettings.upgradeKnownHostsToHTTPS],
will have no effect due to a `WKWebView` limitation when creating the new window WebView: it's impossible to return the new `WKWebView`
with a different `WKWebViewConfiguration` instance (see https://developer.apple.com/documentation/webkit/wkuidelegate/1536907-webview).
So, these options will be inherited from the caller WebView.
Also, note that calling [CygnusWebViewController.setSettings] method using the controller of the new created WebView,
it will update also the WebView options of the caller WebView.""",
      ),
      WindowsPlatform(
        apiName: 'ICoreWebView2.add_NewWindowRequested',
        apiUrl:
            'https://learn.microsoft.com/en-us/microsoft-edge/webview2/reference/win32/icorewebview2?view=webview2-1.0.2210.55#add_newwindowrequested',
      ),
    ],
  )
  FutureOr<bool?>? onCreateWindow(CygnusCreateWindowAction createWindowAction) {
    return null;
  }

  ///{@macro cygnus_core.CygnusPlatformWebViewCreationParams.onCloseWindow}
  ///
  ///{@macro cygnus_core.CygnusPlatformBrowserEvents.onCloseWindow.supported_platforms}
  @SupportedPlatforms(
    platforms: [
      AndroidPlatform(
        apiName: 'WebChromeClient.onCloseWindow',
        apiUrl:
            'https://developer.android.com/reference/android/webkit/WebChromeClient#onCloseWindow(android.webkit.WebView)',
      ),
      IOSPlatform(
        apiName: 'WKUIDelegate.webViewDidClose',
        apiUrl:
            'https://developer.apple.com/documentation/webkit/wkuidelegate/1537390-webviewdidclose',
      ),
      MacOSPlatform(
        apiName: 'WKUIDelegate.webViewDidClose',
        apiUrl:
            'https://developer.apple.com/documentation/webkit/wkuidelegate/1537390-webviewdidclose',
      ),
      WebPlatform(),
      WindowsPlatform(
        apiName: 'ICoreWebView2.add_WindowCloseRequested',
        apiUrl:
            'https://learn.microsoft.com/en-us/microsoft-edge/webview2/reference/win32/icorewebview2?view=webview2-1.0.2210.55#add_windowcloserequested',
      ),
    ],
  )
  void onCloseWindow() {}

  ///{@macro cygnus_core.CygnusPlatformWebViewCreationParams.onWindowFocus}
  ///
  ///{@macro cygnus_core.CygnusPlatformBrowserEvents.onWindowFocus.supported_platforms}
  @SupportedPlatforms(
    platforms: [AndroidPlatform(), IOSPlatform(), MacOSPlatform()],
  )
  void onWindowFocus() {}

  ///{@macro cygnus_core.CygnusPlatformWebViewCreationParams.onWindowBlur}
  ///
  ///{@macro cygnus_core.CygnusPlatformBrowserEvents.onWindowBlur.supported_platforms}
  @SupportedPlatforms(
    platforms: [AndroidPlatform(), IOSPlatform(), MacOSPlatform()],
  )
  void onWindowBlur() {}

  ///{@macro cygnus_core.CygnusPlatformWebViewCreationParams.onJsAlert}
  ///
  ///{@macro cygnus_core.CygnusPlatformBrowserEvents.onJsAlert.supported_platforms}
  @SupportedPlatforms(
    platforms: [
      AndroidPlatform(
        apiName: 'WebChromeClient.onJsAlert',
        apiUrl:
            'https://developer.android.com/reference/android/webkit/WebChromeClient#onJsAlert(android.webkit.WebView,%20java.lang.String,%20java.lang.String,%20android.webkit.JsResult)',
      ),
      IOSPlatform(
        apiName: 'WKUIDelegate.webView',
        apiUrl:
            'https://developer.apple.com/documentation/webkit/wkuidelegate/1537406-webview',
      ),
      MacOSPlatform(
        apiName: 'WKUIDelegate.webView',
        apiUrl:
            'https://developer.apple.com/documentation/webkit/wkuidelegate/1537406-webview',
      ),
    ],
  )
  FutureOr<CygnusJsAlertResponse?>? onJsAlert(CygnusJsAlertRequest jsAlertRequest) {
    return null;
  }

  ///{@macro cygnus_core.CygnusPlatformWebViewCreationParams.onJsConfirm}
  ///
  ///{@macro cygnus_core.CygnusPlatformBrowserEvents.onJsConfirm.supported_platforms}
  @SupportedPlatforms(
    platforms: [
      AndroidPlatform(
        apiName: 'WebChromeClient.onJsConfirm',
        apiUrl:
            'https://developer.android.com/reference/android/webkit/WebChromeClient#onJsConfirm(android.webkit.WebView,%20java.lang.String,%20java.lang.String,%20android.webkit.JsResult)',
      ),
      IOSPlatform(
        apiName: 'WKUIDelegate.webView',
        apiUrl:
            'https://developer.apple.com/documentation/webkit/wkuidelegate/1536489-webview',
      ),
      MacOSPlatform(
        apiName: 'WKUIDelegate.webView',
        apiUrl:
            'https://developer.apple.com/documentation/webkit/wkuidelegate/1536489-webview',
      ),
    ],
  )
  FutureOr<CygnusJsConfirmResponse?>? onJsConfirm(CygnusJsConfirmRequest jsConfirmRequest) {
    return null;
  }

  ///{@macro cygnus_core.CygnusPlatformWebViewCreationParams.onJsPrompt}
  ///
  ///{@macro cygnus_core.CygnusPlatformBrowserEvents.onJsPrompt.supported_platforms}
  @SupportedPlatforms(
    platforms: [
      AndroidPlatform(
        apiName: 'WebChromeClient.onJsPrompt',
        apiUrl:
            'https://developer.android.com/reference/android/webkit/WebChromeClient#onJsPrompt(android.webkit.WebView,%20java.lang.String,%20java.lang.String,%20java.lang.String,%20android.webkit.JsPromptResult)',
      ),
      IOSPlatform(
        apiName: 'WKUIDelegate.webView',
        apiUrl:
            'https://developer.apple.com/documentation/webkit/wkuidelegate/1538086-webview',
      ),
      MacOSPlatform(
        apiName: 'WKUIDelegate.webView',
        apiUrl:
            'https://developer.apple.com/documentation/webkit/wkuidelegate/1538086-webview',
      ),
    ],
  )
  FutureOr<CygnusJsPromptResponse?>? onJsPrompt(CygnusJsPromptRequest jsPromptRequest) {
    return null;
  }

  ///{@macro cygnus_core.CygnusPlatformWebViewCreationParams.onReceivedHttpAuthRequest}
  ///
  ///{@macro cygnus_core.CygnusPlatformBrowserEvents.onReceivedHttpAuthRequest.supported_platforms}
  @SupportedPlatforms(
    platforms: [
      AndroidPlatform(
        apiName: 'WebViewClient.onReceivedHttpAuthRequest',
        apiUrl:
            'https://developer.android.com/reference/android/webkit/WebViewClient#onReceivedHttpAuthRequest(android.webkit.WebView,%20android.webkit.HttpAuthHandler,%20java.lang.String,%20java.lang.String)',
      ),
      IOSPlatform(
        apiName: 'WKNavigationDelegate.webView',
        apiUrl:
            'https://developer.apple.com/documentation/webkit/wknavigationdelegate/1455638-webview',
      ),
      MacOSPlatform(
        apiName: 'WKNavigationDelegate.webView',
        apiUrl:
            'https://developer.apple.com/documentation/webkit/wknavigationdelegate/1455638-webview',
      ),
      WindowsPlatform(
        apiName: 'ICoreWebView2_10.add_BasicAuthenticationRequested',
        apiUrl:
            'https://learn.microsoft.com/en-us/microsoft-edge/webview2/reference/win32/icorewebview2_10?view=webview2-1.0.2849.39#add_basicauthenticationrequested',
      ),
    ],
  )
  FutureOr<CygnusHttpAuthResponse?>? onReceivedHttpAuthRequest(
    CygnusHttpAuthenticationChallenge challenge,
  ) {
    return null;
  }

  ///{@macro cygnus_core.CygnusPlatformWebViewCreationParams.onReceivedServerTrustAuthRequest}
  ///
  ///{@macro cygnus_core.CygnusPlatformBrowserEvents.onReceivedServerTrustAuthRequest.supported_platforms}
  @SupportedPlatforms(
    platforms: [
      AndroidPlatform(
        apiName: 'WebViewClient.onReceivedSslError',
        apiUrl:
            'https://developer.android.com/reference/android/webkit/WebViewClient#onReceivedSslError(android.webkit.WebView,%20android.webkit.SslErrorHandler,%20android.net.http.CygnusSslError)',
      ),
      IOSPlatform(
        apiName: 'WKNavigationDelegate.webView',
        apiUrl:
            'https://developer.apple.com/documentation/webkit/wknavigationdelegate/1455638-webview',
        note:
            """To override the certificate verification logic, you have to provide ATS (App Transport Security) exceptions in your iOS/macOS `Info.plist`.
See `NSAppTransportSecurity` in the [Information Property List Key Reference](https://developer.apple.com/library/content/documentation/General/Reference/InfoPlistKeyReference/Articles/CocoaKeys.html#//apple_ref/doc/uid/TP40009251-SW1) for details.""",
      ),
      MacOSPlatform(
        apiName: 'WKNavigationDelegate.webView',
        apiUrl:
            'https://developer.apple.com/documentation/webkit/wknavigationdelegate/1455638-webview',
        note:
            """To override the certificate verification logic, you have to provide ATS (App Transport Security) exceptions in your iOS/macOS `Info.plist`.
See `NSAppTransportSecurity` in the [Information Property List Key Reference](https://developer.apple.com/library/content/documentation/General/Reference/InfoPlistKeyReference/Articles/CocoaKeys.html#//apple_ref/doc/uid/TP40009251-SW1) for details.""",
      ),
      WindowsPlatform(
        apiName: 'ICoreWebView2_14.add_ServerCertificateErrorDetected',
        apiUrl:
            'https://learn.microsoft.com/en-us/microsoft-edge/webview2/reference/win32/icorewebview2_14?view=webview2-1.0.2792.45#add_servercertificateerrordetected',
      ),
    ],
  )
  FutureOr<CygnusServerTrustAuthResponse?>? onReceivedServerTrustAuthRequest(
    CygnusServerTrustChallenge challenge,
  ) {
    return null;
  }

  ///{@macro cygnus_core.CygnusPlatformWebViewCreationParams.onReceivedClientCertRequest}
  ///
  ///{@macro cygnus_core.CygnusPlatformBrowserEvents.onReceivedClientCertRequest.supported_platforms}
  @SupportedPlatforms(
    platforms: [
      AndroidPlatform(
        apiName: 'WebViewClient.onReceivedClientCertRequest',
        apiUrl:
            'https://developer.android.com/reference/android/webkit/WebViewClient#onReceivedClientCertRequest(android.webkit.WebView,%20android.webkit.ClientCertRequest)',
      ),
      IOSPlatform(
        apiName: 'WKNavigationDelegate.webView',
        apiUrl:
            'https://developer.apple.com/documentation/webkit/wknavigationdelegate/1455638-webview',
      ),
      MacOSPlatform(
        apiName: 'WKNavigationDelegate.webView',
        apiUrl:
            'https://developer.apple.com/documentation/webkit/wknavigationdelegate/1455638-webview',
      ),
      WindowsPlatform(
        apiName: 'ICoreWebView2_5.add_ClientCertificateRequested',
        apiUrl:
            'https://learn.microsoft.com/en-us/microsoft-edge/webview2/reference/win32/icorewebview2_5?view=webview2-1.0.2849.39#add_clientcertificaterequested',
      ),
    ],
  )
  FutureOr<CygnusClientCertResponse?>? onReceivedClientCertRequest(
    CygnusClientCertChallenge challenge,
  ) {
    return null;
  }

  ///{@macro cygnus_core.CygnusPlatformWebViewCreationParams.onFindResultReceived}
  ///
  ///{@macro cygnus_core.CygnusPlatformBrowserEvents.onFindResultReceived.supported_platforms}
  @SupportedPlatforms(
    platforms: [AndroidPlatform(), IOSPlatform(), MacOSPlatform()],
  )
  @Deprecated('Use CygnusFindInteractionController.onFindResultReceived instead')
  void onFindResultReceived(
    int activeMatchOrdinal,
    int numberOfMatches,
    bool isDoneCounting,
  ) {}

  ///{@macro cygnus_core.CygnusPlatformWebViewCreationParams.shouldInterceptAjaxRequest}
  ///
  ///{@macro cygnus_core.CygnusPlatformBrowserEvents.shouldInterceptAjaxRequest.supported_platforms}
  @SupportedPlatforms(
    platforms: [
      AndroidPlatform(
        note:
            """In order to be able to listen this event, check the [CygnusWebViewSettings.useShouldInterceptAjaxRequest] setting documentation.
Also, on Android that doesn't support the [CygnusWebViewFeature.DOCUMENT_START_SCRIPT], unlike iOS that has [WKUserScript](https://developer.apple.com/documentation/webkit/wkuserscript) that
can inject javascript code right after the document element is created but before any other content is loaded, in Android the javascript code
used to intercept ajax requests is loaded as soon as possible so it won't be instantaneous as iOS.
In that case, after the `window.addEventListener("flutterInAppWebViewPlatformReady")` event is dispatched, the ajax requests can be intercept for sure.""",
      ),
      IOSPlatform(),
      MacOSPlatform(),
    ],
  )
  FutureOr<CygnusAjaxRequest?>? shouldInterceptAjaxRequest(CygnusAjaxRequest ajaxRequest) {
    return null;
  }

  ///{@macro cygnus_core.CygnusPlatformWebViewCreationParams.onAjaxReadyStateChange}
  ///
  ///{@macro cygnus_core.CygnusPlatformBrowserEvents.onAjaxReadyStateChange.supported_platforms}
  @SupportedPlatforms(
    platforms: [
      AndroidPlatform(
        note:
            """In order to be able to listen this event, check the [CygnusWebViewSettings.useShouldInterceptAjaxRequest] and [CygnusWebViewSettings.useOnAjaxReadyStateChange] settings documentation.
Also, on Android that doesn't support the [CygnusWebViewFeature.DOCUMENT_START_SCRIPT], unlike iOS that has [WKUserScript](https://developer.apple.com/documentation/webkit/wkuserscript) that
can inject javascript code right after the document element is created but before any other content is loaded, in Android the javascript code
used to intercept ajax requests is loaded as soon as possible so it won't be instantaneous as iOS.
In that case, after the `window.addEventListener("flutterInAppWebViewPlatformReady")` event is dispatched, the ajax requests can be intercept for sure.""",
      ),
      IOSPlatform(),
      MacOSPlatform(),
    ],
  )
  FutureOr<CygnusAjaxRequestAction?>? onAjaxReadyStateChange(
    CygnusAjaxRequest ajaxRequest,
  ) {
    return null;
  }

  ///{@macro cygnus_core.CygnusPlatformWebViewCreationParams.onAjaxProgress}
  ///
  ///{@macro cygnus_core.CygnusPlatformBrowserEvents.onAjaxProgress.supported_platforms}
  @SupportedPlatforms(
    platforms: [
      AndroidPlatform(
        note:
            """In order to be able to listen this event, check the [CygnusWebViewSettings.useShouldInterceptAjaxRequest] and [CygnusWebViewSettings.useOnAjaxProgress] settings documentation.
Also, on Android that doesn't support the [CygnusWebViewFeature.DOCUMENT_START_SCRIPT], unlike iOS that has [WKUserScript](https://developer.apple.com/documentation/webkit/wkuserscript) that
can inject javascript code right after the document element is created but before any other content is loaded, in Android the javascript code
used to intercept ajax requests is loaded as soon as possible so it won't be instantaneous as iOS.
In that case, after the `window.addEventListener("flutterInAppWebViewPlatformReady")` event is dispatched, the ajax requests can be intercept for sure.""",
      ),
      IOSPlatform(),
      MacOSPlatform(),
    ],
  )
  FutureOr<CygnusAjaxRequestAction?>? onAjaxProgress(CygnusAjaxRequest ajaxRequest) {
    return null;
  }

  ///{@macro cygnus_core.CygnusPlatformWebViewCreationParams.shouldInterceptFetchRequest}
  ///
  ///{@macro cygnus_core.CygnusPlatformBrowserEvents.shouldInterceptFetchRequest.supported_platforms}
  @SupportedPlatforms(
    platforms: [
      AndroidPlatform(
        note:
            """In order to be able to listen this event, check the [CygnusWebViewSettings.useShouldInterceptFetchRequest] setting documentation.
Also, on Android that doesn't support the [CygnusWebViewFeature.DOCUMENT_START_SCRIPT], unlike iOS that has [WKUserScript](https://developer.apple.com/documentation/webkit/wkuserscript) that
can inject javascript code right after the document element is created but before any other content is loaded, in Android the javascript code
used to intercept ajax requests is loaded as soon as possible so it won't be instantaneous as iOS.
In that case, after the `window.addEventListener("flutterInAppWebViewPlatformReady")` event is dispatched, the ajax requests can be intercept for sure.""",
      ),
      IOSPlatform(),
      MacOSPlatform(),
    ],
  )
  FutureOr<CygnusFetchRequest?>? shouldInterceptFetchRequest(
    CygnusFetchRequest fetchRequest,
  ) {
    return null;
  }

  ///{@macro cygnus_core.CygnusPlatformWebViewCreationParams.onUpdateVisitedHistory}
  ///
  ///{@macro cygnus_core.CygnusPlatformBrowserEvents.onUpdateVisitedHistory.supported_platforms}
  @SupportedPlatforms(
    platforms: [
      AndroidPlatform(
        apiName: 'WebViewClient.doUpdateVisitedHistory',
        apiUrl:
            'https://developer.android.com/reference/android/webkit/WebViewClient#doUpdateVisitedHistory(android.webkit.WebView,%20java.lang.String,%20boolean)',
      ),
      IOSPlatform(),
      MacOSPlatform(),
      WindowsPlatform(
        apiName: 'ICoreWebView2.add_HistoryChanged',
        apiUrl:
            'https://learn.microsoft.com/en-us/microsoft-edge/webview2/reference/win32/icorewebview2?view=webview2-1.0.2210.55#add_historychanged',
      ),
    ],
  )
  void onUpdateVisitedHistory(
    CygnusWebUri? url,
    @SupportedPlatforms(platforms: [AndroidPlatform()]) bool? isReload,
  ) {}

  ///{@macro cygnus_core.CygnusPlatformWebViewCreationParams.onPrint}
  ///
  ///{@macro cygnus_core.CygnusPlatformBrowserEvents.onPrint.supported_platforms}
  @SupportedPlatforms(platforms: [AndroidPlatform(), IOSPlatform()])
  @Deprecated("Use onPrintRequest instead")
  void onPrint(Uri? url) {}

  ///{@macro cygnus_core.CygnusPlatformWebViewCreationParams.onPrintRequest}
  ///
  ///{@macro cygnus_core.CygnusPlatformBrowserEvents.onPrintRequest.supported_platforms}
  @SupportedPlatforms(
    platforms: [
      AndroidPlatform(
        apiName: 'View.scrollBy',
        apiUrl:
            'https://developer.android.com/reference/android/view/View#scrollBy(int,%20int)',
      ),
      IOSPlatform(
        apiName: 'UIScrollView.setContentOffset',
        apiUrl:
            'https://developer.apple.com/documentation/uikit/uiscrollview/1619400-setcontentoffset',
      ),
      MacOSPlatform(note: 'This method is implemented using JavaScript.'),
    ],
  )
  FutureOr<bool?>? onPrintRequest(
    CygnusWebUri? url,
    CygnusPlatformPrintJobController? printJobController,
  ) {
    return null;
  }

  ///{@macro cygnus_core.CygnusPlatformWebViewCreationParams.onLongPressHitTestResult}
  ///
  ///{@macro cygnus_core.CygnusPlatformBrowserEvents.onLongPressHitTestResult.supported_platforms}
  @SupportedPlatforms(
    platforms: [
      AndroidPlatform(
        apiName: 'View.setOnLongClickListener',
        apiUrl:
            'https://developer.android.com/reference/android/view/View#setOnLongClickListener(android.view.View.OnLongClickListener)',
      ),
      IOSPlatform(
        apiName: 'UILongPressGestureRecognizer',
        apiUrl:
            'https://developer.apple.com/documentation/uikit/uilongpressgesturerecognizer',
      ),
    ],
  )
  void onLongPressHitTestResult(CygnusWebViewHitTestResult hitTestResult) {}

  ///{@macro cygnus_core.CygnusPlatformWebViewCreationParams.onEnterFullscreen}
  ///
  ///{@macro cygnus_core.CygnusPlatformBrowserEvents.onEnterFullscreen.supported_platforms}
  @SupportedPlatforms(
    platforms: [
      AndroidPlatform(
        apiName: 'WebChromeClient.onShowCustomView',
        apiUrl:
            'https://developer.android.com/reference/android/webkit/WebChromeClient#onShowCustomView(android.view.View,%20android.webkit.WebChromeClient.CustomViewCallback)',
      ),
      IOSPlatform(
        apiName: 'UIWindow.didBecomeVisibleNotification',
        apiUrl:
            'https://developer.apple.com/documentation/uikit/uiwindow/1621621-didbecomevisiblenotification',
      ),
      MacOSPlatform(
        apiName: 'NSWindow.didEnterFullScreenNotification',
        apiUrl:
            'https://developer.apple.com/documentation/appkit/nswindow/1419651-didenterfullscreennotification',
      ),
      WindowsPlatform(
        apiName: 'ICoreWebView2.add_ContainsFullScreenElementChanged',
        apiUrl:
            'https://learn.microsoft.com/en-us/microsoft-edge/webview2/reference/win32/icorewebview2?view=webview2-1.0.2210.55#add_containsfullscreenelementchanged',
      ),
    ],
  )
  void onEnterFullscreen() {}

  ///{@macro cygnus_core.CygnusPlatformWebViewCreationParams.onExitFullscreen}
  ///
  ///{@macro cygnus_core.CygnusPlatformBrowserEvents.onExitFullscreen.supported_platforms}
  @SupportedPlatforms(
    platforms: [
      AndroidPlatform(
        apiName: 'WebChromeClient.onHideCustomView',
        apiUrl:
            'https://developer.android.com/reference/android/webkit/WebChromeClient#onHideCustomView()',
      ),
      IOSPlatform(
        apiName: 'UIWindow.didBecomeHiddenNotification',
        apiUrl:
            'https://developer.apple.com/documentation/uikit/uiwindow/1621617-didbecomehiddennotification',
      ),
      MacOSPlatform(
        apiName: 'NSWindow.didExitFullScreenNotification',
        apiUrl:
            'https://developer.apple.com/documentation/appkit/nswindow/1419177-didexitfullscreennotification',
      ),
      WindowsPlatform(
        apiName: 'ICoreWebView2.add_ContainsFullScreenElementChanged',
        apiUrl:
            'https://learn.microsoft.com/en-us/microsoft-edge/webview2/reference/win32/icorewebview2?view=webview2-1.0.2210.55#add_containsfullscreenelementchanged',
      ),
    ],
  )
  void onExitFullscreen() {}

  ///{@macro cygnus_core.CygnusPlatformWebViewCreationParams.onContentLoading}
  ///
  ///{@macro cygnus_core.CygnusPlatformBrowserEvents.onContentLoading.supported_platforms}
  @SupportedPlatforms(
    platforms: [
      WindowsPlatform(
        apiName: 'ICoreWebView2.add_ContentLoading',
        apiUrl:
            'https://learn.microsoft.com/en-us/microsoft-edge/webview2/reference/win32/icorewebview2?view=webview2-1.0.2210.55#add_contentloading',
      ),
    ],
  )
  void onContentLoading(CygnusWebUri? url) {}

  ///{@macro cygnus_core.CygnusPlatformWebViewCreationParams.onDOMContentLoaded}
  ///
  ///{@macro cygnus_core.CygnusPlatformBrowserEvents.onDOMContentLoaded.supported_platforms}
  @SupportedPlatforms(
    platforms: [
      WindowsPlatform(
        apiName: 'ICoreWebView2_2.add_DOMContentLoaded',
        apiUrl:
            'https://learn.microsoft.com/en-us/microsoft-edge/webview2/reference/win32/icorewebview2_2?view=webview2-1.0.2210.55#add_domcontentloaded',
      ),
    ],
  )
  void onDOMContentLoaded(CygnusWebUri? url) {}

  ///{@macro cygnus_core.CygnusPlatformWebViewCreationParams.onPageCommitVisible}
  ///
  ///{@macro cygnus_core.CygnusPlatformBrowserEvents.onPageCommitVisible.supported_platforms}
  @SupportedPlatforms(
    platforms: [
      AndroidPlatform(
        apiName: 'WebViewClient.onPageCommitVisible',
        apiUrl:
            'https://developer.android.com/reference/android/webkit/WebViewClient#onPageCommitVisible(android.webkit.WebView,%20java.lang.String)',
      ),
      IOSPlatform(
        apiName: 'WKNavigationDelegate.webView',
        apiUrl:
            'https://developer.apple.com/documentation/webkit/wknavigationdelegate/1455635-webview',
      ),
      MacOSPlatform(
        apiName: 'WKNavigationDelegate.webView',
        apiUrl:
            'https://developer.apple.com/documentation/webkit/wknavigationdelegate/1455635-webview',
      ),
    ],
  )
  void onPageCommitVisible(CygnusWebUri? url) {}

  ///{@macro cygnus_core.CygnusPlatformWebViewCreationParams.onTitleChanged}
  ///
  ///{@macro cygnus_core.CygnusPlatformBrowserEvents.onTitleChanged.supported_platforms}
  @SupportedPlatforms(
    platforms: [
      AndroidPlatform(
        apiName: 'WebChromeClient.onReceivedTitle',
        apiUrl:
            'https://developer.android.com/reference/android/webkit/WebChromeClient#onReceivedTitle(android.webkit.WebView,%20java.lang.String)',
      ),
      IOSPlatform(),
      MacOSPlatform(),
      WindowsPlatform(
        apiName: 'ICoreWebView2.add_DocumentTitleChanged',
        apiUrl:
            'https://learn.microsoft.com/en-us/microsoft-edge/webview2/reference/win32/icorewebview2?view=webview2-1.0.2210.55#add_documenttitlechanged',
      ),
    ],
  )
  void onTitleChanged(String? title) {}

  ///{@macro cygnus_core.CygnusPlatformWebViewCreationParams.onOverScrolled}
  ///
  ///{@macro cygnus_core.CygnusPlatformBrowserEvents.onOverScrolled.supported_platforms}
  @SupportedPlatforms(
    platforms: [
      AndroidPlatform(
        apiName: 'WebView.onOverScrolled',
        apiUrl:
            'https://developer.android.com/reference/android/webkit/WebView#onOverScrolled(int,%20int,%20boolean,%20boolean)',
      ),
      IOSPlatform(),
    ],
  )
  void onOverScrolled(int x, int y, bool clampedX, bool clampedY) {}

  ///{@macro cygnus_core.CygnusPlatformWebViewCreationParams.onZoomScaleChanged}
  ///
  ///{@macro cygnus_core.CygnusPlatformBrowserEvents.onZoomScaleChanged.supported_platforms}
  @SupportedPlatforms(
    platforms: [
      AndroidPlatform(
        apiName: 'WebViewClient.onScaleChanged',
        apiUrl:
            'https://developer.android.com/reference/android/webkit/WebViewClient#onScaleChanged(android.webkit.WebView,%20float,%20float)',
      ),
      IOSPlatform(
        apiName: 'UIScrollViewDelegate.scrollViewDidZoom',
        apiUrl:
            'https://developer.apple.com/documentation/uikit/uiscrollviewdelegate/1619409-scrollviewdidzoom',
      ),
      WindowsPlatform(
        apiName: 'ICoreWebView2Controller.add_ZoomFactorChanged',
        apiUrl:
            'https://learn.microsoft.com/en-us/microsoft-edge/webview2/reference/win32/icorewebview2controller?view=webview2-1.0.2849.39#add_zoomfactorchanged',
      ),
    ],
  )
  void onZoomScaleChanged(double oldScale, double newScale) {}

  ///{@macro cygnus_core.CygnusPlatformWebViewCreationParams.androidOnSafeBrowsingHit}
  ///
  ///{@macro cygnus_core.CygnusPlatformBrowserEvents.androidOnSafeBrowsingHit.supported_platforms}
  @SupportedPlatforms(platforms: [AndroidPlatform()])
  @Deprecated("Use onSafeBrowsingHit instead")
  FutureOr<CygnusSafeBrowsingResponse?>? androidOnSafeBrowsingHit(
    Uri url,
    CygnusSafeBrowsingThreat? threatType,
  ) {
    return null;
  }

  ///{@macro cygnus_core.CygnusPlatformWebViewCreationParams.onSafeBrowsingHit}
  ///
  ///{@macro cygnus_core.CygnusPlatformBrowserEvents.onSafeBrowsingHit.supported_platforms}
  @SupportedPlatforms(
    platforms: [
      AndroidPlatform(
        apiName: 'WebViewClient.onSafeBrowsingHit',
        apiUrl:
            'https://developer.android.com/reference/android/webkit/WebViewClient#onSafeBrowsingHit(android.webkit.WebView,%20android.webkit.CygnusWebResourceRequest,%20int,%20android.webkit.CygnusSafeBrowsingResponse)',
        available: '27',
      ),
    ],
  )
  FutureOr<CygnusSafeBrowsingResponse?>? onSafeBrowsingHit(
    CygnusWebUri url,
    CygnusSafeBrowsingThreat? threatType,
  ) {
    return null;
  }

  ///{@macro cygnus_core.CygnusPlatformWebViewCreationParams.androidOnPermissionRequest}
  ///
  ///{@macro cygnus_core.CygnusPlatformBrowserEvents.androidOnPermissionRequest.supported_platforms}
  @SupportedPlatforms(platforms: [AndroidPlatform()])
  @Deprecated("Use onPermissionRequest instead")
  FutureOr<CygnusPermissionRequestResponse?>? androidOnPermissionRequest(
    String origin,
    List<String> resources,
  ) {
    return null;
  }

  ///{@macro cygnus_core.CygnusPlatformWebViewCreationParams.onPermissionRequest}
  ///
  ///{@macro cygnus_core.CygnusPlatformBrowserEvents.onPermissionRequest.supported_platforms}
  @SupportedPlatforms(
    platforms: [
      AndroidPlatform(
        apiName: 'WebChromeClient.onPermissionRequest',
        apiUrl:
            'https://developer.android.com/reference/android/webkit/WebChromeClient#onPermissionRequest(android.webkit.CygnusPermissionRequest)',
        available: '21',
      ),
      IOSPlatform(
        available: '15.0',
        note:
            'The default [CygnusPermissionResponse.action] is [CygnusPermissionResponseAction.PROMPT].',
      ),
      MacOSPlatform(
        available: '12.0',
        note:
            'The default [CygnusPermissionResponse.action] is [CygnusPermissionResponseAction.PROMPT].',
      ),
      WindowsPlatform(
        apiName: 'ICoreWebView2.add_PermissionRequested',
        apiUrl:
            'https://learn.microsoft.com/en-us/microsoft-edge/webview2/reference/win32/icorewebview2?view=webview2-1.0.2210.55#add_permissionrequested',
      ),
    ],
  )
  FutureOr<CygnusPermissionResponse?>? onPermissionRequest(
    CygnusPermissionRequest permissionRequest,
  ) {
    return null;
  }

  ///{@macro cygnus_core.CygnusPlatformWebViewCreationParams.androidOnGeolocationPermissionsShowPrompt}
  ///
  ///{@macro cygnus_core.CygnusPlatformBrowserEvents.androidOnGeolocationPermissionsShowPrompt.supported_platforms}
  @SupportedPlatforms(platforms: [AndroidPlatform()])
  @Deprecated("Use onGeolocationPermissionsShowPrompt instead")
  FutureOr<CygnusGeolocationPermissionShowPromptResponse?>?
  androidOnGeolocationPermissionsShowPrompt(String origin) {
    return null;
  }

  ///{@macro cygnus_core.CygnusPlatformWebViewCreationParams.onGeolocationPermissionsShowPrompt}
  ///
  ///{@macro cygnus_core.CygnusPlatformBrowserEvents.onGeolocationPermissionsShowPrompt.supported_platforms}
  @SupportedPlatforms(
    platforms: [
      AndroidPlatform(
        apiName: 'WebChromeClient.onGeolocationPermissionsShowPrompt',
        apiUrl:
            'https://developer.android.com/reference/android/webkit/WebChromeClient#onGeolocationPermissionsShowPrompt(java.lang.String,%20android.webkit.GeolocationPermissions.Callback)',
      ),
    ],
  )
  FutureOr<CygnusGeolocationPermissionShowPromptResponse?>?
  onGeolocationPermissionsShowPrompt(String origin) {
    return null;
  }

  ///{@macro cygnus_core.CygnusPlatformWebViewCreationParams.androidOnGeolocationPermissionsHidePrompt}
  ///
  ///{@macro cygnus_core.CygnusPlatformBrowserEvents.androidOnGeolocationPermissionsHidePrompt.supported_platforms}
  @SupportedPlatforms(platforms: [AndroidPlatform()])
  @Deprecated("Use onGeolocationPermissionsHidePrompt instead")
  void androidOnGeolocationPermissionsHidePrompt() {}

  ///{@macro cygnus_core.CygnusPlatformWebViewCreationParams.onGeolocationPermissionsHidePrompt}
  ///
  ///{@macro cygnus_core.CygnusPlatformBrowserEvents.onGeolocationPermissionsHidePrompt.supported_platforms}
  @SupportedPlatforms(
    platforms: [
      AndroidPlatform(
        apiName: 'WebChromeClient.onGeolocationPermissionsHidePrompt',
        apiUrl:
            'https://developer.android.com/reference/android/webkit/WebChromeClient#onGeolocationPermissionsHidePrompt()',
      ),
    ],
  )
  void onGeolocationPermissionsHidePrompt() {}

  ///{@macro cygnus_core.CygnusPlatformWebViewCreationParams.androidShouldInterceptRequest}
  ///
  ///{@macro cygnus_core.CygnusPlatformBrowserEvents.androidShouldInterceptRequest.supported_platforms}
  @SupportedPlatforms(platforms: [AndroidPlatform()])
  @Deprecated("Use shouldInterceptRequest instead")
  FutureOr<CygnusWebResourceResponse?>? androidShouldInterceptRequest(
    CygnusWebResourceRequest request,
  ) {
    return null;
  }

  ///{@macro cygnus_core.CygnusPlatformWebViewCreationParams.shouldInterceptRequest}
  ///
  ///{@macro cygnus_core.CygnusPlatformBrowserEvents.shouldInterceptRequest.supported_platforms}
  @SupportedPlatforms(
    platforms: [
      AndroidPlatform(
        apiName: 'WebViewClient.shouldInterceptRequest',
        apiUrl:
            'https://developer.android.com/reference/android/webkit/WebViewClient#shouldInterceptRequest(android.webkit.WebView,%20android.webkit.CygnusWebResourceRequest)',
      ),
      WindowsPlatform(
        apiName: 'ICoreWebView2.add_WebResourceRequested',
        apiUrl:
            'https://learn.microsoft.com/en-us/microsoft-edge/webview2/reference/win32/icorewebview2?view=webview2-1.0.2478.35#add_webresourcerequested',
      ),
    ],
  )
  FutureOr<CygnusWebResourceResponse?>? shouldInterceptRequest(
    CygnusWebResourceRequest request,
  ) {
    return null;
  }

  ///{@macro cygnus_core.CygnusPlatformWebViewCreationParams.androidOnRenderProcessUnresponsive}
  ///
  ///{@macro cygnus_core.CygnusPlatformBrowserEvents.androidOnRenderProcessUnresponsive.supported_platforms}
  @SupportedPlatforms(platforms: [AndroidPlatform()])
  @Deprecated("Use onRenderProcessUnresponsive instead")
  FutureOr<CygnusWebViewRenderProcessAction?>? androidOnRenderProcessUnresponsive(
    Uri? url,
  ) {
    return null;
  }

  ///{@macro cygnus_core.CygnusPlatformWebViewCreationParams.onRenderProcessUnresponsive}
  ///
  ///{@macro cygnus_core.CygnusPlatformBrowserEvents.onRenderProcessUnresponsive.supported_platforms}
  @SupportedPlatforms(
    platforms: [
      AndroidPlatform(
        apiName: 'WebViewRenderProcessClient.onRenderProcessUnresponsive',
        apiUrl:
            'https://developer.android.com/reference/android/webkit/WebViewRenderProcessClient#onRenderProcessUnresponsive(android.webkit.WebView,%20android.webkit.WebViewRenderProcess)',
        available: '29',
      ),
      WindowsPlatform(
        apiName: 'ICoreWebView2.add_ProcessFailed',
        apiUrl:
            'https://learn.microsoft.com/en-us/microsoft-edge/webview2/reference/win32/icorewebview2?view=webview2-1.0.2849.39#add_processfailed',
      ),
    ],
  )
  FutureOr<CygnusWebViewRenderProcessAction?>? onRenderProcessUnresponsive(
    CygnusWebUri? url,
  ) {
    return null;
  }

  ///{@macro cygnus_core.CygnusPlatformWebViewCreationParams.androidOnRenderProcessResponsive}
  ///
  ///{@macro cygnus_core.CygnusPlatformBrowserEvents.androidOnRenderProcessResponsive.supported_platforms}
  @SupportedPlatforms(platforms: [AndroidPlatform()])
  @Deprecated("Use onRenderProcessResponsive instead")
  FutureOr<CygnusWebViewRenderProcessAction?>? androidOnRenderProcessResponsive(
    Uri? url,
  ) {
    return null;
  }

  ///{@macro cygnus_core.CygnusPlatformWebViewCreationParams.onRenderProcessResponsive}
  ///
  ///{@macro cygnus_core.CygnusPlatformBrowserEvents.onRenderProcessResponsive.supported_platforms}
  @SupportedPlatforms(
    platforms: [
      AndroidPlatform(
        apiName: 'WebViewRenderProcessClient.onRenderProcessResponsive',
        apiUrl:
            'https://developer.android.com/reference/android/webkit/WebViewRenderProcessClient#onRenderProcessResponsive(android.webkit.WebView,%20android.webkit.WebViewRenderProcess)',
        available: '29',
      ),
    ],
  )
  FutureOr<CygnusWebViewRenderProcessAction?>? onRenderProcessResponsive(
    CygnusWebUri? url,
  ) {
    return null;
  }

  ///{@macro cygnus_core.CygnusPlatformWebViewCreationParams.androidOnRenderProcessGone}
  ///
  ///{@macro cygnus_core.CygnusPlatformBrowserEvents.androidOnRenderProcessGone.supported_platforms}
  @SupportedPlatforms(platforms: [AndroidPlatform()])
  @Deprecated("Use onRenderProcessGone instead")
  void androidOnRenderProcessGone(CygnusRenderProcessGoneDetail detail) {}

  ///{@macro cygnus_core.CygnusPlatformWebViewCreationParams.onRenderProcessGone}
  ///
  ///{@macro cygnus_core.CygnusPlatformBrowserEvents.onRenderProcessGone.supported_platforms}
  @SupportedPlatforms(
    platforms: [
      AndroidPlatform(
        apiName: 'WebViewClient.onRenderProcessGone',
        apiUrl:
            'https://developer.android.com/reference/android/webkit/WebViewClient#onRenderProcessGone(android.webkit.WebView,%20android.webkit.CygnusRenderProcessGoneDetail)',
        available: '26',
      ),
      WindowsPlatform(
        apiName: 'ICoreWebView2.add_ProcessFailed',
        apiUrl:
            'https://learn.microsoft.com/en-us/microsoft-edge/webview2/reference/win32/icorewebview2?view=webview2-1.0.2849.39#add_processfailed',
      ),
    ],
  )
  void onRenderProcessGone(CygnusRenderProcessGoneDetail detail) {}

  ///{@macro cygnus_core.CygnusPlatformWebViewCreationParams.androidOnFormResubmission}
  ///
  ///{@macro cygnus_core.CygnusPlatformBrowserEvents.androidOnFormResubmission.supported_platforms}
  @SupportedPlatforms(platforms: [AndroidPlatform()])
  @Deprecated('Use onFormResubmission instead')
  FutureOr<CygnusFormResubmissionAction?>? androidOnFormResubmission(Uri? url) {
    return null;
  }

  ///{@macro cygnus_core.CygnusPlatformWebViewCreationParams.onFormResubmission}
  ///
  ///{@macro cygnus_core.CygnusPlatformBrowserEvents.onFormResubmission.supported_platforms}
  @SupportedPlatforms(
    platforms: [
      AndroidPlatform(
        apiName: 'WebViewClient.onFormResubmission',
        apiUrl:
            'https://developer.android.com/reference/android/webkit/WebViewClient#onFormResubmission(android.webkit.WebView,%20android.os.Message,%20android.os.Message)',
      ),
    ],
  )
  FutureOr<CygnusFormResubmissionAction?>? onFormResubmission(CygnusWebUri? url) {
    return null;
  }

  ///{@macro cygnus_core.CygnusPlatformWebViewCreationParams.androidOnScaleChanged}
  ///
  ///{@macro cygnus_core.CygnusPlatformBrowserEvents.androidOnScaleChanged.supported_platforms}
  @SupportedPlatforms(platforms: [AndroidPlatform()])
  @Deprecated('Use onZoomScaleChanged instead')
  void androidOnScaleChanged(double oldScale, double newScale) {}

  ///{@macro cygnus_core.CygnusPlatformWebViewCreationParams.androidOnReceivedIcon}
  ///
  ///{@macro cygnus_core.CygnusPlatformBrowserEvents.androidOnReceivedIcon.supported_platforms}
  @SupportedPlatforms(platforms: [AndroidPlatform()])
  @Deprecated('Use onReceivedIcon instead')
  void androidOnReceivedIcon(Uint8List icon) {}

  ///{@macro cygnus_core.CygnusPlatformWebViewCreationParams.onReceivedIcon}
  ///
  ///{@macro cygnus_core.CygnusPlatformBrowserEvents.onReceivedIcon.supported_platforms}
  @SupportedPlatforms(
    platforms: [
      AndroidPlatform(
        apiName: 'WebChromeClient.onReceivedIcon',
        apiUrl:
            'https://developer.android.com/reference/android/webkit/WebChromeClient#onReceivedIcon(android.webkit.WebView,%20android.graphics.Bitmap)',
      ),
    ],
  )
  @Deprecated('Use onFaviconChanged instead')
  void onReceivedIcon(Uint8List icon) {}

  ///{@macro cygnus_core.CygnusPlatformWebViewCreationParams.onFaviconChanged}
  ///
  ///{@macro cygnus_core.CygnusPlatformBrowserEvents.onFaviconChanged.supported_platforms}
  @SupportedPlatforms(
    platforms: [
      AndroidPlatform(
        apiName: 'WebChromeClient.onReceivedIcon',
        apiUrl:
            'https://developer.android.com/reference/android/webkit/WebChromeClient#onReceivedIcon(android.webkit.WebView,%20android.graphics.Bitmap)',
      ),
      WindowsPlatform(
        apiName: 'ICoreWebView2_15.add_FaviconChanged',
        apiUrl:
            'https://learn.microsoft.com/en-us/microsoft-edge/webview2/reference/win32/icorewebview2_15?view=webview2-1.0.2849.39#add_faviconchanged',
      ),
    ],
  )
  void onFaviconChanged(CygnusFaviconChangedRequest faviconChangedRequest) {}

  ///{@macro cygnus_core.CygnusPlatformWebViewCreationParams.androidOnReceivedTouchIconUrl}
  ///
  ///{@macro cygnus_core.CygnusPlatformBrowserEvents.androidOnReceivedTouchIconUrl.supported_platforms}
  @SupportedPlatforms(platforms: [AndroidPlatform()])
  @Deprecated('Use onReceivedTouchIconUrl instead')
  void androidOnReceivedTouchIconUrl(Uri url, bool precomposed) {}

  ///{@macro cygnus_core.CygnusPlatformWebViewCreationParams.androidOnReceivedTouchIconUrl}
  ///
  ///{@macro cygnus_core.CygnusPlatformBrowserEvents.androidOnReceivedTouchIconUrl.supported_platforms}
  @SupportedPlatforms(
    platforms: [
      AndroidPlatform(
        apiName: 'WebChromeClient.onReceivedTouchIconUrl',
        apiUrl:
            'https://developer.android.com/reference/android/webkit/WebChromeClient#onReceivedTouchIconUrl(android.webkit.WebView,%20java.lang.String,%20boolean)',
      ),
    ],
  )
  void onReceivedTouchIconUrl(CygnusWebUri url, bool precomposed) {}

  ///{@macro cygnus_core.CygnusPlatformWebViewCreationParams.androidOnJsBeforeUnload}
  ///
  ///{@macro cygnus_core.CygnusPlatformBrowserEvents.androidOnJsBeforeUnload.supported_platforms}
  @SupportedPlatforms(platforms: [AndroidPlatform()])
  @Deprecated('Use onJsBeforeUnload instead')
  FutureOr<CygnusJsBeforeUnloadResponse?>? androidOnJsBeforeUnload(
    CygnusJsBeforeUnloadRequest jsBeforeUnloadRequest,
  ) {
    return null;
  }

  ///{@macro cygnus_core.CygnusPlatformWebViewCreationParams.onJsBeforeUnload}
  ///
  ///{@macro cygnus_core.CygnusPlatformBrowserEvents.onJsBeforeUnload.supported_platforms}
  FutureOr<CygnusJsBeforeUnloadResponse?>? onJsBeforeUnload(
    CygnusJsBeforeUnloadRequest jsBeforeUnloadRequest,
  ) {
    return null;
  }

  ///{@macro cygnus_core.CygnusPlatformWebViewCreationParams.androidOnReceivedLoginRequest}
  ///
  ///{@macro cygnus_core.CygnusPlatformBrowserEvents.androidOnReceivedLoginRequest.supported_platforms}
  @SupportedPlatforms(platforms: [AndroidPlatform()])
  @Deprecated('Use onReceivedLoginRequest instead')
  void androidOnReceivedLoginRequest(CygnusLoginRequest loginRequest) {}

  ///{@macro cygnus_core.CygnusPlatformWebViewCreationParams.onReceivedLoginRequest}
  ///
  ///{@macro cygnus_core.CygnusPlatformBrowserEvents.onReceivedLoginRequest.supported_platforms}
  @SupportedPlatforms(
    platforms: [
      AndroidPlatform(
        apiName: 'WebViewClient.onReceivedLoginRequest',
        apiUrl:
            'https://developer.android.com/reference/android/webkit/WebViewClient#onReceivedLoginRequest(android.webkit.WebView,%20java.lang.String,%20java.lang.String,%20java.lang.String)',
      ),
    ],
  )
  void onReceivedLoginRequest(CygnusLoginRequest loginRequest) {}

  ///{@macro cygnus_core.CygnusPlatformWebViewCreationParams.onPermissionRequestCanceled}
  ///
  ///{@macro cygnus_core.CygnusPlatformBrowserEvents.onPermissionRequestCanceled.supported_platforms}
  @SupportedPlatforms(
    platforms: [
      AndroidPlatform(
        apiName: 'WebChromeClient.onPermissionRequestCanceled',
        apiUrl:
            'https://developer.android.com/reference/android/webkit/WebChromeClient#onPermissionRequestCanceled(android.webkit.CygnusPermissionRequest)',
        available: '21',
      ),
    ],
  )
  void onPermissionRequestCanceled(CygnusPermissionRequest permissionRequest) {}

  ///{@macro cygnus_core.CygnusPlatformWebViewCreationParams.onRequestFocus}
  ///
  ///{@macro cygnus_core.CygnusPlatformBrowserEvents.onRequestFocus.supported_platforms}
  @SupportedPlatforms(
    platforms: [
      AndroidPlatform(
        apiName: 'WebChromeClient.onRequestFocus',
        apiUrl:
            'https://developer.android.com/reference/android/webkit/WebChromeClient#onRequestFocus(android.webkit.WebView)',
      ),
    ],
  )
  void onRequestFocus() {}

  ///{@macro cygnus_core.CygnusPlatformWebViewCreationParams.iosOnWebContentProcessDidTerminate}
  ///
  ///{@macro cygnus_core.CygnusPlatformBrowserEvents.iosOnWebContentProcessDidTerminate.supported_platforms}
  @SupportedPlatforms(platforms: [IOSPlatform()])
  @Deprecated('Use onWebContentProcessDidTerminate instead')
  void iosOnWebContentProcessDidTerminate() {}

  ///{@macro cygnus_core.CygnusPlatformWebViewCreationParams.onWebContentProcessDidTerminate}
  ///
  ///{@macro cygnus_core.CygnusPlatformBrowserEvents.onWebContentProcessDidTerminate.supported_platforms}
  @SupportedPlatforms(
    platforms: [
      IOSPlatform(
        apiName: 'WKNavigationDelegate.webViewWebContentProcessDidTerminate',
        apiUrl:
            'https://developer.apple.com/documentation/webkit/wknavigationdelegate/1455639-webviewwebcontentprocessdidtermi',
      ),
      MacOSPlatform(
        apiName: 'WKNavigationDelegate.webViewWebContentProcessDidTerminate',
        apiUrl:
            'https://developer.apple.com/documentation/webkit/wknavigationdelegate/1455639-webviewwebcontentprocessdidtermi',
      ),
      WindowsPlatform(
        apiName: 'ICoreWebView2.add_ProcessFailed',
        apiUrl:
            'https://learn.microsoft.com/en-us/microsoft-edge/webview2/reference/win32/icorewebview2?view=webview2-1.0.2849.39#add_processfailed',
      ),
    ],
  )
  void onWebContentProcessDidTerminate() {}

  ///{@macro cygnus_core.CygnusPlatformWebViewCreationParams.iosOnDidReceiveServerRedirectForProvisionalNavigation}
  ///
  ///{@macro cygnus_core.CygnusPlatformBrowserEvents.iosOnDidReceiveServerRedirectForProvisionalNavigation.supported_platforms}
  @SupportedPlatforms(platforms: [IOSPlatform()])
  @Deprecated('Use onDidReceiveServerRedirectForProvisionalNavigation instead')
  void iosOnDidReceiveServerRedirectForProvisionalNavigation() {}

  ///{@macro cygnus_core.CygnusPlatformWebViewCreationParams.onDidReceiveServerRedirectForProvisionalNavigation}
  ///
  ///{@macro cygnus_core.CygnusPlatformBrowserEvents.onDidReceiveServerRedirectForProvisionalNavigation.supported_platforms}
  @SupportedPlatforms(
    platforms: [
      IOSPlatform(
        apiName: 'WKNavigationDelegate.webView',
        apiUrl:
            'https://developer.apple.com/documentation/webkit/wknavigationdelegate/1455627-webview',
      ),
      MacOSPlatform(
        apiName: 'WKNavigationDelegate.webView',
        apiUrl:
            'https://developer.apple.com/documentation/webkit/wknavigationdelegate/1455627-webview',
      ),
    ],
  )
  void onDidReceiveServerRedirectForProvisionalNavigation() {}

  ///{@macro cygnus_core.CygnusPlatformWebViewCreationParams.iosOnNavigationResponse}
  ///
  ///{@macro cygnus_core.CygnusPlatformBrowserEvents.iosOnNavigationResponse.supported_platforms}
  @SupportedPlatforms(platforms: [IOSPlatform()])
  @Deprecated('Use onNavigationResponse instead')
  FutureOr<CygnusIOSNavigationResponseAction?>? iosOnNavigationResponse(
    CygnusIOSWKNavigationResponse navigationResponse,
  ) {
    return null;
  }

  ///{@macro cygnus_core.CygnusPlatformWebViewCreationParams.onNavigationResponse}
  ///
  ///{@macro cygnus_core.CygnusPlatformBrowserEvents.onNavigationResponse.supported_platforms}
  @SupportedPlatforms(
    platforms: [
      IOSPlatform(
        apiName: 'WKNavigationDelegate.webView',
        apiUrl:
            'https://developer.apple.com/documentation/webkit/wknavigationdelegate/1455643-webview',
      ),
      MacOSPlatform(
        apiName: 'WKNavigationDelegate.webView',
        apiUrl:
            'https://developer.apple.com/documentation/webkit/wknavigationdelegate/1455643-webview',
      ),
    ],
  )
  FutureOr<CygnusNavigationResponseAction?>? onNavigationResponse(
    CygnusNavigationResponse navigationResponse,
  ) {
    return null;
  }

  ///{@macro cygnus_core.CygnusPlatformWebViewCreationParams.iosShouldAllowDeprecatedTLS}
  ///
  ///{@macro cygnus_core.CygnusPlatformBrowserEvents.iosShouldAllowDeprecatedTLS.supported_platforms}
  @SupportedPlatforms(platforms: [IOSPlatform()])
  @Deprecated('Use shouldAllowDeprecatedTLS instead')
  FutureOr<CygnusIOSShouldAllowDeprecatedTLSAction?>? iosShouldAllowDeprecatedTLS(
    CygnusURLAuthenticationChallenge challenge,
  ) {
    return null;
  }

  ///{@macro cygnus_core.CygnusPlatformWebViewCreationParams.shouldAllowDeprecatedTLS}
  ///
  ///{@macro cygnus_core.CygnusPlatformBrowserEvents.shouldAllowDeprecatedTLS.supported_platforms}
  @SupportedPlatforms(
    platforms: [
      IOSPlatform(
        apiName: 'WKNavigationDelegate.webView',
        apiUrl:
            'https://developer.apple.com/documentation/webkit/wknavigationdelegate/3601237-webview',
        available: '14.0',
      ),
      MacOSPlatform(
        apiName: 'WKNavigationDelegate.webView',
        apiUrl:
            'https://developer.apple.com/documentation/webkit/wknavigationdelegate/3601237-webview',
        available: '11.0',
      ),
    ],
  )
  FutureOr<CygnusShouldAllowDeprecatedTLSAction?>? shouldAllowDeprecatedTLS(
    CygnusURLAuthenticationChallenge challenge,
  ) {
    return null;
  }

  ///{@macro cygnus_core.CygnusPlatformWebViewCreationParams.onCameraCaptureStateChanged}
  ///
  ///{@macro cygnus_core.CygnusPlatformBrowserEvents.onCameraCaptureStateChanged.supported_platforms}
  @SupportedPlatforms(
    platforms: [
      IOSPlatform(available: '15.0'),
      MacOSPlatform(available: '12.0'),
    ],
  )
  void onCameraCaptureStateChanged(
    CygnusMediaCaptureState? oldState,
    CygnusMediaCaptureState? newState,
  ) {}

  ///{@macro cygnus_core.CygnusPlatformWebViewCreationParams.onMicrophoneCaptureStateChanged}
  ///
  ///{@macro cygnus_core.CygnusPlatformBrowserEvents.onMicrophoneCaptureStateChanged.supported_platforms}
  @SupportedPlatforms(
    platforms: [
      IOSPlatform(available: '15.0'),
      MacOSPlatform(available: '12.0'),
    ],
  )
  void onMicrophoneCaptureStateChanged(
    CygnusMediaCaptureState? oldState,
    CygnusMediaCaptureState? newState,
  ) {}

  ///{@macro cygnus_core.CygnusPlatformWebViewCreationParams.onContentSizeChanged}
  ///
  ///{@macro cygnus_core.CygnusPlatformBrowserEvents.onContentSizeChanged.supported_platforms}
  @SupportedPlatforms(platforms: [IOSPlatform()])
  void onContentSizeChanged(Size oldContentSize, Size newContentSize) {}

  ///{@macro cygnus_core.CygnusPlatformWebViewCreationParams.onProcessFailed}
  ///
  ///{@macro cygnus_core.CygnusPlatformBrowserEvents.onProcessFailed.supported_platforms}
  @SupportedPlatforms(
    platforms: [
      WindowsPlatform(
        apiName: 'ICoreWebView2.add_ProcessFailed',
        apiUrl:
            'https://learn.microsoft.com/en-us/microsoft-edge/webview2/reference/win32/icorewebview2?view=webview2-1.0.2849.39#add_processfailed',
      ),
    ],
  )
  void onProcessFailed(CygnusProcessFailedDetail detail) {}

  ///{@macro cygnus_core.CygnusPlatformWebViewCreationParams.onNotificationReceived}
  ///
  ///{@macro cygnus_core.CygnusPlatformBrowserEvents.onNotificationReceived.supported_platforms}
  @SupportedPlatforms(
    platforms: [
      WindowsPlatform(
        apiName: 'ICoreWebView2_24.add_NotificationReceived',
        apiUrl:
            'https://learn.microsoft.com/en-us/microsoft-edge/webview2/reference/win32/icorewebview2_24?view=webview2-1.0.2849.39#add_notificationreceived',
      ),
    ],
  )
  FutureOr<CygnusNotificationReceivedResponse?>? onNotificationReceived(
    CygnusNotificationReceivedRequest request,
  ) {
    return null;
  }

  ///{@macro cygnus_core.CygnusPlatformWebViewCreationParams.onSaveAsUIShowing}
  ///
  ///{@macro cygnus_core.CygnusPlatformBrowserEvents.onSaveAsUIShowing.supported_platforms}
  @SupportedPlatforms(
    platforms: [
      WindowsPlatform(
        apiName: 'ICoreWebView2_25.add_SaveAsUIShowing',
        apiUrl:
            'https://learn.microsoft.com/en-us/microsoft-edge/webview2/reference/win32/icorewebview2_25?view=webview2-1.0.2849.39#add_saveasuishowing',
      ),
    ],
  )
  FutureOr<CygnusSaveAsUIShowingResponse?>? onSaveAsUIShowing(
    CygnusSaveAsUIShowingRequest request,
  ) {
    return null;
  }

  ///{@macro cygnus_core.CygnusPlatformWebViewCreationParams.onSaveFileSecurityCheckStarting}
  ///
  ///{@macro cygnus_core.CygnusPlatformBrowserEvents.onSaveFileSecurityCheckStarting.supported_platforms}
  @SupportedPlatforms(
    platforms: [
      WindowsPlatform(
        apiName: 'ICoreWebView2_26.add_SaveFileSecurityCheckStarting',
        apiUrl:
            'https://learn.microsoft.com/en-us/microsoft-edge/webview2/reference/win32/icorewebview2_26?view=webview2-1.0.2849.39#add_savefilesecuritycheckstarting',
      ),
    ],
  )
  FutureOr<CygnusSaveFileSecurityCheckStartingResponse?>?
  onSaveFileSecurityCheckStarting(
    CygnusSaveFileSecurityCheckStartingRequest request,
  ) {
    return null;
  }

  ///{@macro cygnus_core.CygnusPlatformWebViewCreationParams.onScreenCaptureStarting}
  ///
  ///{@macro cygnus_core.CygnusPlatformBrowserEvents.onScreenCaptureStarting.supported_platforms}
  @SupportedPlatforms(
    platforms: [
      WindowsPlatform(
        apiName: 'ICoreWebView2_27.add_ScreenCaptureStarting',
        apiUrl:
            'https://learn.microsoft.com/en-us/microsoft-edge/webview2/reference/win32/icorewebview2_27?view=webview2-1.0.2849.39#add_screencapturestarting',
      ),
    ],
  )
  FutureOr<CygnusScreenCaptureStartingResponse?>? onScreenCaptureStarting(
    CygnusScreenCaptureStartingRequest request,
  ) {
    return null;
  }

  ///{@macro cygnus_core.CygnusPlatformWebViewCreationParams.onAcceleratorKeyPressed}
  ///
  ///{@macro cygnus_core.CygnusPlatformBrowserEvents.onAcceleratorKeyPressed.supported_platforms}
  @SupportedPlatforms(
    platforms: [
      WindowsPlatform(
        apiName: 'ICoreWebView2Controller.add_AcceleratorKeyPressed',
        apiUrl:
            'https://learn.microsoft.com/en-us/microsoft-edge/webview2/reference/win32/icorewebview2controller?view=webview2-1.0.2849.39#add_acceleratorkeypressed',
      ),
    ],
  )
  void onAcceleratorKeyPressed(CygnusAcceleratorKeyPressedDetail detail) {}

  ///{@macro cygnus_core.CygnusPlatformWebViewCreationParams.onShowFileChooser}
  ///
  ///{@macro cygnus_core.CygnusPlatformBrowserEvents.onShowFileChooser.supported_platforms}
  @SupportedPlatforms(
    platforms: [
      AndroidPlatform(
        apiName: 'WebChromeClient.onShowFileChooser',
        apiUrl:
            'https://developer.android.com/reference/android/webkit/WebChromeClient#onShowFileChooser(android.webkit.WebView,%20android.webkit.ValueCallback%3Candroid.net.Uri[]%3E,%20android.webkit.WebChromeClient.FileChooserParams)',
      ),
    ],
  )
  FutureOr<CygnusShowFileChooserResponse?> onShowFileChooser(
    CygnusShowFileChooserRequest request,
  ) {
    return null;
  }

  ///{@template cygnus_core.CygnusPlatformBrowserEvents.isMethodSupported}
  ///Check if the given [method] is supported by the [defaultTargetPlatform] or a specific [platform].
  ///{@endtemplate}
  static bool isMethodSupported(
    CygnusPlatformBrowserEventsMethod method, {
    TargetPlatform? platform,
  }) => _CygnusPlatformBrowserEventsMethodSupported.isMethodSupported(
    method,
    platform: platform,
  );
}
