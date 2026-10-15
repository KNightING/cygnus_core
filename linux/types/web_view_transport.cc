#include "web_view_transport.h"

#include "../webview/webview.h"

namespace cygnus_core_plugin {

WebKitWebView* WebViewTransport::getWebKitWebView() const {
  if (cygnusWebView) {
    return cygnusWebView->webview();
  }
  return nullptr;
}

}  // namespace cygnus_core_plugin
