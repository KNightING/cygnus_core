package com.github.knighting.cygnus.core.webview

import io.flutter.plugin.platform.PlatformView

interface PlatformWebView : PlatformView {
  fun makeInitialLoad(params: HashMap<String, Any?>?)
}
