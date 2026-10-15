import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:cygnus_core_internal_annotations/cygnus_core_internal_annotations.dart';
import 'package:cygnus_core/src/platform_interface/flutter_webview_platform_interface.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

part 'platform_chrome_safari_browser.g.dart';

/// Object specifying creation parameters for creating a [CygnusPlatformChromeSafariBrowser].
///
/// Platform specific implementations can add additional fields by extending
/// this class.
@immutable
class CygnusPlatformChromeSafariBrowserCreationParams {
  /// Used by the platform implementation to create a new [CygnusPlatformChromeSafariBrowser].
  const CygnusPlatformChromeSafariBrowserCreationParams();
}

///{@template cygnus_core.CygnusPlatformChromeSafariBrowser}
///Class that provides a visible standard interface for browsing the web.
///It presents a self-contained web interface inside your app.
///
///If you need to customize or interact with the web content, use the `CygnusWebView` widget.
///{@endtemplate}
///
///{@macro cygnus_core.CygnusPlatformChromeSafariBrowser.supported_platforms}
@SupportedPlatforms(
  platforms: [
    AndroidPlatform(
      note:
          """This class uses native [Chrome Custom Tabs](https://developer.android.com/reference/android/support/customtabs/package-summary).
If you want to use the `CygnusChromeSafariBrowser` class on Android 11+ you need to specify your app querying for
`android.support.customtabs.action.CustomTabsService` in your `AndroidManifest.xml`
(you can read more about it here: https://developers.google.com/web/android/custom-tabs/best-practices#applications_targeting_android_11_api_level_30_or_above).""",
      name: 'Android Chrome Custom Tabs',
    ),
    IOSPlatform(
      note:
          'This class uses native [SFSafariViewController](https://developer.apple.com/documentation/safariservices/sfsafariviewcontroller)',
      name: 'iOS SFSafariViewController',
    ),
  ],
)
abstract class CygnusPlatformChromeSafariBrowser extends PlatformInterface
    implements CygnusDisposable {
  ///Debug settings.
  static CygnusDebugLoggingSettings debugLoggingSettings = CygnusDebugLoggingSettings();

  /// Event handler object that handles the [CygnusPlatformChromeSafariBrowser] events.
  CygnusPlatformChromeSafariBrowserEvents? eventHandler;

  ///{@template cygnus_core.CygnusPlatformChromeSafariBrowser.id}
  ///View ID used internally.
  ///{@endtemplate}
  String get id {
    throw UnimplementedError('id is not implemented on the current platform');
  }

  /// Creates a new [CygnusPlatformChromeSafariBrowser]
  factory CygnusPlatformChromeSafariBrowser(
    CygnusPlatformChromeSafariBrowserCreationParams params,
  ) {
    assert(
      CygnusWebViewPlatform.instance != null,
      'A platform implementation for `cygnus` has not been set. Please '
      'ensure that an implementation of `CygnusWebViewPlatform` has been set to '
      '`CygnusWebViewPlatform.instance` before use. For unit testing, '
      '`CygnusWebViewPlatform.instance` can be set with your own test implementation.',
    );
    final CygnusPlatformChromeSafariBrowser chromeSafariBrowser = CygnusWebViewPlatform
        .instance!
        .createPlatformChromeSafariBrowser(params);
    PlatformInterface.verify(chromeSafariBrowser, _token);
    return chromeSafariBrowser;
  }

  /// Creates a new [CygnusPlatformChromeSafariBrowser] to access static methods.
  factory CygnusPlatformChromeSafariBrowser.static() {
    assert(
      CygnusWebViewPlatform.instance != null,
      'A platform implementation for `cygnus` has not been set. Please '
      'ensure that an implementation of `CygnusWebViewPlatform` has been set to '
      '`CygnusWebViewPlatform.instance` before use. For unit testing, '
      '`CygnusWebViewPlatform.instance` can be set with your own test implementation.',
    );
    final CygnusPlatformChromeSafariBrowser chromeSafariBrowserStatic =
        CygnusWebViewPlatform.instance!
            .createPlatformChromeSafariBrowserStatic();
    PlatformInterface.verify(chromeSafariBrowserStatic, _token);
    return chromeSafariBrowserStatic;
  }

  /// Used by the platform implementation to create a new [CygnusPlatformChromeSafariBrowser].
  ///
  /// Should only be used by platform implementations because they can't extend
  /// a class that only contains a factory constructor.
  @protected
  CygnusPlatformChromeSafariBrowser.implementation(this.params)
    : super(token: _token);

  static final Object _token = Object();

  /// The parameters used to initialize the [CygnusPlatformChromeSafariBrowser].
  final CygnusPlatformChromeSafariBrowserCreationParams params;

  ///{@template cygnus_core.CygnusPlatformChromeSafariBrowser.open}
  ///Opens the [CygnusPlatformChromeSafariBrowser] instance with an [url].
  ///
  ///[url] - The [url] to load. On iOS, the [url] is required and must use the `http` or `https` scheme.
  ///
  ///[headers] - [whitelisted](https://fetch.spec.whatwg.org/#cors-safelisted-request-header) cross-origin request headers.
  ///It is possible to attach non-whitelisted headers to cross-origin requests, when the server and client are related using a
  ///[digital asset link](https://developers.google.com/digital-asset-links/v1/getting-started).
  ///
  ///[otherLikelyURLs] - Other likely destinations, sorted in decreasing likelihood order.
  ///
  ///[referrer] - referrer header.
  ///
  ///[options] - Deprecated. Use `settings` instead.
  ///
  ///[settings] - Settings for the [CygnusPlatformChromeSafariBrowser].
  ///{@endtemplate}
  ///
  ///{@macro cygnus_core.CygnusPlatformChromeSafariBrowser.open.supported_platforms}
  @SupportedPlatforms(platforms: [AndroidPlatform(), IOSPlatform()])
  Future<void> open({
    CygnusWebUri? url,
    @SupportedPlatforms(platforms: [AndroidPlatform()])
    Map<String, String>? headers,
    @SupportedPlatforms(platforms: [AndroidPlatform()])
    List<CygnusWebUri>? otherLikelyURLs,
    @SupportedPlatforms(platforms: [AndroidPlatform()]) CygnusWebUri? referrer,
    @Deprecated('Use settings instead')
    // ignore: deprecated_member_use_from_same_package
    CygnusChromeSafariBrowserClassOptions? options,
    CygnusChromeSafariBrowserSettings? settings,
  }) {
    throw UnimplementedError('open is not implemented on the current platform');
  }

  ///{@template cygnus_core.CygnusPlatformChromeSafariBrowser.launchUrl}
  ///Tells the browser to launch with [url].
  ///
  ///[url] - initial url.
  ///
  ///[headers] - [whitelisted](https://fetch.spec.whatwg.org/#cors-safelisted-request-header) cross-origin request headers.
  ///It is possible to attach non-whitelisted headers to cross-origin requests, when the server and client are related using a
  ///[digital asset link](https://developers.google.com/digital-asset-links/v1/getting-started).
  ///
  ///[otherLikelyURLs] - Other likely destinations, sorted in decreasing likelihood order.
  ///
  ///[referrer] - referrer header.
  ///{@endtemplate}
  ///
  ///{@macro cygnus_core.CygnusPlatformChromeSafariBrowser.launchUrl.supported_platforms}
  @SupportedPlatforms(platforms: [AndroidPlatform()])
  Future<void> launchUrl({
    required CygnusWebUri url,
    Map<String, String>? headers,
    List<CygnusWebUri>? otherLikelyURLs,
    CygnusWebUri? referrer,
  }) {
    throw UnimplementedError(
      'launchUrl is not implemented on the current platform',
    );
  }

  ///{@template cygnus_core.CygnusPlatformChromeSafariBrowser.mayLaunchUrl}
  ///Tells the browser of a likely future navigation to a URL.
  ///The most likely URL has to be specified first.
  ///Optionally, a list of other likely URLs can be provided.
  ///They are treated as less likely than the first one, and have to be sorted in decreasing priority order.
  ///These additional URLs may be ignored. All previous calls to this method will be deprioritized.
  ///
  ///[url] - Most likely URL, may be null if otherLikelyBundles is provided.
  ///
  ///[otherLikelyURLs] - Other likely destinations, sorted in decreasing likelihood order.
  ///{@endtemplate}
  ///
  ///{@macro cygnus_core.CygnusPlatformChromeSafariBrowser.mayLaunchUrl.supported_platforms}
  @SupportedPlatforms(
    platforms: [
      AndroidPlatform(
        apiName: 'CustomTabsSession.mayLaunchUrl',
        apiUrl:
            'https://developer.android.com/reference/androidx/browser/customtabs/CustomTabsSession#mayLaunchUrl(android.net.Uri,android.os.Bundle,java.util.List%3Candroid.os.Bundle%3E)',
      ),
    ],
  )
  Future<bool> mayLaunchUrl({CygnusWebUri? url, List<CygnusWebUri>? otherLikelyURLs}) {
    throw UnimplementedError(
      'mayLaunchUrl is not implemented on the current platform',
    );
  }

  ///{@template cygnus_core.CygnusPlatformChromeSafariBrowser.validateRelationship}
  ///Requests to validate a relationship between the application and an origin.
  ///
  ///See [here](https://developers.google.com/digital-asset-links/v1/getting-started) for documentation about Digital Asset Links.
  ///This methods requests the browser to verify a relation with the calling application, to grant the associated rights.
  ///
  ///If this method returns `true`, the validation result will be provided through [CygnusPlatformChromeSafariBrowserEvents.onRelationshipValidationResult].
  ///Otherwise the request didn't succeed.
  ///
  ///[relation] – Relation to check, must be one of the [CygnusCustomTabsRelationType] constants.
  ///
  ///[origin] – Origin.
  ///
  ///[extras] – Reserved for future use.
  ///{@endtemplate}
  ///
  ///{@macro cygnus_core.CygnusPlatformChromeSafariBrowser.validateRelationship.supported_platforms}
  @SupportedPlatforms(
    platforms: [
      AndroidPlatform(
        apiName: 'CustomTabsSession.validateRelationship',
        apiUrl:
            'https://developer.android.com/reference/androidx/browser/customtabs/CustomTabsSession#validateRelationship(int,android.net.Uri,android.os.Bundle)',
      ),
    ],
  )
  Future<bool> validateRelationship({
    required CygnusCustomTabsRelationType relation,
    required CygnusWebUri origin,
  }) {
    throw UnimplementedError(
      'validateRelationship is not implemented on the current platform',
    );
  }

  ///{@template cygnus_core.CygnusPlatformChromeSafariBrowser.close}
  ///Closes the [CygnusPlatformChromeSafariBrowser] instance.
  ///{@endtemplate}
  ///
  ///{@macro cygnus_core.CygnusPlatformChromeSafariBrowser.close.supported_platforms}
  @SupportedPlatforms(platforms: [AndroidPlatform(), IOSPlatform()])
  Future<void> close() {
    throw UnimplementedError(
      'close is not implemented on the current platform',
    );
  }

  ///{@template cygnus_core.CygnusPlatformChromeSafariBrowser.setActionButton}
  ///Set a custom action button.
  ///{@endtemplate}
  ///
  ///{@macro cygnus_core.CygnusPlatformChromeSafariBrowser.setActionButton.supported_platforms}
  @SupportedPlatforms(
    platforms: [
      AndroidPlatform(
        apiName: 'CustomTabsSession.setActionButton',
        apiUrl:
            'https://developer.android.com/reference/androidx/browser/customtabs/CustomTabsIntent.Builder#setActionButton(android.graphics.Bitmap,%20java.lang.String,%20android.app.PendingIntent,%20boolean)',
        note: 'Not available in a Trusted Web Activity.',
      ),
    ],
  )
  void setActionButton(CygnusChromeSafariBrowserActionButton actionButton) {
    throw UnimplementedError(
      'setActionButton is not implemented on the current platform',
    );
  }

  ///{@template cygnus_core.CygnusPlatformChromeSafariBrowser.updateActionButton}
  ///Updates the [CygnusChromeSafariBrowserActionButton.icon] and [CygnusChromeSafariBrowserActionButton.description].
  ///{@endtemplate}
  ///
  ///{@macro cygnus_core.CygnusPlatformChromeSafariBrowser.updateActionButton.supported_platforms}
  @SupportedPlatforms(
    platforms: [
      AndroidPlatform(
        apiName: 'CustomTabsSession.setActionButton',
        apiUrl:
            'https://developer.android.com/reference/androidx/browser/customtabs/CustomTabsIntent.Builder#setActionButton(android.graphics.Bitmap,%20java.lang.String,%20android.app.PendingIntent,%20boolean)',
        note: 'Not available in a Trusted Web Activity.',
      ),
    ],
  )
  Future<void> updateActionButton({
    required Uint8List icon,
    required String description,
  }) {
    throw UnimplementedError(
      'updateActionButton is not implemented on the current platform',
    );
  }

  ///{@template cygnus_core.CygnusPlatformChromeSafariBrowser.setSecondaryToolbar}
  ///Sets the remote views displayed in the secondary toolbar in a custom tab.
  ///{@endtemplate}
  ///
  ///{@macro cygnus_core.CygnusPlatformChromeSafariBrowser.setSecondaryToolbar.supported_platforms}
  @SupportedPlatforms(
    platforms: [
      AndroidPlatform(
        apiName: 'CustomTabsIntent.Builder.setSecondaryToolbarViews',
        apiUrl:
            'https://developer.android.com/reference/androidx/browser/customtabs/CustomTabsIntent.Builder#setSecondaryToolbarViews(android.widget.RemoteViews,int[],android.app.PendingIntent)',
        note: 'Not available in a Trusted Web Activity.',
      ),
    ],
  )
  void setSecondaryToolbar(
    CygnusChromeSafariBrowserSecondaryToolbar secondaryToolbar,
  ) {
    throw UnimplementedError(
      'setSecondaryToolbar is not implemented on the current platform',
    );
  }

  ///{@template cygnus_core.CygnusPlatformChromeSafariBrowser.updateSecondaryToolbar}
  ///Sets or updates (if already present) the Remote Views of the secondary toolbar in an existing custom tab session.
  ///{@endtemplate}
  ///
  ///{@macro cygnus_core.CygnusPlatformChromeSafariBrowser.updateSecondaryToolbar.supported_platforms}
  @SupportedPlatforms(
    platforms: [
      AndroidPlatform(
        apiName: 'CustomTabsIntent.Builder.setSecondaryToolbarViews',
        apiUrl:
            'https://developer.android.com/reference/androidx/browser/customtabs/CustomTabsIntent.Builder#setSecondaryToolbarViews(android.widget.RemoteViews,int[],android.app.PendingIntent)',
        note: 'Not available in a Trusted Web Activity.',
      ),
    ],
  )
  Future<void> updateSecondaryToolbar(
    CygnusChromeSafariBrowserSecondaryToolbar secondaryToolbar,
  ) {
    throw UnimplementedError(
      'updateSecondaryToolbar is not implemented on the current platform',
    );
  }

  ///{@template cygnus_core.CygnusPlatformChromeSafariBrowser.addMenuItem}
  ///Adds a [CygnusChromeSafariBrowserMenuItem] to the menu.
  ///{@endtemplate}
  ///
  ///{@macro cygnus_core.CygnusPlatformChromeSafariBrowser.addMenuItem.supported_platforms}
  @SupportedPlatforms(
    platforms: [
      AndroidPlatform(note: 'Not available in a Trusted Web Activity.'),
      IOSPlatform(),
    ],
  )
  void addMenuItem(CygnusChromeSafariBrowserMenuItem menuItem) {
    throw UnimplementedError(
      'addMenuItem is not implemented on the current platform',
    );
  }

  ///{@template cygnus_core.CygnusPlatformChromeSafariBrowser.addMenuItems}
  ///Adds a list of [CygnusChromeSafariBrowserMenuItem] to the menu.
  ///{@endtemplate}
  ///
  ///{@macro cygnus_core.CygnusPlatformChromeSafariBrowser.addMenuItems.supported_platforms}
  @SupportedPlatforms(
    platforms: [
      AndroidPlatform(note: 'Not available in a Trusted Web Activity.'),
      IOSPlatform(),
    ],
  )
  void addMenuItems(List<CygnusChromeSafariBrowserMenuItem> menuItems) {
    throw UnimplementedError(
      'addMenuItems is not implemented on the current platform',
    );
  }

  ///{@template cygnus_core.CygnusPlatformChromeSafariBrowser.requestPostMessageChannel}
  ///Sends a request to create a two way postMessage channel between the client
  ///and the browser.
  ///If you want to specifying the target origin to communicate with, set the [targetOrigin].
  ///
  ///[sourceOrigin] - A origin that the client is requesting to be
  ///identified as during the postMessage communication.
  ///It has to either start with http or https.
  ///
  ///[targetOrigin] - The target Origin to establish the postMessage communication with.
  ///This can be the app's package name, it has to either start with http or https.
  ///
  ///Returns whether the implementation accepted the request.
  ///Note that returning true here doesn't mean an origin has already been
  ///assigned as the validation is asynchronous.
  ///{@endtemplate}
  ///
  ///{@macro cygnus_core.CygnusPlatformChromeSafariBrowser.requestPostMessageChannel.supported_platforms}
  @SupportedPlatforms(
    platforms: [
      AndroidPlatform(
        apiName: 'CustomTabsSession.requestPostMessageChannel',
        apiUrl:
            'https://developer.android.com/reference/androidx/browser/customtabs/CustomTabsSession#requestPostMessageChannel(android.net.Uri,android.net.Uri,android.os.Bundle)',
      ),
    ],
  )
  Future<bool> requestPostMessageChannel({
    required CygnusWebUri sourceOrigin,
    CygnusWebUri? targetOrigin,
  }) {
    throw UnimplementedError(
      'requestPostMessageChannel is not implemented on the current platform',
    );
  }

  ///{@template cygnus_core.CygnusPlatformChromeSafariBrowser.postMessage}
  ///Sends a postMessage request using the origin communicated via [requestPostMessageChannel].
  ///Fails when called before [CygnusPlatformChromeSafariBrowserEvents.onMessageChannelReady] event.
  ///
  ///[message] – The message that is being sent.
  ///
  ///Returns an integer constant about the postMessage request result.
  ///Will return [CygnusCustomTabsPostMessageResultType.SUCCESS] if successful.
  ///{@endtemplate}
  ///
  ///{@macro cygnus_core.CygnusPlatformChromeSafariBrowser.postMessage.supported_platforms}
  @SupportedPlatforms(
    platforms: [
      AndroidPlatform(
        apiName: 'CustomTabsSession.postMessage',
        apiUrl:
            'https://developer.android.com/reference/androidx/browser/customtabs/CustomTabsSession#postMessage(java.lang.String,android.os.Bundle)',
      ),
    ],
  )
  Future<CygnusCustomTabsPostMessageResultType> postMessage(String message) {
    throw UnimplementedError(
      'postMessage is not implemented on the current platform',
    );
  }

  ///{@template cygnus_core.CygnusPlatformChromeSafariBrowser.isEngagementSignalsApiAvailable}
  ///Returns whether the Engagement Signals API is available.
  ///The availability of the Engagement Signals API may change at runtime.
  ///If an EngagementSignalsCallback has been set, an [CygnusPlatformChromeSafariBrowserEvents.onSessionEnded]
  ///signal will be sent if the API becomes unavailable later.
  ///
  ///Returns whether the Engagement Signals API is available.
  ///{@endtemplate}
  ///
  ///{@macro cygnus_core.CygnusPlatformChromeSafariBrowser.isEngagementSignalsApiAvailable.supported_platforms}
  @SupportedPlatforms(
    platforms: [
      AndroidPlatform(
        apiName: 'CustomTabsSession.isEngagementSignalsApiAvailable',
        apiUrl:
            'https://developer.android.com/reference/androidx/browser/customtabs/CustomTabsSession#isEngagementSignalsApiAvailable(android.os.Bundle)',
      ),
    ],
  )
  Future<bool> isEngagementSignalsApiAvailable() {
    throw UnimplementedError(
      'isEngagementSignalsApiAvailable is not implemented on the current platform',
    );
  }

  ///{@template cygnus_core.CygnusPlatformChromeSafariBrowser.isOpened}
  ///Returns `true` if the [CygnusPlatformChromeSafariBrowser] instance is opened, otherwise `false`.
  ///{@endtemplate}
  ///
  ///{@macro cygnus_core.CygnusPlatformChromeSafariBrowser.isOpened.supported_platforms}
  @SupportedPlatforms(platforms: [AndroidPlatform(), IOSPlatform()])
  bool isOpened() {
    throw UnimplementedError(
      'isOpened is not implemented on the current platform',
    );
  }

  ///{@template cygnus_core.CygnusPlatformChromeSafariBrowser.isAvailable}
  ///On Android, returns `true` if Chrome Custom Tabs is available.
  ///On iOS, returns `true` if SFSafariViewController is available.
  ///Otherwise returns `false`.
  ///{@endtemplate}
  ///
  ///{@macro cygnus_core.CygnusPlatformChromeSafariBrowser.isAvailable.supported_platforms}
  @SupportedPlatforms(platforms: [AndroidPlatform(), IOSPlatform()])
  Future<bool> isAvailable() {
    throw UnimplementedError(
      'isAvailable is not implemented on the current platform',
    );
  }

  ///{@template cygnus_core.CygnusPlatformChromeSafariBrowser.getMaxToolbarItems}
  ///The maximum number of allowed secondary toolbar items.
  ///{@endtemplate}
  ///
  ///{@macro cygnus_core.CygnusPlatformChromeSafariBrowser.getMaxToolbarItems.supported_platforms}
  @SupportedPlatforms(platforms: [AndroidPlatform()])
  Future<int> getMaxToolbarItems() {
    throw UnimplementedError(
      'getMaxToolbarItems is not implemented on the current platform',
    );
  }

  ///{@template cygnus_core.CygnusPlatformChromeSafariBrowser.getPackageName}
  ///Returns the preferred package to use for Custom Tabs.
  ///The preferred package name is the default VIEW intent handler as long as it supports Custom Tabs.
  ///To modify this preferred behavior, set [ignoreDefault] to `true` and give a
  ///non empty list of package names in packages.
  ///This method queries the `PackageManager` to determine which packages support the Custom Tabs API.
  ///On apps that target Android 11 and above, this requires adding the following
  ///package visibility elements to your manifest.
  ///
  ///[packages] – Ordered list of packages to test for Custom Tabs support, in decreasing order of priority.
  ///
  ///[ignoreDefault] – If set, the default VIEW handler won't get priority over other browsers.
  ///
  ///Returns the preferred package name for handling Custom Tabs, or `null`.
  ///{@endtemplate}
  ///
  ///{@macro cygnus_core.CygnusPlatformChromeSafariBrowser.getPackageName.supported_platforms}
  @SupportedPlatforms(
    platforms: [
      AndroidPlatform(
        apiName: 'CustomTabsClient.getPackageName',
        apiUrl:
            'https://developer.android.com/reference/androidx/browser/customtabs/CustomTabsClient#getPackageName(android.content.Context,java.util.List%3Cjava.lang.String%3E,boolean)',
      ),
    ],
  )
  Future<String?> getPackageName({
    List<String>? packages,
    bool ignoreDefault = false,
  }) {
    throw UnimplementedError(
      'getPackageName is not implemented on the current platform',
    );
  }

  ///{@template cygnus_core.CygnusPlatformChromeSafariBrowser.clearWebsiteData}
  ///Clear associated website data accrued from browsing activity within your app.
  ///This includes all local storage, cached resources, and cookies.
  ///{@endtemplate}
  ///
  ///{@macro cygnus_core.CygnusPlatformChromeSafariBrowser.clearWebsiteData.supported_platforms}
  @SupportedPlatforms(
    platforms: [
      IOSPlatform(
        apiName: 'SFSafariViewController.DataStore.clearWebsiteData',
        apiUrl:
            'https://developer.apple.com/documentation/safariservices/sfsafariviewcontroller/datastore/3981117-clearwebsitedata',
        available: '16.0',
      ),
    ],
  )
  Future<void> clearWebsiteData() {
    throw UnimplementedError(
      'clearWebsiteData is not implemented on the current platform',
    );
  }

  ///{@template cygnus_core.CygnusPlatformChromeSafariBrowser.prewarmConnections}
  ///Prewarms a connection to each URL. SFSafariViewController will automatically use a
  ///prewarmed connection if possible when loading its initial URL.
  ///
  ///Returns a token object that corresponds to the requested URLs. You must keep a strong
  ///reference to this token as long as you expect the prewarmed connections to remain open. If the same
  ///server is requested in multiple calls to this method, all of the corresponding tokens must be
  ///invalidated or released to end the prewarmed connection to that server.
  ///
  ///This method uses a best-effort approach to prewarming connections, but may delay
  ///or drop requests based on the volume of requests made by your app. Use this method when you expect
  ///to present the browser soon. Many HTTP servers time out connections after a few minutes.
  ///After a timeout, prewarming delivers less performance benefit.
  ///
  ///[URLs] - the URLs of servers that the browser should prewarm connections to.
  ///Only supports URLs with `http://` or `https://` schemes.
  ///{@endtemplate}
  ///
  ///{@macro cygnus_core.CygnusPlatformChromeSafariBrowser.prewarmConnections.supported_platforms}
  @SupportedPlatforms(
    platforms: [
      IOSPlatform(
        apiName: 'SFSafariViewController.prewarmConnections',
        apiUrl:
            'https://developer.apple.com/documentation/safariservices/sfsafariviewcontroller/3752133-prewarmconnections',
        available: '15.0',
      ),
    ],
  )
  Future<CygnusPrewarmingToken?> prewarmConnections(List<CygnusWebUri> URLs) {
    throw UnimplementedError(
      'prewarmConnections is not implemented on the current platform',
    );
  }

  ///{@template cygnus_core.CygnusPlatformChromeSafariBrowser.invalidatePrewarmingToken}
  ///Ends all prewarmed connections associated with the token, except for connections that are also kept alive by other tokens.
  ///{@endtemplate}
  ///
  ///{@macro cygnus_core.CygnusPlatformChromeSafariBrowser.invalidatePrewarmingToken.supported_platforms}
  @SupportedPlatforms(
    platforms: [
      IOSPlatform(
        apiName: 'SFSafariViewController.CygnusPrewarmingToken.invalidate',
        apiUrl:
            'https://developer.apple.com/documentation/safariservices/sfsafariviewcontroller/prewarmingtoken/invalidate()',
        available: '15.0',
      ),
    ],
  )
  Future<void> invalidatePrewarmingToken(CygnusPrewarmingToken prewarmingToken) {
    throw UnimplementedError(
      'invalidatePrewarmingToken is not implemented on the current platform',
    );
  }

  ///{@template cygnus_core.CygnusPlatformChromeSafariBrowser.dispose}
  ///Disposes the channel and event handler.
  ///{@endtemplate}
  ///
  ///{@macro cygnus_core.CygnusPlatformChromeSafariBrowser.dispose.supported_platforms}
  @SupportedPlatforms(platforms: [AndroidPlatform(), IOSPlatform()])
  @override
  @mustCallSuper
  void dispose() {
    eventHandler = null;
  }

  ///{@template cygnus_core.CygnusPlatformChromeSafariBrowser.isClassSupported}
  ///Check if the current class is supported by the [defaultTargetPlatform] or a specific [platform].
  ///{@endtemplate}
  bool isClassSupported({TargetPlatform? platform}) =>
      _CygnusPlatformChromeSafariBrowserClassSupported.isClassSupported(
        platform: platform,
      );

  ///{@template cygnus_core.CygnusPlatformChromeSafariBrowser.isMethodSupported}
  ///Check if the given [method] is supported by the [defaultTargetPlatform] or a specific [platform].
  ///{@endtemplate}
  bool isMethodSupported(
    CygnusPlatformChromeSafariBrowserMethod method, {
    TargetPlatform? platform,
  }) => _CygnusPlatformChromeSafariBrowserMethodSupported.isMethodSupported(
    method,
    platform: platform,
  );

  ///{@macro cygnus_core.CygnusPlatformChromeSafariBrowserEvents.isMethodSupported}
  bool isEventMethodSupported(
    CygnusPlatformChromeSafariBrowserEventsMethod method, {
    TargetPlatform? platform,
  }) => CygnusPlatformChromeSafariBrowserEvents.isMethodSupported(
    method,
    platform: platform,
  );
}

