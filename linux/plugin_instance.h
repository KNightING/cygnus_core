#ifndef CYGNUS_CORE_PLUGIN_INSTANCE_H_
#define CYGNUS_CORE_PLUGIN_INSTANCE_H_

#include <flutter_linux/flutter_linux.h>
#include <gtk/gtk.h>

namespace cygnus_core_plugin {

// Forward declarations
class CygnusWebViewManager;
class CygnusHeadlessWebViewManager;
class CygnusBrowserManager;
class CookieManager;
class CredentialDatabase;
class ProxyManager;
class WebStorageManager;
class WebViewEnvironment;

/// Plugin instance - provides access to all managers
/// This is the C++ equivalent of CygnusCorePlugin
/// 
/// Following the Windows pattern, this class provides a way to pass
/// the plugin instance to all managers and components without using
/// a global variable.
class PluginInstance {
public:
  explicit PluginInstance(FlPluginRegistrar* registrar);
  ~PluginInstance() = default;

  // Prevent copying
  PluginInstance(const PluginInstance&) = delete;
  PluginInstance& operator=(const PluginInstance&) = delete;

  /// Get the Flutter plugin registrar
  FlPluginRegistrar* registrar() const { return registrar_; }

  /// Get the Flutter binary messenger
  FlBinaryMessenger* messenger() const;

  /// Get the Flutter texture registrar
  FlTextureRegistrar* textureRegistrar() const;

  /// Get the GTK window (may be nullptr for headless scenarios)
  GtkWindow* gtkWindow() const { return gtk_window_; }

  /// Get the Flutter view (may be nullptr for headless scenarios)
  FlView* flView() const { return fl_view_; }

  // Manager accessors - set by the main plugin after creation
  CygnusWebViewManager* cygnusWebViewManager = nullptr;
  CygnusHeadlessWebViewManager* headlessCygnusWebViewManager = nullptr;
  CygnusBrowserManager* cygnusBrowserManager = nullptr;
  CookieManager* cookieManager = nullptr;
  CredentialDatabase* credentialDatabase = nullptr;
  ProxyManager* proxyManager = nullptr;
  WebStorageManager* webStorageManager = nullptr;
  WebViewEnvironment* webViewEnvironment = nullptr;

private:
  FlPluginRegistrar* registrar_ = nullptr;
  GtkWindow* gtk_window_ = nullptr;  // Cached during plugin registration
  FlView* fl_view_ = nullptr;        // Cached during plugin registration
};

}  // namespace cygnus_core_plugin

#endif  // CYGNUS_CORE_PLUGIN_INSTANCE_H_
