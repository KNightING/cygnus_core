#ifndef CYGNUS_CORE_PLUGIN_PLUGIN_SCRIPT_H_
#define CYGNUS_CORE_PLUGIN_PLUGIN_SCRIPT_H_

#include "user_script.h"

namespace cygnus_core_plugin
{
  class PluginScript : public UserScript
  {
  public:

    PluginScript(
      const std::optional<std::string>& groupName,
      const std::string& source,
      const UserScriptInjectionTime& injectionTime,
      const bool& forMainFrameOnly,
      const std::optional<std::vector<std::string>>& allowedOriginRules,
      std::shared_ptr<ContentWorld> contentWorld,
      const bool& requiredInAllContentWorlds
    );
    ~PluginScript();

    bool isRequiredInAllContentWorlds() const
    {
      return requiredInAllContentWorlds_;
    }

    std::shared_ptr<PluginScript> copyAndSet(const std::shared_ptr<ContentWorld> cw) const;

  private:
    bool requiredInAllContentWorlds_;
  };
}
#endif //CYGNUS_CORE_PLUGIN_PLUGIN_SCRIPT_H_