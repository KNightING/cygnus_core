import 'dart:async';
import 'dart:typed_data';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:cygnus_core/src/platform_interface/flutter_webview_platform_interface.dart';

///{@macro cygnus_core.CygnusPlatformChromeSafariBrowser}
///
///{@macro cygnus_core.CygnusPlatformChromeSafariBrowser.supported_platforms}
class CygnusChromeSafariBrowser implements CygnusPlatformChromeSafariBrowserEvents {
  ///Constructs a [CygnusChromeSafariBrowser].
  ///
  ///{@macro cygnus_core.CygnusPlatformChromeSafariBrowser}
  ///
  ///{@macro cygnus_core.CygnusPlatformChromeSafariBrowser.supported_platforms}
  CygnusChromeSafariBrowser()
    : this.fromPlatformCreationParams(
        CygnusPlatformChromeSafariBrowserCreationParams(),
      );

  /// Constructs a [CygnusChromeSafariBrowser] from creation params for a specific
  /// platform.
  CygnusChromeSafariBrowser.fromPlatformCreationParams(
    CygnusPlatformChromeSafariBrowserCreationParams params,
  ) : this.fromPlatform(CygnusPlatformChromeSafariBrowser(params));

  /// Constructs a [CygnusChromeSafariBrowser] from a specific platform
  /// implementation.
  CygnusChromeSafariBrowser.fromPlatform(this.platform) {
    this.platform.eventHandler = this;
  }

  /// Implementation of [CygnusPlatformChromeSafariBrowser] for the current platform.
  final CygnusPlatformChromeSafariBrowser platform;

  ///{@macro cygnus_core.CygnusPlatformChromeSafariBrowser.id}
  ///
  ///{@macro cygnus_core.CygnusPlatformChromeSafariBrowser.id.supported_platforms}
  String get id => platform.id;

  ///{@macro cygnus_core.CygnusPlatformChromeSafariBrowser.open}
  ///
  ///{@macro cygnus_core.CygnusPlatformChromeSafariBrowser.open.supported_platforms}
  Future<void> open({
    CygnusWebUri? url,
    Map<String, String>? headers,
    List<CygnusWebUri>? otherLikelyURLs,
    CygnusWebUri? referrer,
    @Deprecated('Use settings instead')
    // ignore: deprecated_member_use_from_same_package
    CygnusChromeSafariBrowserClassOptions? options,
    CygnusChromeSafariBrowserSettings? settings,
  }) {
    this.platform.eventHandler = this;
    return platform.open(
      url: url,
      headers: headers,
      otherLikelyURLs: otherLikelyURLs,
      options: options,
      settings: settings,
    );
  }

  ///{@macro cygnus_core.CygnusPlatformChromeSafariBrowser.launchUrl}
  ///
  ///{@macro cygnus_core.CygnusPlatformChromeSafariBrowser.launchUrl.supported_platforms}
  Future<void> launchUrl({
    required CygnusWebUri url,
    Map<String, String>? headers,
    List<CygnusWebUri>? otherLikelyURLs,
    CygnusWebUri? referrer,
  }) => platform.launchUrl(
    url: url,
    headers: headers,
    otherLikelyURLs: otherLikelyURLs,
    referrer: referrer,
  );

  ///{@macro cygnus_core.CygnusPlatformChromeSafariBrowser.mayLaunchUrl}
  ///
  ///{@macro cygnus_core.CygnusPlatformChromeSafariBrowser.mayLaunchUrl.supported_platforms}
  Future<bool> mayLaunchUrl({CygnusWebUri? url, List<CygnusWebUri>? otherLikelyURLs}) =>
      platform.mayLaunchUrl(url: url, otherLikelyURLs: otherLikelyURLs);

  ///{@macro cygnus_core.CygnusPlatformChromeSafariBrowser.validateRelationship}
  ///
  ///{@macro cygnus_core.CygnusPlatformChromeSafariBrowser.validateRelationship.supported_platforms}
  Future<bool> validateRelationship({
    required CygnusCustomTabsRelationType relation,
    required CygnusWebUri origin,
  }) => platform.validateRelationship(relation: relation, origin: origin);

  ///{@macro cygnus_core.CygnusPlatformChromeSafariBrowser.close}
  ///
  ///{@macro cygnus_core.CygnusPlatformChromeSafariBrowser.close.supported_platforms}
  Future<void> close() => platform.close();

