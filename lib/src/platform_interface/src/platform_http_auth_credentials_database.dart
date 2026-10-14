import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:flutter_inappwebview_internal_annotations/flutter_inappwebview_internal_annotations.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'webview_platform.dart';
import 'types/main.dart';

part 'platform_http_auth_credentials_database.g.dart';

///{@template cygnus_core.CygnusPlatformHttpAuthCredentialDatabaseCreationParams}
/// Object specifying creation parameters for creating a [CygnusPlatformHttpAuthCredentialDatabase].
///
/// Platform specific implementations can add additional fields by extending
/// this class.
///{@endtemplate}
///
///{@macro cygnus_core.CygnusPlatformHttpAuthCredentialDatabaseCreationParams.supported_platforms}
@SupportedPlatforms(
  platforms: [
    AndroidPlatform(),
    IOSPlatform(),
    MacOSPlatform(),
    LinuxPlatform(),
  ],
)
@immutable
class CygnusPlatformHttpAuthCredentialDatabaseCreationParams {
  /// Used by the platform implementation to create a new [CygnusPlatformHttpAuthCredentialDatabase].
  const CygnusPlatformHttpAuthCredentialDatabaseCreationParams();

  ///{@template cygnus_core.CygnusPlatformHttpAuthCredentialDatabaseCreationParams.isClassSupported}
  ///Check if the current class is supported by the [defaultTargetPlatform] or a specific [platform].
  ///{@endtemplate}
  bool isClassSupported({TargetPlatform? platform}) =>
      _CygnusPlatformHttpAuthCredentialDatabaseCreationParamsClassSupported.isClassSupported(
        platform: platform,
      );
}

///{@template cygnus_core.CygnusPlatformHttpAuthCredentialDatabase}
///Class that implements a singleton object (shared instance) which manages the shared HTTP auth credentials cache.
///{@endtemplate}
///
///{@macro cygnus_core.CygnusPlatformHttpAuthCredentialDatabase.supported_platforms}
@SupportedPlatforms(
  platforms: [
    AndroidPlatform(
      note:
          'It has a custom implementation using `android.database.sqlite.SQLiteDatabase` because [WebViewDatabase](https://developer.android.com/reference/android/webkit/WebViewDatabase) doesn\'t offer the same functionalities as iOS/macOS `URLCredentialStorage`.',
    ),
    IOSPlatform(
      note:
          'It is implemented using the [URLCredentialStorage](https://developer.apple.com/documentation/foundation/urlcredentialstorage) class.',
    ),
    MacOSPlatform(
      note:
          'It is implemented using the [URLCredentialStorage](https://developer.apple.com/documentation/foundation/urlcredentialstorage) class.',
    ),
    LinuxPlatform(
      note:
          'Implemented using libsecret for secure credential storage in the system keyring (gnome-keyring, KDE Wallet, etc.).',
    ),
  ],
)
abstract class CygnusPlatformHttpAuthCredentialDatabase extends PlatformInterface {
  /// Creates a new [CygnusPlatformHttpAuthCredentialDatabase]
  factory CygnusPlatformHttpAuthCredentialDatabase(
    CygnusPlatformHttpAuthCredentialDatabaseCreationParams params,
  ) {
    assert(
      CygnusWebViewPlatform.instance != null,
      'A platform implementation for `flutter_inappwebview` has not been set. Please '
      'ensure that an implementation of `CygnusWebViewPlatform` has been set to '
      '`WebViewPlatform.instance` before use. For unit testing, '
      '`WebViewPlatform.instance` can be set with your own test implementation.',
    );
    final CygnusPlatformHttpAuthCredentialDatabase cookieManager =
        CygnusWebViewPlatform.instance!.createPlatformHttpAuthCredentialDatabase(
          params,
        );
    PlatformInterface.verify(cookieManager, _token);
    return cookieManager;
  }

