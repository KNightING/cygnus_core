//
//  CygnusBrowserOptions.swift
//  cygnus_core
//
//  Created by Lorenzo on 17/09/18.
//

import Foundation

@objcMembers
public class CygnusBrowserSettings: ISettings<CygnusBrowserWebViewController> {
    
    var hidden = false
    var hideToolbarTop = true
    var toolbarTopBackgroundColor: String?
    var hideUrlBar = false
    var hideProgressBar = false
    
    var toolbarTopTranslucent = true
    var toolbarTopBarTintColor: String?
    var toolbarTopTintColor: String?
    var hideToolbarBottom = true
    var toolbarBottomBackgroundColor: String?
    var toolbarBottomTintColor: String?
    var toolbarBottomTranslucent = true
    var closeButtonCaption: String?
    var closeButtonColor: String?
    var presentationStyle = 0 //fullscreen
    var transitionStyle = 0 //crossDissolve
    var hideCloseButton = false
    var menuButtonColor: String?
    
    override init(){
        super.init()
    }
    
    override func getRealSettings(obj: CygnusBrowserWebViewController?) -> [String: Any?] {
        var realOptions: [String: Any?] = toMap()
        if let cygnusBrowserWebViewController = obj {
            realOptions["hidden"] = cygnusBrowserWebViewController.isHidden
            realOptions["hideUrlBar"] = cygnusBrowserWebViewController.searchBar.isHidden
            realOptions["hideProgressBar"] = cygnusBrowserWebViewController.progressBar.isHidden
            realOptions["closeButtonCaption"] = cygnusBrowserWebViewController.closeButton.title
            realOptions["closeButtonColor"] = cygnusBrowserWebViewController.closeButton.tintColor?.hexString
            realOptions["menuButtonColor"] = cygnusBrowserWebViewController.menuButton?.tintColor?.hexString
            if let navController = cygnusBrowserWebViewController.navigationController {
                realOptions["hideToolbarTop"] = navController.navigationBar.isHidden
                realOptions["toolbarTopBackgroundColor"] = navController.navigationBar.backgroundColor?.hexString
                realOptions["toolbarTopTranslucent"] = navController.navigationBar.isTranslucent
                realOptions["toolbarTopBarTintColor"] = navController.navigationBar.barTintColor?.hexString
                realOptions["toolbarTopTintColor"] = navController.navigationBar.tintColor?.hexString
                realOptions["hideToolbarBottom"] = navController.toolbar.isHidden
                realOptions["toolbarBottomBackgroundColor"] = navController.toolbar.barTintColor?.hexString
                realOptions["toolbarBottomTranslucent"] = navController.toolbar.isTranslucent
                realOptions["toolbarBottomTintColor"] = navController.toolbar.tintColor?.hexString
                realOptions["presentationStyle"] = navController.modalPresentationStyle.rawValue
                realOptions["transitionStyle"] = navController.modalTransitionStyle.rawValue
            }
        }
        return realOptions
    }
}
