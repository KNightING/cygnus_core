import 'package:flutter/foundation.dart';
import 'package:flutter_inappwebview_internal_annotations/flutter_inappwebview_internal_annotations.dart';
import '../in_app_webview/platform_webview.dart';
part 'navigation_type.g.dart';

///Class that represents the type of action triggering a navigation for the [CygnusPlatformWebViewCreationParams.shouldOverrideUrlLoading] event.
@ExchangeableEnum()
class CygnusNavigationType_ {
  // ignore: unused_field
  final String _value;
  // ignore: unused_field
  final int? _nativeValue = null;

  const CygnusNavigationType_._internal(this._value);

  ///A link with an href attribute was activated by the user.
  @EnumSupportedPlatforms(
    platforms: [
      EnumIOSPlatform(
        apiName: 'WKNavigationType.linkActivated',
        apiUrl:
            'https://developer.apple.com/documentation/webkit/wknavigationtype/linkactivated',
        value: 0,
      ),
      EnumMacOSPlatform(
        apiName: 'WKNavigationType.linkActivated',
        apiUrl:
            'https://developer.apple.com/documentation/webkit/wknavigationtype/linkactivated',
        value: 0,
      ),
      EnumWindowsPlatform(value: 0),
    ],
  )
  static const LINK_ACTIVATED = const CygnusNavigationType_._internal(
    'LINK_ACTIVATED',
  );

  ///A form was submitted.
  @EnumSupportedPlatforms(
    platforms: [
      EnumIOSPlatform(
        apiName: 'WKNavigationType.formSubmitted',
        apiUrl:
            'https://developer.apple.com/documentation/webkit/wknavigationtype/formsubmitted',
        value: 1,
      ),
      EnumMacOSPlatform(
        apiName: 'WKNavigationType.formSubmitted',
        apiUrl:
            'https://developer.apple.com/documentation/webkit/wknavigationtype/formsubmitted',
        value: 1,
      ),
    ],
  )
  static const FORM_SUBMITTED = const CygnusNavigationType_._internal(
    'FORM_SUBMITTED',
  );

  ///An item from the back-forward list was requested.
  @EnumSupportedPlatforms(
    platforms: [
      EnumIOSPlatform(
        apiName: 'WKNavigationType.formSubmitted',
        apiUrl:
            'https://developer.apple.com/documentation/webkit/wknavigationtype/formsubmitted',
        value: 2,
      ),
      EnumMacOSPlatform(
        apiName: 'WKNavigationType.formSubmitted',
        apiUrl:
            'https://developer.apple.com/documentation/webkit/wknavigationtype/formsubmitted',
        value: 2,
      ),
      EnumWindowsPlatform(
        apiName: 'COREWEBVIEW2_NAVIGATION_KIND_BACK_OR_FORWARD',
        apiUrl:
            'https://learn.microsoft.com/en-us/microsoft-edge/webview2/reference/win32/webview2-idl?view=webview2-1.0.2210.55#corewebview2_navigation_kind',
        value: 1,
      ),
    ],
  )
  static const BACK_FORWARD = const CygnusNavigationType_._internal('BACK_FORWARD');

  ///The webpage was reloaded.
  @EnumSupportedPlatforms(
    platforms: [
      EnumIOSPlatform(
        apiName: 'WKNavigationType.reload',
        apiUrl:
            'https://developer.apple.com/documentation/webkit/wknavigationtype/reload',
        value: 3,
      ),
      EnumMacOSPlatform(
        apiName: 'WKNavigationType.reload',
        apiUrl:
            'https://developer.apple.com/documentation/webkit/wknavigationtype/reload',
        value: 3,
      ),
      EnumWindowsPlatform(
        apiName: 'COREWEBVIEW2_NAVIGATION_KIND_RELOAD',
        apiUrl:
            'https://learn.microsoft.com/en-us/microsoft-edge/webview2/reference/win32/webview2-idl?view=webview2-1.0.2210.55#corewebview2_navigation_kind',
        value: 2,
      ),
    ],
  )
  static const RELOAD = const CygnusNavigationType_._internal('RELOAD');

  ///A form was resubmitted (for example by going back, going forward, or reloading).
  @EnumSupportedPlatforms(
    platforms: [
      EnumIOSPlatform(
        apiName: 'WKNavigationType.formSubmitted',
        apiUrl:
            'https://developer.apple.com/documentation/webkit/wknavigationtype/formresubmitted',
        value: 4,
      ),
      EnumMacOSPlatform(
        apiName: 'WKNavigationType.formSubmitted',
        apiUrl:
            'https://developer.apple.com/documentation/webkit/wknavigationtype/formresubmitted',
        value: 4,
      ),
    ],
  )
  static const FORM_RESUBMITTED = const CygnusNavigationType_._internal(
    'FORM_RESUBMITTED',
  );

  ///Navigation is taking place for some other reason.
  @EnumSupportedPlatforms(
    platforms: [
      EnumIOSPlatform(
        apiName: 'WKNavigationType.other',
        apiUrl:
            'https://developer.apple.com/documentation/webkit/wknavigationtype/other',
        value: -1,
      ),
      EnumMacOSPlatform(
        apiName: 'WKNavigationType.other',
        apiUrl:
            'https://developer.apple.com/documentation/webkit/wknavigationtype/other',
        value: -1,
      ),
      EnumWindowsPlatform(value: 3),
    ],
  )
  static const OTHER = const CygnusNavigationType_._internal('OTHER');
}

///Class that represents the type of action triggering a navigation on iOS for the [CygnusPlatformWebViewCreationParams.shouldOverrideUrlLoading] event.
///Use [CygnusNavigationType] instead.
@Deprecated("Use CygnusNavigationType instead")
@ExchangeableEnum()
class CygnusIOSWKNavigationType_ {
  // ignore: unused_field
  final int _value;
  const CygnusIOSWKNavigationType_._internal(this._value);

  ///A link with an href attribute was activated by the user.
  static const LINK_ACTIVATED = const CygnusIOSWKNavigationType_._internal(0);

  ///A form was submitted.
  static const FORM_SUBMITTED = const CygnusIOSWKNavigationType_._internal(1);

  ///An item from the back-forward list was requested.
  static const BACK_FORWARD = const CygnusIOSWKNavigationType_._internal(2);

  ///The webpage was reloaded.
  static const RELOAD = const CygnusIOSWKNavigationType_._internal(3);

  ///A form was resubmitted (for example by going back, going forward, or reloading).
  static const FORM_RESUBMITTED = const CygnusIOSWKNavigationType_._internal(4);

  ///Navigation is taking place for some other reason.
  static const OTHER = const CygnusIOSWKNavigationType_._internal(-1);
}
