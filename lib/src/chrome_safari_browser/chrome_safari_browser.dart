import 'dart:async';
import 'dart:typed_data';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:cygnus_core/src/platform_interface/flutter_inappwebview_platform_interface.dart';

///{@macro cygnus_core.PlatformChromeSafariBrowser}
///
///{@macro cygnus_core.PlatformChromeSafariBrowser.supported_platforms}
class ChromeSafariBrowser implements PlatformChromeSafariBrowserEvents {
  ///Constructs a [ChromeSafariBrowser].
  ///
  ///{@macro cygnus_core.PlatformChromeSafariBrowser}
  ///
  ///{@macro cygnus_core.PlatformChromeSafariBrowser.supported_platforms}
  ChromeSafariBrowser()
    : this.fromPlatformCreationParams(
        PlatformChromeSafariBrowserCreationParams(),
      );

  /// Constructs a [ChromeSafariBrowser] from creation params for a specific
  /// platform.
  ChromeSafariBrowser.fromPlatformCreationParams(
    PlatformChromeSafariBrowserCreationParams params,
  ) : this.fromPlatform(PlatformChromeSafariBrowser(params));

  /// Constructs a [ChromeSafariBrowser] from a specific platform
  /// implementation.
  ChromeSafariBrowser.fromPlatform(this.platform) {
    this.platform.eventHandler = this;
  }

  /// Implementation of [PlatformChromeSafariBrowser] for the current platform.
  final PlatformChromeSafariBrowser platform;

  ///{@macro cygnus_core.PlatformChromeSafariBrowser.id}
  ///
  ///{@macro cygnus_core.PlatformChromeSafariBrowser.id.supported_platforms}
  String get id => platform.id;

