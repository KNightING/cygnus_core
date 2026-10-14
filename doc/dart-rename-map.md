# Dart 公開 API 改名對照（階段 ②）

本表記錄階段 ② 的全部改名，供後續階段與下游專案（如 `nuxt-flutter-app` 的 `flutter-host`）遷移對照。**不保留舊名別名**。

## 規則

- 型別：前綴 `Cygnus`，並移除任何位置的詞 `InApp`；`Platform`、`Android`、`IOS` 等平台前綴保留（`PlatformInAppWebViewController` → `CygnusPlatformWebViewController`）。
- 例外：舊式子類 `InAppWebViewOptions`、`InAppBrowserOptions` 保留 `InApp`（僅加前綴）。
- 小寫開頭的識別字（含公開方法名）：移除 `InApp`，不加前綴。
- 檔案與目錄：去掉 `in_app_`、`inappwebview` 改為 `webview`，不加前綴。
- 不改：`ChannelController`、`Color`、`IdGenerator`、`Util` 等本就不對外匯出的名稱；與公開型別同名的 7 個實作類別（`lib/src/platforms/**`）；
  JS／channel 對外名稱 `flutterInAppWebViewPlatformReady`、`flutterInAppWebView`、`createFlutterInAppWebView`、`createInAppWebView`（階段 ③ 處理）。

## 型別（526）

