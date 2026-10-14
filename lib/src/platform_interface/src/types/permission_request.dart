import 'package:flutter_inappwebview_internal_annotations/flutter_inappwebview_internal_annotations.dart';

import '../in_app_webview/platform_webview.dart';
import '../web_uri.dart';
import 'permission_resource_type.dart';
import 'permission_response.dart';
import 'frame_info.dart';
import 'enum_method.dart';

part 'permission_request.g.dart';

///Class that represents the response used by the [CygnusPlatformWebViewCreationParams.onPermissionRequest] event.
@ExchangeableObject()
class CygnusPermissionRequest_ {
  ///The origin of web content which attempt to access the restricted resources.
  CygnusWebUri origin;

  ///List of resources the web content wants to access.
  ///
  ///**NOTE for iOS, macOS and Windows**: this list will have only 1 element and will be used by the [CygnusPermissionResponse.action]
  ///as the resource to consider when applying the corresponding action.
  List<CygnusPermissionResourceType_> resources;

  ///The frame that initiates the request in the web view.
  CygnusFrameInfo_? frame;

  CygnusPermissionRequest_({
    required this.origin,
    this.resources = const [],
    this.frame,
  });
}
