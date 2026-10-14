import 'dart:core';

import 'package:cygnus_core/src/platform_interface/flutter_webview_platform_interface.dart';

import '../webview_controller.dart';

///Use [CygnusWebViewController] instead.
@Deprecated("Use CygnusWebViewController instead")
class CygnusAndroidWebViewController {
  CygnusPlatformWebViewController? _controller;

  CygnusAndroidWebViewController({
    required CygnusPlatformWebViewController controller,
  }) {
    this._controller = controller;
  }

  ///Use [CygnusWebViewController.startSafeBrowsing] instead.
  @Deprecated("Use CygnusWebViewController.startSafeBrowsing instead")
  Future<bool> startSafeBrowsing() async {
    return await _controller?.startSafeBrowsing() ?? false;
  }

  ///Use [CygnusWebViewController.clearSslPreferences] instead.
  @Deprecated("Use CygnusWebViewController.clearSslPreferences instead")
  Future<void> clearSslPreferences() async {
    await _controller?.clearSslPreferences();
  }

  ///Use [CygnusWebViewController.pause] instead.
  @Deprecated("Use CygnusWebViewController.pause instead")
  Future<void> pause() async {
    await _controller?.pause();
  }

  ///Use [CygnusWebViewController.resume] instead.
  @Deprecated("Use CygnusWebViewController.resume instead")
  Future<void> resume() async {
    await _controller?.resume();
  }

  ///Use [CygnusWebViewController.pageDown] instead.
  @Deprecated("Use CygnusWebViewController.pageDown instead")
  Future<bool> pageDown({required bool bottom}) async {
    return await _controller?.pageDown(bottom: bottom) ?? false;
  }

  ///Use [CygnusWebViewController.pageUp] instead.
  @Deprecated("Use CygnusWebViewController.pageUp instead")
  Future<bool> pageUp({required bool top}) async {
    return await _controller?.pageUp(top: top) ?? false;
  }

  ///Use [CygnusWebViewController.zoomIn] instead.
  @Deprecated("Use CygnusWebViewController.zoomIn instead")
  Future<bool> zoomIn() async {
    return await _controller?.zoomIn() ?? false;
  }

  ///Use [CygnusWebViewController.zoomOut] instead.
  @Deprecated("Use CygnusWebViewController.zoomOut instead")
  Future<bool> zoomOut() async {
    return await _controller?.zoomOut() ?? false;
  }

  ///Use [CygnusWebViewController.clearHistory] instead.
  @Deprecated("Use CygnusWebViewController.clearHistory instead")
  Future<void> clearHistory() async {
    await _controller?.clearHistory();
  }

  ///Use [CygnusWebViewController.clearClientCertPreferences] instead.
  @Deprecated("Use CygnusWebViewController.clearClientCertPreferences instead")
  static Future<void> clearClientCertPreferences() async {
    await CygnusWebViewController.clearClientCertPreferences();
  }

  ///Use [CygnusWebViewController.getSafeBrowsingPrivacyPolicyUrl] instead.
  @Deprecated(
    "Use CygnusWebViewController.getSafeBrowsingPrivacyPolicyUrl instead",
  )
  static Future<Uri?> getSafeBrowsingPrivacyPolicyUrl() async {
    return await CygnusWebViewController.getSafeBrowsingPrivacyPolicyUrl();
  }

  ///Use [CygnusWebViewController.setSafeBrowsingWhitelist] instead.
  @Deprecated("Use CygnusWebViewController.setSafeBrowsingAllowlist instead")
  static Future<bool> setSafeBrowsingWhitelist({
    required List<String> hosts,
  }) async {
    return await CygnusWebViewController.setSafeBrowsingAllowlist(hosts: hosts);
  }

  ///Use [CygnusWebViewController.getCurrentWebViewPackage] instead.
  @Deprecated("Use CygnusWebViewController.getCurrentWebViewPackage instead")
  static Future<CygnusAndroidWebViewPackageInfo?> getCurrentWebViewPackage() async {
    Map<String, dynamic>? packageInfo =
        (await CygnusWebViewController.getCurrentWebViewPackage())?.toMap();
    return CygnusAndroidWebViewPackageInfo.fromMap(packageInfo);
  }

  ///Use [CygnusWebViewController.setWebContentsDebuggingEnabled] instead.
  @Deprecated(
    "Use CygnusWebViewController.setWebContentsDebuggingEnabled instead",
  )
  static Future<void> setWebContentsDebuggingEnabled(
    bool debuggingEnabled,
  ) async {
    return await CygnusWebViewController.setWebContentsDebuggingEnabled(
      debuggingEnabled,
    );
  }

  ///Use [CygnusWebViewController.getOriginalUrl] instead.
  @Deprecated('Use CygnusWebViewController.getOriginalUrl instead')
  Future<Uri?> getOriginalUrl() async {
    return await _controller?.getOriginalUrl();
  }

  void dispose() {
    _controller = null;
  }
}
