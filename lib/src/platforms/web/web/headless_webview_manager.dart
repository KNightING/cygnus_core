import 'package:web/web.dart';

import 'package:flutter/services.dart';
import 'package:cygnus_core/src/platform_interface/flutter_webview_platform_interface.dart';
import 'webview_manager.dart';
import 'web_view_web_element.dart';
import 'headless_web_view_web_element.dart';

class CygnusHeadlessWebViewManager extends ChannelController {
  static final Map<String, CygnusHeadlessWebViewWebElement?> webViews = {};

  late BinaryMessenger _messenger;

  CygnusHeadlessWebViewManager({required BinaryMessenger messenger}) {
    this._messenger = messenger;
    channel = MethodChannel(
      'com.github.knighting.cygnus/headless_webview',
      const StandardMethodCodec(),
      _messenger,
    );
    handler = _handleMethod;
    initMethodCallHandler();
  }

  Future<dynamic> _handleMethod(MethodCall call) async {
    switch (call.method) {
      case "run":
        String id = call.arguments["id"];
        Map<String, dynamic> params = call.arguments["params"]
            .cast<String, dynamic>();
        run(id, params);
        break;
      default:
        throw UnimplementedError("Unimplemented ${call.method} method");
    }
    return null;
  }

  void run(String id, Map<String, dynamic> params) {
    var webView = CygnusWebViewWebElement(viewId: id, messenger: _messenger);
    var headlessWebView = CygnusHeadlessWebViewWebElement(
      id: id,
      messenger: _messenger,
      webView: webView,
    );
    CygnusWebViewManager.webViews.putIfAbsent(id, () => webView);
    CygnusHeadlessWebViewManager.webViews.putIfAbsent(id, () => headlessWebView);
    prepare(webView, params);
    headlessWebView.onWebViewCreated();
    webView.makeInitialLoad();
  }

  void prepare(CygnusWebViewWebElement webView, Map<String, dynamic> params) {
    webView.iframeContainer.style.display = 'none';
    Map<String, num>? initialSize = params["initialSize"]?.cast<String, num>();
    if (initialSize != null) {
      webView.iframeContainer.style.width =
          initialSize["width"].toString() + 'px';
      webView.iframeContainer.style.height =
          initialSize["height"].toString() + 'px';
    }
    Map<String, dynamic> initialSettings = params["initialSettings"]
        .cast<String, dynamic>();
    if (initialSettings.isEmpty) {
      webView.initialSettings = CygnusWebViewSettings();
    } else {
      webView.initialSettings = CygnusWebViewSettings.fromMap(initialSettings);
    }
    webView.initialUrlRequest = CygnusURLRequest.fromMap(
      params["initialUrlRequest"]?.cast<String, dynamic>(),
    );
    webView.initialFile = params["initialFile"];
    webView.initialData = CygnusWebViewInitialData.fromMap(
      params["initialData"]?.cast<String, dynamic>(),
    );
    webView.initialUserScripts = params["initialUserScripts"];
    document.body?.append(webView.iframeContainer);
    webView.prepare();
  }

  @override
  void dispose() {
    disposeChannel();
  }
}
