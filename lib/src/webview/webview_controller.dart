import 'dart:core';

import 'package:flutter/services.dart';
import 'package:cygnus_core/src/platform_interface/flutter_webview_platform_interface.dart';

import '../print_job/main.dart';
import '../web_message/main.dart';
import '../web_storage/web_storage.dart';
import 'android/webview_controller.dart';
import 'apple/webview_controller.dart';

///{@macro cygnus_core.CygnusPlatformWebViewController}
///
///{@macro cygnus_core.CygnusPlatformWebViewController.supported_platforms}
class CygnusWebViewController {
  ///Use [CygnusWebViewController] instead.
  @Deprecated("Use CygnusWebViewController instead")
  late CygnusAndroidWebViewController android;

  ///Use [CygnusWebViewController] instead.
  @Deprecated("Use CygnusWebViewController instead")
  late CygnusIOSWebViewController ios;

  /// Constructs a [CygnusWebViewController].
  ///
  /// See [CygnusWebViewController.fromPlatformCreationParams] for setting parameters for
  /// a specific platform.
  CygnusWebViewController.fromPlatformCreationParams({
    required CygnusPlatformWebViewControllerCreationParams params,
  }) : this.fromPlatform(platform: CygnusPlatformWebViewController(params));

  /// Constructs a [CygnusWebViewController] from a specific platform implementation.
  CygnusWebViewController.fromPlatform({required this.platform}) {
    android = CygnusAndroidWebViewController(controller: this.platform);
    ios = CygnusIOSWebViewController(controller: this.platform);
  }

  /// Implementation of [CygnusPlatformWebViewController] for the current platform.
  final CygnusPlatformWebViewController platform;

  ///{@macro cygnus_core.CygnusPlatformWebViewController.webStorage}
  ///
  ///{@macro cygnus_core.CygnusPlatformWebViewController.webStorage.supported_platforms}
  CygnusWebStorage get webStorage =>
      CygnusWebStorage.fromPlatform(platform: platform.webStorage);

  ///{@macro cygnus_core.CygnusPlatformWebViewController.getUrl}
  ///
  ///{@macro cygnus_core.CygnusPlatformWebViewController.getUrl.supported_platforms}
  Future<CygnusWebUri?> getUrl() => platform.getUrl();

  ///{@macro cygnus_core.CygnusPlatformWebViewController.getTitle}
  ///
  ///{@macro cygnus_core.CygnusPlatformWebViewController.getTitle.supported_platforms}
  Future<String?> getTitle() => platform.getTitle();

  ///{@macro cygnus_core.CygnusPlatformWebViewController.getFrameId}
  ///
  ///{@macro cygnus_core.CygnusPlatformWebViewController.getFrameId.supported_platforms}
  Future<int?> getFrameId() => platform.getFrameId();

  ///{@macro cygnus_core.CygnusPlatformWebViewController.getProgress}
  ///
  ///{@macro cygnus_core.CygnusPlatformWebViewController.getProgress.supported_platforms}
  Future<int?> getProgress() => platform.getProgress();

  ///{@macro cygnus_core.CygnusPlatformWebViewController.getHtml}
  ///
  ///{@macro cygnus_core.CygnusPlatformWebViewController.getHtml.supported_platforms}
  Future<String?> getHtml() => platform.getHtml();

  ///{@macro cygnus_core.CygnusPlatformWebViewController.getFavicons}
  ///
  ///{@macro cygnus_core.CygnusPlatformWebViewController.getFavicons.supported_platforms}
  Future<List<CygnusFavicon>> getFavicons() => platform.getFavicons();

  ///{@macro cygnus_core.CygnusPlatformWebViewController.getFavicon}
  ///
  ///{@macro cygnus_core.CygnusPlatformWebViewController.getFavicon.supported_platforms}
  Future<Uint8List?> getFavicon({
    required CygnusWebUri url,
    CygnusFaviconImageFormat faviconImageFormat = CygnusFaviconImageFormat.PNG,
  }) => platform.getFavicon(url: url, faviconImageFormat: faviconImageFormat);

  ///{@macro cygnus_core.CygnusPlatformWebViewController.showSaveAsUI}
  ///
  ///{@macro cygnus_core.CygnusPlatformWebViewController.showSaveAsUI.supported_platforms}
  Future<CygnusSaveAsUIResult?> showSaveAsUI() => platform.showSaveAsUI();

  ///{@macro cygnus_core.CygnusPlatformWebViewController.getMemoryUsageTargetLevel}
  ///
  ///{@macro cygnus_core.CygnusPlatformWebViewController.getMemoryUsageTargetLevel.supported_platforms}
  Future<CygnusMemoryUsageTargetLevel?> getMemoryUsageTargetLevel() =>
      platform.getMemoryUsageTargetLevel();

  ///{@macro cygnus_core.CygnusPlatformWebViewController.setMemoryUsageTargetLevel}
  ///
  ///{@macro cygnus_core.CygnusPlatformWebViewController.setMemoryUsageTargetLevel.supported_platforms}
  Future<void> setMemoryUsageTargetLevel(CygnusMemoryUsageTargetLevel level) =>
      platform.setMemoryUsageTargetLevel(level);

  ///{@macro cygnus_core.CygnusPlatformWebViewController.loadUrl}
  ///
  ///{@macro cygnus_core.CygnusPlatformWebViewController.loadUrl.supported_platforms}
  Future<void> loadUrl({
    required CygnusURLRequest urlRequest,
    @Deprecated('Use allowingReadAccessTo instead')
    Uri? iosAllowingReadAccessTo,
    CygnusWebUri? allowingReadAccessTo,
  }) => platform.loadUrl(
    urlRequest: urlRequest,
    iosAllowingReadAccessTo: iosAllowingReadAccessTo,
    allowingReadAccessTo: allowingReadAccessTo,
  );

  ///{@macro cygnus_core.CygnusPlatformWebViewController.postUrl}
  ///
  ///{@macro cygnus_core.CygnusPlatformWebViewController.postUrl.supported_platforms}
  Future<void> postUrl({required CygnusWebUri url, required Uint8List postData}) =>
      platform.postUrl(url: url, postData: postData);

  ///{@macro cygnus_core.CygnusPlatformWebViewController.loadData}
  ///
  ///{@macro cygnus_core.CygnusPlatformWebViewController.loadData.supported_platforms}
  Future<void> loadData({
    required String data,
    String mimeType = "text/html",
    String encoding = "utf8",
    CygnusWebUri? baseUrl,
    @Deprecated('Use historyUrl instead') Uri? androidHistoryUrl,
    CygnusWebUri? historyUrl,
    @Deprecated('Use allowingReadAccessTo instead')
    Uri? iosAllowingReadAccessTo,
    CygnusWebUri? allowingReadAccessTo,
  }) => platform.loadData(
    data: data,
    mimeType: mimeType,
    encoding: encoding,
    baseUrl: baseUrl,
    androidHistoryUrl: androidHistoryUrl,
    historyUrl: historyUrl,
    iosAllowingReadAccessTo: iosAllowingReadAccessTo,
    allowingReadAccessTo: allowingReadAccessTo,
  );

