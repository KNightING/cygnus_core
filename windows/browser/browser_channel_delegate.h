#ifndef CYGNUS_CORE_PLUGIN_CYGNUS_BROWSER_CHANNEL_DELEGATE_H_
#define CYGNUS_CORE_PLUGIN_CYGNUS_BROWSER_CHANNEL_DELEGATE_H_

#include <flutter/method_channel.h>
#include <flutter/standard_message_codec.h>

#include "../types/channel_delegate.h"

namespace cygnus_core_plugin
{
  class CygnusBrowserChannelDelegate : public ChannelDelegate
  {
  public:
    CygnusBrowserChannelDelegate(const std::string& id, flutter::BinaryMessenger* messenger);
    ~CygnusBrowserChannelDelegate();

    void HandleMethodCall(
      const flutter::MethodCall<flutter::EncodableValue>& method_call,
      std::unique_ptr<flutter::MethodResult<flutter::EncodableValue>> result);

    void onBrowserCreated() const;
    void onExit() const;
  };
}

#endif //CYGNUS_CORE_PLUGIN_CYGNUS_BROWSER_CHANNEL_DELEGATE_H_