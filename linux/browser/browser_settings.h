#ifndef CYGNUS_CORE_PLUGIN_CYGNUS_BROWSER_SETTINGS_H_
#define CYGNUS_CORE_PLUGIN_CYGNUS_BROWSER_SETTINGS_H_

#include <flutter_linux/flutter_linux.h>

#include <memory>
#include <optional>
#include <string>

namespace cygnus_core_plugin {

class CygnusBrowser;

/// Window type for CygnusBrowser
enum class CygnusBrowserWindowType {
  window,  // Top-level window
  child    // Child window (transient for parent)
};

/// Rect structure for window frame
struct CygnusBrowserRect {
  double x = 0;
  double y = 0;
  double width = 0;
  double height = 0;

  CygnusBrowserRect() = default;
  CygnusBrowserRect(double x, double y, double width, double height)
      : x(x), y(y), width(width), height(height) {}
  explicit CygnusBrowserRect(FlValue* map);

  FlValue* toFlValue() const;
};

/// Settings class for CygnusBrowser
///
/// Stores configuration options for the browser window appearance and behavior.
class CygnusBrowserSettings {
 public:
  /// Start with hidden window
  bool hidden = false;

  /// Hide the top toolbar
  bool hideToolbarTop = false;

  /// Toolbar background color (CSS color string, e.g., "#RRGGBB" or "#AARRGGBB")
  std::string toolbarTopBackgroundColor;

  /// Hide the URL bar in the toolbar
  bool hideUrlBar = false;

  /// Hide the progress bar
  bool hideProgressBar = false;

  /// Hide the default menu items (back, forward, reload)
  bool hideDefaultMenuItems = false;

  /// Fixed title for the window (instead of using page title)
  std::string toolbarTopFixedTitle;

  /// Window type (top-level or child)
  CygnusBrowserWindowType windowType = CygnusBrowserWindowType::window;

  /// Window opacity (0.0 to 1.0)
  double windowAlphaValue = 1.0;

  /// Window frame (position and size)
  std::shared_ptr<CygnusBrowserRect> windowFrame;

  CygnusBrowserSettings();
  explicit CygnusBrowserSettings(FlValue* map);
  ~CygnusBrowserSettings();

  /// Convert settings to FlValue map
  FlValue* toFlValue() const;

  /// Get actual settings from a live browser instance
  FlValue* getRealSettings(const CygnusBrowser* browser) const;
};

}  // namespace cygnus_core_plugin

#endif  // CYGNUS_CORE_PLUGIN_CYGNUS_BROWSER_SETTINGS_H_
