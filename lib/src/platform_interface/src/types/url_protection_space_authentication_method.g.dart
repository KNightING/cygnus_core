// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'url_protection_space_authentication_method.dart';

// **************************************************************************
// ExchangeableEnumGenerator
// **************************************************************************

///Class that represents the constants describing known values of the [CygnusURLProtectionSpace.authenticationMethod] property.
class CygnusURLProtectionSpaceAuthenticationMethod {
  final String _value;
  final String? _nativeValue;
  const CygnusURLProtectionSpaceAuthenticationMethod._internal(
    this._value,
    this._nativeValue,
  );
  // ignore: unused_element
  factory CygnusURLProtectionSpaceAuthenticationMethod._internalMultiPlatform(
    String value,
    Function nativeValue,
  ) => CygnusURLProtectionSpaceAuthenticationMethod._internal(
    value,
    nativeValue(),
  );

  ///Use client certificate authentication for this protection space.
  static const NSURL_AUTHENTICATION_METHOD_CLIENT_CERTIFICATE =
      CygnusURLProtectionSpaceAuthenticationMethod._internal(
        'NSURLAuthenticationMethodClientCertificate',
        'NSURLAuthenticationMethodClientCertificate',
      );

  ///Use the default authentication method for a protocol.
  static const NSURL_AUTHENTICATION_METHOD_DEFAULT =
      CygnusURLProtectionSpaceAuthenticationMethod._internal(
        'NSURLAuthenticationMethodDefault',
        'NSURLAuthenticationMethodDefault',
      );

  ///Use HTML form authentication for this protection space.
  static const NSURL_AUTHENTICATION_METHOD_HTML_FORM =
      CygnusURLProtectionSpaceAuthenticationMethod._internal(
        'NSURLAuthenticationMethodHTMLForm',
        'NSURLAuthenticationMethodHTMLForm',
      );

  ///Use HTTP basic authentication for this protection space.
  static const NSURL_AUTHENTICATION_METHOD_HTTP_BASIC =
      CygnusURLProtectionSpaceAuthenticationMethod._internal(
        'NSURLAuthenticationMethodHTTPBasic',
        'NSURLAuthenticationMethodHTTPBasic',
      );

  ///Use HTTP digest authentication for this protection space.
  static const NSURL_AUTHENTICATION_METHOD_HTTP_DIGEST =
      CygnusURLProtectionSpaceAuthenticationMethod._internal(
        'NSURLAuthenticationMethodHTTPDigest',
        'NSURLAuthenticationMethodHTTPDigest',
      );

  ///Negotiate whether to use Kerberos or NTLM authentication for this protection space.
  static const NSURL_AUTHENTICATION_METHOD_NEGOTIATE =
      CygnusURLProtectionSpaceAuthenticationMethod._internal(
        'NSURLAuthenticationMethodNegotiate',
        'NSURLAuthenticationMethodNegotiate',
      );

  ///Use NTLM authentication for this protection space.
  static const NSURL_AUTHENTICATION_METHOD_NTLM =
      CygnusURLProtectionSpaceAuthenticationMethod._internal(
        'NSURLAuthenticationMethodNTLM',
        'NSURLAuthenticationMethodNTLM',
      );

  ///Perform server trust authentication (certificate validation) for this protection space.
  static const NSURL_AUTHENTICATION_METHOD_SERVER_TRUST =
      CygnusURLProtectionSpaceAuthenticationMethod._internal(
        'NSURLAuthenticationMethodServerTrust',
        'NSURLAuthenticationMethodServerTrust',
      );

  ///Set of all values of [CygnusURLProtectionSpaceAuthenticationMethod].
  static final Set<CygnusURLProtectionSpaceAuthenticationMethod> values = [
    CygnusURLProtectionSpaceAuthenticationMethod
        .NSURL_AUTHENTICATION_METHOD_CLIENT_CERTIFICATE,
    CygnusURLProtectionSpaceAuthenticationMethod
        .NSURL_AUTHENTICATION_METHOD_DEFAULT,
    CygnusURLProtectionSpaceAuthenticationMethod
        .NSURL_AUTHENTICATION_METHOD_HTML_FORM,
    CygnusURLProtectionSpaceAuthenticationMethod
        .NSURL_AUTHENTICATION_METHOD_HTTP_BASIC,
    CygnusURLProtectionSpaceAuthenticationMethod
        .NSURL_AUTHENTICATION_METHOD_HTTP_DIGEST,
    CygnusURLProtectionSpaceAuthenticationMethod
        .NSURL_AUTHENTICATION_METHOD_NEGOTIATE,
    CygnusURLProtectionSpaceAuthenticationMethod
        .NSURL_AUTHENTICATION_METHOD_NTLM,
    CygnusURLProtectionSpaceAuthenticationMethod
        .NSURL_AUTHENTICATION_METHOD_SERVER_TRUST,
  ].toSet();

