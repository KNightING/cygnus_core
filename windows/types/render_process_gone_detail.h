#ifndef CYGNUS_CORE_PLUGIN_RENDER_PROCESS_GONE_DETAIL_H_
#define CYGNUS_CORE_PLUGIN_RENDER_PROCESS_GONE_DETAIL_H_

#include <flutter/standard_method_codec.h>

namespace cygnus_core_plugin
{

  class RenderProcessGoneDetail
  {
  public:
    const bool didCrash;

      RenderProcessGoneDetail(const bool& didCrash);
    ~RenderProcessGoneDetail() = default;

    flutter::EncodableMap toEncodableMap() const;
  };
}

#endif //CYGNUS_CORE_PLUGIN_RENDER_PROCESS_GONE_DETAIL_H_