  ///{@macro cygnus_core.PlatformChromeSafariBrowser.open}
  ///
  ///{@macro cygnus_core.PlatformChromeSafariBrowser.open.supported_platforms}
  Future<void> open({
    WebUri? url,
    Map<String, String>? headers,
    List<WebUri>? otherLikelyURLs,
    WebUri? referrer,
    @Deprecated('Use settings instead')
    // ignore: deprecated_member_use_from_same_package
    ChromeSafariBrowserClassOptions? options,
    ChromeSafariBrowserSettings? settings,
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

  ///{@macro cygnus_core.PlatformChromeSafariBrowser.launchUrl}
  ///
  ///{@macro cygnus_core.PlatformChromeSafariBrowser.launchUrl.supported_platforms}
  Future<void> launchUrl({
    required WebUri url,
    Map<String, String>? headers,
    List<WebUri>? otherLikelyURLs,
    WebUri? referrer,
  }) => platform.launchUrl(
    url: url,
    headers: headers,
    otherLikelyURLs: otherLikelyURLs,
    referrer: referrer,
  );

  ///{@macro cygnus_core.PlatformChromeSafariBrowser.mayLaunchUrl}
  ///
  ///{@macro cygnus_core.PlatformChromeSafariBrowser.mayLaunchUrl.supported_platforms}
  Future<bool> mayLaunchUrl({WebUri? url, List<WebUri>? otherLikelyURLs}) =>
      platform.mayLaunchUrl(url: url, otherLikelyURLs: otherLikelyURLs);

  ///{@macro cygnus_core.PlatformChromeSafariBrowser.validateRelationship}
  ///
  ///{@macro cygnus_core.PlatformChromeSafariBrowser.validateRelationship.supported_platforms}
  Future<bool> validateRelationship({
    required CustomTabsRelationType relation,
    required WebUri origin,
  }) => platform.validateRelationship(relation: relation, origin: origin);

  ///{@macro cygnus_core.PlatformChromeSafariBrowser.close}
  ///
  ///{@macro cygnus_core.PlatformChromeSafariBrowser.close.supported_platforms}
  Future<void> close() => platform.close();

  ///{@macro cygnus_core.PlatformChromeSafariBrowser.isOpened}
  ///
  ///{@macro cygnus_core.PlatformChromeSafariBrowser.isOpened.supported_platforms}
  bool isOpened() => platform.isOpened();

  ///{@macro cygnus_core.PlatformChromeSafariBrowser.setActionButton}
  ///
  ///{@macro cygnus_core.PlatformChromeSafariBrowser.setActionButton.supported_platforms}
  void setActionButton(ChromeSafariBrowserActionButton actionButton) =>
      platform.setActionButton(actionButton);

  ///{@macro cygnus_core.PlatformChromeSafariBrowser.updateActionButton}
  ///
  ///{@macro cygnus_core.PlatformChromeSafariBrowser.updateActionButton.supported_platforms}
  Future<void> updateActionButton({
    required Uint8List icon,
    required String description,
  }) => platform.updateActionButton(icon: icon, description: description);

  ///{@macro cygnus_core.PlatformChromeSafariBrowser.setSecondaryToolbar}
  ///
  ///{@macro cygnus_core.PlatformChromeSafariBrowser.setSecondaryToolbar.supported_platforms}
  void setSecondaryToolbar(
    ChromeSafariBrowserSecondaryToolbar secondaryToolbar,
  ) => platform.setSecondaryToolbar(secondaryToolbar);

  ///{@macro cygnus_core.PlatformChromeSafariBrowser.updateSecondaryToolbar}
  ///
  ///{@macro cygnus_core.PlatformChromeSafariBrowser.updateSecondaryToolbar.supported_platforms}
  Future<void> updateSecondaryToolbar(
    ChromeSafariBrowserSecondaryToolbar secondaryToolbar,
  ) => platform.updateSecondaryToolbar(secondaryToolbar);

  ///{@macro cygnus_core.PlatformChromeSafariBrowser.addMenuItem}
  ///
  ///{@macro cygnus_core.PlatformChromeSafariBrowser.addMenuItem.supported_platforms}
  void addMenuItem(ChromeSafariBrowserMenuItem menuItem) =>
      platform.addMenuItem(menuItem);

  ///{@macro cygnus_core.PlatformChromeSafariBrowser.addMenuItems}
  ///
  ///{@macro cygnus_core.PlatformChromeSafariBrowser.addMenuItems.supported_platforms}
  void addMenuItems(List<ChromeSafariBrowserMenuItem> menuItems) =>
      platform.addMenuItems(menuItems);

  ///{@macro cygnus_core.PlatformChromeSafariBrowser.requestPostMessageChannel}
  ///
  ///{@macro cygnus_core.PlatformChromeSafariBrowser.requestPostMessageChannel.supported_platforms}
  Future<bool> requestPostMessageChannel({
    required WebUri sourceOrigin,
    WebUri? targetOrigin,
  }) => platform.requestPostMessageChannel(
    sourceOrigin: sourceOrigin,
    targetOrigin: targetOrigin,
  );

  ///{@macro cygnus_core.PlatformChromeSafariBrowser.postMessage}
  ///
  ///{@macro cygnus_core.PlatformChromeSafariBrowser.postMessage.supported_platforms}
  Future<CustomTabsPostMessageResultType> postMessage(String message) =>
      platform.postMessage(message);

  ///{@macro cygnus_core.PlatformChromeSafariBrowser.isEngagementSignalsApiAvailable}
  ///
  ///{@macro cygnus_core.PlatformChromeSafariBrowser.isEngagementSignalsApiAvailable.supported_platforms}
  Future<bool> isEngagementSignalsApiAvailable() =>
      platform.isEngagementSignalsApiAvailable();

  ///{@macro cygnus_core.PlatformChromeSafariBrowser.isAvailable}
  ///
  ///{@macro cygnus_core.PlatformChromeSafariBrowser.isAvailable.supported_platforms}
  static Future<bool> isAvailable() =>
      PlatformChromeSafariBrowser.static().isAvailable();

  ///{@macro cygnus_core.PlatformChromeSafariBrowser.getMaxToolbarItems}
  ///
  ///{@macro cygnus_core.PlatformChromeSafariBrowser.getMaxToolbarItems.supported_platforms}
  static Future<int> getMaxToolbarItems() =>
      PlatformChromeSafariBrowser.static().getMaxToolbarItems();

  ///{@macro cygnus_core.PlatformChromeSafariBrowser.getPackageName}
  ///
  ///{@macro cygnus_core.PlatformChromeSafariBrowser.getPackageName.supported_platforms}
  static Future<String?> getPackageName({
    List<String>? packages,
    bool ignoreDefault = false,
  }) => PlatformChromeSafariBrowser.static().getPackageName(
    packages: packages,
    ignoreDefault: ignoreDefault,
  );

  ///{@macro cygnus_core.PlatformChromeSafariBrowser.clearWebsiteData}
  ///
  ///{@macro cygnus_core.PlatformChromeSafariBrowser.clearWebsiteData.supported_platforms}
  static Future<void> clearWebsiteData() =>
      PlatformChromeSafariBrowser.static().clearWebsiteData();

  ///{@macro cygnus_core.PlatformChromeSafariBrowser.prewarmConnections}
  ///
  ///{@macro cygnus_core.PlatformChromeSafariBrowser.prewarmConnections.supported_platforms}
  static Future<PrewarmingToken?> prewarmConnections(List<WebUri> URLs) =>
      PlatformChromeSafariBrowser.static().prewarmConnections(URLs);

  ///{@macro cygnus_core.PlatformChromeSafariBrowser.invalidatePrewarmingToken}
  ///
  ///{@macro cygnus_core.PlatformChromeSafariBrowser.invalidatePrewarmingToken.supported_platforms}
  static Future<void> invalidatePrewarmingToken(
    PrewarmingToken prewarmingToken,
  ) => PlatformChromeSafariBrowser.static().invalidatePrewarmingToken(
    prewarmingToken,
  );

  ///{@macro cygnus_core.PlatformChromeSafariBrowser.dispose}
  ///
  ///{@macro cygnus_core.PlatformChromeSafariBrowser.dispose.supported_platforms}
  @mustCallSuper
  void dispose() => platform.dispose();

  @override
  void onClosed() {}

  @override
  void onCompletedInitialLoad(bool? didLoadSuccessfully) {}

  @override
  void onGreatestScrollPercentageIncreased(int scrollPercentage) {}

  @override
  void onInitialLoadDidRedirect(WebUri? url) {}

  @override
  void onMessageChannelReady() {}

  @override
  void onNavigationEvent(CustomTabsNavigationEventType? navigationEvent) {}

  @override
  void onOpened() {}

  @override
  void onPostMessage(String message) {}

  @override
  void onRelationshipValidationResult(
    CustomTabsRelationType? relation,
    WebUri? requestedOrigin,
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

  ///{@macro cygnus_core.PlatformChromeSafariBrowser.isClassSupported}
  static bool isClassSupported({TargetPlatform? platform}) =>
      PlatformChromeSafariBrowser.static().isClassSupported(platform: platform);

  ///{@macro cygnus_core.PlatformChromeSafariBrowser.isMethodSupported}
  static bool isMethodSupported(
    PlatformChromeSafariBrowserMethod property, {
    TargetPlatform? platform,
  }) => PlatformChromeSafariBrowser.static().isMethodSupported(
    property,
    platform: platform,
  );

  ///{@macro cygnus_core.PlatformChromeSafariBrowserEvents.isMethodSupported}
  static bool isEventMethodSupported(
    PlatformChromeSafariBrowserEventsMethod method, {
    TargetPlatform? platform,
  }) => PlatformChromeSafariBrowserEvents.isMethodSupported(
    method,
    platform: platform,
  );
}
