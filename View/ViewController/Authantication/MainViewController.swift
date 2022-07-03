//
//  MainViewController.swift
//  AR-Quest
//
//  Created by Madushan Senavirathna on 6/12/22.
//

import UIKit

class MainViewController: BaseViewController {

    @IBOutlet weak var welcomeLabel: UILabel!
    @IBOutlet weak var welcomeDiscription: UILabel!
    @IBOutlet weak var signInButton: UIButton!
    @IBOutlet weak var signUpButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()

        // Do any additional setup after loading the view.
    }
    
    override func setupUI() {
        welcomeLabel?.text = "Authentication.HomeScreen.welcomeLabel.Label".localized
        welcomeLabel.font = UIFont(name: "TTInterfaces", size: 30)
        welcomeDiscription?.text = "Authentication.HomeScreen.welcomeDiscription.Label".localized
        signInButton.setTitle("Authentication.HomeScreen.SignIn.Button".localized, for: .normal)
        signUpButton.setTitle("Authentication.HomeScreen.createAccount.Button".localized, for: .normal)
    }
    

    @IBAction func signUpBtnTap(_ sender: Any) {
        let signUpViewController = UIStoryboard.mainStoryboard().instantiateViewController(identifier: "SignUpViewController")
        self.navigationController?.pushViewController(signUpViewController, animated: true)
    }
    
    @IBAction func signInBtnTap(_ sender: Any) {
        let loginViewController = UIStoryboard.mainStoryboard().instantiateViewController(identifier: "LoginViewController")
        self.navigationController?.pushViewController(loginViewController, animated: true)
    }
    
}