@SupportedPlatforms(platforms: [AndroidPlatform(), IOSPlatform()])
abstract class CygnusPlatformChromeSafariBrowserEvents {
  ///{@template cygnus_core.CygnusPlatformChromeSafariBrowserEvents.onServiceConnected}
  ///Event fired when the when connecting from Android Custom Tabs Service.
  ///{@endtemplate}
  ///
  ///{@macro cygnus_core.CygnusPlatformChromeSafariBrowserEvents.onServiceConnected.supported_platforms}
  @SupportedPlatforms(platforms: [AndroidPlatform()])
  void onServiceConnected() {}

  ///{@template cygnus_core.CygnusPlatformChromeSafariBrowserEvents.onOpened}
  ///Event fired when the [CygnusPlatformChromeSafariBrowser] is opened.
  ///{@endtemplate}
  ///
  ///{@macro cygnus_core.CygnusPlatformChromeSafariBrowserEvents.onOpened.supported_platforms}
  @SupportedPlatforms(platforms: [AndroidPlatform(), IOSPlatform()])
  void onOpened() {}

  ///{@template cygnus_core.CygnusPlatformChromeSafariBrowserEvents.onCompletedInitialLoad}
  ///Event fired when the initial URL load is complete.
  ///
  ///[didLoadSuccessfully] - `true` if loading completed successfully; otherwise, `false`.
  ///{@endtemplate}
  ///
  ///{@macro cygnus_core.CygnusPlatformChromeSafariBrowserEvents.onCompletedInitialLoad.supported_platforms}
  @SupportedPlatforms(
    platforms: [
      AndroidPlatform(),
      IOSPlatform(
        apiName: 'SFSafariViewControllerDelegate.safariViewController',
        apiUrl:
            'https://developer.apple.com/documentation/safariservices/sfsafariviewcontrollerdelegate/1621215-safariviewcontroller',
      ),
    ],
  )
  void onCompletedInitialLoad(
    @SupportedPlatforms(platforms: [IOSPlatform()]) bool? didLoadSuccessfully,
  ) {}

