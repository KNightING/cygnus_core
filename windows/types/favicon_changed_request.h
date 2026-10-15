#ifndef CYGNUS_CORE_PLUGIN_FAVICON_CHANGED_REQUEST_H_
#define CYGNUS_CORE_PLUGIN_FAVICON_CHANGED_REQUEST_H_

#include <flutter/standard_method_codec.h>
#include <optional>
#include <string>
#include <vector>

#include "../utils/flutter.h"

namespace cygnus_core_plugin
{
  class FaviconChangedRequest
  {
  public:
    const std::optional<std::vector<uint8_t>> icon;
    const std::optional<std::string> url;

    FaviconChangedRequest(const std::optional<std::vector<uint8_t>>& icon, const std::optional<std::string>& url);
    ~FaviconChangedRequest() = default;

    flutter::EncodableMap toEncodableMap() const;
  };
}

#endif //CYGNUS_CORE_PLUGIN_FAVICON_CHANGED_REQUEST_H_