import 'package:flutter_inappwebview_internal_annotations/flutter_inappwebview_internal_annotations.dart';

part 'url_credential_persistence.g.dart';

///Class that represents the constants that specify how long the credential will be kept.
@ExchangeableEnum()
class CygnusURLCredentialPersistence_ {
  // ignore: unused_field
  final int _value;
  const CygnusURLCredentialPersistence_._internal(this._value);

  ///The credential should not be stored.
  static const NONE = const CygnusURLCredentialPersistence_._internal(0);

  ///The credential should be stored only for this session
  static const FOR_SESSION = const CygnusURLCredentialPersistence_._internal(1);

  ///The credential should be stored in the keychain.
  static const PERMANENT = const CygnusURLCredentialPersistence_._internal(2);

  ///The credential should be stored permanently in the keychain,
  ///and in addition should be distributed to other devices based on the owning Apple ID.
  static const SYNCHRONIZABLE = const CygnusURLCredentialPersistence_._internal(3);
}

///An iOS-specific class that represents the constants that specify how long the credential will be kept.
///Use [CygnusURLCredentialPersistence] instead.
@Deprecated("Use CygnusURLCredentialPersistence instead")
@ExchangeableEnum()
class CygnusIOSURLCredentialPersistence_ {
  // ignore: unused_field
  final int _value;
  const CygnusIOSURLCredentialPersistence_._internal(this._value);

  ///The credential should not be stored.
  static const NONE = const CygnusIOSURLCredentialPersistence_._internal(0);

  ///The credential should be stored only for this session
  static const FOR_SESSION = const CygnusIOSURLCredentialPersistence_._internal(1);

  ///The credential should be stored in the keychain.
  static const PERMANENT = const CygnusIOSURLCredentialPersistence_._internal(2);

  ///The credential should be stored permanently in the keychain,
  ///and in addition should be distributed to other devices based on the owning Apple ID.
  static const SYNCHRONIZABLE = const CygnusIOSURLCredentialPersistence_._internal(3);
}
