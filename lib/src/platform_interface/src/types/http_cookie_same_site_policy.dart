import 'package:cygnus_core_internal_annotations/cygnus_core_internal_annotations.dart';

import 'cookie.dart';

part 'http_cookie_same_site_policy.g.dart';

///Class that represents the same site policy of a cookie. Used by the [CygnusCookie] class.
@ExchangeableEnum()
class CygnusHTTPCookieSameSitePolicy_ {
  // ignore: unused_field
  final String _value;
  const CygnusHTTPCookieSameSitePolicy_._internal(this._value);

  ///SameSite=Lax;
  ///
  ///Cookies are allowed to be sent with top-level navigations and will be sent along with GET
  ///request initiated by third party website. This is the default value in modern browsers.
  static const LAX = const CygnusHTTPCookieSameSitePolicy_._internal("Lax");

  ///SameSite=Strict;
  ///
  ///Cookies will only be sent in a first-party context and not be sent along with requests initiated by third party websites.
  static const STRICT = const CygnusHTTPCookieSameSitePolicy_._internal("Strict");

  ///SameSite=None;
  ///
  ///Cookies will be sent in all contexts, i.e sending cross-origin is allowed.
  ///`None` requires the `Secure` attribute in latest browser versions.
  static const NONE = const CygnusHTTPCookieSameSitePolicy_._internal("None");
}