  /// Creates a new [CygnusPlatformHttpAuthCredentialDatabase] to access static methods.
  factory CygnusPlatformHttpAuthCredentialDatabase.static() {
    assert(
      CygnusWebViewPlatform.instance != null,
      'A platform implementation for `flutter_inappwebview` has not been set. Please '
      'ensure that an implementation of `CygnusWebViewPlatform` has been set to '
      '`CygnusWebViewPlatform.instance` before use. For unit testing, '
      '`CygnusWebViewPlatform.instance` can be set with your own test implementation.',
    );
    final CygnusPlatformHttpAuthCredentialDatabase httpAuthCredentialDatabaseStatic =
        CygnusWebViewPlatform.instance!
            .createPlatformHttpAuthCredentialDatabaseStatic();
    PlatformInterface.verify(httpAuthCredentialDatabaseStatic, _token);
    return httpAuthCredentialDatabaseStatic;
  }

  /// Used by the platform implementation to create a new
  /// [CygnusPlatformHttpAuthCredentialDatabase].
  ///
  /// Should only be used by platform implementations because they can't extend
  /// a class that only contains a factory constructor.
  @protected
  CygnusPlatformHttpAuthCredentialDatabase.implementation(this.params)
    : super(token: _token);

  static final Object _token = Object();

  /// The parameters used to initialize the [CygnusPlatformHttpAuthCredentialDatabase].
  final CygnusPlatformHttpAuthCredentialDatabaseCreationParams params;

  ///{@template cygnus_core.CygnusPlatformHttpAuthCredentialDatabase.getAllAuthCredentials}
  ///Gets a map list of all HTTP auth credentials saved.
  ///Each map contains the key `protectionSpace` of type [CygnusURLProtectionSpace]
  ///and the key `credentials` of type List<[CygnusURLCredential]> that contains all the HTTP auth credentials saved for that `protectionSpace`.
  ///{@endtemplate}
  ///
  ///{@macro cygnus_core.CygnusPlatformHttpAuthCredentialDatabase.getAllAuthCredentials.supported_platforms}
  @SupportedPlatforms(
    platforms: [
      AndroidPlatform(),
      IOSPlatform(
        apiName: 'URLCredentialStorage.allCredentials',
        apiUrl:
            'https://developer.apple.com/documentation/foundation/urlcredentialstorage/1413859-allcredentials',
      ),
      MacOSPlatform(
        apiName: 'URLCredentialStorage.allCredentials',
        apiUrl:
            'https://developer.apple.com/documentation/foundation/urlcredentialstorage/1413859-allcredentials',
      ),
      LinuxPlatform(note: 'Implemented using libsecret for secure storage.'),
    ],
  )
  Future<List<CygnusURLProtectionSpaceHttpAuthCredentials>> getAllAuthCredentials() {
    throw UnimplementedError(
      'getAllAuthCredentials is not implemented on the current platform',
    );
  }

  ///{@template cygnus_core.CygnusPlatformHttpAuthCredentialDatabase.getHttpAuthCredentials}
  ///Gets all the HTTP auth credentials saved for that [protectionSpace].
  ///{@endtemplate}
  ///
  ///{@macro cygnus_core.CygnusPlatformHttpAuthCredentialDatabase.getHttpAuthCredentials.supported_platforms}
  @SupportedPlatforms(
    platforms: [
      AndroidPlatform(),
      IOSPlatform(),
      MacOSPlatform(),
      LinuxPlatform(),
    ],
  )
  Future<List<CygnusURLCredential>> getHttpAuthCredentials({
    required CygnusURLProtectionSpace protectionSpace,
  }) {
    throw UnimplementedError(
      'getHttpAuthCredentials is not implemented on the current platform',
    );
  }

  ///{@template cygnus_core.CygnusPlatformHttpAuthCredentialDatabase.setHttpAuthCredential}
  ///Saves an HTTP auth [credential] for that [protectionSpace].
  ///{@endtemplate}
  ///
  ///{@macro cygnus_core.CygnusPlatformHttpAuthCredentialDatabase.setHttpAuthCredential.supported_platforms}
  @SupportedPlatforms(
    platforms: [
      AndroidPlatform(),
      IOSPlatform(
        apiName: 'URLCredentialStorage.set',
        apiUrl:
            'https://developer.apple.com/documentation/foundation/urlcredentialstorage/1407227-set',
      ),
      MacOSPlatform(
        apiName: 'URLCredentialStorage.set',
        apiUrl:
            'https://developer.apple.com/documentation/foundation/urlcredentialstorage/1407227-set',
      ),
      LinuxPlatform(note: 'Implemented using libsecret for secure storage.'),
    ],
  )
  Future<void> setHttpAuthCredential({
    required CygnusURLProtectionSpace protectionSpace,
    required CygnusURLCredential credential,
  }) {
    throw UnimplementedError(
      'setHttpAuthCredential is not implemented on the current platform',
    );
  }

