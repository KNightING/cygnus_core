// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_window_action.dart';

// **************************************************************************
// ExchangeableObjectGenerator
// **************************************************************************

///Class that represents the navigation request used by the [CygnusPlatformWebViewCreationParams.onCreateWindow] event.
class CygnusCreateWindowAction extends CygnusNavigationAction {
  ///Use [isDialog] instead.
  @Deprecated('Use isDialog instead')
  bool? androidIsDialog;

  ///Use [windowFeatures] instead.
  @Deprecated('Use windowFeatures instead')
  CygnusIOSWKWindowFeatures? iosWindowFeatures;

  ///Indicates if the new window should be a dialog, rather than a full-size window.
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView
  bool? isDialog;

  ///Window features requested by the webpage.
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- iOS WKWebView ([Official API - WKWindowFeatures](https://developer.apple.com/documentation/webkit/wkwindowfeatures))
  ///- macOS WKWebView ([Official API - WKWindowFeatures](https://developer.apple.com/documentation/webkit/wkwindowfeatures))
  ///- Windows WebView2 ([Official API - ICoreWebView2WindowFeatures](https://learn.microsoft.com/en-us/microsoft-edge/webview2/reference/win32/icorewebview2windowfeatures?view=webview2-1.0.2210.55))
  CygnusWindowFeatures? windowFeatures;

  ///The window id. Used by `WebView` to create a new WebView.
  int windowId;
  CygnusCreateWindowAction({
    @Deprecated('Use isDialog instead') this.androidIsDialog,
    @Deprecated('Use windowFeatures instead') this.iosWindowFeatures,
    this.isDialog,
    this.windowFeatures,
    required this.windowId,
    required CygnusURLRequest request,
    required bool isForMainFrame,
    @Deprecated('Use hasGesture instead') bool? androidHasGesture,
    bool? hasGesture,
    @Deprecated('Use isRedirect instead') bool? androidIsRedirect,
    bool? isRedirect,
    @Deprecated('Use navigationType instead')
    CygnusIOSWKNavigationType? iosWKNavigationType,
    CygnusNavigationType? navigationType,
    @Deprecated('Use sourceFrame instead') CygnusIOSWKFrameInfo? iosSourceFrame,
    CygnusFrameInfo? sourceFrame,
    @Deprecated('Use targetFrame instead') CygnusIOSWKFrameInfo? iosTargetFrame,
    CygnusFrameInfo? targetFrame,
    bool? shouldPerformDownload,
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
         shouldPerformDownload: shouldPerformDownload,
       ) {
    isDialog = isDialog ?? androidIsDialog;
    windowFeatures =
        windowFeatures ??
        CygnusWindowFeatures.fromMap(iosWindowFeatures?.toMap());
  }

  ///Gets a possible [CygnusCreateWindowAction] instance from a [Map] value.
  static CygnusCreateWindowAction? fromMap(
    Map<String, dynamic>? map, {
    CygnusEnumMethod? enumMethod,
  }) {
    if (map == null) {
      return null;
    }
    final instance = CygnusCreateWindowAction(
      request: CygnusURLRequest.fromMap(
        map['request']?.cast<String, dynamic>(),
        enumMethod: enumMethod,
      )!,
      isForMainFrame: map['isForMainFrame'],
      androidIsDialog: map['isDialog'],
      iosWindowFeatures: CygnusIOSWKWindowFeatures.fromMap(
        map['windowFeatures']?.cast<String, dynamic>(),
        enumMethod: enumMethod,
      ),
      isDialog: map['isDialog'],
      windowFeatures: CygnusWindowFeatures.fromMap(
        map['windowFeatures']?.cast<String, dynamic>(),
        enumMethod: enumMethod,
      ),
      windowId: map['windowId'],
    );
    instance.androidHasGesture = map['hasGesture'];
    instance.hasGesture = map['hasGesture'];
    instance.androidIsRedirect = map['isRedirect'];
    instance.isRedirect = map['isRedirect'];
    instance.iosWKNavigationType = switch (enumMethod ??
        CygnusEnumMethod.nativeValue) {
      CygnusEnumMethod.nativeValue => CygnusIOSWKNavigationType.fromNativeValue(
        map['navigationType'],
      ),
      CygnusEnumMethod.value => CygnusIOSWKNavigationType.fromValue(
        map['navigationType'],
      ),
      CygnusEnumMethod.name => CygnusIOSWKNavigationType.byName(
        map['navigationType'],
      ),
    };
    instance.navigationType = switch (enumMethod ??
        CygnusEnumMethod.nativeValue) {
      CygnusEnumMethod.nativeValue => CygnusNavigationType.fromNativeValue(
        map['navigationType'],
      ),
      CygnusEnumMethod.value => CygnusNavigationType.fromValue(
        map['navigationType'],
      ),
      CygnusEnumMethod.name => CygnusNavigationType.byName(
        map['navigationType'],
      ),
    };
    instance.iosSourceFrame = CygnusIOSWKFrameInfo.fromMap(
      map['sourceFrame']?.cast<String, dynamic>(),
      enumMethod: enumMethod,
    );
    instance.sourceFrame = CygnusFrameInfo.fromMap(
      map['sourceFrame']?.cast<String, dynamic>(),
      enumMethod: enumMethod,
    );
    instance.iosTargetFrame = CygnusIOSWKFrameInfo.fromMap(
      map['targetFrame']?.cast<String, dynamic>(),
      enumMethod: enumMethod,
    );
    instance.targetFrame = CygnusFrameInfo.fromMap(
      map['targetFrame']?.cast<String, dynamic>(),
      enumMethod: enumMethod,
    );
    instance.shouldPerformDownload = map['shouldPerformDownload'];
    return instance;
  }

  ///Converts instance to a map.
  Map<String, dynamic> toMap({CygnusEnumMethod? enumMethod}) {
    return {
      "request": request.toMap(enumMethod: enumMethod),
      "isForMainFrame": isForMainFrame,
      "hasGesture": hasGesture,
      "isRedirect": isRedirect,
      "navigationType": switch (enumMethod ?? CygnusEnumMethod.nativeValue) {
        CygnusEnumMethod.nativeValue => navigationType?.toNativeValue(),
        CygnusEnumMethod.value => navigationType?.toValue(),
        CygnusEnumMethod.name => navigationType?.name(),
      },
      "sourceFrame": sourceFrame?.toMap(enumMethod: enumMethod),
      "targetFrame": targetFrame?.toMap(enumMethod: enumMethod),
      "shouldPerformDownload": shouldPerformDownload,
      "isDialog": isDialog,
      "windowFeatures": windowFeatures?.toMap(enumMethod: enumMethod),
      "windowId": windowId,
    };
  }

  ///Converts instance to a map.
  Map<String, dynamic> toJson() {
    return toMap();
  }

  @override
  String toString() {
    return 'CygnusCreateWindowAction{request: $request, isForMainFrame: $isForMainFrame, hasGesture: $hasGesture, isRedirect: $isRedirect, navigationType: $navigationType, sourceFrame: $sourceFrame, targetFrame: $targetFrame, shouldPerformDownload: $shouldPerformDownload, isDialog: $isDialog, windowFeatures: $windowFeatures, windowId: $windowId}';
  }
}
