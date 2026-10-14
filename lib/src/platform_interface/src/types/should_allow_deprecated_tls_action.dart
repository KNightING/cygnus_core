import 'package:flutter_inappwebview_internal_annotations/flutter_inappwebview_internal_annotations.dart';
import '../webview/platform_webview.dart';
part 'should_allow_deprecated_tls_action.g.dart';

///Class that is used by [CygnusPlatformWebViewCreationParams.shouldAllowDeprecatedTLS] event.
///It represents the policy to pass back to the decision handler.
@ExchangeableEnum()
class CygnusShouldAllowDeprecatedTLSAction_ {
  // ignore: unused_field
  final int _value;
  const CygnusShouldAllowDeprecatedTLSAction_._internal(this._value);

  ///Cancel the navigation.
  static const CANCEL = const CygnusShouldAllowDeprecatedTLSAction_._internal(0);

  ///Allow the navigation to continue.
  static const ALLOW = const CygnusShouldAllowDeprecatedTLSAction_._internal(1);
}

///Class that is used by [CygnusPlatformWebViewCreationParams.shouldAllowDeprecatedTLS] event.
///It represents the policy to pass back to the decision handler.
///Use [CygnusShouldAllowDeprecatedTLSAction] instead.
@Deprecated("Use CygnusShouldAllowDeprecatedTLSAction instead")
@ExchangeableEnum()
class CygnusIOSShouldAllowDeprecatedTLSAction_ {
  // ignore: unused_field
  final int _value;
  const CygnusIOSShouldAllowDeprecatedTLSAction_._internal(this._value);

  ///Cancel the navigation.
  static const CANCEL = const CygnusIOSShouldAllowDeprecatedTLSAction_._internal(0);

  ///Allow the navigation to continue.
  static const ALLOW = const CygnusIOSShouldAllowDeprecatedTLSAction_._internal(1);
}
