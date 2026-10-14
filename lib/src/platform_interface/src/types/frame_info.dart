import 'package:flutter_inappwebview_internal_annotations/flutter_inappwebview_internal_annotations.dart';

import 'url_request.dart';
import 'security_origin.dart';
import 'frame_kind.dart';
import 'enum_method.dart';

part 'frame_info.g.dart';

///An object that contains information about a frame on a webpage.
@ExchangeableObject()
class CygnusFrameInfo_ {
  ///A Boolean value indicating whether the frame is the web site's main frame or a subframe.
  @SupportedPlatforms(
    platforms: [IOSPlatform(), MacOSPlatform(), WindowsPlatform()],
  )
  bool isMainFrame;

  ///The frame’s current request.
  @SupportedPlatforms(
    platforms: [IOSPlatform(), MacOSPlatform(), WindowsPlatform()],
  )
  CygnusURLRequest_? request;

  ///The frame’s security origin.
  @SupportedPlatforms(
    platforms: [IOSPlatform(), MacOSPlatform(), WindowsPlatform()],
  )
  CygnusSecurityOrigin_? securityOrigin;

  ///Gets the name attribute of the frame, as in <iframe name="frame-name">...</iframe>.
  @SupportedPlatforms(platforms: [WindowsPlatform()])
  String? name;

  ///The unique identifier of the frame associated with the current [CygnusFrameInfo].
  @SupportedPlatforms(platforms: [WindowsPlatform()])
  int? frameId;

  ///The kind of the frame.
  @SupportedPlatforms(platforms: [WindowsPlatform()])
  CygnusFrameKind_? kind;

  CygnusFrameInfo_({
    required this.isMainFrame,
    required this.request,
    this.securityOrigin,
    this.name,
    this.frameId,
    this.kind,
  });
}

///An object that contains information about a frame on a webpage.
///
///**NOTE**: available only on iOS.
///
///Use [CygnusFrameInfo] instead.
@Deprecated("Use CygnusFrameInfo instead")
@ExchangeableObject()
class CygnusIOSWKFrameInfo_ {
  ///A Boolean value indicating whether the frame is the web site's main frame or a subframe.
  bool isMainFrame;

  ///The frame’s current request.
  CygnusURLRequest_? request;

  ///The frame’s security origin.
  CygnusIOSWKSecurityOrigin_? securityOrigin;

  CygnusIOSWKFrameInfo_({
    required this.isMainFrame,
    required this.request,
    this.securityOrigin,
  });
}
