package com.github.knighting.cygnus.core.types

class WebMessage(
  @JvmField var data: String?,
  @JvmField var ports: MutableList<WebMessagePort>?
) {
  fun dispose() {
    if (ports != null) {
      ports!!.clear()
    }
  }
}
