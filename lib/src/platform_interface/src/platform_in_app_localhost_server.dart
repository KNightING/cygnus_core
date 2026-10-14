import 'dart:async';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter_inappwebview_internal_annotations/flutter_inappwebview_internal_annotations.dart';
import 'package:cygnus_core/src/platform_interface/flutter_inappwebview_platform_interface.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

part 'platform_in_app_localhost_server.g.dart';

///{@template cygnus_core.CygnusPlatformLocalhostServerCreationParams}
/// Object specifying creation parameters for creating a [CygnusPlatformLocalhostServer].
///
/// Platform specific implementations can add additional fields by extending
/// this class.
///{@endtemplate}
///
///{@macro cygnus_core.CygnusPlatformLocalhostServerCreationParams.supported_platforms}
@SupportedPlatforms(
  platforms: [
    AndroidPlatform(),
    IOSPlatform(),
    MacOSPlatform(),
    WindowsPlatform(),
    LinuxPlatform(),
  ],
)
@immutable
class CygnusPlatformLocalhostServerCreationParams {
  /// Used by the platform implementation to create a new [CygnusPlatformLocalhostServer].
  const CygnusPlatformLocalhostServerCreationParams({
    this.port = 8080,
    this.directoryIndex = 'index.html',
    this.documentRoot = './',
    this.shared = false,
    this.onData = null,
  });

  ///{@macro cygnus_core.CygnusPlatformLocalhostServer.port}
  final int port;

  ///{@macro cygnus_core.CygnusPlatformLocalhostServer.directoryIndex}
  final String directoryIndex;

  ///{@macro cygnus_core.CygnusPlatformLocalhostServer.documentRoot}
  final String documentRoot;

  ///{@macro cygnus_core.CygnusPlatformLocalhostServer.shared}
  final bool shared;

  ///{@macro cygnus_core.CygnusPlatformLocalhostServer.onData}
  final Future<bool> Function(HttpRequest request)? onData;

  ///{@template cygnus_core.CygnusPlatformLocalhostServerCreationParams.isClassSupported}
  ///Check if the current class is supported by the [defaultTargetPlatform] or a specific [platform].
  ///{@endtemplate}
  bool isClassSupported({TargetPlatform? platform}) =>
      _CygnusPlatformLocalhostServerCreationParamsClassSupported.isClassSupported(
        platform: platform,
      );
}

///{@template cygnus_core.CygnusPlatformLocalhostServer}
///This class allows you to create a simple server on `http://localhost:[port]/`
///in order to be able to load your assets file on a local server.
///The default `port` value is `8080`.
///{@endtemplate}
///
///{@macro cygnus_core.CygnusPlatformLocalhostServer.supported_platforms}
@SupportedPlatforms(
  platforms: [
    AndroidPlatform(),
    IOSPlatform(),
    MacOSPlatform(),
    WindowsPlatform(),
    LinuxPlatform(),
  ],
)
abstract class CygnusPlatformLocalhostServer extends PlatformInterface {
  /// Creates a new [CygnusPlatformLocalhostServer]
  factory CygnusPlatformLocalhostServer(
    CygnusPlatformLocalhostServerCreationParams params,
  ) {
    assert(
      CygnusWebViewPlatform.instance != null,
      'A platform implementation for `flutter_inappwebview` has not been set. Please '
      'ensure that an implementation of `CygnusWebViewPlatform` has been set to '
      '`WebViewPlatform.instance` before use. For unit testing, '
      '`WebViewPlatform.instance` can be set with your own test implementation.',
    );
    final CygnusPlatformLocalhostServer inAppLocalhostServer =
        CygnusWebViewPlatform.instance!.createPlatformInAppLocalhostServer(
          params,
        );
    PlatformInterface.verify(inAppLocalhostServer, _token);
    return inAppLocalhostServer;
  }

  /// Creates a new empty [CygnusPlatformLocalhostServer] to access static methods.
  factory CygnusPlatformLocalhostServer.static() {
    assert(
      CygnusWebViewPlatform.instance != null,
      'A platform implementation for `flutter_inappwebview` has not been set. Please '
      'ensure that an implementation of `CygnusWebViewPlatform` has been set to '
      '`CygnusWebViewPlatform.instance` before use. For unit testing, '
      '`CygnusWebViewPlatform.instance` can be set with your own test implementation.',
    );
    final CygnusPlatformLocalhostServer inAppLocalhostServerStatic =
        CygnusWebViewPlatform.instance!
            .createPlatformInAppLocalhostServerStatic();
    PlatformInterface.verify(inAppLocalhostServerStatic, _token);
    return inAppLocalhostServerStatic;
  }

  /// Used by the platform implementation to create a new
  /// [CygnusPlatformLocalhostServer].
  ///
  /// Should only be used by platform implementations because they can't extend
  /// a class that only contains a factory constructor.
  @protected
  CygnusPlatformLocalhostServer.implementation(this.params)
    : super(token: _token);