  ///{@template cygnus_core.CygnusPlatformHttpAuthCredentialDatabase.removeHttpAuthCredential}
  ///Removes an HTTP auth [credential] for that [protectionSpace].
  ///{@endtemplate}
  ///
  ///{@macro cygnus_core.CygnusPlatformHttpAuthCredentialDatabase.removeHttpAuthCredential.supported_platforms}
  @SupportedPlatforms(
    platforms: [
      AndroidPlatform(),
      IOSPlatform(
        apiName: 'URLCredentialStorage.remove',
        apiUrl:
            'https://developer.apple.com/documentation/foundation/urlcredentialstorage/1408664-remove',
      ),
      MacOSPlatform(
        apiName: 'URLCredentialStorage.remove',
        apiUrl:
            'https://developer.apple.com/documentation/foundation/urlcredentialstorage/1408664-remove',
      ),
      LinuxPlatform(note: 'Implemented using libsecret for secure storage.'),
    ],
  )
  Future<void> removeHttpAuthCredential({
    required CygnusURLProtectionSpace protectionSpace,
    required CygnusURLCredential credential,
  }) {
    throw UnimplementedError(
      'removeHttpAuthCredential is not implemented on the current platform',
    );
  }

  ///{@template cygnus_core.CygnusPlatformHttpAuthCredentialDatabase.removeHttpAuthCredentials}
  ///Removes all the HTTP auth credentials saved for that [protectionSpace].
  ///{@endtemplate}
  ///
  ///{@macro cygnus_core.CygnusPlatformHttpAuthCredentialDatabase.removeHttpAuthCredentials.supported_platforms}
  @SupportedPlatforms(
    platforms: [
      AndroidPlatform(),
      IOSPlatform(),
      MacOSPlatform(),
      LinuxPlatform(),
    ],
  )
  Future<void> removeHttpAuthCredentials({
    required CygnusURLProtectionSpace protectionSpace,
  }) {
    throw UnimplementedError(
      'removeHttpAuthCredentials is not implemented on the current platform',
    );
  }

  ///{@template cygnus_core.CygnusPlatformHttpAuthCredentialDatabase.clearAllAuthCredentials}
  ///Removes all the HTTP auth credentials saved in the database.
  ///{@endtemplate}
  ///
  ///{@macro cygnus_core.CygnusPlatformHttpAuthCredentialDatabase.clearAllAuthCredentials.supported_platforms}
  @SupportedPlatforms(
    platforms: [
      AndroidPlatform(),
      IOSPlatform(),
      MacOSPlatform(),
      LinuxPlatform(),
    ],
  )
  Future<void> clearAllAuthCredentials() {
    throw UnimplementedError(
      'clearAllAuthCredentials is not implemented on the current platform',
    );
  }

  ///{@macro cygnus_core.CygnusPlatformHttpAuthCredentialDatabaseCreationParams.isClassSupported}
  bool isClassSupported({TargetPlatform? platform}) =>
      params.isClassSupported(platform: platform);

  ///{@template cygnus_core.CygnusPlatformHttpAuthCredentialDatabase.isMethodSupported}
  ///Check if the given [method] is supported by the [defaultTargetPlatform] or a specific [platform].
  ///{@endtemplate}
  bool isMethodSupported(
    CygnusPlatformHttpAuthCredentialDatabaseMethod method, {
    TargetPlatform? platform,
  }) => _CygnusPlatformHttpAuthCredentialDatabaseMethodSupported.isMethodSupported(
    method,
    platform: platform,
  );
}
