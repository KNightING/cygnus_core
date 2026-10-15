#ifndef CYGNUS_CORE_PLUGIN_CYGNUS_BROWSER_CHANNEL_DELEGATE_H_
#define CYGNUS_CORE_PLUGIN_CYGNUS_BROWSER_CHANNEL_DELEGATE_H_

#include <flutter_linux/flutter_linux.h>

#include <string>

#include "../types/channel_delegate.h"

namespace cygnus_core_plugin {

class CygnusBrowser;

/// Channel delegate for CygnusBrowser instance communication
///
/// Handles method calls from Dart and sends events back to the Dart side.
/// Each CygnusBrowser instance has its own channel delegate with a unique channel name.
class CygnusBrowserChannelDelegate : public ChannelDelegate {
 public:
  /// Create a channel delegate for a specific browser instance
  /// @param browser The browser instance this delegate belongs to
  /// @param messenger The Flutter binary messenger
  /// @param channelName The unique channel name for this browser
  CygnusBrowserChannelDelegate(CygnusBrowser* browser, FlBinaryMessenger* messenger,
                              const std::string& channelName);
  ~CygnusBrowserChannelDelegate() override;

  /// Handle method calls from Flutter
  void HandleMethodCall(FlMethodCall* method_call) override;

  /// Notify Dart that the browser window has been created
  void onBrowserCreated() const;

  /// Notify Dart that a menu item was clicked
  /// @param menuItemId The ID of the clicked menu item
  void onMenuItemClicked(int32_t menuItemId) const;

  /// Notify Dart that the browser window is about to close
  void onExit() const;

 private:
  CygnusBrowser* browser_ = nullptr;
};

}  // namespace cygnus_core_plugin

#endif  // CYGNUS_CORE_PLUGIN_CYGNUS_BROWSER_CHANNEL_DELEGATE_H_
