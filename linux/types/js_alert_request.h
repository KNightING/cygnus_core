#ifndef CYGNUS_CORE_PLUGIN_JS_ALERT_REQUEST_H_
#define CYGNUS_CORE_PLUGIN_JS_ALERT_REQUEST_H_

#include <flutter_linux/flutter_linux.h>

#include <optional>
#include <string>

namespace cygnus_core_plugin {

/**
 * Represents a JavaScript alert() dialog request.
 */
class JsAlertRequest {
 public:
  std::optional<std::string> url;
  std::string message;
  bool isMainFrame;

  JsAlertRequest(const std::optional<std::string>& url, const std::string& message,
                 bool isMainFrame);
  ~JsAlertRequest() = default;

  FlValue* toFlValue() const;
};

}  // namespace cygnus_core_plugin

#endif  // CYGNUS_CORE_PLUGIN_JS_ALERT_REQUEST_H_
