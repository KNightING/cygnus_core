// src/index.ts
(function() {
  let _JSON_stringify = window.JSON.stringify;
  let _Array_slice = window.Array.prototype.slice;
  _Array_slice.call = window.Function.prototype.call;
  window.cygnusWeb = {
    createCygnusWebView: function(viewId, iframe, iframeContainer, bridgeSecret) {
      const iframeId = iframe.id;
      const webView = {
        viewId,
        iframeId,
        iframe: null,
        iframeContainer: null,
        isFullscreen: false,
        documentTitle: null,
        functionMap: {},
        settings: {},
        javaScriptBridgeEnabled: true,
        disableContextMenuHandler: function(event) {
          event.preventDefault();
          event.stopPropagation();
          return false;
        },
        prepare: function(settings) {
          webView.settings = settings;
          webView.javaScriptBridgeEnabled = webView.settings.javaScriptBridgeEnabled ?? true;
          const javaScriptBridgeOriginAllowList = webView.settings.javaScriptBridgeOriginAllowList;
          if (javaScriptBridgeOriginAllowList != null && !javaScriptBridgeOriginAllowList.includes("*")) {
            if (javaScriptBridgeOriginAllowList.length === 0) {
              webView.javaScriptBridgeEnabled = false;
            }
          }
          document.addEventListener("fullscreenchange", function(event) {
            if (document.fullscreenElement && document.fullscreenElement.id == iframeId) {
              webView.isFullscreen = true;
              _nativeCommunication("onEnterFullscreen", viewId);
            } else if (!document.fullscreenElement && webView.isFullscreen) {
              webView.isFullscreen = false;
              _nativeCommunication("onExitFullscreen", viewId);
            } else {
              webView.isFullscreen = false;
            }
          });
          if (iframe != null) {
            webView.iframe = iframe;
            webView.iframeContainer = iframeContainer;
            iframe.addEventListener("load", function(event) {
              if (iframe.contentWindow == null) {
                return;
              }
              const userScriptsAtStart = _nativeCommunication("getUserOnlyScriptsAt", viewId, [0 /* AT_DOCUMENT_START */]);
              const userScriptsAtEnd = _nativeCommunication("getUserOnlyScriptsAt", viewId, [1 /* AT_DOCUMENT_END */]);
              try {
                let javaScriptBridgeEnabled = webView.javaScriptBridgeEnabled;
                if (javaScriptBridgeOriginAllowList != null) {
                  javaScriptBridgeEnabled = javaScriptBridgeOriginAllowList.map((allowedOriginRule) => new RegExp(allowedOriginRule)).some((rx) => {
                    return rx.test(iframe.contentWindow.location.origin);
                  });
                }
                if (javaScriptBridgeEnabled) {
                  const javaScriptBridgeName = _nativeCommunication("getJavaScriptBridgeName", viewId);
                  iframe.contentWindow[javaScriptBridgeName] = {
                    callHandler: function() {
                      let origin = "";
                      let requestUrl = "";
                      try {
                        origin = iframe.contentWindow.location.origin;
                      } catch (_) {
                      }
                      try {
                        requestUrl = iframe.contentWindow.location.href;
                      } catch (_) {
                      }
                      return _nativeCommunication(
                        "onCallJsHandler",
                        viewId,
                        [arguments[0], _JSON_stringify({
                          "origin": origin,
                          "requestUrl": requestUrl,
                          "isMainFrame": true,
                          "_bridgeSecret": bridgeSecret,
                          "args": _JSON_stringify(_Array_slice.call(arguments, 1))
                        })]
                      );
                    }
                  };
                }
              } catch (e) {
                console.log(e);
              }
              for (const userScript of [...userScriptsAtStart, ...userScriptsAtEnd]) {
                let ifStatement = "if (";
                let source = userScript.source;
                if (userScript.allowedOriginRules != null && !userScript.allowedOriginRules.includes("*")) {
                  if (userScript.allowedOriginRules.length === 0) {
                    source = "";
                  }
                  let jsRegExpArray = "[";
                  for (const allowedOriginRule of userScript.allowedOriginRules) {
                    if (jsRegExpArray.length > 1) {
                      jsRegExpArray += ",";
                    }
                    jsRegExpArray += `new RegExp('${allowedOriginRule.replace("'", "\\'")}')`;
                  }
                  if (jsRegExpArray.length > 1) {
                    jsRegExpArray += "]";
                    ifStatement += `${jsRegExpArray}.some(function(rx) { return rx.test(window.location.origin); })`;
                  }
                }
                webView.evaluateJavascript(ifStatement.length > 4 ? `${ifStatement}) { ${source} }` : source);
              }
              let url = iframe.src;
              try {
                url = iframe.contentWindow.location.href;
              } catch (e) {
                console.log(e);
              }
              _nativeCommunication("onLoadStart", viewId, [url]);
              try {
                const oldLogs = {
                  "log": iframe.contentWindow.console.log,
                  "debug": iframe.contentWindow.console.debug,
                  "error": iframe.contentWindow.console.error,
                  "info": iframe.contentWindow.console.info,
                  "warn": iframe.contentWindow.console.warn
                };
                for (const k in oldLogs) {
                  (function(oldLog) {
                    iframe.contentWindow.console[oldLog] = function() {
                      var message = "";
                      for (var i in arguments) {
                        if (message == "") {
                          message += arguments[i];
                        } else {
                          message += " " + arguments[i];
                        }
                      }
                      oldLogs[oldLog].call(iframe.contentWindow.console, ...arguments);
                      _nativeCommunication("onConsoleMessage", viewId, [oldLog, message]);
                    };
                  })(k);
                }
              } catch (e) {
                console.log(e);
              }
              try {
                const originalPushState = iframe.contentWindow.history.pushState;
                iframe.contentWindow.history.pushState = function(state, unused, url2) {
                  originalPushState.call(iframe.contentWindow.history, state, unused, url2);
                  let iframeUrl = iframe.src;
                  try {
                    iframeUrl = iframe.contentWindow.location.href;
                  } catch (e) {
                    console.log(e);
                  }
                  _nativeCommunication("onUpdateVisitedHistory", viewId, [iframeUrl]);
                };
                const originalReplaceState = iframe.contentWindow.history.replaceState;
                iframe.contentWindow.history.replaceState = function(state, unused, url2) {
                  originalReplaceState.call(iframe.contentWindow.history, state, unused, url2);
                  let iframeUrl = iframe.src;
                  try {
                    iframeUrl = iframe.contentWindow.location.href;
                  } catch (e) {
                    console.log(e);
                  }
                  _nativeCommunication("onUpdateVisitedHistory", viewId, [iframeUrl]);
                };
                const originalClose = iframe.contentWindow.close;
                iframe.contentWindow.close = function() {
                  originalClose.call(iframe.contentWindow);
                  _nativeCommunication("onCloseWindow", viewId);
                };
                const originalOpen = iframe.contentWindow.open;
                iframe.contentWindow.open = function(url2, target, windowFeatures) {
                  const newWindow = originalOpen.call(iframe.contentWindow, ...arguments);
                  _nativeCommunication("onCreateWindow", viewId, [url2, target, windowFeatures]).then(function(handledByClient) {
                    if (handledByClient) {
                      newWindow?.close();
                    }
                  });
                  return newWindow;
                };
                const originalPrint = iframe.contentWindow.print;
                iframe.contentWindow.print = function() {
                  let iframeUrl = iframe.src;
                  try {
                    iframeUrl = iframe.contentWindow.location.href;
                  } catch (e) {
                    console.log(e);
                  }
                  _nativeCommunication("onPrintRequest", viewId, [iframeUrl]);
                  originalPrint.call(iframe.contentWindow);
                };
                webView.functionMap = {
                  "window.open": iframe.contentWindow.open
                };
                const initialTitle = iframe.contentDocument?.title;
                const titleEl = iframe.contentDocument?.querySelector("title");
                webView.documentTitle = initialTitle;
                _nativeCommunication("onTitleChanged", viewId, [initialTitle]);
                if (titleEl != null) {
                  new MutationObserver(function(mutations) {
                    const title = mutations[0].target.innerText;
                    if (title != webView.documentTitle) {
                      webView.documentTitle = title;
                      _nativeCommunication("onTitleChanged", viewId, [title]);
                    }
                  }).observe(
                    titleEl,
                    { subtree: true, characterData: true, childList: true }
                  );
                }
                let oldPixelRatio = iframe.contentWindow.devicePixelRatio;
                iframe.contentWindow.addEventListener("resize", function(e) {
                  const newPixelRatio = iframe.contentWindow.devicePixelRatio;
                  if (newPixelRatio !== oldPixelRatio) {
                    _nativeCommunication("onZoomScaleChanged", viewId, [oldPixelRatio, newPixelRatio]);
                    oldPixelRatio = newPixelRatio;
                  }
                });
                iframe.contentWindow.addEventListener("popstate", function(event2) {
                  let iframeUrl = iframe.src;
                  try {
                    iframeUrl = iframe.contentWindow.location.href;
                  } catch (e) {
                    console.log(e);
                  }
                  _nativeCommunication("onUpdateVisitedHistory", viewId, [iframeUrl]);
                });
                iframe.contentWindow.addEventListener("scroll", function(event2) {
                  let x = 0;
                  let y = 0;
                  try {
                    x = iframe.contentWindow.scrollX;
                    y = iframe.contentWindow.scrollY;
                  } catch (e) {
                    console.log(e);
                  }
                  _nativeCommunication("onScrollChanged", viewId, [x, y]);
                });
                iframe.contentWindow.addEventListener("focus", function(event2) {
                  _nativeCommunication("onWindowFocus", viewId);
                });
                iframe.contentWindow.addEventListener("blur", function(event2) {
                  _nativeCommunication("onWindowBlur", viewId);
                });
              } catch (e) {
                console.log(e);
              }
              try {
                if (!webView.settings.javaScriptCanOpenWindowsAutomatically) {
                  iframe.contentWindow.open = function() {
                    throw new Error("JavaScript cannot open windows automatically");
                  };
                }
                if (!webView.settings.verticalScrollBarEnabled && !webView.settings.horizontalScrollBarEnabled) {
                  const style = iframe.contentDocument?.createElement("style");
                  if (style != null) {
                    style.id = "settings.verticalScrollBarEnabled-settings.horizontalScrollBarEnabled";
                    style.innerHTML = "body::-webkit-scrollbar { width: 0px; height: 0px; }";
                    iframe.contentDocument?.head.append(style);
                  }
                }
                if (webView.settings.disableVerticalScroll) {
                  const style = iframe.contentDocument?.createElement("style");
                  if (style != null) {
                    style.id = "settings.disableVerticalScroll";
                    style.innerHTML = "body { overflow-y: hidden; }";
                    iframe.contentDocument?.head.append(style);
                  }
                }
                if (webView.settings.disableHorizontalScroll) {
                  const style = iframe.contentDocument?.createElement("style");
                  if (style != null) {
                    style.id = "settings.disableHorizontalScroll";
                    style.innerHTML = "body { overflow-x: hidden; }";
                    iframe.contentDocument?.head.append(style);
                  }
                }
                if (webView.settings.disableContextMenu) {
                  iframe.contentWindow.addEventListener("contextmenu", webView.disableContextMenuHandler);
                }
              } catch (e) {
                console.log(e);
              }
              _nativeCommunication("onLoadStop", viewId, [url]);
              try {
                iframe.contentWindow.dispatchEvent(new Event("cygnusPlatformReady"));
              } catch (e) {
                console.log(e);
              }
            });
          }
        },
        setSettings: function(newSettings) {
          const iframe2 = webView.iframe;
          if (iframe2 == null) {
            return;
          }
          try {
            if (webView.settings.javaScriptCanOpenWindowsAutomatically != newSettings.javaScriptCanOpenWindowsAutomatically) {
              if (!newSettings.javaScriptCanOpenWindowsAutomatically) {
                iframe2.contentWindow.open = function() {
                  throw new Error("JavaScript cannot open windows automatically");
                };
              } else {
                iframe2.contentWindow.open = webView.functionMap["window.open"];
              }
            }
            if (webView.settings.verticalScrollBarEnabled != newSettings.verticalScrollBarEnabled && webView.settings.horizontalScrollBarEnabled != newSettings.horizontalScrollBarEnabled) {
              if (!newSettings.verticalScrollBarEnabled && !newSettings.horizontalScrollBarEnabled) {
                const style = iframe2.contentDocument?.createElement("style");
                if (style != null) {
                  style.id = "settings.verticalScrollBarEnabled-settings.horizontalScrollBarEnabled";
                  style.innerHTML = "body::-webkit-scrollbar { width: 0px; height: 0px; }";
                  iframe2.contentDocument?.head.append(style);
                }
              } else {
                const styleElement = iframe2.contentDocument?.getElementById("settings.verticalScrollBarEnabled-settings.horizontalScrollBarEnabled");
                if (styleElement) {
                  styleElement.remove();
                }
              }
            }
            if (webView.settings.disableVerticalScroll != newSettings.disableVerticalScroll) {
              if (newSettings.disableVerticalScroll) {
                const style = iframe2.contentDocument?.createElement("style");
                if (style != null) {
                  style.id = "settings.disableVerticalScroll";
                  style.innerHTML = "body { overflow-y: hidden; }";
                  iframe2.contentDocument?.head.append(style);
                }
              } else {
                const styleElement = iframe2.contentDocument?.getElementById("settings.disableVerticalScroll");
                if (styleElement) {
                  styleElement.remove();
                }
              }
            }
            if (webView.settings.disableHorizontalScroll != newSettings.disableHorizontalScroll) {
              if (newSettings.disableHorizontalScroll) {
                const style = iframe2.contentDocument?.createElement("style");
                if (style != null) {
                  style.id = "settings.disableHorizontalScroll";
                  style.innerHTML = "body { overflow-x: hidden; }";
                  iframe2.contentDocument?.head.append(style);
                }
              } else {
                const styleElement = iframe2.contentDocument?.getElementById("settings.disableHorizontalScroll");
                if (styleElement) {
                  styleElement.remove();
                }
              }
            }
            if (webView.settings.disableContextMenu != newSettings.disableContextMenu) {
              if (newSettings.disableContextMenu) {
                iframe2.contentWindow?.addEventListener("contextmenu", webView.disableContextMenuHandler);
              } else {
                iframe2.contentWindow?.removeEventListener("contextmenu", webView.disableContextMenuHandler);
              }
            }
          } catch (e) {
            console.log(e);
          }
          webView.settings = newSettings;
        },
        reload: function() {
          var iframe2 = webView.iframe;
          if (iframe2 != null && iframe2.contentWindow != null) {
            try {
              iframe2.contentWindow.location.reload();
            } catch (e) {
              console.log(e);
              iframe2.contentWindow.location.href = iframe2.src;
            }
          }
        },
        goBack: function() {
          var iframe2 = webView.iframe;
          if (iframe2 != null) {
            try {
              iframe2.contentWindow?.history.back();
            } catch (e) {
              console.log(e);
            }
          }
        },
        goForward: function() {
          var iframe2 = webView.iframe;
          if (iframe2 != null) {
            try {
              iframe2.contentWindow?.history.forward();
            } catch (e) {
              console.log(e);
            }
          }
        },
        goBackOrForward: function(steps) {
          var iframe2 = webView.iframe;
          if (iframe2 != null) {
            try {
              iframe2.contentWindow?.history.go(steps);
            } catch (e) {
              console.log(e);
            }
          }
        },
        evaluateJavascript: function(source) {
          const iframe2 = webView.iframe;
          let result = null;
          if (iframe2 != null) {
            try {
              result = JSON.stringify(iframe2.contentWindow?.eval(source));
            } catch (e) {
            }
          }
          return result;
        },
        stopLoading: function() {
          const iframe2 = webView.iframe;
          if (iframe2 != null) {
            try {
              iframe2.contentWindow?.stop();
            } catch (e) {
              console.log(e);
            }
          }
        },
        getUrl: function() {
          const iframe2 = webView.iframe;
          let url = iframe2?.src;
          try {
            url = iframe2?.contentWindow?.location.href;
          } catch (e) {
            console.log(e);
          }
          return url;
        },
        getTitle: function() {
          const iframe2 = webView.iframe;
          let title = null;
          try {
            title = iframe2?.contentDocument?.title;
          } catch (e) {
            console.log(e);
          }
          return title;
        },
        injectJavascriptFileFromUrl: function(urlFile, scriptHtmlTagAttributes) {
          const iframe2 = webView.iframe;
          try {
            const d = iframe2?.contentDocument;
            if (d == null) {
              return;
            }
            const script = d.createElement("script");
            for (const key of Object.keys(scriptHtmlTagAttributes)) {
              if (scriptHtmlTagAttributes[key] != null) {
                script[key] = scriptHtmlTagAttributes[key];
              }
            }
            if (script.id != null) {
              script.onload = function() {
                _nativeCommunication("onInjectedScriptLoaded", webView.viewId, [script.id]);
              };
              script.onerror = function() {
                _nativeCommunication("onInjectedScriptError", webView.viewId, [script.id]);
              };
            }
            script.src = urlFile;
            if (d.body != null) {
              d.body.appendChild(script);
            }
          } catch (e) {
            console.log(e);
          }
        },
        injectCSSCode: function(source) {
          const iframe2 = webView.iframe;
          try {
            const d = iframe2?.contentDocument;
            if (d == null) {
              return;
            }
            const style = d.createElement("style");
            style.innerHTML = source;
            if (d.head != null) {
              d.head.appendChild(style);
            }
          } catch (e) {
            console.log(e);
          }
        },
        injectCSSFileFromUrl: function(urlFile, cssLinkHtmlTagAttributes) {
          const iframe2 = webView.iframe;
          try {
            const d = iframe2?.contentDocument;
            if (d == null) {
              return;
            }
            const link = d.createElement("link");
            for (const key of Object.keys(cssLinkHtmlTagAttributes)) {
              if (cssLinkHtmlTagAttributes[key] != null) {
                link[key] = cssLinkHtmlTagAttributes[key];
              }
            }
            link.type = "text/css";
            var alternateStylesheet = "";
            if (cssLinkHtmlTagAttributes.alternateStylesheet) {
              alternateStylesheet = "alternate ";
            }
            link.rel = alternateStylesheet + "stylesheet";
            link.href = urlFile;
            if (d.head != null) {
              d.head.appendChild(link);
            }
          } catch (e) {
            console.log(e);
          }
        },
        scrollTo: function(x, y, animated) {
          const iframe2 = webView.iframe;
          try {
            if (animated) {
              iframe2?.contentWindow?.scrollTo({ top: y, left: x, behavior: "smooth" });
            } else {
              iframe2?.contentWindow?.scrollTo(x, y);
            }
          } catch (e) {
            console.log(e);
          }
        },
        scrollBy: function(x, y, animated) {
          const iframe2 = webView.iframe;
          try {
            if (animated) {
              iframe2?.contentWindow?.scrollBy({ top: y, left: x, behavior: "smooth" });
            } else {
              iframe2?.contentWindow?.scrollBy(x, y);
            }
          } catch (e) {
            console.log(e);
          }
        },
        printCurrentPage: function() {
          const iframe2 = webView.iframe;
          try {
            iframe2?.contentWindow?.print();
          } catch (e) {
            console.log(e);
          }
        },
        getContentHeight: function() {
          const iframe2 = webView.iframe;
          try {
            return iframe2?.contentDocument?.documentElement.scrollHeight;
          } catch (e) {
            console.log(e);
          }
          return null;
        },
        getContentWidth: function() {
          const iframe2 = webView.iframe;
          try {
            return iframe2?.contentDocument?.documentElement.scrollWidth;
          } catch (e) {
            console.log(e);
          }
          return null;
        },
        getSelectedText: function() {
          const iframe2 = webView.iframe;
          try {
            let txt;
            const w = iframe2?.contentWindow;
            if (w == null) {
              return null;
            }
            if (w.getSelection) {
              txt = w.getSelection()?.toString();
            } else if (w.document.getSelection) {
              txt = w.document.getSelection()?.toString();
            } else if (w.document.selection) {
              txt = w.document.selection.createRange().text;
            }
            return txt;
          } catch (e) {
            console.log(e);
          }
          return null;
        },
        getScrollX: function() {
          const iframe2 = webView.iframe;
          try {
            return iframe2?.contentWindow?.scrollX;
          } catch (e) {
            console.log(e);
          }
          return null;
        },
        getScrollY: function() {
          const iframe2 = webView.iframe;
          try {
            return iframe2?.contentWindow?.scrollY;
          } catch (e) {
            console.log(e);
          }
          return null;
        },
        isSecureContext: function() {
          const iframe2 = webView.iframe;
          try {
            return iframe2?.contentWindow?.isSecureContext ?? false;
          } catch (e) {
            console.log(e);
          }
          return false;
        },
        canScrollVertically: function() {
          const iframe2 = webView.iframe;
          try {
            return (iframe2?.contentDocument?.body.scrollHeight ?? 0) > (iframe2?.contentWindow?.innerHeight ?? 0);
          } catch (e) {
            console.log(e);
          }
          return false;
        },
        canScrollHorizontally: function() {
          const iframe2 = webView.iframe;
          try {
            return (iframe2?.contentDocument?.body.scrollWidth ?? 0) > (iframe2?.contentWindow?.innerWidth ?? 0);
          } catch (e) {
            console.log(e);
          }
          return false;
        },
        getSize: function() {
          const iframeContainer2 = webView.iframeContainer;
          let width = 0;
          let height = 0;
          if (iframeContainer2 != null) {
            if (iframeContainer2.style.width != null && iframeContainer2.style.width != "" && iframeContainer2.style.width.indexOf("px") > 0) {
              width = parseFloat(iframeContainer2.style.width);
            }
            if (width == null || width == 0) {
              width = iframeContainer2.getBoundingClientRect().width;
            }
            if (iframeContainer2.style.height != null && iframeContainer2.style.height != "" && iframeContainer2.style.height.indexOf("px") > 0) {
              height = parseFloat(iframeContainer2.style.height);
            }
            if (height == null || height == 0) {
              height = iframeContainer2.getBoundingClientRect().height;
            }
          }
          return {
            width,
            height
          };
        }
      };
      return webView;
    },
    getCookieExpirationDate: function(timestamp) {
      return new Date(timestamp).toUTCString();
    },
    nativeAsyncCommunication: function(method, viewId, args) {
      throw new Error("Method not implemented.");
    },
    nativeSyncCommunication: function(method, viewId, args) {
      throw new Error("Method not implemented.");
    },
    nativeCommunication: function(method, viewId, args) {
      try {
        const result = window.cygnusWeb.nativeSyncCommunication(method, viewId, args);
        return result != null ? JSON.parse(result) : null;
      } catch (e1) {
        try {
          const promise = window.cygnusWeb.nativeAsyncCommunication(method, viewId, args);
          return promise.then(function(result) {
            return result != null ? JSON.parse(result) : null;
          });
        } catch (e2) {
          return null;
        }
      }
    }
  };
  let _nativeCommunication = window.cygnusWeb.nativeCommunication;
})();
//# sourceMappingURL=data:application/json;base64,ewogICJ2ZXJzaW9uIjogMywKICAic291cmNlcyI6IFsiLi4vLi4vLi4vd2ViX3N1cHBvcnQvc3JjL2luZGV4LnRzIl0sCiAgInNvdXJjZXNDb250ZW50IjogWyJpbXBvcnQge1xuICBDeWdudXNXZWJWaWV3LFxuICBDeWdudXNXZWJWaWV3UGx1Z2luLFxuICBDeWdudXNXZWJWaWV3U2V0dGluZ3MsXG4gIEphdmFTY3JpcHRCcmlkZ2VIYW5kbGVyLFxuICBVc2VyU2NyaXB0LFxuICBVc2VyU2NyaXB0SW5qZWN0aW9uVGltZVxufSBmcm9tIFwiLi90eXBlc1wiO1xuXG5kZWNsYXJlIGdsb2JhbCB7XG4gIGludGVyZmFjZSBXaW5kb3cge1xuICAgIGN5Z251c1dlYjogQ3lnbnVzV2ViVmlld1BsdWdpbjtcbiAgICBjeWdudXM/OiBKYXZhU2NyaXB0QnJpZGdlSGFuZGxlciB8IG51bGw7XG4gICAgY29uc29sZTogQ29uc29sZTtcblxuICAgIGV2YWwoeDogc3RyaW5nKTogYW55O1xuICB9XG59XG5cbihmdW5jdGlvbiAoKSB7XG4gIGxldCBfSlNPTl9zdHJpbmdpZnkgPSB3aW5kb3cuSlNPTi5zdHJpbmdpZnk7XG4gIGxldCBfQXJyYXlfc2xpY2UgPSB3aW5kb3cuQXJyYXkucHJvdG90eXBlLnNsaWNlO1xuICBfQXJyYXlfc2xpY2UuY2FsbCA9IHdpbmRvdy5GdW5jdGlvbi5wcm90b3R5cGUuY2FsbDtcblxuICB3aW5kb3cuY3lnbnVzV2ViID0ge1xuICAgIGNyZWF0ZUN5Z251c1dlYlZpZXc6IGZ1bmN0aW9uICh2aWV3SWQ6IG51bWJlciB8IHN0cmluZywgaWZyYW1lOiBIVE1MSUZyYW1lRWxlbWVudCwgaWZyYW1lQ29udGFpbmVyOiBIVE1MRGl2RWxlbWVudCwgYnJpZGdlU2VjcmV0OiBzdHJpbmcpIHtcbiAgICAgIGNvbnN0IGlmcmFtZUlkID0gaWZyYW1lLmlkO1xuICAgICAgY29uc3Qgd2ViVmlldzogQ3lnbnVzV2ViVmlldyA9IHtcbiAgICAgICAgdmlld0lkOiB2aWV3SWQsXG4gICAgICAgIGlmcmFtZUlkOiBpZnJhbWVJZCxcbiAgICAgICAgaWZyYW1lOiBudWxsLFxuICAgICAgICBpZnJhbWVDb250YWluZXI6IG51bGwsXG4gICAgICAgIGlzRnVsbHNjcmVlbjogZmFsc2UsXG4gICAgICAgIGRvY3VtZW50VGl0bGU6IG51bGwsXG4gICAgICAgIGZ1bmN0aW9uTWFwOiB7fSxcbiAgICAgICAgc2V0dGluZ3M6IHt9LFxuICAgICAgICBqYXZhU2NyaXB0QnJpZGdlRW5hYmxlZDogdHJ1ZSxcbiAgICAgICAgZGlzYWJsZUNvbnRleHRNZW51SGFuZGxlcjogZnVuY3Rpb24gKGV2ZW50OiBFdmVudCkge1xuICAgICAgICAgIGV2ZW50LnByZXZlbnREZWZhdWx0KCk7XG4gICAgICAgICAgZXZlbnQuc3RvcFByb3BhZ2F0aW9uKCk7XG4gICAgICAgICAgcmV0dXJuIGZhbHNlO1xuICAgICAgICB9LFxuICAgICAgICBwcmVwYXJlOiBmdW5jdGlvbiAoc2V0dGluZ3M6IEN5Z251c1dlYlZpZXdTZXR0aW5ncykge1xuICAgICAgICAgIHdlYlZpZXcuc2V0dGluZ3MgPSBzZXR0aW5ncztcblxuICAgICAgICAgIHdlYlZpZXcuamF2YVNjcmlwdEJyaWRnZUVuYWJsZWQgPSB3ZWJWaWV3LnNldHRpbmdzLmphdmFTY3JpcHRCcmlkZ2VFbmFibGVkID8/IHRydWU7XG4gICAgICAgICAgY29uc3QgamF2YVNjcmlwdEJyaWRnZU9yaWdpbkFsbG93TGlzdCA9IHdlYlZpZXcuc2V0dGluZ3MuamF2YVNjcmlwdEJyaWRnZU9yaWdpbkFsbG93TGlzdDtcbiAgICAgICAgICBpZiAoamF2YVNjcmlwdEJyaWRnZU9yaWdpbkFsbG93TGlzdCAhPSBudWxsICYmICFqYXZhU2NyaXB0QnJpZGdlT3JpZ2luQWxsb3dMaXN0LmluY2x1ZGVzKFwiKlwiKSkge1xuICAgICAgICAgICAgaWYgKGphdmFTY3JpcHRCcmlkZ2VPcmlnaW5BbGxvd0xpc3QubGVuZ3RoID09PSAwKSB7XG4gICAgICAgICAgICAgIC8vIGFuIGVtcHR5IGxpc3QgbWVhbnMgdGhhdCB0aGUgSmF2YVNjcmlwdCBCcmlkZ2UgaXMgbm90IGFsbG93ZWQgZm9yIGFueSBvcmlnaW4uXG4gICAgICAgICAgICAgIHdlYlZpZXcuamF2YVNjcmlwdEJyaWRnZUVuYWJsZWQgPSBmYWxzZTtcbiAgICAgICAgICAgIH1cbiAgICAgICAgICB9XG5cbiAgICAgICAgICBkb2N1bWVudC5hZGRFdmVudExpc3RlbmVyKCdmdWxsc2NyZWVuY2hhbmdlJywgZnVuY3Rpb24gKGV2ZW50OiBFdmVudCkge1xuICAgICAgICAgICAgLy8gZG9jdW1lbnQuZnVsbHNjcmVlbkVsZW1lbnQgd2lsbCBwb2ludCB0byB0aGUgZWxlbWVudCB0aGF0XG4gICAgICAgICAgICAvLyBpcyBpbiBmdWxsc2NyZWVuIG1vZGUgaWYgdGhlcmUgaXMgb25lLiBJZiB0aGVyZSBpc24ndCBvbmUsXG4gICAgICAgICAgICAvLyB0aGUgdmFsdWUgb2YgdGhlIHByb3BlcnR5IGlzIG51bGwuXG4gICAgICAgICAgICBpZiAoZG9jdW1lbnQuZnVsbHNjcmVlbkVsZW1lbnQgJiYgZG9jdW1lbnQuZnVsbHNjcmVlbkVsZW1lbnQuaWQgPT0gaWZyYW1lSWQpIHtcbiAgICAgICAgICAgICAgd2ViVmlldy5pc0Z1bGxzY3JlZW4gPSB0cnVlO1xuICAgICAgICAgICAgICBfbmF0aXZlQ29tbXVuaWNhdGlvbignb25FbnRlckZ1bGxzY3JlZW4nLCB2aWV3SWQpO1xuICAgICAgICAgICAgfSBlbHNlIGlmICghZG9jdW1lbnQuZnVsbHNjcmVlbkVsZW1lbnQgJiYgd2ViVmlldy5pc0Z1bGxzY3JlZW4pIHtcbiAgICAgICAgICAgICAgd2ViVmlldy5pc0Z1bGxzY3JlZW4gPSBmYWxzZTtcbiAgICAgICAgICAgICAgX25hdGl2ZUNvbW11bmljYXRpb24oJ29uRXhpdEZ1bGxzY3JlZW4nLCB2aWV3SWQpO1xuICAgICAgICAgICAgfSBlbHNlIHtcbiAgICAgICAgICAgICAgd2ViVmlldy5pc0Z1bGxzY3JlZW4gPSBmYWxzZTtcbiAgICAgICAgICAgIH1cbiAgICAgICAgICB9KTtcblxuICAgICAgICAgIGlmIChpZnJhbWUgIT0gbnVsbCkge1xuICAgICAgICAgICAgd2ViVmlldy5pZnJhbWUgPSBpZnJhbWU7XG4gICAgICAgICAgICB3ZWJWaWV3LmlmcmFtZUNvbnRhaW5lciA9IGlmcmFtZUNvbnRhaW5lcjtcbiAgICAgICAgICAgIGlmcmFtZS5hZGRFdmVudExpc3RlbmVyKCdsb2FkJywgZnVuY3Rpb24gKGV2ZW50OiBFdmVudCkge1xuICAgICAgICAgICAgICBpZiAoaWZyYW1lLmNvbnRlbnRXaW5kb3cgPT0gbnVsbCkge1xuICAgICAgICAgICAgICAgIHJldHVybjtcbiAgICAgICAgICAgICAgfVxuXG4gICAgICAgICAgICAgIGNvbnN0IHVzZXJTY3JpcHRzQXRTdGFydCA9IF9uYXRpdmVDb21tdW5pY2F0aW9uPFVzZXJTY3JpcHRbXT4oJ2dldFVzZXJPbmx5U2NyaXB0c0F0Jywgdmlld0lkLCBbVXNlclNjcmlwdEluamVjdGlvblRpbWUuQVRfRE9DVU1FTlRfU1RBUlRdKTtcbiAgICAgICAgICAgICAgY29uc3QgdXNlclNjcmlwdHNBdEVuZCA9IF9uYXRpdmVDb21tdW5pY2F0aW9uPFVzZXJTY3JpcHRbXT4oJ2dldFVzZXJPbmx5U2NyaXB0c0F0Jywgdmlld0lkLCBbVXNlclNjcmlwdEluamVjdGlvblRpbWUuQVRfRE9DVU1FTlRfRU5EXSk7XG5cbiAgICAgICAgICAgICAgdHJ5IHtcbiAgICAgICAgICAgICAgICBsZXQgamF2YVNjcmlwdEJyaWRnZUVuYWJsZWQgPSB3ZWJWaWV3LmphdmFTY3JpcHRCcmlkZ2VFbmFibGVkO1xuICAgICAgICAgICAgICAgIGlmIChqYXZhU2NyaXB0QnJpZGdlT3JpZ2luQWxsb3dMaXN0ICE9IG51bGwpIHtcbiAgICAgICAgICAgICAgICAgIGphdmFTY3JpcHRCcmlkZ2VFbmFibGVkID0gamF2YVNjcmlwdEJyaWRnZU9yaWdpbkFsbG93TGlzdFxuICAgICAgICAgICAgICAgICAgICAgIC5tYXAoYWxsb3dlZE9yaWdpblJ1bGUgPT4gbmV3IFJlZ0V4cChhbGxvd2VkT3JpZ2luUnVsZSkpXG4gICAgICAgICAgICAgICAgICAgICAgLnNvbWUoKHJ4KSA9PiB7XG4gICAgICAgICAgICAgICAgICAgICAgICByZXR1cm4gcngudGVzdChpZnJhbWUuY29udGVudFdpbmRvdyEubG9jYXRpb24ub3JpZ2luKTtcbiAgICAgICAgICAgICAgICAgICAgICB9KVxuICAgICAgICAgICAgICAgIH1cbiAgICAgICAgICAgICAgICBpZiAoamF2YVNjcmlwdEJyaWRnZUVuYWJsZWQpIHtcbiAgICAgICAgICAgICAgICAgIGNvbnN0IGphdmFTY3JpcHRCcmlkZ2VOYW1lID0gX25hdGl2ZUNvbW11bmljYXRpb248c3RyaW5nPignZ2V0SmF2YVNjcmlwdEJyaWRnZU5hbWUnLCB2aWV3SWQpO1xuICAgICAgICAgICAgICAgICAgLy8gQHRzLWlnbm9yZVxuICAgICAgICAgICAgICAgICAgaWZyYW1lLmNvbnRlbnRXaW5kb3chW2phdmFTY3JpcHRCcmlkZ2VOYW1lXSA9IHtcbiAgICAgICAgICAgICAgICAgICAgY2FsbEhhbmRsZXI6IGZ1bmN0aW9uICgpIHtcbiAgICAgICAgICAgICAgICAgICAgICBsZXQgb3JpZ2luID0gJyc7XG4gICAgICAgICAgICAgICAgICAgICAgbGV0IHJlcXVlc3RVcmwgPSAnJztcbiAgICAgICAgICAgICAgICAgICAgICB0cnkge1xuICAgICAgICAgICAgICAgICAgICAgICAgb3JpZ2luID0gaWZyYW1lLmNvbnRlbnRXaW5kb3chLmxvY2F0aW9uLm9yaWdpbjtcbiAgICAgICAgICAgICAgICAgICAgICB9IGNhdGNoIChfKSB7XG4gICAgICAgICAgICAgICAgICAgICAgfVxuICAgICAgICAgICAgICAgICAgICAgIHRyeSB7XG4gICAgICAgICAgICAgICAgICAgICAgICByZXF1ZXN0VXJsID0gaWZyYW1lLmNvbnRlbnRXaW5kb3chLmxvY2F0aW9uLmhyZWY7XG4gICAgICAgICAgICAgICAgICAgICAgfSBjYXRjaCAoXykge1xuICAgICAgICAgICAgICAgICAgICAgIH1cbiAgICAgICAgICAgICAgICAgICAgICByZXR1cm4gX25hdGl2ZUNvbW11bmljYXRpb24oJ29uQ2FsbEpzSGFuZGxlcicsXG4gICAgICAgICAgICAgICAgICAgICAgICAgIHZpZXdJZCxcbiAgICAgICAgICAgICAgICAgICAgICAgICAgW2FyZ3VtZW50c1swXSwgX0pTT05fc3RyaW5naWZ5KHtcbiAgICAgICAgICAgICAgICAgICAgICAgICAgICAnb3JpZ2luJzogb3JpZ2luLFxuICAgICAgICAgICAgICAgICAgICAgICAgICAgICdyZXF1ZXN0VXJsJzogcmVxdWVzdFVybCxcbiAgICAgICAgICAgICAgICAgICAgICAgICAgICAnaXNNYWluRnJhbWUnOiB0cnVlLFxuICAgICAgICAgICAgICAgICAgICAgICAgICAgICdfYnJpZGdlU2VjcmV0JzogYnJpZGdlU2VjcmV0LFxuICAgICAgICAgICAgICAgICAgICAgICAgICAgICdhcmdzJzogX0pTT05fc3RyaW5naWZ5KF9BcnJheV9zbGljZS5jYWxsKGFyZ3VtZW50cywgMSkpXG4gICAgICAgICAgICAgICAgICAgICAgICAgIH0pXSk7XG4gICAgICAgICAgICAgICAgICAgIH1cbiAgICAgICAgICAgICAgICAgIH0gYXMgSmF2YVNjcmlwdEJyaWRnZUhhbmRsZXI7XG4gICAgICAgICAgICAgICAgfVxuICAgICAgICAgICAgICB9IGNhdGNoIChlKSB7XG4gICAgICAgICAgICAgICAgY29uc29sZS5sb2coZSk7XG4gICAgICAgICAgICAgIH1cblxuICAgICAgICAgICAgICBmb3IgKGNvbnN0IHVzZXJTY3JpcHQgb2YgWy4uLnVzZXJTY3JpcHRzQXRTdGFydCwgLi4udXNlclNjcmlwdHNBdEVuZF0pIHtcbiAgICAgICAgICAgICAgICBsZXQgaWZTdGF0ZW1lbnQgPSBcImlmIChcIjtcbiAgICAgICAgICAgICAgICBsZXQgc291cmNlID0gdXNlclNjcmlwdC5zb3VyY2U7XG4gICAgICAgICAgICAgICAgaWYgKHVzZXJTY3JpcHQuYWxsb3dlZE9yaWdpblJ1bGVzICE9IG51bGwgJiYgIXVzZXJTY3JpcHQuYWxsb3dlZE9yaWdpblJ1bGVzLmluY2x1ZGVzKFwiKlwiKSkge1xuICAgICAgICAgICAgICAgICAgaWYgKHVzZXJTY3JpcHQuYWxsb3dlZE9yaWdpblJ1bGVzLmxlbmd0aCA9PT0gMCkge1xuICAgICAgICAgICAgICAgICAgICAvLyByZXR1cm4gZW1wdHkgc291cmNlIHN0cmluZyBpZiBhbGxvd2VkT3JpZ2luUnVsZXMgaXMgYW4gZW1wdHkgbGlzdC5cbiAgICAgICAgICAgICAgICAgICAgLy8gYW4gZW1wdHkgbGlzdCBtZWFucyB0aGF0IHRoaXMgVXNlclNjcmlwdCBpcyBub3QgYWxsb3dlZCBmb3IgYW55IG9yaWdpbi5cbiAgICAgICAgICAgICAgICAgICAgc291cmNlID0gXCJcIjtcbiAgICAgICAgICAgICAgICAgIH1cbiAgICAgICAgICAgICAgICAgIGxldCBqc1JlZ0V4cEFycmF5ID0gXCJbXCI7XG4gICAgICAgICAgICAgICAgICBmb3IgKGNvbnN0IGFsbG93ZWRPcmlnaW5SdWxlIG9mIHVzZXJTY3JpcHQuYWxsb3dlZE9yaWdpblJ1bGVzKSB7XG4gICAgICAgICAgICAgICAgICAgIGlmIChqc1JlZ0V4cEFycmF5Lmxlbmd0aCA+IDEpIHtcbiAgICAgICAgICAgICAgICAgICAgICBqc1JlZ0V4cEFycmF5ICs9IFwiLFwiO1xuICAgICAgICAgICAgICAgICAgICB9XG4gICAgICAgICAgICAgICAgICAgIGpzUmVnRXhwQXJyYXkgKz0gYG5ldyBSZWdFeHAoJyR7YWxsb3dlZE9yaWdpblJ1bGUucmVwbGFjZShcIlxcJ1wiLCBcIlxcXFwnXCIpfScpYDtcbiAgICAgICAgICAgICAgICAgIH1cbiAgICAgICAgICAgICAgICAgIGlmIChqc1JlZ0V4cEFycmF5Lmxlbmd0aCA+IDEpIHtcbiAgICAgICAgICAgICAgICAgICAganNSZWdFeHBBcnJheSArPSBcIl1cIjtcbiAgICAgICAgICAgICAgICAgICAgaWZTdGF0ZW1lbnQgKz0gYCR7anNSZWdFeHBBcnJheX0uc29tZShmdW5jdGlvbihyeCkgeyByZXR1cm4gcngudGVzdCh3aW5kb3cubG9jYXRpb24ub3JpZ2luKTsgfSlgO1xuICAgICAgICAgICAgICAgICAgfVxuICAgICAgICAgICAgICAgIH1cbiAgICAgICAgICAgICAgICB3ZWJWaWV3LmV2YWx1YXRlSmF2YXNjcmlwdChpZlN0YXRlbWVudC5sZW5ndGggPiA0ID8gYCR7aWZTdGF0ZW1lbnR9KSB7ICR7c291cmNlfSB9YCA6IHNvdXJjZSk7XG4gICAgICAgICAgICAgIH1cblxuICAgICAgICAgICAgICBsZXQgdXJsID0gaWZyYW1lLnNyYztcbiAgICAgICAgICAgICAgdHJ5IHtcbiAgICAgICAgICAgICAgICB1cmwgPSBpZnJhbWUuY29udGVudFdpbmRvdy5sb2NhdGlvbi5ocmVmO1xuICAgICAgICAgICAgICB9IGNhdGNoIChlKSB7XG4gICAgICAgICAgICAgICAgY29uc29sZS5sb2coZSk7XG4gICAgICAgICAgICAgIH1cbiAgICAgICAgICAgICAgX25hdGl2ZUNvbW11bmljYXRpb24oJ29uTG9hZFN0YXJ0Jywgdmlld0lkLCBbdXJsXSk7XG5cbiAgICAgICAgICAgICAgdHJ5IHtcbiAgICAgICAgICAgICAgICBjb25zdCBvbGRMb2dzID0ge1xuICAgICAgICAgICAgICAgICAgJ2xvZyc6IGlmcmFtZS5jb250ZW50V2luZG93LmNvbnNvbGUubG9nLFxuICAgICAgICAgICAgICAgICAgJ2RlYnVnJzogaWZyYW1lLmNvbnRlbnRXaW5kb3cuY29uc29sZS5kZWJ1ZyxcbiAgICAgICAgICAgICAgICAgICdlcnJvcic6IGlmcmFtZS5jb250ZW50V2luZG93LmNvbnNvbGUuZXJyb3IsXG4gICAgICAgICAgICAgICAgICAnaW5mbyc6IGlmcmFtZS5jb250ZW50V2luZG93LmNvbnNvbGUuaW5mbyxcbiAgICAgICAgICAgICAgICAgICd3YXJuJzogaWZyYW1lLmNvbnRlbnRXaW5kb3cuY29uc29sZS53YXJuXG4gICAgICAgICAgICAgICAgfTtcbiAgICAgICAgICAgICAgICBmb3IgKGNvbnN0IGsgaW4gb2xkTG9ncykge1xuICAgICAgICAgICAgICAgICAgKGZ1bmN0aW9uIChvbGRMb2cpIHtcbiAgICAgICAgICAgICAgICAgICAgLy8gQHRzLWlnbm9yZVxuICAgICAgICAgICAgICAgICAgICBpZnJhbWUuY29udGVudFdpbmRvdy5jb25zb2xlW29sZExvZ10gPSBmdW5jdGlvbiAoKSB7XG4gICAgICAgICAgICAgICAgICAgICAgdmFyIG1lc3NhZ2UgPSAnJztcbiAgICAgICAgICAgICAgICAgICAgICBmb3IgKHZhciBpIGluIGFyZ3VtZW50cykge1xuICAgICAgICAgICAgICAgICAgICAgICAgaWYgKG1lc3NhZ2UgPT0gJycpIHtcbiAgICAgICAgICAgICAgICAgICAgICAgICAgbWVzc2FnZSArPSBhcmd1bWVudHNbaV07XG4gICAgICAgICAgICAgICAgICAgICAgICB9IGVsc2Uge1xuICAgICAgICAgICAgICAgICAgICAgICAgICBtZXNzYWdlICs9ICcgJyArIGFyZ3VtZW50c1tpXTtcbiAgICAgICAgICAgICAgICAgICAgICAgIH1cbiAgICAgICAgICAgICAgICAgICAgICB9XG4gICAgICAgICAgICAgICAgICAgICAgLy8gQHRzLWlnbm9yZVxuICAgICAgICAgICAgICAgICAgICAgIG9sZExvZ3Nbb2xkTG9nXS5jYWxsKGlmcmFtZS5jb250ZW50V2luZG93LmNvbnNvbGUsIC4uLmFyZ3VtZW50cyk7XG4gICAgICAgICAgICAgICAgICAgICAgX25hdGl2ZUNvbW11bmljYXRpb24oJ29uQ29uc29sZU1lc3NhZ2UnLCB2aWV3SWQsIFtvbGRMb2csIG1lc3NhZ2VdKTtcbiAgICAgICAgICAgICAgICAgICAgfVxuICAgICAgICAgICAgICAgICAgfSkoayk7XG4gICAgICAgICAgICAgICAgfVxuICAgICAgICAgICAgICB9IGNhdGNoIChlKSB7XG4gICAgICAgICAgICAgICAgY29uc29sZS5sb2coZSk7XG4gICAgICAgICAgICAgIH1cblxuICAgICAgICAgICAgICB0cnkge1xuICAgICAgICAgICAgICAgIGNvbnN0IG9yaWdpbmFsUHVzaFN0YXRlID0gaWZyYW1lLmNvbnRlbnRXaW5kb3cuaGlzdG9yeS5wdXNoU3RhdGU7XG4gICAgICAgICAgICAgICAgaWZyYW1lLmNvbnRlbnRXaW5kb3cuaGlzdG9yeS5wdXNoU3RhdGUgPSBmdW5jdGlvbiAoc3RhdGUsIHVudXNlZCwgdXJsKSB7XG4gICAgICAgICAgICAgICAgICBvcmlnaW5hbFB1c2hTdGF0ZS5jYWxsKGlmcmFtZS5jb250ZW50V2luZG93IS5oaXN0b3J5LCBzdGF0ZSwgdW51c2VkLCB1cmwpO1xuICAgICAgICAgICAgICAgICAgbGV0IGlmcmFtZVVybCA9IGlmcmFtZS5zcmM7XG4gICAgICAgICAgICAgICAgICB0cnkge1xuICAgICAgICAgICAgICAgICAgICBpZnJhbWVVcmwgPSBpZnJhbWUuY29udGVudFdpbmRvdyEubG9jYXRpb24uaHJlZjtcbiAgICAgICAgICAgICAgICAgIH0gY2F0Y2ggKGUpIHtcbiAgICAgICAgICAgICAgICAgICAgY29uc29sZS5sb2coZSk7XG4gICAgICAgICAgICAgICAgICB9XG4gICAgICAgICAgICAgICAgICBfbmF0aXZlQ29tbXVuaWNhdGlvbignb25VcGRhdGVWaXNpdGVkSGlzdG9yeScsIHZpZXdJZCwgW2lmcmFtZVVybF0pO1xuICAgICAgICAgICAgICAgIH07XG5cbiAgICAgICAgICAgICAgICBjb25zdCBvcmlnaW5hbFJlcGxhY2VTdGF0ZSA9IGlmcmFtZS5jb250ZW50V2luZG93Lmhpc3RvcnkucmVwbGFjZVN0YXRlO1xuICAgICAgICAgICAgICAgIGlmcmFtZS5jb250ZW50V2luZG93Lmhpc3RvcnkucmVwbGFjZVN0YXRlID0gZnVuY3Rpb24gKHN0YXRlLCB1bnVzZWQsIHVybCkge1xuICAgICAgICAgICAgICAgICAgb3JpZ2luYWxSZXBsYWNlU3RhdGUuY2FsbChpZnJhbWUuY29udGVudFdpbmRvdyEuaGlzdG9yeSwgc3RhdGUsIHVudXNlZCwgdXJsKTtcbiAgICAgICAgICAgICAgICAgIGxldCBpZnJhbWVVcmwgPSBpZnJhbWUuc3JjO1xuICAgICAgICAgICAgICAgICAgdHJ5IHtcbiAgICAgICAgICAgICAgICAgICAgaWZyYW1lVXJsID0gaWZyYW1lLmNvbnRlbnRXaW5kb3chLmxvY2F0aW9uLmhyZWY7XG4gICAgICAgICAgICAgICAgICB9IGNhdGNoIChlKSB7XG4gICAgICAgICAgICAgICAgICAgIGNvbnNvbGUubG9nKGUpO1xuICAgICAgICAgICAgICAgICAgfVxuICAgICAgICAgICAgICAgICAgX25hdGl2ZUNvbW11bmljYXRpb24oJ29uVXBkYXRlVmlzaXRlZEhpc3RvcnknLCB2aWV3SWQsIFtpZnJhbWVVcmxdKTtcbiAgICAgICAgICAgICAgICB9O1xuXG4gICAgICAgICAgICAgICAgY29uc3Qgb3JpZ2luYWxDbG9zZSA9IGlmcmFtZS5jb250ZW50V2luZG93LmNsb3NlO1xuICAgICAgICAgICAgICAgIGlmcmFtZS5jb250ZW50V2luZG93LmNsb3NlID0gZnVuY3Rpb24gKCkge1xuICAgICAgICAgICAgICAgICAgb3JpZ2luYWxDbG9zZS5jYWxsKGlmcmFtZS5jb250ZW50V2luZG93KTtcbiAgICAgICAgICAgICAgICAgIF9uYXRpdmVDb21tdW5pY2F0aW9uKCdvbkNsb3NlV2luZG93Jywgdmlld0lkKTtcbiAgICAgICAgICAgICAgICB9O1xuXG4gICAgICAgICAgICAgICAgY29uc3Qgb3JpZ2luYWxPcGVuID0gaWZyYW1lLmNvbnRlbnRXaW5kb3cub3BlbjtcbiAgICAgICAgICAgICAgICBpZnJhbWUuY29udGVudFdpbmRvdy5vcGVuID0gZnVuY3Rpb24gKHVybCwgdGFyZ2V0LCB3aW5kb3dGZWF0dXJlcykge1xuICAgICAgICAgICAgICAgICAgY29uc3QgbmV3V2luZG93ID0gb3JpZ2luYWxPcGVuLmNhbGwoaWZyYW1lLmNvbnRlbnRXaW5kb3csIC4uLmFyZ3VtZW50cyk7XG4gICAgICAgICAgICAgICAgICBfbmF0aXZlQ29tbXVuaWNhdGlvbjxQcm9taXNlPGJvb2xlYW4+Pignb25DcmVhdGVXaW5kb3cnLCB2aWV3SWQsIFt1cmwsIHRhcmdldCwgd2luZG93RmVhdHVyZXNdKS50aGVuKGZ1bmN0aW9uIChoYW5kbGVkQnlDbGllbnQpIHtcbiAgICAgICAgICAgICAgICAgICAgaWYgKGhhbmRsZWRCeUNsaWVudCkge1xuICAgICAgICAgICAgICAgICAgICAgIG5ld1dpbmRvdz8uY2xvc2UoKTtcbiAgICAgICAgICAgICAgICAgICAgfVxuICAgICAgICAgICAgICAgICAgfSk7XG4gICAgICAgICAgICAgICAgICByZXR1cm4gbmV3V2luZG93O1xuICAgICAgICAgICAgICAgIH07XG5cbiAgICAgICAgICAgICAgICBjb25zdCBvcmlnaW5hbFByaW50ID0gaWZyYW1lLmNvbnRlbnRXaW5kb3cucHJpbnQ7XG4gICAgICAgICAgICAgICAgaWZyYW1lLmNvbnRlbnRXaW5kb3cucHJpbnQgPSBmdW5jdGlvbiAoKSB7XG4gICAgICAgICAgICAgICAgICBsZXQgaWZyYW1lVXJsID0gaWZyYW1lLnNyYztcbiAgICAgICAgICAgICAgICAgIHRyeSB7XG4gICAgICAgICAgICAgICAgICAgIGlmcmFtZVVybCA9IGlmcmFtZS5jb250ZW50V2luZG93IS5sb2NhdGlvbi5ocmVmO1xuICAgICAgICAgICAgICAgICAgfSBjYXRjaCAoZSkge1xuICAgICAgICAgICAgICAgICAgICBjb25zb2xlLmxvZyhlKTtcbiAgICAgICAgICAgICAgICAgIH1cbiAgICAgICAgICAgICAgICAgIF9uYXRpdmVDb21tdW5pY2F0aW9uKCdvblByaW50UmVxdWVzdCcsIHZpZXdJZCwgW2lmcmFtZVVybF0pO1xuICAgICAgICAgICAgICAgICAgb3JpZ2luYWxQcmludC5jYWxsKGlmcmFtZS5jb250ZW50V2luZG93KTtcbiAgICAgICAgICAgICAgICB9O1xuXG4gICAgICAgICAgICAgICAgd2ViVmlldy5mdW5jdGlvbk1hcCA9IHtcbiAgICAgICAgICAgICAgICAgIFwid2luZG93Lm9wZW5cIjogaWZyYW1lLmNvbnRlbnRXaW5kb3cub3BlbixcbiAgICAgICAgICAgICAgICB9XG5cbiAgICAgICAgICAgICAgICBjb25zdCBpbml0aWFsVGl0bGUgPSBpZnJhbWUuY29udGVudERvY3VtZW50Py50aXRsZTtcbiAgICAgICAgICAgICAgICBjb25zdCB0aXRsZUVsID0gaWZyYW1lLmNvbnRlbnREb2N1bWVudD8ucXVlcnlTZWxlY3RvcigndGl0bGUnKTtcbiAgICAgICAgICAgICAgICB3ZWJWaWV3LmRvY3VtZW50VGl0bGUgPSBpbml0aWFsVGl0bGU7XG4gICAgICAgICAgICAgICAgX25hdGl2ZUNvbW11bmljYXRpb24oJ29uVGl0bGVDaGFuZ2VkJywgdmlld0lkLCBbaW5pdGlhbFRpdGxlXSk7XG4gICAgICAgICAgICAgICAgaWYgKHRpdGxlRWwgIT0gbnVsbCkge1xuICAgICAgICAgICAgICAgICAgbmV3IE11dGF0aW9uT2JzZXJ2ZXIoZnVuY3Rpb24gKG11dGF0aW9ucykge1xuICAgICAgICAgICAgICAgICAgICBjb25zdCB0aXRsZSA9IChtdXRhdGlvbnNbMF0udGFyZ2V0IGFzIEhUTUxFbGVtZW50KS5pbm5lclRleHQ7XG4gICAgICAgICAgICAgICAgICAgIGlmICh0aXRsZSAhPSB3ZWJWaWV3LmRvY3VtZW50VGl0bGUpIHtcbiAgICAgICAgICAgICAgICAgICAgICB3ZWJWaWV3LmRvY3VtZW50VGl0bGUgPSB0aXRsZTtcbiAgICAgICAgICAgICAgICAgICAgICBfbmF0aXZlQ29tbXVuaWNhdGlvbignb25UaXRsZUNoYW5nZWQnLCB2aWV3SWQsIFt0aXRsZV0pO1xuICAgICAgICAgICAgICAgICAgICB9XG4gICAgICAgICAgICAgICAgICB9KS5vYnNlcnZlKFxuICAgICAgICAgICAgICAgICAgICAgIHRpdGxlRWwsXG4gICAgICAgICAgICAgICAgICAgICAge3N1YnRyZWU6IHRydWUsIGNoYXJhY3RlckRhdGE6IHRydWUsIGNoaWxkTGlzdDogdHJ1ZX1cbiAgICAgICAgICAgICAgICAgICk7XG4gICAgICAgICAgICAgICAgfVxuXG4gICAgICAgICAgICAgICAgbGV0IG9sZFBpeGVsUmF0aW8gPSBpZnJhbWUuY29udGVudFdpbmRvdy5kZXZpY2VQaXhlbFJhdGlvO1xuICAgICAgICAgICAgICAgIGlmcmFtZS5jb250ZW50V2luZG93LmFkZEV2ZW50TGlzdGVuZXIoJ3Jlc2l6ZScsIGZ1bmN0aW9uIChlKSB7XG4gICAgICAgICAgICAgICAgICBjb25zdCBuZXdQaXhlbFJhdGlvID0gaWZyYW1lLmNvbnRlbnRXaW5kb3chLmRldmljZVBpeGVsUmF0aW87XG4gICAgICAgICAgICAgICAgICBpZiAobmV3UGl4ZWxSYXRpbyAhPT0gb2xkUGl4ZWxSYXRpbykge1xuICAgICAgICAgICAgICAgICAgICBfbmF0aXZlQ29tbXVuaWNhdGlvbignb25ab29tU2NhbGVDaGFuZ2VkJywgdmlld0lkLCBbb2xkUGl4ZWxSYXRpbywgbmV3UGl4ZWxSYXRpb10pO1xuICAgICAgICAgICAgICAgICAgICBvbGRQaXhlbFJhdGlvID0gbmV3UGl4ZWxSYXRpbztcbiAgICAgICAgICAgICAgICAgIH1cbiAgICAgICAgICAgICAgICB9KTtcblxuICAgICAgICAgICAgICAgIGlmcmFtZS5jb250ZW50V2luZG93LmFkZEV2ZW50TGlzdGVuZXIoJ3BvcHN0YXRlJywgZnVuY3Rpb24gKGV2ZW50OiBFdmVudCkge1xuICAgICAgICAgICAgICAgICAgbGV0IGlmcmFtZVVybCA9IGlmcmFtZS5zcmM7XG4gICAgICAgICAgICAgICAgICB0cnkge1xuICAgICAgICAgICAgICAgICAgICBpZnJhbWVVcmwgPSBpZnJhbWUuY29udGVudFdpbmRvdyEubG9jYXRpb24uaHJlZjtcbiAgICAgICAgICAgICAgICAgIH0gY2F0Y2ggKGUpIHtcbiAgICAgICAgICAgICAgICAgICAgY29uc29sZS5sb2coZSk7XG4gICAgICAgICAgICAgICAgICB9XG4gICAgICAgICAgICAgICAgICBfbmF0aXZlQ29tbXVuaWNhdGlvbignb25VcGRhdGVWaXNpdGVkSGlzdG9yeScsIHZpZXdJZCwgW2lmcmFtZVVybF0pO1xuICAgICAgICAgICAgICAgIH0pO1xuXG4gICAgICAgICAgICAgICAgaWZyYW1lLmNvbnRlbnRXaW5kb3cuYWRkRXZlbnRMaXN0ZW5lcignc2Nyb2xsJywgZnVuY3Rpb24gKGV2ZW50OiBFdmVudCkge1xuICAgICAgICAgICAgICAgICAgbGV0IHggPSAwO1xuICAgICAgICAgICAgICAgICAgbGV0IHkgPSAwO1xuICAgICAgICAgICAgICAgICAgdHJ5IHtcbiAgICAgICAgICAgICAgICAgICAgeCA9IGlmcmFtZS5jb250ZW50V2luZG93IS5zY3JvbGxYO1xuICAgICAgICAgICAgICAgICAgICB5ID0gaWZyYW1lLmNvbnRlbnRXaW5kb3chLnNjcm9sbFk7XG4gICAgICAgICAgICAgICAgICB9IGNhdGNoIChlKSB7XG4gICAgICAgICAgICAgICAgICAgIGNvbnNvbGUubG9nKGUpO1xuICAgICAgICAgICAgICAgICAgfVxuICAgICAgICAgICAgICAgICAgX25hdGl2ZUNvbW11bmljYXRpb24oJ29uU2Nyb2xsQ2hhbmdlZCcsIHZpZXdJZCwgW3gsIHldKTtcbiAgICAgICAgICAgICAgICB9KTtcblxuICAgICAgICAgICAgICAgIGlmcmFtZS5jb250ZW50V2luZG93LmFkZEV2ZW50TGlzdGVuZXIoJ2ZvY3VzJywgZnVuY3Rpb24gKGV2ZW50OiBFdmVudCkge1xuICAgICAgICAgICAgICAgICAgX25hdGl2ZUNvbW11bmljYXRpb24oJ29uV2luZG93Rm9jdXMnLCB2aWV3SWQpO1xuICAgICAgICAgICAgICAgIH0pO1xuXG4gICAgICAgICAgICAgICAgaWZyYW1lLmNvbnRlbnRXaW5kb3cuYWRkRXZlbnRMaXN0ZW5lcignYmx1cicsIGZ1bmN0aW9uIChldmVudDogRXZlbnQpIHtcbiAgICAgICAgICAgICAgICAgIF9uYXRpdmVDb21tdW5pY2F0aW9uKCdvbldpbmRvd0JsdXInLCB2aWV3SWQpO1xuICAgICAgICAgICAgICAgIH0pO1xuICAgICAgICAgICAgICB9IGNhdGNoIChlKSB7XG4gICAgICAgICAgICAgICAgY29uc29sZS5sb2coZSk7XG4gICAgICAgICAgICAgIH1cblxuICAgICAgICAgICAgICB0cnkge1xuICAgICAgICAgICAgICAgIGlmICghd2ViVmlldy5zZXR0aW5ncy5qYXZhU2NyaXB0Q2FuT3BlbldpbmRvd3NBdXRvbWF0aWNhbGx5KSB7XG4gICAgICAgICAgICAgICAgICBpZnJhbWUuY29udGVudFdpbmRvdy5vcGVuID0gZnVuY3Rpb24gKCkge1xuICAgICAgICAgICAgICAgICAgICB0aHJvdyBuZXcgRXJyb3IoJ0phdmFTY3JpcHQgY2Fubm90IG9wZW4gd2luZG93cyBhdXRvbWF0aWNhbGx5Jyk7XG4gICAgICAgICAgICAgICAgICB9O1xuICAgICAgICAgICAgICAgIH1cblxuICAgICAgICAgICAgICAgIGlmICghd2ViVmlldy5zZXR0aW5ncy52ZXJ0aWNhbFNjcm9sbEJhckVuYWJsZWQgJiYgIXdlYlZpZXcuc2V0dGluZ3MuaG9yaXpvbnRhbFNjcm9sbEJhckVuYWJsZWQpIHtcbiAgICAgICAgICAgICAgICAgIGNvbnN0IHN0eWxlID0gaWZyYW1lLmNvbnRlbnREb2N1bWVudD8uY3JlYXRlRWxlbWVudCgnc3R5bGUnKTtcbiAgICAgICAgICAgICAgICAgIGlmIChzdHlsZSAhPSBudWxsKSB7XG4gICAgICAgICAgICAgICAgICAgIHN0eWxlLmlkID0gXCJzZXR0aW5ncy52ZXJ0aWNhbFNjcm9sbEJhckVuYWJsZWQtc2V0dGluZ3MuaG9yaXpvbnRhbFNjcm9sbEJhckVuYWJsZWRcIjtcbiAgICAgICAgICAgICAgICAgICAgc3R5bGUuaW5uZXJIVE1MID0gXCJib2R5Ojotd2Via2l0LXNjcm9sbGJhciB7IHdpZHRoOiAwcHg7IGhlaWdodDogMHB4OyB9XCI7XG4gICAgICAgICAgICAgICAgICAgIGlmcmFtZS5jb250ZW50RG9jdW1lbnQ/LmhlYWQuYXBwZW5kKHN0eWxlKTtcbiAgICAgICAgICAgICAgICAgIH1cbiAgICAgICAgICAgICAgICB9XG5cbiAgICAgICAgICAgICAgICBpZiAod2ViVmlldy5zZXR0aW5ncy5kaXNhYmxlVmVydGljYWxTY3JvbGwpIHtcbiAgICAgICAgICAgICAgICAgIGNvbnN0IHN0eWxlID0gaWZyYW1lLmNvbnRlbnREb2N1bWVudD8uY3JlYXRlRWxlbWVudCgnc3R5bGUnKTtcbiAgICAgICAgICAgICAgICAgIGlmIChzdHlsZSAhPSBudWxsKSB7XG4gICAgICAgICAgICAgICAgICAgIHN0eWxlLmlkID0gXCJzZXR0aW5ncy5kaXNhYmxlVmVydGljYWxTY3JvbGxcIjtcbiAgICAgICAgICAgICAgICAgICAgc3R5bGUuaW5uZXJIVE1MID0gXCJib2R5IHsgb3ZlcmZsb3cteTogaGlkZGVuOyB9XCI7XG4gICAgICAgICAgICAgICAgICAgIGlmcmFtZS5jb250ZW50RG9jdW1lbnQ/LmhlYWQuYXBwZW5kKHN0eWxlKTtcbiAgICAgICAgICAgICAgICAgIH1cbiAgICAgICAgICAgICAgICB9XG5cbiAgICAgICAgICAgICAgICBpZiAod2ViVmlldy5zZXR0aW5ncy5kaXNhYmxlSG9yaXpvbnRhbFNjcm9sbCkge1xuICAgICAgICAgICAgICAgICAgY29uc3Qgc3R5bGUgPSBpZnJhbWUuY29udGVudERvY3VtZW50Py5jcmVhdGVFbGVtZW50KCdzdHlsZScpO1xuICAgICAgICAgICAgICAgICAgaWYgKHN0eWxlICE9IG51bGwpIHtcbiAgICAgICAgICAgICAgICAgICAgc3R5bGUuaWQgPSBcInNldHRpbmdzLmRpc2FibGVIb3Jpem9udGFsU2Nyb2xsXCI7XG4gICAgICAgICAgICAgICAgICAgIHN0eWxlLmlubmVySFRNTCA9IFwiYm9keSB7IG92ZXJmbG93LXg6IGhpZGRlbjsgfVwiO1xuICAgICAgICAgICAgICAgICAgICBpZnJhbWUuY29udGVudERvY3VtZW50Py5oZWFkLmFwcGVuZChzdHlsZSk7XG4gICAgICAgICAgICAgICAgICB9XG4gICAgICAgICAgICAgICAgfVxuXG4gICAgICAgICAgICAgICAgaWYgKHdlYlZpZXcuc2V0dGluZ3MuZGlzYWJsZUNvbnRleHRNZW51KSB7XG4gICAgICAgICAgICAgICAgICBpZnJhbWUuY29udGVudFdpbmRvdy5hZGRFdmVudExpc3RlbmVyKCdjb250ZXh0bWVudScsIHdlYlZpZXcuZGlzYWJsZUNvbnRleHRNZW51SGFuZGxlcik7XG4gICAgICAgICAgICAgICAgfVxuICAgICAgICAgICAgICB9IGNhdGNoIChlKSB7XG4gICAgICAgICAgICAgICAgY29uc29sZS5sb2coZSk7XG4gICAgICAgICAgICAgIH1cblxuICAgICAgICAgICAgICBfbmF0aXZlQ29tbXVuaWNhdGlvbignb25Mb2FkU3RvcCcsIHZpZXdJZCwgW3VybF0pO1xuXG4gICAgICAgICAgICAgIHRyeSB7XG4gICAgICAgICAgICAgICAgaWZyYW1lLmNvbnRlbnRXaW5kb3cuZGlzcGF0Y2hFdmVudChuZXcgRXZlbnQoJ2N5Z251c1BsYXRmb3JtUmVhZHknKSk7XG4gICAgICAgICAgICAgIH0gY2F0Y2ggKGUpIHtcbiAgICAgICAgICAgICAgICBjb25zb2xlLmxvZyhlKTtcbiAgICAgICAgICAgICAgfVxuXG4gICAgICAgICAgICB9KTtcbiAgICAgICAgICB9XG4gICAgICAgIH0sXG4gICAgICAgIHNldFNldHRpbmdzOiBmdW5jdGlvbiAobmV3U2V0dGluZ3M6IEN5Z251c1dlYlZpZXdTZXR0aW5ncykge1xuICAgICAgICAgIGNvbnN0IGlmcmFtZSA9IHdlYlZpZXcuaWZyYW1lO1xuICAgICAgICAgIGlmIChpZnJhbWUgPT0gbnVsbCkge1xuICAgICAgICAgICAgcmV0dXJuO1xuICAgICAgICAgIH1cbiAgICAgICAgICB0cnkge1xuICAgICAgICAgICAgaWYgKHdlYlZpZXcuc2V0dGluZ3MuamF2YVNjcmlwdENhbk9wZW5XaW5kb3dzQXV0b21hdGljYWxseSAhPSBuZXdTZXR0aW5ncy5qYXZhU2NyaXB0Q2FuT3BlbldpbmRvd3NBdXRvbWF0aWNhbGx5KSB7XG4gICAgICAgICAgICAgIGlmICghbmV3U2V0dGluZ3MuamF2YVNjcmlwdENhbk9wZW5XaW5kb3dzQXV0b21hdGljYWxseSkge1xuICAgICAgICAgICAgICAgIGlmcmFtZS5jb250ZW50V2luZG93IS5vcGVuID0gZnVuY3Rpb24gKCkge1xuICAgICAgICAgICAgICAgICAgdGhyb3cgbmV3IEVycm9yKCdKYXZhU2NyaXB0IGNhbm5vdCBvcGVuIHdpbmRvd3MgYXV0b21hdGljYWxseScpO1xuICAgICAgICAgICAgICAgIH07XG4gICAgICAgICAgICAgIH0gZWxzZSB7XG4gICAgICAgICAgICAgICAgaWZyYW1lLmNvbnRlbnRXaW5kb3chLm9wZW4gPSB3ZWJWaWV3LmZ1bmN0aW9uTWFwW1wid2luZG93Lm9wZW5cIl07XG4gICAgICAgICAgICAgIH1cbiAgICAgICAgICAgIH1cblxuICAgICAgICAgICAgaWYgKHdlYlZpZXcuc2V0dGluZ3MudmVydGljYWxTY3JvbGxCYXJFbmFibGVkICE9IG5ld1NldHRpbmdzLnZlcnRpY2FsU2Nyb2xsQmFyRW5hYmxlZCAmJlxuICAgICAgICAgICAgICAgIHdlYlZpZXcuc2V0dGluZ3MuaG9yaXpvbnRhbFNjcm9sbEJhckVuYWJsZWQgIT0gbmV3U2V0dGluZ3MuaG9yaXpvbnRhbFNjcm9sbEJhckVuYWJsZWQpIHtcbiAgICAgICAgICAgICAgaWYgKCFuZXdTZXR0aW5ncy52ZXJ0aWNhbFNjcm9sbEJhckVuYWJsZWQgJiYgIW5ld1NldHRpbmdzLmhvcml6b250YWxTY3JvbGxCYXJFbmFibGVkKSB7XG4gICAgICAgICAgICAgICAgY29uc3Qgc3R5bGUgPSBpZnJhbWUuY29udGVudERvY3VtZW50Py5jcmVhdGVFbGVtZW50KCdzdHlsZScpO1xuICAgICAgICAgICAgICAgIGlmIChzdHlsZSAhPSBudWxsKSB7XG4gICAgICAgICAgICAgICAgICBzdHlsZS5pZCA9IFwic2V0dGluZ3MudmVydGljYWxTY3JvbGxCYXJFbmFibGVkLXNldHRpbmdzLmhvcml6b250YWxTY3JvbGxCYXJFbmFibGVkXCI7XG4gICAgICAgICAgICAgICAgICBzdHlsZS5pbm5lckhUTUwgPSBcImJvZHk6Oi13ZWJraXQtc2Nyb2xsYmFyIHsgd2lkdGg6IDBweDsgaGVpZ2h0OiAwcHg7IH1cIjtcbiAgICAgICAgICAgICAgICAgIGlmcmFtZS5jb250ZW50RG9jdW1lbnQ/LmhlYWQuYXBwZW5kKHN0eWxlKTtcbiAgICAgICAgICAgICAgICB9XG4gICAgICAgICAgICAgIH0gZWxzZSB7XG4gICAgICAgICAgICAgICAgY29uc3Qgc3R5bGVFbGVtZW50ID0gaWZyYW1lLmNvbnRlbnREb2N1bWVudD8uZ2V0RWxlbWVudEJ5SWQoXCJzZXR0aW5ncy52ZXJ0aWNhbFNjcm9sbEJhckVuYWJsZWQtc2V0dGluZ3MuaG9yaXpvbnRhbFNjcm9sbEJhckVuYWJsZWRcIik7XG4gICAgICAgICAgICAgICAgaWYgKHN0eWxlRWxlbWVudCkge1xuICAgICAgICAgICAgICAgICAgc3R5bGVFbGVtZW50LnJlbW92ZSgpXG4gICAgICAgICAgICAgICAgfVxuICAgICAgICAgICAgICB9XG4gICAgICAgICAgICB9XG5cbiAgICAgICAgICAgIGlmICh3ZWJWaWV3LnNldHRpbmdzLmRpc2FibGVWZXJ0aWNhbFNjcm9sbCAhPSBuZXdTZXR0aW5ncy5kaXNhYmxlVmVydGljYWxTY3JvbGwpIHtcbiAgICAgICAgICAgICAgaWYgKG5ld1NldHRpbmdzLmRpc2FibGVWZXJ0aWNhbFNjcm9sbCkge1xuICAgICAgICAgICAgICAgIGNvbnN0IHN0eWxlID0gaWZyYW1lLmNvbnRlbnREb2N1bWVudD8uY3JlYXRlRWxlbWVudCgnc3R5bGUnKTtcbiAgICAgICAgICAgICAgICBpZiAoc3R5bGUgIT0gbnVsbCkge1xuICAgICAgICAgICAgICAgICAgc3R5bGUuaWQgPSBcInNldHRpbmdzLmRpc2FibGVWZXJ0aWNhbFNjcm9sbFwiO1xuICAgICAgICAgICAgICAgICAgc3R5bGUuaW5uZXJIVE1MID0gXCJib2R5IHsgb3ZlcmZsb3cteTogaGlkZGVuOyB9XCI7XG4gICAgICAgICAgICAgICAgICBpZnJhbWUuY29udGVudERvY3VtZW50Py5oZWFkLmFwcGVuZChzdHlsZSk7XG4gICAgICAgICAgICAgICAgfVxuICAgICAgICAgICAgICB9IGVsc2Uge1xuICAgICAgICAgICAgICAgIGNvbnN0IHN0eWxlRWxlbWVudCA9IGlmcmFtZS5jb250ZW50RG9jdW1lbnQ/LmdldEVsZW1lbnRCeUlkKFwic2V0dGluZ3MuZGlzYWJsZVZlcnRpY2FsU2Nyb2xsXCIpO1xuICAgICAgICAgICAgICAgIGlmIChzdHlsZUVsZW1lbnQpIHtcbiAgICAgICAgICAgICAgICAgIHN0eWxlRWxlbWVudC5yZW1vdmUoKVxuICAgICAgICAgICAgICAgIH1cbiAgICAgICAgICAgICAgfVxuICAgICAgICAgICAgfVxuXG4gICAgICAgICAgICBpZiAod2ViVmlldy5zZXR0aW5ncy5kaXNhYmxlSG9yaXpvbnRhbFNjcm9sbCAhPSBuZXdTZXR0aW5ncy5kaXNhYmxlSG9yaXpvbnRhbFNjcm9sbCkge1xuICAgICAgICAgICAgICBpZiAobmV3U2V0dGluZ3MuZGlzYWJsZUhvcml6b250YWxTY3JvbGwpIHtcbiAgICAgICAgICAgICAgICBjb25zdCBzdHlsZSA9IGlmcmFtZS5jb250ZW50RG9jdW1lbnQ/LmNyZWF0ZUVsZW1lbnQoJ3N0eWxlJyk7XG4gICAgICAgICAgICAgICAgaWYgKHN0eWxlICE9IG51bGwpIHtcbiAgICAgICAgICAgICAgICAgIHN0eWxlLmlkID0gXCJzZXR0aW5ncy5kaXNhYmxlSG9yaXpvbnRhbFNjcm9sbFwiO1xuICAgICAgICAgICAgICAgICAgc3R5bGUuaW5uZXJIVE1MID0gXCJib2R5IHsgb3ZlcmZsb3cteDogaGlkZGVuOyB9XCI7XG4gICAgICAgICAgICAgICAgICBpZnJhbWUuY29udGVudERvY3VtZW50Py5oZWFkLmFwcGVuZChzdHlsZSk7XG4gICAgICAgICAgICAgICAgfVxuICAgICAgICAgICAgICB9IGVsc2Uge1xuICAgICAgICAgICAgICAgIGNvbnN0IHN0eWxlRWxlbWVudCA9IGlmcmFtZS5jb250ZW50RG9jdW1lbnQ/LmdldEVsZW1lbnRCeUlkKFwic2V0dGluZ3MuZGlzYWJsZUhvcml6b250YWxTY3JvbGxcIik7XG4gICAgICAgICAgICAgICAgaWYgKHN0eWxlRWxlbWVudCkge1xuICAgICAgICAgICAgICAgICAgc3R5bGVFbGVtZW50LnJlbW92ZSgpXG4gICAgICAgICAgICAgICAgfVxuICAgICAgICAgICAgICB9XG4gICAgICAgICAgICB9XG5cbiAgICAgICAgICAgIGlmICh3ZWJWaWV3LnNldHRpbmdzLmRpc2FibGVDb250ZXh0TWVudSAhPSBuZXdTZXR0aW5ncy5kaXNhYmxlQ29udGV4dE1lbnUpIHtcbiAgICAgICAgICAgICAgaWYgKG5ld1NldHRpbmdzLmRpc2FibGVDb250ZXh0TWVudSkge1xuICAgICAgICAgICAgICAgIGlmcmFtZS5jb250ZW50V2luZG93Py5hZGRFdmVudExpc3RlbmVyKCdjb250ZXh0bWVudScsIHdlYlZpZXcuZGlzYWJsZUNvbnRleHRNZW51SGFuZGxlcik7XG4gICAgICAgICAgICAgIH0gZWxzZSB7XG4gICAgICAgICAgICAgICAgaWZyYW1lLmNvbnRlbnRXaW5kb3c/LnJlbW92ZUV2ZW50TGlzdGVuZXIoJ2NvbnRleHRtZW51Jywgd2ViVmlldy5kaXNhYmxlQ29udGV4dE1lbnVIYW5kbGVyKTtcbiAgICAgICAgICAgICAgfVxuICAgICAgICAgICAgfVxuICAgICAgICAgIH0gY2F0Y2ggKGUpIHtcbiAgICAgICAgICAgIGNvbnNvbGUubG9nKGUpO1xuICAgICAgICAgIH1cblxuICAgICAgICAgIHdlYlZpZXcuc2V0dGluZ3MgPSBuZXdTZXR0aW5ncztcbiAgICAgICAgfSxcbiAgICAgICAgcmVsb2FkOiBmdW5jdGlvbiAoKSB7XG4gICAgICAgICAgdmFyIGlmcmFtZSA9IHdlYlZpZXcuaWZyYW1lO1xuICAgICAgICAgIGlmIChpZnJhbWUgIT0gbnVsbCAmJiBpZnJhbWUuY29udGVudFdpbmRvdyAhPSBudWxsKSB7XG4gICAgICAgICAgICB0cnkge1xuICAgICAgICAgICAgICBpZnJhbWUuY29udGVudFdpbmRvdy5sb2NhdGlvbi5yZWxvYWQoKTtcbiAgICAgICAgICAgIH0gY2F0Y2ggKGUpIHtcbiAgICAgICAgICAgICAgY29uc29sZS5sb2coZSk7XG4gICAgICAgICAgICAgIGlmcmFtZS5jb250ZW50V2luZG93LmxvY2F0aW9uLmhyZWYgPSBpZnJhbWUuc3JjO1xuICAgICAgICAgICAgfVxuICAgICAgICAgIH1cbiAgICAgICAgfSxcbiAgICAgICAgZ29CYWNrOiBmdW5jdGlvbiAoKSB7XG4gICAgICAgICAgdmFyIGlmcmFtZSA9IHdlYlZpZXcuaWZyYW1lO1xuICAgICAgICAgIGlmIChpZnJhbWUgIT0gbnVsbCkge1xuICAgICAgICAgICAgdHJ5IHtcbiAgICAgICAgICAgICAgaWZyYW1lLmNvbnRlbnRXaW5kb3c/Lmhpc3RvcnkuYmFjaygpO1xuICAgICAgICAgICAgfSBjYXRjaCAoZSkge1xuICAgICAgICAgICAgICBjb25zb2xlLmxvZyhlKTtcbiAgICAgICAgICAgIH1cbiAgICAgICAgICB9XG4gICAgICAgIH0sXG4gICAgICAgIGdvRm9yd2FyZDogZnVuY3Rpb24gKCkge1xuICAgICAgICAgIHZhciBpZnJhbWUgPSB3ZWJWaWV3LmlmcmFtZTtcbiAgICAgICAgICBpZiAoaWZyYW1lICE9IG51bGwpIHtcbiAgICAgICAgICAgIHRyeSB7XG4gICAgICAgICAgICAgIGlmcmFtZS5jb250ZW50V2luZG93Py5oaXN0b3J5LmZvcndhcmQoKTtcbiAgICAgICAgICAgIH0gY2F0Y2ggKGUpIHtcbiAgICAgICAgICAgICAgY29uc29sZS5sb2coZSk7XG4gICAgICAgICAgICB9XG4gICAgICAgICAgfVxuICAgICAgICB9LFxuICAgICAgICBnb0JhY2tPckZvcndhcmQ6IGZ1bmN0aW9uIChzdGVwcykge1xuICAgICAgICAgIHZhciBpZnJhbWUgPSB3ZWJWaWV3LmlmcmFtZTtcbiAgICAgICAgICBpZiAoaWZyYW1lICE9IG51bGwpIHtcbiAgICAgICAgICAgIHRyeSB7XG4gICAgICAgICAgICAgIGlmcmFtZS5jb250ZW50V2luZG93Py5oaXN0b3J5LmdvKHN0ZXBzKTtcbiAgICAgICAgICAgIH0gY2F0Y2ggKGUpIHtcbiAgICAgICAgICAgICAgY29uc29sZS5sb2coZSk7XG4gICAgICAgICAgICB9XG4gICAgICAgICAgfVxuICAgICAgICB9LFxuICAgICAgICBldmFsdWF0ZUphdmFzY3JpcHQ6IGZ1bmN0aW9uIChzb3VyY2UpIHtcbiAgICAgICAgICBjb25zdCBpZnJhbWUgPSB3ZWJWaWV3LmlmcmFtZTtcbiAgICAgICAgICBsZXQgcmVzdWx0ID0gbnVsbDtcbiAgICAgICAgICBpZiAoaWZyYW1lICE9IG51bGwpIHtcbiAgICAgICAgICAgIHRyeSB7XG4gICAgICAgICAgICAgIHJlc3VsdCA9IEpTT04uc3RyaW5naWZ5KGlmcmFtZS5jb250ZW50V2luZG93Py5ldmFsKHNvdXJjZSkpO1xuICAgICAgICAgICAgfSBjYXRjaCAoZSkge1xuICAgICAgICAgICAgfVxuICAgICAgICAgIH1cbiAgICAgICAgICByZXR1cm4gcmVzdWx0O1xuICAgICAgICB9LFxuICAgICAgICBzdG9wTG9hZGluZzogZnVuY3Rpb24gKCkge1xuICAgICAgICAgIGNvbnN0IGlmcmFtZSA9IHdlYlZpZXcuaWZyYW1lO1xuICAgICAgICAgIGlmIChpZnJhbWUgIT0gbnVsbCkge1xuICAgICAgICAgICAgdHJ5IHtcbiAgICAgICAgICAgICAgaWZyYW1lLmNvbnRlbnRXaW5kb3c/LnN0b3AoKTtcbiAgICAgICAgICAgIH0gY2F0Y2ggKGUpIHtcbiAgICAgICAgICAgICAgY29uc29sZS5sb2coZSk7XG4gICAgICAgICAgICB9XG4gICAgICAgICAgfVxuICAgICAgICB9LFxuICAgICAgICBnZXRVcmw6IGZ1bmN0aW9uICgpIHtcbiAgICAgICAgICBjb25zdCBpZnJhbWUgPSB3ZWJWaWV3LmlmcmFtZTtcbiAgICAgICAgICBsZXQgdXJsID0gaWZyYW1lPy5zcmM7XG4gICAgICAgICAgdHJ5IHtcbiAgICAgICAgICAgIHVybCA9IGlmcmFtZT8uY29udGVudFdpbmRvdz8ubG9jYXRpb24uaHJlZjtcbiAgICAgICAgICB9IGNhdGNoIChlKSB7XG4gICAgICAgICAgICBjb25zb2xlLmxvZyhlKTtcbiAgICAgICAgICB9XG4gICAgICAgICAgcmV0dXJuIHVybDtcbiAgICAgICAgfSxcbiAgICAgICAgZ2V0VGl0bGU6IGZ1bmN0aW9uICgpIHtcbiAgICAgICAgICBjb25zdCBpZnJhbWUgPSB3ZWJWaWV3LmlmcmFtZTtcbiAgICAgICAgICBsZXQgdGl0bGUgPSBudWxsO1xuICAgICAgICAgIHRyeSB7XG4gICAgICAgICAgICB0aXRsZSA9IGlmcmFtZT8uY29udGVudERvY3VtZW50Py50aXRsZTtcbiAgICAgICAgICB9IGNhdGNoIChlKSB7XG4gICAgICAgICAgICBjb25zb2xlLmxvZyhlKTtcbiAgICAgICAgICB9XG4gICAgICAgICAgcmV0dXJuIHRpdGxlO1xuICAgICAgICB9LFxuICAgICAgICBpbmplY3RKYXZhc2NyaXB0RmlsZUZyb21Vcmw6IGZ1bmN0aW9uICh1cmxGaWxlLCBzY3JpcHRIdG1sVGFnQXR0cmlidXRlcykge1xuICAgICAgICAgIGNvbnN0IGlmcmFtZSA9IHdlYlZpZXcuaWZyYW1lO1xuICAgICAgICAgIHRyeSB7XG4gICAgICAgICAgICBjb25zdCBkID0gaWZyYW1lPy5jb250ZW50RG9jdW1lbnQ7XG4gICAgICAgICAgICBpZiAoZCA9PSBudWxsKSB7XG4gICAgICAgICAgICAgIHJldHVybjtcbiAgICAgICAgICAgIH1cbiAgICAgICAgICAgIGNvbnN0IHNjcmlwdCA9IGQuY3JlYXRlRWxlbWVudCgnc2NyaXB0Jyk7XG4gICAgICAgICAgICBmb3IgKGNvbnN0IGtleSBvZiBPYmplY3Qua2V5cyhzY3JpcHRIdG1sVGFnQXR0cmlidXRlcykpIHtcbiAgICAgICAgICAgICAgaWYgKHNjcmlwdEh0bWxUYWdBdHRyaWJ1dGVzW2tleV0gIT0gbnVsbCkge1xuICAgICAgICAgICAgICAgIC8vIEB0cy1pZ25vcmVcbiAgICAgICAgICAgICAgICBzY3JpcHRba2V5XSA9IHNjcmlwdEh0bWxUYWdBdHRyaWJ1dGVzW2tleV07XG4gICAgICAgICAgICAgIH1cbiAgICAgICAgICAgIH1cbiAgICAgICAgICAgIGlmIChzY3JpcHQuaWQgIT0gbnVsbCkge1xuICAgICAgICAgICAgICBzY3JpcHQub25sb2FkID0gZnVuY3Rpb24gKCkge1xuICAgICAgICAgICAgICAgIF9uYXRpdmVDb21tdW5pY2F0aW9uKCdvbkluamVjdGVkU2NyaXB0TG9hZGVkJywgd2ViVmlldy52aWV3SWQsIFtzY3JpcHQuaWRdKTtcbiAgICAgICAgICAgICAgfVxuICAgICAgICAgICAgICBzY3JpcHQub25lcnJvciA9IGZ1bmN0aW9uICgpIHtcbiAgICAgICAgICAgICAgICBfbmF0aXZlQ29tbXVuaWNhdGlvbignb25JbmplY3RlZFNjcmlwdEVycm9yJywgd2ViVmlldy52aWV3SWQsIFtzY3JpcHQuaWRdKTtcbiAgICAgICAgICAgICAgfVxuICAgICAgICAgICAgfVxuICAgICAgICAgICAgc2NyaXB0LnNyYyA9IHVybEZpbGU7XG4gICAgICAgICAgICBpZiAoZC5ib2R5ICE9IG51bGwpIHtcbiAgICAgICAgICAgICAgZC5ib2R5LmFwcGVuZENoaWxkKHNjcmlwdCk7XG4gICAgICAgICAgICB9XG4gICAgICAgICAgfSBjYXRjaCAoZSkge1xuICAgICAgICAgICAgY29uc29sZS5sb2coZSk7XG4gICAgICAgICAgfVxuICAgICAgICB9LFxuICAgICAgICBpbmplY3RDU1NDb2RlOiBmdW5jdGlvbiAoc291cmNlKSB7XG4gICAgICAgICAgY29uc3QgaWZyYW1lID0gd2ViVmlldy5pZnJhbWU7XG4gICAgICAgICAgdHJ5IHtcbiAgICAgICAgICAgIGNvbnN0IGQgPSBpZnJhbWU/LmNvbnRlbnREb2N1bWVudDtcbiAgICAgICAgICAgIGlmIChkID09IG51bGwpIHtcbiAgICAgICAgICAgICAgcmV0dXJuO1xuICAgICAgICAgICAgfVxuICAgICAgICAgICAgY29uc3Qgc3R5bGUgPSBkLmNyZWF0ZUVsZW1lbnQoJ3N0eWxlJyk7XG4gICAgICAgICAgICBzdHlsZS5pbm5lckhUTUwgPSBzb3VyY2U7XG4gICAgICAgICAgICBpZiAoZC5oZWFkICE9IG51bGwpIHtcbiAgICAgICAgICAgICAgZC5oZWFkLmFwcGVuZENoaWxkKHN0eWxlKTtcbiAgICAgICAgICAgIH1cbiAgICAgICAgICB9IGNhdGNoIChlKSB7XG4gICAgICAgICAgICBjb25zb2xlLmxvZyhlKTtcbiAgICAgICAgICB9XG4gICAgICAgIH0sXG4gICAgICAgIGluamVjdENTU0ZpbGVGcm9tVXJsOiBmdW5jdGlvbiAodXJsRmlsZSwgY3NzTGlua0h0bWxUYWdBdHRyaWJ1dGVzKSB7XG4gICAgICAgICAgY29uc3QgaWZyYW1lID0gd2ViVmlldy5pZnJhbWU7XG4gICAgICAgICAgdHJ5IHtcbiAgICAgICAgICAgIGNvbnN0IGQgPSBpZnJhbWU/LmNvbnRlbnREb2N1bWVudDtcbiAgICAgICAgICAgIGlmIChkID09IG51bGwpIHtcbiAgICAgICAgICAgICAgcmV0dXJuO1xuICAgICAgICAgICAgfVxuICAgICAgICAgICAgY29uc3QgbGluayA9IGQuY3JlYXRlRWxlbWVudCgnbGluaycpO1xuICAgICAgICAgICAgZm9yIChjb25zdCBrZXkgb2YgT2JqZWN0LmtleXMoY3NzTGlua0h0bWxUYWdBdHRyaWJ1dGVzKSkge1xuICAgICAgICAgICAgICBpZiAoY3NzTGlua0h0bWxUYWdBdHRyaWJ1dGVzW2tleV0gIT0gbnVsbCkge1xuICAgICAgICAgICAgICAgIC8vIEB0cy1pZ25vcmVcbiAgICAgICAgICAgICAgICBsaW5rW2tleV0gPSBjc3NMaW5rSHRtbFRhZ0F0dHJpYnV0ZXNba2V5XTtcbiAgICAgICAgICAgICAgfVxuICAgICAgICAgICAgfVxuICAgICAgICAgICAgbGluay50eXBlID0gJ3RleHQvY3NzJztcbiAgICAgICAgICAgIHZhciBhbHRlcm5hdGVTdHlsZXNoZWV0ID0gXCJcIjtcbiAgICAgICAgICAgIGlmIChjc3NMaW5rSHRtbFRhZ0F0dHJpYnV0ZXMuYWx0ZXJuYXRlU3R5bGVzaGVldCkge1xuICAgICAgICAgICAgICBhbHRlcm5hdGVTdHlsZXNoZWV0ID0gXCJhbHRlcm5hdGUgXCI7XG4gICAgICAgICAgICB9XG4gICAgICAgICAgICBsaW5rLnJlbCA9IGFsdGVybmF0ZVN0eWxlc2hlZXQgKyBcInN0eWxlc2hlZXRcIjtcbiAgICAgICAgICAgIGxpbmsuaHJlZiA9IHVybEZpbGU7XG4gICAgICAgICAgICBpZiAoZC5oZWFkICE9IG51bGwpIHtcbiAgICAgICAgICAgICAgZC5oZWFkLmFwcGVuZENoaWxkKGxpbmspO1xuICAgICAgICAgICAgfVxuICAgICAgICAgIH0gY2F0Y2ggKGUpIHtcbiAgICAgICAgICAgIGNvbnNvbGUubG9nKGUpO1xuICAgICAgICAgIH1cbiAgICAgICAgfSxcbiAgICAgICAgc2Nyb2xsVG86IGZ1bmN0aW9uICh4LCB5LCBhbmltYXRlZCkge1xuICAgICAgICAgIGNvbnN0IGlmcmFtZSA9IHdlYlZpZXcuaWZyYW1lO1xuICAgICAgICAgIHRyeSB7XG4gICAgICAgICAgICBpZiAoYW5pbWF0ZWQpIHtcbiAgICAgICAgICAgICAgaWZyYW1lPy5jb250ZW50V2luZG93Py5zY3JvbGxUbyh7dG9wOiB5LCBsZWZ0OiB4LCBiZWhhdmlvcjogJ3Ntb290aCd9KTtcbiAgICAgICAgICAgIH0gZWxzZSB7XG4gICAgICAgICAgICAgIGlmcmFtZT8uY29udGVudFdpbmRvdz8uc2Nyb2xsVG8oeCwgeSk7XG4gICAgICAgICAgICB9XG4gICAgICAgICAgfSBjYXRjaCAoZSkge1xuICAgICAgICAgICAgY29uc29sZS5sb2coZSk7XG4gICAgICAgICAgfVxuICAgICAgICB9LFxuICAgICAgICBzY3JvbGxCeTogZnVuY3Rpb24gKHgsIHksIGFuaW1hdGVkKSB7XG4gICAgICAgICAgY29uc3QgaWZyYW1lID0gd2ViVmlldy5pZnJhbWU7XG4gICAgICAgICAgdHJ5IHtcbiAgICAgICAgICAgIGlmIChhbmltYXRlZCkge1xuICAgICAgICAgICAgICBpZnJhbWU/LmNvbnRlbnRXaW5kb3c/LnNjcm9sbEJ5KHt0b3A6IHksIGxlZnQ6IHgsIGJlaGF2aW9yOiAnc21vb3RoJ30pO1xuICAgICAgICAgICAgfSBlbHNlIHtcbiAgICAgICAgICAgICAgaWZyYW1lPy5jb250ZW50V2luZG93Py5zY3JvbGxCeSh4LCB5KTtcbiAgICAgICAgICAgIH1cbiAgICAgICAgICB9IGNhdGNoIChlKSB7XG4gICAgICAgICAgICBjb25zb2xlLmxvZyhlKTtcbiAgICAgICAgICB9XG4gICAgICAgIH0sXG4gICAgICAgIHByaW50Q3VycmVudFBhZ2U6IGZ1bmN0aW9uICgpIHtcbiAgICAgICAgICBjb25zdCBpZnJhbWUgPSB3ZWJWaWV3LmlmcmFtZTtcbiAgICAgICAgICB0cnkge1xuICAgICAgICAgICAgaWZyYW1lPy5jb250ZW50V2luZG93Py5wcmludCgpO1xuICAgICAgICAgIH0gY2F0Y2ggKGUpIHtcbiAgICAgICAgICAgIGNvbnNvbGUubG9nKGUpO1xuICAgICAgICAgIH1cbiAgICAgICAgfSxcbiAgICAgICAgZ2V0Q29udGVudEhlaWdodDogZnVuY3Rpb24gKCkge1xuICAgICAgICAgIGNvbnN0IGlmcmFtZSA9IHdlYlZpZXcuaWZyYW1lO1xuICAgICAgICAgIHRyeSB7XG4gICAgICAgICAgICByZXR1cm4gaWZyYW1lPy5jb250ZW50RG9jdW1lbnQ/LmRvY3VtZW50RWxlbWVudC5zY3JvbGxIZWlnaHQ7XG4gICAgICAgICAgfSBjYXRjaCAoZSkge1xuICAgICAgICAgICAgY29uc29sZS5sb2coZSk7XG4gICAgICAgICAgfVxuICAgICAgICAgIHJldHVybiBudWxsO1xuICAgICAgICB9LFxuICAgICAgICBnZXRDb250ZW50V2lkdGg6IGZ1bmN0aW9uICgpIHtcbiAgICAgICAgICBjb25zdCBpZnJhbWUgPSB3ZWJWaWV3LmlmcmFtZTtcbiAgICAgICAgICB0cnkge1xuICAgICAgICAgICAgcmV0dXJuIGlmcmFtZT8uY29udGVudERvY3VtZW50Py5kb2N1bWVudEVsZW1lbnQuc2Nyb2xsV2lkdGg7XG4gICAgICAgICAgfSBjYXRjaCAoZSkge1xuICAgICAgICAgICAgY29uc29sZS5sb2coZSk7XG4gICAgICAgICAgfVxuICAgICAgICAgIHJldHVybiBudWxsO1xuICAgICAgICB9LFxuICAgICAgICBnZXRTZWxlY3RlZFRleHQ6IGZ1bmN0aW9uICgpIHtcbiAgICAgICAgICBjb25zdCBpZnJhbWUgPSB3ZWJWaWV3LmlmcmFtZTtcbiAgICAgICAgICB0cnkge1xuICAgICAgICAgICAgbGV0IHR4dDtcbiAgICAgICAgICAgIGNvbnN0IHcgPSBpZnJhbWU/LmNvbnRlbnRXaW5kb3c7XG4gICAgICAgICAgICBpZiAodyA9PSBudWxsKSB7XG4gICAgICAgICAgICAgIHJldHVybiBudWxsO1xuICAgICAgICAgICAgfVxuICAgICAgICAgICAgaWYgKHcuZ2V0U2VsZWN0aW9uKSB7XG4gICAgICAgICAgICAgIHR4dCA9IHcuZ2V0U2VsZWN0aW9uKCk/LnRvU3RyaW5nKCk7XG4gICAgICAgICAgICB9IGVsc2UgaWYgKHcuZG9jdW1lbnQuZ2V0U2VsZWN0aW9uKSB7XG4gICAgICAgICAgICAgIHR4dCA9IHcuZG9jdW1lbnQuZ2V0U2VsZWN0aW9uKCk/LnRvU3RyaW5nKCk7XG4gICAgICAgICAgICAgIC8vIEB0cy1pZ25vcmVcbiAgICAgICAgICAgIH0gZWxzZSBpZiAody5kb2N1bWVudC5zZWxlY3Rpb24pIHtcbiAgICAgICAgICAgICAgLy8gQHRzLWlnbm9yZVxuICAgICAgICAgICAgICB0eHQgPSB3LmRvY3VtZW50LnNlbGVjdGlvbi5jcmVhdGVSYW5nZSgpLnRleHQ7XG4gICAgICAgICAgICB9XG4gICAgICAgICAgICByZXR1cm4gdHh0O1xuICAgICAgICAgIH0gY2F0Y2ggKGUpIHtcbiAgICAgICAgICAgIGNvbnNvbGUubG9nKGUpO1xuICAgICAgICAgIH1cbiAgICAgICAgICByZXR1cm4gbnVsbDtcbiAgICAgICAgfSxcbiAgICAgICAgZ2V0U2Nyb2xsWDogZnVuY3Rpb24gKCkge1xuICAgICAgICAgIGNvbnN0IGlmcmFtZSA9IHdlYlZpZXcuaWZyYW1lO1xuICAgICAgICAgIHRyeSB7XG4gICAgICAgICAgICByZXR1cm4gaWZyYW1lPy5jb250ZW50V2luZG93Py5zY3JvbGxYO1xuICAgICAgICAgIH0gY2F0Y2ggKGUpIHtcbiAgICAgICAgICAgIGNvbnNvbGUubG9nKGUpO1xuICAgICAgICAgIH1cbiAgICAgICAgICByZXR1cm4gbnVsbDtcbiAgICAgICAgfSxcbiAgICAgICAgZ2V0U2Nyb2xsWTogZnVuY3Rpb24gKCkge1xuICAgICAgICAgIGNvbnN0IGlmcmFtZSA9IHdlYlZpZXcuaWZyYW1lO1xuICAgICAgICAgIHRyeSB7XG4gICAgICAgICAgICByZXR1cm4gaWZyYW1lPy5jb250ZW50V2luZG93Py5zY3JvbGxZO1xuICAgICAgICAgIH0gY2F0Y2ggKGUpIHtcbiAgICAgICAgICAgIGNvbnNvbGUubG9nKGUpO1xuICAgICAgICAgIH1cbiAgICAgICAgICByZXR1cm4gbnVsbDtcbiAgICAgICAgfSxcbiAgICAgICAgaXNTZWN1cmVDb250ZXh0OiBmdW5jdGlvbiAoKSB7XG4gICAgICAgICAgY29uc3QgaWZyYW1lID0gd2ViVmlldy5pZnJhbWU7XG4gICAgICAgICAgdHJ5IHtcbiAgICAgICAgICAgIHJldHVybiBpZnJhbWU/LmNvbnRlbnRXaW5kb3c/LmlzU2VjdXJlQ29udGV4dCA/PyBmYWxzZTtcbiAgICAgICAgICB9IGNhdGNoIChlKSB7XG4gICAgICAgICAgICBjb25zb2xlLmxvZyhlKTtcbiAgICAgICAgICB9XG4gICAgICAgICAgcmV0dXJuIGZhbHNlO1xuICAgICAgICB9LFxuICAgICAgICBjYW5TY3JvbGxWZXJ0aWNhbGx5OiBmdW5jdGlvbiAoKSB7XG4gICAgICAgICAgY29uc3QgaWZyYW1lID0gd2ViVmlldy5pZnJhbWU7XG4gICAgICAgICAgdHJ5IHtcbiAgICAgICAgICAgIHJldHVybiAoaWZyYW1lPy5jb250ZW50RG9jdW1lbnQ/LmJvZHkuc2Nyb2xsSGVpZ2h0ID8/IDApID4gKGlmcmFtZT8uY29udGVudFdpbmRvdz8uaW5uZXJIZWlnaHQgPz8gMCk7XG4gICAgICAgICAgfSBjYXRjaCAoZSkge1xuICAgICAgICAgICAgY29uc29sZS5sb2coZSk7XG4gICAgICAgICAgfVxuICAgICAgICAgIHJldHVybiBmYWxzZTtcbiAgICAgICAgfSxcbiAgICAgICAgY2FuU2Nyb2xsSG9yaXpvbnRhbGx5OiBmdW5jdGlvbiAoKSB7XG4gICAgICAgICAgY29uc3QgaWZyYW1lID0gd2ViVmlldy5pZnJhbWU7XG4gICAgICAgICAgdHJ5IHtcbiAgICAgICAgICAgIHJldHVybiAoaWZyYW1lPy5jb250ZW50RG9jdW1lbnQ/LmJvZHkuc2Nyb2xsV2lkdGggPz8gMCkgPiAoaWZyYW1lPy5jb250ZW50V2luZG93Py5pbm5lcldpZHRoID8/IDApO1xuICAgICAgICAgIH0gY2F0Y2ggKGUpIHtcbiAgICAgICAgICAgIGNvbnNvbGUubG9nKGUpO1xuICAgICAgICAgIH1cbiAgICAgICAgICByZXR1cm4gZmFsc2U7XG4gICAgICAgIH0sXG4gICAgICAgIGdldFNpemU6IGZ1bmN0aW9uICgpIHtcbiAgICAgICAgICBjb25zdCBpZnJhbWVDb250YWluZXIgPSB3ZWJWaWV3LmlmcmFtZUNvbnRhaW5lcjtcbiAgICAgICAgICBsZXQgd2lkdGggPSAwLjA7XG4gICAgICAgICAgbGV0IGhlaWdodCA9IDAuMDtcbiAgICAgICAgICBpZiAoaWZyYW1lQ29udGFpbmVyICE9IG51bGwpIHtcbiAgICAgICAgICAgIGlmIChpZnJhbWVDb250YWluZXIuc3R5bGUud2lkdGggIT0gbnVsbCAmJiBpZnJhbWVDb250YWluZXIuc3R5bGUud2lkdGggIT0gJycgJiYgaWZyYW1lQ29udGFpbmVyLnN0eWxlLndpZHRoLmluZGV4T2YoJ3B4JykgPiAwKSB7XG4gICAgICAgICAgICAgIHdpZHRoID0gcGFyc2VGbG9hdChpZnJhbWVDb250YWluZXIuc3R5bGUud2lkdGgpO1xuICAgICAgICAgICAgfVxuICAgICAgICAgICAgaWYgKHdpZHRoID09IG51bGwgfHwgd2lkdGggPT0gMC4wKSB7XG4gICAgICAgICAgICAgIHdpZHRoID0gaWZyYW1lQ29udGFpbmVyLmdldEJvdW5kaW5nQ2xpZW50UmVjdCgpLndpZHRoO1xuICAgICAgICAgICAgfVxuICAgICAgICAgICAgaWYgKGlmcmFtZUNvbnRhaW5lci5zdHlsZS5oZWlnaHQgIT0gbnVsbCAmJiBpZnJhbWVDb250YWluZXIuc3R5bGUuaGVpZ2h0ICE9ICcnICYmIGlmcmFtZUNvbnRhaW5lci5zdHlsZS5oZWlnaHQuaW5kZXhPZigncHgnKSA+IDApIHtcbiAgICAgICAgICAgICAgaGVpZ2h0ID0gcGFyc2VGbG9hdChpZnJhbWVDb250YWluZXIuc3R5bGUuaGVpZ2h0KTtcbiAgICAgICAgICAgIH1cbiAgICAgICAgICAgIGlmIChoZWlnaHQgPT0gbnVsbCB8fCBoZWlnaHQgPT0gMC4wKSB7XG4gICAgICAgICAgICAgIGhlaWdodCA9IGlmcmFtZUNvbnRhaW5lci5nZXRCb3VuZGluZ0NsaWVudFJlY3QoKS5oZWlnaHQ7XG4gICAgICAgICAgICB9XG4gICAgICAgICAgfVxuICAgICAgICAgIHJldHVybiB7XG4gICAgICAgICAgICB3aWR0aDogd2lkdGgsXG4gICAgICAgICAgICBoZWlnaHQ6IGhlaWdodFxuICAgICAgICAgIH07XG4gICAgICAgIH1cbiAgICAgIH07XG5cbiAgICAgIHJldHVybiB3ZWJWaWV3O1xuICAgIH0sXG4gICAgZ2V0Q29va2llRXhwaXJhdGlvbkRhdGU6IGZ1bmN0aW9uICh0aW1lc3RhbXA6IG51bWJlcikge1xuICAgICAgcmV0dXJuIChuZXcgRGF0ZSh0aW1lc3RhbXApKS50b1VUQ1N0cmluZygpO1xuICAgIH0sXG4gICAgbmF0aXZlQXN5bmNDb21tdW5pY2F0aW9uOiBmdW5jdGlvbiAobWV0aG9kOiBzdHJpbmcsIHZpZXdJZDogbnVtYmVyIHwgc3RyaW5nLCBhcmdzPzogYW55W10pIHtcbiAgICAgIHRocm93IG5ldyBFcnJvcihcIk1ldGhvZCBub3QgaW1wbGVtZW50ZWQuXCIpO1xuICAgIH0sXG4gICAgbmF0aXZlU3luY0NvbW11bmljYXRpb246IGZ1bmN0aW9uIChtZXRob2Q6IHN0cmluZywgdmlld0lkOiBudW1iZXIgfCBzdHJpbmcsIGFyZ3M/OiBhbnlbXSkge1xuICAgICAgdGhyb3cgbmV3IEVycm9yKFwiTWV0aG9kIG5vdCBpbXBsZW1lbnRlZC5cIik7XG4gICAgfSxcbiAgICBuYXRpdmVDb21tdW5pY2F0aW9uOiBmdW5jdGlvbiAobWV0aG9kOiBzdHJpbmcsIHZpZXdJZDogbnVtYmVyIHwgc3RyaW5nLCBhcmdzPzogYW55W10pIHtcbiAgICAgIHRyeSB7XG4gICAgICAgIGNvbnN0IHJlc3VsdCA9IHdpbmRvdy5jeWdudXNXZWIubmF0aXZlU3luY0NvbW11bmljYXRpb24obWV0aG9kLCB2aWV3SWQsIGFyZ3MpO1xuICAgICAgICByZXR1cm4gcmVzdWx0ICE9IG51bGwgPyBKU09OLnBhcnNlKHJlc3VsdCkgOiBudWxsO1xuICAgICAgfSBjYXRjaCAoZTEpIHtcbiAgICAgICAgdHJ5IHtcbiAgICAgICAgICBjb25zdCBwcm9taXNlID0gd2luZG93LmN5Z251c1dlYi5uYXRpdmVBc3luY0NvbW11bmljYXRpb24obWV0aG9kLCB2aWV3SWQsIGFyZ3MpO1xuICAgICAgICAgIHJldHVybiBwcm9taXNlLnRoZW4oZnVuY3Rpb24gKHJlc3VsdCkge1xuICAgICAgICAgICAgcmV0dXJuIHJlc3VsdCAhPSBudWxsID8gSlNPTi5wYXJzZShyZXN1bHQpIDogbnVsbDtcbiAgICAgICAgICB9KTtcbiAgICAgICAgfSBjYXRjaCAoZTIpIHtcbiAgICAgICAgICByZXR1cm4gbnVsbDtcbiAgICAgICAgfVxuICAgICAgfVxuICAgIH0sXG4gIH07XG5cbiAgbGV0IF9uYXRpdmVDb21tdW5pY2F0aW9uID0gd2luZG93LmN5Z251c1dlYi5uYXRpdmVDb21tdW5pY2F0aW9u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QSxJQUNBLDBCQUEwQixTQUFVLFFBQWdCLFFBQXlCLE1BQWM7QUFDekYsWUFBTSxJQUFJLE1BQU0seUJBQXlCO0FBQUEsSUFDM0M7QUFBQSxJQUNBLHlCQUF5QixTQUFVLFFBQWdCLFFBQXlCLE1BQWM7QUFDeEYsWUFBTSxJQUFJLE1BQU0seUJBQXlCO0FBQUEsSUFDM0M7QUFBQSxJQUNBLHFCQUFxQixTQUFVLFFBQWdCLFFBQXlCLE1BQWM7QUFDcEYsVUFBSTtBQUNGLGNBQU0sU0FBUyxPQUFPLFVBQVUsd0JBQXdCLFFBQVEsUUFBUSxJQUFJO0FBQzVFLGVBQU8sVUFBVSxPQUFPLEtBQUssTUFBTSxNQUFNLElBQUk7QUFBQSxNQUMvQyxTQUFTLElBQUk7QUFDWCxZQUFJO0FBQ0YsZ0JBQU0sVUFBVSxPQUFPLFVBQVUseUJBQXlCLFFBQVEsUUFBUSxJQUFJO0FBQzlFLGlCQUFPLFFBQVEsS0FBSyxTQUFVLFFBQVE7QUFDcEMsbUJBQU8sVUFBVSxPQUFPLEtBQUssTUFBTSxNQUFNLElBQUk7QUFBQSxVQUMvQyxDQUFDO0FBQUEsUUFDSCxTQUFTLElBQUk7QUFDWCxpQkFBTztBQUFBLFFBQ1Q7QUFBQSxNQUNGO0FBQUEsSUFDRjtBQUFBLEVBQ0Y7QUFFQSxNQUFJLHVCQUF1QixPQUFPLFVBQVU7QUFDOUMsR0FBRzsiLAogICJuYW1lcyI6IFsidXJsIiwgImV2ZW50IiwgImlmcmFtZSIsICJpZnJhbWVDb250YWluZXIiXQp9Cg==
