#ifndef CYGNUS_CORE_PLUGIN_HEADLESS_CYGNUS_WEBVIEW_H_
#define CYGNUS_CORE_PLUGIN_HEADLESS_CYGNUS_WEBVIEW_H_

#include "../cygnus_core_plugin.h"
#include "../webview/webview.h"
#include "../types/size_2d.h"
#include "headless_webview_channel_delegate.h"

namespace cygnus_core_plugin
{
  struct CygnusHeadlessWebViewCreationParams {
    const std::string id;
    const std::shared_ptr<Size2D> initialSize;
  };

  class CygnusHeadlessWebView
  {
  public:
    static inline const wchar_t* CLASS_NAME = L"CygnusHeadlessWebView";
    static inline const std::string METHOD_CHANNEL_NAME_PREFIX = "com.github.knighting.cygnus/headless_webview_";

    const CygnusCorePlugin* plugin;
    std::string id;
    std::unique_ptr<CygnusWebView> webView;
    std::unique_ptr<HeadlessWebViewChannelDelegate> channelDelegate;

    CygnusHeadlessWebView(const CygnusCorePlugin* plugin, const CygnusHeadlessWebViewCreationParams& params, const HWND parentWindow, std::unique_ptr<CygnusWebView> webView);
    ~CygnusHeadlessWebView();

    void prepare(const CygnusHeadlessWebViewCreationParams& params);
    void setSize(const std::shared_ptr<Size2D> size) const;
    std::shared_ptr<Size2D> getSize() const;
  };
}
#endif //CYGNUS_CORE_PLUGIN_HEADLESS_CYGNUS_WEBVIEW_H_