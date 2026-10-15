#ifndef CYGNUS_CORE_PLUGIN_FIND_INTERACTION_CHANNEL_DELEGATE_H_
#define CYGNUS_CORE_PLUGIN_FIND_INTERACTION_CHANNEL_DELEGATE_H_

#include <flutter/method_channel.h>
#include <flutter/standard_message_codec.h>

#include <string>

#include "../types/channel_delegate.h"

namespace cygnus_core_plugin
{
  class FindInteractionController;

  class FindInteractionChannelDelegate : public ChannelDelegate
  {
  public:
    FindInteractionChannelDelegate(FindInteractionController* findInteractionController,
      flutter::BinaryMessenger* messenger, const std::string& channelName);
    ~FindInteractionChannelDelegate() override;

    void HandleMethodCall(
      const flutter::MethodCall<flutter::EncodableValue>& method_call,
      std::unique_ptr<flutter::MethodResult<flutter::EncodableValue>> result) override;

    void onFindResultReceived(const int32_t activeMatchOrdinal, const int32_t numberOfMatches,
      const bool isDoneCounting) const;

    void dispose();

  private:
    FindInteractionController* findInteractionController_;
  };
}

#endif //CYGNUS_CORE_PLUGIN_FIND_INTERACTION_CHANNEL_DELEGATE_H_
