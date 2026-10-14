import 'package:flutter_inappwebview_internal_annotations/flutter_inappwebview_internal_annotations.dart';

import 'permission_response.dart';

part 'permission_response_action.g.dart';

///Class used by [CygnusPermissionResponse] class.
@ExchangeableEnum()
class CygnusPermissionResponseAction_ {
  // ignore: unused_field
  final int _value;
  const CygnusPermissionResponseAction_._internal(this._value);

  ///Denies the request.
  static const DENY = const CygnusPermissionResponseAction_._internal(0);

  ///Grants origin the permission to access the given resources.
  static const GRANT = const CygnusPermissionResponseAction_._internal(1);

  ///Prompt the user for permission for the requested resource.
  static const PROMPT = const CygnusPermissionResponseAction_._internal(2);
}

///Class used by [CygnusPermissionRequestResponse] class.
///Use [CygnusPermissionResponseAction] instead.
@Deprecated("Use CygnusPermissionResponseAction instead")
@ExchangeableEnum()
class CygnusPermissionRequestResponseAction_ {
  // ignore: unused_field
  final int _value;
  const CygnusPermissionRequestResponseAction_._internal(this._value);

  ///Denies the request.
  static const DENY = const CygnusPermissionRequestResponseAction_._internal(0);

  ///Grants origin the permission to access the given resources.
  static const GRANT = const CygnusPermissionRequestResponseAction_._internal(1);
}
