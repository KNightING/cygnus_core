#ifndef CYGNUS_CORE_PLUGIN_WEB_VIEW_TRANSPORT_H_
#define CYGNUS_CORE_PLUGIN_WEB_VIEW_TRANSPORT_H_

#include <wpe/webkit.h>

#include <memory>
#include <optional>
#include <string>

namespace cygnus_core_plugin {

class CygnusWebView;

/**
 * Holds a WebView created for a new window (via onCreateWindow)
 * along with the initial URL request that triggered it.
 */
struct WebViewTransport {
  // The CygnusWebView wrapper that owns the WebKitWebView
  std::unique_ptr<CygnusWebView> cygnusWebView;
  
  // The initial URL request that triggered the window creation
  std::optional<std::string> url;
  
  WebViewTransport(std::unique_ptr<CygnusWebView> webView, const std::optional<std::string>& url)
      : cygnusWebView(std::move(webView)), url(url) {}
  
  // Get the internal WebKitWebView* (for returning to WebKit create signal)
  WebKitWebView* getWebKitWebView() const;
  
  ~WebViewTransport() = default;
};

}  // namespace cygnus_core_plugin

#endif  // CYGNUS_CORE_PLUGIN_WEB_VIEW_TRANSPORT_H_
