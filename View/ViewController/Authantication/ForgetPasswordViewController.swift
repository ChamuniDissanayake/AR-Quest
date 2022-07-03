//
//  ForgetPasswordViewController.swift
//  AR-Quest
//
//  Created by Madushan Senavirathna on 6/12/22.
//

import Foundation
import UIKit
import Firebase

class ForgetPasswordViewController: BaseViewController {
    
    let objAJProgressView = AJProgressView()

    @IBOutlet weak var forgetPasswordLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var resetPasswordButton: UIButton!
    @IBOutlet weak var alredyHaveAnAccountLabel: UILabel!
    @IBOutlet weak var emailTextFeild: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    override func setupUI() {
        forgetPasswordLabel?.text = "Authentication.ForgetPasswordScreen.forgetPasswordLabel.label".localized
        emailLabel?.text = "Authentication.ForgetPasswordScreen.emailLabel.label".localized
        resetPasswordButton.setTitle("Authentication.ForgetPasswordScreen.resetPasswordButton.Button".localized, for: .normal)
        alredyHaveAnAccountLabel?.text = "Authentication.ForgetPasswordScreen.alredyHaveAnAccountLabel.Label".localized
    }
    
    @IBAction func passwordResetButton(_ sender: Any) {
        objAJProgressView.show()
        Auth.auth().sendPasswordReset(withEmail: emailTextFeild.text!) { error in
            self.objAJProgressView.hide()
                   DispatchQueue.main.async {
                       if self.emailTextFeild.text?.isEmpty==true || error != nil {
                           let resetFailedAlert = UIAlertController(title: "Reset Failed", message: "Error: \(String(describing: error?.localizedDescription))", preferredStyle: .alert)
                           resetFailedAlert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                           self.present(resetFailedAlert, animated: true, completion: nil)
                           let loginViewController = UIStoryboard.mainStoryboard().instantiateViewController(identifier: "LoginViewController")
                           self.navigationController?.pushViewController(loginViewController, animated: true)
                       }
                       if error == nil && self.emailTextFeild.text?.isEmpty==false{
                           let resetEmailAlertSent = UIAlertController(title: "Reset Email Sent", message: "Reset email has been sent to your login email, please follow the instructions in the mail to reset your password", preferredStyle: .alert)
                           resetEmailAlertSent.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                           self.present(resetEmailAlertSent, animated: true, completion: nil)
                       }
                   }
               }
    }
    
    @IBAction func forgetBackBtn(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    @IBAction func signInButton(_ sender: Any) {
        let loginViewController = UIStoryboard.mainStoryboard().instantiateViewController(identifier: "LoginViewController")
        self.navigationController?.pushViewController(loginViewController, animated: true)
    }
}
