#ifndef CYGNUS_CORE_PLUGIN_PRIVATE_H_
#define CYGNUS_CORE_PLUGIN_PRIVATE_H_

#include <flutter_linux/flutter_linux.h>
#include <gtk/gtk.h>

#include <memory>

G_BEGIN_DECLS

// Get the FlView from the plugin registrar
// Returns nullptr if not available
FlView* cygnus_core_plugin_get_view(FlPluginRegistrar* registrar);

// Get the GtkWindow from the plugin registrar (via FlView)
// Returns nullptr if not available
GtkWindow* cygnus_core_plugin_get_window(FlPluginRegistrar* registrar);

// Get the monitor refresh rate in millihertz for the window
// Returns 0 if not available or unknown
int cygnus_core_plugin_get_monitor_refresh_rate(FlPluginRegistrar* registrar);

// Get the monitor refresh rate in millihertz for the given GtkWindow
// Returns 0 if not available or unknown
int cygnus_core_plugin_get_monitor_refresh_rate_for_window(GtkWindow* window);

G_END_DECLS

#endif  // CYGNUS_CORE_PLUGIN_PRIVATE_H_
