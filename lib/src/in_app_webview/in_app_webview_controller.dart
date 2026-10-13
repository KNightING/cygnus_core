import 'dart:core';

import 'package:flutter/services.dart';
import 'package:cygnus_core/src/platform_interface/flutter_inappwebview_platform_interface.dart';

import '../print_job/main.dart';
import '../web_message/main.dart';
import '../web_storage/web_storage.dart';
import 'android/in_app_webview_controller.dart';
import 'apple/in_app_webview_controller.dart';

///{@macro cygnus_core.PlatformInAppWebViewController}
///
///{@macro cygnus_core.PlatformInAppWebViewController.supported_platforms}
class InAppWebViewController {
  ///Use [InAppWebViewController] instead.
  @Deprecated("Use InAppWebViewController instead")
  late AndroidInAppWebViewController android;

  ///Use [InAppWebViewController] instead.
  @Deprecated("Use InAppWebViewController instead")
  late IOSInAppWebViewController ios;

  /// Constructs a [InAppWebViewController].
  ///
  /// See [InAppWebViewController.fromPlatformCreationParams] for setting parameters for
  /// a specific platform.
  InAppWebViewController.fromPlatformCreationParams({
    required PlatformInAppWebViewControllerCreationParams params,
  }) : this.fromPlatform(platform: PlatformInAppWebViewController(params));

  /// Constructs a [InAppWebViewController] from a specific platform implementation.
  InAppWebViewController.fromPlatform({required this.platform}) {
    android = AndroidInAppWebViewController(controller: this.platform);
    ios = IOSInAppWebViewController(controller: this.platform);
  }

  /// Implementation of [PlatformInAppWebViewController] for the current platform.
  final PlatformInAppWebViewController platform;

  ///{@macro cygnus_core.PlatformInAppWebViewController.webStorage}
  ///
  ///{@macro cygnus_core.PlatformInAppWebViewController.webStorage.supported_platforms}
  WebStorage get webStorage =>
      WebStorage.fromPlatform(platform: platform.webStorage);

  ///{@macro cygnus_core.PlatformInAppWebViewController.getUrl}
  ///
  ///{@macro cygnus_core.PlatformInAppWebViewController.getUrl.supported_platforms}
  Future<WebUri?> getUrl() => platform.getUrl();

  ///{@macro cygnus_core.PlatformInAppWebViewController.getTitle}
  ///
  ///{@macro cygnus_core.PlatformInAppWebViewController.getTitle.supported_platforms}
  Future<String?> getTitle() => platform.getTitle();

  ///{@macro cygnus_core.PlatformInAppWebViewController.getFrameId}
  ///
  ///{@macro cygnus_core.PlatformInAppWebViewController.getFrameId.supported_platforms}
  Future<int?> getFrameId() => platform.getFrameId();

  ///{@macro cygnus_core.PlatformInAppWebViewController.getProgress}
  ///
  ///{@macro cygnus_core.PlatformInAppWebViewController.getProgress.supported_platforms}
  Future<int?> getProgress() => platform.getProgress();

  ///{@macro cygnus_core.PlatformInAppWebViewController.getHtml}
  ///
  ///{@macro cygnus_core.PlatformInAppWebViewController.getHtml.supported_platforms}
  Future<String?> getHtml() => platform.getHtml();

  ///{@macro cygnus_core.PlatformInAppWebViewController.getFavicons}
  ///
  ///{@macro cygnus_core.PlatformInAppWebViewController.getFavicons.supported_platforms}
  Future<List<Favicon>> getFavicons() => platform.getFavicons();

  ///{@macro cygnus_core.PlatformInAppWebViewController.getFavicon}
  ///
  ///{@macro cygnus_core.PlatformInAppWebViewController.getFavicon.supported_platforms}
  Future<Uint8List?> getFavicon({
    required WebUri url,
    FaviconImageFormat faviconImageFormat = FaviconImageFormat.PNG,
  }) => platform.getFavicon(url: url, faviconImageFormat: faviconImageFormat);

  ///{@macro cygnus_core.PlatformInAppWebViewController.showSaveAsUI}
  ///
  ///{@macro cygnus_core.PlatformInAppWebViewController.showSaveAsUI.supported_platforms}
  Future<SaveAsUIResult?> showSaveAsUI() => platform.showSaveAsUI();

  ///{@macro cygnus_core.PlatformInAppWebViewController.getMemoryUsageTargetLevel}
  ///
  ///{@macro cygnus_core.PlatformInAppWebViewController.getMemoryUsageTargetLevel.supported_platforms}
  Future<MemoryUsageTargetLevel?> getMemoryUsageTargetLevel() =>
      platform.getMemoryUsageTargetLevel();

  ///{@macro cygnus_core.PlatformInAppWebViewController.setMemoryUsageTargetLevel}
  ///
  ///{@macro cygnus_core.PlatformInAppWebViewController.setMemoryUsageTargetLevel.supported_platforms}
  Future<void> setMemoryUsageTargetLevel(MemoryUsageTargetLevel level) =>
      platform.setMemoryUsageTargetLevel(level);

  ///{@macro cygnus_core.PlatformInAppWebViewController.loadUrl}
  ///
  ///{@macro cygnus_core.PlatformInAppWebViewController.loadUrl.supported_platforms}
  Future<void> loadUrl({
    required URLRequest urlRequest,
    @Deprecated('Use allowingReadAccessTo instead')
    Uri? iosAllowingReadAccessTo,
    WebUri? allowingReadAccessTo,
  }) => platform.loadUrl(
    urlRequest: urlRequest,
    iosAllowingReadAccessTo: iosAllowingReadAccessTo,
    allowingReadAccessTo: allowingReadAccessTo,
  );

  ///{@macro cygnus_core.PlatformInAppWebViewController.postUrl}
  ///
  ///{@macro cygnus_core.PlatformInAppWebViewController.postUrl.supported_platforms}
  Future<void> postUrl({required WebUri url, required Uint8List postData}) =>
      platform.postUrl(url: url, postData: postData);

