import 'package:flutter_inappwebview_internal_annotations/flutter_inappwebview_internal_annotations.dart';

import '../webview/platform_webview.dart';
import 'permission_resource_type.dart';
import 'permission_response_action.dart';
import 'enum_method.dart';

part 'permission_response.g.dart';

///Class that represents the response used by the [CygnusPlatformWebViewCreationParams.onPermissionRequest] event.
@ExchangeableObject()
class CygnusPermissionResponse_ {
  ///Resources granted to be accessed by origin.
  ///
  ///**NOTE for iOS, macOS and Windows**: not used. The [action] taken is based on the [CygnusPermissionRequest.resources].
  List<CygnusPermissionResourceType_> resources;

  ///Indicate the [CygnusPermissionResponseAction] to take in response of a permission request.
  CygnusPermissionResponseAction_? action;

  CygnusPermissionResponse_({
    this.resources = const [],
    this.action = CygnusPermissionResponseAction_.DENY,
  });
}

///Class that represents the response used by the [CygnusPlatformWebViewCreationParams.androidOnPermissionRequest] event.
///Use [CygnusPermissionResponse] instead.
@Deprecated("Use CygnusPermissionResponse instead")
@ExchangeableObject()
class CygnusPermissionRequestResponse_ {
  ///Resources granted to be accessed by origin.
  List<String> resources;

  ///Indicate the [CygnusPermissionRequestResponseAction] to take in response of a permission request.
  CygnusPermissionRequestResponseAction_? action;

  CygnusPermissionRequestResponse_({
    this.resources = const [],
    this.action = CygnusPermissionRequestResponseAction_.DENY,
  });
}
