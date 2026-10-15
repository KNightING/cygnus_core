//
//  CygnusBrowserNavigationController.swift
//  cygnus_core
//
//  Created by Lorenzo Pichilli on 14/02/21.
//

import Foundation
import UIKit

public class CygnusBrowserNavigationController: UINavigationController {
    deinit {
        debugPrint("CygnusBrowserNavigationController - dealloc")
        UIApplication.shared.delegate?.window??.makeKeyAndVisible()
    }
}
