package com.github.knighting.cygnus.core.browser

import com.github.knighting.cygnus.core.types.ChannelDelegateImpl
import com.github.knighting.cygnus.core.types.CygnusBrowserMenuItem

import io.flutter.plugin.common.MethodChannel

class CygnusBrowserChannelDelegate(channel: MethodChannel) : ChannelDelegateImpl(channel) {
  fun onBrowserCreated() {
    val channel = getChannel() ?: return
    val obj: MutableMap<String, Any?> = HashMap()
    channel.invokeMethod("onBrowserCreated", obj)
  }

  fun onMenuItemClicked(menuItem: CygnusBrowserMenuItem) {
    val channel = getChannel() ?: return
    val obj: MutableMap<String, Any?> = HashMap()
    obj["id"] = menuItem.id
    channel.invokeMethod("onMenuItemClicked", obj)
  }

  fun onExit() {
    val channel = getChannel() ?: return
    val obj: MutableMap<String, Any?> = HashMap()
    channel.invokeMethod("onExit", obj)
  }
}
