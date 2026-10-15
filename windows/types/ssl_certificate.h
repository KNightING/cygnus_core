#ifndef CYGNUS_CORE_PLUGIN_SSL_CERTIFICATE_H_
#define CYGNUS_CORE_PLUGIN_SSL_CERTIFICATE_H_

#include <flutter/standard_method_codec.h>

namespace cygnus_core_plugin
{
  class SslCertificate
  {
  public:
    const std::string x509Certificate;

    SslCertificate(std::string x509Certificate);
    ~SslCertificate() = default;

    flutter::EncodableMap toEncodableMap() const;
  };
}

#endif //CYGNUS_CORE_PLUGIN_SSL_CERTIFICATE_H_