| 舊名 | 新名 | 備註 |
|---|---|---|
| `ASN1DERDecoder` | `CygnusASN1DERDecoder` | 僅加前綴 |
| `ASN1DEREncoder` | `CygnusASN1DEREncoder` | 僅加前綴 |
| `ASN1DistinguishedNames` | `CygnusASN1DistinguishedNames` | 僅加前綴 |
| `ASN1Identifier` | `CygnusASN1Identifier` | 僅加前綴 |
| `ASN1IdentifierClass` | `CygnusASN1IdentifierClass` | 僅加前綴 |
| `ASN1IdentifierTagNumber` | `CygnusASN1IdentifierTagNumber` | 僅加前綴 |
| `ASN1Object` | `CygnusASN1Object` | 僅加前綴 |
| `ASN1OutOfBufferError` | `CygnusASN1OutOfBufferError` | 僅加前綴 |
| `ASN1ParseError` | `CygnusASN1ParseError` | 僅加前綴 |
| `AcceleratorKeyPressedDetail` | `CygnusAcceleratorKeyPressedDetail` | 僅加前綴 |
| `ActionModeMenuItem` | `CygnusActionModeMenuItem` | 僅加前綴 |
| `ActivityButton` | `CygnusActivityButton` | 僅加前綴 |
| `AjaxRequest` | `CygnusAjaxRequest` | 僅加前綴 |
| `AjaxRequestAction` | `CygnusAjaxRequestAction` | 僅加前綴 |
| `AjaxRequestEvent` | `CygnusAjaxRequestEvent` | 僅加前綴 |
| `AjaxRequestEventType` | `CygnusAjaxRequestEventType` | 僅加前綴 |
| `AjaxRequestHeaders` | `CygnusAjaxRequestHeaders` | 僅加前綴 |
| `AjaxRequestReadyState` | `CygnusAjaxRequestReadyState` | 僅加前綴 |
| `AndroidActionModeMenuItem` | `CygnusAndroidActionModeMenuItem` | 僅加前綴 |
| `AndroidCacheMode` | `CygnusAndroidCacheMode` | 僅加前綴 |
| `AndroidChromeCustomTabsOptions` | `CygnusAndroidChromeCustomTabsOptions` | 僅加前綴 |
| `AndroidCompositionMode` | `CygnusAndroidCompositionMode` | 僅加前綴 |
| `AndroidForceDark` | `CygnusAndroidForceDark` | 僅加前綴 |
| `AndroidInAppBrowserOptions` | `CygnusAndroidBrowserOptions` | 移除 InApp |
| `AndroidInAppWebViewController` | `CygnusAndroidWebViewController` | 實作層有同名類別，實作層維持原名；移除 InApp |
| `AndroidInAppWebViewOptions` | `CygnusAndroidWebViewOptions` | 移除 InApp |
| `AndroidLayoutAlgorithm` | `CygnusAndroidLayoutAlgorithm` | 僅加前綴 |
| `AndroidLayoutInDisplayCutoutMode` | `CygnusAndroidLayoutInDisplayCutoutMode` | 僅加前綴 |
| `AndroidMixedContentMode` | `CygnusAndroidMixedContentMode` | 僅加前綴 |
| `AndroidOptions` | `CygnusAndroidOptions` | 僅加前綴 |
| `AndroidOverScrollMode` | `CygnusAndroidOverScrollMode` | 僅加前綴 |
| `AndroidPullToRefreshSize` | `CygnusAndroidPullToRefreshSize` | 僅加前綴 |
| `AndroidResource` | `CygnusAndroidResource` | 僅加前綴 |
| `AndroidScrollBarStyle` | `CygnusAndroidScrollBarStyle` | 僅加前綴 |
| `AndroidServiceWorkerClient` | `CygnusAndroidServiceWorkerClient` | 僅加前綴 |
| `AndroidServiceWorkerController` | `CygnusAndroidServiceWorkerController` | 實作層有同名類別，實作層維持原名 |
| `AndroidSslError` | `CygnusAndroidSslError` | 僅加前綴 |
| `AndroidVerticalScrollbarPosition` | `CygnusAndroidVerticalScrollbarPosition` | 僅加前綴 |
| `AndroidWebStorageManager` | `CygnusAndroidWebStorageManager` | 實作層有同名類別，實作層維持原名 |
| `AndroidWebStorageOrigin` | `CygnusAndroidWebStorageOrigin` | 僅加前綴 |
| `AndroidWebViewFeature` | `CygnusAndroidWebViewFeature` | 實作層有同名類別，實作層維持原名 |
| `AndroidWebViewPackageInfo` | `CygnusAndroidWebViewPackageInfo` | 僅加前綴 |
| `AssetsPathHandler` | `CygnusAssetsPathHandler` | 僅加前綴 |
| `AttributedString` | `CygnusAttributedString` | 僅加前綴 |
| `AttributedStringTextEffectStyle` | `CygnusAttributedStringTextEffectStyle` | 僅加前綴 |
| `AuthorityInfoAccess` | `CygnusAuthorityInfoAccess` | 僅加前綴 |
| `AuthorityInfoAccessExtension` | `CygnusAuthorityInfoAccessExtension` | 僅加前綴 |
| `AuthorityKeyIdentifierExtension` | `CygnusAuthorityKeyIdentifierExtension` | 僅加前綴 |
| `BasicConstraintExtension` | `CygnusBasicConstraintExtension` | 僅加前綴 |
| `BrowserOptions` | `CygnusBrowserOptions` | 僅加前綴 |
| `BrowserProcessExitKind` | `CygnusBrowserProcessExitKind` | 僅加前綴 |
| `BrowserProcessExitedDetail` | `CygnusBrowserProcessExitedDetail` | 僅加前綴 |
| `BrowserProcessInfo` | `CygnusBrowserProcessInfo` | 僅加前綴 |
| `BrowserProcessInfosChangedDetail` | `CygnusBrowserProcessInfosChangedDetail` | 僅加前綴 |
| `BrowserProcessKind` | `CygnusBrowserProcessKind` | 僅加前綴 |
| `CRLDistributionPointsExtension` | `CygnusCRLDistributionPointsExtension` | 僅加前綴 |
| `CSSLinkHtmlTagAttributes` | `CygnusCSSLinkHtmlTagAttributes` | 僅加前綴 |
| `CacheMode` | `CygnusCacheMode` | 僅加前綴 |
| `CacheModel` | `CygnusCacheModel` | 僅加前綴 |
| `CallAsyncJavaScriptResult` | `CygnusCallAsyncJavaScriptResult` | 僅加前綴 |
| `CertificatePoliciesExtension` | `CygnusCertificatePoliciesExtension` | 僅加前綴 |
| `CertificatePolicy` | `CygnusCertificatePolicy` | 僅加前綴 |
| `CertificatePolicyQualifier` | `CygnusCertificatePolicyQualifier` | 僅加前綴 |
| `ChromeSafariBrowser` | `CygnusChromeSafariBrowser` | 僅加前綴 |
| `ChromeSafariBrowserActionButton` | `CygnusChromeSafariBrowserActionButton` | 僅加前綴 |
| `ChromeSafariBrowserClassOptions` | `CygnusChromeSafariBrowserClassOptions` | 僅加前綴 |
| `ChromeSafariBrowserMenuItem` | `CygnusChromeSafariBrowserMenuItem` | 僅加前綴 |
| `ChromeSafariBrowserOptions` | `CygnusChromeSafariBrowserOptions` | 僅加前綴 |
| `ChromeSafariBrowserSecondaryToolbar` | `CygnusChromeSafariBrowserSecondaryToolbar` | 僅加前綴 |
| `ChromeSafariBrowserSecondaryToolbarClickableID` | `CygnusChromeSafariBrowserSecondaryToolbarClickableID` | 僅加前綴 |
| `ChromeSafariBrowserSettings` | `CygnusChromeSafariBrowserSettings` | 僅加前綴 |
| `ChromeSafariBrowserSettingsProperty` | `CygnusChromeSafariBrowserSettingsProperty` | 僅加前綴 |
| `ClientCertChallenge` | `CygnusClientCertChallenge` | 僅加前綴 |
| `ClientCertResponse` | `CygnusClientCertResponse` | 僅加前綴 |
| `ClientCertResponseAction` | `CygnusClientCertResponseAction` | 僅加前綴 |
| `CompressFormat` | `CygnusCompressFormat` | 僅加前綴 |
| `ConsoleMessage` | `CygnusConsoleMessage` | 僅加前綴 |
| `ConsoleMessageLevel` | `CygnusConsoleMessageLevel` | 僅加前綴 |
| `ContentBlocker` | `CygnusContentBlocker` | 僅加前綴 |
| `ContentBlockerAction` | `CygnusContentBlockerAction` | 僅加前綴 |
| `ContentBlockerActionType` | `CygnusContentBlockerActionType` | 僅加前綴 |
| `ContentBlockerTrigger` | `CygnusContentBlockerTrigger` | 僅加前綴 |
| `ContentBlockerTriggerLoadContext` | `CygnusContentBlockerTriggerLoadContext` | 僅加前綴 |
| `ContentBlockerTriggerLoadType` | `CygnusContentBlockerTriggerLoadType` | 僅加前綴 |
| `ContentBlockerTriggerResourceType` | `CygnusContentBlockerTriggerResourceType` | 僅加前綴 |
| `ContentWorld` | `CygnusContentWorld` | 僅加前綴 |
| `ContextMenu` | `CygnusContextMenu` | 僅加前綴 |
| `ContextMenuItem` | `CygnusContextMenuItem` | 僅加前綴 |
| `ContextMenuOptions` | `CygnusContextMenuOptions` | 僅加前綴 |
| `ContextMenuSettings` | `CygnusContextMenuSettings` | 僅加前綴 |
| `Cookie` | `CygnusCookie` | 僅加前綴 |
| `CookieManager` | `CygnusCookieManager` | 僅加前綴 |
| `CreateWindowAction` | `CygnusCreateWindowAction` | 僅加前綴 |
| `CrossOrigin` | `CygnusCrossOrigin` | 僅加前綴 |
| `CustomPathHandler` | `CygnusCustomPathHandler` | 僅加前綴 |
| `CustomSchemeRegistration` | `CygnusCustomSchemeRegistration` | 僅加前綴 |
| `CustomSchemeResponse` | `CygnusCustomSchemeResponse` | 僅加前綴 |
| `CustomTabsNavigationEventType` | `CygnusCustomTabsNavigationEventType` | 僅加前綴 |
| `CustomTabsPostMessageResultType` | `CygnusCustomTabsPostMessageResultType` | 僅加前綴 |
| `CustomTabsRelationType` | `CygnusCustomTabsRelationType` | 僅加前綴 |
| `CustomTabsShareState` | `CygnusCustomTabsShareState` | 僅加前綴 |
| `DataDetectorTypes` | `CygnusDataDetectorTypes` | 僅加前綴 |
| `DebugLoggingSettings` | `CygnusDebugLoggingSettings` | 僅加前綴 |
| `DefaultInAppLocalhostServer` | `CygnusDefaultLocalhostServer` | 移除 InApp |
| `DefaultInAppLocalhostServerCreationParams` | `CygnusDefaultLocalhostServerCreationParams` | 移除 InApp |
| `DismissButtonStyle` | `CygnusDismissButtonStyle` | 僅加前綴 |
| `Disposable` | `CygnusDisposable` | 僅加前綴 |
| `DownloadStartRequest` | `CygnusDownloadStartRequest` | 僅加前綴 |
| `DownloadStartResponse` | `CygnusDownloadStartResponse` | 僅加前綴 |
| `DownloadStartResponseAction` | `CygnusDownloadStartResponseAction` | 僅加前綴 |
| `EnumMethod` | `CygnusEnumMethod` | 僅加前綴 |
| `EnvironmentChannelSearchKind` | `CygnusEnvironmentChannelSearchKind` | 僅加前綴 |
| `EnvironmentReleaseChannels` | `CygnusEnvironmentReleaseChannels` | 僅加前綴 |
| `EnvironmentScrollbarStyle` | `CygnusEnvironmentScrollbarStyle` | 僅加前綴 |
| `Favicon` | `CygnusFavicon` | 僅加前綴 |
| `FaviconChangedRequest` | `CygnusFaviconChangedRequest` | 僅加前綴 |
| `FaviconImageFormat` | `CygnusFaviconImageFormat` | 僅加前綴 |
| `FetchRequest` | `CygnusFetchRequest` | 僅加前綴 |
| `FetchRequestAction` | `CygnusFetchRequestAction` | 僅加前綴 |
| `FetchRequestCredential` | `CygnusFetchRequestCredential` | 僅加前綴 |
| `FetchRequestCredentialDefault` | `CygnusFetchRequestCredentialDefault` | 僅加前綴 |
| `FetchRequestFederatedCredential` | `CygnusFetchRequestFederatedCredential` | 僅加前綴 |
| `FetchRequestPasswordCredential` | `CygnusFetchRequestPasswordCredential` | 僅加前綴 |
| `FindInteractionController` | `CygnusFindInteractionController` | 僅加前綴 |
| `FindOptions` | `CygnusFindOptions` | 僅加前綴 |
| `FindSession` | `CygnusFindSession` | 僅加前綴 |
| `FocusDirection` | `CygnusFocusDirection` | 僅加前綴 |
| `FontHintingStyle` | `CygnusFontHintingStyle` | 僅加前綴 |
| `FontSubpixelLayout` | `CygnusFontSubpixelLayout` | 僅加前綴 |
| `ForceDark` | `CygnusForceDark` | 僅加前綴 |
| `ForceDarkStrategy` | `CygnusForceDarkStrategy` | 僅加前綴 |
| `FormResubmissionAction` | `CygnusFormResubmissionAction` | 僅加前綴 |
| `FrameInfo` | `CygnusFrameInfo` | 僅加前綴 |
| `FrameKind` | `CygnusFrameKind` | 僅加前綴 |
| `GeolocationPermissionShowPromptResponse` | `CygnusGeolocationPermissionShowPromptResponse` | 僅加前綴 |
| `HTTPCookieSameSitePolicy` | `CygnusHTTPCookieSameSitePolicy` | 僅加前綴 |
| `HeadlessInAppWebView` | `CygnusHeadlessWebView` | 移除 InApp |
| `HttpAuthCredentialDatabase` | `CygnusHttpAuthCredentialDatabase` | 僅加前綴 |
| `HttpAuthResponse` | `CygnusHttpAuthResponse` | 僅加前綴 |
| `HttpAuthResponseAction` | `CygnusHttpAuthResponseAction` | 僅加前綴 |
| `HttpAuthenticationChallenge` | `CygnusHttpAuthenticationChallenge` | 僅加前綴 |
| `IOSCookieManager` | `CygnusIOSCookieManager` | 實作層有同名類別，實作層維持原名 |
| `IOSInAppBrowserOptions` | `CygnusIOSBrowserOptions` | 移除 InApp |
| `IOSInAppWebViewController` | `CygnusIOSWebViewController` | 實作層有同名類別，實作層維持原名；移除 InApp |
| `IOSInAppWebViewOptions` | `CygnusIOSWebViewOptions` | 移除 InApp |
| `IOSNSAttributedString` | `CygnusIOSNSAttributedString` | 僅加前綴 |
| `IOSNSAttributedStringTextEffectStyle` | `CygnusIOSNSAttributedStringTextEffectStyle` | 僅加前綴 |
| `IOSNSURLProtectionSpaceAuthenticationMethod` | `CygnusIOSNSURLProtectionSpaceAuthenticationMethod` | 僅加前綴 |
| `IOSNSURLProtectionSpaceProxyType` | `CygnusIOSNSURLProtectionSpaceProxyType` | 僅加前綴 |
| `IOSNSUnderlineStyle` | `CygnusIOSNSUnderlineStyle` | 僅加前綴 |
| `IOSNavigationResponseAction` | `CygnusIOSNavigationResponseAction` | 僅加前綴 |
| `IOSSafariDismissButtonStyle` | `CygnusIOSSafariDismissButtonStyle` | 僅加前綴 |
| `IOSSafariOptions` | `CygnusIOSSafariOptions` | 僅加前綴 |
| `IOSShouldAllowDeprecatedTLSAction` | `CygnusIOSShouldAllowDeprecatedTLSAction` | 僅加前綴 |
| `IOSSslError` | `CygnusIOSSslError` | 僅加前綴 |
| `IOSUIModalPresentationStyle` | `CygnusIOSUIModalPresentationStyle` | 僅加前綴 |
| `IOSUIModalTransitionStyle` | `CygnusIOSUIModalTransitionStyle` | 僅加前綴 |
| `IOSUIScrollViewContentInsetAdjustmentBehavior` | `CygnusIOSUIScrollViewContentInsetAdjustmentBehavior` | 僅加前綴 |
| `IOSUIScrollViewDecelerationRate` | `CygnusIOSUIScrollViewDecelerationRate` | 僅加前綴 |
| `IOSURLCredentialPersistence` | `CygnusIOSURLCredentialPersistence` | 僅加前綴 |
| `IOSURLRequestCachePolicy` | `CygnusIOSURLRequestCachePolicy` | 僅加前綴 |
| `IOSURLRequestNetworkServiceType` | `CygnusIOSURLRequestNetworkServiceType` | 僅加前綴 |
| `IOSURLResponse` | `CygnusIOSURLResponse` | 僅加前綴 |
| `IOSWKDataDetectorTypes` | `CygnusIOSWKDataDetectorTypes` | 僅加前綴 |
| `IOSWKFrameInfo` | `CygnusIOSWKFrameInfo` | 僅加前綴 |
| `IOSWKNavigationResponse` | `CygnusIOSWKNavigationResponse` | 僅加前綴 |
| `IOSWKNavigationType` | `CygnusIOSWKNavigationType` | 僅加前綴 |
| `IOSWKPDFConfiguration` | `CygnusIOSWKPDFConfiguration` | 僅加前綴 |
| `IOSWKSecurityOrigin` | `CygnusIOSWKSecurityOrigin` | 僅加前綴 |
| `IOSWKSelectionGranularity` | `CygnusIOSWKSelectionGranularity` | 僅加前綴 |
| `IOSWKWebsiteDataRecord` | `CygnusIOSWKWebsiteDataRecord` | 僅加前綴 |
| `IOSWKWebsiteDataType` | `CygnusIOSWKWebsiteDataType` | 僅加前綴 |
| `IOSWKWindowFeatures` | `CygnusIOSWKWindowFeatures` | 僅加前綴 |
| `IOSWebStorageManager` | `CygnusIOSWebStorageManager` | 實作層有同名類別，實作層維持原名 |
| `IWebMessagePort` | `CygnusIWebMessagePort` | 僅加前綴 |
| `InAppBrowser` | `CygnusBrowser` | 移除 InApp |
| `InAppBrowserClassOptions` | `CygnusBrowserClassOptions` | 移除 InApp |
| `InAppBrowserClassSettings` | `CygnusBrowserClassSettings` | 移除 InApp |
| `InAppBrowserMenuItem` | `CygnusBrowserMenuItem` | 移除 InApp |
| `InAppBrowserOptions` | `CygnusInAppBrowserOptions` | 舊式子類例外：保留 InApp |
| `InAppBrowserSettings` | `CygnusBrowserSettings` | 移除 InApp |
| `InAppBrowserSettingsProperty` | `CygnusBrowserSettingsProperty` | 移除 InApp |
| `InAppLocalhostServer` | `CygnusLocalhostServer` | 移除 InApp |
| `InAppWebView` | `CygnusWebView` | 移除 InApp |
| `InAppWebViewController` | `CygnusWebViewController` | 移除 InApp |
| `InAppWebViewControllerKeepAliveProps` | `CygnusWebViewControllerKeepAliveProps` | 移除 InApp |
| `InAppWebViewGroupOptions` | `CygnusWebViewGroupOptions` | 移除 InApp |
| `InAppWebViewHitTestResult` | `CygnusWebViewHitTestResult` | 移除 InApp |
| `InAppWebViewHitTestResultType` | `CygnusWebViewHitTestResultType` | 移除 InApp |
| `InAppWebViewInitialData` | `CygnusWebViewInitialData` | 移除 InApp |
| `InAppWebViewKeepAlive` | `CygnusWebViewKeepAlive` | 移除 InApp |
| `InAppWebViewOptions` | `CygnusInAppWebViewOptions` | 舊式子類例外：保留 InApp |
| `InAppWebViewPlatform` | `CygnusWebViewPlatform` | 移除 InApp |
| `InAppWebViewRect` | `CygnusWebViewRect` | 移除 InApp |
| `InAppWebViewSettings` | `CygnusWebViewSettings` | 移除 InApp |
| `InAppWebViewSettingsProperty` | `CygnusWebViewSettingsProperty` | 移除 InApp |
| `InternalStoragePathHandler` | `CygnusInternalStoragePathHandler` | 僅加前綴 |
| `IosOptions` | `CygnusIosOptions` | 僅加前綴 |
| `JavaScriptHandlerCallback` | `CygnusJavaScriptHandlerCallback` | 僅加前綴 |
| `JavaScriptHandlerFunction` | `CygnusJavaScriptHandlerFunction` | 僅加前綴 |
| `JavaScriptHandlerFunctionData` | `CygnusJavaScriptHandlerFunctionData` | 僅加前綴 |
| `JavaScriptReplyProxy` | `CygnusJavaScriptReplyProxy` | 僅加前綴 |
| `JsAlertRequest` | `CygnusJsAlertRequest` | 僅加前綴 |
| `JsAlertResponse` | `CygnusJsAlertResponse` | 僅加前綴 |
| `JsAlertResponseAction` | `CygnusJsAlertResponseAction` | 僅加前綴 |
| `JsBeforeUnloadRequest` | `CygnusJsBeforeUnloadRequest` | 僅加前綴 |
| `JsBeforeUnloadResponse` | `CygnusJsBeforeUnloadResponse` | 僅加前綴 |
| `JsBeforeUnloadResponseAction` | `CygnusJsBeforeUnloadResponseAction` | 僅加前綴 |
| `JsConfirmRequest` | `CygnusJsConfirmRequest` | 僅加前綴 |
| `JsConfirmResponse` | `CygnusJsConfirmResponse` | 僅加前綴 |
| `JsConfirmResponseAction` | `CygnusJsConfirmResponseAction` | 僅加前綴 |
| `JsPromptRequest` | `CygnusJsPromptRequest` | 僅加前綴 |
| `JsPromptResponse` | `CygnusJsPromptResponse` | 僅加前綴 |
| `JsPromptResponseAction` | `CygnusJsPromptResponseAction` | 僅加前綴 |
| `KeyUsage` | `CygnusKeyUsage` | 僅加前綴 |
| `LaunchingExternalUriSchemeRequest` | `CygnusLaunchingExternalUriSchemeRequest` | 僅加前綴 |
| `LaunchingExternalUriSchemeResponse` | `CygnusLaunchingExternalUriSchemeResponse` | 僅加前綴 |
| `LayoutAlgorithm` | `CygnusLayoutAlgorithm` | 僅加前綴 |
| `LayoutInDisplayCutoutMode` | `CygnusLayoutInDisplayCutoutMode` | 僅加前綴 |
| `LoadedResource` | `CygnusLoadedResource` | 僅加前綴 |
| `LocalStorage` | `CygnusLocalStorage` | 僅加前綴 |
| `LoginRequest` | `CygnusLoginRequest` | 僅加前綴 |
| `MediaCaptureState` | `CygnusMediaCaptureState` | 僅加前綴 |
| `MediaPlaybackState` | `CygnusMediaPlaybackState` | 僅加前綴 |
| `MemoryUsageTargetLevel` | `CygnusMemoryUsageTargetLevel` | 僅加前綴 |
| `MetaTag` | `CygnusMetaTag` | 僅加前綴 |
| `MetaTagAttribute` | `CygnusMetaTagAttribute` | 僅加前綴 |
| `MimeTypeResolver` | `CygnusMimeTypeResolver` | 僅加前綴 |
| `MixedContentMode` | `CygnusMixedContentMode` | 僅加前綴 |
| `ModalPresentationStyle` | `CygnusModalPresentationStyle` | 僅加前綴 |
| `ModalTransitionStyle` | `CygnusModalTransitionStyle` | 僅加前綴 |
| `NavigationAction` | `CygnusNavigationAction` | 僅加前綴 |
| `NavigationActionPolicy` | `CygnusNavigationActionPolicy` | 僅加前綴 |
| `NavigationResponse` | `CygnusNavigationResponse` | 僅加前綴 |
| `NavigationResponseAction` | `CygnusNavigationResponseAction` | 僅加前綴 |
| `NavigationType` | `CygnusNavigationType` | 僅加前綴 |
| `NotificationReceivedRequest` | `CygnusNotificationReceivedRequest` | 僅加前綴 |
| `NotificationReceivedResponse` | `CygnusNotificationReceivedResponse` | 僅加前綴 |
| `OID` | `CygnusOID` | 僅加前綴 |
| `OnPostMessageCallback` | `CygnusOnPostMessageCallback` | 僅加前綴 |
| `OverScrollMode` | `CygnusOverScrollMode` | 僅加前綴 |
| `PDFConfiguration` | `CygnusPDFConfiguration` | 僅加前綴 |
| `PathHandler` | `CygnusPathHandler` | 僅加前綴 |
| `PdfToolbarItems` | `CygnusPdfToolbarItems` | 僅加前綴 |
| `PermissionRequest` | `CygnusPermissionRequest` | 僅加前綴 |
| `PermissionRequestResponse` | `CygnusPermissionRequestResponse` | 僅加前綴 |
| `PermissionRequestResponseAction` | `CygnusPermissionRequestResponseAction` | 僅加前綴 |
| `PermissionResourceType` | `CygnusPermissionResourceType` | 僅加前綴 |
| `PermissionResponse` | `CygnusPermissionResponse` | 僅加前綴 |
| `PermissionResponseAction` | `CygnusPermissionResponseAction` | 僅加前綴 |
| `PhysicalKeyStatus` | `CygnusPhysicalKeyStatus` | 僅加前綴 |
| `PlatformAssetsPathHandler` | `CygnusPlatformAssetsPathHandler` | 僅加前綴 |
| `PlatformAssetsPathHandlerCreationParams` | `CygnusPlatformAssetsPathHandlerCreationParams` | 僅加前綴 |
| `PlatformChromeSafariBrowser` | `CygnusPlatformChromeSafariBrowser` | 僅加前綴 |
| `PlatformChromeSafariBrowserCreationParams` | `CygnusPlatformChromeSafariBrowserCreationParams` | 僅加前綴 |
| `PlatformChromeSafariBrowserEvents` | `CygnusPlatformChromeSafariBrowserEvents` | 僅加前綴 |
| `PlatformChromeSafariBrowserEventsMethod` | `CygnusPlatformChromeSafariBrowserEventsMethod` | 僅加前綴 |
| `PlatformChromeSafariBrowserMethod` | `CygnusPlatformChromeSafariBrowserMethod` | 僅加前綴 |
| `PlatformCookieManager` | `CygnusPlatformCookieManager` | 僅加前綴 |
| `PlatformCookieManagerCreationParams` | `CygnusPlatformCookieManagerCreationParams` | 僅加前綴 |
| `PlatformCookieManagerCreationParamsProperty` | `CygnusPlatformCookieManagerCreationParamsProperty` | 僅加前綴 |
| `PlatformCookieManagerMethod` | `CygnusPlatformCookieManagerMethod` | 僅加前綴 |
| `PlatformCustomPathHandler` | `CygnusPlatformCustomPathHandler` | 僅加前綴 |
| `PlatformCustomPathHandlerCreationParams` | `CygnusPlatformCustomPathHandlerCreationParams` | 僅加前綴 |
| `PlatformFindInteractionController` | `CygnusPlatformFindInteractionController` | 僅加前綴 |
| `PlatformFindInteractionControllerCreationParams` | `CygnusPlatformFindInteractionControllerCreationParams` | 僅加前綴 |
| `PlatformFindInteractionControllerCreationParamsProperty` | `CygnusPlatformFindInteractionControllerCreationParamsProperty` | 僅加前綴 |
| `PlatformFindInteractionControllerMethod` | `CygnusPlatformFindInteractionControllerMethod` | 僅加前綴 |
| `PlatformHeadlessInAppWebView` | `CygnusPlatformHeadlessWebView` | 移除 InApp |
| `PlatformHeadlessInAppWebViewCreationParams` | `CygnusPlatformHeadlessWebViewCreationParams` | 移除 InApp |
| `PlatformHeadlessInAppWebViewCreationParamsProperty` | `CygnusPlatformHeadlessWebViewCreationParamsProperty` | 移除 InApp |
| `PlatformHeadlessInAppWebViewMethod` | `CygnusPlatformHeadlessWebViewMethod` | 移除 InApp |
| `PlatformHttpAuthCredentialDatabase` | `CygnusPlatformHttpAuthCredentialDatabase` | 僅加前綴 |
| `PlatformHttpAuthCredentialDatabaseCreationParams` | `CygnusPlatformHttpAuthCredentialDatabaseCreationParams` | 僅加前綴 |
| `PlatformHttpAuthCredentialDatabaseMethod` | `CygnusPlatformHttpAuthCredentialDatabaseMethod` | 僅加前綴 |
| `PlatformInAppBrowser` | `CygnusPlatformBrowser` | 移除 InApp |
| `PlatformInAppBrowserCreationParams` | `CygnusPlatformBrowserCreationParams` | 移除 InApp |
| `PlatformInAppBrowserEvents` | `CygnusPlatformBrowserEvents` | 移除 InApp |
| `PlatformInAppBrowserEventsMethod` | `CygnusPlatformBrowserEventsMethod` | 移除 InApp |
| `PlatformInAppBrowserMethod` | `CygnusPlatformBrowserMethod` | 移除 InApp |
| `PlatformInAppBrowserProperty` | `CygnusPlatformBrowserProperty` | 移除 InApp |
| `PlatformInAppLocalhostServer` | `CygnusPlatformLocalhostServer` | 移除 InApp |
| `PlatformInAppLocalhostServerCreationParams` | `CygnusPlatformLocalhostServerCreationParams` | 移除 InApp |
| `PlatformInAppLocalhostServerMethod` | `CygnusPlatformLocalhostServerMethod` | 移除 InApp |
| `PlatformInAppWebViewController` | `CygnusPlatformWebViewController` | 移除 InApp |
| `PlatformInAppWebViewControllerCreationParams` | `CygnusPlatformWebViewControllerCreationParams` | 移除 InApp |
| `PlatformInAppWebViewControllerMethod` | `CygnusPlatformWebViewControllerMethod` | 移除 InApp |
| `PlatformInAppWebViewControllerProperty` | `CygnusPlatformWebViewControllerProperty` | 移除 InApp |
| `PlatformInAppWebViewWidget` | `CygnusPlatformWebViewWidget` | 移除 InApp |
| `PlatformInAppWebViewWidgetCreationParams` | `CygnusPlatformWebViewWidgetCreationParams` | 移除 InApp |
| `PlatformInAppWebViewWidgetCreationParamsProperty` | `CygnusPlatformWebViewWidgetCreationParamsProperty` | 移除 InApp |
| `PlatformInternalStoragePathHandler` | `CygnusPlatformInternalStoragePathHandler` | 僅加前綴 |
| `PlatformInternalStoragePathHandlerCreationParams` | `CygnusPlatformInternalStoragePathHandlerCreationParams` | 僅加前綴 |
| `PlatformJavaScriptReplyProxy` | `CygnusPlatformJavaScriptReplyProxy` | 僅加前綴 |
| `PlatformJavaScriptReplyProxyCreationParams` | `CygnusPlatformJavaScriptReplyProxyCreationParams` | 僅加前綴 |
| `PlatformLocalStorage` | `CygnusPlatformLocalStorage` | 僅加前綴 |
| `PlatformLocalStorageCreationParams` | `CygnusPlatformLocalStorageCreationParams` | 僅加前綴 |
| `PlatformLocalStorageMethod` | `CygnusPlatformLocalStorageMethod` | 僅加前綴 |
| `PlatformPathHandler` | `CygnusPlatformPathHandler` | 僅加前綴 |
| `PlatformPathHandlerCreationParams` | `CygnusPlatformPathHandlerCreationParams` | 僅加前綴 |
| `PlatformPathHandlerEvents` | `CygnusPlatformPathHandlerEvents` | 僅加前綴 |
| `PlatformPrintJobController` | `CygnusPlatformPrintJobController` | 僅加前綴 |
| `PlatformPrintJobControllerCreationParams` | `CygnusPlatformPrintJobControllerCreationParams` | 僅加前綴 |
| `PlatformPrintJobControllerCreationParamsProperty` | `CygnusPlatformPrintJobControllerCreationParamsProperty` | 僅加前綴 |
| `PlatformPrintJobControllerMethod` | `CygnusPlatformPrintJobControllerMethod` | 僅加前綴 |
| `PlatformPrintJobControllerProperty` | `CygnusPlatformPrintJobControllerProperty` | 僅加前綴 |
| `PlatformProcessGlobalConfig` | `CygnusPlatformProcessGlobalConfig` | 僅加前綴 |
| `PlatformProcessGlobalConfigCreationParams` | `CygnusPlatformProcessGlobalConfigCreationParams` | 僅加前綴 |
| `PlatformProcessGlobalConfigMethod` | `CygnusPlatformProcessGlobalConfigMethod` | 僅加前綴 |
| `PlatformProxyController` | `CygnusPlatformProxyController` | 僅加前綴 |
| `PlatformProxyControllerCreationParams` | `CygnusPlatformProxyControllerCreationParams` | 僅加前綴 |
| `PlatformProxyControllerMethod` | `CygnusPlatformProxyControllerMethod` | 僅加前綴 |
| `PlatformPullToRefreshController` | `CygnusPlatformPullToRefreshController` | 僅加前綴 |
| `PlatformPullToRefreshControllerCreationParams` | `CygnusPlatformPullToRefreshControllerCreationParams` | 僅加前綴 |
| `PlatformPullToRefreshControllerCreationParamsProperty` | `CygnusPlatformPullToRefreshControllerCreationParamsProperty` | 僅加前綴 |
| `PlatformPullToRefreshControllerMethod` | `CygnusPlatformPullToRefreshControllerMethod` | 僅加前綴 |
| `PlatformResourcesPathHandler` | `CygnusPlatformResourcesPathHandler` | 僅加前綴 |
| `PlatformResourcesPathHandlerCreationParams` | `CygnusPlatformResourcesPathHandlerCreationParams` | 僅加前綴 |
| `PlatformServiceWorkerController` | `CygnusPlatformServiceWorkerController` | 僅加前綴 |
| `PlatformServiceWorkerControllerCreationParams` | `CygnusPlatformServiceWorkerControllerCreationParams` | 僅加前綴 |
| `PlatformServiceWorkerControllerMethod` | `CygnusPlatformServiceWorkerControllerMethod` | 僅加前綴 |
| `PlatformSessionStorage` | `CygnusPlatformSessionStorage` | 僅加前綴 |
| `PlatformSessionStorageCreationParams` | `CygnusPlatformSessionStorageCreationParams` | 僅加前綴 |
| `PlatformSessionStorageMethod` | `CygnusPlatformSessionStorageMethod` | 僅加前綴 |
| `PlatformStorage` | `CygnusPlatformStorage` | 僅加前綴 |
| `PlatformStorageCreationParams` | `CygnusPlatformStorageCreationParams` | 僅加前綴 |
| `PlatformStorageCreationParamsProperty` | `CygnusPlatformStorageCreationParamsProperty` | 僅加前綴 |
| `PlatformTracingController` | `CygnusPlatformTracingController` | 僅加前綴 |
| `PlatformTracingControllerCreationParams` | `CygnusPlatformTracingControllerCreationParams` | 僅加前綴 |
| `PlatformTracingControllerMethod` | `CygnusPlatformTracingControllerMethod` | 僅加前綴 |
| `PlatformWebAuthenticationSession` | `CygnusPlatformWebAuthenticationSession` | 僅加前綴 |
| `PlatformWebAuthenticationSessionCreationParams` | `CygnusPlatformWebAuthenticationSessionCreationParams` | 僅加前綴 |
| `PlatformWebAuthenticationSessionMethod` | `CygnusPlatformWebAuthenticationSessionMethod` | 僅加前綴 |
| `PlatformWebAuthenticationSessionProperty` | `CygnusPlatformWebAuthenticationSessionProperty` | 僅加前綴 |
| `PlatformWebMessageChannel` | `CygnusPlatformWebMessageChannel` | 僅加前綴 |
| `PlatformWebMessageChannelCreationParams` | `CygnusPlatformWebMessageChannelCreationParams` | 僅加前綴 |
| `PlatformWebMessageChannelCreationParamsProperty` | `CygnusPlatformWebMessageChannelCreationParamsProperty` | 僅加前綴 |
| `PlatformWebMessageChannelMethod` | `CygnusPlatformWebMessageChannelMethod` | 僅加前綴 |
| `PlatformWebMessageListener` | `CygnusPlatformWebMessageListener` | 僅加前綴 |
| `PlatformWebMessageListenerCreationParams` | `CygnusPlatformWebMessageListenerCreationParams` | 僅加前綴 |
| `PlatformWebMessageListenerCreationParamsProperty` | `CygnusPlatformWebMessageListenerCreationParamsProperty` | 僅加前綴 |
| `PlatformWebMessageListenerMethod` | `CygnusPlatformWebMessageListenerMethod` | 僅加前綴 |
| `PlatformWebMessagePort` | `CygnusPlatformWebMessagePort` | 僅加前綴 |
| `PlatformWebMessagePortCreationParams` | `CygnusPlatformWebMessagePortCreationParams` | 僅加前綴 |
| `PlatformWebNotificationController` | `CygnusPlatformWebNotificationController` | 僅加前綴 |
| `PlatformWebNotificationControllerCreationParams` | `CygnusPlatformWebNotificationControllerCreationParams` | 僅加前綴 |
| `PlatformWebNotificationControllerCreationParamsProperty` | `CygnusPlatformWebNotificationControllerCreationParamsProperty` | 僅加前綴 |
| `PlatformWebNotificationControllerMethod` | `CygnusPlatformWebNotificationControllerMethod` | 僅加前綴 |
| `PlatformWebNotificationControllerProperty` | `CygnusPlatformWebNotificationControllerProperty` | 僅加前綴 |
| `PlatformWebStorage` | `CygnusPlatformWebStorage` | 僅加前綴 |
| `PlatformWebStorageCreationParams` | `CygnusPlatformWebStorageCreationParams` | 僅加前綴 |
| `PlatformWebStorageCreationParamsProperty` | `CygnusPlatformWebStorageCreationParamsProperty` | 僅加前綴 |
| `PlatformWebStorageManager` | `CygnusPlatformWebStorageManager` | 僅加前綴 |
| `PlatformWebStorageManagerCreationParams` | `CygnusPlatformWebStorageManagerCreationParams` | 僅加前綴 |
| `PlatformWebStorageManagerMethod` | `CygnusPlatformWebStorageManagerMethod` | 僅加前綴 |
| `PlatformWebStorageMethod` | `CygnusPlatformWebStorageMethod` | 僅加前綴 |
| `PlatformWebStorageProperty` | `CygnusPlatformWebStorageProperty` | 僅加前綴 |
| `PlatformWebViewCreationParams` | `CygnusPlatformWebViewCreationParams` | 僅加前綴 |
| `PlatformWebViewCreationParamsProperty` | `CygnusPlatformWebViewCreationParamsProperty` | 僅加前綴 |
| `PlatformWebViewEnvironment` | `CygnusPlatformWebViewEnvironment` | 僅加前綴 |
| `PlatformWebViewEnvironmentCreationParams` | `CygnusPlatformWebViewEnvironmentCreationParams` | 僅加前綴 |
| `PlatformWebViewEnvironmentCreationParamsProperty` | `CygnusPlatformWebViewEnvironmentCreationParamsProperty` | 僅加前綴 |
| `PlatformWebViewEnvironmentMethod` | `CygnusPlatformWebViewEnvironmentMethod` | 僅加前綴 |
| `PlatformWebViewEnvironmentProperty` | `CygnusPlatformWebViewEnvironmentProperty` | 僅加前綴 |
| `PlatformWebViewFeature` | `CygnusPlatformWebViewFeature` | 僅加前綴 |
| `PlatformWebViewFeatureCreationParams` | `CygnusPlatformWebViewFeatureCreationParams` | 僅加前綴 |
| `PlatformWebViewFeatureMethod` | `CygnusPlatformWebViewFeatureMethod` | 僅加前綴 |
| `PrewarmingToken` | `CygnusPrewarmingToken` | 僅加前綴 |
| `PrintJobAttributes` | `CygnusPrintJobAttributes` | 僅加前綴 |
| `PrintJobColorMode` | `CygnusPrintJobColorMode` | 僅加前綴 |
| `PrintJobCompletionHandler` | `CygnusPrintJobCompletionHandler` | 僅加前綴 |
| `PrintJobController` | `CygnusPrintJobController` | 僅加前綴 |
| `PrintJobDialogKind` | `CygnusPrintJobDialogKind` | 僅加前綴 |
| `PrintJobDisposition` | `CygnusPrintJobDisposition` | 僅加前綴 |
| `PrintJobDuplexMode` | `CygnusPrintJobDuplexMode` | 僅加前綴 |
| `PrintJobInfo` | `CygnusPrintJobInfo` | 僅加前綴 |
| `PrintJobMediaSize` | `CygnusPrintJobMediaSize` | 僅加前綴 |
| `PrintJobOrientation` | `CygnusPrintJobOrientation` | 僅加前綴 |
| `PrintJobOutputType` | `CygnusPrintJobOutputType` | 僅加前綴 |
| `PrintJobPageOrder` | `CygnusPrintJobPageOrder` | 僅加前綴 |
| `PrintJobPaginationMode` | `CygnusPrintJobPaginationMode` | 僅加前綴 |
| `PrintJobRenderingQuality` | `CygnusPrintJobRenderingQuality` | 僅加前綴 |
| `PrintJobResolution` | `CygnusPrintJobResolution` | 僅加前綴 |
| `PrintJobSettings` | `CygnusPrintJobSettings` | 僅加前綴 |
| `PrintJobSettingsProperty` | `CygnusPrintJobSettingsProperty` | 僅加前綴 |
| `PrintJobState` | `CygnusPrintJobState` | 僅加前綴 |
| `Printer` | `CygnusPrinter` | 僅加前綴 |
| `ProcessFailedDetail` | `CygnusProcessFailedDetail` | 僅加前綴 |
| `ProcessFailedKind` | `CygnusProcessFailedKind` | 僅加前綴 |
| `ProcessFailedReason` | `CygnusProcessFailedReason` | 僅加前綴 |
| `ProcessGlobalConfig` | `CygnusProcessGlobalConfig` | 僅加前綴 |
| `ProcessGlobalConfigDirectoryBasePaths` | `CygnusProcessGlobalConfigDirectoryBasePaths` | 僅加前綴 |
| `ProcessGlobalConfigSettings` | `CygnusProcessGlobalConfigSettings` | 僅加前綴 |
| `ProcessGlobalConfigSettingsProperty` | `CygnusProcessGlobalConfigSettingsProperty` | 僅加前綴 |
| `ProxyController` | `CygnusProxyController` | 僅加前綴 |
| `ProxyRelayHop` | `CygnusProxyRelayHop` | 僅加前綴 |
| `ProxyRule` | `CygnusProxyRule` | 僅加前綴 |
| `ProxySchemeFilter` | `CygnusProxySchemeFilter` | 僅加前綴 |
| `ProxySettings` | `CygnusProxySettings` | 僅加前綴 |
| `ProxySettingsProperty` | `CygnusProxySettingsProperty` | 僅加前綴 |
| `PullToRefreshController` | `CygnusPullToRefreshController` | 僅加前綴 |
| `PullToRefreshOptions` | `CygnusPullToRefreshOptions` | 僅加前綴 |
| `PullToRefreshSettings` | `CygnusPullToRefreshSettings` | 僅加前綴 |
| `PullToRefreshSettingsProperty` | `CygnusPullToRefreshSettingsProperty` | 僅加前綴 |
| `PullToRefreshSize` | `CygnusPullToRefreshSize` | 僅加前綴 |
| `ReferrerPolicy` | `CygnusReferrerPolicy` | 僅加前綴 |
| `RenderProcessGoneDetail` | `CygnusRenderProcessGoneDetail` | 僅加前綴 |
| `RendererPriority` | `CygnusRendererPriority` | 僅加前綴 |
| `RendererPriorityPolicy` | `CygnusRendererPriorityPolicy` | 僅加前綴 |
| `RequestFocusNodeHrefResult` | `CygnusRequestFocusNodeHrefResult` | 僅加前綴 |
| `RequestImageRefResult` | `CygnusRequestImageRefResult` | 僅加前綴 |
| `ResourcesPathHandler` | `CygnusResourcesPathHandler` | 僅加前綴 |
| `SafeBrowsingResponse` | `CygnusSafeBrowsingResponse` | 僅加前綴 |
| `SafeBrowsingResponseAction` | `CygnusSafeBrowsingResponseAction` | 僅加前綴 |
| `SafeBrowsingThreat` | `CygnusSafeBrowsingThreat` | 僅加前綴 |
| `Sandbox` | `CygnusSandbox` | 僅加前綴 |
| `SaveAsKind` | `CygnusSaveAsKind` | 僅加前綴 |
| `SaveAsUIResult` | `CygnusSaveAsUIResult` | 僅加前綴 |
| `SaveAsUIShowingRequest` | `CygnusSaveAsUIShowingRequest` | 僅加前綴 |
| `SaveAsUIShowingResponse` | `CygnusSaveAsUIShowingResponse` | 僅加前綴 |
| `SaveFileSecurityCheckStartingRequest` | `CygnusSaveFileSecurityCheckStartingRequest` | 僅加前綴 |
| `SaveFileSecurityCheckStartingResponse` | `CygnusSaveFileSecurityCheckStartingResponse` | 僅加前綴 |
| `ScreenCaptureStartingRequest` | `CygnusScreenCaptureStartingRequest` | 僅加前綴 |
| `ScreenCaptureStartingResponse` | `CygnusScreenCaptureStartingResponse` | 僅加前綴 |
| `ScreenshotConfiguration` | `CygnusScreenshotConfiguration` | 僅加前綴 |
| `ScriptHtmlTagAttributes` | `CygnusScriptHtmlTagAttributes` | 僅加前綴 |
| `ScrollBarStyle` | `CygnusScrollBarStyle` | 僅加前綴 |
| `ScrollViewContentInsetAdjustmentBehavior` | `CygnusScrollViewContentInsetAdjustmentBehavior` | 僅加前綴 |
| `ScrollViewDecelerationRate` | `CygnusScrollViewDecelerationRate` | 僅加前綴 |
| `SearchResultDisplayStyle` | `CygnusSearchResultDisplayStyle` | 僅加前綴 |
| `SecurityOrigin` | `CygnusSecurityOrigin` | 僅加前綴 |
| `SelectionGranularity` | `CygnusSelectionGranularity` | 僅加前綴 |
| `ServerTrustAuthResponse` | `CygnusServerTrustAuthResponse` | 僅加前綴 |
| `ServerTrustAuthResponseAction` | `CygnusServerTrustAuthResponseAction` | 僅加前綴 |
| `ServerTrustChallenge` | `CygnusServerTrustChallenge` | 僅加前綴 |
| `ServiceWorkerClient` | `CygnusServiceWorkerClient` | 僅加前綴 |
| `ServiceWorkerClientProperty` | `CygnusServiceWorkerClientProperty` | 僅加前綴 |
| `ServiceWorkerController` | `CygnusServiceWorkerController` | 僅加前綴 |
| `SessionStorage` | `CygnusSessionStorage` | 僅加前綴 |
| `ShouldAllowDeprecatedTLSAction` | `CygnusShouldAllowDeprecatedTLSAction` | 僅加前綴 |
| `ShowFileChooserRequest` | `CygnusShowFileChooserRequest` | 僅加前綴 |
| `ShowFileChooserRequestMode` | `CygnusShowFileChooserRequestMode` | 僅加前綴 |
| `ShowFileChooserResponse` | `CygnusShowFileChooserResponse` | 僅加前綴 |
| `SslCertificate` | `CygnusSslCertificate` | 僅加前綴 |
| `SslCertificateDName` | `CygnusSslCertificateDName` | 僅加前綴 |
| `SslError` | `CygnusSslError` | 僅加前綴 |
| `SslErrorType` | `CygnusSslErrorType` | 僅加前綴 |
| `Storage` | `CygnusStorage` | 僅加前綴 |
| `SubjectKeyIdentifierExtension` | `CygnusSubjectKeyIdentifierExtension` | 僅加前綴 |
| `TextDirectionKind` | `CygnusTextDirectionKind` | 僅加前綴 |
| `TracingCategory` | `CygnusTracingCategory` | 僅加前綴 |
| `TracingController` | `CygnusTracingController` | 僅加前綴 |
| `TracingMode` | `CygnusTracingMode` | 僅加前綴 |
| `TracingSettings` | `CygnusTracingSettings` | 僅加前綴 |
| `TracingSettingsProperty` | `CygnusTracingSettingsProperty` | 僅加前綴 |
| `TrustedWebActivityDefaultDisplayMode` | `CygnusTrustedWebActivityDefaultDisplayMode` | 僅加前綴 |
| `TrustedWebActivityDisplayMode` | `CygnusTrustedWebActivityDisplayMode` | 僅加前綴 |
| `TrustedWebActivityImmersiveDisplayMode` | `CygnusTrustedWebActivityImmersiveDisplayMode` | 僅加前綴 |
| `TrustedWebActivityScreenOrientation` | `CygnusTrustedWebActivityScreenOrientation` | 僅加前綴 |
| `UIEventAttribution` | `CygnusUIEventAttribution` | 僅加前綴 |
| `UIImage` | `CygnusUIImage` | 僅加前綴 |
| `URLAuthenticationChallenge` | `CygnusURLAuthenticationChallenge` | 僅加前綴 |
| `URLCredential` | `CygnusURLCredential` | 僅加前綴 |
| `URLCredentialPersistence` | `CygnusURLCredentialPersistence` | 僅加前綴 |
| `URLProtectionSpace` | `CygnusURLProtectionSpace` | 僅加前綴 |
| `URLProtectionSpaceAuthenticationMethod` | `CygnusURLProtectionSpaceAuthenticationMethod` | 僅加前綴 |
| `URLProtectionSpaceHttpAuthCredentials` | `CygnusURLProtectionSpaceHttpAuthCredentials` | 僅加前綴 |
| `URLProtectionSpaceProxyType` | `CygnusURLProtectionSpaceProxyType` | 僅加前綴 |
| `URLRequest` | `CygnusURLRequest` | 僅加前綴 |
| `URLRequestAttribution` | `CygnusURLRequestAttribution` | 僅加前綴 |
| `URLRequestCachePolicy` | `CygnusURLRequestCachePolicy` | 僅加前綴 |
| `URLRequestNetworkServiceType` | `CygnusURLRequestNetworkServiceType` | 僅加前綴 |
| `URLResponse` | `CygnusURLResponse` | 僅加前綴 |
| `UnderlineStyle` | `CygnusUnderlineStyle` | 僅加前綴 |
| `UserPreferredContentMode` | `CygnusUserPreferredContentMode` | 僅加前綴 |
| `UserScript` | `CygnusUserScript` | 僅加前綴 |
| `UserScriptInjectionTime` | `CygnusUserScriptInjectionTime` | 僅加前綴 |
| `VerticalScrollbarPosition` | `CygnusVerticalScrollbarPosition` | 僅加前綴 |
| `WebArchiveFormat` | `CygnusWebArchiveFormat` | 僅加前綴 |
| `WebAuthenticationSession` | `CygnusWebAuthenticationSession` | 僅加前綴 |
| `WebAuthenticationSessionCompletionHandler` | `CygnusWebAuthenticationSessionCompletionHandler` | 僅加前綴 |
| `WebAuthenticationSessionError` | `CygnusWebAuthenticationSessionError` | 僅加前綴 |
| `WebAuthenticationSessionSettings` | `CygnusWebAuthenticationSessionSettings` | 僅加前綴 |
| `WebAuthenticationSessionSettingsProperty` | `CygnusWebAuthenticationSessionSettingsProperty` | 僅加前綴 |
| `WebHistory` | `CygnusWebHistory` | 僅加前綴 |
| `WebHistoryItem` | `CygnusWebHistoryItem` | 僅加前綴 |
| `WebMessage` | `CygnusWebMessage` | 僅加前綴 |
| `WebMessageCallback` | `CygnusWebMessageCallback` | 僅加前綴 |
| `WebMessageChannel` | `CygnusWebMessageChannel` | 僅加前綴 |
| `WebMessageListener` | `CygnusWebMessageListener` | 僅加前綴 |
| `WebMessagePort` | `CygnusWebMessagePort` | 僅加前綴 |
| `WebMessageType` | `CygnusWebMessageType` | 僅加前綴 |
| `WebNotification` | `CygnusWebNotification` | 僅加前綴 |
| `WebNotificationCloseHandler` | `CygnusWebNotificationCloseHandler` | 僅加前綴 |
| `WebNotificationController` | `CygnusWebNotificationController` | 僅加前綴 |
| `WebResourceContext` | `CygnusWebResourceContext` | 僅加前綴 |
| `WebResourceError` | `CygnusWebResourceError` | 僅加前綴 |
| `WebResourceErrorType` | `CygnusWebResourceErrorType` | 僅加前綴 |
| `WebResourceRequest` | `CygnusWebResourceRequest` | 僅加前綴 |
| `WebResourceRequestSourceKind` | `CygnusWebResourceRequestSourceKind` | 僅加前綴 |
| `WebResourceResponse` | `CygnusWebResourceResponse` | 僅加前綴 |
| `WebStorage` | `CygnusWebStorage` | 僅加前綴 |
| `WebStorageItem` | `CygnusWebStorageItem` | 僅加前綴 |
| `WebStorageManager` | `CygnusWebStorageManager` | 僅加前綴 |
| `WebStorageOrigin` | `CygnusWebStorageOrigin` | 僅加前綴 |
| `WebStorageType` | `CygnusWebStorageType` | 僅加前綴 |
| `WebUri` | `CygnusWebUri` | 僅加前綴 |
| `WebViewAssetLoader` | `CygnusWebViewAssetLoader` | 僅加前綴 |
| `WebViewEnvironment` | `CygnusWebViewEnvironment` | 僅加前綴 |
| `WebViewEnvironmentSettings` | `CygnusWebViewEnvironmentSettings` | 僅加前綴 |
| `WebViewEnvironmentSettingsProperty` | `CygnusWebViewEnvironmentSettingsProperty` | 僅加前綴 |
| `WebViewFeature` | `CygnusWebViewFeature` | 僅加前綴 |
| `WebViewInterface` | `CygnusWebViewInterface` | 僅加前綴 |
| `WebViewOptions` | `CygnusWebViewOptions` | 僅加前綴 |
| `WebViewPackageInfo` | `CygnusWebViewPackageInfo` | 僅加前綴 |
| `WebViewRenderProcessAction` | `CygnusWebViewRenderProcessAction` | 僅加前綴 |
| `WebsiteDataRecord` | `CygnusWebsiteDataRecord` | 僅加前綴 |
| `WebsiteDataType` | `CygnusWebsiteDataType` | 僅加前綴 |
| `WindowFeatures` | `CygnusWindowFeatures` | 僅加前綴 |
| `WindowStyleMask` | `CygnusWindowStyleMask` | 僅加前綴 |
| `WindowTitlebarSeparatorStyle` | `CygnusWindowTitlebarSeparatorStyle` | 僅加前綴 |
| `WindowType` | `CygnusWindowType` | 僅加前綴 |
| `X509BlockPosition` | `CygnusX509BlockPosition` | 僅加前綴 |
| `X509Certificate` | `CygnusX509Certificate` | 僅加前綴 |
| `X509Extension` | `CygnusX509Extension` | 僅加前綴 |
| `X509PublicKey` | `CygnusX509PublicKey` | 僅加前綴 |

