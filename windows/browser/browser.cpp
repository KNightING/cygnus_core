#include <Windows.h>

#include "../utils/log.h"
#include "../utils/strconv.h"
#include "../webview_environment/webview_environment_manager.h"
#include "browser.h"
#include "browser_manager.h"

namespace cygnus_core_plugin
{
  CygnusBrowser::CygnusBrowser(const CygnusCorePlugin* plugin, const CygnusBrowserCreationParams& params)
    : plugin(plugin),
    m_hInstance(GetModuleHandle(nullptr)),
    id(params.id),
    settings(params.initialSettings),
    channelDelegate(std::make_unique<CygnusBrowserChannelDelegate>(id, plugin->registrar->messenger()))
  {

    WNDCLASS wndClass = {};
    wndClass.lpszClassName = CygnusBrowser::CLASS_NAME;
    wndClass.hInstance = m_hInstance;
    wndClass.hIcon = LoadIcon(NULL, IDI_WINLOGO);
    wndClass.hCursor = LoadCursor(NULL, IDC_ARROW);
    wndClass.hbrBackground = (HBRUSH)GetStockObject(WHITE_BRUSH);
    wndClass.lpfnWndProc = CygnusBrowser::WndProc;

    RegisterClass(&wndClass);

    auto parentWindow = plugin->registrar->GetView()->GetNativeWindow();
    RECT bounds;
    GetWindowRect(parentWindow, &bounds);

    auto x = CW_USEDEFAULT;
    auto y = CW_USEDEFAULT;
    auto width = bounds.right - bounds.left;
    auto height = bounds.bottom - bounds.top;

    if (settings->windowFrame) {
      x = (int)settings->windowFrame->x;
      y = (int)settings->windowFrame->y;
      width = (int)settings->windowFrame->width;
      height = (int)settings->windowFrame->height;
    }

    m_hWnd = CreateWindowEx(
      WS_EX_LAYERED,            // Optional window styles.
      wndClass.lpszClassName,		// Window class

      settings->toolbarTopFixedTitle.empty() ? L"" : utf8_to_wide(settings->toolbarTopFixedTitle).c_str(),	// Window text

      settings->windowType == CygnusBrowserWindowType::window ? WS_OVERLAPPEDWINDOW : (WS_CHILDWINDOW | WS_OVERLAPPEDWINDOW), // Window style

      // Position
      x, y,
      // Size
      width, height,

      settings->windowType == CygnusBrowserWindowType::window ? nullptr : parentWindow, // Parent window    
      nullptr,             // Menu
      wndClass.hInstance,  // Instance handle
      this                 // Additional application data
    );

    SetLayeredWindowAttributes(m_hWnd, 0, (BYTE)(255 * settings->windowAlphaValue), LWA_ALPHA);

    ShowWindow(m_hWnd, settings->hidden ? SW_HIDE : SW_SHOW);

    CygnusWebViewCreationParams webViewParams = {
      id,
      params.initialWebViewSettings,
      params.initialUserScripts
    };

    auto webViewEnvironment = params.webViewEnvironmentId.has_value() && map_contains(plugin->webViewEnvironmentManager->webViewEnvironments, params.webViewEnvironmentId.value())
      ? plugin->webViewEnvironmentManager->webViewEnvironments.at(params.webViewEnvironmentId.value()).get() : nullptr;

    CygnusWebView::createCygnusWebViewEnv(m_hWnd, false, webViewEnvironment, params.initialWebViewSettings,
      [this, params, webViewParams](wil::com_ptr<ICoreWebView2Environment> webViewEnv, wil::com_ptr<ICoreWebView2Controller> webViewController, wil::com_ptr<ICoreWebView2CompositionController> webViewCompositionController) -> void
      {
        if (webViewEnv && webViewController) {
          webView = std::make_unique<CygnusWebView>(this, this->plugin, webViewParams, m_hWnd, std::move(webViewEnv), std::move(webViewController), nullptr);
          webView->initChannel(std::nullopt, CygnusBrowser::METHOD_CHANNEL_NAME_PREFIX + id);

          if (channelDelegate) {
            channelDelegate->onBrowserCreated();
          }

          if (params.urlRequest.has_value()) {
            webView->loadUrl(params.urlRequest.value());
          }
          else if (params.assetFilePath.has_value()) {
            webView->loadFile(params.assetFilePath.value());
          }
          else if (params.data.has_value()) {
            webView->loadData(params.data.value());
          }
        }
        else {
          std::cerr << "Cannot create the CygnusWebView instance!" << std::endl;
          close();
        }
      });
  }

  void CygnusBrowser::close() const
  {
    DestroyWindow(m_hWnd);
  }

  void CygnusBrowser::show() const
  {
    ShowWindow(m_hWnd, SW_SHOW);
  }

  void CygnusBrowser::hide() const
  {
    ShowWindow(m_hWnd, SW_HIDE);
  }

  bool CygnusBrowser::isHidden() const
  {
    return !IsWindowVisible(m_hWnd);
  }