  ///{@macro cygnus_core.CygnusPlatformChromeSafariBrowser.isOpened}
  ///
  ///{@macro cygnus_core.CygnusPlatformChromeSafariBrowser.isOpened.supported_platforms}
  bool isOpened() => platform.isOpened();

  ///{@macro cygnus_core.CygnusPlatformChromeSafariBrowser.setActionButton}
  ///
  ///{@macro cygnus_core.CygnusPlatformChromeSafariBrowser.setActionButton.supported_platforms}
  void setActionButton(CygnusChromeSafariBrowserActionButton actionButton) =>
      platform.setActionButton(actionButton);

  ///{@macro cygnus_core.CygnusPlatformChromeSafariBrowser.updateActionButton}
  ///
  ///{@macro cygnus_core.CygnusPlatformChromeSafariBrowser.updateActionButton.supported_platforms}
  Future<void> updateActionButton({
    required Uint8List icon,
    required String description,
  }) => platform.updateActionButton(icon: icon, description: description);

  ///{@macro cygnus_core.CygnusPlatformChromeSafariBrowser.setSecondaryToolbar}
  ///
  ///{@macro cygnus_core.CygnusPlatformChromeSafariBrowser.setSecondaryToolbar.supported_platforms}
  void setSecondaryToolbar(
    CygnusChromeSafariBrowserSecondaryToolbar secondaryToolbar,
  ) => platform.setSecondaryToolbar(secondaryToolbar);

  ///{@macro cygnus_core.CygnusPlatformChromeSafariBrowser.updateSecondaryToolbar}
  ///
  ///{@macro cygnus_core.CygnusPlatformChromeSafariBrowser.updateSecondaryToolbar.supported_platforms}
  Future<void> updateSecondaryToolbar(
    CygnusChromeSafariBrowserSecondaryToolbar secondaryToolbar,
  ) => platform.updateSecondaryToolbar(secondaryToolbar);

  ///{@macro cygnus_core.CygnusPlatformChromeSafariBrowser.addMenuItem}
  ///
  ///{@macro cygnus_core.CygnusPlatformChromeSafariBrowser.addMenuItem.supported_platforms}
  void addMenuItem(CygnusChromeSafariBrowserMenuItem menuItem) =>
      platform.addMenuItem(menuItem);

  ///{@macro cygnus_core.CygnusPlatformChromeSafariBrowser.addMenuItems}
  ///
  ///{@macro cygnus_core.CygnusPlatformChromeSafariBrowser.addMenuItems.supported_platforms}
  void addMenuItems(List<CygnusChromeSafariBrowserMenuItem> menuItems) =>
      platform.addMenuItems(menuItems);

  ///{@macro cygnus_core.CygnusPlatformChromeSafariBrowser.requestPostMessageChannel}
  ///
  ///{@macro cygnus_core.CygnusPlatformChromeSafariBrowser.requestPostMessageChannel.supported_platforms}
  Future<bool> requestPostMessageChannel({
    required CygnusWebUri sourceOrigin,
    CygnusWebUri? targetOrigin,
  }) => platform.requestPostMessageChannel(
    sourceOrigin: sourceOrigin,
    targetOrigin: targetOrigin,
  );

  ///{@macro cygnus_core.CygnusPlatformChromeSafariBrowser.postMessage}
  ///
  ///{@macro cygnus_core.CygnusPlatformChromeSafariBrowser.postMessage.supported_platforms}
  Future<CygnusCustomTabsPostMessageResultType> postMessage(String message) =>
      platform.postMessage(message);

  ///{@macro cygnus_core.CygnusPlatformChromeSafariBrowser.isEngagementSignalsApiAvailable}
  ///
  ///{@macro cygnus_core.CygnusPlatformChromeSafariBrowser.isEngagementSignalsApiAvailable.supported_platforms}
  Future<bool> isEngagementSignalsApiAvailable() =>
      platform.isEngagementSignalsApiAvailable();

  ///{@macro cygnus_core.CygnusPlatformChromeSafariBrowser.isAvailable}
  ///
  ///{@macro cygnus_core.CygnusPlatformChromeSafariBrowser.isAvailable.supported_platforms}
  static Future<bool> isAvailable() =>
      CygnusPlatformChromeSafariBrowser.static().isAvailable();

