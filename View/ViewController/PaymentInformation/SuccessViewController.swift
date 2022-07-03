//
//  SuccessViewController.swift
//  AR-Quest
//
//  Created by Madushan Senavirathna on 7/2/22.
//

import UIKit

class SuccessViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func thanksBtn(_ sender: Any) {
        let ViewController = UIStoryboard.mainStoryboard().instantiateViewController(identifier: "ViewController")
        self.navigationController?.pushViewController(ViewController, animated: true)
    }
    
}
