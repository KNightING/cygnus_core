#ifndef CYGNUS_CORE_PLUGIN_HEADLESS_WEBVIEW_CHANNEL_DELEGATE_H_
#define CYGNUS_CORE_PLUGIN_HEADLESS_WEBVIEW_CHANNEL_DELEGATE_H_

#include "../types/channel_delegate.h"
#include <flutter/method_channel.h>

namespace cygnus_core_plugin
{
  class CygnusHeadlessWebView;

  class HeadlessWebViewChannelDelegate : public ChannelDelegate
  {
  public:
    CygnusHeadlessWebView* webView;

    HeadlessWebViewChannelDelegate(CygnusHeadlessWebView* webView, flutter::BinaryMessenger* messenger);
    ~HeadlessWebViewChannelDelegate();

    void HandleMethodCall(
      const flutter::MethodCall<flutter::EncodableValue>& method_call,
      std::unique_ptr<flutter::MethodResult<flutter::EncodableValue>> result);

    void onWebViewCreated() const;
  };
}

#endif //CYGNUS_CORE_PLUGIN_HEADLESS_WEBVIEW_CHANNEL_DELEGATE_H_