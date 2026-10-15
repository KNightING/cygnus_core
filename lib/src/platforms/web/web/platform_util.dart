import 'dart:async';
import 'dart:js_interop';
import 'package:flutter/services.dart';
import 'package:cygnus_core/src/platform_interface/flutter_webview_platform_interface.dart';

import 'js_bridge.dart';

class PlatformUtil extends ChannelController {
  late BinaryMessenger _messenger;

  PlatformUtil({required BinaryMessenger messenger}) {
    this._messenger = messenger;

    channel = MethodChannel(
      'com.github.knighting.cygnus/webview_platformutil',
      const StandardMethodCodec(),
      _messenger,
    );
    handler = _handleMethod;
    initMethodCallHandler();
  }

  Future<dynamic> _handleMethod(MethodCall call) async {
    switch (call.method) {
      case "getWebCookieExpirationDate":
        int timestamp = call.arguments['date'];
        return getWebCookieExpirationDate(timestamp);
      default:
        throw PlatformException(
          code: 'Unimplemented',
          details:
              'cygnus_core for web doesn\'t implement \'${call.method}\'',
        );
    }
  }

  String getWebCookieExpirationDate(int timestamp) {
    return cygnusWeb!.getCookieExpirationDate(timestamp).toDart;
  }

  @override
  void dispose() {
    disposeChannel();
  }
}