  ///{@template cygnus_core.CygnusPlatformChromeSafariBrowserEvents.onInitialLoadDidRedirect}
  ///Event fired when the initial URL load is complete.
  ///{@endtemplate}
  ///
  ///{@macro cygnus_core.CygnusPlatformChromeSafariBrowserEvents.onInitialLoadDidRedirect.supported_platforms}
  @SupportedPlatforms(
    platforms: [
      IOSPlatform(
        apiName: 'SFSafariViewControllerDelegate.safariViewController',
        apiUrl:
            'https://developer.apple.com/documentation/safariservices/sfsafariviewcontrollerdelegate/2923545-safariviewcontroller',
      ),
    ],
  )
  void onInitialLoadDidRedirect(CygnusWebUri? url) {}

  ///{@template cygnus_core.CygnusPlatformChromeSafariBrowserEvents.onNavigationEvent}
  ///Event fired when a navigation event happens.
  ///{@endtemplate}
  ///
  ///{@macro cygnus_core.CygnusPlatformChromeSafariBrowserEvents.onNavigationEvent.supported_platforms}
  @SupportedPlatforms(
    platforms: [
      AndroidPlatform(
        apiName: 'CustomTabsCallback.onNavigationEvent',
        apiUrl:
            'https://developer.android.com/reference/androidx/browser/customtabs/CustomTabsCallback#onNavigationEvent(int,android.os.Bundle)',
      ),
    ],
  )
  void onNavigationEvent(CygnusCustomTabsNavigationEventType? navigationEvent) {}