  ///{@macro cygnus_core.CygnusPlatformWebViewController.loadFile}
  ///
  ///{@macro cygnus_core.CygnusPlatformWebViewController.loadFile.supported_platforms}
  Future<void> loadFile({required String assetFilePath}) =>
      platform.loadFile(assetFilePath: assetFilePath);

  ///{@macro cygnus_core.CygnusPlatformWebViewController.reload}
  ///
  ///{@macro cygnus_core.CygnusPlatformWebViewController.reload.supported_platforms}
  Future<void> reload() => platform.reload();

  ///{@macro cygnus_core.CygnusPlatformWebViewController.goBack}
  ///
  ///{@macro cygnus_core.CygnusPlatformWebViewController.goBack.supported_platforms}
  Future<void> goBack() => platform.goBack();

  ///{@macro cygnus_core.CygnusPlatformWebViewController.canGoBack}
  ///
  ///{@macro cygnus_core.CygnusPlatformWebViewController.canGoBack.supported_platforms}
  Future<bool> canGoBack() => platform.canGoBack();

  ///{@macro cygnus_core.CygnusPlatformWebViewController.goForward}
  ///
  ///{@macro cygnus_core.CygnusPlatformWebViewController.goForward.supported_platforms}
  Future<void> goForward() => platform.goForward();

  ///{@macro cygnus_core.CygnusPlatformWebViewController.canGoForward}
  ///
  ///{@macro cygnus_core.CygnusPlatformWebViewController.canGoForward.supported_platforms}
  Future<bool> canGoForward() => platform.canGoForward();

  ///{@macro cygnus_core.CygnusPlatformWebViewController.goBackOrForward}
  ///
  ///{@macro cygnus_core.CygnusPlatformWebViewController.goBackOrForward.supported_platforms}
  Future<void> goBackOrForward({required int steps}) =>
      platform.goBackOrForward(steps: steps);

  ///{@macro cygnus_core.CygnusPlatformWebViewController.canGoBackOrForward}
  ///
  ///{@macro cygnus_core.CygnusPlatformWebViewController.canGoBackOrForward.supported_platforms}
  Future<bool> canGoBackOrForward({required int steps}) =>
      platform.canGoBackOrForward(steps: steps);

  ///{@macro cygnus_core.CygnusPlatformWebViewController.goTo}
  ///
  ///{@macro cygnus_core.CygnusPlatformWebViewController.goTo.supported_platforms}
  Future<void> goTo({required CygnusWebHistoryItem historyItem}) =>
      platform.goTo(historyItem: historyItem);

  ///{@macro cygnus_core.CygnusPlatformWebViewController.isLoading}
  ///
  ///{@macro cygnus_core.CygnusPlatformWebViewController.isLoading.supported_platforms}
  Future<bool> isLoading() => platform.isLoading();

  ///{@macro cygnus_core.CygnusPlatformWebViewController.stopLoading}
  ///
  ///{@macro cygnus_core.CygnusPlatformWebViewController.stopLoading.supported_platforms}
  Future<void> stopLoading() => platform.stopLoading();

  ///{@macro cygnus_core.CygnusPlatformWebViewController.evaluateJavascript}
  ///
  ///{@macro cygnus_core.CygnusPlatformWebViewController.evaluateJavascript.supported_platforms}
  Future<dynamic> evaluateJavascript({
    required String source,
    CygnusContentWorld? contentWorld,
  }) => platform.evaluateJavascript(source: source, contentWorld: contentWorld);

  ///{@macro cygnus_core.CygnusPlatformWebViewController.injectJavascriptFileFromUrl}
  ///
  ///{@macro cygnus_core.CygnusPlatformWebViewController.injectJavascriptFileFromUrl.supported_platforms}
  Future<void> injectJavascriptFileFromUrl({
    required CygnusWebUri urlFile,
    CygnusScriptHtmlTagAttributes? scriptHtmlTagAttributes,
  }) => platform.injectJavascriptFileFromUrl(
    urlFile: urlFile,
    scriptHtmlTagAttributes: scriptHtmlTagAttributes,
  );

  ///{@macro cygnus_core.CygnusPlatformWebViewController.injectJavascriptFileFromAsset}
  ///
  ///{@macro cygnus_core.CygnusPlatformWebViewController.injectJavascriptFileFromAsset.supported_platforms}
  Future<dynamic> injectJavascriptFileFromAsset({
    required String assetFilePath,
  }) => platform.injectJavascriptFileFromAsset(assetFilePath: assetFilePath);

  ///{@macro cygnus_core.CygnusPlatformWebViewController.injectCSSCode}
  ///
  ///{@macro cygnus_core.CygnusPlatformWebViewController.injectCSSCode.supported_platforms}
  Future<void> injectCSSCode({required String source}) =>
      platform.injectCSSCode(source: source);

  ///{@macro cygnus_core.CygnusPlatformWebViewController.injectCSSFileFromUrl}
  ///
  ///{@macro cygnus_core.CygnusPlatformWebViewController.injectCSSFileFromUrl.supported_platforms}
  Future<void> injectCSSFileFromUrl({
    required CygnusWebUri urlFile,
    CygnusCSSLinkHtmlTagAttributes? cssLinkHtmlTagAttributes,
  }) => platform.injectCSSFileFromUrl(
    urlFile: urlFile,
    cssLinkHtmlTagAttributes: cssLinkHtmlTagAttributes,
  );

  ///{@macro cygnus_core.CygnusPlatformWebViewController.injectCSSFileFromAsset}
  ///
  ///{@macro cygnus_core.CygnusPlatformWebViewController.injectCSSFileFromAsset.supported_platforms}
  Future<void> injectCSSFileFromAsset({required String assetFilePath}) =>
      platform.injectCSSFileFromAsset(assetFilePath: assetFilePath);

  ///{@macro cygnus_core.CygnusPlatformWebViewController.addJavaScriptHandler}
  ///
  ///{@macro cygnus_core.CygnusPlatformWebViewController.addJavaScriptHandler.supported_platforms}
  void addJavaScriptHandler({
    required String handlerName,
    required Function callback,
  }) => platform.addJavaScriptHandler(
    handlerName: handlerName,
    callback: callback,
  );

  ///{@macro cygnus_core.CygnusPlatformWebViewController.removeJavaScriptHandler}
  ///
  ///{@macro cygnus_core.CygnusPlatformWebViewController.removeJavaScriptHandler.supported_platforms}
  Function? removeJavaScriptHandler({required String handlerName}) =>
      platform.removeJavaScriptHandler(handlerName: handlerName);

  ///{@macro cygnus_core.CygnusPlatformWebViewController.hasJavaScriptHandler}
  ///
  ///{@macro cygnus_core.CygnusPlatformWebViewController.hasJavaScriptHandler.supported_platforms}
  bool hasJavaScriptHandler({required String handlerName}) =>
      platform.hasJavaScriptHandler(handlerName: handlerName);

