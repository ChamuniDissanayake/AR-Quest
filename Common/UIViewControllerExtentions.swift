//
//  UIViewControllerExtentions.swift
//  AR-Quest
//
//  Created by Madushan Senavirathna on 6/12/22.
//

import Foundation
import UIKit

extension UIViewController{
    
    func showAlert(title:String, message:String, okBtnName:String, cancelBtnName:String, completion: @escaping (_ scuccess:Bool)->()) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: okBtnName, style: .default, handler: { (action) in
            completion(true)
        }))
        alert.addAction(UIAlertAction(title: cancelBtnName, style: .default, handler: { (action) in
            completion(false)
        }))
        self.present(alert, animated: true, completion: nil)
    }
    
    func showAlert(title:String, message:String, okBtnName:String, completion: @escaping (_ scuccess:Bool)->()) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: okBtnName, style: .default, handler: { (action) in
            completion(true)
        }))
        self.present(alert, animated: true, completion: nil)
    }
}
