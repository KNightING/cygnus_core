import 'dart:async';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:cygnus_core/src/platform_interface/flutter_webview_platform_interface.dart';

///{@macro cygnus_core.CygnusPlatformLocalhostServer}
///
///{@macro cygnus_core.CygnusPlatformLocalhostServer.supported_platforms}
class CygnusLocalhostServer {
  ///{@macro cygnus_core.CygnusPlatformLocalhostServer}
  CygnusLocalhostServer({
    int port = 8080,
    String directoryIndex = 'index.html',
    String documentRoot = './',
    bool shared = false,
    Future<bool> Function(HttpRequest request)? onData,
  }) : this.fromPlatformCreationParams(
         CygnusPlatformLocalhostServerCreationParams(
           port: port,
           directoryIndex: directoryIndex,
           documentRoot: documentRoot,
           shared: shared,
           onData: onData,
         ),
       );

  /// Constructs a [CygnusLocalhostServer] from creation params for a specific
  /// platform.
  CygnusLocalhostServer.fromPlatformCreationParams(
    CygnusPlatformLocalhostServerCreationParams params,
  ) : this.fromPlatform(CygnusPlatformLocalhostServer(params));

  /// Constructs a [CygnusLocalhostServer] from a specific platform
  /// implementation.
  CygnusLocalhostServer.fromPlatform(this.platform);

  /// Implementation of [CygnusPlatformLocalhostServer] for the current platform.
  final CygnusPlatformLocalhostServer platform;

  ///{@macro cygnus_core.CygnusPlatformLocalhostServer.port}
  ///
  ///{@macro cygnus_core.CygnusPlatformLocalhostServer.port.supported_platforms}
  int get port => platform.port;

  ///{@macro cygnus_core.CygnusPlatformLocalhostServer.directoryIndex}
  ///
  ///{@macro cygnus_core.CygnusPlatformLocalhostServer.directoryIndex.supported_platforms}
  String get directoryIndex => platform.directoryIndex;

  ///{@macro cygnus_core.CygnusPlatformLocalhostServer.documentRoot}
  ///
  ///{@macro cygnus_core.CygnusPlatformLocalhostServer.documentRoot.supported_platforms}
  String get documentRoot => platform.documentRoot;

  ///{@macro cygnus_core.CygnusPlatformLocalhostServer.shared}
  ///
  ///{@macro cygnus_core.CygnusPlatformLocalhostServer.shared.supported_platforms}
  bool get shared => platform.shared;

  ///{@macro cygnus_core.CygnusPlatformLocalhostServer.onData}
  ///
  ///{@macro cygnus_core.CygnusPlatformLocalhostServer.onData.supported_platforms}
  Future<bool> Function(HttpRequest request)? get onData => platform.onData;

  ///{@macro cygnus_core.CygnusPlatformLocalhostServer.start}
  ///
  ///{@macro cygnus_core.CygnusPlatformLocalhostServer.start.supported_platforms}
  Future<void> start() => platform.start();

  ///{@macro cygnus_core.CygnusPlatformLocalhostServer.close}
  ///
  ///{@macro cygnus_core.CygnusPlatformLocalhostServer.close.supported_platforms}
  Future<void> close() => platform.close();

  ///{@macro cygnus_core.CygnusPlatformLocalhostServer.isRunning}
  ///
  ///{@macro cygnus_core.CygnusPlatformLocalhostServer.isRunning.supported_platforms}
  bool isRunning() => platform.isRunning();

  ///{@macro cygnus_core.CygnusPlatformLocalhostServerCreationParams.isClassSupported}
  static bool isClassSupported({TargetPlatform? platform}) =>
      CygnusPlatformLocalhostServer.static().isClassSupported(
        platform: platform,
      );

  ///{@macro cygnus_core.CygnusPlatformLocalhostServer.isMethodSupported}
  static bool isMethodSupported(
    CygnusPlatformLocalhostServerMethod method, {
    TargetPlatform? platform,
  }) => CygnusPlatformLocalhostServer.static().isMethodSupported(
    method,
    platform: platform,
  );
}
