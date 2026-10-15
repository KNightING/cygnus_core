package com.github.knighting.cygnus.core.plugin_scripts_js

import com.github.knighting.cygnus.core.types.PluginScript
import com.github.knighting.cygnus.core.types.UserScriptInjectionTime

class PrintJS {
  companion object {
    const val PRINT_JS_PLUGIN_SCRIPT_GROUP_NAME = "CYGNUS_WEBVIEW_PRINT_JS_PLUGIN_SCRIPT"

    @JvmStatic
    fun PRINT_JS_PLUGIN_SCRIPT(allowedOriginRules: MutableSet<String>?,
                               forMainFrameOnly: Boolean): PluginScript {
      return PluginScript(
        PrintJS.PRINT_JS_PLUGIN_SCRIPT_GROUP_NAME,
        PrintJS.PRINT_JS_SOURCE(),
        UserScriptInjectionTime.AT_DOCUMENT_START,
        null,
        false,
        allowedOriginRules,
        forMainFrameOnly
      )
    }

    @JvmStatic
    fun PRINT_JS_SOURCE(): String {
      return "window.print = function() {" +
        "  if (window.top == null || window.top === window) {" +
        "     window." + JavaScriptBridgeJS.get_JAVASCRIPT_BRIDGE_NAME() + ".callHandler('onPrintRequest', window.location.href);" +
        "  } else {" +
        "     window.top.print();" +
        "  }" +
        "};"
    }
  }
}
