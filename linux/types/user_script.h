#ifndef CYGNUS_CORE_PLUGIN_USER_SCRIPT_H_
#define CYGNUS_CORE_PLUGIN_USER_SCRIPT_H_

#include <flutter_linux/flutter_linux.h>

#include <memory>
#include <optional>
#include <string>
#include <vector>

#include "content_world.h"

namespace cygnus_core_plugin {

enum class UserScriptInjectionTime {
  atDocumentStart = 0,
  atDocumentEnd = 1,
};

/**
 * Represents a user script to be injected into the web view.
 */
class UserScript {
 public:
  std::optional<std::string> groupName;
  std::string source;
  UserScriptInjectionTime injectionTime;
  bool forMainFrameOnly;
  std::optional<std::vector<std::string>> allowedOriginRules;
  std::shared_ptr<ContentWorld> contentWorld;

  UserScript(const std::optional<std::string>& groupName, const std::string& source,
             UserScriptInjectionTime injectionTime, bool forMainFrameOnly,
             const std::optional<std::vector<std::string>>& allowedOriginRules = std::nullopt,
             std::shared_ptr<ContentWorld> contentWorld = nullptr);

  UserScript(FlValue* map);

  FlValue* toFlValue() const;

  bool operator==(const UserScript& other) const;
};

}  // namespace cygnus_core_plugin

#endif  // CYGNUS_CORE_PLUGIN_USER_SCRIPT_H_