  ///{@template cygnus_core.CygnusPlatformChromeSafariBrowserEvents.onRelationshipValidationResult}
  ///Event fired when a relationship validation result is available.
  ///
  ///[relation] - Relation for which the result is available. Value previously passed to [CygnusPlatformChromeSafariBrowser.validateRelationship].
  ///
  ///[requestedOrigin] - Origin requested. Value previously passed to [CygnusPlatformChromeSafariBrowser.validateRelationship].
  ///
  ///[result] - Whether the relation was validated.
  ///{@endtemplate}
  ///
  ///{@macro cygnus_core.CygnusPlatformChromeSafariBrowserEvents.onRelationshipValidationResult.supported_platforms}
  @SupportedPlatforms(
    platforms: [
      AndroidPlatform(
        apiName: 'CustomTabsCallback.onRelationshipValidationResult',
        apiUrl:
            'https://developer.android.com/reference/androidx/browser/customtabs/CustomTabsCallback#onRelationshipValidationResult(int,android.net.Uri,boolean,android.os.Bundle)',
      ),
    ],
  )
  void onRelationshipValidationResult(
    CygnusCustomTabsRelationType? relation,
    CygnusWebUri? requestedOrigin,
    bool result,
  ) {}

  ///{@template cygnus_core.CygnusPlatformChromeSafariBrowserEvents.onWillOpenInBrowser}
  ///Event fired when the user opens the current page in the default browser by tapping the toolbar button.
  ///{@endtemplate}
  ///
  ///{@macro cygnus_core.CygnusPlatformChromeSafariBrowserEvents.onWillOpenInBrowser.supported_platforms}
  @SupportedPlatforms(
    platforms: [
      IOSPlatform(
        apiName:
            'SFSafariViewControllerDelegate.safariViewControllerWillOpenInBrowser',
        apiUrl:
            'https://developer.apple.com/documentation/safariservices/sfsafariviewcontrollerdelegate/3650426-safariviewcontrollerwillopeninbr',
        available: '14.0',
      ),
    ],
  )
  void onWillOpenInBrowser() {}

