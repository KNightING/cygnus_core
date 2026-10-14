import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter_inappwebview_internal_annotations/flutter_inappwebview_internal_annotations.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';
import '../debug_logging_settings.dart';
import '../inappwebview_platform.dart';
import '../types/main.dart';
import '../web_uri.dart';
import 'web_authenticate_session_settings.dart';

// ignore: uri_has_not_been_generated
part 'platform_web_authenticate_session.g.dart';

///A completion handler for the [CygnusPlatformWebAuthenticationSession].
typedef CygnusWebAuthenticationSessionCompletionHandler =
    Future<void> Function(CygnusWebUri? url, CygnusWebAuthenticationSessionError? error)?;

///{@template cygnus_core.CygnusPlatformWebAuthenticationSessionCreationParams}
/// Object specifying creation parameters for creating a [CygnusPlatformWebAuthenticationSession].
///
/// Platform specific implementations can add additional fields by extending
/// this class.
///{@endtemplate}
///
///{@macro cygnus_core.CygnusPlatformWebAuthenticationSessionCreationParams.supported_platforms}
@SupportedPlatforms(
  platforms: [
    IOSPlatform(available: '11.0'),
    MacOSPlatform(available: '10.15'),
  ],
)
@immutable
class CygnusPlatformWebAuthenticationSessionCreationParams {
  /// Used by the platform implementation to create a new [CygnusPlatformWebAuthenticationSession].
  const CygnusPlatformWebAuthenticationSessionCreationParams();

  ///{@template cygnus_core.CygnusPlatformWebAuthenticationSessionCreationParams.isClassSupported}
  ///Check if the current class is supported by the [defaultTargetPlatform] or a specific [platform].
  ///{@endtemplate}
  bool isClassSupported({TargetPlatform? platform}) =>
      _CygnusPlatformWebAuthenticationSessionCreationParamsClassSupported.isClassSupported(
        platform: platform,
      );
}

