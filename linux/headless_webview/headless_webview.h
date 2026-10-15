#ifndef CYGNUS_CORE_PLUGIN_HEADLESS_CYGNUS_WEBVIEW_H_
#define CYGNUS_CORE_PLUGIN_HEADLESS_CYGNUS_WEBVIEW_H_

#include <flutter_linux/flutter_linux.h>

#include <memory>
#include <string>

#include "../webview/webview.h"
#include "headless_webview_channel_delegate.h"

namespace cygnus_core_plugin {

class CygnusHeadlessWebViewManager;

struct CygnusHeadlessWebViewCreationParams {
  std::string id;
  double initialWidth = -1;
  double initialHeight = -1;
};

/// CygnusHeadlessWebView - A WebView without visual output
///
/// This class wraps CygnusWebView for headless operation.
/// Since WPE WebKit is inherently headless (it renders to offscreen buffers),
/// this is essentially CygnusWebView without texture registration.
class CygnusHeadlessWebView {
 public:

  CygnusHeadlessWebView(CygnusHeadlessWebViewManager* manager,
                       const CygnusHeadlessWebViewCreationParams& params,
                       const CygnusWebViewCreationParams& webviewParams);
  ~CygnusHeadlessWebView();

  const std::string& id() const { return id_; }
  CygnusWebView* webview() const { return webview_.get(); }
  CygnusHeadlessWebViewManager* manager() const { return manager_; }

  // Size management
  void setSize(double width, double height);
  void getSize(double* width, double* height) const;

  // Get the channel delegate
  HeadlessWebViewChannelDelegate* channelDelegate() const { return channelDelegate_.get(); }

  // Dispose this headless webview (called by channel delegate)
  void dispose();

 private:
  CygnusHeadlessWebViewManager* manager_ = nullptr;
  std::string id_;
  double width_ = -1;
  double height_ = -1;

  // The underlying CygnusWebView
  std::shared_ptr<CygnusWebView> webview_;

  // Channel delegate for this headless webview
  std::unique_ptr<HeadlessWebViewChannelDelegate> channelDelegate_;
};

}  // namespace cygnus_core_plugin

#endif  // CYGNUS_CORE_PLUGIN_HEADLESS_CYGNUS_WEBVIEW_H_
