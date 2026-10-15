#ifndef CYGNUS_CORE_PLUGIN_JS_PROMPT_REQUEST_H_
#define CYGNUS_CORE_PLUGIN_JS_PROMPT_REQUEST_H_

#include <flutter_linux/flutter_linux.h>

#include <optional>
#include <string>

namespace cygnus_core_plugin {

/**
 * Represents a JavaScript prompt() dialog request.
 */
class JsPromptRequest {
 public:
  std::optional<std::string> url;
  std::string message;
  std::optional<std::string> defaultValue;
  bool isMainFrame;

  JsPromptRequest(const std::optional<std::string>& url, const std::string& message,
                  const std::optional<std::string>& defaultValue, bool isMainFrame);
  ~JsPromptRequest() = default;

  FlValue* toFlValue() const;
};

}  // namespace cygnus_core_plugin

#endif  // CYGNUS_CORE_PLUGIN_JS_PROMPT_REQUEST_H_
