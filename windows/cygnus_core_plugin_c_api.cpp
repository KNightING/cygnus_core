#include "include/cygnus_core/cygnus_core_plugin_c_api.h"

#include <flutter/plugin_registrar_windows.h>

#include "cygnus_core_plugin.h"

void CygnusCorePluginCApiRegisterWithRegistrar(
  FlutterDesktopPluginRegistrarRef registrar)
{
  cygnus_core_plugin::CygnusCorePlugin::RegisterWithRegistrar(
    flutter::PluginRegistrarManager::GetInstance()
    ->GetRegistrar<flutter::PluginRegistrarWindows>(registrar));
}