  ///{@macro cygnus_core.CygnusPlatformWebViewController.takeScreenshot}
  ///
  ///{@macro cygnus_core.CygnusPlatformWebViewController.takeScreenshot.supported_platforms}
  Future<Uint8List?> takeScreenshot({
    CygnusScreenshotConfiguration? screenshotConfiguration,
  }) =>
      platform.takeScreenshot(screenshotConfiguration: screenshotConfiguration);

  ///{@macro cygnus_core.CygnusPlatformWebViewController.setOptions}
  ///
  ///{@macro cygnus_core.CygnusPlatformWebViewController.setOptions.supported_platforms}
  @Deprecated('Use setSettings instead')
  Future<void> setOptions({required CygnusWebViewGroupOptions options}) =>
      platform.setOptions(options: options);

  ///{@macro cygnus_core.CygnusPlatformWebViewController.getOptions}
  ///
  ///{@macro cygnus_core.CygnusPlatformWebViewController.getOptions.supported_platforms}
  @Deprecated('Use getSettings instead')
  Future<CygnusWebViewGroupOptions?> getOptions() => platform.getOptions();

  ///{@macro cygnus_core.CygnusPlatformWebViewController.setSettings}
  ///
  ///{@macro cygnus_core.CygnusPlatformWebViewController.setSettings.supported_platforms}
  Future<void> setSettings({required CygnusWebViewSettings settings}) =>
      platform.setSettings(settings: settings);

  ///{@macro cygnus_core.CygnusPlatformWebViewController.getSettings}
  ///
  ///{@macro cygnus_core.CygnusPlatformWebViewController.getSettings.supported_platforms}
  Future<CygnusWebViewSettings?> getSettings() => platform.getSettings();

  ///{@macro cygnus_core.CygnusPlatformWebViewController.getCopyBackForwardList}
  ///
  ///{@macro cygnus_core.CygnusPlatformWebViewController.getCopyBackForwardList.supported_platforms}
  Future<CygnusWebHistory?> getCopyBackForwardList() =>
      platform.getCopyBackForwardList();

  ///{@macro cygnus_core.CygnusPlatformWebViewController.clearCache}
  ///
  ///{@macro cygnus_core.CygnusPlatformWebViewController.clearCache.supported_platforms}
  @Deprecated("Use CygnusWebViewController.clearAllCache instead")
  Future<void> clearCache() => platform.clearCache();

  ///{@macro cygnus_core.CygnusPlatformWebViewController.findAllAsync}
  ///
  ///{@macro cygnus_core.CygnusPlatformWebViewController.findAllAsync.supported_platforms}
  @Deprecated("Use CygnusFindInteractionController.findAll instead")
  Future<void> findAllAsync({required String find}) =>
      platform.findAllAsync(find: find);

  ///{@macro cygnus_core.CygnusPlatformWebViewController.findNext}
  ///
  ///{@macro cygnus_core.CygnusPlatformWebViewController.findNext.supported_platforms}
  @Deprecated("Use CygnusFindInteractionController.findNext instead")
  Future<void> findNext({required bool forward}) =>
      platform.findNext(forward: forward);

  ///{@macro cygnus_core.CygnusPlatformWebViewController.clearMatches}
  ///
  ///{@macro cygnus_core.CygnusPlatformWebViewController.clearMatches.supported_platforms}
  @Deprecated("Use CygnusFindInteractionController.clearMatches instead")
  Future<void> clearMatches() => platform.clearMatches();

  ///{@macro cygnus_core.CygnusPlatformWebViewController.getTRexRunnerHtml}
  ///
  ///{@macro cygnus_core.CygnusPlatformWebViewController.getTRexRunnerHtml.supported_platforms}
  @Deprecated("Use tRexRunnerHtml instead")
  Future<String> getTRexRunnerHtml() => platform.getTRexRunnerHtml();

  ///{@macro cygnus_core.CygnusPlatformWebViewController.getTRexRunnerCss}
  ///
  ///{@macro cygnus_core.CygnusPlatformWebViewController.getTRexRunnerCss.supported_platforms}
  @Deprecated("Use tRexRunnerCss instead")
  Future<String> getTRexRunnerCss() => platform.getTRexRunnerCss();

  ///{@macro cygnus_core.CygnusPlatformWebViewController.scrollTo}
  ///
  ///{@macro cygnus_core.CygnusPlatformWebViewController.scrollTo.supported_platforms}
  Future<void> scrollTo({
    required int x,
    required int y,
    bool animated = false,
  }) => platform.scrollTo(x: x, y: y, animated: animated);

  ///{@macro cygnus_core.CygnusPlatformWebViewController.scrollBy}
  ///
  ///{@macro cygnus_core.CygnusPlatformWebViewController.scrollBy.supported_platforms}
  Future<void> scrollBy({
    required int x,
    required int y,
    bool animated = false,
  }) => platform.scrollBy(x: x, y: y, animated: animated);

  ///{@macro cygnus_core.CygnusPlatformWebViewController.pauseTimers}
  ///
  ///{@macro cygnus_core.CygnusPlatformWebViewController.pauseTimers.supported_platforms}
  Future<void> pauseTimers() => platform.pauseTimers();

  ///{@macro cygnus_core.CygnusPlatformWebViewController.resumeTimers}
  ///
  ///{@macro cygnus_core.CygnusPlatformWebViewController.resumeTimers.supported_platforms}
  Future<void> resumeTimers() => platform.resumeTimers();

  ///{@macro cygnus_core.CygnusPlatformWebViewController.printCurrentPage}
  ///
  ///{@macro cygnus_core.CygnusPlatformWebViewController.printCurrentPage.supported_platforms}
  Future<CygnusPrintJobController?> printCurrentPage({
    CygnusPrintJobSettings? settings,
  }) async {
    final printJobControllerPlatform = await platform.printCurrentPage(
      settings: settings,
    );
    if (printJobControllerPlatform == null) {
      return null;
    }
    return CygnusPrintJobController.fromPlatform(
      platform: printJobControllerPlatform,
    );
  }

  ///{@macro cygnus_core.CygnusPlatformWebViewController.getContentHeight}
  ///
  ///{@macro cygnus_core.CygnusPlatformWebViewController.getContentHeight.supported_platforms}
  Future<int?> getContentHeight() => platform.getContentHeight();

  ///{@macro cygnus_core.CygnusPlatformWebViewController.getContentWidth}
  ///
  ///{@macro cygnus_core.CygnusPlatformWebViewController.getContentWidth.supported_platforms}
  Future<int?> getContentWidth() => platform.getContentWidth();

  ///{@macro cygnus_core.CygnusPlatformWebViewController.zoomBy}
  ///
  ///{@macro cygnus_core.CygnusPlatformWebViewController.zoomBy.supported_platforms}
  Future<void> zoomBy({
    required double zoomFactor,
    @Deprecated('Use animated instead') bool? iosAnimated,
    bool animated = false,
  }) => platform.zoomBy(
    zoomFactor: zoomFactor,
    iosAnimated: iosAnimated,
    animated: animated,
  );

