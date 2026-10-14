// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ssl_error_type.dart';

// **************************************************************************
// ExchangeableEnumGenerator
// **************************************************************************

///Class that represents the SSL Primary error associated to the server SSL certificate.
///Used by the [CygnusServerTrustChallenge] class.
class CygnusSslErrorType {
  final String _value;
  final int? _nativeValue;
  const CygnusSslErrorType._internal(this._value, this._nativeValue);
  // ignore: unused_element
  factory CygnusSslErrorType._internalMultiPlatform(
    String value,
    Function nativeValue,
  ) => CygnusSslErrorType._internal(value, nativeValue());

  ///Indicates that the SSL certificate common name does not match the web address.
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Windows WebView2 ([Official API - COREWEBVIEW2_WEB_ERROR_STATUS_CERTIFICATE_COMMON_NAME_IS_INCORRECT](https://learn.microsoft.com/en-us/microsoft-edge/webview2/reference/win32/webview2-idl?view=webview2-1.0.2849.39#corewebview2_web_error_status))
  static final COMMON_NAME_IS_INCORRECT =
      CygnusSslErrorType._internalMultiPlatform('COMMON_NAME_IS_INCORRECT', () {
        switch (defaultTargetPlatform) {
          case TargetPlatform.windows:
            return 1;
          default:
            break;
        }
        return null;
      });

  ///The date of the certificate is invalid.
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView ([Official API - CygnusSslError.DATE_INVALID](https://developer.android.com/reference/android/net/http/CygnusSslError#SSL_DATE_INVALID))
  static final DATE_INVALID = CygnusSslErrorType._internalMultiPlatform(
    'DATE_INVALID',
    () {
      switch (defaultTargetPlatform) {
        case TargetPlatform.android:
          return 4;
        default:
          break;
      }
      return null;
    },
  );

  ///The user specified that the certificate should not be trusted.
  ///
  ///This value indicates that the user explicitly chose to not trust a certificate in the chain,
  ///usually by clicking the appropriate button in a certificate trust panel.
  ///Your app should not trust the chain.
  ///The Keychain Access utility refers to this value as "Never Trust."
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- iOS WKWebView ([Official API - SecTrustResultType.deny](https://developer.apple.com/documentation/security/sectrustresulttype/deny))
  ///- macOS WKWebView ([Official API - SecTrustResultType.deny](https://developer.apple.com/documentation/security/sectrustresulttype/deny))
  static final DENY = CygnusSslErrorType._internalMultiPlatform('DENY', () {
    switch (defaultTargetPlatform) {
      case TargetPlatform.iOS:
        return 3;
      case TargetPlatform.macOS:
        return 3;
      default:
        break;
    }
    return null;
  });

  ///The certificate has expired.
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView ([Official API - CygnusSslError.SSL_EXPIRED](https://developer.android.com/reference/android/net/http/CygnusSslError#SSL_EXPIRED))
  ///- Windows WebView2 ([Official API - COREWEBVIEW2_WEB_ERROR_STATUS_CERTIFICATE_EXPIRED](https://learn.microsoft.com/en-us/microsoft-edge/webview2/reference/win32/webview2-idl?view=webview2-1.0.2849.39#corewebview2_web_error_status))
  static final EXPIRED = CygnusSslErrorType._internalMultiPlatform(
    'EXPIRED',
    () {
      switch (defaultTargetPlatform) {
        case TargetPlatform.android:
          return 1;
        case TargetPlatform.windows:
          return 2;
        default:
          break;
      }
      return null;
    },
  );

  ///Trust is denied and no simple fix is available.
  ///
  ///This value indicates that evaluation failed because a certificate in the chain is defective.
  ///This usually represents a fundamental defect in the certificate data, such as an invalid encoding for a critical subjectAltName extension,
  ///an unsupported critical extension, or some other critical portion of the certificate that couldn’t be interpreted.
  ///Changing parameter values and reevaluating is unlikely to succeed unless you provide different certificates.
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- iOS WKWebView ([Official API - SecTrustResultType.fatalTrustFailure](https://developer.apple.com/documentation/security/sectrustresulttype/fataltrustfailure))
  ///- macOS WKWebView ([Official API - SecTrustResultType.fatalTrustFailure](https://developer.apple.com/documentation/security/sectrustresulttype/fataltrustfailure))
  static final FATAL_TRUST_FAILURE = CygnusSslErrorType._internalMultiPlatform(
    'FATAL_TRUST_FAILURE',
    () {
      switch (defaultTargetPlatform) {
        case TargetPlatform.iOS:
          return 6;
        case TargetPlatform.macOS:
          return 6;
        default:
          break;
      }
      return null;
    },
  );

  ///Hostname mismatch.
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView ([Official API - CygnusSslError.SSL_IDMISMATCH](https://developer.android.com/reference/android/net/http/CygnusSslError#SSL_IDMISMATCH))
  static final IDMISMATCH = CygnusSslErrorType._internalMultiPlatform(
    'IDMISMATCH',
    () {
      switch (defaultTargetPlatform) {
        case TargetPlatform.android:
          return 2;
        default:
          break;
      }
      return null;
    },
  );

  ///Indicates an invalid setting or result. A generic error occurred.
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView ([Official API - CygnusSslError.SSL_INVALID](https://developer.android.com/reference/android/net/http/CygnusSslError#SSL_INVALID))
  ///- iOS WKWebView ([Official API - SecTrustResultType.invalid](https://developer.apple.com/documentation/security/sectrustresulttype/invalid))
  ///- macOS WKWebView ([Official API - SecTrustResultType.invalid](https://developer.apple.com/documentation/security/sectrustresulttype/invalid))
  ///- Windows WebView2 ([Official API - COREWEBVIEW2_WEB_ERROR_STATUS_CERTIFICATE_IS_INVALID](https://learn.microsoft.com/en-us/microsoft-edge/webview2/reference/win32/webview2-idl?view=webview2-1.0.2849.39#corewebview2_web_error_status))
  static final INVALID = CygnusSslErrorType._internalMultiPlatform(
    'INVALID',
    () {
      switch (defaultTargetPlatform) {
        case TargetPlatform.android:
          return 5;
        case TargetPlatform.iOS:
          return 0;
        case TargetPlatform.macOS:
          return 0;
        case TargetPlatform.windows:
          return 5;
        default:
          break;
      }
      return null;
    },
  );

  ///The certificate is not yet valid.
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView ([Official API - CygnusSslError.SSL_NOTYETVALID](https://developer.android.com/reference/android/net/http/CygnusSslError#SSL_NOTYETVALID))
  static final NOT_YET_VALID = CygnusSslErrorType._internalMultiPlatform(
    'NOT_YET_VALID',
    () {
      switch (defaultTargetPlatform) {
        case TargetPlatform.android:
          return 0;
        default:
          break;
      }
      return null;
    },
  );

  ///Indicates a failure other than that of trust evaluation.
  ///
  ///This value indicates that evaluation failed for some other reason.
  ///
  ///On iOS and macOS, this can be caused by either a revoked certificate or
  ///by OS-level errors that are unrelated to the certificates themselves.
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- iOS WKWebView ([Official API - SecTrustResultType.otherError](https://developer.apple.com/documentation/security/sectrustresulttype/othererror))
  ///- macOS WKWebView ([Official API - SecTrustResultType.otherError](https://developer.apple.com/documentation/security/sectrustresulttype/othererror))
  ///- Windows WebView2 ([Official API - COREWEBVIEW2_WEB_ERROR_STATUS_CLIENT_CERTIFICATE_CONTAINS_ERRORS](https://learn.microsoft.com/en-us/microsoft-edge/webview2/reference/win32/webview2-idl?view=webview2-1.0.2849.39#corewebview2_web_error_status))
  static final OTHER_ERROR = CygnusSslErrorType._internalMultiPlatform(
    'OTHER_ERROR',
    () {
      switch (defaultTargetPlatform) {
        case TargetPlatform.iOS:
          return 7;
        case TargetPlatform.macOS:
          return 7;
        case TargetPlatform.windows:
          return 3;
        default:
          break;
      }
      return null;
    },
  );

  ///Trust is denied, but recovery may be possible.
  ///
  ///This value indicates that you should not trust the chain as is,
  ///but that the chain could be trusted with some minor change to the evaluation context,
  ///such as ignoring expired certificates or adding another anchor to the set of trusted anchors.
  ///
  ///The way you handle this depends on the situation.
  ///For example, if you are performing signature validation and you know when the message was originally received,
  ///you should check again using that date to see if the message was valid when you originally received it.
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- iOS WKWebView ([Official API - SecTrustResultType.recoverableTrustFailure](https://developer.apple.com/documentation/security/sectrustresulttype/recoverabletrustfailure))
  ///- macOS WKWebView ([Official API - SecTrustResultType.recoverableTrustFailure](https://developer.apple.com/documentation/security/sectrustresulttype/recoverabletrustfailure))
  static final RECOVERABLE_TRUST_FAILURE =
      CygnusSslErrorType._internalMultiPlatform(
        'RECOVERABLE_TRUST_FAILURE',
        () {
          switch (defaultTargetPlatform) {
            case TargetPlatform.iOS:
              return 5;
            case TargetPlatform.macOS:
              return 5;
            default:
              break;
          }
          return null;
        },
      );

  ///Indicates that the SSL certificate has been revoked.
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Windows WebView2 ([Official API - COREWEBVIEW2_WEB_ERROR_STATUS_CERTIFICATE_REVOKED](https://learn.microsoft.com/en-us/microsoft-edge/webview2/reference/win32/webview2-idl?view=webview2-1.0.2849.39#corewebview2_web_error_status))
  static final REVOKED = CygnusSslErrorType._internalMultiPlatform(
    'REVOKED',
    () {
      switch (defaultTargetPlatform) {
        case TargetPlatform.windows:
          return 4;
        default:
          break;
      }
      return null;
    },
  );

  ///Indicates the evaluation succeeded and the certificate is implicitly trusted, but user intent was not explicitly specified.
  ///
  ///This value indicates that evaluation reached an (implicitly trusted) anchor certificate without any evaluation failures,
  ///but never encountered any explicitly stated user-trust preference.
  ///This is the most common return value.
  ///The Keychain Access utility refers to this value as the “Use System Policy,” which is the default user setting.
  ///
  ///When receiving this value, most apps should trust the chain.
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- iOS WKWebView ([Official API - SecTrustResultType.unspecified](https://developer.apple.com/documentation/security/sectrustresulttype/unspecified))
  ///- macOS WKWebView ([Official API - SecTrustResultType.unspecified](https://developer.apple.com/documentation/security/sectrustresulttype/unspecified))
  static final UNSPECIFIED = CygnusSslErrorType._internalMultiPlatform(
    'UNSPECIFIED',
    () {
      switch (defaultTargetPlatform) {
        case TargetPlatform.iOS:
          return 4;
        case TargetPlatform.macOS:
          return 4;
        default:
          break;
      }
      return null;
    },
  );

  ///The certificate authority is not trusted.
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView ([Official API - CygnusSslError.SSL_UNTRUSTED](https://developer.android.com/reference/android/net/http/CygnusSslError#SSL_UNTRUSTED))
  static final UNTRUSTED = CygnusSslErrorType._internalMultiPlatform(
    'UNTRUSTED',
    () {
      switch (defaultTargetPlatform) {
        case TargetPlatform.android:
          return 3;
        default:
          break;
      }
      return null;
    },
  );

  ///Set of all values of [CygnusSslErrorType].
  static final Set<CygnusSslErrorType> values = [
    CygnusSslErrorType.COMMON_NAME_IS_INCORRECT,
    CygnusSslErrorType.DATE_INVALID,
    CygnusSslErrorType.DENY,
    CygnusSslErrorType.EXPIRED,
    CygnusSslErrorType.FATAL_TRUST_FAILURE,
    CygnusSslErrorType.IDMISMATCH,
    CygnusSslErrorType.INVALID,
    CygnusSslErrorType.NOT_YET_VALID,
    CygnusSslErrorType.OTHER_ERROR,
    CygnusSslErrorType.RECOVERABLE_TRUST_FAILURE,
    CygnusSslErrorType.REVOKED,
    CygnusSslErrorType.UNSPECIFIED,
    CygnusSslErrorType.UNTRUSTED,
  ].toSet();

  ///Gets a possible [CygnusSslErrorType] instance from [String] value.
  static CygnusSslErrorType? fromValue(String? value) {
    if (value != null) {
      try {
        return CygnusSslErrorType.values.firstWhere(
          (element) => element.toValue() == value,
        );
      } catch (e) {
        return null;
      }
    }
    return null;
  }

  ///Gets a possible [CygnusSslErrorType] instance from a native value.
  static CygnusSslErrorType? fromNativeValue(int? value) {
    if (value != null) {
      try {
        return CygnusSslErrorType.values.firstWhere(
          (element) => element.toNativeValue() == value,
        );
      } catch (e) {
        return null;
      }
    }
    return null;
  }

  /// Gets a possible [CygnusSslErrorType] instance value with name [name].
  ///
  /// Goes through [CygnusSslErrorType.values] looking for a value with
  /// name [name], as reported by [CygnusSslErrorType.name].
  /// Returns the first value with the given name, otherwise `null`.
  static CygnusSslErrorType? byName(String? name) {
    if (name != null) {
      try {
        return CygnusSslErrorType.values.firstWhere(
          (element) => element.name() == name,
        );
      } catch (e) {
        return null;
      }
    }
    return null;
  }

  /// Creates a map from the names of [CygnusSslErrorType] values to the values.
  ///
  /// The collection that this method is called on is expected to have
  /// values with distinct names, like the `values` list of an enum class.
  /// Only one value for each name can occur in the created map,
  /// so if two or more values have the same name (either being the
  /// same value, or being values of different enum type), at most one of
  /// them will be represented in the returned map.
  static Map<String, CygnusSslErrorType> asNameMap() =>
      <String, CygnusSslErrorType>{
        for (final value in CygnusSslErrorType.values) value.name(): value,
      };

  ///Gets [String] value.
  String toValue() => _value;

  ///Gets [int] native value if supported by the current platform, otherwise `null`.
  int? toNativeValue() => _nativeValue;

  ///Gets the name of the value.
  String name() {
    switch (_value) {
      case 'COMMON_NAME_IS_INCORRECT':
        return 'COMMON_NAME_IS_INCORRECT';
      case 'DATE_INVALID':
        return 'DATE_INVALID';
      case 'DENY':
        return 'DENY';
      case 'EXPIRED':
        return 'EXPIRED';
      case 'FATAL_TRUST_FAILURE':
        return 'FATAL_TRUST_FAILURE';
      case 'IDMISMATCH':
        return 'IDMISMATCH';
      case 'INVALID':
        return 'INVALID';
      case 'NOT_YET_VALID':
        return 'NOT_YET_VALID';
      case 'OTHER_ERROR':
        return 'OTHER_ERROR';
      case 'RECOVERABLE_TRUST_FAILURE':
        return 'RECOVERABLE_TRUST_FAILURE';
      case 'REVOKED':
        return 'REVOKED';
      case 'UNSPECIFIED':
        return 'UNSPECIFIED';
      case 'UNTRUSTED':
        return 'UNTRUSTED';
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

///Class that represents the Android-specific primary error associated to the server SSL certificate.
///Used by the [CygnusServerTrustChallenge] class.
///Use [CygnusSslErrorType] instead.
@Deprecated('Use CygnusSslErrorType instead')
class CygnusAndroidSslError {
  final int _value;
  final int? _nativeValue;
  const CygnusAndroidSslError._internal(this._value, this._nativeValue);
  // ignore: unused_element
  factory CygnusAndroidSslError._internalMultiPlatform(
    int value,
    Function nativeValue,
  ) => CygnusAndroidSslError._internal(value, nativeValue());

  ///The date of the certificate is invalid
  static const SSL_DATE_INVALID = CygnusAndroidSslError._internal(4, 4);

  ///The certificate has expired
  static const SSL_EXPIRED = CygnusAndroidSslError._internal(1, 1);

  ///Hostname mismatch
  static const SSL_IDMISMATCH = CygnusAndroidSslError._internal(2, 2);

  ///A generic error occurred
  static const SSL_INVALID = CygnusAndroidSslError._internal(5, 5);

  ///The certificate is not yet valid
  static const SSL_NOTYETVALID = CygnusAndroidSslError._internal(0, 0);

  ///The certificate authority is not trusted
  static const SSL_UNTRUSTED = CygnusAndroidSslError._internal(3, 3);

  ///Set of all values of [CygnusAndroidSslError].
  static final Set<CygnusAndroidSslError> values = [
    CygnusAndroidSslError.SSL_DATE_INVALID,
    CygnusAndroidSslError.SSL_EXPIRED,
    CygnusAndroidSslError.SSL_IDMISMATCH,
    CygnusAndroidSslError.SSL_INVALID,
    CygnusAndroidSslError.SSL_NOTYETVALID,
    CygnusAndroidSslError.SSL_UNTRUSTED,
  ].toSet();

  ///Gets a possible [CygnusAndroidSslError] instance from [int] value.
  static CygnusAndroidSslError? fromValue(int? value) {
    if (value != null) {
      try {
        return CygnusAndroidSslError.values.firstWhere(
          (element) => element.toValue() == value,
        );
      } catch (e) {
        return null;
      }
    }
    return null;
  }

  ///Gets a possible [CygnusAndroidSslError] instance from a native value.
  static CygnusAndroidSslError? fromNativeValue(int? value) {
    if (value != null) {
      try {
        return CygnusAndroidSslError.values.firstWhere(
          (element) => element.toNativeValue() == value,
        );
      } catch (e) {
        return null;
      }
    }
    return null;
  }

  /// Gets a possible [CygnusAndroidSslError] instance value with name [name].
  ///
  /// Goes through [CygnusAndroidSslError.values] looking for a value with
  /// name [name], as reported by [CygnusAndroidSslError.name].
  /// Returns the first value with the given name, otherwise `null`.
  static CygnusAndroidSslError? byName(String? name) {
    if (name != null) {
      try {
        return CygnusAndroidSslError.values.firstWhere(
          (element) => element.name() == name,
        );
      } catch (e) {
        return null;
      }
    }
    return null;
  }

  /// Creates a map from the names of [CygnusAndroidSslError] values to the values.
  ///
  /// The collection that this method is called on is expected to have
  /// values with distinct names, like the `values` list of an enum class.
  /// Only one value for each name can occur in the created map,
  /// so if two or more values have the same name (either being the
  /// same value, or being values of different enum type), at most one of
  /// them will be represented in the returned map.
  static Map<String, CygnusAndroidSslError> asNameMap() =>
      <String, CygnusAndroidSslError>{
        for (final value in CygnusAndroidSslError.values) value.name(): value,
      };

  ///Gets [int] value.
  int toValue() => _value;

  ///Gets [int] native value if supported by the current platform, otherwise `null`.
  int? toNativeValue() => _nativeValue;

  ///Gets the name of the value.
  String name() {
    switch (_value) {
      case 4:
        return 'SSL_DATE_INVALID';
      case 1:
        return 'SSL_EXPIRED';
      case 2:
        return 'SSL_IDMISMATCH';
      case 5:
        return 'SSL_INVALID';
      case 0:
        return 'SSL_NOTYETVALID';
      case 3:
        return 'SSL_UNTRUSTED';
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
    return name();
  }
}

///Class that represents the iOS-specific primary error associated to the server SSL certificate.
///Used by the [CygnusServerTrustChallenge] class.
///Use [CygnusSslErrorType] instead.
@Deprecated('Use CygnusSslErrorType instead')
class CygnusIOSSslError {
  final int _value;
  final int? _nativeValue;
  const CygnusIOSSslError._internal(this._value, this._nativeValue);
  // ignore: unused_element
  factory CygnusIOSSslError._internalMultiPlatform(
    int value,
    Function nativeValue,
  ) => CygnusIOSSslError._internal(value, nativeValue());

  ///Indicates a user-configured deny; do not proceed.
  static const DENY = CygnusIOSSslError._internal(3, 3);

  ///Indicates a trust failure which cannot be overridden by the user.
  static const FATAL_TRUST_FAILURE = CygnusIOSSslError._internal(6, 6);

  ///Indicates an invalid setting or result.
  static const INVALID = CygnusIOSSslError._internal(0, 0);

  ///Indicates a failure other than that of trust evaluation.
  static const OTHER_ERROR = CygnusIOSSslError._internal(7, 7);

  ///Indicates a trust policy failure which can be overridden by the user.
  static const RECOVERABLE_TRUST_FAILURE = CygnusIOSSslError._internal(5, 5);

  ///Indicates the evaluation succeeded and the certificate is implicitly trusted, but user intent was not explicitly specified.
  static const UNSPECIFIED = CygnusIOSSslError._internal(4, 4);

  ///Set of all values of [CygnusIOSSslError].
  static final Set<CygnusIOSSslError> values = [
    CygnusIOSSslError.DENY,
    CygnusIOSSslError.FATAL_TRUST_FAILURE,
    CygnusIOSSslError.INVALID,
    CygnusIOSSslError.OTHER_ERROR,
    CygnusIOSSslError.RECOVERABLE_TRUST_FAILURE,
    CygnusIOSSslError.UNSPECIFIED,
  ].toSet();

  ///Gets a possible [CygnusIOSSslError] instance from [int] value.
  static CygnusIOSSslError? fromValue(int? value) {
    if (value != null) {
      try {
        return CygnusIOSSslError.values.firstWhere(
          (element) => element.toValue() == value,
        );
      } catch (e) {
        return null;
      }
    }
    return null;
  }

  ///Gets a possible [CygnusIOSSslError] instance from a native value.
  static CygnusIOSSslError? fromNativeValue(int? value) {
    if (value != null) {
      try {
        return CygnusIOSSslError.values.firstWhere(
          (element) => element.toNativeValue() == value,
        );
      } catch (e) {
        return null;
      }
    }
    return null;
  }

  /// Gets a possible [CygnusIOSSslError] instance value with name [name].
  ///
  /// Goes through [CygnusIOSSslError.values] looking for a value with
  /// name [name], as reported by [CygnusIOSSslError.name].
  /// Returns the first value with the given name, otherwise `null`.
  static CygnusIOSSslError? byName(String? name) {
    if (name != null) {
      try {
        return CygnusIOSSslError.values.firstWhere(
          (element) => element.name() == name,
        );
      } catch (e) {
        return null;
      }
    }
    return null;
  }

  /// Creates a map from the names of [CygnusIOSSslError] values to the values.
  ///
  /// The collection that this method is called on is expected to have
  /// values with distinct names, like the `values` list of an enum class.
  /// Only one value for each name can occur in the created map,
  /// so if two or more values have the same name (either being the
  /// same value, or being values of different enum type), at most one of
  /// them will be represented in the returned map.
  static Map<String, CygnusIOSSslError> asNameMap() =>
      <String, CygnusIOSSslError>{
        for (final value in CygnusIOSSslError.values) value.name(): value,
      };

  ///Gets [int] value.
  int toValue() => _value;

  ///Gets [int] native value if supported by the current platform, otherwise `null`.
  int? toNativeValue() => _nativeValue;

  ///Gets the name of the value.
  String name() {
    switch (_value) {
      case 3:
        return 'DENY';
      case 6:
        return 'FATAL_TRUST_FAILURE';
      case 0:
        return 'INVALID';
      case 7:
        return 'OTHER_ERROR';
      case 5:
        return 'RECOVERABLE_TRUST_FAILURE';
      case 4:
        return 'UNSPECIFIED';
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
    return name();
  }
}