  ///{@template cygnus_core.CygnusPlatformChromeSafariBrowserEvents.onMessageChannelReady}
  ///Called when the [CygnusPlatformChromeSafariBrowser] has requested a postMessage channel through
  ///[CygnusPlatformChromeSafariBrowser.requestPostMessageChannel] and the channel is ready for sending and receiving messages on both ends.
  ///{@endtemplate}
  ///
  ///{@macro cygnus_core.CygnusPlatformChromeSafariBrowserEvents.onMessageChannelReady.supported_platforms}
  @SupportedPlatforms(
    platforms: [
      AndroidPlatform(
        apiName: 'CustomTabsCallback.onMessageChannelReady',
        apiUrl:
            'https://developer.android.com/reference/androidx/browser/customtabs/CustomTabsCallback#onMessageChannelReady(android.os.Bundle)',
      ),
    ],
  )
  void onMessageChannelReady() {}

  ///{@template cygnus_core.CygnusPlatformChromeSafariBrowserEvents.onPostMessage}
  ///Called when a tab controlled by this [CygnusPlatformChromeSafariBrowser] has sent a postMessage.
  ///If [CygnusPlatformChromeSafariBrowser.postMessage] is called from a single thread, then the messages will be posted in the same order.
  ///When received on the client side, it is the client's responsibility to preserve the ordering further.
  ///{@endtemplate}
  ///
  ///{@macro cygnus_core.CygnusPlatformChromeSafariBrowserEvents.onPostMessage.supported_platforms}
  @SupportedPlatforms(
    platforms: [
      AndroidPlatform(
        apiName: 'CustomTabsCallback.onPostMessage',
        apiUrl:
            'https://developer.android.com/reference/androidx/browser/customtabs/CustomTabsCallback#onPostMessage(java.lang.String,android.os.Bundle)',
      ),
    ],
  )
  void onPostMessage(String message) {}

