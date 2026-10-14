// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ssl_error.dart';

// **************************************************************************
// ExchangeableObjectGenerator
// **************************************************************************

///Class that represents an SSL Error.
class CygnusSslError {
  ///Use [code] instead.
  @Deprecated('Use code instead')
  CygnusAndroidSslError? androidError;

  ///Primary code error associated to the server SSL certificate.
  ///It represents the most severe SSL error.
  CygnusSslErrorType? code;

  ///Use [code] instead.
  @Deprecated('Use code instead')
  CygnusIOSSslError? iosError;

  ///The message associated to the [code].
  String? message;
  CygnusSslError({
    @Deprecated('Use code instead') this.androidError,
    this.code,
    @Deprecated('Use code instead') this.iosError,
    this.message,
  }) {
    code =
        code ??
        CygnusSslErrorType.fromNativeValue(androidError?.toNativeValue());
    code =
        code ?? CygnusSslErrorType.fromNativeValue(iosError?.toNativeValue());
  }

  ///Gets a possible [CygnusSslError] instance from a [Map] value.
  static CygnusSslError? fromMap(
    Map<String, dynamic>? map, {
    CygnusEnumMethod? enumMethod,
  }) {
    if (map == null) {
      return null;
    }
    final instance = CygnusSslError(
      androidError: switch (enumMethod ?? CygnusEnumMethod.nativeValue) {
        CygnusEnumMethod.nativeValue => CygnusAndroidSslError.fromNativeValue(
          map['code'],
        ),
        CygnusEnumMethod.value => CygnusAndroidSslError.fromValue(map['code']),
        CygnusEnumMethod.name => CygnusAndroidSslError.byName(map['code']),
      },
      code: switch (enumMethod ?? CygnusEnumMethod.nativeValue) {
        CygnusEnumMethod.nativeValue => CygnusSslErrorType.fromNativeValue(
          map['code'],
        ),
        CygnusEnumMethod.value => CygnusSslErrorType.fromValue(map['code']),
        CygnusEnumMethod.name => CygnusSslErrorType.byName(map['code']),
      },
      iosError: switch (enumMethod ?? CygnusEnumMethod.nativeValue) {
        CygnusEnumMethod.nativeValue => CygnusIOSSslError.fromNativeValue(
          map['code'],
        ),
        CygnusEnumMethod.value => CygnusIOSSslError.fromValue(map['code']),
        CygnusEnumMethod.name => CygnusIOSSslError.byName(map['code']),
      },
      message: map['message'],
    );
    return instance;
  }

  ///Converts instance to a map.
  Map<String, dynamic> toMap({CygnusEnumMethod? enumMethod}) {
    return {
      "code": switch (enumMethod ?? CygnusEnumMethod.nativeValue) {
        CygnusEnumMethod.nativeValue => code?.toNativeValue(),
        CygnusEnumMethod.value => code?.toValue(),
        CygnusEnumMethod.name => code?.name(),
      },
      "message": message,
    };
  }

  ///Converts instance to a map.
  Map<String, dynamic> toJson() {
    return toMap();
  }

  @override
  String toString() {
    return 'CygnusSslError{code: $code, message: $message}';
  }
}