  ///{@macro cygnus_core.CygnusPlatformChromeSafariBrowser.getMaxToolbarItems}
  ///
  ///{@macro cygnus_core.CygnusPlatformChromeSafariBrowser.getMaxToolbarItems.supported_platforms}
  static Future<int> getMaxToolbarItems() =>
      CygnusPlatformChromeSafariBrowser.static().getMaxToolbarItems();

  ///{@macro cygnus_core.CygnusPlatformChromeSafariBrowser.getPackageName}
  ///
  ///{@macro cygnus_core.CygnusPlatformChromeSafariBrowser.getPackageName.supported_platforms}
  static Future<String?> getPackageName({
    List<String>? packages,
    bool ignoreDefault = false,
  }) => CygnusPlatformChromeSafariBrowser.static().getPackageName(
    packages: packages,
    ignoreDefault: ignoreDefault,
  );

  ///{@macro cygnus_core.CygnusPlatformChromeSafariBrowser.clearWebsiteData}
  ///
  ///{@macro cygnus_core.CygnusPlatformChromeSafariBrowser.clearWebsiteData.supported_platforms}
  static Future<void> clearWebsiteData() =>
      CygnusPlatformChromeSafariBrowser.static().clearWebsiteData();

  ///{@macro cygnus_core.CygnusPlatformChromeSafariBrowser.prewarmConnections}
  ///
  ///{@macro cygnus_core.CygnusPlatformChromeSafariBrowser.prewarmConnections.supported_platforms}
  static Future<CygnusPrewarmingToken?> prewarmConnections(List<CygnusWebUri> URLs) =>
      CygnusPlatformChromeSafariBrowser.static().prewarmConnections(URLs);

  ///{@macro cygnus_core.CygnusPlatformChromeSafariBrowser.invalidatePrewarmingToken}
  ///
  ///{@macro cygnus_core.CygnusPlatformChromeSafariBrowser.invalidatePrewarmingToken.supported_platforms}
  static Future<void> invalidatePrewarmingToken(
    CygnusPrewarmingToken prewarmingToken,
  ) => CygnusPlatformChromeSafariBrowser.static().invalidatePrewarmingToken(
    prewarmingToken,
  );

  ///{@macro cygnus_core.CygnusPlatformChromeSafariBrowser.dispose}
  ///
  ///{@macro cygnus_core.CygnusPlatformChromeSafariBrowser.dispose.supported_platforms}
  @mustCallSuper
  void dispose() => platform.dispose();

  @override
  void onClosed() {}

  @override
  void onCompletedInitialLoad(bool? didLoadSuccessfully) {}

  @override
  void onGreatestScrollPercentageIncreased(int scrollPercentage) {}

  @override
  void onInitialLoadDidRedirect(CygnusWebUri? url) {}

  @override
  void onMessageChannelReady() {}

  @override
  void onNavigationEvent(CygnusCustomTabsNavigationEventType? navigationEvent) {}

  @override
  void onOpened() {}

  @override
  void onPostMessage(String message) {}

  @override
  void onRelationshipValidationResult(
    CygnusCustomTabsRelationType? relation,
    CygnusWebUri? requestedOrigin,
    bool result,
  ) {}

  @override
  void onServiceConnected() {}

  @override
  void onSessionEnded(bool didUserInteract) {}

  @override
  void onVerticalScrollEvent(bool isDirectionUp) {}

  @override
  void onWillOpenInBrowser() {}

  ///{@macro cygnus_core.CygnusPlatformChromeSafariBrowser.isClassSupported}
  static bool isClassSupported({TargetPlatform? platform}) =>
      CygnusPlatformChromeSafariBrowser.static().isClassSupported(platform: platform);

  ///{@macro cygnus_core.CygnusPlatformChromeSafariBrowser.isMethodSupported}
  static bool isMethodSupported(
    CygnusPlatformChromeSafariBrowserMethod property, {
    TargetPlatform? platform,
  }) => CygnusPlatformChromeSafariBrowser.static().isMethodSupported(
    property,
    platform: platform,
  );

  ///{@macro cygnus_core.CygnusPlatformChromeSafariBrowserEvents.isMethodSupported}
  static bool isEventMethodSupported(
    CygnusPlatformChromeSafariBrowserEventsMethod method, {
    TargetPlatform? platform,
  }) => CygnusPlatformChromeSafariBrowserEvents.isMethodSupported(
    method,
    platform: platform,
  );
}
