import 'package:flutter_inappwebview_internal_annotations/flutter_inappwebview_internal_annotations.dart';
import '../in_app_webview/platform_webview.dart';
part 'form_resubmission_action.g.dart';

///Class that represents the action to take used by the [CygnusPlatformWebViewCreationParams.onFormResubmission] event.
@ExchangeableEnum()
class CygnusFormResubmissionAction_ {
  // ignore: unused_field
  final int _value;
  const CygnusFormResubmissionAction_._internal(this._value);

  ///Resend data
  static const RESEND = const CygnusFormResubmissionAction_._internal(0);

  ///Don't resend data
  static const DONT_RESEND = const CygnusFormResubmissionAction_._internal(1);
}