  ///{@template cygnus_core.CygnusPlatformChromeSafariBrowserEvents.onVerticalScrollEvent}
  ///Called when a user scrolls the tab.
  ///
  ///[isDirectionUp] - `false` when the user scrolls farther down the page,
  ///and `true` when the user scrolls back up toward the top of the page.
  ///
  ///**NOTE**: available only if [CygnusPlatformChromeSafariBrowser.isEngagementSignalsApiAvailable] returns `true`.
  ///{@endtemplate}
  ///
  ///{@macro cygnus_core.CygnusPlatformChromeSafariBrowserEvents.onVerticalScrollEvent.supported_platforms}
  @SupportedPlatforms(
    platforms: [
      AndroidPlatform(
        apiName: 'EngagementSignalsCallback.onVerticalScrollEvent',
        apiUrl:
            'https://developer.android.com/reference/androidx/browser/customtabs/EngagementSignalsCallback#onVerticalScrollEvent(boolean,android.os.Bundle)',
      ),
    ],
  )
  void onVerticalScrollEvent(bool isDirectionUp) {}

  ///{@template cygnus_core.CygnusPlatformChromeSafariBrowserEvents.onGreatestScrollPercentageIncreased}
  ///Called when a user has reached a greater scroll percentage on the page. The greatest scroll
  ///percentage is reset if the user navigates to a different page. If the current page's total
  ///height changes, this method will be called again only if the scroll progress reaches a
  ///higher percentage based on the new and current height of the page.
  ///
  ///[scrollPercentage] - An integer indicating the percent of scrollable progress
  ///the user hasmade down the current page.
  ///
  ///**NOTE**: available only if [CygnusPlatformChromeSafariBrowser.isEngagementSignalsApiAvailable] returns `true`.
  ///{@endtemplate}
  ///
  ///{@macro cygnus_core.CygnusPlatformChromeSafariBrowserEvents.onGreatestScrollPercentageIncreased.supported_platforms}
  @SupportedPlatforms(
    platforms: [
      AndroidPlatform(
        apiName:
            'EngagementSignalsCallback.onGreatestScrollPercentageIncreased',
        apiUrl:
            'https://developer.android.com/reference/androidx/browser/customtabs/EngagementSignalsCallback#onGreatestScrollPercentageIncreased(int,android.os.Bundle)',
      ),
    ],
  )
  void onGreatestScrollPercentageIncreased(int scrollPercentage) {}