  ///Gets a possible [CygnusURLProtectionSpaceAuthenticationMethod] instance from [String] value.
  static CygnusURLProtectionSpaceAuthenticationMethod? fromValue(
    String? value,
  ) {
    if (value != null) {
      try {
        return CygnusURLProtectionSpaceAuthenticationMethod.values.firstWhere(
          (element) => element.toValue() == value,
        );
      } catch (e) {
        return null;
      }
    }
    return null;
  }

  ///Gets a possible [CygnusURLProtectionSpaceAuthenticationMethod] instance from a native value.
  static CygnusURLProtectionSpaceAuthenticationMethod? fromNativeValue(
    String? value,
  ) {
    if (value != null) {
      try {
        return CygnusURLProtectionSpaceAuthenticationMethod.values.firstWhere(
          (element) => element.toNativeValue() == value,
        );
      } catch (e) {
        return null;
      }
    }
    return null;
  }

  /// Gets a possible [CygnusURLProtectionSpaceAuthenticationMethod] instance value with name [name].
  ///
  /// Goes through [CygnusURLProtectionSpaceAuthenticationMethod.values] looking for a value with
  /// name [name], as reported by [CygnusURLProtectionSpaceAuthenticationMethod.name].
  /// Returns the first value with the given name, otherwise `null`.
  static CygnusURLProtectionSpaceAuthenticationMethod? byName(String? name) {
    if (name != null) {
      try {
        return CygnusURLProtectionSpaceAuthenticationMethod.values.firstWhere(
          (element) => element.name() == name,
        );
      } catch (e) {
        return null;
      }
    }
    return null;
  }

  /// Creates a map from the names of [CygnusURLProtectionSpaceAuthenticationMethod] values to the values.
  ///
  /// The collection that this method is called on is expected to have
  /// values with distinct names, like the `values` list of an enum class.
  /// Only one value for each name can occur in the created map,
  /// so if two or more values have the same name (either being the
  /// same value, or being values of different enum type), at most one of
  /// them will be represented in the returned map.
  static Map<String, CygnusURLProtectionSpaceAuthenticationMethod>
  asNameMap() => <String, CygnusURLProtectionSpaceAuthenticationMethod>{
    for (final value in CygnusURLProtectionSpaceAuthenticationMethod.values)
      value.name(): value,
  };

  ///Gets [String] value.
  String toValue() => _value;

  ///Gets [String] native value if supported by the current platform, otherwise `null`.
  String? toNativeValue() => _nativeValue;

  ///Gets the name of the value.
  String name() {
    switch (_value) {
      case 'NSURLAuthenticationMethodClientCertificate':
        return 'NSURL_AUTHENTICATION_METHOD_CLIENT_CERTIFICATE';
      case 'NSURLAuthenticationMethodDefault':
        return 'NSURL_AUTHENTICATION_METHOD_DEFAULT';
      case 'NSURLAuthenticationMethodHTMLForm':
        return 'NSURL_AUTHENTICATION_METHOD_HTML_FORM';
      case 'NSURLAuthenticationMethodHTTPBasic':
        return 'NSURL_AUTHENTICATION_METHOD_HTTP_BASIC';
      case 'NSURLAuthenticationMethodHTTPDigest':
        return 'NSURL_AUTHENTICATION_METHOD_HTTP_DIGEST';
      case 'NSURLAuthenticationMethodNegotiate':
        return 'NSURL_AUTHENTICATION_METHOD_NEGOTIATE';
      case 'NSURLAuthenticationMethodNTLM':
        return 'NSURL_AUTHENTICATION_METHOD_NTLM';
      case 'NSURLAuthenticationMethodServerTrust':
        return 'NSURL_AUTHENTICATION_METHOD_SERVER_TRUST';
    }
    return _value.toString();
  }

  @override
  int get hashCode => _value.hashCode;

  @override
  bool operator ==(value) => value == _value;

  ///Checks if the value is supported by the [defaultTargetPlatform].
  bool isSupported() {
    return _nativeValue != null;
  }

  @override
  String toString() {
    return _value;
  }
}

