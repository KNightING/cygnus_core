#ifndef CYGNUS_CORE_PLUGIN_JS_ALERT_RESPONSE_H_
#define CYGNUS_CORE_PLUGIN_JS_ALERT_RESPONSE_H_

#include <flutter_linux/flutter_linux.h>

#include <optional>
#include <string>

namespace cygnus_core_plugin {

/**
 * Response action for JS alert dialogs.
 */
enum class JsAlertResponseAction { CONFIRM = 0 };

/**
 * Response to a JavaScript alert() dialog.
 */
class JsAlertResponse {
 public:
  bool handledByClient;
  JsAlertResponseAction action;
  std::optional<std::string> message;

  JsAlertResponse();
  JsAlertResponse(FlValue* map);
  ~JsAlertResponse() = default;
};

}  // namespace cygnus_core_plugin

#endif  // CYGNUS_CORE_PLUGIN_JS_ALERT_RESPONSE_H_
