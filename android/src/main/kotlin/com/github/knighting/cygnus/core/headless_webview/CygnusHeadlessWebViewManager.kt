/*
 *
 * Licensed to the Apache Software Foundation (ASF) under one
 * or more contributor license agreements.  See the NOTICE file
 * distributed with this work for additional information
 * regarding copyright ownership.  The ASF licenses this file
 * to you under the Apache License, Version 2.0 (the
 * "License"); you may not use this file except in compliance
 * with the License.  You may obtain a copy of the License at
 *
 *   http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing,
 * software distributed under the License is distributed on an
 * "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
 * KIND, either express or implied.  See the License for the
 * specific language governing permissions and limitations
 * under the License.
 *
 */

package com.github.knighting.cygnus.core.headless_webview

import android.content.Context

import com.github.knighting.cygnus.core.CygnusCorePlugin
import com.github.knighting.cygnus.core.types.ChannelDelegateImpl
import com.github.knighting.cygnus.core.webview.webview.FlutterWebView

import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.Result

class CygnusHeadlessWebViewManager(plugin: CygnusCorePlugin) :
  ChannelDelegateImpl(MethodChannel(plugin.messenger, METHOD_CHANNEL_NAME)) {

  @JvmField
  val webViews: MutableMap<String, CygnusHeadlessWebView?> = HashMap()

  @JvmField
  var plugin: CygnusCorePlugin? = plugin

  override fun onMethodCall(call: MethodCall, result: Result) {
    val id = call.argument<String>("id")

    when (call.method) {
      "run" -> {
        val params = call.argument<HashMap<String, Any?>>("params")
        run(id!!, params)
        result.success(true)
      }
      else -> result.notImplemented()
    }
  }

  fun run(id: String, params: HashMap<String, Any?>?) {
    val plugin = this.plugin
    if (plugin == null || (plugin.activity == null && plugin.applicationContext == null)) return
    var context: Context? = plugin.activity
    if (context == null) {
      context = plugin.applicationContext
    }
    val flutterWebView = FlutterWebView(plugin, context, id, params)
    val headlessCygnusWebView = CygnusHeadlessWebView(plugin, id, flutterWebView)
    webViews[id] = headlessCygnusWebView

    headlessCygnusWebView.prepare(params)
    headlessCygnusWebView.onWebViewCreated()
    flutterWebView.makeInitialLoad(params)
  }

  override fun dispose() {
    super.dispose()
    val headlessCygnusWebViews = webViews.values
    for (headlessCygnusWebView in headlessCygnusWebViews) {
      headlessCygnusWebView!!.dispose()
    }
    webViews.clear()
    plugin = null
  }

  companion object {
    // protected static in Java
    const val LOG_TAG = "CygnusHeadlessWebViewManager"
    const val METHOD_CHANNEL_NAME = "com.github.knighting.cygnus/headless_webview"
  }
}
