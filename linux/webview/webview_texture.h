#ifndef CYGNUS_CORE_PLUGIN_CYGNUS_WEBVIEW_TEXTURE_H_
#define CYGNUS_CORE_PLUGIN_CYGNUS_WEBVIEW_TEXTURE_H_

#include <flutter_linux/flutter_linux.h>

G_BEGIN_DECLS

// Declare the custom texture type
#define CYGNUS_WEBVIEW_TYPE_TEXTURE (cygnus_webview_texture_get_type())

G_DECLARE_FINAL_TYPE(CygnusWebViewTexture, cygnus_webview_texture, CYGNUS_WEBVIEW, TEXTURE,
                     FlPixelBufferTexture)

// Forward declaration
namespace cygnus_core_plugin {
class CygnusWebView;
using WebViewType = CygnusWebView;
}  // namespace cygnus_core_plugin

// Create a new CygnusWebViewTexture
CygnusWebViewTexture* cygnus_webview_texture_new(cygnus_core_plugin::WebViewType* webview);

G_END_DECLS

#endif  // CYGNUS_CORE_PLUGIN_CYGNUS_WEBVIEW_TEXTURE_H_