  static final Object _token = Object();

  /// The parameters used to initialize the [CygnusPlatformLocalhostServer].
  final CygnusPlatformLocalhostServerCreationParams params;

  ///{@template cygnus_core.CygnusPlatformLocalhostServer.port}
  ///Represents the port of the server. The default value is `8080`.
  ///{@endtemplate}
  int get port => params.port;

  ///{@template cygnus_core.CygnusPlatformLocalhostServer.directoryIndex}
  ///represents the index file to use. The default value is `index.html`.
  ///{@endtemplate}
  String get directoryIndex => params.directoryIndex;

  ///{@template cygnus_core.CygnusPlatformLocalhostServer.documentRoot}
  ///Represents the document root path to serve. The default value is `./`.
  ///{@endtemplate}
  String get documentRoot => params.documentRoot;

  ///{@template cygnus_core.CygnusPlatformLocalhostServer.shared}
  ///Specifies whether additional `HttpServer`
  /// objects can bind to the same combination of `address`, `port` and `v6Only`.
  /// If `shared` is `true` and more `HttpServer`s from this isolate or other
  /// isolates are bound to the port, then the incoming connections will be
  /// distributed among all the bound `HttpServer`s. Connections can be
  /// distributed over multiple isolates this way.
  ///{@endtemplate}
  bool get shared => params.shared;

  ///{@template cygnus_core.CygnusPlatformLocalhostServer.onData}
  ///A custom callback that is called when a new request is received by the server
  ///that can be used to send or modify the response, for example adding custom headers.
  ///If this callback returns `true`, it means that the request has been handled by this callback.
  ///Otherwise, if this callback returns `false`, the server will continue to process the request using the default implementation.
  ///{@endtemplate}
  Future<bool> Function(HttpRequest request)? get onData => params.onData;

  ///{@template cygnus_core.CygnusPlatformLocalhostServer.start}
  ///Starts the server on `http://localhost:[port]/`.
  ///
  ///**NOTE for iOS**: For the iOS Platform, you need to add the `NSAllowsLocalNetworking` key with `true` in the `Info.plist` file
  ///(See [ATS Configuration Basics](https://developer.apple.com/library/archive/documentation/General/Reference/InfoPlistKeyReference/Articles/CocoaKeys.html#//apple_ref/doc/uid/TP40009251-SW35)):
  ///```xml
  ///<key>NSAppTransportSecurity</key>
  ///<dict>
  ///    <key>NSAllowsLocalNetworking</key>
  ///    <true/>
  ///</dict>
  ///```
  ///The `NSAllowsLocalNetworking` key is available since **iOS 10**.
  ///{@endtemplate}
  ///
  ///{@macro cygnus_core.CygnusPlatformLocalhostServer.start.supported_platforms}
  @SupportedPlatforms(
    platforms: [
      AndroidPlatform(),
      IOSPlatform(),
      MacOSPlatform(),
      WindowsPlatform(),
      LinuxPlatform(),
    ],
  )
  Future<void> start() {
    throw UnimplementedError(
      'start is not implemented on the current platform',
    );
  }

  ///{@template cygnus_core.CygnusPlatformLocalhostServer.close}
  ///Closes the server.
  ///{@endtemplate}
  ///
  ///{@macro cygnus_core.CygnusPlatformLocalhostServer.close.supported_platforms}
  @SupportedPlatforms(
    platforms: [
      AndroidPlatform(),
      IOSPlatform(),
      MacOSPlatform(),
      WindowsPlatform(),
      LinuxPlatform(),
    ],
  )
  Future<void> close() {
    throw UnimplementedError(
      'close is not implemented on the current platform',
    );
  }

  ///{@template cygnus_core.CygnusPlatformLocalhostServer.isRunning}
  ///Indicates if the server is running or not.
  ///{@endtemplate}
  ///
  ///{@macro cygnus_core.CygnusPlatformLocalhostServer.isRunning.supported_platforms}
  @SupportedPlatforms(
    platforms: [
      AndroidPlatform(),
      IOSPlatform(),
      MacOSPlatform(),
      WindowsPlatform(),
      LinuxPlatform(),
    ],
  )
  bool isRunning() {
    throw UnimplementedError(
      'isRunning is not implemented on the current platform',
    );
  }

  ///{@macro cygnus_core.CygnusPlatformLocalhostServerCreationParams.isClassSupported}
  bool isClassSupported({TargetPlatform? platform}) =>
      params.isClassSupported(platform: platform);

  ///{@template cygnus_core.CygnusPlatformLocalhostServer.isMethodSupported}
  ///Check if the given [method] is supported by the [defaultTargetPlatform] or a specific [platform].
  ///{@endtemplate}
  bool isMethodSupported(
    CygnusPlatformLocalhostServerMethod method, {
    TargetPlatform? platform,
  }) => _CygnusPlatformLocalhostServerMethodSupported.isMethodSupported(
    method,
    platform: platform,
  );
}
