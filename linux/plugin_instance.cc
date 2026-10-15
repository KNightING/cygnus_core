#include "plugin_instance.h"

#include "cygnus_core_plugin_private.h"

namespace cygnus_core_plugin {

PluginInstance::PluginInstance(FlPluginRegistrar* registrar)
    : registrar_(registrar) {
  // Cache the GTK window and FlView now while the registrar is still fully valid
  gtk_window_ = cygnus_core_plugin_get_window(registrar);
  fl_view_ = cygnus_core_plugin_get_view(registrar);
}

FlBinaryMessenger* PluginInstance::messenger() const {
  return fl_plugin_registrar_get_messenger(registrar_);
}

FlTextureRegistrar* PluginInstance::textureRegistrar() const {
  return fl_plugin_registrar_get_texture_registrar(registrar_);
}

}  // namespace cygnus_core_plugin