///An iOS-specific Class that represents the constants describing known values of the [CygnusURLProtectionSpace.authenticationMethod] property.
///Use [CygnusURLProtectionSpaceAuthenticationMethod] instead.
@Deprecated('Use CygnusURLProtectionSpaceAuthenticationMethod instead')
class CygnusIOSNSURLProtectionSpaceAuthenticationMethod {
  final String _value;
  final String? _nativeValue;
  const CygnusIOSNSURLProtectionSpaceAuthenticationMethod._internal(
    this._value,
    this._nativeValue,
  );
  // ignore: unused_element
  factory CygnusIOSNSURLProtectionSpaceAuthenticationMethod._internalMultiPlatform(
    String value,
    Function nativeValue,
  ) => CygnusIOSNSURLProtectionSpaceAuthenticationMethod._internal(
    value,
    nativeValue(),
  );

  ///Use client certificate authentication for this protection space.
  static const NSURL_AUTHENTICATION_METHOD_CLIENT_CERTIFICATE =
      CygnusIOSNSURLProtectionSpaceAuthenticationMethod._internal(
        'NSURLAuthenticationMethodClientCertificate',
        'NSURLAuthenticationMethodClientCertificate',
      );

  ///Use the default authentication method for a protocol.
  static const NSURL_AUTHENTICATION_METHOD_DEFAULT =
      CygnusIOSNSURLProtectionSpaceAuthenticationMethod._internal(
        'NSURLAuthenticationMethodDefault',
        'NSURLAuthenticationMethodDefault',
      );

  ///Use HTML form authentication for this protection space.
  static const NSURL_AUTHENTICATION_METHOD_HTML_FORM =
      CygnusIOSNSURLProtectionSpaceAuthenticationMethod._internal(
        'NSURLAuthenticationMethodHTMLForm',
        'NSURLAuthenticationMethodHTMLForm',
      );

  ///Use HTTP basic authentication for this protection space.
  static const NSURL_AUTHENTICATION_METHOD_HTTP_BASIC =
      CygnusIOSNSURLProtectionSpaceAuthenticationMethod._internal(
        'NSURLAuthenticationMethodHTTPBasic',
        'NSURLAuthenticationMethodHTTPBasic',
      );

  ///Use HTTP digest authentication for this protection space.
  static const NSURL_AUTHENTICATION_METHOD_HTTP_DIGEST =
      CygnusIOSNSURLProtectionSpaceAuthenticationMethod._internal(
        'NSURLAuthenticationMethodHTTPDigest',
        'NSURLAuthenticationMethodHTTPDigest',
      );

  ///Negotiate whether to use Kerberos or NTLM authentication for this protection space.
  static const NSURL_AUTHENTICATION_METHOD_NEGOTIATE =
      CygnusIOSNSURLProtectionSpaceAuthenticationMethod._internal(
        'NSURLAuthenticationMethodNegotiate',
        'NSURLAuthenticationMethodNegotiate',
      );

  ///Use NTLM authentication for this protection space.
  static const NSURL_AUTHENTICATION_METHOD_NTLM =
      CygnusIOSNSURLProtectionSpaceAuthenticationMethod._internal(
        'NSURLAuthenticationMethodNTLM',
        'NSURLAuthenticationMethodNTLM',
      );

  ///Perform server trust authentication (certificate validation) for this protection space.
  static const NSURL_AUTHENTICATION_METHOD_SERVER_TRUST =
      CygnusIOSNSURLProtectionSpaceAuthenticationMethod._internal(
        'NSURLAuthenticationMethodServerTrust',
        'NSURLAuthenticationMethodServerTrust',
      );

  ///Set of all values of [CygnusIOSNSURLProtectionSpaceAuthenticationMethod].
  static final Set<CygnusIOSNSURLProtectionSpaceAuthenticationMethod> values = [
    CygnusIOSNSURLProtectionSpaceAuthenticationMethod
        .NSURL_AUTHENTICATION_METHOD_CLIENT_CERTIFICATE,
    CygnusIOSNSURLProtectionSpaceAuthenticationMethod
        .NSURL_AUTHENTICATION_METHOD_DEFAULT,
    CygnusIOSNSURLProtectionSpaceAuthenticationMethod
        .NSURL_AUTHENTICATION_METHOD_HTML_FORM,
    CygnusIOSNSURLProtectionSpaceAuthenticationMethod
        .NSURL_AUTHENTICATION_METHOD_HTTP_BASIC,
    CygnusIOSNSURLProtectionSpaceAuthenticationMethod
        .NSURL_AUTHENTICATION_METHOD_HTTP_DIGEST,
    CygnusIOSNSURLProtectionSpaceAuthenticationMethod
        .NSURL_AUTHENTICATION_METHOD_NEGOTIATE,
    CygnusIOSNSURLProtectionSpaceAuthenticationMethod
        .NSURL_AUTHENTICATION_METHOD_NTLM,
    CygnusIOSNSURLProtectionSpaceAuthenticationMethod
        .NSURL_AUTHENTICATION_METHOD_SERVER_TRUST,
  ].toSet();

