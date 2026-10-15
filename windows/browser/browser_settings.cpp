#include "../utils/flutter.h"
#include "../utils/log.h"
#include "../utils/string.h"
#include "browser_settings.h"

#include "browser.h"

namespace cygnus_core_plugin
{
  namespace
  {
    CygnusBrowserWindowType cygnusBrowserWindowTypeFromString(const std::string& s)
    {
      if (string_equals(s, "CHILD")) {
        return CygnusBrowserWindowType::child;
      }
      return CygnusBrowserWindowType::window;
    }

    std::string cygnusBrowserWindowTypeToString(const CygnusBrowserWindowType& t)
    {
      switch (t) {
      case CygnusBrowserWindowType::child:
        return "CHILD";
      default:
        return "WINDOW";
      }
    }
  }

  CygnusBrowserSettings::CygnusBrowserSettings() {};

  CygnusBrowserSettings::CygnusBrowserSettings(const flutter::EncodableMap& encodableMap)
  {
    hidden = get_fl_map_value(encodableMap, "hidden", hidden);
    windowType = cygnusBrowserWindowTypeFromString(get_fl_map_value<std::string>(encodableMap, "windowType", cygnusBrowserWindowTypeToString(CygnusBrowserWindowType::window)));
    toolbarTopFixedTitle = get_fl_map_value(encodableMap, "toolbarTopFixedTitle", toolbarTopFixedTitle);
    windowAlphaValue = get_fl_map_value(encodableMap, "windowAlphaValue", windowAlphaValue);
    auto windowFrameMap = get_optional_fl_map_value<flutter::EncodableMap>(encodableMap, "windowFrame");
    if (windowFrameMap.has_value()) {
      windowFrame = std::make_shared<Rect>(windowFrameMap.value());
    }
  }

  flutter::EncodableMap CygnusBrowserSettings::toEncodableMap() const
  {
    return flutter::EncodableMap{
      {"hidden", hidden},
      {"windowType", cygnusBrowserWindowTypeToString(windowType)},
      {"toolbarTopFixedTitle", toolbarTopFixedTitle},
      {"windowAlphaValue", windowAlphaValue},
      {"windowFrame", windowFrame ? windowFrame->toEncodableMap() : make_fl_value()},
    };
  }

  flutter::EncodableMap CygnusBrowserSettings::getRealSettings(const CygnusBrowser* cygnusBrowser) const
  {
    auto settingsMap = toEncodableMap();
    settingsMap["hidden"] = cygnusBrowser->isHidden();

    BYTE alphaValue = 0;
    GetLayeredWindowAttributes(cygnusBrowser->getHWND(), nullptr, &alphaValue, nullptr);
    settingsMap["windowAlphaValue"] = (double)alphaValue;

    RECT position;
    GetWindowRect(cygnusBrowser->getHWND(), &position);
    settingsMap["windowFrame"] = std::make_unique<Rect>(position.left, position.top, position.right - position.left, position.bottom - position.top)->toEncodableMap();

    return settingsMap;
  }

  CygnusBrowserSettings::~CygnusBrowserSettings()
  {
    debugLog("dealloc CygnusBrowserSettings");
  };
}
