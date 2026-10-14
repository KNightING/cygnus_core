import '../web_message/main.dart';

///The listener for handling [CygnusPlatformWebMessagePort] events.
///The message callback methods are called on the main thread.
typedef void CygnusWebMessageCallback(CygnusWebMessage? message);