  ///{@macro cygnus_core.CygnusPlatformWebViewController.getOriginalUrl}
  ///
  ///{@macro cygnus_core.CygnusPlatformWebViewController.getOriginalUrl.supported_platforms}
  Future<CygnusWebUri?> getOriginalUrl() => platform.getOriginalUrl();

  ///{@macro cygnus_core.CygnusPlatformWebViewController.getZoomScale}
  ///
  ///{@macro cygnus_core.CygnusPlatformWebViewController.getZoomScale.supported_platforms}
  Future<double?> getZoomScale() => platform.getZoomScale();

  ///{@macro cygnus_core.CygnusPlatformWebViewController.getScale}
  ///
  ///{@macro cygnus_core.CygnusPlatformWebViewController.getScale.supported_platforms}
  @Deprecated('Use getZoomScale instead')
  Future<double?> getScale() => platform.getScale();

  ///{@macro cygnus_core.CygnusPlatformWebViewController.getSelectedText}
  ///
  ///{@macro cygnus_core.CygnusPlatformWebViewController.getSelectedText.supported_platforms}
  Future<String?> getSelectedText() => platform.getSelectedText();

  ///{@macro cygnus_core.CygnusPlatformWebViewController.getHitTestResult}
  ///
  ///{@macro cygnus_core.CygnusPlatformWebViewController.getHitTestResult.supported_platforms}
  Future<CygnusWebViewHitTestResult?> getHitTestResult() =>
      platform.getHitTestResult();

  ///{@macro cygnus_core.CygnusPlatformWebViewController.requestFocus}
  ///
  ///{@macro cygnus_core.CygnusPlatformWebViewController.requestFocus.supported_platforms}
  Future<bool?> requestFocus({
    CygnusFocusDirection? direction,
    CygnusWebViewRect? previouslyFocusedRect,
  }) => platform.requestFocus(
    direction: direction,
    previouslyFocusedRect: previouslyFocusedRect,
  );

  ///{@macro cygnus_core.CygnusPlatformWebViewController.clearFocus}
  ///
  ///{@macro cygnus_core.CygnusPlatformWebViewController.clearFocus.supported_platforms}
  Future<void> clearFocus() => platform.clearFocus();

  ///{@macro cygnus_core.CygnusPlatformWebViewController.setInputMethodEnabled}
  ///
  ///{@macro cygnus_core.CygnusPlatformWebViewController.setInputMethodEnabled.supported_platforms}
  Future<void> setInputMethodEnabled(bool enabled) =>
      platform.setInputMethodEnabled(enabled);

  ///{@macro cygnus_core.CygnusPlatformWebViewController.showInputMethod}
  ///
  ///{@macro cygnus_core.CygnusPlatformWebViewController.showInputMethod.supported_platforms}
  Future<void> showInputMethod() => platform.showInputMethod();

  ///{@macro cygnus_core.CygnusPlatformWebViewController.hideInputMethod}
  ///
  ///{@macro cygnus_core.CygnusPlatformWebViewController.hideInputMethod.supported_platforms}
  Future<void> hideInputMethod() => platform.hideInputMethod();

  ///{@macro cygnus_core.CygnusPlatformWebViewController.setContextMenu}
  ///
  ///{@macro cygnus_core.CygnusPlatformWebViewController.setContextMenu.supported_platforms}
  Future<void> setContextMenu(CygnusContextMenu? contextMenu) =>
      platform.setContextMenu(contextMenu);

  ///{@macro cygnus_core.CygnusPlatformWebViewController.requestFocusNodeHref}
  ///
  ///{@macro cygnus_core.CygnusPlatformWebViewController.requestFocusNodeHref.supported_platforms}
  Future<CygnusRequestFocusNodeHrefResult?> requestFocusNodeHref() =>
      platform.requestFocusNodeHref();

  ///{@macro cygnus_core.CygnusPlatformWebViewController.requestImageRef}
  ///
  ///{@macro cygnus_core.CygnusPlatformWebViewController.requestImageRef.supported_platforms}
  Future<CygnusRequestImageRefResult?> requestImageRef() =>
      platform.requestImageRef();

  ///{@macro cygnus_core.CygnusPlatformWebViewController.getMetaTags}
  ///
  ///{@macro cygnus_core.CygnusPlatformWebViewController.getMetaTags.supported_platforms}
  Future<List<CygnusMetaTag>> getMetaTags() => platform.getMetaTags();

  ///{@macro cygnus_core.CygnusPlatformWebViewController.getMetaThemeColor}
  ///
  ///{@macro cygnus_core.CygnusPlatformWebViewController.getMetaThemeColor.supported_platforms}
  Future<Color?> getMetaThemeColor() => platform.getMetaThemeColor();

  ///{@macro cygnus_core.CygnusPlatformWebViewController.getScrollX}
  ///
  ///{@macro cygnus_core.CygnusPlatformWebViewController.getScrollX.supported_platforms}
  Future<int?> getScrollX() => platform.getScrollX();

  ///{@macro cygnus_core.CygnusPlatformWebViewController.getScrollY}
  ///
  ///{@macro cygnus_core.CygnusPlatformWebViewController.getScrollY.supported_platforms}
  Future<int?> getScrollY() => platform.getScrollY();

  ///{@macro cygnus_core.CygnusPlatformWebViewController.getCertificate}
  ///
  ///{@macro cygnus_core.CygnusPlatformWebViewController.getCertificate.supported_platforms}
  Future<CygnusSslCertificate?> getCertificate() => platform.getCertificate();

  ///{@macro cygnus_core.CygnusPlatformWebViewController.addUserScript}
  ///
  ///{@macro cygnus_core.CygnusPlatformWebViewController.addUserScript.supported_platforms}
  Future<void> addUserScript({required CygnusUserScript userScript}) =>
      platform.addUserScript(userScript: userScript);

  ///{@macro cygnus_core.CygnusPlatformWebViewController.addUserScripts}
  ///
  ///{@macro cygnus_core.CygnusPlatformWebViewController.addUserScripts.supported_platforms}
  Future<void> addUserScripts({required List<CygnusUserScript> userScripts}) =>
      platform.addUserScripts(userScripts: userScripts);

  ///{@macro cygnus_core.CygnusPlatformWebViewController.removeUserScript}
  ///
  ///{@macro cygnus_core.CygnusPlatformWebViewController.removeUserScript.supported_platforms}
  Future<bool> removeUserScript({required CygnusUserScript userScript}) =>
      platform.removeUserScript(userScript: userScript);

  ///{@macro cygnus_core.CygnusPlatformWebViewController.removeUserScriptsByGroupName}
  ///
  ///{@macro cygnus_core.CygnusPlatformWebViewController.removeUserScriptsByGroupName.supported_platforms}
  Future<void> removeUserScriptsByGroupName({required String groupName}) =>
      platform.removeUserScriptsByGroupName(groupName: groupName);