## 小寫識別字（43）

| 舊名 | 新名 |
|---|---|
| `_androidHeadlessInAppWebView` | `_androidHeadlessWebView` |
| `_getHeadlessInAppWebViewDefinition` | `_getHeadlessWebViewDefinition` |
| `_getInAppBrowserDefinition` | `_getBrowserDefinition` |
| `_getInAppWebViewControllerDefinition` | `_getWebViewControllerDefinition` |
| `_getInAppWebViewEventsDefinition` | `_getWebViewEventsDefinition` |
| `_inAppBrowser` | `_browser` |
| `_inAppBrowserEventHandler` | `_browserEventHandler` |
| `_iosHeadlessInAppWebView` | `_iosHeadlessWebView` |
| `_macosHeadlessInAppWebView` | `_macosHeadlessWebView` |
| `_windowsHeadlessInAppWebView` | `_windowsHeadlessWebView` |
| `buildInAppWebView` | `buildWebView` |
| `convertToInAppWebView` | `convertToWebView` |
| `createPlatformHeadlessInAppWebView` | `createPlatformHeadlessWebView` |
| `createPlatformHeadlessInAppWebViewStatic` | `createPlatformHeadlessWebViewStatic` |
| `createPlatformInAppBrowser` | `createPlatformBrowser` |
| `createPlatformInAppBrowserStatic` | `createPlatformBrowserStatic` |
| `createPlatformInAppLocalhostServer` | `createPlatformLocalhostServer` |
| `createPlatformInAppLocalhostServerStatic` | `createPlatformLocalhostServerStatic` |
| `createPlatformInAppWebViewController` | `createPlatformWebViewController` |
| `createPlatformInAppWebViewControllerStatic` | `createPlatformWebViewControllerStatic` |
| `createPlatformInAppWebViewWidget` | `createPlatformWebViewWidget` |
| `createPlatformInAppWebViewWidgetStatic` | `createPlatformWebViewWidgetStatic` |
| `defaultInAppWebViewSettings` | `defaultWebViewSettings` |
| `defaultInAppWebViewSettingsMap` | `defaultWebViewSettingsMap` |
| `fromInAppBrowser` | `fromBrowser` |
| `fromPlatformHeadlessInAppWebViewCreationParams` | `fromPlatformHeadlessWebViewCreationParams` |
| `fromPlatformInAppBrowserCreationParams` | `fromPlatformBrowserCreationParams` |
| `fromPlatformInAppLocalhostServerCreationParams` | `fromPlatformLocalhostServerCreationParams` |
| `fromPlatformInAppWebViewControllerCreationParams` | `fromPlatformWebViewControllerCreationParams` |
| `fromPlatformInAppWebViewWidgetCreationParams` | `fromPlatformWebViewWidgetCreationParams` |
| `hasInAppBrowserEventHandler` | `hasBrowserEventHandler` |
| `headlessInAppWebViewStatic` | `headlessWebViewStatic` |
| `inAppBrowser` | `browser` |
| `inAppBrowserClassOptions` | `browserClassOptions` |
| `inAppBrowserStatic` | `browserStatic` |
| `inAppLocalhostServer` | `localhostServer` |
| `inAppLocalhostServerStatic` | `localhostServerStatic` |
| `inAppWebView` | `webView` |
| `inAppWebViewController` | `webViewController` |
| `inAppWebViewControllerStatic` | `webViewControllerStatic` |
| `inAppWebViewGroupOptions` | `webViewGroupOptions` |
| `inAppWebViewManager` | `webViewManager` |
| `inAppWebViewWidgetStatic` | `webViewWidgetStatic` |

