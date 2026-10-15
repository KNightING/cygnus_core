#ifndef CYGNUS_CORE_PLUGIN_CYGNUS_BROWSER_MANAGER_H_
#define CYGNUS_CORE_PLUGIN_CYGNUS_BROWSER_MANAGER_H_

#include <flutter/method_channel.h>
#include <flutter/standard_message_codec.h>
#include <map>
#include <string>

#include "../cygnus_core_plugin.h"
#include "../types/channel_delegate.h"
#include "browser.h"

namespace cygnus_core_plugin
{
  class CygnusBrowserManager : public ChannelDelegate
  {
  public:
    static inline const std::string METHOD_CHANNEL_NAME = "com.github.knighting.cygnus/browser";

    const CygnusCorePlugin* plugin;
    std::map<std::string, std::unique_ptr<CygnusBrowser>> browsers;

    CygnusBrowserManager(const CygnusCorePlugin* plugin);
    ~CygnusBrowserManager();

    void HandleMethodCall(
      const flutter::MethodCall<flutter::EncodableValue>& method_call,
      std::unique_ptr<flutter::MethodResult<flutter::EncodableValue>> result);

    void createCygnusBrowser(const flutter::EncodableMap* arguments);
  };
}
#endif //CYGNUS_CORE_PLUGIN_CYGNUS_BROWSER_MANAGER_H_