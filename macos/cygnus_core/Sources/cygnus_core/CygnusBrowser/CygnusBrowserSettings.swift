//
//  CygnusBrowserOptions.swift
//  cygnus_core
//
//  Created by Lorenzo on 17/09/18.
//

import Foundation
import AppKit

@objcMembers
public class CygnusBrowserSettings: ISettings<CygnusBrowserWebViewController> {
    
    var hidden = false
    var hideToolbarTop = true
    var toolbarTopBackgroundColor: String?
    var hideUrlBar = false
    var hideProgressBar = false
    var toolbarTopFixedTitle: String?
    var windowType = CygnusBrowserWindowType.window
    var windowAlphaValue = 1.0
    var _windowStyleMask: NSNumber?
    var windowStyleMask: NSWindow.StyleMask? {
        get {
            return _windowStyleMask != nil ?
                    NSWindow.StyleMask.init(rawValue: _windowStyleMask!.uintValue) :
                    nil
        }
        set {
            if let newValue = newValue {
                _windowStyleMask = NSNumber.init(value: newValue.rawValue)
            } else {
                _windowStyleMask = nil
            }
        }
    }
    var _windowTitlebarSeparatorStyle: NSNumber?
    @available(macOS 11.0, *)
    var windowTitlebarSeparatorStyle: NSTitlebarSeparatorStyle? {
        get {
            return _windowTitlebarSeparatorStyle != nil ?
                    NSTitlebarSeparatorStyle.init(rawValue: _windowTitlebarSeparatorStyle!.intValue) :
                    nil
        }
        set {
            if let newValue = newValue {
                _windowTitlebarSeparatorStyle = NSNumber.init(value: newValue.rawValue)
            } else {
                _windowTitlebarSeparatorStyle = nil
            }
        }
    }
    var windowFrame: NSRect?
    var hideDefaultMenuItems = false
    
    override init(){
        super.init()
    }
    
    override func parse(settings: [String: Any?]) -> CygnusBrowserSettings {
        let _ = super.parse(settings: settings)
        if let windowType = settings["windowType"] as? String {
            self.windowType = CygnusBrowserWindowType.init(rawValue: windowType) ?? CygnusBrowserWindowType.child
        }
        if let windowFrame = settings["windowFrame"] as? [String:Double] {
            self.windowFrame = NSRect(x: windowFrame["x"]!,
                                      y: windowFrame["y"]!,
                                      width: windowFrame["width"]!,
                                      height: windowFrame["height"]!)
        }
        return self
    }
    
    override func getRealSettings(obj: CygnusBrowserWebViewController?) -> [String: Any?] {
        var realOptions: [String: Any?] = toMap()
        realOptions["windowType"] = windowType.rawValue
        if let cygnusBrowserWebViewController = obj {
            realOptions["hidden"] = cygnusBrowserWebViewController.isHidden
            realOptions["hideUrlBar"] = cygnusBrowserWebViewController.window?.searchBar?.isHidden
            realOptions["hideProgressBar"] = cygnusBrowserWebViewController.progressBar.isHidden
            realOptions["hideToolbarTop"] = !(cygnusBrowserWebViewController.window?.toolbar?.isVisible ?? true)
            realOptions["toolbarTopBackgroundColor"] = cygnusBrowserWebViewController.window?.backgroundColor.hexString
            realOptions["windowAlphaValue"] = cygnusBrowserWebViewController.window?.alphaValue
            realOptions["windowStyleMask"] = cygnusBrowserWebViewController.window?.styleMask.rawValue
            if #available(macOS 11.0, *) {
                realOptions["windowTitlebarSeparatorStyle"] = cygnusBrowserWebViewController.window?.titlebarSeparatorStyle.rawValue
            }
            realOptions["windowFrame"] = cygnusBrowserWebViewController.window?.frame.toMap()
        }
        return realOptions
    }
}
