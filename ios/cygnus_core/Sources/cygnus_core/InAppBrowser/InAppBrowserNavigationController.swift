//
//  InAppBrowserNavigationController.swift
//  cygnus_core
//
//  Created by Lorenzo Pichilli on 14/02/21.
//

import Foundation
import UIKit

public class InAppBrowserNavigationController: UINavigationController {
    deinit {
        debugPrint("InAppBrowserNavigationController - dealloc")
        UIApplication.shared.delegate?.window??.makeKeyAndVisible()
    }
}