  ///{@macro cygnus_core.CygnusPlatformWebViewController.removeUserScripts}
  ///
  ///{@macro cygnus_core.CygnusPlatformWebViewController.removeUserScripts.supported_platforms}
  Future<void> removeUserScripts({required List<CygnusUserScript> userScripts}) =>
      platform.removeUserScripts(userScripts: userScripts);

  ///{@macro cygnus_core.CygnusPlatformWebViewController.removeAllUserScripts}
  ///
  ///{@macro cygnus_core.CygnusPlatformWebViewController.removeAllUserScripts.supported_platforms}
  Future<void> removeAllUserScripts() => platform.removeAllUserScripts();

  ///{@macro cygnus_core.CygnusPlatformWebViewController.hasUserScript}
  ///
  ///{@macro cygnus_core.CygnusPlatformWebViewController.hasUserScript.supported_platforms}
  bool hasUserScript({required CygnusUserScript userScript}) =>
      platform.hasUserScript(userScript: userScript);

  ///{@macro cygnus_core.CygnusPlatformWebViewController.callAsyncJavaScript}
  ///
  ///{@macro cygnus_core.CygnusPlatformWebViewController.callAsyncJavaScript.supported_platforms}
  Future<CygnusCallAsyncJavaScriptResult?> callAsyncJavaScript({
    required String functionBody,
    Map<String, dynamic> arguments = const <String, dynamic>{},
    CygnusContentWorld? contentWorld,
  }) => platform.callAsyncJavaScript(
    functionBody: functionBody,
    arguments: arguments,
    contentWorld: contentWorld,
  );

  ///{@macro cygnus_core.CygnusPlatformWebViewController.saveWebArchive}
  ///
  ///{@macro cygnus_core.CygnusPlatformWebViewController.saveWebArchive.supported_platforms}
  Future<String?> saveWebArchive({
    required String filePath,
    bool autoname = false,
  }) => platform.saveWebArchive(filePath: filePath, autoname: autoname);

  ///{@macro cygnus_core.CygnusPlatformWebViewController.isSecureContext}
  ///
  ///{@macro cygnus_core.CygnusPlatformWebViewController.isSecureContext.supported_platforms}
  Future<bool> isSecureContext() => platform.isSecureContext();

  ///{@macro cygnus_core.CygnusPlatformWebViewController.createWebMessageChannel}
  ///
  ///{@macro cygnus_core.CygnusPlatformWebViewController.createWebMessageChannel.supported_platforms}
  Future<CygnusWebMessageChannel?> createWebMessageChannel() async {
    final webMessagePlatform = await platform.createWebMessageChannel();
    if (webMessagePlatform == null) {
      return null;
    }
    return CygnusWebMessageChannel.fromPlatform(platform: webMessagePlatform);
  }

  ///{@macro cygnus_core.CygnusPlatformWebViewController.postWebMessage}
  ///
  ///{@macro cygnus_core.CygnusPlatformWebViewController.postWebMessage.supported_platforms}
  Future<void> postWebMessage({
    required CygnusWebMessage message,
    CygnusWebUri? targetOrigin,
  }) => platform.postWebMessage(message: message, targetOrigin: targetOrigin);

  ///{@macro cygnus_core.CygnusPlatformWebViewController.addWebMessageListener}
  ///
  ///{@macro cygnus_core.CygnusPlatformWebViewController.addWebMessageListener.supported_platforms}
  Future<void> addWebMessageListener(CygnusWebMessageListener webMessageListener) =>
      platform.addWebMessageListener(webMessageListener.platform);

  ///{@macro cygnus_core.CygnusPlatformWebViewController.hasWebMessageListener}
  ///
  ///{@macro cygnus_core.CygnusPlatformWebViewController.hasWebMessageListener.supported_platforms}
  bool hasWebMessageListener(CygnusWebMessageListener webMessageListener) =>
      platform.hasWebMessageListener(webMessageListener.platform);

  ///{@macro cygnus_core.CygnusPlatformWebViewController.canScrollVertically}
  ///
  ///{@macro cygnus_core.CygnusPlatformWebViewController.canScrollVertically.supported_platforms}
  Future<bool> canScrollVertically() => platform.canScrollVertically();

  ///{@macro cygnus_core.CygnusPlatformWebViewController.canScrollHorizontally}
  ///
  ///{@macro cygnus_core.CygnusPlatformWebViewController.canScrollHorizontally.supported_platforms}
  Future<bool> canScrollHorizontally() => platform.canScrollHorizontally();

  ///{@macro cygnus_core.CygnusPlatformWebViewController.startSafeBrowsing}
  ///
  ///{@macro cygnus_core.CygnusPlatformWebViewController.startSafeBrowsing.supported_platforms}
  Future<bool> startSafeBrowsing() => platform.startSafeBrowsing();

  ///{@macro cygnus_core.CygnusPlatformWebViewController.clearSslPreferences}
  ///
  ///{@macro cygnus_core.CygnusPlatformWebViewController.clearSslPreferences.supported_platforms}
  Future<void> clearSslPreferences() => platform.clearSslPreferences();

  ///{@macro cygnus_core.CygnusPlatformWebViewController.pause}
  ///
  ///{@macro cygnus_core.CygnusPlatformWebViewController.pause.supported_platforms}
  Future<void> pause() => platform.pause();

  ///{@macro cygnus_core.CygnusPlatformWebViewController.resume}
  ///
  ///{@macro cygnus_core.CygnusPlatformWebViewController.resume.supported_platforms}
  Future<void> resume() => platform.resume();

  ///{@macro cygnus_core.CygnusPlatformWebViewController.pageDown}
  ///
  ///{@macro cygnus_core.CygnusPlatformWebViewController.pageDown.supported_platforms}
  Future<bool> pageDown({required bool bottom}) =>
      platform.pageDown(bottom: bottom);

  ///{@macro cygnus_core.CygnusPlatformWebViewController.pageUp}
  ///
  ///{@macro cygnus_core.CygnusPlatformWebViewController.pageUp.supported_platforms}
  Future<bool> pageUp({required bool top}) => platform.pageUp(top: top);

  ///{@macro cygnus_core.CygnusPlatformWebViewController.zoomIn}
  ///
  ///{@macro cygnus_core.CygnusPlatformWebViewController.zoomIn.supported_platforms}
  Future<bool> zoomIn() => platform.zoomIn();

  ///{@macro cygnus_core.CygnusPlatformWebViewController.zoomOut}
  ///
  ///{@macro cygnus_core.CygnusPlatformWebViewController.zoomOut.supported_platforms}
  Future<bool> zoomOut() => platform.zoomOut();

  ///{@macro cygnus_core.CygnusPlatformWebViewController.clearHistory}
  ///
  ///{@macro cygnus_core.CygnusPlatformWebViewController.clearHistory.supported_platforms}
  Future<void> clearHistory() => platform.clearHistory();