## 檔案與目錄路徑（111）

| 舊路徑 | 新路徑 |
|---|---|
| `lib/src/in_app_browser/in_app_browser.dart` | `lib/src/browser/browser.dart` |
| `lib/src/in_app_browser/main.dart` | `lib/src/browser/main.dart` |
| `lib/src/in_app_localhost_server.dart` | `lib/src/localhost_server.dart` |
| `lib/src/in_app_webview/_static_channel.dart` | `lib/src/webview/_static_channel.dart` |
| `lib/src/in_app_webview/android/in_app_webview_controller.dart` | `lib/src/webview/android/webview_controller.dart` |
| `lib/src/in_app_webview/android/main.dart` | `lib/src/webview/android/main.dart` |
| `lib/src/in_app_webview/apple/in_app_webview_controller.dart` | `lib/src/webview/apple/webview_controller.dart` |
| `lib/src/in_app_webview/apple/main.dart` | `lib/src/webview/apple/main.dart` |
| `lib/src/in_app_webview/headless_in_app_webview.dart` | `lib/src/webview/headless_webview.dart` |
| `lib/src/in_app_webview/in_app_webview.dart` | `lib/src/webview/webview.dart` |
| `lib/src/in_app_webview/in_app_webview_controller.dart` | `lib/src/webview/webview_controller.dart` |
| `lib/src/in_app_webview/main.dart` | `lib/src/webview/main.dart` |
| `lib/src/platform_interface/flutter_inappwebview_platform_interface.dart` | `lib/src/platform_interface/flutter_webview_platform_interface.dart` |
| `lib/src/platform_interface/src/in_app_browser/android/in_app_browser_options.dart` | `lib/src/platform_interface/src/browser/android/browser_options.dart` |
| `lib/src/platform_interface/src/in_app_browser/android/main.dart` | `lib/src/platform_interface/src/browser/android/main.dart` |
| `lib/src/platform_interface/src/in_app_browser/apple/in_app_browser_options.dart` | `lib/src/platform_interface/src/browser/apple/browser_options.dart` |
| `lib/src/platform_interface/src/in_app_browser/apple/main.dart` | `lib/src/platform_interface/src/browser/apple/main.dart` |
| `lib/src/platform_interface/src/in_app_browser/in_app_browser_menu_item.dart` | `lib/src/platform_interface/src/browser/browser_menu_item.dart` |
| `lib/src/platform_interface/src/in_app_browser/in_app_browser_menu_item.g.dart` | `lib/src/platform_interface/src/browser/browser_menu_item.g.dart` |
| `lib/src/platform_interface/src/in_app_browser/in_app_browser_settings.dart` | `lib/src/platform_interface/src/browser/browser_settings.dart` |
| `lib/src/platform_interface/src/in_app_browser/in_app_browser_settings.g.dart` | `lib/src/platform_interface/src/browser/browser_settings.g.dart` |
| `lib/src/platform_interface/src/in_app_browser/main.dart` | `lib/src/platform_interface/src/browser/main.dart` |
| `lib/src/platform_interface/src/in_app_browser/platform_in_app_browser.dart` | `lib/src/platform_interface/src/browser/platform_browser.dart` |
| `lib/src/platform_interface/src/in_app_browser/platform_in_app_browser.g.dart` | `lib/src/platform_interface/src/browser/platform_browser.g.dart` |
| `lib/src/platform_interface/src/in_app_localhost_server.dart` | `lib/src/platform_interface/src/localhost_server.dart` |
| `lib/src/platform_interface/src/in_app_webview/android/in_app_webview_options.dart` | `lib/src/platform_interface/src/webview/android/webview_options.dart` |
| `lib/src/platform_interface/src/in_app_webview/android/main.dart` | `lib/src/platform_interface/src/webview/android/main.dart` |
| `lib/src/platform_interface/src/in_app_webview/apple/in_app_webview_options.dart` | `lib/src/platform_interface/src/webview/apple/webview_options.dart` |
| `lib/src/platform_interface/src/in_app_webview/apple/main.dart` | `lib/src/platform_interface/src/webview/apple/main.dart` |
| `lib/src/platform_interface/src/in_app_webview/in_app_webview_keep_alive.dart` | `lib/src/platform_interface/src/webview/webview_keep_alive.dart` |
| `lib/src/platform_interface/src/in_app_webview/in_app_webview_settings.dart` | `lib/src/platform_interface/src/webview/webview_settings.dart` |
| `lib/src/platform_interface/src/in_app_webview/in_app_webview_settings.g.dart` | `lib/src/platform_interface/src/webview/webview_settings.g.dart` |
| `lib/src/platform_interface/src/in_app_webview/main.dart` | `lib/src/platform_interface/src/webview/main.dart` |
| `lib/src/platform_interface/src/in_app_webview/platform_headless_in_app_webview.dart` | `lib/src/platform_interface/src/webview/platform_headless_webview.dart` |
| `lib/src/platform_interface/src/in_app_webview/platform_headless_in_app_webview.g.dart` | `lib/src/platform_interface/src/webview/platform_headless_webview.g.dart` |
| `lib/src/platform_interface/src/in_app_webview/platform_inappwebview_controller.dart` | `lib/src/platform_interface/src/webview/platform_webview_controller.dart` |
| `lib/src/platform_interface/src/in_app_webview/platform_inappwebview_controller.g.dart` | `lib/src/platform_interface/src/webview/platform_webview_controller.g.dart` |
| `lib/src/platform_interface/src/in_app_webview/platform_inappwebview_widget.dart` | `lib/src/platform_interface/src/webview/platform_webview_widget.dart` |
| `lib/src/platform_interface/src/in_app_webview/platform_inappwebview_widget.g.dart` | `lib/src/platform_interface/src/webview/platform_webview_widget.g.dart` |
| `lib/src/platform_interface/src/in_app_webview/platform_webview.dart` | `lib/src/platform_interface/src/webview/platform_webview.dart` |
| `lib/src/platform_interface/src/in_app_webview/platform_webview.g.dart` | `lib/src/platform_interface/src/webview/platform_webview.g.dart` |
| `lib/src/platform_interface/src/inappwebview_platform.dart` | `lib/src/platform_interface/src/webview_platform.dart` |
| `lib/src/platform_interface/src/platform_in_app_localhost_server.dart` | `lib/src/platform_interface/src/platform_localhost_server.dart` |
| `lib/src/platform_interface/src/platform_in_app_localhost_server.g.dart` | `lib/src/platform_interface/src/platform_localhost_server.g.dart` |
| `lib/src/platform_interface/src/types/in_app_webview_hit_test_result.dart` | `lib/src/platform_interface/src/types/webview_hit_test_result.dart` |
| `lib/src/platform_interface/src/types/in_app_webview_hit_test_result.g.dart` | `lib/src/platform_interface/src/types/webview_hit_test_result.g.dart` |
| `lib/src/platform_interface/src/types/in_app_webview_hit_test_result_type.dart` | `lib/src/platform_interface/src/types/webview_hit_test_result_type.dart` |
| `lib/src/platform_interface/src/types/in_app_webview_hit_test_result_type.g.dart` | `lib/src/platform_interface/src/types/webview_hit_test_result_type.g.dart` |
| `lib/src/platform_interface/src/types/in_app_webview_initial_data.dart` | `lib/src/platform_interface/src/types/webview_initial_data.dart` |
| `lib/src/platform_interface/src/types/in_app_webview_initial_data.g.dart` | `lib/src/platform_interface/src/types/webview_initial_data.g.dart` |
| `lib/src/platform_interface/src/types/in_app_webview_rect.dart` | `lib/src/platform_interface/src/types/webview_rect.dart` |
| `lib/src/platform_interface/src/types/in_app_webview_rect.g.dart` | `lib/src/platform_interface/src/types/webview_rect.g.dart` |
| `lib/src/platforms/android/flutter_inappwebview_android.dart` | `lib/src/platforms/android/flutter_webview_android.dart` |
| `lib/src/platforms/android/src/in_app_browser/in_app_browser.dart` | `lib/src/platforms/android/src/browser/browser.dart` |
| `lib/src/platforms/android/src/in_app_browser/main.dart` | `lib/src/platforms/android/src/browser/main.dart` |
| `lib/src/platforms/android/src/in_app_webview/_static_channel.dart` | `lib/src/platforms/android/src/webview/_static_channel.dart` |
| `lib/src/platforms/android/src/in_app_webview/headless_in_app_webview.dart` | `lib/src/platforms/android/src/webview/headless_webview.dart` |
| `lib/src/platforms/android/src/in_app_webview/in_app_webview.dart` | `lib/src/platforms/android/src/webview/webview.dart` |
| `lib/src/platforms/android/src/in_app_webview/in_app_webview_controller.dart` | `lib/src/platforms/android/src/webview/webview_controller.dart` |
| `lib/src/platforms/android/src/in_app_webview/main.dart` | `lib/src/platforms/android/src/webview/main.dart` |
| `lib/src/platforms/android/src/inappwebview_platform.dart` | `lib/src/platforms/android/src/webview_platform.dart` |
| `lib/src/platforms/ios/flutter_inappwebview_ios.dart` | `lib/src/platforms/ios/flutter_webview_ios.dart` |
| `lib/src/platforms/ios/src/in_app_browser/in_app_browser.dart` | `lib/src/platforms/ios/src/browser/browser.dart` |
| `lib/src/platforms/ios/src/in_app_browser/main.dart` | `lib/src/platforms/ios/src/browser/main.dart` |
| `lib/src/platforms/ios/src/in_app_webview/_static_channel.dart` | `lib/src/platforms/ios/src/webview/_static_channel.dart` |
| `lib/src/platforms/ios/src/in_app_webview/headless_in_app_webview.dart` | `lib/src/platforms/ios/src/webview/headless_webview.dart` |
| `lib/src/platforms/ios/src/in_app_webview/in_app_webview.dart` | `lib/src/platforms/ios/src/webview/webview.dart` |
| `lib/src/platforms/ios/src/in_app_webview/in_app_webview_controller.dart` | `lib/src/platforms/ios/src/webview/webview_controller.dart` |
| `lib/src/platforms/ios/src/in_app_webview/main.dart` | `lib/src/platforms/ios/src/webview/main.dart` |
| `lib/src/platforms/ios/src/inappwebview_platform.dart` | `lib/src/platforms/ios/src/webview_platform.dart` |
| `lib/src/platforms/linux/flutter_inappwebview_linux.dart` | `lib/src/platforms/linux/flutter_webview_linux.dart` |
| `lib/src/platforms/linux/src/in_app_browser/in_app_browser.dart` | `lib/src/platforms/linux/src/browser/browser.dart` |
| `lib/src/platforms/linux/src/in_app_browser/main.dart` | `lib/src/platforms/linux/src/browser/main.dart` |
| `lib/src/platforms/linux/src/in_app_webview/_static_channel.dart` | `lib/src/platforms/linux/src/webview/_static_channel.dart` |
| `lib/src/platforms/linux/src/in_app_webview/custom_platform_view.dart` | `lib/src/platforms/linux/src/webview/custom_platform_view.dart` |
| `lib/src/platforms/linux/src/in_app_webview/headless_in_app_webview.dart` | `lib/src/platforms/linux/src/webview/headless_webview.dart` |
| `lib/src/platforms/linux/src/in_app_webview/in_app_webview.dart` | `lib/src/platforms/linux/src/webview/webview.dart` |
| `lib/src/platforms/linux/src/in_app_webview/in_app_webview_controller.dart` | `lib/src/platforms/linux/src/webview/webview_controller.dart` |
| `lib/src/platforms/linux/src/in_app_webview/key_mappings.dart` | `lib/src/platforms/linux/src/webview/key_mappings.dart` |
| `lib/src/platforms/linux/src/in_app_webview/main.dart` | `lib/src/platforms/linux/src/webview/main.dart` |
| `lib/src/platforms/linux/src/inappwebview_platform.dart` | `lib/src/platforms/linux/src/webview_platform.dart` |
| `lib/src/platforms/macos/flutter_inappwebview_macos.dart` | `lib/src/platforms/macos/flutter_webview_macos.dart` |
| `lib/src/platforms/macos/src/in_app_browser/in_app_browser.dart` | `lib/src/platforms/macos/src/browser/browser.dart` |
| `lib/src/platforms/macos/src/in_app_browser/main.dart` | `lib/src/platforms/macos/src/browser/main.dart` |
| `lib/src/platforms/macos/src/in_app_webview/_static_channel.dart` | `lib/src/platforms/macos/src/webview/_static_channel.dart` |
| `lib/src/platforms/macos/src/in_app_webview/headless_in_app_webview.dart` | `lib/src/platforms/macos/src/webview/headless_webview.dart` |
| `lib/src/platforms/macos/src/in_app_webview/in_app_webview.dart` | `lib/src/platforms/macos/src/webview/webview.dart` |
| `lib/src/platforms/macos/src/in_app_webview/in_app_webview_controller.dart` | `lib/src/platforms/macos/src/webview/webview_controller.dart` |
| `lib/src/platforms/macos/src/in_app_webview/main.dart` | `lib/src/platforms/macos/src/webview/main.dart` |
| `lib/src/platforms/macos/src/inappwebview_platform.dart` | `lib/src/platforms/macos/src/webview_platform.dart` |
| `lib/src/platforms/web/flutter_inappwebview_web.dart` | `lib/src/platforms/web/flutter_webview_web.dart` |
| `lib/src/platforms/web/src/in_app_webview/_static_channel.dart` | `lib/src/platforms/web/src/webview/_static_channel.dart` |
| `lib/src/platforms/web/src/in_app_webview/headless_in_app_webview.dart` | `lib/src/platforms/web/src/webview/headless_webview.dart` |
| `lib/src/platforms/web/src/in_app_webview/in_app_webview.dart` | `lib/src/platforms/web/src/webview/webview.dart` |
| `lib/src/platforms/web/src/in_app_webview/in_app_webview_controller.dart` | `lib/src/platforms/web/src/webview/webview_controller.dart` |
| `lib/src/platforms/web/src/in_app_webview/main.dart` | `lib/src/platforms/web/src/webview/main.dart` |
| `lib/src/platforms/web/src/inappwebview_platform.dart` | `lib/src/platforms/web/src/webview_platform.dart` |
| `lib/src/platforms/web/web/headless_in_app_web_view_web_element.dart` | `lib/src/platforms/web/web/headless_web_view_web_element.dart` |
| `lib/src/platforms/web/web/headless_inappwebview_manager.dart` | `lib/src/platforms/web/web/headless_webview_manager.dart` |
| `lib/src/platforms/web/web/in_app_web_view_web_element.dart` | `lib/src/platforms/web/web/web_view_web_element.dart` |
| `lib/src/platforms/web/web/in_app_webview_manager.dart` | `lib/src/platforms/web/web/webview_manager.dart` |
| `lib/src/platforms/windows/flutter_inappwebview_windows.dart` | `lib/src/platforms/windows/flutter_webview_windows.dart` |
| `lib/src/platforms/windows/src/in_app_browser/in_app_browser.dart` | `lib/src/platforms/windows/src/browser/browser.dart` |
| `lib/src/platforms/windows/src/in_app_browser/main.dart` | `lib/src/platforms/windows/src/browser/main.dart` |
| `lib/src/platforms/windows/src/in_app_webview/_static_channel.dart` | `lib/src/platforms/windows/src/webview/_static_channel.dart` |
| `lib/src/platforms/windows/src/in_app_webview/custom_platform_view.dart` | `lib/src/platforms/windows/src/webview/custom_platform_view.dart` |
| `lib/src/platforms/windows/src/in_app_webview/headless_in_app_webview.dart` | `lib/src/platforms/windows/src/webview/headless_webview.dart` |
| `lib/src/platforms/windows/src/in_app_webview/in_app_webview.dart` | `lib/src/platforms/windows/src/webview/webview.dart` |
| `lib/src/platforms/windows/src/in_app_webview/in_app_webview_controller.dart` | `lib/src/platforms/windows/src/webview/webview_controller.dart` |
| `lib/src/platforms/windows/src/in_app_webview/main.dart` | `lib/src/platforms/windows/src/webview/main.dart` |
| `lib/src/platforms/windows/src/inappwebview_platform.dart` | `lib/src/platforms/windows/src/webview_platform.dart` |
