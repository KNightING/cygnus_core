#ifndef CYGNUS_CORE_PLUGIN_COOKIE_MANAGER_H_
#define CYGNUS_CORE_PLUGIN_COOKIE_MANAGER_H_

#include <flutter/method_channel.h>
#include <flutter/standard_message_codec.h>
#include <functional>
#include <optional>

#include "cygnus_core_plugin.h"
#include "webview/webview.h"
#include "types/channel_delegate.h"
#include "webview_environment/webview_environment_manager.h"

namespace cygnus_core_plugin
{
  class CookieManager : public ChannelDelegate
  {
  public:
    static inline const std::string METHOD_CHANNEL_NAME_PREFIX = "com.github.knighting.cygnus/webview_cookiemanager";

    const CygnusCorePlugin* plugin;

    CookieManager(const CygnusCorePlugin* plugin);
    ~CookieManager();

    void HandleMethodCall(
      const flutter::MethodCall<flutter::EncodableValue>& method_call,
      std::unique_ptr<flutter::MethodResult<flutter::EncodableValue>> result);

    void setCookie(WebViewEnvironment* webViewEnvironment, CygnusWebView* cygnusWebView, const flutter::EncodableMap& map, std::function<void(const bool&)> completionHandler) const;
    void getCookie(WebViewEnvironment* webViewEnvironment, CygnusWebView* cygnusWebView, const std::string& url, const std::string& name, std::function<void(const flutter::EncodableValue&)> completionHandler) const;
    void getCookies(WebViewEnvironment* webViewEnvironment, CygnusWebView* cygnusWebView, const std::string& url, std::function<void(const flutter::EncodableList&)> completionHandler) const;
    void deleteCookie(WebViewEnvironment* webViewEnvironment, CygnusWebView* cygnusWebView, const std::string& url, const std::string& name, const std::string& path, const std::optional<std::string>& domain, std::function<void(const bool&)> completionHandler) const;
    void deleteCookies(WebViewEnvironment* webViewEnvironment, CygnusWebView* cygnusWebView, const std::string& url, const std::string& path, const std::optional<std::string>& domain, std::function<void(const bool&)> completionHandler) const;
    void deleteAllCookies(WebViewEnvironment* webViewEnvironment, std::function<void(const bool&)> completionHandler);
  };
}

#endif //CYGNUS_CORE_PLUGIN_COOKIE_MANAGER_H_