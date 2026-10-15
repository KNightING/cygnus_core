#ifndef CYGNUS_CORE_PLUGIN_JAVASCRIPT_HANDLER_FUNCTION_DATA_H_
#define CYGNUS_CORE_PLUGIN_JAVASCRIPT_HANDLER_FUNCTION_DATA_H_

#include <flutter/standard_method_codec.h>
#include <string>

namespace cygnus_core_plugin
{
  class JavaScriptHandlerFunctionData
  {
  public:
    const std::string origin;
    const std::string requestUrl;
    const bool isMainFrame;
    const std::string args;

    JavaScriptHandlerFunctionData(const std::string& origin, const std::string& requestUrl, const bool& isMainFrame, const std::string& args);
    JavaScriptHandlerFunctionData(const flutter::EncodableMap& map);
    ~JavaScriptHandlerFunctionData() = default;

    flutter::EncodableMap toEncodableMap() const;
  };
}

#endif //CYGNUS_CORE_PLUGIN_JAVASCRIPT_HANDLER_FUNCTION_DATA_H_