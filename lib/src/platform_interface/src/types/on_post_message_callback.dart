import '../web_message/main.dart';
import '../web_uri.dart';

///The listener for handling [CygnusPlatformWebMessageListener] events sent by a `postMessage()` on the injected JavaScript object.
typedef void CygnusOnPostMessageCallback(
  CygnusWebMessage? message,
  CygnusWebUri? sourceOrigin,
  bool isMainFrame,
  CygnusPlatformJavaScriptReplyProxy replyProxy,
);
