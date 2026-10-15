#include "../utils/log.h"
#include "headless_webview.h"

namespace cygnus_core_plugin
{
  using namespace Microsoft::WRL;

  CygnusHeadlessWebView::CygnusHeadlessWebView(const CygnusCorePlugin* plugin, const CygnusHeadlessWebViewCreationParams& params, const HWND parentWindow, std::unique_ptr<CygnusWebView> webView)
    : plugin(plugin), id(params.id),
    webView(std::move(webView)),
    channelDelegate(std::make_unique<HeadlessWebViewChannelDelegate>(this, plugin->registrar->messenger()))
  {
    prepare(params);
    ShowWindow(parentWindow, SW_HIDE);
  }

  void CygnusHeadlessWebView::prepare(const CygnusHeadlessWebViewCreationParams& params)
  {
    if (!webView) {
      return;
    }
  }

  void CygnusHeadlessWebView::setSize(const std::shared_ptr<Size2D> size) const
  {
    if (!webView) {
      return;
    }
    RECT rect = {
      0, 0, (LONG)size->width, (LONG)size->height
    };
    webView->webViewController->put_Bounds(rect);
  }

  std::shared_ptr<Size2D> CygnusHeadlessWebView::getSize() const
  {
    if (!webView) {
      return std::make_shared<Size2D>(-1.0, -1.0);
    }
    RECT rect;
    webView->webViewController->get_Bounds(&rect);
    auto width = rect.right - rect.left;
    auto height = rect.bottom - rect.top;
    return std::make_shared<Size2D>((double)width, (double)height);
  }

  CygnusHeadlessWebView::~CygnusHeadlessWebView()
  {
    debugLog("dealloc CygnusHeadlessWebView");
    HWND parentWindow = nullptr;
    if (webView && webView->webViewController) {
      webView->webViewController->get_ParentWindow(&parentWindow);
    }
    webView = nullptr;
    if (parentWindow) {
      DestroyWindow(parentWindow);
    }
  }
}