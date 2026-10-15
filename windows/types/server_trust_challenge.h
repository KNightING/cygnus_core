#ifndef CYGNUS_CORE_PLUGIN_SERVER_TRUST_CHALLENGE_H_
#define CYGNUS_CORE_PLUGIN_SERVER_TRUST_CHALLENGE_H_

#include <flutter/standard_method_codec.h>
#include <optional>

#include "url_authentication_challenge.h"

namespace cygnus_core_plugin
{
  class ServerTrustChallenge : URLAuthenticationChallenge
  {
  public:
    ServerTrustChallenge(const std::shared_ptr<URLProtectionSpace> protectionSpace);
    ~ServerTrustChallenge() = default;

    flutter::EncodableMap toEncodableMap() const;
  };
}

#endif //CYGNUS_CORE_PLUGIN_SERVER_TRUST_CHALLENGE_H_