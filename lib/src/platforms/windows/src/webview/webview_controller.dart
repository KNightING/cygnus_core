import 'dart:collection';
import 'dart:convert';
import 'dart:core';
import 'dart:developer' as developer;
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:cygnus_core/src/platform_interface/flutter_webview_platform_interface.dart';

import '../browser/browser.dart';
import '../print_job/main.dart';
import '../web_message/web_message_channel.dart';
import '../web_message/web_message_listener.dart';
import '../web_notification/main.dart';
import '../web_storage/web_storage.dart';
import '_static_channel.dart';
import 'headless_webview.dart';

/// Object specifying creation parameters for creating a [WindowsInAppWebViewController].
///
/// When adding additional fields make sure they can be null or have a default
/// value to avoid breaking changes. See [CygnusPlatformWebViewControllerCreationParams] for
/// more information.
@immutable
class WindowsInAppWebViewControllerCreationParams
    extends CygnusPlatformWebViewControllerCreationParams {
  /// Creates a new [WindowsInAppWebViewControllerCreationParams] instance.
  const WindowsInAppWebViewControllerCreationParams({
    required super.id,
    super.webviewParams,
  });

  /// Creates a [WindowsInAppWebViewControllerCreationParams] instance based on [CygnusPlatformWebViewControllerCreationParams].
  factory WindowsInAppWebViewControllerCreationParams.fromPlatformWebViewControllerCreationParams(
    // Recommended placeholder to prevent being broken by platform interface.
    // ignore: avoid_unused_constructor_parameters
    CygnusPlatformWebViewControllerCreationParams params,
  ) {
    return WindowsInAppWebViewControllerCreationParams(
      id: params.id,
      webviewParams: params.webviewParams,
    );
  }
}

