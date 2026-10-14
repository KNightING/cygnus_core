package com.github.knighting.cygnus.core.webview.web_message

import com.github.knighting.cygnus.core.types.ChannelDelegateImpl
import com.github.knighting.cygnus.core.types.WebMessageCompatExt
import com.github.knighting.cygnus.core.webview.in_app_webview.InAppWebView
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import java.util.HashMap

class WebMessageChannelChannelDelegate(
  webMessageChannel: WebMessageChannel,
  channel: MethodChannel
) : ChannelDelegateImpl(channel) {
  private var webMessageChannel: WebMessageChannel? = webMessageChannel

  override fun onMethodCall(call: MethodCall, result: MethodChannel.Result) {
    when (call.method) {
      "setWebMessageCallback" -> {
        if (webMessageChannel != null && webMessageChannel!!.webView is InAppWebView) {
          val index = call.argument<Int>("index")
          webMessageChannel!!.setWebMessageCallbackForInAppWebView(index!!, result)
        } else {
          result.success(false)
        }
      }
      "postMessage" -> {
        if (webMessageChannel != null && webMessageChannel!!.webView is InAppWebView) {
          val index = call.argument<Int>("index")
          val message = WebMessageCompatExt.fromMap(call.argument<Map<String, Any?>>("message"))
          webMessageChannel!!.postMessageForInAppWebView(index!!, message, result)
        } else {
          result.success(false)
        }
      }
      "close" -> {
        if (webMessageChannel != null && webMessageChannel!!.webView is InAppWebView) {
          val index = call.argument<Int>("index")
          webMessageChannel!!.closeForInAppWebView(index!!, result)
        } else {
          result.success(false)
        }
      }
      else -> result.notImplemented()
    }
  }

  fun onMessage(index: Int, message: WebMessageCompatExt?) {
    val channel = getChannel() ?: return
    val obj: MutableMap<String, Any?> = HashMap()
    obj["index"] = index
    obj["message"] = if (message != null) message.toMap() else null
    channel.invokeMethod("onMessage", obj)
  }

  override fun dispose() {
    super.dispose()
    webMessageChannel = null
  }
}