  ///{@macro cygnus_core.CygnusPlatformWebViewController.reloadFromOrigin}
  ///
  ///{@macro cygnus_core.CygnusPlatformWebViewController.reloadFromOrigin.supported_platforms}
  Future<void> reloadFromOrigin() => platform.reloadFromOrigin();

  ///{@macro cygnus_core.CygnusPlatformWebViewController.createPdf}
  ///
  ///{@macro cygnus_core.CygnusPlatformWebViewController.createPdf.supported_platforms}
  Future<Uint8List?> createPdf({
    @Deprecated("Use pdfConfiguration instead")
    // ignore: deprecated_member_use_from_same_package
    CygnusIOSWKPDFConfiguration? iosWKPdfConfiguration,
    CygnusPDFConfiguration? pdfConfiguration,
  }) => platform.createPdf(
    iosWKPdfConfiguration: iosWKPdfConfiguration,
    pdfConfiguration: pdfConfiguration,
  );

  ///{@macro cygnus_core.CygnusPlatformWebViewController.createWebArchiveData}
  ///
  ///{@macro cygnus_core.CygnusPlatformWebViewController.createWebArchiveData.supported_platforms}
  Future<Uint8List?> createWebArchiveData() => platform.createWebArchiveData();

  ///{@macro cygnus_core.CygnusPlatformWebViewController.hasOnlySecureContent}
  ///
  ///{@macro cygnus_core.CygnusPlatformWebViewController.hasOnlySecureContent.supported_platforms}
  Future<bool> hasOnlySecureContent() => platform.hasOnlySecureContent();

  ///{@macro cygnus_core.CygnusPlatformWebViewController.pauseAllMediaPlayback}
  ///
  ///{@macro cygnus_core.CygnusPlatformWebViewController.pauseAllMediaPlayback.supported_platforms}
  Future<void> pauseAllMediaPlayback() => platform.pauseAllMediaPlayback();

  ///{@macro cygnus_core.CygnusPlatformWebViewController.setAllMediaPlaybackSuspended}
  ///
  ///{@macro cygnus_core.CygnusPlatformWebViewController.setAllMediaPlaybackSuspended.supported_platforms}
  Future<void> setAllMediaPlaybackSuspended({required bool suspended}) =>
      platform.setAllMediaPlaybackSuspended(suspended: suspended);

  ///{@macro cygnus_core.CygnusPlatformWebViewController.closeAllMediaPresentations}
  ///
  ///{@macro cygnus_core.CygnusPlatformWebViewController.closeAllMediaPresentations.supported_platforms}
  Future<void> closeAllMediaPresentations() =>
      platform.closeAllMediaPresentations();

  ///{@macro cygnus_core.CygnusPlatformWebViewController.requestMediaPlaybackState}
  ///
  ///{@macro cygnus_core.CygnusPlatformWebViewController.requestMediaPlaybackState.supported_platforms}
  Future<CygnusMediaPlaybackState?> requestMediaPlaybackState() =>
      platform.requestMediaPlaybackState();

  ///{@macro cygnus_core.CygnusPlatformWebViewController.isInFullscreen}
  ///
  ///{@macro cygnus_core.CygnusPlatformWebViewController.isInFullscreen.supported_platforms}
  Future<bool> isInFullscreen() => platform.isInFullscreen();

  ///{@macro cygnus_core.CygnusPlatformWebViewController.requestEnterFullscreen}
  ///
  ///{@macro cygnus_core.CygnusPlatformWebViewController.requestEnterFullscreen.supported_platforms}
  Future<void> requestEnterFullscreen() => platform.requestEnterFullscreen();

  ///{@macro cygnus_core.CygnusPlatformWebViewController.requestExitFullscreen}
  ///
  ///{@macro cygnus_core.CygnusPlatformWebViewController.requestExitFullscreen.supported_platforms}
  Future<void> requestExitFullscreen() => platform.requestExitFullscreen();

  ///{@macro cygnus_core.CygnusPlatformWebViewController.setVisible}
  ///
  ///{@macro cygnus_core.CygnusPlatformWebViewController.setVisible.supported_platforms}
  Future<void> setVisible({required bool visible}) =>
      platform.setVisible(visible: visible);

  ///{@macro cygnus_core.CygnusPlatformWebViewController.setTargetRefreshRate}
  ///
  ///{@macro cygnus_core.CygnusPlatformWebViewController.setTargetRefreshRate.supported_platforms}
  Future<void> setTargetRefreshRate({required int rate}) =>
      platform.setTargetRefreshRate(rate: rate);

  ///{@macro cygnus_core.CygnusPlatformWebViewController.getTargetRefreshRate}
  ///
  ///{@macro cygnus_core.CygnusPlatformWebViewController.getTargetRefreshRate.supported_platforms}
  Future<int> getTargetRefreshRate() => platform.getTargetRefreshRate();

  ///{@macro cygnus_core.CygnusPlatformWebViewController.getScreenScale}
  ///
  ///{@macro cygnus_core.CygnusPlatformWebViewController.getScreenScale.supported_platforms}
  Future<double> getScreenScale() => platform.getScreenScale();

  ///{@macro cygnus_core.CygnusPlatformWebViewController.setScreenScale}
  ///
  ///{@macro cygnus_core.CygnusPlatformWebViewController.setScreenScale.supported_platforms}
  Future<void> setScreenScale({required double scale}) =>
      platform.setScreenScale(scale: scale);

  ///{@macro cygnus_core.CygnusPlatformWebViewController.isVisible}
  ///
  ///{@macro cygnus_core.CygnusPlatformWebViewController.isVisible.supported_platforms}
  Future<bool> isVisible() => platform.isVisible();

  ///{@macro cygnus_core.CygnusPlatformWebViewController.requestPointerLock}
  ///
  ///{@macro cygnus_core.CygnusPlatformWebViewController.requestPointerLock.supported_platforms}
  Future<bool> requestPointerLock() => platform.requestPointerLock();

  ///{@macro cygnus_core.CygnusPlatformWebViewController.requestPointerUnlock}
  ///
  ///{@macro cygnus_core.CygnusPlatformWebViewController.requestPointerUnlock.supported_platforms}
  Future<bool> requestPointerUnlock() => platform.requestPointerUnlock();

  ///{@macro cygnus_core.CygnusPlatformWebViewController.clearFormData}
  ///
  ///{@macro cygnus_core.CygnusPlatformWebViewController.clearFormData.supported_platforms}
  Future<void> clearFormData() => platform.clearFormData();

  ///{@macro cygnus_core.CygnusPlatformWebViewController.getCameraCaptureState}
  ///
  ///{@macro cygnus_core.CygnusPlatformWebViewController.getCameraCaptureState.supported_platforms}
  Future<CygnusMediaCaptureState?> getCameraCaptureState() =>
      platform.getCameraCaptureState();

