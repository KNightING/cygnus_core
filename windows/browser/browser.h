#ifndef CYGNUS_CORE_PLUGIN_CYGNUS_BROWSER_H_
#define CYGNUS_CORE_PLUGIN_CYGNUS_BROWSER_H_

#include <optional>
#include <string>
#include <Windows.h>

#include "../cygnus_core_plugin.h"
#include "../webview/webview.h"
#include "../webview/webview_settings.h"
#include "../types/url_request.h"
#include "browser_channel_delegate.h"
#include "browser_settings.h"

namespace cygnus_core_plugin
{
  struct CygnusBrowserCreationParams
  {
    const std::string id;
    const std::optional<std::shared_ptr<URLRequest>> urlRequest;
    const std::optional<std::string> assetFilePath;
    const std::optional<std::string> data;
    const std::shared_ptr<CygnusBrowserSettings> initialSettings;
    const std::shared_ptr<CygnusWebViewSettings> initialWebViewSettings;
    const std::optional<std::vector<std::shared_ptr<UserScript>>> initialUserScripts;
    const std::optional<std::string> webViewEnvironmentId;
  };

  class CygnusBrowser {
  public:
    static inline const std::string METHOD_CHANNEL_NAME_PREFIX = "com.github.knighting.cygnus/browser_";
    static inline const wchar_t* CLASS_NAME = L"CygnusBrowser";

    static LRESULT CALLBACK WndProc(HWND window,
      UINT message,
      WPARAM wparam,
      LPARAM lparam) noexcept;

    const CygnusCorePlugin* plugin;
    const std::string id;
    std::unique_ptr<CygnusWebView> webView;
    std::unique_ptr<CygnusBrowserChannelDelegate> channelDelegate;
    std::shared_ptr<CygnusBrowserSettings> settings;

    CygnusBrowser(const CygnusCorePlugin* plugin, const CygnusBrowserCreationParams& params);
    ~CygnusBrowser();

    void close() const;
    void show() const;
    void hide() const;
    bool isHidden() const;
    void setSettings(const std::shared_ptr<CygnusBrowserSettings> newSettings, const flutter::EncodableMap& newSettingsMap);
    flutter::EncodableValue getSettings() const;

    void didChangeTitle(const std::optional<std::string>& title) const;
    HWND getHWND() const
    {
      return m_hWnd;
    }
  private:
    const HINSTANCE m_hInstance;
    HWND m_hWnd;
    bool destroyed_ = false;
    static CygnusBrowser* GetThisFromHandle(HWND window) noexcept;
    LRESULT MessageHandler(HWND window,
      UINT message,
      WPARAM wparam,
      LPARAM lparam) noexcept;
  };
}
#endif //CYGNUS_CORE_PLUGIN_CYGNUS_BROWSER_H_