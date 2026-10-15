#ifndef CYGNUS_CORE_PLUGIN_CYGNUS_BROWSER_SETTINGS_H_
#define CYGNUS_CORE_PLUGIN_CYGNUS_BROWSER_SETTINGS_H_

#include <flutter/standard_message_codec.h>
#include <optional>
#include <string>

#include "../types/rect.h"

namespace cygnus_core_plugin
{
  class CygnusBrowser;

  enum class CygnusBrowserWindowType {
    window,
    child
  };

  class CygnusBrowserSettings
  {
  public:
    bool hidden = false;
    CygnusBrowserWindowType windowType = CygnusBrowserWindowType::window;
    std::string toolbarTopFixedTitle;
    double windowAlphaValue = 1.0;
    std::shared_ptr<Rect> windowFrame;

    CygnusBrowserSettings();
    CygnusBrowserSettings(const flutter::EncodableMap& encodableMap);
    ~CygnusBrowserSettings();

    flutter::EncodableMap toEncodableMap() const;
    flutter::EncodableMap getRealSettings(const CygnusBrowser* cygnusBrowser) const;
  };
}
#endif //CYGNUS_CORE_PLUGIN_CYGNUS_BROWSER_SETTINGS_H_