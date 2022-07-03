//
//  BaseViewController.swift
//  AR-Quest
//
//  Created by Madushan Senavirathna on 6/12/22.
//

import UIKit

class BaseViewController: UIViewController {
    
    //Life cycle methods
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func setupUI() {
      //will be overide in subclass
    }
    
    func applyContraint() {
      //will be overide in subclass
    }
    
    func displayAlertWithMessage(message: String, completion: (() -> Void )? = nil) {
        DispatchQueue.main.async {
            let alert = UIAlertController(title: "", message: message, preferredStyle: .alert)
            alert.addAction(UIAlertAction.init(title: "OK", style: .default, handler: { _ in
                completion?()
            }))
            self.present(alert, animated: true)
        }
    }
}

