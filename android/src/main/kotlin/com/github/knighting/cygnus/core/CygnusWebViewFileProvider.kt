package com.github.knighting.cygnus.core

import androidx.core.content.FileProvider

open class CygnusWebViewFileProvider : FileProvider() {

  companion object {
    const val fileProviderAuthorityExtension = "cygnus_core.fileprovider"
  }

}