  void CygnusBrowser::setSettings(const std::shared_ptr<CygnusBrowserSettings> newSettings, const flutter::EncodableMap& newSettingsMap)
  {
    if (webView) {
      webView->setSettings(std::make_shared<CygnusWebViewSettings>(newSettingsMap), newSettingsMap);
    }

    if (fl_map_contains_not_null(newSettingsMap, "hidden") && settings->hidden != newSettings->hidden) {
      newSettings->hidden ? hide() : show();
    }

    if (fl_map_contains_not_null(newSettingsMap, "toolbarTopFixedTitle") && !string_equals(settings->toolbarTopFixedTitle, newSettings->toolbarTopFixedTitle) && !newSettings->toolbarTopFixedTitle.empty()) {
      SetWindowText(m_hWnd, utf8_to_wide(newSettings->toolbarTopFixedTitle).c_str());
    }

    if (fl_map_contains_not_null(newSettingsMap, "windowAlphaValue") && settings->windowAlphaValue != newSettings->windowAlphaValue) {
      SetLayeredWindowAttributes(m_hWnd, 0, (BYTE)(255 * newSettings->windowAlphaValue), LWA_ALPHA);
    }

    if (fl_map_contains_not_null(newSettingsMap, "windowFrame")) {
      auto x = (int)newSettings->windowFrame->x;
      auto y = (int)newSettings->windowFrame->y;
      auto width = (int)newSettings->windowFrame->width;
      auto height = (int)newSettings->windowFrame->height;
      MoveWindow(m_hWnd, x, y, width, height, true);
    }

    settings = newSettings;
  }

  flutter::EncodableValue CygnusBrowser::getSettings() const
  {
    if (!settings || !webView) {
      return make_fl_value();
    }

    auto encodableMap = settings->getRealSettings(this);
    encodableMap.merge(std::get<flutter::EncodableMap>(webView->getSettings()));
    return encodableMap;
  }

  void CygnusBrowser::didChangeTitle(const std::optional<std::string>& title) const
  {
    if (title.has_value() && settings->toolbarTopFixedTitle.empty()) {
      SetWindowText(m_hWnd, utf8_to_wide(title.value()).c_str());
    }
  }

  LRESULT CALLBACK CygnusBrowser::WndProc(
    HWND window,
    UINT message,
    WPARAM wparam,
    LPARAM lparam
  ) noexcept
  {
    if (message == WM_NCCREATE) {
      auto window_struct = reinterpret_cast<CREATESTRUCT*>(lparam);
      SetWindowLongPtr(window, GWLP_USERDATA, reinterpret_cast<LONG_PTR>(window_struct->lpCreateParams));
    }
    else if (CygnusBrowser* that = GetThisFromHandle(window)) {
      return that->MessageHandler(window, message, wparam, lparam);
    }

    return DefWindowProc(window, message, wparam, lparam);
  }

  LRESULT CygnusBrowser::MessageHandler(
    HWND hwnd,
    UINT message,
    WPARAM wparam,
    LPARAM lparam
  ) noexcept
  {
    switch (message) {
    case WM_DESTROY: {
      // might receive multiple WM_DESTROY messages.
      if (!destroyed_) {
        destroyed_ = true;

        if (channelDelegate) {
          channelDelegate->onExit();
        }

        if (channelDelegate) {
          channelDelegate->UnregisterMethodCallHandler();
          if (webView && webView->channelDelegate) {
            webView->channelDelegate->UnregisterMethodCallHandler();
          }
        }
        webView.reset();

        if (plugin && plugin->cygnusBrowserManager) {
          plugin->cygnusBrowserManager->browsers.erase(id);
        }
      }
      return 0;
    }
    case WM_DPICHANGED: {
      auto newRectSize = reinterpret_cast<RECT*>(lparam);
      LONG newWidth = newRectSize->right - newRectSize->left;
      LONG newHeight = newRectSize->bottom - newRectSize->top;

      SetWindowPos(hwnd, nullptr, newRectSize->left, newRectSize->top, newWidth,
        newHeight, SWP_NOZORDER | SWP_NOACTIVATE);
      return 0;
    }
    case WM_SIZE: {
      RECT bounds;
      GetClientRect(hwnd, &bounds);
      if (webView) {
        webView->webViewController->put_Bounds(bounds);
      }
      return 0;
    }
    case WM_ACTIVATE: {
      return 0;
    }
    }

    return DefWindowProc(hwnd, message, wparam, lparam);
  }

  CygnusBrowser* CygnusBrowser::GetThisFromHandle(HWND const window) noexcept
  {
    return reinterpret_cast<CygnusBrowser*>(
      GetWindowLongPtr(window, GWLP_USERDATA));
  }

  CygnusBrowser::~CygnusBrowser()
  {
    debugLog("dealloc CygnusBrowser");
    webView.reset();
    SetWindowLongPtr(m_hWnd, GWLP_USERDATA, 0);
    plugin = nullptr;
  }

}