import 'package:cygnus_core_internal_annotations/cygnus_core_internal_annotations.dart';
import '../webview/platform_webview.dart';
part 'navigation_action_policy.g.dart';

///Class that is used by [CygnusPlatformWebViewCreationParams.shouldOverrideUrlLoading] event.
///It represents the policy to pass back to the decision handler.
@ExchangeableEnum()
class CygnusNavigationActionPolicy_ {
  // ignore: unused_field
  final int _value;
  const CygnusNavigationActionPolicy_._internal(this._value);

  ///Cancel the navigation.
  static const CANCEL = const CygnusNavigationActionPolicy_._internal(0);

  ///Allow the navigation to continue.
  static const ALLOW = const CygnusNavigationActionPolicy_._internal(1);

  ///Turn the navigation into a download.
  ///
  ///**NOTE**: available only on iOS 14.5+. It will fallback to [CANCEL].
  static const DOWNLOAD = const CygnusNavigationActionPolicy_._internal(2);
}
