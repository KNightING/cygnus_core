package com.github.knighting.cygnus.core

import androidx.core.content.FileProvider

open class InAppWebViewFileProvider : FileProvider() {

  companion object {
    const val fileProviderAuthorityExtension = "flutter_inappwebview_android.fileprovider"
  }

}
