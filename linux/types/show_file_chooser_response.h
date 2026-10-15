#ifndef CYGNUS_CORE_PLUGIN_SHOW_FILE_CHOOSER_RESPONSE_H_
#define CYGNUS_CORE_PLUGIN_SHOW_FILE_CHOOSER_RESPONSE_H_

#include <flutter_linux/flutter_linux.h>

#include <optional>
#include <string>
#include <vector>

namespace cygnus_core_plugin {

class ShowFileChooserResponse {
 public:
  bool handledByClient;
  std::optional<std::vector<std::string>> filePaths;

  ShowFileChooserResponse();
  ShowFileChooserResponse(bool handledByClient,
                          std::optional<std::vector<std::string>> filePaths);
  ~ShowFileChooserResponse() = default;

  static ShowFileChooserResponse fromFlValue(FlValue* value);

  FlValue* toFlValue() const;
};

}  // namespace cygnus_core_plugin

#endif  // CYGNUS_CORE_PLUGIN_SHOW_FILE_CHOOSER_RESPONSE_H_
