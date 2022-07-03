//
//  PaymentViewController.swift
//  AR-Quest
//
//  Created by Madushan Senavirathna on 7/2/22.
//

import UIKit

class PaymentViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    @IBAction func BackToCartBtn(_ sender: Any) {
        let cartViewController = UIStoryboard.mainStoryboard().instantiateViewController(identifier: "CartViewController")
        self.navigationController?.pushViewController(cartViewController, animated: true)
    }
    
    @IBAction func cartBtn(_ sender: Any) {
        let cartViewController = UIStoryboard.mainStoryboard().instantiateViewController(identifier: "CartViewController")
        self.navigationController?.pushViewController(cartViewController, animated: true)
    }
    @IBAction func payNowBtn(_ sender: Any) {
        let successViewController = UIStoryboard.mainStoryboard().instantiateViewController(identifier: "SuccessViewController")
        self.navigationController?.pushViewController(successViewController, animated: true)
    }
    @IBAction func payPalBtn(_ sender: Any) {
        let successViewController = UIStoryboard.mainStoryboard().instantiateViewController(identifier: "SuccessViewController")
        self.navigationController?.pushViewController(successViewController, animated: true)
    }
}
