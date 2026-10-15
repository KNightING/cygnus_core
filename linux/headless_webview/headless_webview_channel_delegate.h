#ifndef CYGNUS_CORE_PLUGIN_HEADLESS_WEBVIEW_CHANNEL_DELEGATE_H_
#define CYGNUS_CORE_PLUGIN_HEADLESS_WEBVIEW_CHANNEL_DELEGATE_H_

#include <flutter_linux/flutter_linux.h>

#include <memory>
#include <string>

#include "../types/channel_delegate.h"

namespace cygnus_core_plugin {

class CygnusHeadlessWebView;

/**
 * Channel delegate for CygnusHeadlessWebView.
 * Handles method calls specific to headless webview operations (dispose, setSize, getSize).
 * This mirrors the iOS HeadlessWebViewChannelDelegate pattern.
 */
class HeadlessWebViewChannelDelegate : public ChannelDelegate {
 public:
  static constexpr const char* METHOD_CHANNEL_NAME_PREFIX =
      "com.github.knighting.cygnus/headless_webview_";

  HeadlessWebViewChannelDelegate(CygnusHeadlessWebView* headlessWebView,
                                  FlBinaryMessenger* messenger,
                                  const std::string& id);
  ~HeadlessWebViewChannelDelegate() override;

  void HandleMethodCall(FlMethodCall* method_call) override;

  // === Events to send to Dart ===

  /**
   * Notify Dart that the headless webview has been created.
   */
  void onWebViewCreated() const;

 private:
  CygnusHeadlessWebView* headlessWebView_ = nullptr;
};

}  // namespace cygnus_core_plugin

#endif  // CYGNUS_CORE_PLUGIN_HEADLESS_WEBVIEW_CHANNEL_DELEGATE_H_
