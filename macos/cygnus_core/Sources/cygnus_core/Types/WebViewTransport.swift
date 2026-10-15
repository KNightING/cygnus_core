//
//  WebViewTransport.swift
//  cygnus_core
//
//  Created by Lorenzo Pichilli on 16/02/21.
//

import Foundation

public class WebViewTransport: NSObject {
    var webView: CygnusWebView
    var request: URLRequest
    
    init(webView: CygnusWebView, request: URLRequest) {
        self.webView = webView
        self.request = request
    }
}