  ///{@macro cygnus_core.PlatformInAppWebViewController.loadData}
  ///
  ///{@macro cygnus_core.PlatformInAppWebViewController.loadData.supported_platforms}
  Future<void> loadData({
    required String data,
    String mimeType = "text/html",
    String encoding = "utf8",
    WebUri? baseUrl,
    @Deprecated('Use historyUrl instead') Uri? androidHistoryUrl,
    WebUri? historyUrl,
    @Deprecated('Use allowingReadAccessTo instead')
    Uri? iosAllowingReadAccessTo,
    WebUri? allowingReadAccessTo,
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

  ///{@macro cygnus_core.PlatformInAppWebViewController.loadFile}
  ///
  ///{@macro cygnus_core.PlatformInAppWebViewController.loadFile.supported_platforms}
  Future<void> loadFile({required String assetFilePath}) =>
      platform.loadFile(assetFilePath: assetFilePath);

  ///{@macro cygnus_core.PlatformInAppWebViewController.reload}
  ///
  ///{@macro cygnus_core.PlatformInAppWebViewController.reload.supported_platforms}
  Future<void> reload() => platform.reload();

  ///{@macro cygnus_core.PlatformInAppWebViewController.goBack}
  ///
  ///{@macro cygnus_core.PlatformInAppWebViewController.goBack.supported_platforms}
  Future<void> goBack() => platform.goBack();

  ///{@macro cygnus_core.PlatformInAppWebViewController.canGoBack}
  ///
  ///{@macro cygnus_core.PlatformInAppWebViewController.canGoBack.supported_platforms}
  Future<bool> canGoBack() => platform.canGoBack();

  ///{@macro cygnus_core.PlatformInAppWebViewController.goForward}
  ///
  ///{@macro cygnus_core.PlatformInAppWebViewController.goForward.supported_platforms}
  Future<void> goForward() => platform.goForward();

  ///{@macro cygnus_core.PlatformInAppWebViewController.canGoForward}
  ///
  ///{@macro cygnus_core.PlatformInAppWebViewController.canGoForward.supported_platforms}
  Future<bool> canGoForward() => platform.canGoForward();

  ///{@macro cygnus_core.PlatformInAppWebViewController.goBackOrForward}
  ///
  ///{@macro cygnus_core.PlatformInAppWebViewController.goBackOrForward.supported_platforms}
  Future<void> goBackOrForward({required int steps}) =>
      platform.goBackOrForward(steps: steps);

  ///{@macro cygnus_core.PlatformInAppWebViewController.canGoBackOrForward}
  ///
  ///{@macro cygnus_core.PlatformInAppWebViewController.canGoBackOrForward.supported_platforms}
  Future<bool> canGoBackOrForward({required int steps}) =>
      platform.canGoBackOrForward(steps: steps);

  ///{@macro cygnus_core.PlatformInAppWebViewController.goTo}
  ///
  ///{@macro cygnus_core.PlatformInAppWebViewController.goTo.supported_platforms}
  Future<void> goTo({required WebHistoryItem historyItem}) =>
      platform.goTo(historyItem: historyItem);

  ///{@macro cygnus_core.PlatformInAppWebViewController.isLoading}
  ///
  ///{@macro cygnus_core.PlatformInAppWebViewController.isLoading.supported_platforms}
  Future<bool> isLoading() => platform.isLoading();

  ///{@macro cygnus_core.PlatformInAppWebViewController.stopLoading}
  ///
  ///{@macro cygnus_core.PlatformInAppWebViewController.stopLoading.supported_platforms}
  Future<void> stopLoading() => platform.stopLoading();

  ///{@macro cygnus_core.PlatformInAppWebViewController.evaluateJavascript}
  ///
  ///{@macro cygnus_core.PlatformInAppWebViewController.evaluateJavascript.supported_platforms}
  Future<dynamic> evaluateJavascript({
    required String source,
    ContentWorld? contentWorld,
  }) => platform.evaluateJavascript(source: source, contentWorld: contentWorld);

  ///{@macro cygnus_core.PlatformInAppWebViewController.injectJavascriptFileFromUrl}
  ///
  ///{@macro cygnus_core.PlatformInAppWebViewController.injectJavascriptFileFromUrl.supported_platforms}
  Future<void> injectJavascriptFileFromUrl({
    required WebUri urlFile,
    ScriptHtmlTagAttributes? scriptHtmlTagAttributes,
  }) => platform.injectJavascriptFileFromUrl(
    urlFile: urlFile,
    scriptHtmlTagAttributes: scriptHtmlTagAttributes,
  );

  ///{@macro cygnus_core.PlatformInAppWebViewController.injectJavascriptFileFromAsset}
  ///
  ///{@macro cygnus_core.PlatformInAppWebViewController.injectJavascriptFileFromAsset.supported_platforms}
  Future<dynamic> injectJavascriptFileFromAsset({
    required String assetFilePath,
  }) => platform.injectJavascriptFileFromAsset(assetFilePath: assetFilePath);

  ///{@macro cygnus_core.PlatformInAppWebViewController.injectCSSCode}
  ///
  ///{@macro cygnus_core.PlatformInAppWebViewController.injectCSSCode.supported_platforms}
  Future<void> injectCSSCode({required String source}) =>
      platform.injectCSSCode(source: source);

  ///{@macro cygnus_core.PlatformInAppWebViewController.injectCSSFileFromUrl}
  ///
  ///{@macro cygnus_core.PlatformInAppWebViewController.injectCSSFileFromUrl.supported_platforms}
  Future<void> injectCSSFileFromUrl({
    required WebUri urlFile,
    CSSLinkHtmlTagAttributes? cssLinkHtmlTagAttributes,
  }) => platform.injectCSSFileFromUrl(
    urlFile: urlFile,
    cssLinkHtmlTagAttributes: cssLinkHtmlTagAttributes,
  );

  ///{@macro cygnus_core.PlatformInAppWebViewController.injectCSSFileFromAsset}
  ///
  ///{@macro cygnus_core.PlatformInAppWebViewController.injectCSSFileFromAsset.supported_platforms}
  Future<void> injectCSSFileFromAsset({required String assetFilePath}) =>
      platform.injectCSSFileFromAsset(assetFilePath: assetFilePath);

  ///{@macro cygnus_core.PlatformInAppWebViewController.addJavaScriptHandler}
  ///
  ///{@macro cygnus_core.PlatformInAppWebViewController.addJavaScriptHandler.supported_platforms}
  void addJavaScriptHandler({
    required String handlerName,
    required Function callback,
  }) => platform.addJavaScriptHandler(
    handlerName: handlerName,
    callback: callback,
  );

  ///{@macro cygnus_core.PlatformInAppWebViewController.removeJavaScriptHandler}
  ///
  ///{@macro cygnus_core.PlatformInAppWebViewController.removeJavaScriptHandler.supported_platforms}
  Function? removeJavaScriptHandler({required String handlerName}) =>
      platform.removeJavaScriptHandler(handlerName: handlerName);

  ///{@macro cygnus_core.PlatformInAppWebViewController.hasJavaScriptHandler}
  ///
  ///{@macro cygnus_core.PlatformInAppWebViewController.hasJavaScriptHandler.supported_platforms}
  bool hasJavaScriptHandler({required String handlerName}) =>
      platform.hasJavaScriptHandler(handlerName: handlerName);

  ///{@macro cygnus_core.PlatformInAppWebViewController.takeScreenshot}
  ///
  ///{@macro cygnus_core.PlatformInAppWebViewController.takeScreenshot.supported_platforms}
  Future<Uint8List?> takeScreenshot({
    ScreenshotConfiguration? screenshotConfiguration,
  }) =>
      platform.takeScreenshot(screenshotConfiguration: screenshotConfiguration);

  ///{@macro cygnus_core.PlatformInAppWebViewController.setOptions}
  ///
  ///{@macro cygnus_core.PlatformInAppWebViewController.setOptions.supported_platforms}
  @Deprecated('Use setSettings instead')
  Future<void> setOptions({required InAppWebViewGroupOptions options}) =>
      platform.setOptions(options: options);

  ///{@macro cygnus_core.PlatformInAppWebViewController.getOptions}
  ///
  ///{@macro cygnus_core.PlatformInAppWebViewController.getOptions.supported_platforms}
  @Deprecated('Use getSettings instead')
  Future<InAppWebViewGroupOptions?> getOptions() => platform.getOptions();

  ///{@macro cygnus_core.PlatformInAppWebViewController.setSettings}
  ///
  ///{@macro cygnus_core.PlatformInAppWebViewController.setSettings.supported_platforms}
  Future<void> setSettings({required InAppWebViewSettings settings}) =>
      platform.setSettings(settings: settings);

  ///{@macro cygnus_core.PlatformInAppWebViewController.getSettings}
  ///
  ///{@macro cygnus_core.PlatformInAppWebViewController.getSettings.supported_platforms}
  Future<InAppWebViewSettings?> getSettings() => platform.getSettings();

  ///{@macro cygnus_core.PlatformInAppWebViewController.getCopyBackForwardList}
  ///
  ///{@macro cygnus_core.PlatformInAppWebViewController.getCopyBackForwardList.supported_platforms}
  Future<WebHistory?> getCopyBackForwardList() =>
      platform.getCopyBackForwardList();

  ///{@macro cygnus_core.PlatformInAppWebViewController.clearCache}
  ///
  ///{@macro cygnus_core.PlatformInAppWebViewController.clearCache.supported_platforms}
  @Deprecated("Use InAppWebViewController.clearAllCache instead")
  Future<void> clearCache() => platform.clearCache();

  ///{@macro cygnus_core.PlatformInAppWebViewController.findAllAsync}
  ///
  ///{@macro cygnus_core.PlatformInAppWebViewController.findAllAsync.supported_platforms}
  @Deprecated("Use FindInteractionController.findAll instead")
  Future<void> findAllAsync({required String find}) =>
      platform.findAllAsync(find: find);

  ///{@macro cygnus_core.PlatformInAppWebViewController.findNext}
  ///
  ///{@macro cygnus_core.PlatformInAppWebViewController.findNext.supported_platforms}
  @Deprecated("Use FindInteractionController.findNext instead")
  Future<void> findNext({required bool forward}) =>
      platform.findNext(forward: forward);

  ///{@macro cygnus_core.PlatformInAppWebViewController.clearMatches}
  ///
  ///{@macro cygnus_core.PlatformInAppWebViewController.clearMatches.supported_platforms}
  @Deprecated("Use FindInteractionController.clearMatches instead")
  Future<void> clearMatches() => platform.clearMatches();

  ///{@macro cygnus_core.PlatformInAppWebViewController.getTRexRunnerHtml}
  ///
  ///{@macro cygnus_core.PlatformInAppWebViewController.getTRexRunnerHtml.supported_platforms}
  @Deprecated("Use tRexRunnerHtml instead")
  Future<String> getTRexRunnerHtml() => platform.getTRexRunnerHtml();

  ///{@macro cygnus_core.PlatformInAppWebViewController.getTRexRunnerCss}
  ///
  ///{@macro cygnus_core.PlatformInAppWebViewController.getTRexRunnerCss.supported_platforms}
  @Deprecated("Use tRexRunnerCss instead")
  Future<String> getTRexRunnerCss() => platform.getTRexRunnerCss();

  ///{@macro cygnus_core.PlatformInAppWebViewController.scrollTo}
  ///
  ///{@macro cygnus_core.PlatformInAppWebViewController.scrollTo.supported_platforms}
  Future<void> scrollTo({
    required int x,
    required int y,
    bool animated = false,
  }) => platform.scrollTo(x: x, y: y, animated: animated);

  ///{@macro cygnus_core.PlatformInAppWebViewController.scrollBy}
  ///
  ///{@macro cygnus_core.PlatformInAppWebViewController.scrollBy.supported_platforms}
  Future<void> scrollBy({
    required int x,
    required int y,
    bool animated = false,
  }) => platform.scrollBy(x: x, y: y, animated: animated);

  ///{@macro cygnus_core.PlatformInAppWebViewController.pauseTimers}
  ///
  ///{@macro cygnus_core.PlatformInAppWebViewController.pauseTimers.supported_platforms}
  Future<void> pauseTimers() => platform.pauseTimers();

  ///{@macro cygnus_core.PlatformInAppWebViewController.resumeTimers}
  ///
  ///{@macro cygnus_core.PlatformInAppWebViewController.resumeTimers.supported_platforms}
  Future<void> resumeTimers() => platform.resumeTimers();

  ///{@macro cygnus_core.PlatformInAppWebViewController.printCurrentPage}
  ///
  ///{@macro cygnus_core.PlatformInAppWebViewController.printCurrentPage.supported_platforms}
  Future<PrintJobController?> printCurrentPage({
    PrintJobSettings? settings,
  }) async {
    final printJobControllerPlatform = await platform.printCurrentPage(
      settings: settings,
    );
    if (printJobControllerPlatform == null) {
      return null;
    }
    return PrintJobController.fromPlatform(
      platform: printJobControllerPlatform,
    );
  }

  ///{@macro cygnus_core.PlatformInAppWebViewController.getContentHeight}
  ///
  ///{@macro cygnus_core.PlatformInAppWebViewController.getContentHeight.supported_platforms}
  Future<int?> getContentHeight() => platform.getContentHeight();

  ///{@macro cygnus_core.PlatformInAppWebViewController.getContentWidth}
  ///
  ///{@macro cygnus_core.PlatformInAppWebViewController.getContentWidth.supported_platforms}
  Future<int?> getContentWidth() => platform.getContentWidth();

  ///{@macro cygnus_core.PlatformInAppWebViewController.zoomBy}
  ///
  ///{@macro cygnus_core.PlatformInAppWebViewController.zoomBy.supported_platforms}
  Future<void> zoomBy({
    required double zoomFactor,
    @Deprecated('Use animated instead') bool? iosAnimated,
    bool animated = false,
  }) => platform.zoomBy(
    zoomFactor: zoomFactor,
    iosAnimated: iosAnimated,
    animated: animated,
  );

  ///{@macro cygnus_core.PlatformInAppWebViewController.getOriginalUrl}
  ///
  ///{@macro cygnus_core.PlatformInAppWebViewController.getOriginalUrl.supported_platforms}
  Future<WebUri?> getOriginalUrl() => platform.getOriginalUrl();

  ///{@macro cygnus_core.PlatformInAppWebViewController.getZoomScale}
  ///
  ///{@macro cygnus_core.PlatformInAppWebViewController.getZoomScale.supported_platforms}
  Future<double?> getZoomScale() => platform.getZoomScale();

  ///{@macro cygnus_core.PlatformInAppWebViewController.getScale}
  ///
  ///{@macro cygnus_core.PlatformInAppWebViewController.getScale.supported_platforms}
  @Deprecated('Use getZoomScale instead')
  Future<double?> getScale() => platform.getScale();

  ///{@macro cygnus_core.PlatformInAppWebViewController.getSelectedText}
  ///
  ///{@macro cygnus_core.PlatformInAppWebViewController.getSelectedText.supported_platforms}
  Future<String?> getSelectedText() => platform.getSelectedText();

  ///{@macro cygnus_core.PlatformInAppWebViewController.getHitTestResult}
  ///
  ///{@macro cygnus_core.PlatformInAppWebViewController.getHitTestResult.supported_platforms}
  Future<InAppWebViewHitTestResult?> getHitTestResult() =>
      platform.getHitTestResult();

  ///{@macro cygnus_core.PlatformInAppWebViewController.requestFocus}
  ///
  ///{@macro cygnus_core.PlatformInAppWebViewController.requestFocus.supported_platforms}
  Future<bool?> requestFocus({
    FocusDirection? direction,
    InAppWebViewRect? previouslyFocusedRect,
  }) => platform.requestFocus(
    direction: direction,
    previouslyFocusedRect: previouslyFocusedRect,
  );

  ///{@macro cygnus_core.PlatformInAppWebViewController.clearFocus}
  ///
  ///{@macro cygnus_core.PlatformInAppWebViewController.clearFocus.supported_platforms}
  Future<void> clearFocus() => platform.clearFocus();

  ///{@macro cygnus_core.PlatformInAppWebViewController.setInputMethodEnabled}
  ///
  ///{@macro cygnus_core.PlatformInAppWebViewController.setInputMethodEnabled.supported_platforms}
  Future<void> setInputMethodEnabled(bool enabled) =>
      platform.setInputMethodEnabled(enabled);

  ///{@macro cygnus_core.PlatformInAppWebViewController.showInputMethod}
  ///
  ///{@macro cygnus_core.PlatformInAppWebViewController.showInputMethod.supported_platforms}
  Future<void> showInputMethod() => platform.showInputMethod();

  ///{@macro cygnus_core.PlatformInAppWebViewController.hideInputMethod}
  ///
  ///{@macro cygnus_core.PlatformInAppWebViewController.hideInputMethod.supported_platforms}
  Future<void> hideInputMethod() => platform.hideInputMethod();

  ///{@macro cygnus_core.PlatformInAppWebViewController.setContextMenu}
  ///
  ///{@macro cygnus_core.PlatformInAppWebViewController.setContextMenu.supported_platforms}
  Future<void> setContextMenu(ContextMenu? contextMenu) =>
      platform.setContextMenu(contextMenu);

  ///{@macro cygnus_core.PlatformInAppWebViewController.requestFocusNodeHref}
  ///
  ///{@macro cygnus_core.PlatformInAppWebViewController.requestFocusNodeHref.supported_platforms}
  Future<RequestFocusNodeHrefResult?> requestFocusNodeHref() =>
      platform.requestFocusNodeHref();

  ///{@macro cygnus_core.PlatformInAppWebViewController.requestImageRef}
  ///
  ///{@macro cygnus_core.PlatformInAppWebViewController.requestImageRef.supported_platforms}
  Future<RequestImageRefResult?> requestImageRef() =>
      platform.requestImageRef();

  ///{@macro cygnus_core.PlatformInAppWebViewController.getMetaTags}
  ///
  ///{@macro cygnus_core.PlatformInAppWebViewController.getMetaTags.supported_platforms}
  Future<List<MetaTag>> getMetaTags() => platform.getMetaTags();

  ///{@macro cygnus_core.PlatformInAppWebViewController.getMetaThemeColor}
  ///
  ///{@macro cygnus_core.PlatformInAppWebViewController.getMetaThemeColor.supported_platforms}
  Future<Color?> getMetaThemeColor() => platform.getMetaThemeColor();

  ///{@macro cygnus_core.PlatformInAppWebViewController.getScrollX}
  ///
  ///{@macro cygnus_core.PlatformInAppWebViewController.getScrollX.supported_platforms}
  Future<int?> getScrollX() => platform.getScrollX();

  ///{@macro cygnus_core.PlatformInAppWebViewController.getScrollY}
  ///
  ///{@macro cygnus_core.PlatformInAppWebViewController.getScrollY.supported_platforms}
  Future<int?> getScrollY() => platform.getScrollY();

  ///{@macro cygnus_core.PlatformInAppWebViewController.getCertificate}
  ///
  ///{@macro cygnus_core.PlatformInAppWebViewController.getCertificate.supported_platforms}
  Future<SslCertificate?> getCertificate() => platform.getCertificate();

  ///{@macro cygnus_core.PlatformInAppWebViewController.addUserScript}
  ///
  ///{@macro cygnus_core.PlatformInAppWebViewController.addUserScript.supported_platforms}
  Future<void> addUserScript({required UserScript userScript}) =>
      platform.addUserScript(userScript: userScript);

  ///{@macro cygnus_core.PlatformInAppWebViewController.addUserScripts}
  ///
  ///{@macro cygnus_core.PlatformInAppWebViewController.addUserScripts.supported_platforms}
  Future<void> addUserScripts({required List<UserScript> userScripts}) =>
      platform.addUserScripts(userScripts: userScripts);

  ///{@macro cygnus_core.PlatformInAppWebViewController.removeUserScript}
  ///
  ///{@macro cygnus_core.PlatformInAppWebViewController.removeUserScript.supported_platforms}
  Future<bool> removeUserScript({required UserScript userScript}) =>
      platform.removeUserScript(userScript: userScript);

  ///{@macro cygnus_core.PlatformInAppWebViewController.removeUserScriptsByGroupName}
  ///
  ///{@macro cygnus_core.PlatformInAppWebViewController.removeUserScriptsByGroupName.supported_platforms}
  Future<void> removeUserScriptsByGroupName({required String groupName}) =>
      platform.removeUserScriptsByGroupName(groupName: groupName);

  ///{@macro cygnus_core.PlatformInAppWebViewController.removeUserScripts}
  ///
  ///{@macro cygnus_core.PlatformInAppWebViewController.removeUserScripts.supported_platforms}
  Future<void> removeUserScripts({required List<UserScript> userScripts}) =>
      platform.removeUserScripts(userScripts: userScripts);

  ///{@macro cygnus_core.PlatformInAppWebViewController.removeAllUserScripts}
  ///
  ///{@macro cygnus_core.PlatformInAppWebViewController.removeAllUserScripts.supported_platforms}
  Future<void> removeAllUserScripts() => platform.removeAllUserScripts();

  ///{@macro cygnus_core.PlatformInAppWebViewController.hasUserScript}
  ///
  ///{@macro cygnus_core.PlatformInAppWebViewController.hasUserScript.supported_platforms}
  bool hasUserScript({required UserScript userScript}) =>
      platform.hasUserScript(userScript: userScript);

  ///{@macro cygnus_core.PlatformInAppWebViewController.callAsyncJavaScript}
  ///
  ///{@macro cygnus_core.PlatformInAppWebViewController.callAsyncJavaScript.supported_platforms}
  Future<CallAsyncJavaScriptResult?> callAsyncJavaScript({
    required String functionBody,
    Map<String, dynamic> arguments = const <String, dynamic>{},
    ContentWorld? contentWorld,
  }) => platform.callAsyncJavaScript(
    functionBody: functionBody,
    arguments: arguments,
    contentWorld: contentWorld,
  );

  ///{@macro cygnus_core.PlatformInAppWebViewController.saveWebArchive}
  ///
  ///{@macro cygnus_core.PlatformInAppWebViewController.saveWebArchive.supported_platforms}
  Future<String?> saveWebArchive({
    required String filePath,
    bool autoname = false,
  }) => platform.saveWebArchive(filePath: filePath, autoname: autoname);

  ///{@macro cygnus_core.PlatformInAppWebViewController.isSecureContext}
  ///
  ///{@macro cygnus_core.PlatformInAppWebViewController.isSecureContext.supported_platforms}
  Future<bool> isSecureContext() => platform.isSecureContext();

  ///{@macro cygnus_core.PlatformInAppWebViewController.createWebMessageChannel}
  ///
  ///{@macro cygnus_core.PlatformInAppWebViewController.createWebMessageChannel.supported_platforms}
  Future<WebMessageChannel?> createWebMessageChannel() async {
    final webMessagePlatform = await platform.createWebMessageChannel();
    if (webMessagePlatform == null) {
      return null;
    }
    return WebMessageChannel.fromPlatform(platform: webMessagePlatform);
  }

  ///{@macro cygnus_core.PlatformInAppWebViewController.postWebMessage}
  ///
  ///{@macro cygnus_core.PlatformInAppWebViewController.postWebMessage.supported_platforms}
  Future<void> postWebMessage({
    required WebMessage message,
    WebUri? targetOrigin,
  }) => platform.postWebMessage(message: message, targetOrigin: targetOrigin);

  ///{@macro cygnus_core.PlatformInAppWebViewController.addWebMessageListener}
  ///
  ///{@macro cygnus_core.PlatformInAppWebViewController.addWebMessageListener.supported_platforms}
  Future<void> addWebMessageListener(WebMessageListener webMessageListener) =>
      platform.addWebMessageListener(webMessageListener.platform);

  ///{@macro cygnus_core.PlatformInAppWebViewController.hasWebMessageListener}
  ///
  ///{@macro cygnus_core.PlatformInAppWebViewController.hasWebMessageListener.supported_platforms}
  bool hasWebMessageListener(WebMessageListener webMessageListener) =>
      platform.hasWebMessageListener(webMessageListener.platform);

  ///{@macro cygnus_core.PlatformInAppWebViewController.canScrollVertically}
  ///
  ///{@macro cygnus_core.PlatformInAppWebViewController.canScrollVertically.supported_platforms}
  Future<bool> canScrollVertically() => platform.canScrollVertically();

  ///{@macro cygnus_core.PlatformInAppWebViewController.canScrollHorizontally}
  ///
  ///{@macro cygnus_core.PlatformInAppWebViewController.canScrollHorizontally.supported_platforms}
  Future<bool> canScrollHorizontally() => platform.canScrollHorizontally();

  ///{@macro cygnus_core.PlatformInAppWebViewController.startSafeBrowsing}
  ///
  ///{@macro cygnus_core.PlatformInAppWebViewController.startSafeBrowsing.supported_platforms}
  Future<bool> startSafeBrowsing() => platform.startSafeBrowsing();

  ///{@macro cygnus_core.PlatformInAppWebViewController.clearSslPreferences}
  ///
  ///{@macro cygnus_core.PlatformInAppWebViewController.clearSslPreferences.supported_platforms}
  Future<void> clearSslPreferences() => platform.clearSslPreferences();

  ///{@macro cygnus_core.PlatformInAppWebViewController.pause}
  ///
  ///{@macro cygnus_core.PlatformInAppWebViewController.pause.supported_platforms}
  Future<void> pause() => platform.pause();

  ///{@macro cygnus_core.PlatformInAppWebViewController.resume}
  ///
  ///{@macro cygnus_core.PlatformInAppWebViewController.resume.supported_platforms}
  Future<void> resume() => platform.resume();

  ///{@macro cygnus_core.PlatformInAppWebViewController.pageDown}
  ///
  ///{@macro cygnus_core.PlatformInAppWebViewController.pageDown.supported_platforms}
  Future<bool> pageDown({required bool bottom}) =>
      platform.pageDown(bottom: bottom);

  ///{@macro cygnus_core.PlatformInAppWebViewController.pageUp}
  ///
  ///{@macro cygnus_core.PlatformInAppWebViewController.pageUp.supported_platforms}
  Future<bool> pageUp({required bool top}) => platform.pageUp(top: top);

  ///{@macro cygnus_core.PlatformInAppWebViewController.zoomIn}
  ///
  ///{@macro cygnus_core.PlatformInAppWebViewController.zoomIn.supported_platforms}
  Future<bool> zoomIn() => platform.zoomIn();

  ///{@macro cygnus_core.PlatformInAppWebViewController.zoomOut}
  ///
  ///{@macro cygnus_core.PlatformInAppWebViewController.zoomOut.supported_platforms}
  Future<bool> zoomOut() => platform.zoomOut();

  ///{@macro cygnus_core.PlatformInAppWebViewController.clearHistory}
  ///
  ///{@macro cygnus_core.PlatformInAppWebViewController.clearHistory.supported_platforms}
  Future<void> clearHistory() => platform.clearHistory();

  ///{@macro cygnus_core.PlatformInAppWebViewController.reloadFromOrigin}
  ///
  ///{@macro cygnus_core.PlatformInAppWebViewController.reloadFromOrigin.supported_platforms}
  Future<void> reloadFromOrigin() => platform.reloadFromOrigin();

  ///{@macro cygnus_core.PlatformInAppWebViewController.createPdf}
  ///
  ///{@macro cygnus_core.PlatformInAppWebViewController.createPdf.supported_platforms}
  Future<Uint8List?> createPdf({
    @Deprecated("Use pdfConfiguration instead")
    // ignore: deprecated_member_use_from_same_package
    IOSWKPDFConfiguration? iosWKPdfConfiguration,
    PDFConfiguration? pdfConfiguration,
  }) => platform.createPdf(
    iosWKPdfConfiguration: iosWKPdfConfiguration,
    pdfConfiguration: pdfConfiguration,
  );

  ///{@macro cygnus_core.PlatformInAppWebViewController.createWebArchiveData}
  ///
  ///{@macro cygnus_core.PlatformInAppWebViewController.createWebArchiveData.supported_platforms}
  Future<Uint8List?> createWebArchiveData() => platform.createWebArchiveData();

  ///{@macro cygnus_core.PlatformInAppWebViewController.hasOnlySecureContent}
  ///
  ///{@macro cygnus_core.PlatformInAppWebViewController.hasOnlySecureContent.supported_platforms}
  Future<bool> hasOnlySecureContent() => platform.hasOnlySecureContent();

  ///{@macro cygnus_core.PlatformInAppWebViewController.pauseAllMediaPlayback}
  ///
  ///{@macro cygnus_core.PlatformInAppWebViewController.pauseAllMediaPlayback.supported_platforms}
  Future<void> pauseAllMediaPlayback() => platform.pauseAllMediaPlayback();

  ///{@macro cygnus_core.PlatformInAppWebViewController.setAllMediaPlaybackSuspended}
  ///
  ///{@macro cygnus_core.PlatformInAppWebViewController.setAllMediaPlaybackSuspended.supported_platforms}
  Future<void> setAllMediaPlaybackSuspended({required bool suspended}) =>
      platform.setAllMediaPlaybackSuspended(suspended: suspended);

  ///{@macro cygnus_core.PlatformInAppWebViewController.closeAllMediaPresentations}
  ///
  ///{@macro cygnus_core.PlatformInAppWebViewController.closeAllMediaPresentations.supported_platforms}
  Future<void> closeAllMediaPresentations() =>
      platform.closeAllMediaPresentations();

  ///{@macro cygnus_core.PlatformInAppWebViewController.requestMediaPlaybackState}
  ///
  ///{@macro cygnus_core.PlatformInAppWebViewController.requestMediaPlaybackState.supported_platforms}
  Future<MediaPlaybackState?> requestMediaPlaybackState() =>
      platform.requestMediaPlaybackState();

  ///{@macro cygnus_core.PlatformInAppWebViewController.isInFullscreen}
  ///
  ///{@macro cygnus_core.PlatformInAppWebViewController.isInFullscreen.supported_platforms}
  Future<bool> isInFullscreen() => platform.isInFullscreen();

  ///{@macro cygnus_core.PlatformInAppWebViewController.requestEnterFullscreen}
  ///
  ///{@macro cygnus_core.PlatformInAppWebViewController.requestEnterFullscreen.supported_platforms}
  Future<void> requestEnterFullscreen() => platform.requestEnterFullscreen();

  ///{@macro cygnus_core.PlatformInAppWebViewController.requestExitFullscreen}
  ///
  ///{@macro cygnus_core.PlatformInAppWebViewController.requestExitFullscreen.supported_platforms}
  Future<void> requestExitFullscreen() => platform.requestExitFullscreen();

  ///{@macro cygnus_core.PlatformInAppWebViewController.setVisible}
  ///
  ///{@macro cygnus_core.PlatformInAppWebViewController.setVisible.supported_platforms}
  Future<void> setVisible({required bool visible}) =>
      platform.setVisible(visible: visible);

  ///{@macro cygnus_core.PlatformInAppWebViewController.setTargetRefreshRate}
  ///
  ///{@macro cygnus_core.PlatformInAppWebViewController.setTargetRefreshRate.supported_platforms}
  Future<void> setTargetRefreshRate({required int rate}) =>
      platform.setTargetRefreshRate(rate: rate);

  ///{@macro cygnus_core.PlatformInAppWebViewController.getTargetRefreshRate}
  ///
  ///{@macro cygnus_core.PlatformInAppWebViewController.getTargetRefreshRate.supported_platforms}
  Future<int> getTargetRefreshRate() => platform.getTargetRefreshRate();

  ///{@macro cygnus_core.PlatformInAppWebViewController.getScreenScale}
  ///
  ///{@macro cygnus_core.PlatformInAppWebViewController.getScreenScale.supported_platforms}
  Future<double> getScreenScale() => platform.getScreenScale();

  ///{@macro cygnus_core.PlatformInAppWebViewController.setScreenScale}
  ///
  ///{@macro cygnus_core.PlatformInAppWebViewController.setScreenScale.supported_platforms}
  Future<void> setScreenScale({required double scale}) =>
      platform.setScreenScale(scale: scale);

  ///{@macro cygnus_core.PlatformInAppWebViewController.isVisible}
  ///
  ///{@macro cygnus_core.PlatformInAppWebViewController.isVisible.supported_platforms}
  Future<bool> isVisible() => platform.isVisible();

  ///{@macro cygnus_core.PlatformInAppWebViewController.requestPointerLock}
  ///
  ///{@macro cygnus_core.PlatformInAppWebViewController.requestPointerLock.supported_platforms}
  Future<bool> requestPointerLock() => platform.requestPointerLock();

  ///{@macro cygnus_core.PlatformInAppWebViewController.requestPointerUnlock}
  ///
  ///{@macro cygnus_core.PlatformInAppWebViewController.requestPointerUnlock.supported_platforms}
  Future<bool> requestPointerUnlock() => platform.requestPointerUnlock();

  ///{@macro cygnus_core.PlatformInAppWebViewController.clearFormData}
  ///
  ///{@macro cygnus_core.PlatformInAppWebViewController.clearFormData.supported_platforms}
  Future<void> clearFormData() => platform.clearFormData();

  ///{@macro cygnus_core.PlatformInAppWebViewController.getCameraCaptureState}
  ///
  ///{@macro cygnus_core.PlatformInAppWebViewController.getCameraCaptureState.supported_platforms}
  Future<MediaCaptureState?> getCameraCaptureState() =>
      platform.getCameraCaptureState();

  ///{@macro cygnus_core.PlatformInAppWebViewController.setCameraCaptureState}
  ///
  ///{@macro cygnus_core.PlatformInAppWebViewController.setCameraCaptureState.supported_platforms}
  Future<void> setCameraCaptureState({required MediaCaptureState state}) =>
      platform.setCameraCaptureState(state: state);

  ///{@macro cygnus_core.PlatformInAppWebViewController.getMicrophoneCaptureState}
  ///
  ///{@macro cygnus_core.PlatformInAppWebViewController.getMicrophoneCaptureState.supported_platforms}
  Future<MediaCaptureState?> getMicrophoneCaptureState() =>
      platform.getMicrophoneCaptureState();

  ///{@macro cygnus_core.PlatformInAppWebViewController.setMicrophoneCaptureState}
  ///
  ///{@macro cygnus_core.PlatformInAppWebViewController.setMicrophoneCaptureState.supported_platforms}
  Future<void> setMicrophoneCaptureState({required MediaCaptureState state}) =>
      platform.setMicrophoneCaptureState(state: state);

  ///{@macro cygnus_core.PlatformInAppWebViewController.isPlayingAudio}
  ///
  ///{@macro cygnus_core.PlatformInAppWebViewController.isPlayingAudio.supported_platforms}
  Future<bool> isPlayingAudio() => platform.isPlayingAudio();

  ///{@macro cygnus_core.PlatformInAppWebViewController.isMuted}
  ///
  ///{@macro cygnus_core.PlatformInAppWebViewController.isMuted.supported_platforms}
  Future<bool> isMuted() => platform.isMuted();

  ///{@macro cygnus_core.PlatformInAppWebViewController.setMuted}
  ///
  ///{@macro cygnus_core.PlatformInAppWebViewController.setMuted.supported_platforms}
  Future<void> setMuted({required bool muted}) =>
      platform.setMuted(muted: muted);

  ///{@macro cygnus_core.PlatformInAppWebViewController.terminateWebProcess}
  ///
  ///{@macro cygnus_core.PlatformInAppWebViewController.terminateWebProcess.supported_platforms}
  Future<void> terminateWebProcess() => platform.terminateWebProcess();

  ///{@macro cygnus_core.PlatformInAppWebViewController.loadSimulatedRequest}
  ///
  ///{@macro cygnus_core.PlatformInAppWebViewController.loadSimulatedRequest.supported_platforms}
  Future<void> loadSimulatedRequest({
    required URLRequest urlRequest,
    required Uint8List data,
    URLResponse? urlResponse,
  }) => platform.loadSimulatedRequest(urlRequest: urlRequest, data: data);

  ///{@macro cygnus_core.PlatformInAppWebViewController.openDevTools}
  ///
  ///{@macro cygnus_core.PlatformInAppWebViewController.openDevTools.supported_platforms}
  Future<void> openDevTools() => platform.openDevTools();

  ///{@macro cygnus_core.PlatformInAppWebViewController.callDevToolsProtocolMethod}
  ///
  ///{@macro cygnus_core.PlatformInAppWebViewController.callDevToolsProtocolMethod.supported_platforms}
  Future<dynamic> callDevToolsProtocolMethod({
    required String methodName,
    Map<String, dynamic>? parameters,
  }) => platform.callDevToolsProtocolMethod(
    methodName: methodName,
    parameters: parameters,
  );

  ///{@macro cygnus_core.PlatformInAppWebViewController.addDevToolsProtocolEventListener}
  ///
  ///{@macro cygnus_core.PlatformInAppWebViewController.addDevToolsProtocolEventListener.supported_platforms}
  Future<void> addDevToolsProtocolEventListener({
    required String eventName,
    required Function(dynamic data) callback,
  }) => platform.addDevToolsProtocolEventListener(
    eventName: eventName,
    callback: callback,
  );

  ///{@macro cygnus_core.PlatformInAppWebViewController.removeDevToolsProtocolEventListener}
  ///
  ///{@macro cygnus_core.PlatformInAppWebViewController.removeDevToolsProtocolEventListener.supported_platforms}
  Future<void> removeDevToolsProtocolEventListener({
    required String eventName,
  }) => platform.removeDevToolsProtocolEventListener(eventName: eventName);

  ///{@macro cygnus_core.PlatformInAppWebViewController.isInterfaceSupported}
  ///
  ///{@macro cygnus_core.PlatformInAppWebViewController.isInterfaceSupported.supported_platforms}
  Future<bool> isInterfaceSupported(WebViewInterface interface) =>
      platform.isInterfaceSupported(interface);

  ///{@macro cygnus_core.PlatformInAppWebViewController.saveState}
  ///
  ///{@macro cygnus_core.PlatformInAppWebViewController.saveState.supported_platforms}
  Future<Uint8List?> saveState() => platform.saveState();

  ///{@macro cygnus_core.PlatformInAppWebViewController.restoreState}
  ///
  ///{@macro cygnus_core.PlatformInAppWebViewController.restoreState.supported_platforms}
  Future<bool> restoreState(Uint8List state) => platform.restoreState(state);

  ///{@macro cygnus_core.PlatformInAppWebViewController.getIFrameId}
  ///
  ///{@macro cygnus_core.PlatformInAppWebViewController.getIFrameId.supported_platforms}
  Future<String?> getIFrameId() => platform.getIFrameId();

  ///{@macro cygnus_core.PlatformInAppWebViewController.getDefaultUserAgent}
  ///
  ///{@macro cygnus_core.PlatformInAppWebViewController.getDefaultUserAgent.supported_platforms}
  static Future<String> getDefaultUserAgent() =>
      PlatformInAppWebViewController.static().getDefaultUserAgent();

  ///{@macro cygnus_core.PlatformInAppWebViewController.clearClientCertPreferences}
  ///
  ///{@macro cygnus_core.PlatformInAppWebViewController.clearClientCertPreferences.supported_platforms}
  static Future<void> clearClientCertPreferences() =>
      PlatformInAppWebViewController.static().clearClientCertPreferences();

  ///{@macro cygnus_core.PlatformInAppWebViewController.getSafeBrowsingPrivacyPolicyUrl}
  ///
  ///{@macro cygnus_core.PlatformInAppWebViewController.getSafeBrowsingPrivacyPolicyUrl.supported_platforms}
  static Future<WebUri?> getSafeBrowsingPrivacyPolicyUrl() =>
      PlatformInAppWebViewController.static().getSafeBrowsingPrivacyPolicyUrl();

  ///{@macro cygnus_core.PlatformInAppWebViewController.setSafeBrowsingWhitelist}
  ///
  ///{@macro cygnus_core.PlatformInAppWebViewController.setSafeBrowsingWhitelist.supported_platforms}
  @Deprecated("Use setSafeBrowsingAllowlist instead")
  static Future<bool> setSafeBrowsingWhitelist({required List<String> hosts}) =>
      PlatformInAppWebViewController.static().setSafeBrowsingWhitelist(
        hosts: hosts,
      );

  ///{@macro cygnus_core.PlatformInAppWebViewController.setSafeBrowsingAllowlist}
  ///
  ///{@macro cygnus_core.PlatformInAppWebViewController.setSafeBrowsingAllowlist.supported_platforms}
  static Future<bool> setSafeBrowsingAllowlist({required List<String> hosts}) =>
      PlatformInAppWebViewController.static().setSafeBrowsingAllowlist(
        hosts: hosts,
      );

  ///{@macro cygnus_core.PlatformInAppWebViewController.getCurrentWebViewPackage}
  ///
  ///{@macro cygnus_core.PlatformInAppWebViewController.getCurrentWebViewPackage.supported_platforms}
  static Future<WebViewPackageInfo?> getCurrentWebViewPackage() =>
      PlatformInAppWebViewController.static().getCurrentWebViewPackage();

  ///{@macro cygnus_core.PlatformInAppWebViewController.setWebContentsDebuggingEnabled}
  ///
  ///{@macro cygnus_core.PlatformInAppWebViewController.setWebContentsDebuggingEnabled.supported_platforms}
  static Future<void> setWebContentsDebuggingEnabled(bool debuggingEnabled) =>
      PlatformInAppWebViewController.static().setWebContentsDebuggingEnabled(
        debuggingEnabled,
      );

  ///{@macro cygnus_core.PlatformInAppWebViewController.getVariationsHeader}
  ///
  ///{@macro cygnus_core.PlatformInAppWebViewController.getVariationsHeader.supported_platforms}
  static Future<String?> getVariationsHeader() =>
      PlatformInAppWebViewController.static().getVariationsHeader();

  ///{@macro cygnus_core.PlatformInAppWebViewController.isMultiProcessEnabled}
  ///
  ///{@macro cygnus_core.PlatformInAppWebViewController.isMultiProcessEnabled.supported_platforms}
  static Future<bool> isMultiProcessEnabled() =>
      PlatformInAppWebViewController.static().isMultiProcessEnabled();

  ///{@macro cygnus_core.PlatformInAppWebViewController.disableWebView}
  ///
  ///{@macro cygnus_core.PlatformInAppWebViewController.disableWebView.supported_platforms}
  static Future<void> disableWebView() =>
      PlatformInAppWebViewController.static().disableWebView();

  ///{@macro cygnus_core.PlatformInAppWebViewController.handlesURLScheme}
  ///
  ///{@macro cygnus_core.PlatformInAppWebViewController.handlesURLScheme.supported_platforms}
  static Future<bool> handlesURLScheme(String urlScheme) =>
      PlatformInAppWebViewController.static().handlesURLScheme(urlScheme);

  ///{@macro cygnus_core.PlatformInAppWebViewController.disposeKeepAlive}
  ///
  ///{@macro cygnus_core.PlatformInAppWebViewController.disposeKeepAlive.supported_platforms}
  static Future<void> disposeKeepAlive(InAppWebViewKeepAlive keepAlive) =>
      PlatformInAppWebViewController.static().disposeKeepAlive(keepAlive);

  ///{@macro cygnus_core.PlatformInAppWebViewController.clearAllCache}
  ///
  ///{@macro cygnus_core.PlatformInAppWebViewController.clearAllCache.supported_platforms}
  static Future<void> clearAllCache({bool includeDiskFiles = true}) =>
      PlatformInAppWebViewController.static().clearAllCache(
        includeDiskFiles: includeDiskFiles,
      );

  ///{@macro cygnus_core.PlatformInAppWebViewController.enableSlowWholeDocumentDraw}
  ///
  ///{@macro cygnus_core.PlatformInAppWebViewController.enableSlowWholeDocumentDraw.supported_platforms}
  static Future<void> enableSlowWholeDocumentDraw() =>
      PlatformInAppWebViewController.static().enableSlowWholeDocumentDraw();

  ///{@macro cygnus_core.PlatformInAppWebViewController.setJavaScriptBridgeName}
  ///
  ///{@macro cygnus_core.PlatformInAppWebViewController.setJavaScriptBridgeName.supported_platforms}
  static Future<void> setJavaScriptBridgeName(String bridgeName) =>
      PlatformInAppWebViewController.static().setJavaScriptBridgeName(
        bridgeName,
      );

  ///{@macro cygnus_core.PlatformInAppWebViewController.getJavaScriptBridgeName}
  ///
  ///{@macro cygnus_core.PlatformInAppWebViewController.getJavaScriptBridgeName.supported_platforms}
  static Future<String> getJavaScriptBridgeName() =>
      PlatformInAppWebViewController.static().getJavaScriptBridgeName();

  ///{@macro cygnus_core.PlatformInAppWebViewController.tRexRunnerHtml}
  ///
  ///{@macro cygnus_core.PlatformInAppWebViewController.tRexRunnerHtml.supported_platforms}
  static Future<String> get tRexRunnerHtml =>
      PlatformInAppWebViewController.static().tRexRunnerHtml;

  ///{@macro cygnus_core.PlatformInAppWebViewController.tRexRunnerCss}
  ///
  ///{@macro cygnus_core.PlatformInAppWebViewController.tRexRunnerCss.supported_platforms}
  static Future<String> get tRexRunnerCss =>
      PlatformInAppWebViewController.static().tRexRunnerCss;

  ///{@macro cygnus_core.PlatformInAppWebViewController.isClassSupported}
  static bool isClassSupported({TargetPlatform? platform}) =>
      PlatformInAppWebViewController.static().isClassSupported(
        platform: platform,
      );

  ///{@macro cygnus_core.PlatformInAppWebViewController.isPropertySupported}
  static bool isPropertySupported(
    PlatformInAppWebViewControllerProperty property, {
    TargetPlatform? platform,
  }) => PlatformInAppWebViewController.static().isPropertySupported(
    property,
    platform: platform,
  );

  ///{@macro cygnus_core.PlatformInAppWebViewController.isMethodSupported}
  static bool isMethodSupported(
    PlatformInAppWebViewControllerMethod method, {
    TargetPlatform? platform,
  }) => PlatformInAppWebViewController.static().isMethodSupported(
    method,
    platform: platform,
  );

  ///{@macro cygnus_core.PlatformInAppWebViewController.getViewId}
  ///
  ///{@macro cygnus_core.PlatformInAppWebViewController.getViewId.supported_platforms}
  dynamic getViewId() => platform.getViewId();

  ///{@macro cygnus_core.PlatformInAppWebViewController.dispose}
  ///
  ///{@macro cygnus_core.PlatformInAppWebViewController.dispose.supported_platforms}
  void dispose({bool isKeepAlive = false}) =>
      platform.dispose(isKeepAlive: isKeepAlive);
}
