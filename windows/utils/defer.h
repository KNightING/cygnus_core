#ifndef CYGNUS_CORE_PLUGIN_UTIL_DEFER_H_
#define CYGNUS_CORE_PLUGIN_UTIL_DEFER_H_

#include <functional>
#include <memory>

namespace cygnus_core_plugin
{
  static inline std::shared_ptr<void> defer(void* handle, const std::function<void(void*)>& callback)
  {
    return std::shared_ptr<void>(handle, callback);
  }
}

#endif //CYGNUS_CORE_PLUGIN_UTIL_DEFER_H_