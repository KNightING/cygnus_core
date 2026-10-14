import '../types/main.dart';
import '../util.dart';
import '../web_message/platform_web_message_channel.dart';
import '../web_message/platform_web_message_listener.dart';
import 'platform_webview_widget.dart';
import 'platform_webview_controller.dart';

///Class used to keep alive a [CygnusPlatformWebViewWidget].
class CygnusWebViewKeepAlive {
  String _id = IdGenerator.generate();
}

///Used internally
extension InternalInAppWebViewKeepAlive on CygnusWebViewKeepAlive {
  String get id => _id;

  set id(String id) {
    _id = id;
  }
}

///Used internally to save and restore [CygnusPlatformWebViewController] properties
///for the keep alive feature.
class CygnusWebViewControllerKeepAliveProps {
  Map<String, Function> javaScriptHandlersMap;
  Map<CygnusUserScriptInjectionTime, List<CygnusUserScript>> userScripts;
  Set<String> webMessageListenerObjNames;
  Map<String, CygnusScriptHtmlTagAttributes> injectedScriptsFromURL;
  Set<CygnusPlatformWebMessageChannel> webMessageChannels = Set();
  Set<CygnusPlatformWebMessageListener> webMessageListeners = Set();
  Map<String, Function(dynamic data)> devToolsProtocolEventListenerMap;

  CygnusWebViewControllerKeepAliveProps({
    this.javaScriptHandlersMap = const {},
    this.userScripts = const {},
    this.webMessageListenerObjNames = const {},
    this.injectedScriptsFromURL = const {},
    this.webMessageChannels = const {},
    this.webMessageListeners = const {},
    this.devToolsProtocolEventListenerMap = const {},
  });
}
