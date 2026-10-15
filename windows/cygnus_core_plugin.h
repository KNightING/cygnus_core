#ifndef FLUTTER_PLUGIN_CYGNUS_CORE_PLUGIN_PLUGIN_H_
#define FLUTTER_PLUGIN_CYGNUS_CORE_PLUGIN_PLUGIN_H_

#include <flutter/plugin_registrar_windows.h>

namespace cygnus_core_plugin
{
  class WebViewEnvironmentManager;
  class CygnusWebViewManager;
  class CygnusBrowserManager;
  class CygnusHeadlessWebViewManager;
  class CookieManager;
  class PlatformUtil;

  class CygnusCorePlugin : public flutter::Plugin {
  public:
    flutter::PluginRegistrarWindows* registrar;
    std::unique_ptr<WebViewEnvironmentManager> webViewEnvironmentManager;
    std::unique_ptr<CygnusWebViewManager> cygnusWebViewManager;
    std::unique_ptr<CygnusBrowserManager> cygnusBrowserManager;
    std::unique_ptr<CygnusHeadlessWebViewManager> headlessCygnusWebViewManager;
    std::unique_ptr<CookieManager> cookieManager;
    std::unique_ptr<PlatformUtil> platformUtil;

    static void RegisterWithRegistrar(flutter::PluginRegistrarWindows* registrar);

    CygnusCorePlugin(flutter::PluginRegistrarWindows* registrar);

    virtual ~CygnusCorePlugin();

    // Disallow copy and assign.
    CygnusCorePlugin(const CygnusCorePlugin&) = delete;
    CygnusCorePlugin& operator=(const CygnusCorePlugin&) = delete;
  private:
    // The ID of the WindowProc delegate registration.
    int window_proc_id = -1;
    std::optional<LRESULT> CygnusCorePlugin::HandleWindowProc(
      HWND hWnd,
      UINT message,
      WPARAM wParam,
      LPARAM lParam);
  };
}
#endif  // FLUTTER_PLUGIN_CYGNUS_CORE_PLUGIN_PLUGIN_H_
