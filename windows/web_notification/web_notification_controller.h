#ifndef CYGNUS_CORE_PLUGIN_WEB_NOTIFICATION_CONTROLLER_H_
#define CYGNUS_CORE_PLUGIN_WEB_NOTIFICATION_CONTROLLER_H_

#include <flutter/binary_messenger.h>
#include <flutter/standard_message_codec.h>
#include <WebView2.h>
#include <wil/com.h>

#include <functional>
#include <memory>
#include <optional>
#include <string>

#include "../types/web_notification.h"

namespace cygnus_core_plugin
{
  class WebNotificationChannelDelegate;
  class CygnusWebView;

  class WebNotificationController
  {
  public:
    static inline const std::string METHOD_CHANNEL_NAME_PREFIX = "com.github.knighting.cygnus/webview_webnotificationcontroller_";

    const std::string id;
    std::shared_ptr<WebNotification> notification;
    std::unique_ptr<WebNotificationChannelDelegate> channelDelegate;

    WebNotificationController(const std::string& id,
      wil::com_ptr<ICoreWebView2Notification> webNotification,
      std::shared_ptr<WebNotification> notification,
      flutter::BinaryMessenger* messenger,
      CygnusWebView* cygnusWebView);
    ~WebNotificationController();

    void reportShown();
    void reportClicked();
    void reportClosed();
    void dispose();

    // Called by CygnusWebView before destruction to invalidate pointer
    void invalidateParentWebView();

    CygnusWebView* getParentWebView() const { return cygnusWebView_; }

  private:
    wil::com_ptr<ICoreWebView2Notification> webNotification_;
    CygnusWebView* cygnusWebView_ = nullptr;
    EventRegistrationToken closeRequestedToken_{};
    bool closeRequestedRegistered_ = false;
    bool disposed_ = false;

    void registerEventHandlers();
    void unregisterEventHandlers();
    void eraseFromParentWebView();
  };
}

#endif //CYGNUS_CORE_PLUGIN_WEB_NOTIFICATION_CONTROLLER_H_