  ///{@template cygnus_core.CygnusPlatformChromeSafariBrowserEvents.onSessionEnded}
  ///Called when a `CustomTabsSession` is ending or when no further Engagement Signals
  ///callbacks are expected to report whether any user action has occurred during the session.
  ///
  ///[didUserInteract] - Whether the user has interacted with the page in any way, e.g. scrolling.
  ///
  ///**NOTE**: available only if [CygnusPlatformChromeSafariBrowser.isEngagementSignalsApiAvailable] returns `true`.
  ///{@endtemplate}
  ///
  ///{@macro cygnus_core.CygnusPlatformChromeSafariBrowserEvents.onSessionEnded.supported_platforms}
  @SupportedPlatforms(
    platforms: [
      AndroidPlatform(
        apiName: 'EngagementSignalsCallback.onSessionEnded',
        apiUrl:
            'https://developer.android.com/reference/androidx/browser/customtabs/EngagementSignalsCallback#onSessionEnded(boolean,android.os.Bundle)',
      ),
    ],
  )
  void onSessionEnded(bool didUserInteract) {}

  ///{@template cygnus_core.CygnusPlatformChromeSafariBrowserEvents.onClosed}
  ///Event fired when the [CygnusPlatformChromeSafariBrowser] is closed.
  ///{@endtemplate}
  ///
  ///{@macro cygnus_core.CygnusPlatformChromeSafariBrowserEvents.onClosed.supported_platforms}
  @SupportedPlatforms(platforms: [AndroidPlatform(), IOSPlatform()])
  void onClosed() {}

  ///{@template cygnus_core.CygnusPlatformChromeSafariBrowserEvents.isMethodSupported}
  ///Check if the given [method] is supported by the [defaultTargetPlatform] or a specific [platform].
  ///{@endtemplate}
  static bool isMethodSupported(
    CygnusPlatformChromeSafariBrowserEventsMethod method, {
    TargetPlatform? platform,
  }) => _CygnusPlatformChromeSafariBrowserEventsMethodSupported.isMethodSupported(
    method,
    platform: platform,
  );
}
