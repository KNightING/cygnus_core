import 'package:cygnus_core_internal_annotations/cygnus_core_internal_annotations.dart';

import '../platform_proxy_controller.dart';

part 'proxy_scheme_filter.g.dart';

///Class that represent scheme filters used by [CygnusPlatformProxyController].
@ExchangeableEnum()
class CygnusProxySchemeFilter_ {
  // ignore: unused_field
  final String _value;
  const CygnusProxySchemeFilter_._internal(this._value);

  ///Matches all schemes.
  static const MATCH_ALL_SCHEMES = const CygnusProxySchemeFilter_._internal("*");

  ///HTTP scheme.
  static const MATCH_HTTP = const CygnusProxySchemeFilter_._internal("http");

  ///HTTPS scheme.
  static const MATCH_HTTPS = const CygnusProxySchemeFilter_._internal("https");
}
