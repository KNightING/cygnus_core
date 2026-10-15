package com.github.knighting.cygnus.core

import androidx.webkit.WebViewFeature
import com.github.knighting.cygnus.core.types.ChannelDelegateImpl
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel

open class WebViewFeatureManager(plugin: CygnusCorePlugin) :
  ChannelDelegateImpl(MethodChannel(plugin.messenger, METHOD_CHANNEL_NAME)) {

  @JvmField
  var plugin: CygnusCorePlugin? = plugin

  override fun onMethodCall(call: MethodCall, result: MethodChannel.Result) {
    when (call.method) {
      "isFeatureSupported" -> {
        val feature = call.argument<String>("feature")
        result.success(WebViewFeature.isFeatureSupported(feature!!))
      }
      "isStartupFeatureSupported" -> {
        val activity = plugin?.activity
        if (activity != null) {
          val startupFeature = call.argument<String>("startupFeature")
          result.success(WebViewFeature.isStartupFeatureSupported(activity, startupFeature!!))
        }
      }
      else -> result.notImplemented()
    }
  }

  override fun dispose() {
    super.dispose()
    plugin = null
  }

  companion object {
    protected const val LOG_TAG = "WebViewFeatureManager"
    const val METHOD_CHANNEL_NAME = "com.github.knighting.cygnus/webview_webviewfeature"
  }
}