///Controls a WebView, such as an [CygnusWebView] widget instance, a [WindowsHeadlessInAppWebView] instance or [WindowsInAppBrowser] WebView instance.
///
///If you are using the [CygnusWebView] widget, an [CygnusWebViewController] instance can be obtained by setting the [CygnusWebView.onWebViewCreated]
///callback. Instead, if you are using an [WindowsInAppBrowser] instance, you can get it through the [WindowsInAppBrowser.webViewController] attribute.
class WindowsInAppWebViewController extends CygnusPlatformWebViewController
    with ChannelController {
  static final MethodChannel _staticChannel = IN_APP_WEBVIEW_STATIC_CHANNEL;

  // List of properties to be saved and restored for keep alive feature
  Map<String, Function> _javaScriptHandlersMap = HashMap<String, Function>();
  Map<CygnusUserScriptInjectionTime, List<CygnusUserScript>> _userScripts = {
    CygnusUserScriptInjectionTime.AT_DOCUMENT_START: <CygnusUserScript>[],
    CygnusUserScriptInjectionTime.AT_DOCUMENT_END: <CygnusUserScript>[],
  };
  Set<WindowsWebMessageListener> _webMessageListeners = Set();
  Set<String> _webMessageListenerObjNames = Set();
  Set<WindowsWebMessageChannel> _webMessageChannels = Set();
  Map<String, CygnusScriptHtmlTagAttributes> _injectedScriptsFromURL = {};
  Map<String, Function(dynamic data)> _devToolsProtocolEventListenerMap =
      HashMap();

  // static map that contains the properties to be saved and restored for keep alive feature
  static final Map<CygnusWebViewKeepAlive, CygnusWebViewControllerKeepAliveProps?>
  _keepAliveMap = {};

  WindowsInAppBrowser? _browser;

  CygnusPlatformBrowserEvents? get _browserEventHandler =>
      _browser?.eventHandler;

  dynamic _controllerFromPlatform;

  @override
  late WindowsWebStorage webStorage;

  WindowsInAppWebViewController(
    CygnusPlatformWebViewControllerCreationParams params,
  ) : super.implementation(
        params is WindowsInAppWebViewControllerCreationParams
            ? params
            : WindowsInAppWebViewControllerCreationParams.fromPlatformWebViewControllerCreationParams(
                params,
              ),
      ) {
    channel = MethodChannel('com.pichillilorenzo/flutter_inappwebview_$id');
    handler = handleMethod;
    initMethodCallHandler();

    final initialUserScripts = webviewParams?.initialUserScripts;
    if (initialUserScripts != null) {
      for (final userScript in initialUserScripts) {
        if (userScript.injectionTime ==
            CygnusUserScriptInjectionTime.AT_DOCUMENT_START) {
          this._userScripts[CygnusUserScriptInjectionTime.AT_DOCUMENT_START]?.add(
            userScript,
          );
        } else {
          this._userScripts[CygnusUserScriptInjectionTime.AT_DOCUMENT_END]?.add(
            userScript,
          );
        }
      }
    }

    this._init(params);
  }

  static final WindowsInAppWebViewController _staticValue =
      WindowsInAppWebViewController(
        WindowsInAppWebViewControllerCreationParams(id: null),
      );

  factory WindowsInAppWebViewController.static() {
    return _staticValue;
  }

  WindowsInAppWebViewController.fromBrowser(
    CygnusPlatformWebViewControllerCreationParams params,
    MethodChannel channel,
    WindowsInAppBrowser browser,
    UnmodifiableListView<CygnusUserScript>? initialUserScripts,
  ) : super.implementation(
        params is WindowsInAppWebViewControllerCreationParams
            ? params
            : WindowsInAppWebViewControllerCreationParams.fromPlatformWebViewControllerCreationParams(
                params,
              ),
      ) {
    this.channel = channel;
    this._browser = browser;

    if (initialUserScripts != null) {
      for (final userScript in initialUserScripts) {
        if (userScript.injectionTime ==
            CygnusUserScriptInjectionTime.AT_DOCUMENT_START) {
          this._userScripts[CygnusUserScriptInjectionTime.AT_DOCUMENT_START]?.add(
            userScript,
          );
        } else {
          this._userScripts[CygnusUserScriptInjectionTime.AT_DOCUMENT_END]?.add(
            userScript,
          );
        }
      }
    }
    this._init(params);
  }

  void _init(CygnusPlatformWebViewControllerCreationParams params) {
    _controllerFromPlatform =
        params.webviewParams?.controllerFromPlatform?.call(this) ?? this;

    webStorage = WindowsWebStorage(
      WindowsWebStorageCreationParams(
        localStorage: WindowsLocalStorage.defaultStorage(controller: this),
        sessionStorage: WindowsSessionStorage.defaultStorage(controller: this),
      ),
    );

    if (params.webviewParams is CygnusPlatformWebViewWidgetCreationParams) {
      final keepAlive =
          (params.webviewParams as CygnusPlatformWebViewWidgetCreationParams)
              .keepAlive;
      if (keepAlive != null) {
        CygnusWebViewControllerKeepAliveProps? props = _keepAliveMap[keepAlive];
        if (props == null) {
          // save controller properties to restore it later
          _keepAliveMap[keepAlive] = CygnusWebViewControllerKeepAliveProps(
            injectedScriptsFromURL: _injectedScriptsFromURL,
            javaScriptHandlersMap: _javaScriptHandlersMap,
            userScripts: _userScripts,
            webMessageListenerObjNames: _webMessageListenerObjNames,
            devToolsProtocolEventListenerMap: _devToolsProtocolEventListenerMap,
          );
        } else {
          // restore controller properties
          _injectedScriptsFromURL = props.injectedScriptsFromURL;
          _javaScriptHandlersMap = props.javaScriptHandlersMap;
          _userScripts = props.userScripts;
          _webMessageListenerObjNames = props.webMessageListenerObjNames;
          _devToolsProtocolEventListenerMap =
              props.devToolsProtocolEventListenerMap;
        }
      }
    }
  }

  _debugLog(String method, dynamic args) {
    debugLog(
      className: this.runtimeType.toString(),
      name: _browser == null
          ? "WebView"
          : _browser.runtimeType.toString(),
      id: (getViewId() ?? _browser?.id).toString(),
      debugLoggingSettings: CygnusPlatformWebViewController.debugLoggingSettings,
      method: method,
      args: args,
    );
  }

  Future<dynamic> _handleMethod(MethodCall call) async {
    if (CygnusPlatformWebViewController.debugLoggingSettings.enabled &&
        call.method != "onCallJsHandler") {
      _debugLog(call.method, call.arguments);
    }

    switch (call.method) {
      case "onLoadStart":
        _injectedScriptsFromURL.clear();
        if ((webviewParams != null && webviewParams!.onLoadStart != null) ||
            _browserEventHandler != null) {
          String? url = call.arguments["url"];
          CygnusWebUri? uri = url != null ? CygnusWebUri(url) : null;
          if (webviewParams != null && webviewParams!.onLoadStart != null)
            webviewParams!.onLoadStart!(_controllerFromPlatform, uri);
          else
            _browserEventHandler!.onLoadStart(uri);
        }
        break;
      case "onLoadStop":
        if ((webviewParams != null && webviewParams!.onLoadStop != null) ||
            _browserEventHandler != null) {
          String? url = call.arguments["url"];
          CygnusWebUri? uri = url != null ? CygnusWebUri(url) : null;
          if (webviewParams != null && webviewParams!.onLoadStop != null)
            webviewParams!.onLoadStop!(_controllerFromPlatform, uri);
          else
            _browserEventHandler!.onLoadStop(uri);
        }
        break;
      case "onContentLoading":
        if ((webviewParams != null &&
                webviewParams!.onContentLoading != null) ||
            _browserEventHandler != null) {
          String? url = call.arguments["url"];
          CygnusWebUri? uri = url != null ? CygnusWebUri(url) : null;
          if (webviewParams != null && webviewParams!.onContentLoading != null)
            webviewParams!.onContentLoading!(_controllerFromPlatform, uri);
          else
            _browserEventHandler!.onContentLoading(uri);
        }
        break;
      case "onDOMContentLoaded":
        if ((webviewParams != null &&
                webviewParams!.onDOMContentLoaded != null) ||
            _browserEventHandler != null) {
          String? url = call.arguments["url"];
          CygnusWebUri? uri = url != null ? CygnusWebUri(url) : null;
          if (webviewParams != null &&
              webviewParams!.onDOMContentLoaded != null)
            webviewParams!.onDOMContentLoaded!(_controllerFromPlatform, uri);
          else
            _browserEventHandler!.onDOMContentLoaded(uri);
        }
        break;
      case "onReceivedError":
        if ((webviewParams != null &&
                (webviewParams!.onReceivedError != null ||
                    // ignore: deprecated_member_use_from_same_package
                    webviewParams!.onLoadError != null)) ||
            _browserEventHandler != null) {
          CygnusWebResourceRequest request = CygnusWebResourceRequest.fromMap(
            call.arguments["request"].cast<String, dynamic>(),
          )!;
          CygnusWebResourceError error = CygnusWebResourceError.fromMap(
            call.arguments["error"].cast<String, dynamic>(),
          )!;
          var isForMainFrame = request.isForMainFrame ?? false;

          if (webviewParams != null) {
            if (webviewParams!.onReceivedError != null)
              webviewParams!.onReceivedError!(
                _controllerFromPlatform,
                request,
                error,
              );
            else if (isForMainFrame) {
              // ignore: deprecated_member_use_from_same_package
              webviewParams!.onLoadError!(
                _controllerFromPlatform,
                request.url,
                error.type.toNativeValue() ?? -1,
                error.description,
              );
            }
          } else {
            if (isForMainFrame) {
              _browserEventHandler!.onLoadError(
                request.url,
                error.type.toNativeValue() ?? -1,
                error.description,
              );
            }
            _browserEventHandler!.onReceivedError(request, error);
          }
        }
        break;
      case "onReceivedHttpError":
        if ((webviewParams != null &&
                (webviewParams!.onReceivedHttpError != null ||
                    // ignore: deprecated_member_use_from_same_package
                    webviewParams!.onLoadHttpError != null)) ||
            _browserEventHandler != null) {
          CygnusWebResourceRequest request = CygnusWebResourceRequest.fromMap(
            call.arguments["request"].cast<String, dynamic>(),
          )!;
          CygnusWebResourceResponse errorResponse = CygnusWebResourceResponse.fromMap(
            call.arguments["errorResponse"].cast<String, dynamic>(),
          )!;
          var isForMainFrame = request.isForMainFrame ?? false;

          if (webviewParams != null) {
            if (webviewParams!.onReceivedHttpError != null)
              webviewParams!.onReceivedHttpError!(
                _controllerFromPlatform,
                request,
                errorResponse,
              );
            else if (isForMainFrame) {
              // ignore: deprecated_member_use_from_same_package
              webviewParams!.onLoadHttpError!(
                _controllerFromPlatform,
                request.url,
                errorResponse.statusCode ?? -1,
                errorResponse.reasonPhrase ?? '',
              );
            }
          } else {
            if (isForMainFrame) {
              _browserEventHandler!.onLoadHttpError(
                request.url,
                errorResponse.statusCode ?? -1,
                errorResponse.reasonPhrase ?? '',
              );
            }
            _browserEventHandler!.onReceivedHttpError(
              request,
              errorResponse,
            );
          }
        }
        break;
      case "onProgressChanged":
        if ((webviewParams != null &&
                webviewParams!.onProgressChanged != null) ||
            _browserEventHandler != null) {
          int progress = call.arguments["progress"];
          if (webviewParams != null && webviewParams!.onProgressChanged != null)
            webviewParams!.onProgressChanged!(
              _controllerFromPlatform,
              progress,
            );
          else
            _browserEventHandler!.onProgressChanged(progress);
        }
        break;
      case "shouldOverrideUrlLoading":
        if ((webviewParams != null &&
                webviewParams!.shouldOverrideUrlLoading != null) ||
            _browserEventHandler != null) {
          Map<String, dynamic> arguments = call.arguments
              .cast<String, dynamic>();
          CygnusNavigationAction navigationAction = CygnusNavigationAction.fromMap(
            arguments,
          )!;

          if (webviewParams != null &&
              webviewParams!.shouldOverrideUrlLoading != null)
            return (await webviewParams!.shouldOverrideUrlLoading!(
              _controllerFromPlatform,
              navigationAction,
            ))?.toNativeValue();
          return (await _browserEventHandler!.shouldOverrideUrlLoading(
            navigationAction,
          ))?.toNativeValue();
        }
        break;
      case "onLaunchingExternalUriScheme":
        if ((webviewParams != null &&
                webviewParams!.onLaunchingExternalUriScheme != null) ||
            _browserEventHandler != null) {
          Map<String, dynamic> arguments = call.arguments
              .cast<String, dynamic>();
          CygnusLaunchingExternalUriSchemeRequest request =
              CygnusLaunchingExternalUriSchemeRequest.fromMap(arguments)!;

          if (webviewParams != null &&
              webviewParams!.onLaunchingExternalUriScheme != null)
            return (await webviewParams!.onLaunchingExternalUriScheme!(
              _controllerFromPlatform,
              request,
            ))?.toMap();
          return (await _browserEventHandler!.onLaunchingExternalUriScheme(
            request,
          ))?.toMap();
        }
        break;
      case "onConsoleMessage":
        if ((webviewParams != null &&
                webviewParams!.onConsoleMessage != null) ||
            _browserEventHandler != null) {
          Map<String, dynamic> arguments = call.arguments
              .cast<String, dynamic>();
          CygnusConsoleMessage consoleMessage = CygnusConsoleMessage.fromMap(arguments)!;
          if (webviewParams != null && webviewParams!.onConsoleMessage != null)
            webviewParams!.onConsoleMessage!(
              _controllerFromPlatform,
              consoleMessage,
            );
          else
            _browserEventHandler!.onConsoleMessage(consoleMessage);
        }
        break;
      case "onScrollChanged":
        if ((webviewParams != null && webviewParams!.onScrollChanged != null) ||
            _browserEventHandler != null) {
          int x = call.arguments["x"];
          int y = call.arguments["y"];
          if (webviewParams != null && webviewParams!.onScrollChanged != null)
            webviewParams!.onScrollChanged!(_controllerFromPlatform, x, y);
          else
            _browserEventHandler!.onScrollChanged(x, y);
        }
        break;
      case "onDownloadStarting":
        if ((webviewParams != null &&
                (webviewParams!.onDownloadStart != null ||
                    webviewParams!.onDownloadStartRequest != null ||
                    webviewParams!.onDownloadStarting != null)) ||
            _browserEventHandler != null) {
          Map<String, dynamic> arguments = call.arguments
              .cast<String, dynamic>();
          CygnusDownloadStartRequest downloadStartRequest =
              CygnusDownloadStartRequest.fromMap(arguments)!;

          if (webviewParams != null) {
            if (webviewParams!.onDownloadStarting != null)
              return (await webviewParams!.onDownloadStarting!(
                _controllerFromPlatform,
                downloadStartRequest,
              ))?.toMap();
            else if (webviewParams!.onDownloadStartRequest != null)
              webviewParams!.onDownloadStartRequest!(
                _controllerFromPlatform,
                downloadStartRequest,
              );
            else {
              webviewParams!.onDownloadStart!(
                _controllerFromPlatform,
                downloadStartRequest.url,
              );
            }
          } else {
            _browserEventHandler!.onDownloadStart(
              downloadStartRequest.url,
            );
            _browserEventHandler!.onDownloadStartRequest(
              downloadStartRequest,
            );
            return (await _browserEventHandler!.onDownloadStarting(
              downloadStartRequest,
            ))?.toMap();
          }
        }
        break;
      case "onLoadResourceWithCustomScheme":
        if ((webviewParams != null &&
                (webviewParams!.onLoadResourceWithCustomScheme != null ||
                    // ignore: deprecated_member_use_from_same_package
                    webviewParams!.onLoadResourceCustomScheme != null)) ||
            _browserEventHandler != null) {
          Map<String, dynamic> requestMap = call.arguments["request"]
              .cast<String, dynamic>();
          CygnusWebResourceRequest request = CygnusWebResourceRequest.fromMap(requestMap)!;

          if (webviewParams != null) {
            if (webviewParams!.onLoadResourceWithCustomScheme != null)
              return (await webviewParams!.onLoadResourceWithCustomScheme!(
                _controllerFromPlatform,
                request,
              ))?.toMap();
            else {
              return (await params
                      .webviewParams!
                      // ignore: deprecated_member_use_from_same_package
                      .onLoadResourceCustomScheme!(
                    _controllerFromPlatform,
                    request.url,
                  ))
                  ?.toMap();
            }
          } else {
            return ((await _browserEventHandler!
                        .onLoadResourceWithCustomScheme(request)) ??
                    (await _browserEventHandler!
                        .onLoadResourceCustomScheme(request.url)))
                ?.toMap();
          }
        }
        break;
      case "onCreateWindow":
        if ((webviewParams != null && webviewParams!.onCreateWindow != null) ||
            _browserEventHandler != null) {
          Map<String, dynamic> arguments = call.arguments
              .cast<String, dynamic>();
          CygnusCreateWindowAction createWindowAction = CygnusCreateWindowAction.fromMap(
            arguments,
          )!;

          if (webviewParams != null && webviewParams!.onCreateWindow != null)
            return await webviewParams!.onCreateWindow!(
              _controllerFromPlatform,
              createWindowAction,
            );
          else
            return await _browserEventHandler!.onCreateWindow(
              createWindowAction,
            );
        }
        break;
      case "onCloseWindow":
        if (webviewParams != null && webviewParams!.onCloseWindow != null)
          webviewParams!.onCloseWindow!(_controllerFromPlatform);
        else if (_browserEventHandler != null)
          _browserEventHandler!.onCloseWindow();
        break;
      case "onTitleChanged":
        if ((webviewParams != null && webviewParams!.onTitleChanged != null) ||
            _browserEventHandler != null) {
          String? title = call.arguments["title"];
          if (webviewParams != null && webviewParams!.onTitleChanged != null)
            webviewParams!.onTitleChanged!(_controllerFromPlatform, title);
          else
            _browserEventHandler!.onTitleChanged(title);
        }
        break;
      case "onGeolocationPermissionsShowPrompt":
        if ((webviewParams != null &&
                (webviewParams!.onGeolocationPermissionsShowPrompt != null ||
                    // ignore: deprecated_member_use_from_same_package
                    webviewParams!.androidOnGeolocationPermissionsShowPrompt !=
                        null)) ||
            _browserEventHandler != null) {
          String origin = call.arguments["origin"];

          if (webviewParams != null) {
            if (webviewParams!.onGeolocationPermissionsShowPrompt != null)
              return (await webviewParams!.onGeolocationPermissionsShowPrompt!(
                _controllerFromPlatform,
                origin,
              ))?.toMap();
            else {
              return (await params
                      .webviewParams!
                      // ignore: deprecated_member_use_from_same_package
                      .androidOnGeolocationPermissionsShowPrompt!(
                    _controllerFromPlatform,
                    origin,
                  ))
                  ?.toMap();
            }
          } else {
            return ((await _browserEventHandler!
                        .onGeolocationPermissionsShowPrompt(origin)) ??
                    (await _browserEventHandler!
                        .androidOnGeolocationPermissionsShowPrompt(origin)))
                ?.toMap();
          }
        }
        break;
      case "onGeolocationPermissionsHidePrompt":
        if (webviewParams != null &&
            (webviewParams!.onGeolocationPermissionsHidePrompt != null ||
                // ignore: deprecated_member_use_from_same_package
                webviewParams!.androidOnGeolocationPermissionsHidePrompt !=
                    null)) {
          if (webviewParams!.onGeolocationPermissionsHidePrompt != null)
            webviewParams!.onGeolocationPermissionsHidePrompt!(
              _controllerFromPlatform,
            );
          else {
            // ignore: deprecated_member_use_from_same_package
            webviewParams!.androidOnGeolocationPermissionsHidePrompt!(
              _controllerFromPlatform,
            );
          }
        } else if (_browserEventHandler != null) {
          _browserEventHandler!.onGeolocationPermissionsHidePrompt();
          // ignore: deprecated_member_use_from_same_package
          _browserEventHandler!
              .androidOnGeolocationPermissionsHidePrompt();
        }
        break;
      case "shouldInterceptRequest":
        if ((webviewParams != null &&
                (webviewParams!.shouldInterceptRequest != null ||
                    // ignore: deprecated_member_use_from_same_package
                    webviewParams!.androidShouldInterceptRequest != null)) ||
            _browserEventHandler != null) {
          Map<String, dynamic> arguments = call.arguments
              .cast<String, dynamic>();
          CygnusWebResourceRequest request = CygnusWebResourceRequest.fromMap(arguments)!;

          if (webviewParams != null) {
            if (webviewParams!.shouldInterceptRequest != null)
              return (await webviewParams!.shouldInterceptRequest!(
                _controllerFromPlatform,
                request,
              ))?.toMap();
            else {
              // ignore: deprecated_member_use_from_same_package
              return (await webviewParams!.androidShouldInterceptRequest!(
                _controllerFromPlatform,
                request,
              ))?.toMap();
            }
          } else {
            return ((await _browserEventHandler!.shouldInterceptRequest(
                      request,
                    )) ??
                    (await _browserEventHandler!
                        .androidShouldInterceptRequest(request)))
                ?.toMap();
          }
        }
        break;
      case "onRenderProcessUnresponsive":
        if ((webviewParams != null &&
                (webviewParams!.onRenderProcessUnresponsive != null ||
                    // ignore: deprecated_member_use_from_same_package
                    webviewParams!.androidOnRenderProcessUnresponsive !=
                        null)) ||
            _browserEventHandler != null) {
          String? url = call.arguments["url"];
          CygnusWebUri? uri = url != null ? CygnusWebUri(url) : null;

          if (webviewParams != null) {
            if (webviewParams!.onRenderProcessUnresponsive != null)
              return (await webviewParams!.onRenderProcessUnresponsive!(
                _controllerFromPlatform,
                uri,
              ))?.toNativeValue();
            else {
              // ignore: deprecated_member_use_from_same_package
              return (await webviewParams!.androidOnRenderProcessUnresponsive!(
                _controllerFromPlatform,
                uri,
              ))?.toNativeValue();
            }
          } else {
            return ((await _browserEventHandler!
                        .onRenderProcessUnresponsive(uri)) ??
                    (await _browserEventHandler!
                        .androidOnRenderProcessUnresponsive(uri)))
                ?.toNativeValue();
          }
        }
        break;
      case "onRenderProcessResponsive":
        if ((webviewParams != null &&
                (webviewParams!.onRenderProcessResponsive != null ||
                    // ignore: deprecated_member_use_from_same_package
                    webviewParams!.androidOnRenderProcessResponsive != null)) ||
            _browserEventHandler != null) {
          String? url = call.arguments["url"];
          CygnusWebUri? uri = url != null ? CygnusWebUri(url) : null;

          if (webviewParams != null) {
            if (webviewParams!.onRenderProcessResponsive != null)
              return (await webviewParams!.onRenderProcessResponsive!(
                _controllerFromPlatform,
                uri,
              ))?.toNativeValue();
            else {
              // ignore: deprecated_member_use_from_same_package
              return (await webviewParams!.androidOnRenderProcessResponsive!(
                _controllerFromPlatform,
                uri,
              ))?.toNativeValue();
            }
          } else {
            return ((await _browserEventHandler!.onRenderProcessResponsive(
                      uri,
                    )) ??
                    (await _browserEventHandler!
                        .androidOnRenderProcessResponsive(uri)))
                ?.toNativeValue();
          }
        }
        break;
      case "onRenderProcessGone":
        if ((webviewParams != null &&
                (webviewParams!.onRenderProcessGone != null ||
                    // ignore: deprecated_member_use_from_same_package
                    webviewParams!.androidOnRenderProcessGone != null)) ||
            _browserEventHandler != null) {
          Map<String, dynamic> arguments = call.arguments
              .cast<String, dynamic>();
          CygnusRenderProcessGoneDetail detail = CygnusRenderProcessGoneDetail.fromMap(
            arguments,
          )!;

          if (webviewParams != null) {
            if (webviewParams!.onRenderProcessGone != null)
              webviewParams!.onRenderProcessGone!(
                _controllerFromPlatform,
                detail,
              );
            else {
              // ignore: deprecated_member_use_from_same_package
              webviewParams!.androidOnRenderProcessGone!(
                _controllerFromPlatform,
                detail,
              );
            }
          } else if (_browserEventHandler != null) {
            _browserEventHandler!.onRenderProcessGone(detail);
            // ignore: deprecated_member_use_from_same_package
            _browserEventHandler!.androidOnRenderProcessGone(detail);
          }
        }
        break;
      case "onFormResubmission":
        if ((webviewParams != null &&
                (webviewParams!.onFormResubmission != null ||
                    // ignore: deprecated_member_use_from_same_package
                    webviewParams!.androidOnFormResubmission != null)) ||
            _browserEventHandler != null) {
          String? url = call.arguments["url"];
          CygnusWebUri? uri = url != null ? CygnusWebUri(url) : null;

          if (webviewParams != null) {
            if (webviewParams!.onFormResubmission != null)
              return (await webviewParams!.onFormResubmission!(
                _controllerFromPlatform,
                uri,
              ))?.toNativeValue();
            else {
              // ignore: deprecated_member_use_from_same_package
              return (await webviewParams!.androidOnFormResubmission!(
                _controllerFromPlatform,
                uri,
              ))?.toNativeValue();
            }
          } else {
            return ((await _browserEventHandler!.onFormResubmission(
                      uri,
                    )) ??
                    // ignore: deprecated_member_use_from_same_package
                    (await _browserEventHandler!.androidOnFormResubmission(
                      uri,
                    )))
                ?.toNativeValue();
          }
        }
        break;
      case "onZoomScaleChanged":
        if ((webviewParams != null &&
                // ignore: deprecated_member_use_from_same_package
                (webviewParams!.androidOnScaleChanged != null ||
                    webviewParams!.onZoomScaleChanged != null)) ||
            _browserEventHandler != null) {
          double oldScale = call.arguments["oldScale"];
          double newScale = call.arguments["newScale"];

          if (webviewParams != null) {
            if (webviewParams!.onZoomScaleChanged != null)
              webviewParams!.onZoomScaleChanged!(
                _controllerFromPlatform,
                oldScale,
                newScale,
              );
            else {
              // ignore: deprecated_member_use_from_same_package
              webviewParams!.androidOnScaleChanged!(
                _controllerFromPlatform,
                oldScale,
                newScale,
              );
            }
          } else {
            _browserEventHandler!.onZoomScaleChanged(oldScale, newScale);
            // ignore: deprecated_member_use_from_same_package
            _browserEventHandler!.androidOnScaleChanged(
              oldScale,
              newScale,
            );
          }
        }
        break;
      case "onReceivedIcon":
        if ((webviewParams != null &&
                (webviewParams!.onReceivedIcon != null ||
                    // ignore: deprecated_member_use_from_same_package
                    webviewParams!.androidOnReceivedIcon != null)) ||
            _browserEventHandler != null) {
          Uint8List icon = Uint8List.fromList(
            call.arguments["icon"].cast<int>(),
          );

          if (webviewParams != null) {
            if (webviewParams!.onReceivedIcon != null)
              webviewParams!.onReceivedIcon!(_controllerFromPlatform, icon);
            else {
              // ignore: deprecated_member_use_from_same_package
              webviewParams!.androidOnReceivedIcon!(
                _controllerFromPlatform,
                icon,
              );
            }
          } else {
            _browserEventHandler!.onReceivedIcon(icon);
            // ignore: deprecated_member_use_from_same_package
            _browserEventHandler!.androidOnReceivedIcon(icon);
          }
        }
        break;
      case "onFaviconChanged":
        if ((webviewParams != null &&
                webviewParams!.onFaviconChanged != null) ||
            _browserEventHandler != null) {
          Map<String, dynamic> arguments = call.arguments
              .cast<String, dynamic>();
          CygnusFaviconChangedRequest request = CygnusFaviconChangedRequest.fromMap(
            arguments,
          )!;

          if (webviewParams != null && webviewParams!.onFaviconChanged != null)
            webviewParams!.onFaviconChanged!(_controllerFromPlatform, request);
          else
            _browserEventHandler!.onFaviconChanged(request);
        }
        break;
      case "onReceivedTouchIconUrl":
        if ((webviewParams != null &&
                (webviewParams!.onReceivedTouchIconUrl != null ||
                    // ignore: deprecated_member_use_from_same_package
                    webviewParams!.androidOnReceivedTouchIconUrl != null)) ||
            _browserEventHandler != null) {
          String url = call.arguments["url"];
          bool precomposed = call.arguments["precomposed"];
          CygnusWebUri uri = CygnusWebUri(url);

          if (webviewParams != null) {
            if (webviewParams!.onReceivedTouchIconUrl != null)
              webviewParams!.onReceivedTouchIconUrl!(
                _controllerFromPlatform,
                uri,
                precomposed,
              );
            else {
              // ignore: deprecated_member_use_from_same_package
              webviewParams!.androidOnReceivedTouchIconUrl!(
                _controllerFromPlatform,
                uri,
                precomposed,
              );
            }
          } else {
            _browserEventHandler!.onReceivedTouchIconUrl(uri, precomposed);
            // ignore: deprecated_member_use_from_same_package
            _browserEventHandler!.androidOnReceivedTouchIconUrl(
              uri,
              precomposed,
            );
          }
        }
        break;
      case "onJsAlert":
        if ((webviewParams != null && webviewParams!.onJsAlert != null) ||
            _browserEventHandler != null) {
          Map<String, dynamic> arguments = call.arguments
              .cast<String, dynamic>();
          CygnusJsAlertRequest jsAlertRequest = CygnusJsAlertRequest.fromMap(arguments)!;

          if (webviewParams != null && webviewParams!.onJsAlert != null)
            return (await webviewParams!.onJsAlert!(
              _controllerFromPlatform,
              jsAlertRequest,
            ))?.toMap();
          else
            return (await _browserEventHandler!.onJsAlert(
              jsAlertRequest,
            ))?.toMap();
        }
        break;
      case "onJsConfirm":
        if ((webviewParams != null && webviewParams!.onJsConfirm != null) ||
            _browserEventHandler != null) {
          Map<String, dynamic> arguments = call.arguments
              .cast<String, dynamic>();
          CygnusJsConfirmRequest jsConfirmRequest = CygnusJsConfirmRequest.fromMap(
            arguments,
          )!;

          if (webviewParams != null && webviewParams!.onJsConfirm != null)
            return (await webviewParams!.onJsConfirm!(
              _controllerFromPlatform,
              jsConfirmRequest,
            ))?.toMap();
          else
            return (await _browserEventHandler!.onJsConfirm(
              jsConfirmRequest,
            ))?.toMap();
        }
        break;
      case "onJsPrompt":
        if ((webviewParams != null && webviewParams!.onJsPrompt != null) ||
            _browserEventHandler != null) {
          Map<String, dynamic> arguments = call.arguments
              .cast<String, dynamic>();
          CygnusJsPromptRequest jsPromptRequest = CygnusJsPromptRequest.fromMap(arguments)!;

          if (webviewParams != null && webviewParams!.onJsPrompt != null)
            return (await webviewParams!.onJsPrompt!(
              _controllerFromPlatform,
              jsPromptRequest,
            ))?.toMap();
          else
            return (await _browserEventHandler!.onJsPrompt(
              jsPromptRequest,
            ))?.toMap();
        }
        break;
      case "onJsBeforeUnload":
        if ((webviewParams != null &&
                (webviewParams!.onJsBeforeUnload != null ||
                    // ignore: deprecated_member_use_from_same_package
                    webviewParams!.androidOnJsBeforeUnload != null)) ||
            _browserEventHandler != null) {
          Map<String, dynamic> arguments = call.arguments
              .cast<String, dynamic>();
          CygnusJsBeforeUnloadRequest jsBeforeUnloadRequest =
              CygnusJsBeforeUnloadRequest.fromMap(arguments)!;

          if (webviewParams != null) {
            if (webviewParams!.onJsBeforeUnload != null)
              return (await webviewParams!.onJsBeforeUnload!(
                _controllerFromPlatform,
                jsBeforeUnloadRequest,
              ))?.toMap();
            else {
              // ignore: deprecated_member_use_from_same_package
              return (await webviewParams!.androidOnJsBeforeUnload!(
                _controllerFromPlatform,
                jsBeforeUnloadRequest,
              ))?.toMap();
            }
          } else {
            return ((await _browserEventHandler!.onJsBeforeUnload(
                      jsBeforeUnloadRequest,
                    )) ??
                    (await _browserEventHandler!.androidOnJsBeforeUnload(
                      jsBeforeUnloadRequest,
                    )))
                ?.toMap();
          }
        }
        break;
      case "onSafeBrowsingHit":
        if ((webviewParams != null &&
                (webviewParams!.onSafeBrowsingHit != null ||
                    // ignore: deprecated_member_use_from_same_package
                    webviewParams!.androidOnSafeBrowsingHit != null)) ||
            _browserEventHandler != null) {
          String url = call.arguments["url"];
          CygnusSafeBrowsingThreat? threatType = CygnusSafeBrowsingThreat.fromNativeValue(
            call.arguments["threatType"],
          );
          CygnusWebUri uri = CygnusWebUri(url);

          if (webviewParams != null) {
            if (webviewParams!.onSafeBrowsingHit != null)
              return (await webviewParams!.onSafeBrowsingHit!(
                _controllerFromPlatform,
                uri,
                threatType,
              ))?.toMap();
            else {
              // ignore: deprecated_member_use_from_same_package
              return (await webviewParams!.androidOnSafeBrowsingHit!(
                _controllerFromPlatform,
                uri,
                threatType,
              ))?.toMap();
            }
          } else {
            return ((await _browserEventHandler!.onSafeBrowsingHit(
                      uri,
                      threatType,
                    )) ??
                    (await _browserEventHandler!.androidOnSafeBrowsingHit(
                      uri,
                      threatType,
                    )))
                ?.toMap();
          }
        }
        break;
      case "onReceivedLoginRequest":
        if ((webviewParams != null &&
                (webviewParams!.onReceivedLoginRequest != null ||
                    // ignore: deprecated_member_use_from_same_package
                    webviewParams!.androidOnReceivedLoginRequest != null)) ||
            _browserEventHandler != null) {
          Map<String, dynamic> arguments = call.arguments
              .cast<String, dynamic>();
          CygnusLoginRequest loginRequest = CygnusLoginRequest.fromMap(arguments)!;

          if (webviewParams != null) {
            if (webviewParams!.onReceivedLoginRequest != null)
              webviewParams!.onReceivedLoginRequest!(
                _controllerFromPlatform,
                loginRequest,
              );
            else {
              // ignore: deprecated_member_use_from_same_package
              webviewParams!.androidOnReceivedLoginRequest!(
                _controllerFromPlatform,
                loginRequest,
              );
            }
          } else {
            _browserEventHandler!.onReceivedLoginRequest(loginRequest);
            // ignore: deprecated_member_use_from_same_package
            _browserEventHandler!.androidOnReceivedLoginRequest(
              loginRequest,
            );
          }
        }
        break;
      case "onPermissionRequestCanceled":
        if ((webviewParams != null &&
                webviewParams!.onPermissionRequestCanceled != null) ||
            _browserEventHandler != null) {
          Map<String, dynamic> arguments = call.arguments
              .cast<String, dynamic>();
          CygnusPermissionRequest permissionRequest = CygnusPermissionRequest.fromMap(
            arguments,
          )!;

          if (webviewParams != null &&
              webviewParams!.onPermissionRequestCanceled != null)
            webviewParams!.onPermissionRequestCanceled!(
              _controllerFromPlatform,
              permissionRequest,
            );
          else
            _browserEventHandler!.onPermissionRequestCanceled(
              permissionRequest,
            );
        }
        break;
      case "onRequestFocus":
        if ((webviewParams != null && webviewParams!.onRequestFocus != null) ||
            _browserEventHandler != null) {
          if (webviewParams != null && webviewParams!.onRequestFocus != null)
            webviewParams!.onRequestFocus!(_controllerFromPlatform);
          else
            _browserEventHandler!.onRequestFocus();
        }
        break;
      case "onReceivedHttpAuthRequest":
        if ((webviewParams != null &&
                webviewParams!.onReceivedHttpAuthRequest != null) ||
            _browserEventHandler != null) {
          Map<String, dynamic> arguments = call.arguments
              .cast<String, dynamic>();

          if (arguments['protectionSpace'] is Map &&
              arguments['protectionSpace']['sslCertificate'] is Map &&
              arguments['protectionSpace']['sslCertificate']['x509Certificate']
                  is String) {
            arguments['protectionSpace']['sslCertificate']['x509Certificate'] =
                utf8.encode(
                  arguments['protectionSpace']['sslCertificate']['x509Certificate'],
                );
          }

          CygnusHttpAuthenticationChallenge challenge =
              CygnusHttpAuthenticationChallenge.fromMap(arguments)!;

          if (webviewParams != null &&
              webviewParams!.onReceivedHttpAuthRequest != null)
            return (await webviewParams!.onReceivedHttpAuthRequest!(
              _controllerFromPlatform,
              challenge,
            ))?.toMap();
          else
            return (await _browserEventHandler!.onReceivedHttpAuthRequest(
              challenge,
            ))?.toMap();
        }
        break;
      case "onReceivedServerTrustAuthRequest":
        if ((webviewParams != null &&
                webviewParams!.onReceivedServerTrustAuthRequest != null) ||
            _browserEventHandler != null) {
          Map<String, dynamic> arguments = call.arguments
              .cast<String, dynamic>();

          if (arguments['protectionSpace'] is Map &&
              arguments['protectionSpace']['sslCertificate'] is Map &&
              arguments['protectionSpace']['sslCertificate']['x509Certificate']
                  is String) {
            arguments['protectionSpace']['sslCertificate']['x509Certificate'] =
                utf8.encode(
                  arguments['protectionSpace']['sslCertificate']['x509Certificate'],
                );
          }

          CygnusServerTrustChallenge challenge = CygnusServerTrustChallenge.fromMap(
            arguments,
          )!;

          if (webviewParams != null &&
              webviewParams!.onReceivedServerTrustAuthRequest != null)
            return (await webviewParams!.onReceivedServerTrustAuthRequest!(
              _controllerFromPlatform,
              challenge,
            ))?.toMap();
          else
            return (await _browserEventHandler!
                    .onReceivedServerTrustAuthRequest(challenge))
                ?.toMap();
        }
        break;
      case "onReceivedClientCertRequest":
        if ((webviewParams != null &&
                webviewParams!.onReceivedClientCertRequest != null) ||
            _browserEventHandler != null) {
          Map<String, dynamic> arguments = call.arguments
              .cast<String, dynamic>();

          if (arguments['protectionSpace'] is Map &&
              arguments['protectionSpace']['sslCertificate'] is Map &&
              arguments['protectionSpace']['sslCertificate']['x509Certificate']
                  is String) {
            arguments['protectionSpace']['sslCertificate']['x509Certificate'] =
                utf8.encode(
                  arguments['protectionSpace']['sslCertificate']['x509Certificate'],
                );
          }

          arguments['mutuallyTrustedCertificates'] =
              (arguments['mutuallyTrustedCertificates'] as List<dynamic>)
                  .cast<Map<dynamic, dynamic>>()
                  .map((c) {
                    c['x509Certificate'] = utf8.encode(c['x509Certificate']);
                    return c;
                  })
                  .toList();

          CygnusClientCertChallenge challenge = CygnusClientCertChallenge.fromMap(
            arguments,
          )!;

          if (webviewParams != null &&
              webviewParams!.onReceivedClientCertRequest != null)
            return (await webviewParams!.onReceivedClientCertRequest!(
              _controllerFromPlatform,
              challenge,
            ))?.toMap();
          else
            return (await _browserEventHandler!
                    .onReceivedClientCertRequest(challenge))
                ?.toMap();
        }
        break;
      case "onFindResultReceived":
        if ((webviewParams != null &&
                (webviewParams!.onFindResultReceived != null ||
                    (webviewParams!.findInteractionController != null &&
                        webviewParams!
                                .findInteractionController!
                                .params
                                .onFindResultReceived !=
                            null))) ||
            _browserEventHandler != null) {
          int activeMatchOrdinal = call.arguments["activeMatchOrdinal"];
          int numberOfMatches = call.arguments["numberOfMatches"];
          bool isDoneCounting = call.arguments["isDoneCounting"];
          if (webviewParams != null) {
            if (webviewParams!.findInteractionController != null &&
                webviewParams!
                        .findInteractionController!
                        .params
                        .onFindResultReceived !=
                    null)
              webviewParams!
                  .findInteractionController!
                  .params
                  .onFindResultReceived!(
                webviewParams!.findInteractionController!,
                activeMatchOrdinal,
                numberOfMatches,
                isDoneCounting,
              );
            else
              webviewParams!.onFindResultReceived!(
                _controllerFromPlatform,
                activeMatchOrdinal,
                numberOfMatches,
                isDoneCounting,
              );
          } else {
            if (_browser!.findInteractionController != null &&
                _browser!
                        .findInteractionController!
                        .onFindResultReceived !=
                    null)
              _browser!.findInteractionController!.onFindResultReceived!(
                webviewParams!.findInteractionController!,
                activeMatchOrdinal,
                numberOfMatches,
                isDoneCounting,
              );
            else
              _browserEventHandler!.onFindResultReceived(
                activeMatchOrdinal,
                numberOfMatches,
                isDoneCounting,
              );
          }
        }
        break;
      case "onPermissionRequest":
        if ((webviewParams != null &&
                (webviewParams!.onPermissionRequest != null ||
                    // ignore: deprecated_member_use_from_same_package
                    webviewParams!.androidOnPermissionRequest != null)) ||
            _browserEventHandler != null) {
          String origin = call.arguments["origin"];
          List<String> resources = call.arguments["resources"].cast<String>();

          Map<String, dynamic> arguments = call.arguments
              .cast<String, dynamic>();
          CygnusPermissionRequest permissionRequest = CygnusPermissionRequest.fromMap(
            arguments,
          )!;

          if (webviewParams != null) {
            if (webviewParams!.onPermissionRequest != null)
              return (await webviewParams!.onPermissionRequest!(
                _controllerFromPlatform,
                permissionRequest,
              ))?.toMap();
            else {
              return (await webviewParams!.androidOnPermissionRequest!(
                _controllerFromPlatform,
                origin,
                resources,
              ))?.toMap();
            }
          } else {
            return (await _browserEventHandler!.onPermissionRequest(
                  permissionRequest,
                ))?.toMap() ??
                (await _browserEventHandler!.androidOnPermissionRequest(
                  origin,
                  resources,
                ))?.toMap();
          }
        }
        break;
      case "onUpdateVisitedHistory":
        if ((webviewParams != null &&
                webviewParams!.onUpdateVisitedHistory != null) ||
            _browserEventHandler != null) {
          String? url = call.arguments["url"];
          bool? isReload = call.arguments["isReload"];
          CygnusWebUri? uri = url != null ? CygnusWebUri(url) : null;
          if (webviewParams != null &&
              webviewParams!.onUpdateVisitedHistory != null)
            webviewParams!.onUpdateVisitedHistory!(
              _controllerFromPlatform,
              uri,
              isReload,
            );
          else
            _browserEventHandler!.onUpdateVisitedHistory(uri, isReload);
        }
        break;
      case "onWebContentProcessDidTerminate":
        if (webviewParams != null &&
            (webviewParams!.onWebContentProcessDidTerminate != null ||
                // ignore: deprecated_member_use_from_same_package
                webviewParams!.iosOnWebContentProcessDidTerminate != null)) {
          if (webviewParams!.onWebContentProcessDidTerminate != null)
            webviewParams!.onWebContentProcessDidTerminate!(
              _controllerFromPlatform,
            );
          else {
            // ignore: deprecated_member_use_from_same_package
            webviewParams!.iosOnWebContentProcessDidTerminate!(
              _controllerFromPlatform,
            );
          }
        } else if (_browserEventHandler != null) {
          _browserEventHandler!.onWebContentProcessDidTerminate();
          // ignore: deprecated_member_use_from_same_package
          _browserEventHandler!.iosOnWebContentProcessDidTerminate();
        }
        break;
      case "onPageCommitVisible":
        if ((webviewParams != null &&
                webviewParams!.onPageCommitVisible != null) ||
            _browserEventHandler != null) {
          String? url = call.arguments["url"];
          CygnusWebUri? uri = url != null ? CygnusWebUri(url) : null;
          if (webviewParams != null &&
              webviewParams!.onPageCommitVisible != null)
            webviewParams!.onPageCommitVisible!(_controllerFromPlatform, uri);
          else
            _browserEventHandler!.onPageCommitVisible(uri);
        }
        break;
      case "onDidReceiveServerRedirectForProvisionalNavigation":
        if (webviewParams != null &&
            (webviewParams!
                        .onDidReceiveServerRedirectForProvisionalNavigation !=
                    null ||
                params
                        .webviewParams!
                        // ignore: deprecated_member_use_from_same_package
                        .iosOnDidReceiveServerRedirectForProvisionalNavigation !=
                    null)) {
          if (webviewParams!
                  .onDidReceiveServerRedirectForProvisionalNavigation !=
              null)
            webviewParams!.onDidReceiveServerRedirectForProvisionalNavigation!(
              _controllerFromPlatform,
            );
          else {
            params
                .webviewParams!
                // ignore: deprecated_member_use_from_same_package
                .iosOnDidReceiveServerRedirectForProvisionalNavigation!(
              _controllerFromPlatform,
            );
          }
        } else if (_browserEventHandler != null) {
          _browserEventHandler!
              .onDidReceiveServerRedirectForProvisionalNavigation();
          _browserEventHandler!
              .iosOnDidReceiveServerRedirectForProvisionalNavigation();
        }
        break;
      case "onNavigationResponse":
        if ((webviewParams != null &&
                (webviewParams!.onNavigationResponse != null ||
                    // ignore: deprecated_member_use_from_same_package
                    webviewParams!.iosOnNavigationResponse != null)) ||
            _browserEventHandler != null) {
          Map<String, dynamic> arguments = call.arguments
              .cast<String, dynamic>();
          // ignore: deprecated_member_use_from_same_package
          CygnusIOSWKNavigationResponse iosOnNavigationResponse =
              // ignore: deprecated_member_use_from_same_package
              CygnusIOSWKNavigationResponse.fromMap(arguments)!;

          CygnusNavigationResponse navigationResponse = CygnusNavigationResponse.fromMap(
            arguments,
          )!;

          if (webviewParams != null) {
            if (webviewParams!.onNavigationResponse != null)
              return (await webviewParams!.onNavigationResponse!(
                _controllerFromPlatform,
                navigationResponse,
              ))?.toNativeValue();
            else {
              // ignore: deprecated_member_use_from_same_package
              return (await webviewParams!.iosOnNavigationResponse!(
                _controllerFromPlatform,
                iosOnNavigationResponse,
              ))?.toNativeValue();
            }
          } else {
            return (await _browserEventHandler!.onNavigationResponse(
                  navigationResponse,
                ))?.toNativeValue() ??
                (await _browserEventHandler!.iosOnNavigationResponse(
                  iosOnNavigationResponse,
                ))?.toNativeValue();
          }
        }
        break;
      case "shouldAllowDeprecatedTLS":
        if ((webviewParams != null &&
                (webviewParams!.shouldAllowDeprecatedTLS != null ||
                    // ignore: deprecated_member_use_from_same_package
                    webviewParams!.iosShouldAllowDeprecatedTLS != null)) ||
            _browserEventHandler != null) {
          Map<String, dynamic> arguments = call.arguments
              .cast<String, dynamic>();
          CygnusURLAuthenticationChallenge challenge =
              CygnusURLAuthenticationChallenge.fromMap(arguments)!;

          if (webviewParams != null) {
            if (webviewParams!.shouldAllowDeprecatedTLS != null)
              return (await webviewParams!.shouldAllowDeprecatedTLS!(
                _controllerFromPlatform,
                challenge,
              ))?.toNativeValue();
            else {
              // ignore: deprecated_member_use_from_same_package
              return (await webviewParams!.iosShouldAllowDeprecatedTLS!(
                _controllerFromPlatform,
                challenge,
              ))?.toNativeValue();
            }
          } else {
            return (await _browserEventHandler!.shouldAllowDeprecatedTLS(
                  challenge,
                ))?.toNativeValue() ??
                // ignore: deprecated_member_use_from_same_package
                (await _browserEventHandler!.iosShouldAllowDeprecatedTLS(
                  challenge,
                ))?.toNativeValue();
          }
        }
        break;
      case "onLongPressHitTestResult":
        if ((webviewParams != null &&
                webviewParams!.onLongPressHitTestResult != null) ||
            _browserEventHandler != null) {
          Map<String, dynamic> arguments = call.arguments
              .cast<String, dynamic>();
          CygnusWebViewHitTestResult hitTestResult =
              CygnusWebViewHitTestResult.fromMap(arguments)!;

          if (webviewParams != null &&
              webviewParams!.onLongPressHitTestResult != null)
            webviewParams!.onLongPressHitTestResult!(
              _controllerFromPlatform,
              hitTestResult,
            );
          else
            _browserEventHandler!.onLongPressHitTestResult(hitTestResult);
        }
        break;
      case "onCreateContextMenu":
        CygnusContextMenu? contextMenu;
        if (webviewParams != null && webviewParams!.contextMenu != null) {
          contextMenu = webviewParams!.contextMenu;
        } else if (_browserEventHandler != null &&
            _browser!.contextMenu != null) {
          contextMenu = _browser!.contextMenu;
        }

        if (contextMenu != null && contextMenu.onCreateContextMenu != null) {
          Map<String, dynamic> arguments = call.arguments
              .cast<String, dynamic>();
          CygnusWebViewHitTestResult hitTestResult =
              CygnusWebViewHitTestResult.fromMap(arguments)!;

          contextMenu.onCreateContextMenu!(hitTestResult);
        }
        break;
      case "onHideContextMenu":
        CygnusContextMenu? contextMenu;
        if (webviewParams != null && webviewParams!.contextMenu != null) {
          contextMenu = webviewParams!.contextMenu;
        } else if (_browserEventHandler != null &&
            _browser!.contextMenu != null) {
          contextMenu = _browser!.contextMenu;
        }

        if (contextMenu != null && contextMenu.onHideContextMenu != null) {
          contextMenu.onHideContextMenu!();
        }
        break;
      case "onContextMenuActionItemClicked":
        CygnusContextMenu? contextMenu;
        if (webviewParams != null && webviewParams!.contextMenu != null) {
          contextMenu = webviewParams!.contextMenu;
        } else if (_browserEventHandler != null &&
            _browser!.contextMenu != null) {
          contextMenu = _browser!.contextMenu;
        }

        if (contextMenu != null) {
          int? androidId = call.arguments["androidId"];
          String? iosId = call.arguments["iosId"];
          dynamic id = call.arguments["id"];
          String title = call.arguments["title"];

          CygnusContextMenuItem menuItemClicked = CygnusContextMenuItem(
            id: id,
            // ignore: deprecated_member_use_from_same_package
            androidId: androidId,
            // ignore: deprecated_member_use_from_same_package
            iosId: iosId,
            title: title,
            action: null,
          );

          for (var menuItem in contextMenu.menuItems) {
            if (menuItem.id == id) {
              menuItemClicked = menuItem;
              if (menuItem.action != null) {
                menuItem.action!();
              }
              break;
            }
          }

          if (contextMenu.onContextMenuActionItemClicked != null) {
            contextMenu.onContextMenuActionItemClicked!(menuItemClicked);
          }
        }
        break;
      case "onEnterFullscreen":
        if (webviewParams != null && webviewParams!.onEnterFullscreen != null)
          webviewParams!.onEnterFullscreen!(_controllerFromPlatform);
        else if (_browserEventHandler != null)
          _browserEventHandler!.onEnterFullscreen();
        break;
      case "onExitFullscreen":
        if (webviewParams != null && webviewParams!.onExitFullscreen != null)
          webviewParams!.onExitFullscreen!(_controllerFromPlatform);
        else if (_browserEventHandler != null)
          _browserEventHandler!.onExitFullscreen();
        break;
      case "onOverScrolled":
        if ((webviewParams != null && webviewParams!.onOverScrolled != null) ||
            _browserEventHandler != null) {
          int x = call.arguments["x"];
          int y = call.arguments["y"];
          bool clampedX = call.arguments["clampedX"];
          bool clampedY = call.arguments["clampedY"];

          if (webviewParams != null && webviewParams!.onOverScrolled != null)
            webviewParams!.onOverScrolled!(
              _controllerFromPlatform,
              x,
              y,
              clampedX,
              clampedY,
            );
          else
            _browserEventHandler!.onOverScrolled(x, y, clampedX, clampedY);
        }
        break;
      case "onWindowFocus":
        if (webviewParams != null && webviewParams!.onWindowFocus != null)
          webviewParams!.onWindowFocus!(_controllerFromPlatform);
        else if (_browserEventHandler != null)
          _browserEventHandler!.onWindowFocus();
        break;
      case "onWindowBlur":
        if (webviewParams != null && webviewParams!.onWindowBlur != null)
          webviewParams!.onWindowBlur!(_controllerFromPlatform);
        else if (_browserEventHandler != null)
          _browserEventHandler!.onWindowBlur();
        break;
      case "onPrintRequest":
        if ((webviewParams != null &&
                (webviewParams!.onPrintRequest != null ||
                    // ignore: deprecated_member_use_from_same_package
                    webviewParams!.onPrint != null)) ||
            _browserEventHandler != null) {
          String? url = call.arguments["url"];
          String? printJobId = call.arguments["printJobId"];
          CygnusWebUri? uri = url != null ? CygnusWebUri(url) : null;
          WindowsPrintJobController? printJob = printJobId != null
              ? WindowsPrintJobController(
                  WindowsPrintJobControllerCreationParams(id: printJobId),
                )
              : null;

          if (webviewParams != null) {
            if (webviewParams!.onPrintRequest != null)
              return await webviewParams!.onPrintRequest!(
                _controllerFromPlatform,
                uri,
                printJob,
              );
            else {
              // ignore: deprecated_member_use_from_same_package
              webviewParams!.onPrint!(_controllerFromPlatform, uri);
              return false;
            }
          } else {
            // ignore: deprecated_member_use_from_same_package
            _browserEventHandler!.onPrint(uri);
            return await _browserEventHandler!.onPrintRequest(
              uri,
              printJob,
            );
          }
        }
        break;
      case "onInjectedScriptLoaded":
        String id = call.arguments[0];
        var onLoadCallback = _injectedScriptsFromURL[id]?.onLoad;
        if ((webviewParams != null || _browserEventHandler != null) &&
            onLoadCallback != null) {
          onLoadCallback();
        }
        break;
      case "onInjectedScriptError":
        String id = call.arguments[0];
        var onErrorCallback = _injectedScriptsFromURL[id]?.onError;
        if ((webviewParams != null || _browserEventHandler != null) &&
            onErrorCallback != null) {
          onErrorCallback();
        }
        break;
      case "onCameraCaptureStateChanged":
        if ((webviewParams != null &&
                webviewParams!.onCameraCaptureStateChanged != null) ||
            _browserEventHandler != null) {
          var oldState = CygnusMediaCaptureState.fromNativeValue(
            call.arguments["oldState"],
          );
          var newState = CygnusMediaCaptureState.fromNativeValue(
            call.arguments["newState"],
          );

          if (webviewParams != null &&
              webviewParams!.onCameraCaptureStateChanged != null)
            webviewParams!.onCameraCaptureStateChanged!(
              _controllerFromPlatform,
              oldState,
              newState,
            );
          else
            _browserEventHandler!.onCameraCaptureStateChanged(
              oldState,
              newState,
            );
        }
        break;
      case "onMicrophoneCaptureStateChanged":
        if ((webviewParams != null &&
                webviewParams!.onMicrophoneCaptureStateChanged != null) ||
            _browserEventHandler != null) {
          var oldState = CygnusMediaCaptureState.fromNativeValue(
            call.arguments["oldState"],
          );
          var newState = CygnusMediaCaptureState.fromNativeValue(
            call.arguments["newState"],
          );

          if (webviewParams != null &&
              webviewParams!.onMicrophoneCaptureStateChanged != null)
            webviewParams!.onMicrophoneCaptureStateChanged!(
              _controllerFromPlatform,
              oldState,
              newState,
            );
          else
            _browserEventHandler!.onMicrophoneCaptureStateChanged(
              oldState,
              newState,
            );
        }
        break;
      case "onContentSizeChanged":
        if ((webviewParams != null &&
                webviewParams!.onContentSizeChanged != null) ||
            _browserEventHandler != null) {
          var oldContentSize = MapSize.fromMap(
            call.arguments["oldContentSize"]?.cast<String, dynamic>(),
          )!;
          var newContentSize = MapSize.fromMap(
            call.arguments["newContentSize"]?.cast<String, dynamic>(),
          )!;

          if (webviewParams != null &&
              webviewParams!.onContentSizeChanged != null)
            webviewParams!.onContentSizeChanged!(
              _controllerFromPlatform,
              oldContentSize,
              newContentSize,
            );
          else
            _browserEventHandler!.onContentSizeChanged(
              oldContentSize,
              newContentSize,
            );
        }
        break;
      case "onDevToolsProtocolEventReceived":
        String eventName = call.arguments["eventName"];
        dynamic data = call.arguments["data"] != null
            ? jsonDecode(call.arguments["data"])
            : null;

        if (this._devToolsProtocolEventListenerMap.containsKey(eventName)) {
          this._devToolsProtocolEventListenerMap[eventName]!.call(data);
        }
        break;
      case "onProcessFailed":
        if ((webviewParams != null && webviewParams!.onProcessFailed != null) ||
            _browserEventHandler != null) {
          Map<String, dynamic> arguments = call.arguments
              .cast<String, dynamic>();
          final detail = CygnusProcessFailedDetail.fromMap(arguments)!;

          if (webviewParams != null && webviewParams!.onProcessFailed != null)
            webviewParams!.onProcessFailed!(_controllerFromPlatform, detail);
          else
            _browserEventHandler!.onProcessFailed(detail);
        }
        break;
      case "onNotificationReceived":
        if ((webviewParams != null &&
                webviewParams!.onNotificationReceived != null) ||
            _browserEventHandler != null) {
          Map<String, dynamic> arguments = call.arguments
              .cast<String, dynamic>();

          // Extract data from native
          final String notificationControllerId =
              arguments['notificationControllerId'];
          final String? senderOriginString = arguments['senderOrigin'];
          final notification = CygnusWebNotification.fromMap(
            arguments['notification']?.cast<String, dynamic>(),
          )!;

          // Create the notification controller
          final notificationController = WindowsWebNotificationController(
            WindowsWebNotificationControllerCreationParams(
              id: notificationControllerId,
              notification: notification,
            ),
          );

          // Create the request with senderOrigin and controller
          final request = CygnusNotificationReceivedRequest(
            senderOrigin: senderOriginString != null
                ? CygnusWebUri(senderOriginString)
                : null,
            notificationController: notificationController,
          );

          if (webviewParams != null &&
              webviewParams!.onNotificationReceived != null)
            return (await webviewParams!.onNotificationReceived!(
              _controllerFromPlatform,
              request,
            ))?.toMap();
          return (await _browserEventHandler!.onNotificationReceived(
            request,
          ))?.toMap();
        }
        break;
      case "onSaveAsUIShowing":
        if ((webviewParams != null &&
                webviewParams!.onSaveAsUIShowing != null) ||
            _browserEventHandler != null) {
          Map<String, dynamic> arguments = call.arguments
              .cast<String, dynamic>();
          final request = CygnusSaveAsUIShowingRequest.fromMap(arguments)!;

          if (webviewParams != null && webviewParams!.onSaveAsUIShowing != null)
            return (await webviewParams!.onSaveAsUIShowing!(
              _controllerFromPlatform,
              request,
            ))?.toMap();
          return (await _browserEventHandler!.onSaveAsUIShowing(
            request,
          ))?.toMap();
        }
        break;
      case "onSaveFileSecurityCheckStarting":
        if ((webviewParams != null &&
                webviewParams!.onSaveFileSecurityCheckStarting != null) ||
            _browserEventHandler != null) {
          Map<String, dynamic> arguments = call.arguments
              .cast<String, dynamic>();
          final request = CygnusSaveFileSecurityCheckStartingRequest.fromMap(
            arguments,
          )!;

          if (webviewParams != null &&
              webviewParams!.onSaveFileSecurityCheckStarting != null)
            return (await webviewParams!.onSaveFileSecurityCheckStarting!(
              _controllerFromPlatform,
              request,
            ))?.toMap();
          return (await _browserEventHandler!
                  .onSaveFileSecurityCheckStarting(request))
              ?.toMap();
        }
        break;
      case "onScreenCaptureStarting":
        if ((webviewParams != null &&
                webviewParams!.onScreenCaptureStarting != null) ||
            _browserEventHandler != null) {
          Map<String, dynamic> arguments = call.arguments
              .cast<String, dynamic>();
          final request = CygnusScreenCaptureStartingRequest.fromMap(arguments)!;

          if (webviewParams != null &&
              webviewParams!.onScreenCaptureStarting != null)
            return (await webviewParams!.onScreenCaptureStarting!(
              _controllerFromPlatform,
              request,
            ))?.toMap();
          return (await _browserEventHandler!.onScreenCaptureStarting(
            request,
          ))?.toMap();
        }
        break;
      case "onAcceleratorKeyPressed":
        if ((webviewParams != null &&
                webviewParams!.onAcceleratorKeyPressed != null) ||
            _browserEventHandler != null) {
          Map<String, dynamic> arguments = call.arguments
              .cast<String, dynamic>();
          final detail = CygnusAcceleratorKeyPressedDetail.fromMap(arguments)!;

          if (webviewParams != null &&
              webviewParams!.onAcceleratorKeyPressed != null)
            webviewParams!.onAcceleratorKeyPressed!(
              _controllerFromPlatform,
              detail,
            );
          else
            _browserEventHandler!.onAcceleratorKeyPressed(detail);
        }
        break;
      case "onCallJsHandler":
        String handlerName = call.arguments["handlerName"];
        Map<String, dynamic> handlerDataMap = call.arguments["data"]
            .cast<String, dynamic>();
        // decode args to json
        handlerDataMap["args"] = jsonDecode(handlerDataMap["args"]);
        final handlerData = CygnusJavaScriptHandlerFunctionData.fromMap(
          handlerDataMap,
        )!;

        _debugLog(handlerName, handlerData);

        switch (handlerName) {
          case "onLoadResource":
            if ((webviewParams != null &&
                    webviewParams!.onLoadResource != null) ||
                _browserEventHandler != null) {
              Map<String, dynamic> arguments = handlerData.args[0]
                  .cast<String, dynamic>();
              arguments["startTime"] = arguments["startTime"] is int
                  ? arguments["startTime"].toDouble()
                  : arguments["startTime"];
              arguments["duration"] = arguments["duration"] is int
                  ? arguments["duration"].toDouble()
                  : arguments["duration"];

              var response = CygnusLoadedResource.fromMap(arguments)!;

              if (webviewParams != null &&
                  webviewParams!.onLoadResource != null)
                webviewParams!.onLoadResource!(
                  _controllerFromPlatform,
                  response,
                );
              else
                _browserEventHandler!.onLoadResource(response);
            }
            return null;
          case "shouldInterceptAjaxRequest":
            if ((webviewParams != null &&
                    webviewParams!.shouldInterceptAjaxRequest != null) ||
                _browserEventHandler != null) {
              Map<String, dynamic> arguments = handlerData.args[0]
                  .cast<String, dynamic>();
              CygnusAjaxRequest request = CygnusAjaxRequest.fromMap(arguments)!;

              if (webviewParams != null &&
                  webviewParams!.shouldInterceptAjaxRequest != null)
                return jsonEncode(
                  await params.webviewParams!.shouldInterceptAjaxRequest!(
                    _controllerFromPlatform,
                    request,
                  ),
                );
              else
                return jsonEncode(
                  await _browserEventHandler!.shouldInterceptAjaxRequest(
                    request,
                  ),
                );
            }
            return null;
          case "onAjaxReadyStateChange":
            if ((webviewParams != null &&
                    webviewParams!.onAjaxReadyStateChange != null) ||
                _browserEventHandler != null) {
              Map<String, dynamic> arguments = handlerData.args[0]
                  .cast<String, dynamic>();
              CygnusAjaxRequest request = CygnusAjaxRequest.fromMap(arguments)!;

              if (webviewParams != null &&
                  webviewParams!.onAjaxReadyStateChange != null)
                return jsonEncode(
                  (await webviewParams!.onAjaxReadyStateChange!(
                    _controllerFromPlatform,
                    request,
                  ))?.toNativeValue(),
                );
              else
                return jsonEncode(
                  (await _browserEventHandler!.onAjaxReadyStateChange(
                    request,
                  ))?.toNativeValue(),
                );
            }
            return null;
          case "onAjaxProgress":
            if ((webviewParams != null &&
                    webviewParams!.onAjaxProgress != null) ||
                _browserEventHandler != null) {
              Map<String, dynamic> arguments = handlerData.args[0]
                  .cast<String, dynamic>();
              CygnusAjaxRequest request = CygnusAjaxRequest.fromMap(arguments)!;

              if (webviewParams != null &&
                  webviewParams!.onAjaxProgress != null)
                return jsonEncode(
                  (await webviewParams!.onAjaxProgress!(
                    _controllerFromPlatform,
                    request,
                  ))?.toNativeValue(),
                );
              else
                return jsonEncode(
                  (await _browserEventHandler!.onAjaxProgress(
                    request,
                  ))?.toNativeValue(),
                );
            }
            return null;
          case "shouldInterceptFetchRequest":
            if ((webviewParams != null &&
                    webviewParams!.shouldInterceptFetchRequest != null) ||
                _browserEventHandler != null) {
              Map<String, dynamic> arguments = handlerData.args[0]
                  .cast<String, dynamic>();
              CygnusFetchRequest request = CygnusFetchRequest.fromMap(arguments)!;

              if (webviewParams != null &&
                  webviewParams!.shouldInterceptFetchRequest != null)
                return jsonEncode(
                  await webviewParams!.shouldInterceptFetchRequest!(
                    _controllerFromPlatform,
                    request,
                  ),
                );
              else
                return jsonEncode(
                  await _browserEventHandler!.shouldInterceptFetchRequest(
                    request,
                  ),
                );
            }
            return null;
          case "onWindowFocus":
            if (webviewParams != null && webviewParams!.onWindowFocus != null)
              webviewParams!.onWindowFocus!(_controllerFromPlatform);
            else if (_browserEventHandler != null)
              _browserEventHandler!.onWindowFocus();
            return null;
          case "onWindowBlur":
            if (webviewParams != null && webviewParams!.onWindowBlur != null)
              webviewParams!.onWindowBlur!(_controllerFromPlatform);
            else if (_browserEventHandler != null)
              _browserEventHandler!.onWindowBlur();
            return null;
          case "onInjectedScriptLoaded":
            String id = handlerData.args[0];
            var onLoadCallback = _injectedScriptsFromURL[id]?.onLoad;
            if ((webviewParams != null || _browserEventHandler != null) &&
                onLoadCallback != null) {
              onLoadCallback();
            }
            return null;
          case "onInjectedScriptError":
            String id = handlerData.args[0];
            var onErrorCallback = _injectedScriptsFromURL[id]?.onError;
            if ((webviewParams != null || _browserEventHandler != null) &&
                onErrorCallback != null) {
              onErrorCallback();
            }
            return null;
          case "onWebMessageListenerPostMessageReceived":
            Map<String, dynamic> arguments = handlerData.args[0]
                .cast<String, dynamic>();
            String jsObjectName = arguments["jsObjectName"];
            for (var listener in _webMessageListeners) {
              if (listener.params.jsObjectName == jsObjectName) {
                Map<String, dynamic>? messageMap = arguments["message"]
                    ?.cast<String, dynamic>();
                CygnusWebMessage? message = messageMap != null
                    ? CygnusWebMessage.fromMap(messageMap)
                    : null;
                String? sourceOrigin = arguments["sourceOrigin"];
                bool isMainFrame = arguments["isMainFrame"] ?? true;
                listener.channel?.invokeMethod("onPostMessage", {
                  "message": message?.toMap(),
                  "sourceOrigin": sourceOrigin,
                  "isMainFrame": isMainFrame,
                });
                break;
              }
            }
            return null;
          case "onWebMessagePortMessageReceived":
            Map<String, dynamic> arguments = handlerData.args[0]
                .cast<String, dynamic>();
            String webMessageChannelId = arguments["webMessageChannelId"];
            int index = arguments["index"];
            for (var webMessageChannel in _webMessageChannels) {
              if (webMessageChannel.id == webMessageChannelId) {
                Map<String, dynamic>? messageMap = arguments["message"]
                    ?.cast<String, dynamic>();
                CygnusWebMessage? message = messageMap != null
                    ? CygnusWebMessage.fromMap(messageMap)
                    : null;
                webMessageChannel.internalChannel?.invokeMethod("onMessage", {
                  "index": index,
                  "message": message?.toMap(),
                });
                break;
              }
            }
            return null;
        }

        if (_javaScriptHandlersMap.containsKey(handlerName)) {
          // convert result to json
          try {
            var jsHandlerResult = null;
            if (_javaScriptHandlersMap[handlerName]
                is CygnusJavaScriptHandlerCallback) {
              jsHandlerResult =
                  await (_javaScriptHandlersMap[handlerName]
                      as CygnusJavaScriptHandlerCallback)(handlerData.args);
            } else if (_javaScriptHandlersMap[handlerName]
                is CygnusJavaScriptHandlerFunction) {
              jsHandlerResult =
                  await (_javaScriptHandlersMap[handlerName]
                      as CygnusJavaScriptHandlerFunction)(handlerData);
            } else {
              jsHandlerResult = await _javaScriptHandlersMap[handlerName]!();
            }
            return jsonEncode(jsHandlerResult);
          } catch (error, stacktrace) {
            developer.log(
              error.toString() + '\n' + stacktrace.toString(),
              name: 'JavaScript Handler "$handlerName"',
            );
            throw Exception(error.toString().replaceFirst('Exception: ', ''));
          }
        }
        break;
      default:
        throw UnimplementedError("Unimplemented ${call.method} method");
    }
    return null;
  }

  @override
  Future<CygnusWebUri?> getUrl() async {
    Map<String, dynamic> args = <String, dynamic>{};
    String? url = await channel?.invokeMethod<String?>('getUrl', args);
    return url != null ? CygnusWebUri(url) : null;
  }

  @override
  Future<String?> getTitle() async {
    Map<String, dynamic> args = <String, dynamic>{};
    return await channel?.invokeMethod<String?>('getTitle', args);
  }

  @override
  Future<int?> getProgress() async {
    Map<String, dynamic> args = <String, dynamic>{};
    return await channel?.invokeMethod<int?>('getProgress', args);
  }

  @override
  Future<int?> getFrameId() async {
    Map<String, dynamic> args = <String, dynamic>{};
    return await channel?.invokeMethod<int?>('getFrameId', args);
  }

  @override
  Future<CygnusMemoryUsageTargetLevel?> getMemoryUsageTargetLevel() async {
    Map<String, dynamic> args = <String, dynamic>{};
    final nativeValue = await channel?.invokeMethod<int?>(
      'getMemoryUsageTargetLevel',
      args,
    );
    return CygnusMemoryUsageTargetLevel.fromNativeValue(nativeValue);
  }

  @override
  Future<void> setMemoryUsageTargetLevel(CygnusMemoryUsageTargetLevel level) async {
    Map<String, dynamic> args = <String, dynamic>{};
    args.putIfAbsent('level', () => level.toNativeValue());
    await channel?.invokeMethod('setMemoryUsageTargetLevel', args);
  }

  @override
  Future<String?> getHtml() async {
    String? html;

    CygnusWebViewSettings? settings = await getSettings();
    if (settings != null && settings.javaScriptEnabled == true) {
      html = await evaluateJavascript(
        source: "window.document.getElementsByTagName('html')[0].outerHTML;",
      );
      if (html != null && html.isNotEmpty) return html;
    }

    var webviewUrl = await getUrl();
    if (webviewUrl == null) {
      return html;
    }

    if (webviewUrl.isScheme("file")) {
      var assetPathSplit = webviewUrl.toString().split("/flutter_assets/");
      var assetPath = assetPathSplit[assetPathSplit.length - 1];
      try {
        var bytes = await rootBundle.load(assetPath);
        html = utf8.decode(bytes.buffer.asUint8List());
      } catch (e) {}
    } else {
      try {
        HttpClient client = HttpClient();
        var htmlRequest = await client.getUrl(webviewUrl);
        html = await (await htmlRequest.close())
            .transform(Utf8Decoder())
            .join();
      } catch (e) {
        developer.log(e.toString(), name: this.runtimeType.toString());
      }
    }

    return html;
  }

  @override
  Future<List<CygnusFavicon>> getFavicons() async {
    List<CygnusFavicon> favicons = [];

    var webviewUrl = await getUrl();

    if (webviewUrl == null) {
      return favicons;
    }

    String? manifestUrl;

    var html = await getHtml();
    if (html == null || html.isEmpty) {
      return favicons;
    }
    var assetPathBase;

    if (webviewUrl.isScheme("file")) {
      var assetPathSplit = webviewUrl.toString().split("/flutter_assets/");
      assetPathBase = assetPathSplit[0] + "/flutter_assets/";
    }

    CygnusWebViewSettings? settings = await getSettings();
    if (settings != null && settings.javaScriptEnabled == true) {
      List<Map<dynamic, dynamic>> links =
          (await evaluateJavascript(
            source: """
(function() {
  var linkNodes = document.head.getElementsByTagName("link");
  var links = [];
  for (var i = 0; i < linkNodes.length; i++) {
    var linkNode = linkNodes[i];
    if (linkNode.rel === 'manifest') {
      links.push(
        {
          rel: linkNode.rel,
          href: linkNode.href,
          sizes: null
        }
      );
    } else if (linkNode.rel != null && linkNode.rel.indexOf('icon') >= 0) {
      links.push(
        {
          rel: linkNode.rel,
          href: linkNode.href,
          sizes: linkNode.sizes != null && linkNode.sizes.value != "" ? linkNode.sizes.value : null
        }
      );
    }
  }
  return links;
})();
""",
          ))?.cast<Map<dynamic, dynamic>>() ??
          [];
      for (var link in links) {
        if (link["rel"] == "manifest") {
          manifestUrl = link["href"];
          if (!_isUrlAbsolute(manifestUrl!)) {
            if (manifestUrl.startsWith("/")) {
              manifestUrl = manifestUrl.substring(1);
            }
            manifestUrl =
                ((assetPathBase == null)
                    ? webviewUrl.scheme + "://" + webviewUrl.host + "/"
                    : assetPathBase) +
                manifestUrl;
          }
          continue;
        }
        favicons.addAll(
          _createFavicons(
            webviewUrl,
            assetPathBase,
            link["href"],
            link["rel"],
            link["sizes"],
            false,
          ),
        );
      }
    }

    // try to get /favicon.ico
    try {
      HttpClient client = HttpClient();
      var faviconUrl =
          webviewUrl.scheme + "://" + webviewUrl.host + "/favicon.ico";
      var faviconUri = CygnusWebUri(faviconUrl);
      var headRequest = await client.headUrl(faviconUri);
      var headResponse = await headRequest.close();
      if (headResponse.statusCode == 200) {
        favicons.add(CygnusFavicon(url: faviconUri, rel: "shortcut icon"));
      }
    } catch (e) {
      developer.log(
        "/favicon.ico file not found: " + e.toString(),
        name: runtimeType.toString(),
      );
    }

    // try to get the manifest file
    HttpClientRequest? manifestRequest;
    HttpClientResponse? manifestResponse;
    bool manifestFound = false;
    if (manifestUrl == null) {
      manifestUrl =
          webviewUrl.scheme + "://" + webviewUrl.host + "/manifest.json";
    }
    try {
      HttpClient client = HttpClient();
      manifestRequest = await client.getUrl(Uri.parse(manifestUrl));
      manifestResponse = await manifestRequest.close();
      manifestFound =
          manifestResponse.statusCode == 200 &&
          manifestResponse.headers.contentType?.mimeType == "application/json";
    } catch (e) {
      developer.log(
        "Manifest file not found: " + e.toString(),
        name: this.runtimeType.toString(),
      );
    }

    if (manifestFound) {
      try {
        Map<String, dynamic> manifest = json.decode(
          await manifestResponse!.transform(Utf8Decoder()).join(),
        );
        if (manifest.containsKey("icons")) {
          for (Map<String, dynamic> icon in manifest["icons"]) {
            favicons.addAll(
              _createFavicons(
                webviewUrl,
                assetPathBase,
                icon["src"],
                icon["rel"],
                icon["sizes"],
                true,
              ),
            );
          }
        }
      } catch (e) {
        developer.log(
          "Cannot get favicons from Manifest file. It might not have a valid format: " +
              e.toString(),
          error: e,
          name: runtimeType.toString(),
        );
      }
    }

    return favicons;
  }

  @override
  Future<Uint8List?> getFavicon({
    required CygnusWebUri url,
    CygnusFaviconImageFormat faviconImageFormat = CygnusFaviconImageFormat.PNG,
  }) async {
    Map<String, dynamic> args = <String, dynamic>{};
    args.putIfAbsent('url', () => url.toString());
    args.putIfAbsent(
      'faviconImageFormat',
      () => faviconImageFormat.toNativeValue(),
    );
    final data = await channel?.invokeMethod('getFavicon', args);
    if (data == null) {
      return null;
    }
    if (data is Uint8List) {
      return data;
    }
    if (data is List) {
      return Uint8List.fromList(data.cast<int>());
    }
    return null;
  }

  @override
  Future<CygnusSaveAsUIResult?> showSaveAsUI() async {
    Map<String, dynamic> args = <String, dynamic>{};
    final result = await channel?.invokeMethod<int?>('showSaveAsUI', args);
    return CygnusSaveAsUIResult.fromNativeValue(result);
  }

  bool _isUrlAbsolute(String url) {
    return url.startsWith("http://") || url.startsWith("https://");
  }

  List<CygnusFavicon> _createFavicons(
    CygnusWebUri url,
    String? assetPathBase,
    String urlIcon,
    String? rel,
    String? sizes,
    bool isManifest,
  ) {
    List<CygnusFavicon> favicons = [];

    List<String> urlSplit = urlIcon.split("/");
    if (!_isUrlAbsolute(urlIcon)) {
      if (urlIcon.startsWith("/")) {
        urlIcon = urlIcon.substring(1);
      }
      urlIcon =
          ((assetPathBase == null)
              ? url.scheme + "://" + url.host + "/"
              : assetPathBase) +
          urlIcon;
    }
    if (isManifest) {
      rel = (sizes != null)
          ? urlSplit[urlSplit.length - 1]
                .replaceFirst("-" + sizes, "")
                .split(" ")[0]
                .split(".")[0]
          : null;
    }
    if (sizes != null && sizes.isNotEmpty && sizes != "any") {
      List<String> sizesSplit = sizes.split(" ");
      for (String size in sizesSplit) {
        int width = int.parse(size.split("x")[0]);
        int height = int.parse(size.split("x")[1]);
        favicons.add(
          CygnusFavicon(url: CygnusWebUri(urlIcon), rel: rel, width: width, height: height),
        );
      }
    } else {
      favicons.add(
        CygnusFavicon(url: CygnusWebUri(urlIcon), rel: rel, width: null, height: null),
      );
    }

    return favicons;
  }

  @override
  Future<void> loadUrl({
    required CygnusURLRequest urlRequest,
    @Deprecated('Use allowingReadAccessTo instead')
    Uri? iosAllowingReadAccessTo,
    CygnusWebUri? allowingReadAccessTo,
  }) async {
    assert(urlRequest.url != null && urlRequest.url.toString().isNotEmpty);
    assert(
      allowingReadAccessTo == null || allowingReadAccessTo.isScheme("file"),
    );
    assert(
      iosAllowingReadAccessTo == null ||
          iosAllowingReadAccessTo.isScheme("file"),
    );

    Map<String, dynamic> args = <String, dynamic>{};
    args.putIfAbsent('urlRequest', () => urlRequest.toMap());
    args.putIfAbsent(
      'allowingReadAccessTo',
      () =>
          allowingReadAccessTo?.toString() ??
          iosAllowingReadAccessTo?.toString(),
    );
    await channel?.invokeMethod('loadUrl', args);
  }

  @override
  Future<void> postUrl({
    required CygnusWebUri url,
    required Uint8List postData,
  }) async {
    assert(url.toString().isNotEmpty);
    Map<String, dynamic> args = <String, dynamic>{};
    args.putIfAbsent('url', () => url.toString());
    args.putIfAbsent('postData', () => postData);
    await channel?.invokeMethod('postUrl', args);
  }

  @override
  Future<void> loadData({
    required String data,
    String mimeType = "text/html",
    String encoding = "utf8",
    CygnusWebUri? baseUrl,
    @Deprecated('Use historyUrl instead') Uri? androidHistoryUrl,
    CygnusWebUri? historyUrl,
    @Deprecated('Use allowingReadAccessTo instead')
    Uri? iosAllowingReadAccessTo,
    CygnusWebUri? allowingReadAccessTo,
  }) async {
    assert(
      allowingReadAccessTo == null || allowingReadAccessTo.isScheme("file"),
    );
    assert(
      iosAllowingReadAccessTo == null ||
          iosAllowingReadAccessTo.isScheme("file"),
    );

    Map<String, dynamic> args = <String, dynamic>{};
    args.putIfAbsent('data', () => data);
    args.putIfAbsent('mimeType', () => mimeType);
    args.putIfAbsent('encoding', () => encoding);
    args.putIfAbsent('baseUrl', () => baseUrl?.toString() ?? "about:blank");
    args.putIfAbsent(
      'historyUrl',
      () =>
          historyUrl?.toString() ??
          androidHistoryUrl?.toString() ??
          "about:blank",
    );
    args.putIfAbsent(
      'allowingReadAccessTo',
      () =>
          allowingReadAccessTo?.toString() ??
          iosAllowingReadAccessTo?.toString(),
    );
    await channel?.invokeMethod('loadData', args);
  }

  @override
  Future<void> loadFile({required String assetFilePath}) async {
    assert(assetFilePath.isNotEmpty);
    Map<String, dynamic> args = <String, dynamic>{};
    args.putIfAbsent('assetFilePath', () => assetFilePath);
    await channel?.invokeMethod('loadFile', args);
  }

  @override
  Future<void> reload() async {
    Map<String, dynamic> args = <String, dynamic>{};
    await channel?.invokeMethod('reload', args);
  }

  @override
  Future<void> goBack() async {
    Map<String, dynamic> args = <String, dynamic>{};
    await channel?.invokeMethod('goBack', args);
  }

  @override
  Future<bool> canGoBack() async {
    Map<String, dynamic> args = <String, dynamic>{};
    return await channel?.invokeMethod<bool>('canGoBack', args) ?? false;
  }

  @override
  Future<void> goForward() async {
    Map<String, dynamic> args = <String, dynamic>{};
    await channel?.invokeMethod('goForward', args);
  }

  @override
  Future<bool> canGoForward() async {
    Map<String, dynamic> args = <String, dynamic>{};
    return await channel?.invokeMethod<bool>('canGoForward', args) ?? false;
  }

  @override
  Future<void> goBackOrForward({required int steps}) async {
    Map<String, dynamic> args = <String, dynamic>{};
    args.putIfAbsent('steps', () => steps);
    await channel?.invokeMethod('goBackOrForward', args);
  }

  @override
  Future<bool> canGoBackOrForward({required int steps}) async {
    Map<String, dynamic> args = <String, dynamic>{};
    args.putIfAbsent('steps', () => steps);
    return await channel?.invokeMethod<bool>('canGoBackOrForward', args) ??
        false;
  }

  @override
  Future<void> goTo({required CygnusWebHistoryItem historyItem}) async {
    var steps = historyItem.offset;
    if (steps != null) {
      await goBackOrForward(steps: steps);
    }
  }

  @override
  Future<bool> isLoading() async {
    Map<String, dynamic> args = <String, dynamic>{};
    return await channel?.invokeMethod<bool>('isLoading', args) ?? false;
  }

  @override
  Future<void> stopLoading() async {
    Map<String, dynamic> args = <String, dynamic>{};
    await channel?.invokeMethod('stopLoading', args);
  }

  @override
  Future<dynamic> evaluateJavascript({
    required String source,
    CygnusContentWorld? contentWorld,
  }) async {
    Map<String, dynamic> args = <String, dynamic>{};
    args.putIfAbsent('source', () => source);
    args.putIfAbsent('contentWorld', () => contentWorld?.toMap());
    var data = await channel?.invokeMethod('evaluateJavascript', args);
    if (data != null) {
      try {
        // try to json decode the data coming from JavaScript
        // otherwise return it as it is.
        data = json.decode(data);
      } catch (e) {}
    }
    return data;
  }

  @override
  Future<void> injectJavascriptFileFromUrl({
    required CygnusWebUri urlFile,
    CygnusScriptHtmlTagAttributes? scriptHtmlTagAttributes,
  }) async {
    assert(urlFile.toString().isNotEmpty);
    var id = scriptHtmlTagAttributes?.id;
    if (scriptHtmlTagAttributes != null && id != null) {
      _injectedScriptsFromURL[id] = scriptHtmlTagAttributes;
    }
    Map<String, dynamic> args = <String, dynamic>{};
    args.putIfAbsent('urlFile', () => urlFile.toString());
    args.putIfAbsent(
      'scriptHtmlTagAttributes',
      () => scriptHtmlTagAttributes?.toMap(),
    );
    await channel?.invokeMethod('injectJavascriptFileFromUrl', args);
  }

  @override
  Future<dynamic> injectJavascriptFileFromAsset({
    required String assetFilePath,
  }) async {
    String source = await rootBundle.loadString(assetFilePath);
    return await evaluateJavascript(source: source);
  }

  @override
  Future<void> injectCSSCode({required String source}) async {
    Map<String, dynamic> args = <String, dynamic>{};
    args.putIfAbsent('source', () => source);
    await channel?.invokeMethod('injectCSSCode', args);
  }

  @override
  Future<void> injectCSSFileFromUrl({
    required CygnusWebUri urlFile,
    CygnusCSSLinkHtmlTagAttributes? cssLinkHtmlTagAttributes,
  }) async {
    assert(urlFile.toString().isNotEmpty);
    Map<String, dynamic> args = <String, dynamic>{};
    args.putIfAbsent('urlFile', () => urlFile.toString());
    args.putIfAbsent(
      'cssLinkHtmlTagAttributes',
      () => cssLinkHtmlTagAttributes?.toMap(),
    );
    await channel?.invokeMethod('injectCSSFileFromUrl', args);
  }

  @override
  Future<void> injectCSSFileFromAsset({required String assetFilePath}) async {
    String source = await rootBundle.loadString(assetFilePath);
    await injectCSSCode(source: source);
  }

  @override
  void addJavaScriptHandler({
    required String handlerName,
    required Function callback,
  }) {
    assert(
      !kJavaScriptHandlerForbiddenNames.contains(handlerName),
      '"$handlerName" is a forbidden name!',
    );
    this._javaScriptHandlersMap[handlerName] = (callback);
  }

  @override
  Function? removeJavaScriptHandler({required String handlerName}) {
    return this._javaScriptHandlersMap.remove(handlerName);
  }

  @override
  bool hasJavaScriptHandler({required String handlerName}) {
    return this._javaScriptHandlersMap.containsKey(handlerName);
  }

  @override
  Future<Uint8List?> takeScreenshot({
    CygnusScreenshotConfiguration? screenshotConfiguration,
  }) async {
    Map<String, dynamic> args = <String, dynamic>{};
    args.putIfAbsent(
      'screenshotConfiguration',
      () => screenshotConfiguration?.toMap(),
    );
    final base64 = await channel?.invokeMethod<String?>('takeScreenshot', args);
    return base64 != null ? base64Decode(base64) : null;
  }

  @override
  @Deprecated('Use setSettings instead')
  Future<void> setOptions({required CygnusWebViewGroupOptions options}) async {
    CygnusWebViewSettings settings =
        CygnusWebViewSettings.fromMap(options.toMap()) ?? CygnusWebViewSettings();
    await setSettings(settings: settings);
  }

  @override
  @Deprecated('Use getSettings instead')
  Future<CygnusWebViewGroupOptions?> getOptions() async {
    CygnusWebViewSettings? settings = await getSettings();

    Map<dynamic, dynamic>? options = settings?.toMap();
    if (options != null) {
      options = options.cast<String, dynamic>();
      return CygnusWebViewGroupOptions.fromMap(options as Map<String, dynamic>);
    }

    return null;
  }

  @override
  Future<void> setSettings({required CygnusWebViewSettings settings}) async {
    Map<String, dynamic> args = <String, dynamic>{};

    args.putIfAbsent('settings', () => settings.toMap());
    await channel?.invokeMethod('setSettings', args);
  }

  @override
  Future<CygnusWebViewSettings?> getSettings() async {
    Map<String, dynamic> args = <String, dynamic>{};

    Map<dynamic, dynamic>? settings = await channel?.invokeMethod(
      'getSettings',
      args,
    );
    if (settings != null) {
      settings = settings.cast<String, dynamic>();
      return CygnusWebViewSettings.fromMap(settings as Map<String, dynamic>);
    }

    return null;
  }

  @override
  Future<CygnusWebHistory?> getCopyBackForwardList() async {
    Map<String, dynamic> args = <String, dynamic>{};
    Map<String, dynamic>? result = (await channel?.invokeMethod(
      'getCopyBackForwardList',
      args,
    ))?.cast<String, dynamic>();
    return CygnusWebHistory.fromMap(result);
  }

  @override
  @Deprecated("Use CygnusWebViewController.clearAllCache instead")
  Future<void> clearCache() async {
    Map<String, dynamic> args = <String, dynamic>{};
    await channel?.invokeMethod('clearCache', args);
  }

  @override
  @Deprecated("Use CygnusFindInteractionController.findAll instead")
  Future<void> findAllAsync({required String find}) async {
    Map<String, dynamic> args = <String, dynamic>{};
    args.putIfAbsent('find', () => find);
    await channel?.invokeMethod('findAll', args);
  }

  @override
  @Deprecated("Use CygnusFindInteractionController.findNext instead")
  Future<void> findNext({required bool forward}) async {
    Map<String, dynamic> args = <String, dynamic>{};
    args.putIfAbsent('forward', () => forward);
    await channel?.invokeMethod('findNext', args);
  }

  @override
  @Deprecated("Use CygnusFindInteractionController.clearMatches instead")
  Future<void> clearMatches() async {
    Map<String, dynamic> args = <String, dynamic>{};
    await channel?.invokeMethod('clearMatches', args);
  }

  @override
  @Deprecated("Use tRexRunnerHtml instead")
  Future<String> getTRexRunnerHtml() async {
    return await tRexRunnerHtml;
  }

  @override
  @Deprecated("Use tRexRunnerCss instead")
  Future<String> getTRexRunnerCss() async {
    return await tRexRunnerCss;
  }

  @override
  Future<void> scrollTo({
    required int x,
    required int y,
    bool animated = false,
  }) async {
    Map<String, dynamic> args = <String, dynamic>{};
    args.putIfAbsent('x', () => x);
    args.putIfAbsent('y', () => y);
    args.putIfAbsent('animated', () => animated);
    await channel?.invokeMethod('scrollTo', args);
  }

  @override
  Future<void> scrollBy({
    required int x,
    required int y,
    bool animated = false,
  }) async {
    Map<String, dynamic> args = <String, dynamic>{};
    args.putIfAbsent('x', () => x);
    args.putIfAbsent('y', () => y);
    args.putIfAbsent('animated', () => animated);
    await channel?.invokeMethod('scrollBy', args);
  }

  @override
  Future<void> pauseTimers() async {
    Map<String, dynamic> args = <String, dynamic>{};
    await channel?.invokeMethod('pauseTimers', args);
  }

  @override
  Future<void> resumeTimers() async {
    Map<String, dynamic> args = <String, dynamic>{};
    await channel?.invokeMethod('resumeTimers', args);
  }

  @override
  Future<WindowsPrintJobController?> printCurrentPage({
    CygnusPrintJobSettings? settings,
  }) async {
    Map<String, dynamic> args = <String, dynamic>{};
    args.putIfAbsent("settings", () => settings?.toMap());
    String? jobId = await channel?.invokeMethod<String?>(
      'printCurrentPage',
      args,
    );
    if (jobId != null) {
      return WindowsPrintJobController(
        CygnusPlatformPrintJobControllerCreationParams(id: jobId),
      );
    }
    return null;
  }

  @override
  Future<int?> getContentHeight() async {
    Map<String, dynamic> args = <String, dynamic>{};
    var height = await channel?.invokeMethod('getContentHeight', args);
    if (height == null || height == 0) {
      // try to use javascript
      var scrollHeight = await evaluateJavascript(
        source: "document.documentElement.scrollHeight;",
      );
      if (scrollHeight != null && scrollHeight is num) {
        height = scrollHeight.toInt();
      }
    }
    return height;
  }

  @override
  Future<int?> getContentWidth() async {
    Map<String, dynamic> args = <String, dynamic>{};
    var height = await channel?.invokeMethod('getContentWidth', args);
    if (height == null || height == 0) {
      // try to use javascript
      var scrollHeight = await evaluateJavascript(
        source: "document.documentElement.scrollWidth;",
      );
      if (scrollHeight != null && scrollHeight is num) {
        height = scrollHeight.toInt();
      }
    }
    return height;
  }

  @override
  Future<void> zoomBy({
    required double zoomFactor,
    @Deprecated('Use animated instead') bool? iosAnimated,
    bool animated = false,
  }) async {
    Map<String, dynamic> args = <String, dynamic>{};
    args.putIfAbsent('zoomFactor', () => zoomFactor);
    args.putIfAbsent('animated', () => iosAnimated ?? animated);
    return await channel?.invokeMethod('zoomBy', args);
  }

  @override
  Future<CygnusWebUri?> getOriginalUrl() async {
    Map<String, dynamic> args = <String, dynamic>{};
    String? url = await channel?.invokeMethod<String?>('getOriginalUrl', args);
    return url != null ? CygnusWebUri(url) : null;
  }

  @override
  Future<double?> getZoomScale() async {
    Map<String, dynamic> args = <String, dynamic>{};
    return await channel?.invokeMethod<double?>('getZoomScale', args);
  }

  @override
  @Deprecated('Use getZoomScale instead')
  Future<double?> getScale() async {
    return await getZoomScale();
  }

  @override
  Future<String?> getSelectedText() async {
    Map<String, dynamic> args = <String, dynamic>{};
    return await channel?.invokeMethod<String?>('getSelectedText', args);
  }

  @override
  Future<List<CygnusMetaTag>> getMetaTags() async {
    List<CygnusMetaTag> metaTags = [];

    List<Map<dynamic, dynamic>>? metaTagList = (await evaluateJavascript(
      source: """
(function() {
  var metaTags = [];
  var metaTagNodes = document.head.getElementsByTagName('meta');
  for (var i = 0; i < metaTagNodes.length; i++) {
    var metaTagNode = metaTagNodes[i];
    
    var otherAttributes = metaTagNode.getAttributeNames();
    var nameIndex = otherAttributes.indexOf("name");
    if (nameIndex !== -1) otherAttributes.splice(nameIndex, 1);
    var contentIndex = otherAttributes.indexOf("content");
    if (contentIndex !== -1) otherAttributes.splice(contentIndex, 1);
    
    var attrs = [];
    for (var j = 0; j < otherAttributes.length; j++) {
      var otherAttribute = otherAttributes[j];
      attrs.push(
        {
          name: otherAttribute,
          value: metaTagNode.getAttribute(otherAttribute)
        }
      );
    }

    metaTags.push(
      {
        name: metaTagNode.name,
        content: metaTagNode.content,
        attrs: attrs
      }
    );
  }
  return metaTags;
})();
    """,
    ))?.cast<Map<dynamic, dynamic>>();

    if (metaTagList == null) {
      return metaTags;
    }

    for (var metaTag in metaTagList) {
      var attrs = <CygnusMetaTagAttribute>[];

      for (var metaTagAttr in metaTag["attrs"]) {
        attrs.add(
          CygnusMetaTagAttribute(
            name: metaTagAttr["name"],
            value: metaTagAttr["value"],
          ),
        );
      }

      metaTags.add(
        CygnusMetaTag(
          name: metaTag["name"],
          content: metaTag["content"],
          attrs: attrs,
        ),
      );
    }

    return metaTags;
  }

  @override
  Future<Color?> getMetaThemeColor() async {
    Color? themeColor;

    try {
      Map<String, dynamic> args = <String, dynamic>{};
      themeColor = UtilColor.fromStringRepresentation(
        await channel?.invokeMethod('getMetaThemeColor', args),
      );
      return themeColor;
    } catch (e) {
      // not implemented
    }

    // try using javascript
    var metaTags = await getMetaTags();
    CygnusMetaTag? metaTagThemeColor;

    for (var metaTag in metaTags) {
      if (metaTag.name == "theme-color") {
        metaTagThemeColor = metaTag;
        break;
      }
    }

    if (metaTagThemeColor == null) {
      return null;
    }

    var colorValue = metaTagThemeColor.content;

    themeColor = colorValue != null
        ? UtilColor.fromStringRepresentation(colorValue)
        : null;

    return themeColor;
  }

  @override
  Future<int?> getScrollX() async {
    Map<String, dynamic> args = <String, dynamic>{};
    return await channel?.invokeMethod<int?>('getScrollX', args);
  }

  @override
  Future<int?> getScrollY() async {
    Map<String, dynamic> args = <String, dynamic>{};
    return await channel?.invokeMethod<int?>('getScrollY', args);
  }

  @override
  Future<CygnusSslCertificate?> getCertificate() async {
    Map<String, dynamic> args = <String, dynamic>{};
    Map<String, dynamic>? sslCertificateMap = (await channel?.invokeMethod(
      'getCertificate',
      args,
    ))?.cast<String, dynamic>();
    if (sslCertificateMap != null &&
        sslCertificateMap['x509Certificate'] != null) {
      sslCertificateMap['x509Certificate'] = base64Decode(
        sslCertificateMap['x509Certificate'],
      );
    }
    return CygnusSslCertificate.fromMap(sslCertificateMap);
  }

  @override
  Future<void> addUserScript({required CygnusUserScript userScript}) async {
    assert(webviewParams?.windowId == null);

    Map<String, dynamic> args = <String, dynamic>{};
    args.putIfAbsent('userScript', () => userScript.toMap());
    if (!(_userScripts[userScript.injectionTime]?.contains(userScript) ??
        false)) {
      _userScripts[userScript.injectionTime]?.add(userScript);
      await channel?.invokeMethod('addUserScript', args);
    }
  }

  @override
  Future<void> addUserScripts({required List<CygnusUserScript> userScripts}) async {
    assert(webviewParams?.windowId == null);

    for (var i = 0; i < userScripts.length; i++) {
      await addUserScript(userScript: userScripts[i]);
    }
  }

  @override
  Future<bool> removeUserScript({required CygnusUserScript userScript}) async {
    assert(webviewParams?.windowId == null);

    var index = _userScripts[userScript.injectionTime]?.indexOf(userScript);
    if (index == null || index == -1) {
      return false;
    }

    _userScripts[userScript.injectionTime]?.remove(userScript);
    Map<String, dynamic> args = <String, dynamic>{};
    args.putIfAbsent('userScript', () => userScript.toMap());
    args.putIfAbsent('index', () => index);
    await channel?.invokeMethod('removeUserScript', args);

    return true;
  }

  @override
  Future<void> removeUserScriptsByGroupName({required String groupName}) async {
    assert(webviewParams?.windowId == null);

    final List<CygnusUserScript> userScriptsAtDocumentStart = List.from(
      _userScripts[CygnusUserScriptInjectionTime.AT_DOCUMENT_START] ?? [],
    );
    for (final userScript in userScriptsAtDocumentStart) {
      if (userScript.groupName == groupName) {
        _userScripts[userScript.injectionTime]?.remove(userScript);
      }
    }

    final List<CygnusUserScript> userScriptsAtDocumentEnd = List.from(
      _userScripts[CygnusUserScriptInjectionTime.AT_DOCUMENT_END] ?? [],
    );
    for (final userScript in userScriptsAtDocumentEnd) {
      if (userScript.groupName == groupName) {
        _userScripts[userScript.injectionTime]?.remove(userScript);
      }
    }

    Map<String, dynamic> args = <String, dynamic>{};
    args.putIfAbsent('groupName', () => groupName);
    await channel?.invokeMethod('removeUserScriptsByGroupName', args);
  }

  @override
  Future<void> removeUserScripts({
    required List<CygnusUserScript> userScripts,
  }) async {
    assert(webviewParams?.windowId == null);

    for (final userScript in userScripts) {
      await removeUserScript(userScript: userScript);
    }
  }

  @override
  Future<void> removeAllUserScripts() async {
    assert(webviewParams?.windowId == null);

    _userScripts[CygnusUserScriptInjectionTime.AT_DOCUMENT_START]?.clear();
    _userScripts[CygnusUserScriptInjectionTime.AT_DOCUMENT_END]?.clear();

    Map<String, dynamic> args = <String, dynamic>{};
    await channel?.invokeMethod('removeAllUserScripts', args);
  }

  @override
  bool hasUserScript({required CygnusUserScript userScript}) {
    return _userScripts[userScript.injectionTime]?.contains(userScript) ??
        false;
  }

  @override
  Future<void> addWebMessageListener(
    CygnusPlatformWebMessageListener webMessageListener,
  ) async {
    assert(
      !_webMessageListeners.contains(webMessageListener),
      "${webMessageListener} was already added.",
    );
    assert(
      !_webMessageListenerObjNames.contains(
        webMessageListener.params.jsObjectName,
      ),
      "jsObjectName ${webMessageListener.params.jsObjectName} was already added.",
    );
    _webMessageListeners.add(webMessageListener as WindowsWebMessageListener);
    _webMessageListenerObjNames.add(webMessageListener.params.jsObjectName);

    Map<String, dynamic> args = <String, dynamic>{};
    args.putIfAbsent('webMessageListener', () => webMessageListener.toMap());
    await channel?.invokeMethod('addWebMessageListener', args);
  }

  @override
  bool hasWebMessageListener(CygnusPlatformWebMessageListener webMessageListener) {
    return _webMessageListeners.contains(webMessageListener) ||
        _webMessageListenerObjNames.contains(
          webMessageListener.params.jsObjectName,
        );
  }

  @override
  Future<WindowsWebMessageChannel?> createWebMessageChannel() async {
    Map<String, dynamic> args = <String, dynamic>{};
    Map<String, dynamic>? result = (await channel?.invokeMethod(
      'createWebMessageChannel',
      args,
    ))?.cast<String, dynamic>();
    final webMessageChannel = WindowsWebMessageChannel.static().fromMap(result);
    if (webMessageChannel != null) {
      _webMessageChannels.add(webMessageChannel);
    }
    return webMessageChannel;
  }

  @override
  Future<void> postWebMessage({
    required CygnusWebMessage message,
    CygnusWebUri? targetOrigin,
  }) async {
    if (targetOrigin == null) {
      targetOrigin = CygnusWebUri('');
    }
    Map<String, dynamic> args = <String, dynamic>{};
    args.putIfAbsent('message', () => message.toMap());
    args.putIfAbsent('targetOrigin', () => targetOrigin.toString());
    await channel?.invokeMethod('postWebMessage', args);
  }

  @override
  Future<CygnusCallAsyncJavaScriptResult?> callAsyncJavaScript({
    required String functionBody,
    Map<String, dynamic> arguments = const <String, dynamic>{},
    CygnusContentWorld? contentWorld,
  }) async {
    Map<String, dynamic> args = <String, dynamic>{};
    args.putIfAbsent('functionBody', () => functionBody);
    args.putIfAbsent('arguments', () => jsonEncode(arguments));
    args.putIfAbsent('contentWorld', () => contentWorld?.toMap());
    var data = await channel?.invokeMethod('callAsyncJavaScript', args);
    if (data == null) {
      return null;
    }
    data = json.decode(data);
    return CygnusCallAsyncJavaScriptResult(
      value: data["value"],
      error: data["error"],
    );
  }

  @override
  Future<String?> saveWebArchive({
    required String filePath,
    bool autoname = false,
  }) async {
    if (!autoname) {
      assert(
        CygnusWebArchiveFormat.WEBARCHIVE.isSupported() &&
            filePath.endsWith(
              "." + CygnusWebArchiveFormat.WEBARCHIVE.toNativeValue()!,
            ),
      );
    }

    Map<String, dynamic> args = <String, dynamic>{};
    args.putIfAbsent("filePath", () => filePath);
    args.putIfAbsent("autoname", () => autoname);
    return await channel?.invokeMethod<String?>('saveWebArchive', args);
  }

  @override
  Future<bool> isSecureContext() async {
    Map<String, dynamic> args = <String, dynamic>{};
    return await channel?.invokeMethod<bool>('isSecureContext', args) ?? false;
  }

  @override
  Future<bool> canScrollVertically() async {
    Map<String, dynamic> args = <String, dynamic>{};
    return await channel?.invokeMethod<bool>('canScrollVertically', args) ??
        false;
  }

  @override
  Future<bool> canScrollHorizontally() async {
    Map<String, dynamic> args = <String, dynamic>{};
    return await channel?.invokeMethod<bool>('canScrollHorizontally', args) ??
        false;
  }

  @override
  Future<void> reloadFromOrigin() async {
    Map<String, dynamic> args = <String, dynamic>{};
    await channel?.invokeMethod('reloadFromOrigin', args);
  }

  @override
  Future<Uint8List?> createPdf({
    @Deprecated("Use pdfConfiguration instead")
    // ignore: deprecated_member_use_from_same_package
    CygnusIOSWKPDFConfiguration? iosWKPdfConfiguration,
    CygnusPDFConfiguration? pdfConfiguration,
  }) async {
    Map<String, dynamic> args = <String, dynamic>{};
    args.putIfAbsent(
      'pdfConfiguration',
      () => pdfConfiguration?.toMap() ?? iosWKPdfConfiguration?.toMap(),
    );
    return await channel?.invokeMethod<Uint8List?>('createPdf', args);
  }

  @override
  Future<Uint8List?> createWebArchiveData() async {
    Map<String, dynamic> args = <String, dynamic>{};
    return await channel?.invokeMethod('createWebArchiveData', args);
  }

  @override
  Future<bool> hasOnlySecureContent() async {
    Map<String, dynamic> args = <String, dynamic>{};
    return await channel?.invokeMethod<bool>('hasOnlySecureContent', args) ??
        false;
  }

  @override
  Future<void> pauseAllMediaPlayback() async {
    Map<String, dynamic> args = <String, dynamic>{};
    return await channel?.invokeMethod('pauseAllMediaPlayback', args);
  }

  @override
  Future<void> setAllMediaPlaybackSuspended({required bool suspended}) async {
    Map<String, dynamic> args = <String, dynamic>{};
    args.putIfAbsent("suspended", () => suspended);
    return await channel?.invokeMethod('setAllMediaPlaybackSuspended', args);
  }

  @override
  Future<void> closeAllMediaPresentations() async {
    Map<String, dynamic> args = <String, dynamic>{};
    return await channel?.invokeMethod('closeAllMediaPresentations', args);
  }

  @override
  Future<CygnusMediaPlaybackState?> requestMediaPlaybackState() async {
    Map<String, dynamic> args = <String, dynamic>{};
    return CygnusMediaPlaybackState.fromNativeValue(
      await channel?.invokeMethod('requestMediaPlaybackState', args),
    );
  }

  @override
  Future<bool> isInFullscreen() async {
    Map<String, dynamic> args = <String, dynamic>{};
    return await channel?.invokeMethod<bool>('isInFullscreen', args) ?? false;
  }

  @override
  Future<CygnusMediaCaptureState?> getCameraCaptureState() async {
    Map<String, dynamic> args = <String, dynamic>{};
    return CygnusMediaCaptureState.fromNativeValue(
      await channel?.invokeMethod('getCameraCaptureState', args),
    );
  }

  @override
  Future<void> setCameraCaptureState({required CygnusMediaCaptureState state}) async {
    Map<String, dynamic> args = <String, dynamic>{};
    args.putIfAbsent('state', () => state.toNativeValue());
    await channel?.invokeMethod('setCameraCaptureState', args);
  }

  @override
  Future<CygnusMediaCaptureState?> getMicrophoneCaptureState() async {
    Map<String, dynamic> args = <String, dynamic>{};
    return CygnusMediaCaptureState.fromNativeValue(
      await channel?.invokeMethod('getMicrophoneCaptureState', args),
    );
  }

  @override
  Future<void> setMicrophoneCaptureState({
    required CygnusMediaCaptureState state,
  }) async {
    Map<String, dynamic> args = <String, dynamic>{};
    args.putIfAbsent('state', () => state.toNativeValue());
    await channel?.invokeMethod('setMicrophoneCaptureState', args);
  }

  @override
  Future<void> loadSimulatedRequest({
    required CygnusURLRequest urlRequest,
    required Uint8List data,
    CygnusURLResponse? urlResponse,
  }) async {
    Map<String, dynamic> args = <String, dynamic>{};
    args.putIfAbsent('urlRequest', () => urlRequest.toMap());
    args.putIfAbsent('data', () => data);
    args.putIfAbsent('urlResponse', () => urlResponse?.toMap());
    await channel?.invokeMethod('loadSimulatedRequest', args);
  }

  @override
  Future<void> openDevTools() async {
    Map<String, dynamic> args = <String, dynamic>{};
    await channel?.invokeMethod('openDevTools', args);
  }

  @override
  Future<dynamic> callDevToolsProtocolMethod({
    required String methodName,
    Map<String, dynamic>? parameters,
  }) async {
    Map<String, dynamic> args = <String, dynamic>{};
    args.putIfAbsent('methodName', () => methodName);
    args.putIfAbsent(
      'parametersAsJson',
      () => parameters != null ? jsonEncode(parameters) : null,
    );
    final result = await channel?.invokeMethod<String>(
      'callDevToolsProtocolMethod',
      args,
    );
    if (result != null) {
      return jsonDecode(result);
    }
    return null;
  }

  @override
  Future<void> addDevToolsProtocolEventListener({
    required String eventName,
    required Function(dynamic data) callback,
  }) async {
    Map<String, dynamic> args = <String, dynamic>{};
    args.putIfAbsent('eventName', () => eventName);
    await channel?.invokeMethod('addDevToolsProtocolEventListener', args);
    this._devToolsProtocolEventListenerMap[eventName] = callback;
  }

  @override
  Future<void> removeDevToolsProtocolEventListener({
    required String eventName,
  }) async {
    Map<String, dynamic> args = <String, dynamic>{};
    args.putIfAbsent('eventName', () => eventName);
    await channel?.invokeMethod('removeDevToolsProtocolEventListener', args);
    this._devToolsProtocolEventListenerMap.remove(eventName);
  }

  @override
  Future<void> clearSslPreferences() async {
    Map<String, dynamic> args = <String, dynamic>{};
    await channel?.invokeMethod('clearSslPreferences', args);
  }

  @override
  Future<void> pause() async {
    Map<String, dynamic> args = <String, dynamic>{};
    await channel?.invokeMethod('pause', args);
  }

  @override
  Future<void> resume() async {
    Map<String, dynamic> args = <String, dynamic>{};
    await channel?.invokeMethod('resume', args);
  }

  @override
  Future<bool> isInterfaceSupported(CygnusWebViewInterface interface) async {
    Map<String, dynamic> args = <String, dynamic>{};
    args.putIfAbsent('interface', () => interface.toNativeValue());
    return await channel?.invokeMethod<bool>('isInterfaceSupported', args) ??
        false;
  }

  @override
  Future<String> getDefaultUserAgent() async {
    Map<String, dynamic> args = <String, dynamic>{};
    return await _staticChannel.invokeMethod<String>(
          'getDefaultUserAgent',
          args,
        ) ??
        '';
  }

  @override
  Future<bool> handlesURLScheme(String urlScheme) async {
    Map<String, dynamic> args = <String, dynamic>{};
    args.putIfAbsent('urlScheme', () => urlScheme);
    return await _staticChannel.invokeMethod('handlesURLScheme', args);
  }

  @override
  Future<void> disposeKeepAlive(CygnusWebViewKeepAlive keepAlive) async {
    Map<String, dynamic> args = <String, dynamic>{};
    args.putIfAbsent('keepAliveId', () => keepAlive.id);
    await _staticChannel.invokeMethod('disposeKeepAlive', args);
    _keepAliveMap[keepAlive] = null;
  }

  @override
  Future<void> clearAllCache({bool includeDiskFiles = true}) async {
    Map<String, dynamic> args = <String, dynamic>{};
    args.putIfAbsent('includeDiskFiles', () => includeDiskFiles);
    await _staticChannel.invokeMethod('clearAllCache', args);
  }

  @override
  Future<void> setJavaScriptBridgeName(String bridgeName) async {
    assert(
      RegExp(r'^[a-zA-Z_]\w*$').hasMatch(bridgeName),
      'bridgeName must be a non-empty string with only alphanumeric and underscore characters. It can\'t start with a number.',
    );
    Map<String, dynamic> args = <String, dynamic>{};
    args.putIfAbsent('bridgeName', () => bridgeName);
    await _staticChannel.invokeMethod('setJavaScriptBridgeName', args);
  }

  @override
  Future<String> getJavaScriptBridgeName() async {
    Map<String, dynamic> args = <String, dynamic>{};
    return await _staticChannel.invokeMethod<String>(
          'getJavaScriptBridgeName',
          args,
        ) ??
        '';
  }

  @override
  Future<String> get tRexRunnerHtml async => await rootBundle.loadString(
    'packages/cygnus_core/assets/t_rex_runner/t-rex.html',
  );

  @override
  Future<String> get tRexRunnerCss async => await rootBundle.loadString(
    'packages/cygnus_core/assets/t_rex_runner/t-rex.css',
  );

  @override
  dynamic getViewId() {
    return id;
  }

  @override
  void dispose({bool isKeepAlive = false}) {
    disposeChannel(removeMethodCallHandler: !isKeepAlive);
    _browser = null;
    webStorage.dispose();
    if (!isKeepAlive) {
      for (final webMessageListener in _webMessageListeners) {
        webMessageListener.dispose();
      }
      _webMessageListeners.clear();
      for (final webMessageChannel in _webMessageChannels) {
        webMessageChannel.dispose();
      }
      _webMessageChannels.clear();
      _controllerFromPlatform = null;
      _javaScriptHandlersMap.clear();
      _userScripts.clear();
      _webMessageListenerObjNames.clear();
      _injectedScriptsFromURL.clear();
      _devToolsProtocolEventListenerMap.clear();
    }
  }
}

extension InternalInAppWebViewController on WindowsInAppWebViewController {
  get handleMethod => _handleMethod;
}