  ///Gets a possible [CygnusIOSNSURLProtectionSpaceAuthenticationMethod] instance from [String] value.
  static CygnusIOSNSURLProtectionSpaceAuthenticationMethod? fromValue(
    String? value,
  ) {
    if (value != null) {
      try {
        return CygnusIOSNSURLProtectionSpaceAuthenticationMethod.values
            .firstWhere((element) => element.toValue() == value);
      } catch (e) {
        return null;
      }
    }
    return null;
  }

  ///Gets a possible [CygnusIOSNSURLProtectionSpaceAuthenticationMethod] instance from a native value.
  static CygnusIOSNSURLProtectionSpaceAuthenticationMethod? fromNativeValue(
    String? value,
  ) {
    if (value != null) {
      try {
        return CygnusIOSNSURLProtectionSpaceAuthenticationMethod.values
            .firstWhere((element) => element.toNativeValue() == value);
      } catch (e) {
        return null;
      }
    }
    return null;
  }

  /// Gets a possible [CygnusIOSNSURLProtectionSpaceAuthenticationMethod] instance value with name [name].
  ///
  /// Goes through [CygnusIOSNSURLProtectionSpaceAuthenticationMethod.values] looking for a value with
  /// name [name], as reported by [CygnusIOSNSURLProtectionSpaceAuthenticationMethod.name].
  /// Returns the first value with the given name, otherwise `null`.
  static CygnusIOSNSURLProtectionSpaceAuthenticationMethod? byName(
    String? name,
  ) {
    if (name != null) {
      try {
        return CygnusIOSNSURLProtectionSpaceAuthenticationMethod.values
            .firstWhere((element) => element.name() == name);
      } catch (e) {
        return null;
      }
    }
    return null;
  }

  /// Creates a map from the names of [CygnusIOSNSURLProtectionSpaceAuthenticationMethod] values to the values.
  ///
  /// The collection that this method is called on is expected to have
  /// values with distinct names, like the `values` list of an enum class.
  /// Only one value for each name can occur in the created map,
  /// so if two or more values have the same name (either being the
  /// same value, or being values of different enum type), at most one of
  /// them will be represented in the returned map.
  static Map<String, CygnusIOSNSURLProtectionSpaceAuthenticationMethod>
  asNameMap() => <String, CygnusIOSNSURLProtectionSpaceAuthenticationMethod>{
    for (final value
        in CygnusIOSNSURLProtectionSpaceAuthenticationMethod.values)
      value.name(): value,
  };

  ///Gets [String] value.
  String toValue() => _value;

  ///Gets [String] native value if supported by the current platform, otherwise `null`.
  String? toNativeValue() => _nativeValue;

  ///Gets the name of the value.
  String name() {
    switch (_value) {
      case 'NSURLAuthenticationMethodClientCertificate':
        return 'NSURL_AUTHENTICATION_METHOD_CLIENT_CERTIFICATE';
      case 'NSURLAuthenticationMethodDefault':
        return 'NSURL_AUTHENTICATION_METHOD_DEFAULT';
      case 'NSURLAuthenticationMethodHTMLForm':
        return 'NSURL_AUTHENTICATION_METHOD_HTML_FORM';
      case 'NSURLAuthenticationMethodHTTPBasic':
        return 'NSURL_AUTHENTICATION_METHOD_HTTP_BASIC';
      case 'NSURLAuthenticationMethodHTTPDigest':
        return 'NSURL_AUTHENTICATION_METHOD_HTTP_DIGEST';
      case 'NSURLAuthenticationMethodNegotiate':
        return 'NSURL_AUTHENTICATION_METHOD_NEGOTIATE';
      case 'NSURLAuthenticationMethodNTLM':
        return 'NSURL_AUTHENTICATION_METHOD_NTLM';
      case 'NSURLAuthenticationMethodServerTrust':
        return 'NSURL_AUTHENTICATION_METHOD_SERVER_TRUST';
    }
    return _value.toString();
  }

  @override
  int get hashCode => _value.hashCode;

  @override
  bool operator ==(value) => value == _value;

  ///Checks if the value is supported by the [defaultTargetPlatform].
  bool isSupported() {
    return _nativeValue != null;
  }

  @override
  String toString() {
    return _value;
  }
}
