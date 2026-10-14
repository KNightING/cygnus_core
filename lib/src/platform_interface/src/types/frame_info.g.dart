// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'frame_info.dart';

// **************************************************************************
// ExchangeableObjectGenerator
// **************************************************************************

///An object that contains information about a frame on a webpage.
class CygnusFrameInfo {
  ///The unique identifier of the frame associated with the current [CygnusFrameInfo].
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Windows WebView2
  int? frameId;

  ///A Boolean value indicating whether the frame is the web site's main frame or a subframe.
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- iOS WKWebView
  ///- macOS WKWebView
  ///- Windows WebView2
  bool isMainFrame;

  ///The kind of the frame.
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Windows WebView2
  CygnusFrameKind? kind;

  ///Gets the name attribute of the frame, as in <iframe name="frame-name">...</iframe>.
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Windows WebView2
  String? name;

  ///The frame’s current request.
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- iOS WKWebView
  ///- macOS WKWebView
  ///- Windows WebView2
  CygnusURLRequest? request;

  ///The frame’s security origin.
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- iOS WKWebView
  ///- macOS WKWebView
  ///- Windows WebView2
  CygnusSecurityOrigin? securityOrigin;
  CygnusFrameInfo({
    this.frameId,
    required this.isMainFrame,
    this.kind,
    this.name,
    this.request,
    this.securityOrigin,
  });

  ///Gets a possible [CygnusFrameInfo] instance from a [Map] value.
  static CygnusFrameInfo? fromMap(
    Map<String, dynamic>? map, {
    CygnusEnumMethod? enumMethod,
  }) {
    if (map == null) {
      return null;
    }
    final instance = CygnusFrameInfo(
      frameId: map['frameId'],
      isMainFrame: map['isMainFrame'],
      kind: switch (enumMethod ?? CygnusEnumMethod.nativeValue) {
        CygnusEnumMethod.nativeValue => CygnusFrameKind.fromNativeValue(
          map['kind'],
        ),
        CygnusEnumMethod.value => CygnusFrameKind.fromValue(map['kind']),
        CygnusEnumMethod.name => CygnusFrameKind.byName(map['kind']),
      },
      name: map['name'],
      request: CygnusURLRequest.fromMap(
        map['request']?.cast<String, dynamic>(),
        enumMethod: enumMethod,
      ),
      securityOrigin: CygnusSecurityOrigin.fromMap(
        map['securityOrigin']?.cast<String, dynamic>(),
        enumMethod: enumMethod,
      ),
    );
    return instance;
  }

  ///Converts instance to a map.
  Map<String, dynamic> toMap({CygnusEnumMethod? enumMethod}) {
    return {
      "frameId": frameId,
      "isMainFrame": isMainFrame,
      "kind": switch (enumMethod ?? CygnusEnumMethod.nativeValue) {
        CygnusEnumMethod.nativeValue => kind?.toNativeValue(),
        CygnusEnumMethod.value => kind?.toValue(),
        CygnusEnumMethod.name => kind?.name(),
      },
      "name": name,
      "request": request?.toMap(enumMethod: enumMethod),
      "securityOrigin": securityOrigin?.toMap(enumMethod: enumMethod),
    };
  }

  ///Converts instance to a map.
  Map<String, dynamic> toJson() {
    return toMap();
  }

  @override
  String toString() {
    return 'CygnusFrameInfo{frameId: $frameId, isMainFrame: $isMainFrame, kind: $kind, name: $name, request: $request, securityOrigin: $securityOrigin}';
  }
}

///An object that contains information about a frame on a webpage.
///
///**NOTE**: available only on iOS.
///
///Use [CygnusFrameInfo] instead.
@Deprecated('Use CygnusFrameInfo instead')
class CygnusIOSWKFrameInfo {
  ///A Boolean value indicating whether the frame is the web site's main frame or a subframe.
  bool isMainFrame;

  ///The frame’s current request.
  CygnusURLRequest? request;

  ///The frame’s security origin.
  CygnusIOSWKSecurityOrigin? securityOrigin;
  CygnusIOSWKFrameInfo({
    required this.isMainFrame,
    this.request,
    this.securityOrigin,
  });

  ///Gets a possible [CygnusIOSWKFrameInfo] instance from a [Map] value.
  static CygnusIOSWKFrameInfo? fromMap(
    Map<String, dynamic>? map, {
    CygnusEnumMethod? enumMethod,
  }) {
    if (map == null) {
      return null;
    }
    final instance = CygnusIOSWKFrameInfo(
      isMainFrame: map['isMainFrame'],
      request: CygnusURLRequest.fromMap(
        map['request']?.cast<String, dynamic>(),
        enumMethod: enumMethod,
      ),
      securityOrigin: CygnusIOSWKSecurityOrigin.fromMap(
        map['securityOrigin']?.cast<String, dynamic>(),
        enumMethod: enumMethod,
      ),
    );
    return instance;
  }

  ///Converts instance to a map.
  Map<String, dynamic> toMap({CygnusEnumMethod? enumMethod}) {
    return {
      "isMainFrame": isMainFrame,
      "request": request?.toMap(enumMethod: enumMethod),
      "securityOrigin": securityOrigin?.toMap(enumMethod: enumMethod),
    };
  }

  ///Converts instance to a map.
  Map<String, dynamic> toJson() {
    return toMap();
  }

  @override
  String toString() {
    return 'CygnusIOSWKFrameInfo{isMainFrame: $isMainFrame, request: $request, securityOrigin: $securityOrigin}';
  }
}
