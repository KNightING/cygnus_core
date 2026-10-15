#ifndef CYGNUS_CORE_PLUGIN_HEADLESS_CYGNUS_WEBVIEW_MANAGER_H_
#define CYGNUS_CORE_PLUGIN_HEADLESS_CYGNUS_WEBVIEW_MANAGER_H_

#include <flutter/method_channel.h>
#include <map>
#include <string>
#include <wil/com.h>
#include <winrt/base.h>

#include "../cygnus_core_plugin.h"
#include "../types/channel_delegate.h"
#include "headless_webview.h"

namespace cygnus_core_plugin
{
  class CygnusHeadlessWebViewManager : public ChannelDelegate
  {
  public:
    static inline const std::string METHOD_CHANNEL_NAME = "com.github.knighting.cygnus/headless_webview";

    const CygnusCorePlugin* plugin;
    std::map<std::string, std::unique_ptr<CygnusHeadlessWebView>> webViews;

    CygnusHeadlessWebViewManager(const CygnusCorePlugin* plugin);
    ~CygnusHeadlessWebViewManager();

    void HandleMethodCall(
      const flutter::MethodCall<flutter::EncodableValue>& method_call,
      std::unique_ptr<flutter::MethodResult<flutter::EncodableValue>> result);

    void run(const flutter::EncodableMap* arguments, std::unique_ptr<flutter::MethodResult<flutter::EncodableValue>> result);
  private:
    WNDCLASS windowClass_ = {};
  };
}
#endif //CYGNUS_CORE_PLUGIN_HEADLESS_CYGNUS_WEBVIEW_MANAGER_H_