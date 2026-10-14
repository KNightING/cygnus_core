import 'package:flutter_inappwebview_internal_annotations/flutter_inappwebview_internal_annotations.dart';

import 'navigation_action.dart';
import 'window_features.dart';
import 'url_request.dart';
import 'frame_info.dart';
import 'navigation_type.dart';
import '../webview/platform_webview.dart';
import 'enum_method.dart';

part 'create_window_action.g.dart';

///Class that represents the navigation request used by the [CygnusPlatformWebViewCreationParams.onCreateWindow] event.
@ExchangeableObject()
class CygnusCreateWindowAction_ extends CygnusNavigationAction_ {
  ///The window id. Used by `WebView` to create a new WebView.
  int windowId;

  ///Use [isDialog] instead.
  @Deprecated("Use isDialog instead")
  bool? androidIsDialog;

  ///Indicates if the new window should be a dialog, rather than a full-size window.
  @SupportedPlatforms(platforms: [AndroidPlatform()])
  bool? isDialog;

  ///Use [windowFeatures] instead.
  @Deprecated("Use windowFeatures instead")
  CygnusIOSWKWindowFeatures_? iosWindowFeatures;

  ///Window features requested by the webpage.
  @SupportedPlatforms(
    platforms: [
      IOSPlatform(
        apiName: "WKWindowFeatures",
        apiUrl:
            "https://developer.apple.com/documentation/webkit/wkwindowfeatures",
      ),
      MacOSPlatform(
        apiName: "WKWindowFeatures",
        apiUrl:
            "https://developer.apple.com/documentation/webkit/wkwindowfeatures",
      ),
      WindowsPlatform(
        apiName: "ICoreWebView2WindowFeatures",
        apiUrl:
            "https://learn.microsoft.com/en-us/microsoft-edge/webview2/reference/win32/icorewebview2windowfeatures?view=webview2-1.0.2210.55",
      ),
    ],
  )
  CygnusWindowFeatures_? windowFeatures;

  CygnusCreateWindowAction_({
    required this.windowId,
    @Deprecated('Use isDialog instead') this.androidIsDialog,
    this.isDialog,
    @Deprecated('Use windowFeatures instead') this.iosWindowFeatures,
    this.windowFeatures,
    required CygnusURLRequest_ request,
    required bool isForMainFrame,
    @Deprecated('Use hasGesture instead') bool? androidHasGesture,
    @Deprecated('Use isRedirect instead') bool? androidIsRedirect,
    bool? hasGesture,
    bool? isRedirect,
    @Deprecated('Use navigationType instead')
    // ignore: deprecated_member_use_from_same_package
    CygnusIOSWKNavigationType_? iosWKNavigationType,
    CygnusNavigationType_? navigationType,
    @Deprecated('Use sourceFrame instead')
    // ignore: deprecated_member_use_from_same_package
    CygnusIOSWKFrameInfo_? iosSourceFrame,
    CygnusFrameInfo_? sourceFrame,
    @Deprecated('Use targetFrame instead')
    // ignore: deprecated_member_use_from_same_package
    CygnusIOSWKFrameInfo_? iosTargetFrame,
    CygnusFrameInfo_? targetFrame,
  }) : super(
         request: request,
         isForMainFrame: isForMainFrame,
         androidHasGesture: androidHasGesture,
         hasGesture: hasGesture,
         androidIsRedirect: androidIsRedirect,
         isRedirect: isRedirect,
         iosWKNavigationType: iosWKNavigationType,
         navigationType: navigationType,
         iosSourceFrame: iosSourceFrame,
         sourceFrame: sourceFrame,
         iosTargetFrame: iosTargetFrame,
         targetFrame: targetFrame,
       );
}
