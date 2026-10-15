#ifndef CYGNUS_CORE_PLUGIN_JS_BEFORE_UNLOAD_RESPONSE_H_
#define CYGNUS_CORE_PLUGIN_JS_BEFORE_UNLOAD_RESPONSE_H_

#include <flutter_linux/flutter_linux.h>

#include <optional>
#include <string>

namespace cygnus_core_plugin {

/**
 * Response for beforeunload dialogs.
 */
class JsBeforeUnloadResponse {
 public:
  bool handledByClient;
  bool shouldAllowNavigation;
  std::optional<std::string> message;

  JsBeforeUnloadResponse();
  JsBeforeUnloadResponse(FlValue* map);
  ~JsBeforeUnloadResponse() = default;
};

}  // namespace cygnus_core_plugin

#endif  // CYGNUS_CORE_PLUGIN_JS_BEFORE_UNLOAD_RESPONSE_H_