  ///{@macro cygnus_core.CygnusPlatformWebViewController.setCameraCaptureState}
  ///
  ///{@macro cygnus_core.CygnusPlatformWebViewController.setCameraCaptureState.supported_platforms}
  Future<void> setCameraCaptureState({required CygnusMediaCaptureState state}) =>
      platform.setCameraCaptureState(state: state);

  ///{@macro cygnus_core.CygnusPlatformWebViewController.getMicrophoneCaptureState}
  ///
  ///{@macro cygnus_core.CygnusPlatformWebViewController.getMicrophoneCaptureState.supported_platforms}
  Future<CygnusMediaCaptureState?> getMicrophoneCaptureState() =>
      platform.getMicrophoneCaptureState();

  ///{@macro cygnus_core.CygnusPlatformWebViewController.setMicrophoneCaptureState}
  ///
  ///{@macro cygnus_core.CygnusPlatformWebViewController.setMicrophoneCaptureState.supported_platforms}
  Future<void> setMicrophoneCaptureState({required CygnusMediaCaptureState state}) =>
      platform.setMicrophoneCaptureState(state: state);

  ///{@macro cygnus_core.CygnusPlatformWebViewController.isPlayingAudio}
  ///
  ///{@macro cygnus_core.CygnusPlatformWebViewController.isPlayingAudio.supported_platforms}
  Future<bool> isPlayingAudio() => platform.isPlayingAudio();

  ///{@macro cygnus_core.CygnusPlatformWebViewController.isMuted}
  ///
  ///{@macro cygnus_core.CygnusPlatformWebViewController.isMuted.supported_platforms}
  Future<bool> isMuted() => platform.isMuted();

  ///{@macro cygnus_core.CygnusPlatformWebViewController.setMuted}
  ///
  ///{@macro cygnus_core.CygnusPlatformWebViewController.setMuted.supported_platforms}
  Future<void> setMuted({required bool muted}) =>
      platform.setMuted(muted: muted);

  ///{@macro cygnus_core.CygnusPlatformWebViewController.terminateWebProcess}
  ///
  ///{@macro cygnus_core.CygnusPlatformWebViewController.terminateWebProcess.supported_platforms}
  Future<void> terminateWebProcess() => platform.terminateWebProcess();

  ///{@macro cygnus_core.CygnusPlatformWebViewController.loadSimulatedRequest}
  ///
  ///{@macro cygnus_core.CygnusPlatformWebViewController.loadSimulatedRequest.supported_platforms}
  Future<void> loadSimulatedRequest({
    required CygnusURLRequest urlRequest,
    required Uint8List data,
    CygnusURLResponse? urlResponse,
  }) => platform.loadSimulatedRequest(urlRequest: urlRequest, data: data);

  ///{@macro cygnus_core.CygnusPlatformWebViewController.openDevTools}
  ///
  ///{@macro cygnus_core.CygnusPlatformWebViewController.openDevTools.supported_platforms}
  Future<void> openDevTools() => platform.openDevTools();

  ///{@macro cygnus_core.CygnusPlatformWebViewController.callDevToolsProtocolMethod}
  ///
  ///{@macro cygnus_core.CygnusPlatformWebViewController.callDevToolsProtocolMethod.supported_platforms}
  Future<dynamic> callDevToolsProtocolMethod({
    required String methodName,
    Map<String, dynamic>? parameters,
  }) => platform.callDevToolsProtocolMethod(
    methodName: methodName,
    parameters: parameters,
  );

  ///{@macro cygnus_core.CygnusPlatformWebViewController.addDevToolsProtocolEventListener}
  ///
  ///{@macro cygnus_core.CygnusPlatformWebViewController.addDevToolsProtocolEventListener.supported_platforms}
  Future<void> addDevToolsProtocolEventListener({
    required String eventName,
    required Function(dynamic data) callback,
  }) => platform.addDevToolsProtocolEventListener(
    eventName: eventName,
    callback: callback,
  );

  ///{@macro cygnus_core.CygnusPlatformWebViewController.removeDevToolsProtocolEventListener}
  ///
  ///{@macro cygnus_core.CygnusPlatformWebViewController.removeDevToolsProtocolEventListener.supported_platforms}
  Future<void> removeDevToolsProtocolEventListener({
    required String eventName,
  }) => platform.removeDevToolsProtocolEventListener(eventName: eventName);

  ///{@macro cygnus_core.CygnusPlatformWebViewController.isInterfaceSupported}
  ///
  ///{@macro cygnus_core.CygnusPlatformWebViewController.isInterfaceSupported.supported_platforms}
  Future<bool> isInterfaceSupported(CygnusWebViewInterface interface) =>
      platform.isInterfaceSupported(interface);

  ///{@macro cygnus_core.CygnusPlatformWebViewController.saveState}
  ///
  ///{@macro cygnus_core.CygnusPlatformWebViewController.saveState.supported_platforms}
  Future<Uint8List?> saveState() => platform.saveState();

  ///{@macro cygnus_core.CygnusPlatformWebViewController.restoreState}
  ///
  ///{@macro cygnus_core.CygnusPlatformWebViewController.restoreState.supported_platforms}
  Future<bool> restoreState(Uint8List state) => platform.restoreState(state);

  ///{@macro cygnus_core.CygnusPlatformWebViewController.getIFrameId}
  ///
  ///{@macro cygnus_core.CygnusPlatformWebViewController.getIFrameId.supported_platforms}
  Future<String?> getIFrameId() => platform.getIFrameId();

  ///{@macro cygnus_core.CygnusPlatformWebViewController.getDefaultUserAgent}
  ///
  ///{@macro cygnus_core.CygnusPlatformWebViewController.getDefaultUserAgent.supported_platforms}
  static Future<String> getDefaultUserAgent() =>
      CygnusPlatformWebViewController.static().getDefaultUserAgent();

  ///{@macro cygnus_core.CygnusPlatformWebViewController.clearClientCertPreferences}
  ///
  ///{@macro cygnus_core.CygnusPlatformWebViewController.clearClientCertPreferences.supported_platforms}
  static Future<void> clearClientCertPreferences() =>
      CygnusPlatformWebViewController.static().clearClientCertPreferences();

  ///{@macro cygnus_core.CygnusPlatformWebViewController.getSafeBrowsingPrivacyPolicyUrl}
  ///
  ///{@macro cygnus_core.CygnusPlatformWebViewController.getSafeBrowsingPrivacyPolicyUrl.supported_platforms}
  static Future<CygnusWebUri?> getSafeBrowsingPrivacyPolicyUrl() =>
      CygnusPlatformWebViewController.static().getSafeBrowsingPrivacyPolicyUrl();

  ///{@macro cygnus_core.CygnusPlatformWebViewController.setSafeBrowsingWhitelist}
  ///
  ///{@macro cygnus_core.CygnusPlatformWebViewController.setSafeBrowsingWhitelist.supported_platforms}
  @Deprecated("Use setSafeBrowsingAllowlist instead")
  static Future<bool> setSafeBrowsingWhitelist({required List<String> hosts}) =>
      CygnusPlatformWebViewController.static().setSafeBrowsingWhitelist(
        hosts: hosts,
      );

