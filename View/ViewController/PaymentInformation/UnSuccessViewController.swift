//
//  UnSuccessViewController.swift
//  AR-Quest
//
//  Created by Madushan Senavirathna on 7/2/22.
//

import UIKit

class UnSuccessViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()


    }
    
    @IBAction func changePayment(_ sender: Any) {
        let paymentViewController = UIStoryboard.mainStoryboard().instantiateViewController(identifier: "PaymentViewController")
        self.navigationController?.pushViewController(paymentViewController, animated: true)
    }
    @IBAction func cancelPayment(_ sender: Any) {
        let paymentViewController = UIStoryboard.mainStoryboard().instantiateViewController(identifier: "PaymentViewController")
        self.navigationController?.pushViewController(paymentViewController, animated: true)
    }
    
}
