//
//  UIStoryboard.swift
//  AR-Quest
//
//  Created by Madushan Senavirathna on 6/12/22.
//

import UIKit
extension UIStoryboard{
    
    static func mainStoryboard() -> (UIStoryboard) {
        return UIStoryboard.init(name: "Main", bundle: Bundle.main)
    }
    
    static func homeStoryboard() -> (UIStoryboard) {
        return UIStoryboard.init(name: "Home", bundle: Bundle.main)
    }
    
    static func requestPayment() -> (UIStoryboard) {
        return UIStoryboard.init(name: "RequestPayment", bundle: Bundle.main)
    }
}