///{@template cygnus_core.CygnusPlatformWebAuthenticationSession}
///A session that an app uses to authenticate a user through a web service.
///
///It is implemented using [ASWebAuthenticationSession](https://developer.apple.com/documentation/authenticationservices/aswebauthenticationsession) on iOS 12.0+ and MacOS 10.15+
///and [SFAuthenticationSession](https://developer.apple.com/documentation/safariservices/sfauthenticationsession) on iOS 11.0.
///
///Use an [CygnusPlatformWebAuthenticationSession] instance to authenticate a user through a web service, including one run by a third party.
///Initialize the session with a URL that points to the authentication webpage.
///A browser loads and displays the page, from which the user can authenticate.
///In iOS, the browser is a secure, embedded web view.
///In macOS, the system opens the user's default browser if it supports web authentication sessions, or Safari otherwise.
///
///On completion, the service sends a callback URL to the session with an authentication token, and the session passes this URL back to the app through a completion handler.
///[CygnusPlatformWebAuthenticationSession] ensures that only the calling app's session receives the authentication callback, even when more than one app registers the same callback URL scheme.
///
///**NOTE**: Remember to dispose it when you don't need it anymore.
///{@endtemplate}
///
///{@macro cygnus_core.CygnusPlatformWebAuthenticationSession.supported_platforms}
@SupportedPlatforms(
  platforms: [
    IOSPlatform(available: '11.0'),
    MacOSPlatform(available: '10.15'),
  ],
)
abstract class CygnusPlatformWebAuthenticationSession extends PlatformInterface
    implements CygnusDisposable {
  ///Debug settings.
  static CygnusDebugLoggingSettings debugLoggingSettings = CygnusDebugLoggingSettings();

  /// Creates a new [CygnusPlatformWebAuthenticationSession]
  factory CygnusPlatformWebAuthenticationSession(
    CygnusPlatformWebAuthenticationSessionCreationParams params,
  ) {
    assert(
      CygnusWebViewPlatform.instance != null,
      'A platform implementation for `flutter_inappwebview` has not been set. Please '
      'ensure that an implementation of `CygnusWebViewPlatform` has been set to '
      '`CygnusWebViewPlatform.instance` before use. For unit testing, '
      '`CygnusWebViewPlatform.instance` can be set with your own test implementation.',
    );
    final CygnusPlatformWebAuthenticationSession webAuthenticationSession =
        CygnusWebViewPlatform.instance!.createPlatformWebAuthenticationSession(
          params,
        );
    PlatformInterface.verify(webAuthenticationSession, _token);
    return webAuthenticationSession;
  }

  /// Creates a new [CygnusPlatformWebAuthenticationSession] to access static methods.
  factory CygnusPlatformWebAuthenticationSession.static() {
    assert(
      CygnusWebViewPlatform.instance != null,
      'A platform implementation for `flutter_inappwebview` has not been set. Please '
      'ensure that an implementation of `CygnusWebViewPlatform` has been set to '
      '`CygnusWebViewPlatform.instance` before use. For unit testing, '
      '`CygnusWebViewPlatform.instance` can be set with your own test implementation.',
    );
    final CygnusPlatformWebAuthenticationSession webAuthenticationSessionStatic =
        CygnusWebViewPlatform.instance!
            .createPlatformWebAuthenticationSessionStatic();
    PlatformInterface.verify(webAuthenticationSessionStatic, _token);
    return webAuthenticationSessionStatic;
  }

  /// Used by the platform implementation to create a new [CygnusPlatformWebAuthenticationSession].
  ///
  /// Should only be used by platform implementations because they can't extend
  /// a class that only contains a factory constructor.
  @protected
  CygnusPlatformWebAuthenticationSession.implementation(this.params)
    : super(token: _token);

  static final Object _token = Object();

  /// The parameters used to initialize the [CygnusPlatformWebAuthenticationSession].
  final CygnusPlatformWebAuthenticationSessionCreationParams params;

  ///{@template cygnus_core.CygnusPlatformWebAuthenticationSession.id}
  ///ID used internally.
  ///{@endtemplate}
  ///
  ///{@macro cygnus_core.CygnusPlatformWebAuthenticationSession.id.supported_platforms}
  @SupportedPlatforms(platforms: [IOSPlatform(), MacOSPlatform()])
  String get id =>
      throw UnimplementedError('id is not implemented on the current platform');

  ///{@template cygnus_core.CygnusPlatformWebAuthenticationSession.url}
  ///A URL with the `http` or `https` scheme pointing to the authentication webpage.
  ///{@endtemplate}
  ///
  ///{@macro cygnus_core.CygnusPlatformWebAuthenticationSession.url.supported_platforms}
  @SupportedPlatforms(platforms: [IOSPlatform(), MacOSPlatform()])
  CygnusWebUri get url => throw UnimplementedError(
    'url is not implemented on the current platform',
  );

  ///{@template cygnus_core.CygnusPlatformWebAuthenticationSession.callbackURLScheme}
  ///The custom URL scheme that the app expects in the callback URL.
  ///{@endtemplate}
  ///
  ///{@macro cygnus_core.CygnusPlatformWebAuthenticationSession.callbackURLScheme.supported_platforms}
  @SupportedPlatforms(platforms: [IOSPlatform(), MacOSPlatform()])
  String? get callbackURLScheme => throw UnimplementedError(
    'callbackURLScheme is not implemented on the current platform',
  );

  ///{@template cygnus_core.CygnusPlatformWebAuthenticationSession.initialSettings}
  ///Initial settings.
  ///{@endtemplate}
  ///
  ///{@macro cygnus_core.CygnusPlatformWebAuthenticationSession.initialSettings.supported_platforms}
  @SupportedPlatforms(platforms: [IOSPlatform(), MacOSPlatform()])
  CygnusWebAuthenticationSessionSettings? get initialSettings =>
      throw UnimplementedError(
        'initialSettings is not implemented on the current platform',
      );

  ///{@template cygnus_core.CygnusPlatformWebAuthenticationSession.onComplete}
  ///A completion handler the session calls when it completes successfully, or when the user cancels the session.
  ///{@endtemplate}
  ///
  ///{@macro cygnus_core.CygnusPlatformWebAuthenticationSession.onComplete.supported_platforms}
  @SupportedPlatforms(platforms: [IOSPlatform(), MacOSPlatform()])
  CygnusWebAuthenticationSessionCompletionHandler get onComplete =>
      throw UnimplementedError(
        'onComplete is not implemented on the current platform',
      );

  ///{@template cygnus_core.CygnusPlatformWebAuthenticationSession.create}
  ///Used to create and initialize a session.
  ///
  ///[url] represents a URL with the `http` or `https` scheme pointing to the authentication webpage.
  ///
  ///[callbackURLScheme] represents the custom URL scheme that the app expects in the callback URL.
  ///
  ///[onComplete] represents a completion handler the session calls when it completes successfully, or when the user cancels the session.
  ///
  ///[initialSettings] represents initial settings.
  ///{@endtemplate}
  ///
  ///{@macro cygnus_core.CygnusPlatformWebAuthenticationSession.create.supported_platforms}
  @SupportedPlatforms(platforms: [IOSPlatform(), MacOSPlatform()])
  Future<CygnusPlatformWebAuthenticationSession> create({
    required CygnusWebUri url,
    String? callbackURLScheme,
    CygnusWebAuthenticationSessionCompletionHandler onComplete,
    CygnusWebAuthenticationSessionSettings? initialSettings,
  }) {
    throw UnimplementedError(
      'create is not implemented on the current platform',
    );
  }

  ///{@template cygnus_core.CygnusPlatformWebAuthenticationSession.canStart}
  ///Indicates whether the session can begin.
  ///{@endtemplate}
  ///
  ///{@macro cygnus_core.CygnusPlatformWebAuthenticationSession.canStart.supported_platforms}
  @SupportedPlatforms(
    platforms: [
      IOSPlatform(
        apiName: 'ASWebAuthenticationSession.canStart',
        apiUrl:
            'https://developer.apple.com/documentation/authenticationservices/aswebauthenticationsession/3516277-canstart',
      ),
      MacOSPlatform(
        apiName: 'ASWebAuthenticationSession.canStart',
        apiUrl:
            'https://developer.apple.com/documentation/authenticationservices/aswebauthenticationsession/3516277-canstart',
      ),
    ],
  )
  Future<bool> canStart() {
    throw UnimplementedError(
      'canStart is not implemented on the current platform',
    );
  }

  ///{@template cygnus_core.CygnusPlatformWebAuthenticationSession.start}
  ///Starts the web authentication session.
  ///
  ///Returns a boolean value indicating whether the web authentication session started successfully.
  ///
  ///Only call this method once for a given [CygnusPlatformWebAuthenticationSession] instance after initialization.
  ///Calling the [start] method on a canceled session results in a failure.
  ///{@endtemplate}
  ///
  ///{@macro cygnus_core.CygnusPlatformWebAuthenticationSession.start.supported_platforms}
  @SupportedPlatforms(
    platforms: [
      IOSPlatform(
        apiName: 'ASWebAuthenticationSession.start',
        apiUrl:
            'https://developer.apple.com/documentation/authenticationservices/aswebauthenticationsession/2990953-start',
      ),
      MacOSPlatform(
        apiName: 'ASWebAuthenticationSession.start',
        apiUrl:
            'https://developer.apple.com/documentation/authenticationservices/aswebauthenticationsession/2990953-start',
      ),
    ],
  )
  Future<bool> start() {
    throw UnimplementedError(
      'start is not implemented on the current platform',
    );
  }

  ///{@template cygnus_core.CygnusPlatformWebAuthenticationSession.cancel}
  ///Cancels the web authentication session.
  ///
  ///If the session has already presented a view with the authentication webpage, calling this method dismisses that view.
  ///Calling [cancel] on an already canceled session has no effect.
  ///{@endtemplate}
  ///
  ///{@macro cygnus_core.CygnusPlatformWebAuthenticationSession.cancel.supported_platforms}
  @SupportedPlatforms(
    platforms: [
      IOSPlatform(
        apiName: 'ASWebAuthenticationSession.cancel',
        apiUrl:
            'https://developer.apple.com/documentation/authenticationservices/aswebauthenticationsession/2990951-cancel',
      ),
      MacOSPlatform(
        apiName: 'ASWebAuthenticationSession.cancel',
        apiUrl:
            'https://developer.apple.com/documentation/authenticationservices/aswebauthenticationsession/2990951-cancel',
      ),
    ],
  )
  Future<void> cancel() {
    throw UnimplementedError(
      'cancel is not implemented on the current platform',
    );
  }

  ///{@template cygnus_core.CygnusPlatformWebAuthenticationSession.dispose}
  ///Disposes the web authentication session.
  ///{@endtemplate}
  ///
  ///{@macro cygnus_core.CygnusPlatformWebAuthenticationSession.dispose.supported_platforms}
  @SupportedPlatforms(platforms: [IOSPlatform(), MacOSPlatform()])
  @override
  Future<void> dispose() {
    throw UnimplementedError(
      'dispose is not implemented on the current platform',
    );
  }

  ///{@template cygnus_core.CygnusPlatformWebAuthenticationSession.isAvailable}
  ///Returns `true` if [ASWebAuthenticationSession](https://developer.apple.com/documentation/authenticationservices/aswebauthenticationsession)
  ///or [SFAuthenticationSession](https://developer.apple.com/documentation/safariservices/sfauthenticationsession) is available.
  ///Otherwise returns `false`.
  ///{@endtemplate}
  ///
  ///{@macro cygnus_core.CygnusPlatformWebAuthenticationSession.isAvailable.supported_platforms}
  @SupportedPlatforms(platforms: [IOSPlatform(), MacOSPlatform()])
  Future<bool> isAvailable() {
    throw UnimplementedError(
      'isAvailable is not implemented on the current platform',
    );
  }

  ///{@macro cygnus_core.CygnusPlatformWebAuthenticationSessionCreationParams.isClassSupported}
  bool isClassSupported({TargetPlatform? platform}) =>
      _CygnusPlatformWebAuthenticationSessionClassSupported.isClassSupported(
        platform: platform,
      );

  ///{@template cygnus_core.CygnusPlatformWebAuthenticationSession.isPropertySupported}
  ///Check if the given [property] is supported by the [defaultTargetPlatform] or a specific [platform].
  ///{@endtemplate}
  bool isPropertySupported(
    CygnusPlatformWebAuthenticationSessionProperty property, {
    TargetPlatform? platform,
  }) => _CygnusPlatformWebAuthenticationSessionPropertySupported.isPropertySupported(
    property,
    platform: platform,
  );

  ///{@template cygnus_core.CygnusPlatformWebAuthenticationSession.isMethodSupported}
  ///Check if the given [method] is supported by the [defaultTargetPlatform] or a specific [platform].
  ///{@endtemplate}
  bool isMethodSupported(
    CygnusPlatformWebAuthenticationSessionMethod method, {
    TargetPlatform? platform,
  }) => _CygnusPlatformWebAuthenticationSessionMethodSupported.isMethodSupported(
    method,
    platform: platform,
  );
}
