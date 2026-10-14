import 'package:flutter/foundation.dart';
import 'package:cygnus_core/cygnus_core.dart';
import 'package:flutter_test/flutter_test.dart';

import '../util.dart';

void main() {
  skippableGroup('Support methods', () {
    skippableTest('CygnusWebMessageChannel support methods are callable', () {
      expect(
        () =>
            CygnusWebMessageChannel.isClassSupported(platform: defaultTargetPlatform),
        returnsNormally,
      );
      expect(
        () => CygnusWebMessageChannel.isMethodSupported(
          CygnusPlatformWebMessageChannelMethod.values.first,
          platform: defaultTargetPlatform,
        ),
        returnsNormally,
      );
      expect(
        () => CygnusWebMessageChannel.isPropertySupported(
          CygnusPlatformWebMessageChannelCreationParamsProperty.values.first,
          platform: defaultTargetPlatform,
        ),
        returnsNormally,
      );
    });

    skippableTest('CygnusWebMessageListener support methods are callable', () {
      expect(
        () => CygnusWebMessageListener.isClassSupported(
          platform: defaultTargetPlatform,
        ),
        returnsNormally,
      );
      expect(
        () => CygnusWebMessageListener.isMethodSupported(
          CygnusPlatformWebMessageListenerMethod.values.first,
          platform: defaultTargetPlatform,
        ),
        returnsNormally,
      );
      expect(
        () => CygnusWebMessageListener.isPropertySupported(
          CygnusPlatformWebMessageListenerCreationParamsProperty.values.first,
          platform: defaultTargetPlatform,
        ),
        returnsNormally,
      );
    });

    skippableTest('CygnusWebViewEnvironment support methods are callable', () {
      expect(
        () => CygnusWebViewEnvironment.isClassSupported(
          platform: defaultTargetPlatform,
        ),
        returnsNormally,
      );
      expect(
        () => CygnusWebViewEnvironment.isMethodSupported(
          CygnusPlatformWebViewEnvironmentMethod.values.first,
          platform: defaultTargetPlatform,
        ),
        returnsNormally,
      );
      expect(
        () => CygnusWebViewEnvironment.isPropertySupported(
          CygnusPlatformWebViewEnvironmentCreationParamsProperty.values.first,
          platform: defaultTargetPlatform,
        ),
        returnsNormally,
      );
    });

    skippableTest('CygnusHeadlessWebView support methods are callable', () {
      expect(
        () => CygnusHeadlessWebView.isClassSupported(
          platform: defaultTargetPlatform,
        ),
        returnsNormally,
      );
      expect(
        () => CygnusHeadlessWebView.isMethodSupported(
          CygnusPlatformHeadlessWebViewMethod.values.first,
          platform: defaultTargetPlatform,
        ),
        returnsNormally,
      );
      expect(
        () => CygnusHeadlessWebView.isPropertySupported(
          CygnusPlatformHeadlessWebViewCreationParamsProperty.values.first,
          platform: defaultTargetPlatform,
        ),
        returnsNormally,
      );
    });

    skippableTest('CygnusWebStorage support methods are callable', () {
      expect(
        () => CygnusWebStorage.isClassSupported(platform: defaultTargetPlatform),
        returnsNormally,
      );
      expect(
        () => CygnusWebStorage.isMethodSupported(
          CygnusPlatformWebStorageMethod.values.first,
          platform: defaultTargetPlatform,
        ),
        returnsNormally,
      );
      expect(
        () => CygnusWebStorage.isPropertySupported(
          CygnusPlatformWebStorageCreationParamsProperty.values.first,
          platform: defaultTargetPlatform,
        ),
        returnsNormally,
      );
      expect(
        () => CygnusWebStorage.isPropertySupported(
          CygnusPlatformWebStorageProperty.values.first,
          platform: defaultTargetPlatform,
        ),
        returnsNormally,
      );
    });

    skippableTest('CygnusLocalStorage support methods are callable', () {
      expect(
        () => CygnusLocalStorage.isClassSupported(platform: defaultTargetPlatform),
        returnsNormally,
      );
      expect(
        () => CygnusLocalStorage.isMethodSupported(
          CygnusPlatformLocalStorageMethod.values.first,
          platform: defaultTargetPlatform,
        ),
        returnsNormally,
      );
      expect(
        () => CygnusLocalStorage.isPropertySupported(
          CygnusPlatformStorageCreationParamsProperty.values.first,
          platform: defaultTargetPlatform,
        ),
        returnsNormally,
      );
    });

    skippableTest('CygnusSessionStorage support methods are callable', () {
      expect(
        () => CygnusSessionStorage.isClassSupported(platform: defaultTargetPlatform),
        returnsNormally,
      );
      expect(
        () => CygnusSessionStorage.isMethodSupported(
          CygnusPlatformSessionStorageMethod.values.first,
          platform: defaultTargetPlatform,
        ),
        returnsNormally,
      );
      expect(
        () => CygnusSessionStorage.isPropertySupported(
          CygnusPlatformStorageCreationParamsProperty.values.first,
          platform: defaultTargetPlatform,
        ),
        returnsNormally,
      );
    });

    skippableTest('CygnusWebStorageManager support methods are callable', () {
      expect(
        () =>
            CygnusWebStorageManager.isClassSupported(platform: defaultTargetPlatform),
        returnsNormally,
      );
      expect(
        () => CygnusWebStorageManager.isMethodSupported(
          CygnusPlatformWebStorageManagerMethod.values.first,
          platform: defaultTargetPlatform,
        ),
        returnsNormally,
      );
    });

    skippableTest('CygnusPullToRefreshController support methods are callable', () {
      expect(
        () => CygnusPullToRefreshController.isClassSupported(
          platform: defaultTargetPlatform,
        ),
        returnsNormally,
      );
      expect(
        () => CygnusPullToRefreshController.isMethodSupported(
          CygnusPlatformPullToRefreshControllerMethod.values.first,
          platform: defaultTargetPlatform,
        ),
        returnsNormally,
      );
      expect(
        () => CygnusPullToRefreshController.isPropertySupported(
          CygnusPlatformPullToRefreshControllerCreationParamsProperty.values.first,
          platform: defaultTargetPlatform,
        ),
        returnsNormally,
      );
    });

    skippableTest('CygnusWebView support methods are callable', () {
      expect(
        () => CygnusWebView.isClassSupported(platform: defaultTargetPlatform),
        returnsNormally,
      );
      expect(
        () => CygnusWebView.isPropertySupported(
          CygnusPlatformWebViewWidgetCreationParamsProperty.values.first,
          platform: defaultTargetPlatform,
        ),
        returnsNormally,
      );
    });

    skippableTest('CygnusWebViewSettings support methods are callable', () {
      expect(
        () => CygnusWebViewSettings.isPropertySupported(
          CygnusWebViewSettingsProperty.values.first,
          platform: defaultTargetPlatform,
        ),
        returnsNormally,
      );
    });

    skippableTest('CygnusWebViewController support methods are callable', () {
      expect(
        () => CygnusWebViewController.isClassSupported(
          platform: defaultTargetPlatform,
        ),
        returnsNormally,
      );
      expect(
        () => CygnusWebViewController.isMethodSupported(
          CygnusPlatformWebViewControllerMethod.values.first,
          platform: defaultTargetPlatform,
        ),
        returnsNormally,
      );
      expect(
        () => CygnusWebViewController.isPropertySupported(
          CygnusPlatformWebViewControllerProperty.values.first,
          platform: defaultTargetPlatform,
        ),
        returnsNormally,
      );
    });

    skippableTest('CygnusBrowser support methods are callable', () {
      expect(
        () => CygnusBrowser.isClassSupported(platform: defaultTargetPlatform),
        returnsNormally,
      );
      expect(
        () => CygnusBrowser.isMethodSupported(
          CygnusPlatformBrowserMethod.values.first,
          platform: defaultTargetPlatform,
        ),
        returnsNormally,
      );
      expect(
        () => CygnusBrowser.isPropertySupported(
          CygnusPlatformBrowserProperty.values.first,
          platform: defaultTargetPlatform,
        ),
        returnsNormally,
      );
    });

    skippableTest('CygnusChromeSafariBrowser support methods are callable', () {
      expect(
        () => CygnusChromeSafariBrowser.isClassSupported(
          platform: defaultTargetPlatform,
        ),
        returnsNormally,
      );
      expect(
        () => CygnusChromeSafariBrowser.isMethodSupported(
          CygnusPlatformChromeSafariBrowserMethod.values.first,
          platform: defaultTargetPlatform,
        ),
        returnsNormally,
      );
    });

    skippableTest('CygnusWebAuthenticationSession support methods are callable', () {
      expect(
        () => CygnusWebAuthenticationSession.isClassSupported(
          platform: defaultTargetPlatform,
        ),
        returnsNormally,
      );
      expect(
        () => CygnusWebAuthenticationSession.isMethodSupported(
          CygnusPlatformWebAuthenticationSessionMethod.values.first,
          platform: defaultTargetPlatform,
        ),
        returnsNormally,
      );
      expect(
        () => CygnusWebAuthenticationSession.isPropertySupported(
          CygnusPlatformWebAuthenticationSessionProperty.values.first,
          platform: defaultTargetPlatform,
        ),
        returnsNormally,
      );
    });

    skippableTest('CygnusCookieManager support methods are callable', () {
      expect(
        () => CygnusCookieManager.isClassSupported(platform: defaultTargetPlatform),
        returnsNormally,
      );
      expect(
        () => CygnusCookieManager.isMethodSupported(
          CygnusPlatformCookieManagerMethod.values.first,
          platform: defaultTargetPlatform,
        ),
        returnsNormally,
      );
      expect(
        () => CygnusCookieManager.isPropertySupported(
          CygnusPlatformCookieManagerCreationParamsProperty.values.first,
          platform: defaultTargetPlatform,
        ),
        returnsNormally,
      );
    });

    skippableTest('CygnusProcessGlobalConfig support methods are callable', () {
      expect(
        () => CygnusProcessGlobalConfig.isClassSupported(
          platform: defaultTargetPlatform,
        ),
        returnsNormally,
      );
      expect(
        () => CygnusProcessGlobalConfig.isMethodSupported(
          CygnusPlatformProcessGlobalConfigMethod.values.first,
          platform: defaultTargetPlatform,
        ),
        returnsNormally,
      );
    });

    skippableTest('CygnusServiceWorkerController support methods are callable', () {
      expect(
        () => CygnusServiceWorkerController.isClassSupported(
          platform: defaultTargetPlatform,
        ),
        returnsNormally,
      );
      expect(
        () => CygnusServiceWorkerController.isMethodSupported(
          CygnusPlatformServiceWorkerControllerMethod.values.first,
          platform: defaultTargetPlatform,
        ),
        returnsNormally,
      );
    });

    skippableTest('CygnusProxyController support methods are callable', () {
      expect(
        () => CygnusProxyController.isClassSupported(platform: defaultTargetPlatform),
        returnsNormally,
      );
      expect(
        () => CygnusProxyController.isMethodSupported(
          CygnusPlatformProxyControllerMethod.values.first,
          platform: defaultTargetPlatform,
        ),
        returnsNormally,
      );
    });

    skippableTest('CygnusPrintJobController support methods are callable', () {
      expect(
        () => CygnusPrintJobController.isClassSupported(
          platform: defaultTargetPlatform,
        ),
        returnsNormally,
      );
      expect(
        () => CygnusPrintJobController.isMethodSupported(
          CygnusPlatformPrintJobControllerMethod.values.first,
          platform: defaultTargetPlatform,
        ),
        returnsNormally,
      );
      expect(
        () => CygnusPrintJobController.isPropertySupported(
          CygnusPlatformPrintJobControllerCreationParamsProperty.values.first,
          platform: defaultTargetPlatform,
        ),
        returnsNormally,
      );
      expect(
        () => CygnusPrintJobController.isPropertySupported(
          CygnusPlatformPrintJobControllerProperty.values.first,
          platform: defaultTargetPlatform,
        ),
        returnsNormally,
      );
    });

    skippableTest('CygnusTracingController support methods are callable', () {
      expect(
        () =>
            CygnusTracingController.isClassSupported(platform: defaultTargetPlatform),
        returnsNormally,
      );
      expect(
        () => CygnusTracingController.isMethodSupported(
          CygnusPlatformTracingControllerMethod.values.first,
          platform: defaultTargetPlatform,
        ),
        returnsNormally,
      );
    });

    skippableTest('CygnusFindInteractionController support methods are callable', () {
      expect(
        () => CygnusFindInteractionController.isClassSupported(
          platform: defaultTargetPlatform,
        ),
        returnsNormally,
      );
      expect(
        () => CygnusFindInteractionController.isMethodSupported(
          CygnusPlatformFindInteractionControllerMethod.values.first,
          platform: defaultTargetPlatform,
        ),
        returnsNormally,
      );
      expect(
        () => CygnusFindInteractionController.isPropertySupported(
          CygnusPlatformFindInteractionControllerCreationParamsProperty.values.first,
          platform: defaultTargetPlatform,
        ),
        returnsNormally,
      );
    });

    skippableTest(
      'CygnusHttpAuthCredentialDatabase support methods are callable',
      () {
        expect(
          () => CygnusHttpAuthCredentialDatabase.isClassSupported(
            platform: defaultTargetPlatform,
          ),
          returnsNormally,
        );
        expect(
          () => CygnusHttpAuthCredentialDatabase.isMethodSupported(
            CygnusPlatformHttpAuthCredentialDatabaseMethod.values.first,
            platform: defaultTargetPlatform,
          ),
          returnsNormally,
        );
      },
    );
  });
}
