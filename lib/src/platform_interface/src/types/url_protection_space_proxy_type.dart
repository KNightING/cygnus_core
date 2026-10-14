import 'package:flutter_inappwebview_internal_annotations/flutter_inappwebview_internal_annotations.dart';

part 'url_protection_space_proxy_type.g.dart';

///Class that represents the supported proxy types.
@ExchangeableEnum()
class CygnusURLProtectionSpaceProxyType_ {
  // ignore: unused_field
  final String _value;
  const CygnusURLProtectionSpaceProxyType_._internal(this._value);

  ///The proxy type for HTTP proxies.
  static const URL_PROTECTION_SPACE_HTTP_PROXY =
      const CygnusURLProtectionSpaceProxyType_._internal(
        "NSURLProtectionSpaceHTTPProxy",
      );

  ///The proxy type for HTTPS proxies.
  static const URL_PROTECTION_SPACE_HTTPS_PROXY =
      const CygnusURLProtectionSpaceProxyType_._internal(
        "NSURLProtectionSpaceHTTPSProxy",
      );

  ///The proxy type for FTP proxies.
  static const URL_PROTECTION_SPACE_FTP_PROXY =
      const CygnusURLProtectionSpaceProxyType_._internal(
        "NSURLProtectionSpaceFTPProxy",
      );

  ///The proxy type for SOCKS proxies.
  static const URL_PROTECTION_SPACE_SOCKS_PROXY =
      const CygnusURLProtectionSpaceProxyType_._internal(
        "NSURLProtectionSpaceSOCKSProxy",
      );
}

///An iOS-specific Class that represents the supported proxy types.
///Use [CygnusURLProtectionSpaceProxyType] instead.
@Deprecated("Use CygnusURLProtectionSpaceProxyType instead")
@ExchangeableEnum()
class CygnusIOSNSURLProtectionSpaceProxyType_ {
  // ignore: unused_field
  final String _value;
  const CygnusIOSNSURLProtectionSpaceProxyType_._internal(this._value);

  ///The proxy type for HTTP proxies.
  static const NSUR_PROTECTION_SPACE_HTTP_PROXY =
      const CygnusIOSNSURLProtectionSpaceProxyType_._internal(
        "NSURLProtectionSpaceHTTPProxy",
      );

  ///The proxy type for HTTPS proxies.
  static const NSURL_PROTECTION_SPACE_HTTPS_PROXY =
      const CygnusIOSNSURLProtectionSpaceProxyType_._internal(
        "NSURLProtectionSpaceHTTPSProxy",
      );

  ///The proxy type for FTP proxies.
  static const NSURL_PROTECTION_SPACE_FTP_PROXY =
      const CygnusIOSNSURLProtectionSpaceProxyType_._internal(
        "NSURLProtectionSpaceFTPProxy",
      );

  ///The proxy type for SOCKS proxies.
  static const NSURL_PROTECTION_SPACE_SOCKS_PROXY =
      const CygnusIOSNSURLProtectionSpaceProxyType_._internal(
        "NSURLProtectionSpaceSOCKSProxy",
      );
}
