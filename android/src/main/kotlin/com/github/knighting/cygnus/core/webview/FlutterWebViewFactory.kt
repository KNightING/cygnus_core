package com.github.knighting.cygnus.core.webview

import android.content.Context
import android.view.ViewGroup
import com.github.knighting.cygnus.core.CygnusCorePlugin
import com.github.knighting.cygnus.core.webview.webview.FlutterWebView
import io.flutter.plugin.common.StandardMessageCodec
import io.flutter.plugin.platform.PlatformView
import io.flutter.plugin.platform.PlatformViewFactory

class FlutterWebViewFactory(private val plugin: CygnusCorePlugin) : PlatformViewFactory(StandardMessageCodec.INSTANCE) {
  companion object {
    const val VIEW_TYPE_ID = "com.github.knighting.cygnus/webview"
  }

  override fun create(context: Context?, id: Int, args: Any?): PlatformView {
    val params = args as HashMap<String, Any?>
    var flutterWebView: FlutterWebView? = null
    var viewId: Any = id

    val keepAliveId = params["keepAliveId"] as String?
    val headlessWebViewId = params["headlessWebViewId"] as String?

    val headlessCygnusWebViewManager = plugin.headlessCygnusWebViewManager
    if (headlessWebViewId != null && headlessCygnusWebViewManager != null) {
      val headlessCygnusWebView = headlessCygnusWebViewManager.webViews[headlessWebViewId]
      if (headlessCygnusWebView != null) {
        flutterWebView = headlessCygnusWebView.disposeAndGetFlutterWebView()
        if (flutterWebView != null) {
          flutterWebView.keepAliveId = keepAliveId
        }
      }
    }

    val cygnusWebViewManager = plugin.cygnusWebViewManager
    if (keepAliveId != null && flutterWebView == null && cygnusWebViewManager != null) {
      flutterWebView = cygnusWebViewManager.keepAliveWebViews[keepAliveId]
      if (flutterWebView != null) {
        // be sure to remove the view from the previous parent.
        val view = flutterWebView.view
        if (view != null) {
          val parent = view.parent as ViewGroup?
          if (parent != null) {
            parent.removeView(view)
          }
        }
      }
    }

    val shouldMakeInitialLoad = flutterWebView == null
    if (flutterWebView == null) {
      if (keepAliveId != null) {
        viewId = keepAliveId
      }
      flutterWebView = FlutterWebView(plugin, context!!, viewId, params)
    }

    if (keepAliveId != null && cygnusWebViewManager != null) {
      cygnusWebViewManager.keepAliveWebViews[keepAliveId] = flutterWebView
    }

    if (shouldMakeInitialLoad) {
      flutterWebView.makeInitialLoad(params)
    }

    return flutterWebView
  }
}
