#include "../utils/log.h"
#include "browser.h"
#include "browser_channel_delegate.h"

namespace cygnus_core_plugin
{
  CygnusBrowserChannelDelegate::CygnusBrowserChannelDelegate(const std::string& id, flutter::BinaryMessenger* messenger)
    : ChannelDelegate(messenger, CygnusBrowser::METHOD_CHANNEL_NAME_PREFIX + id)
  {}

  void CygnusBrowserChannelDelegate::HandleMethodCall(const flutter::MethodCall<flutter::EncodableValue>& method_call,
    std::unique_ptr<flutter::MethodResult<flutter::EncodableValue>> result)
  {
    result->NotImplemented();
  }

  void CygnusBrowserChannelDelegate::onBrowserCreated() const
  {
    if (!channel) {
      return;
    }
    channel->InvokeMethod("onBrowserCreated", nullptr);
  }

  void CygnusBrowserChannelDelegate::onExit() const
  {
    if (!channel) {
      return;
    }
    channel->InvokeMethod("onExit", nullptr);
  }

  CygnusBrowserChannelDelegate::~CygnusBrowserChannelDelegate()
  {
    debugLog("dealloc CygnusBrowserChannelDelegate");
  }
}