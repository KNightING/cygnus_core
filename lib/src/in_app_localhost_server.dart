import 'dart:async';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:cygnus_core/src/platform_interface/flutter_inappwebview_platform_interface.dart';

///{@macro cygnus_core.PlatformInAppLocalhostServer}
///
///{@macro cygnus_core.PlatformInAppLocalhostServer.supported_platforms}
class InAppLocalhostServer {
  ///{@macro cygnus_core.PlatformInAppLocalhostServer}
  InAppLocalhostServer({
    int port = 8080,
    String directoryIndex = 'index.html',
    String documentRoot = './',
    bool shared = false,
    Future<bool> Function(HttpRequest request)? onData,
  }) : this.fromPlatformCreationParams(
         PlatformInAppLocalhostServerCreationParams(
           port: port,
           directoryIndex: directoryIndex,
           documentRoot: documentRoot,
           shared: shared,
           onData: onData,
         ),
       );

  /// Constructs a [InAppLocalhostServer] from creation params for a specific
  /// platform.
  InAppLocalhostServer.fromPlatformCreationParams(
    PlatformInAppLocalhostServerCreationParams params,
  ) : this.fromPlatform(PlatformInAppLocalhostServer(params));

  /// Constructs a [InAppLocalhostServer] from a specific platform
  /// implementation.
  InAppLocalhostServer.fromPlatform(this.platform);

  /// Implementation of [PlatformInAppLocalhostServer] for the current platform.
  final PlatformInAppLocalhostServer platform;

  ///{@macro cygnus_core.PlatformInAppLocalhostServer.port}
  ///
  ///{@macro cygnus_core.PlatformInAppLocalhostServer.port.supported_platforms}
  int get port => platform.port;

  ///{@macro cygnus_core.PlatformInAppLocalhostServer.directoryIndex}
  ///
  ///{@macro cygnus_core.PlatformInAppLocalhostServer.directoryIndex.supported_platforms}
  String get directoryIndex => platform.directoryIndex;

  ///{@macro cygnus_core.PlatformInAppLocalhostServer.documentRoot}
  ///
  ///{@macro cygnus_core.PlatformInAppLocalhostServer.documentRoot.supported_platforms}
  String get documentRoot => platform.documentRoot;

  ///{@macro cygnus_core.PlatformInAppLocalhostServer.shared}
  ///
  ///{@macro cygnus_core.PlatformInAppLocalhostServer.shared.supported_platforms}
  bool get shared => platform.shared;

  ///{@macro cygnus_core.PlatformInAppLocalhostServer.onData}
  ///
  ///{@macro cygnus_core.PlatformInAppLocalhostServer.onData.supported_platforms}
  Future<bool> Function(HttpRequest request)? get onData => platform.onData;

  ///{@macro cygnus_core.PlatformInAppLocalhostServer.start}
  ///
  ///{@macro cygnus_core.PlatformInAppLocalhostServer.start.supported_platforms}
  Future<void> start() => platform.start();

  ///{@macro cygnus_core.PlatformInAppLocalhostServer.close}
  ///
  ///{@macro cygnus_core.PlatformInAppLocalhostServer.close.supported_platforms}
  Future<void> close() => platform.close();

  ///{@macro cygnus_core.PlatformInAppLocalhostServer.isRunning}
  ///
  ///{@macro cygnus_core.PlatformInAppLocalhostServer.isRunning.supported_platforms}
  bool isRunning() => platform.isRunning();

  ///{@macro cygnus_core.PlatformInAppLocalhostServerCreationParams.isClassSupported}
  static bool isClassSupported({TargetPlatform? platform}) =>
      PlatformInAppLocalhostServer.static().isClassSupported(
        platform: platform,
      );

  ///{@macro cygnus_core.PlatformInAppLocalhostServer.isMethodSupported}
  static bool isMethodSupported(
    PlatformInAppLocalhostServerMethod method, {
    TargetPlatform? platform,
  }) => PlatformInAppLocalhostServer.static().isMethodSupported(
    method,
    platform: platform,
  );
}
