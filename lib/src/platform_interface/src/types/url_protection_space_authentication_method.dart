import 'package:cygnus_core_internal_annotations/cygnus_core_internal_annotations.dart';

import 'url_protection_space.dart';

part 'url_protection_space_authentication_method.g.dart';

///Class that represents the constants describing known values of the [CygnusURLProtectionSpace.authenticationMethod] property.
@ExchangeableEnum()
class CygnusURLProtectionSpaceAuthenticationMethod_ {
  // ignore: unused_field
  final String _value;
  const CygnusURLProtectionSpaceAuthenticationMethod_._internal(this._value);

  ///Use the default authentication method for a protocol.
  static const NSURL_AUTHENTICATION_METHOD_DEFAULT =
      const CygnusURLProtectionSpaceAuthenticationMethod_._internal(
        "NSURLAuthenticationMethodDefault",
      );

  ///Use HTTP basic authentication for this protection space.
  static const NSURL_AUTHENTICATION_METHOD_HTTP_BASIC =
      const CygnusURLProtectionSpaceAuthenticationMethod_._internal(
        "NSURLAuthenticationMethodHTTPBasic",
      );

  ///Use HTTP digest authentication for this protection space.
  static const NSURL_AUTHENTICATION_METHOD_HTTP_DIGEST =
      const CygnusURLProtectionSpaceAuthenticationMethod_._internal(
        "NSURLAuthenticationMethodHTTPDigest",
      );

  ///Use HTML form authentication for this protection space.
  static const NSURL_AUTHENTICATION_METHOD_HTML_FORM =
      const CygnusURLProtectionSpaceAuthenticationMethod_._internal(
        "NSURLAuthenticationMethodHTMLForm",
      );

  ///Use client certificate authentication for this protection space.
  static const NSURL_AUTHENTICATION_METHOD_CLIENT_CERTIFICATE =
      const CygnusURLProtectionSpaceAuthenticationMethod_._internal(
        "NSURLAuthenticationMethodClientCertificate",
      );

  ///Negotiate whether to use Kerberos or NTLM authentication for this protection space.
  static const NSURL_AUTHENTICATION_METHOD_NEGOTIATE =
      const CygnusURLProtectionSpaceAuthenticationMethod_._internal(
        "NSURLAuthenticationMethodNegotiate",
      );

  ///Use NTLM authentication for this protection space.
  static const NSURL_AUTHENTICATION_METHOD_NTLM =
      const CygnusURLProtectionSpaceAuthenticationMethod_._internal(
        "NSURLAuthenticationMethodNTLM",
      );

  ///Perform server trust authentication (certificate validation) for this protection space.
  static const NSURL_AUTHENTICATION_METHOD_SERVER_TRUST =
      const CygnusURLProtectionSpaceAuthenticationMethod_._internal(
        "NSURLAuthenticationMethodServerTrust",
      );
}

///An iOS-specific Class that represents the constants describing known values of the [CygnusURLProtectionSpace.authenticationMethod] property.
///Use [CygnusURLProtectionSpaceAuthenticationMethod] instead.
@Deprecated("Use CygnusURLProtectionSpaceAuthenticationMethod instead")
@ExchangeableEnum()
class CygnusIOSNSURLProtectionSpaceAuthenticationMethod_ {
  // ignore: unused_field
  final String _value;
  const CygnusIOSNSURLProtectionSpaceAuthenticationMethod_._internal(this._value);

  ///Use the default authentication method for a protocol.
  static const NSURL_AUTHENTICATION_METHOD_DEFAULT =
      const CygnusIOSNSURLProtectionSpaceAuthenticationMethod_._internal(
        "NSURLAuthenticationMethodDefault",
      );

  ///Use HTTP basic authentication for this protection space.
  static const NSURL_AUTHENTICATION_METHOD_HTTP_BASIC =
      const CygnusIOSNSURLProtectionSpaceAuthenticationMethod_._internal(
        "NSURLAuthenticationMethodHTTPBasic",
      );

  ///Use HTTP digest authentication for this protection space.
  static const NSURL_AUTHENTICATION_METHOD_HTTP_DIGEST =
      const CygnusIOSNSURLProtectionSpaceAuthenticationMethod_._internal(
        "NSURLAuthenticationMethodHTTPDigest",
      );

  ///Use HTML form authentication for this protection space.
  static const NSURL_AUTHENTICATION_METHOD_HTML_FORM =
      const CygnusIOSNSURLProtectionSpaceAuthenticationMethod_._internal(
        "NSURLAuthenticationMethodHTMLForm",
      );

  ///Use client certificate authentication for this protection space.
  static const NSURL_AUTHENTICATION_METHOD_CLIENT_CERTIFICATE =
      const CygnusIOSNSURLProtectionSpaceAuthenticationMethod_._internal(
        "NSURLAuthenticationMethodClientCertificate",
      );

  ///Negotiate whether to use Kerberos or NTLM authentication for this protection space.
  static const NSURL_AUTHENTICATION_METHOD_NEGOTIATE =
      const CygnusIOSNSURLProtectionSpaceAuthenticationMethod_._internal(
        "NSURLAuthenticationMethodNegotiate",
      );

  ///Use NTLM authentication for this protection space.
  static const NSURL_AUTHENTICATION_METHOD_NTLM =
      const CygnusIOSNSURLProtectionSpaceAuthenticationMethod_._internal(
        "NSURLAuthenticationMethodNTLM",
      );

  ///Perform server trust authentication (certificate validation) for this protection space.
  static const NSURL_AUTHENTICATION_METHOD_SERVER_TRUST =
      const CygnusIOSNSURLProtectionSpaceAuthenticationMethod_._internal(
        "NSURLAuthenticationMethodServerTrust",
      );
}