  ///{@macro cygnus_core.CygnusPlatformWebViewController.setSafeBrowsingAllowlist}
  ///
  ///{@macro cygnus_core.CygnusPlatformWebViewController.setSafeBrowsingAllowlist.supported_platforms}
  static Future<bool> setSafeBrowsingAllowlist({required List<String> hosts}) =>
      CygnusPlatformWebViewController.static().setSafeBrowsingAllowlist(
        hosts: hosts,
      );

  ///{@macro cygnus_core.CygnusPlatformWebViewController.getCurrentWebViewPackage}
  ///
  ///{@macro cygnus_core.CygnusPlatformWebViewController.getCurrentWebViewPackage.supported_platforms}
  static Future<CygnusWebViewPackageInfo?> getCurrentWebViewPackage() =>
      CygnusPlatformWebViewController.static().getCurrentWebViewPackage();

  ///{@macro cygnus_core.CygnusPlatformWebViewController.setWebContentsDebuggingEnabled}
  ///
  ///{@macro cygnus_core.CygnusPlatformWebViewController.setWebContentsDebuggingEnabled.supported_platforms}
  static Future<void> setWebContentsDebuggingEnabled(bool debuggingEnabled) =>
      CygnusPlatformWebViewController.static().setWebContentsDebuggingEnabled(
        debuggingEnabled,
      );

  ///{@macro cygnus_core.CygnusPlatformWebViewController.getVariationsHeader}
  ///
  ///{@macro cygnus_core.CygnusPlatformWebViewController.getVariationsHeader.supported_platforms}
  static Future<String?> getVariationsHeader() =>
      CygnusPlatformWebViewController.static().getVariationsHeader();

  ///{@macro cygnus_core.CygnusPlatformWebViewController.isMultiProcessEnabled}
  ///
  ///{@macro cygnus_core.CygnusPlatformWebViewController.isMultiProcessEnabled.supported_platforms}
  static Future<bool> isMultiProcessEnabled() =>
      CygnusPlatformWebViewController.static().isMultiProcessEnabled();

  ///{@macro cygnus_core.CygnusPlatformWebViewController.disableWebView}
  ///
  ///{@macro cygnus_core.CygnusPlatformWebViewController.disableWebView.supported_platforms}
  static Future<void> disableWebView() =>
      CygnusPlatformWebViewController.static().disableWebView();

  ///{@macro cygnus_core.CygnusPlatformWebViewController.handlesURLScheme}
  ///
  ///{@macro cygnus_core.CygnusPlatformWebViewController.handlesURLScheme.supported_platforms}
  static Future<bool> handlesURLScheme(String urlScheme) =>
      CygnusPlatformWebViewController.static().handlesURLScheme(urlScheme);

  ///{@macro cygnus_core.CygnusPlatformWebViewController.disposeKeepAlive}
  ///
  ///{@macro cygnus_core.CygnusPlatformWebViewController.disposeKeepAlive.supported_platforms}
  static Future<void> disposeKeepAlive(CygnusWebViewKeepAlive keepAlive) =>
      CygnusPlatformWebViewController.static().disposeKeepAlive(keepAlive);

  ///{@macro cygnus_core.CygnusPlatformWebViewController.clearAllCache}
  ///
  ///{@macro cygnus_core.CygnusPlatformWebViewController.clearAllCache.supported_platforms}
  static Future<void> clearAllCache({bool includeDiskFiles = true}) =>
      CygnusPlatformWebViewController.static().clearAllCache(
        includeDiskFiles: includeDiskFiles,
      );

  ///{@macro cygnus_core.CygnusPlatformWebViewController.enableSlowWholeDocumentDraw}
  ///
  ///{@macro cygnus_core.CygnusPlatformWebViewController.enableSlowWholeDocumentDraw.supported_platforms}
  static Future<void> enableSlowWholeDocumentDraw() =>
      CygnusPlatformWebViewController.static().enableSlowWholeDocumentDraw();

  ///{@macro cygnus_core.CygnusPlatformWebViewController.setJavaScriptBridgeName}
  ///
  ///{@macro cygnus_core.CygnusPlatformWebViewController.setJavaScriptBridgeName.supported_platforms}
  static Future<void> setJavaScriptBridgeName(String bridgeName) =>
      CygnusPlatformWebViewController.static().setJavaScriptBridgeName(
        bridgeName,
      );

  ///{@macro cygnus_core.CygnusPlatformWebViewController.getJavaScriptBridgeName}
  ///
  ///{@macro cygnus_core.CygnusPlatformWebViewController.getJavaScriptBridgeName.supported_platforms}
  static Future<String> getJavaScriptBridgeName() =>
      CygnusPlatformWebViewController.static().getJavaScriptBridgeName();

  ///{@macro cygnus_core.CygnusPlatformWebViewController.tRexRunnerHtml}
  ///
  ///{@macro cygnus_core.CygnusPlatformWebViewController.tRexRunnerHtml.supported_platforms}
  static Future<String> get tRexRunnerHtml =>
      CygnusPlatformWebViewController.static().tRexRunnerHtml;

  ///{@macro cygnus_core.CygnusPlatformWebViewController.tRexRunnerCss}
  ///
  ///{@macro cygnus_core.CygnusPlatformWebViewController.tRexRunnerCss.supported_platforms}
  static Future<String> get tRexRunnerCss =>
      CygnusPlatformWebViewController.static().tRexRunnerCss;

  ///{@macro cygnus_core.CygnusPlatformWebViewController.isClassSupported}
  static bool isClassSupported({TargetPlatform? platform}) =>
      CygnusPlatformWebViewController.static().isClassSupported(
        platform: platform,
      );

  ///{@macro cygnus_core.CygnusPlatformWebViewController.isPropertySupported}
  static bool isPropertySupported(
    CygnusPlatformWebViewControllerProperty property, {
    TargetPlatform? platform,
  }) => CygnusPlatformWebViewController.static().isPropertySupported(
    property,
    platform: platform,
  );

  ///{@macro cygnus_core.CygnusPlatformWebViewController.isMethodSupported}
  static bool isMethodSupported(
    CygnusPlatformWebViewControllerMethod method, {
    TargetPlatform? platform,
  }) => CygnusPlatformWebViewController.static().isMethodSupported(
    method,
    platform: platform,
  );

  ///{@macro cygnus_core.CygnusPlatformWebViewController.getViewId}
  ///
  ///{@macro cygnus_core.CygnusPlatformWebViewController.getViewId.supported_platforms}
  dynamic getViewId() => platform.getViewId();

  ///{@macro cygnus_core.CygnusPlatformWebViewController.dispose}
  ///
  ///{@macro cygnus_core.CygnusPlatformWebViewController.dispose.supported_platforms}
  void dispose({bool isKeepAlive = false}) =>
      platform.dispose(isKeepAlive: isKeepAlive);
}
