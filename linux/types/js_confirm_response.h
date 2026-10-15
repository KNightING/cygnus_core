#ifndef CYGNUS_CORE_PLUGIN_JS_CONFIRM_RESPONSE_H_
#define CYGNUS_CORE_PLUGIN_JS_CONFIRM_RESPONSE_H_

#include <flutter_linux/flutter_linux.h>

namespace cygnus_core_plugin {

/**
 * Response action for JS confirm dialogs.
 */
enum class JsConfirmResponseAction { CANCEL = 0, CONFIRM = 1 };

/**
 * Response to a JavaScript confirm() dialog.
 */
class JsConfirmResponse {
 public:
  bool handledByClient;
  JsConfirmResponseAction action;

  JsConfirmResponse();
  JsConfirmResponse(FlValue* map);
  ~JsConfirmResponse() = default;
};

}  // namespace cygnus_core_plugin

#endif  // CYGNUS_CORE_PLUGIN_JS_CONFIRM_RESPONSE_H_
