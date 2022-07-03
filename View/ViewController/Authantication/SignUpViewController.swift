//
//  SignUpViewController.swift
//  AR-Quest
//
//  Created by Madushan Senavirathna on 6/12/22.
//

//
//  SignUpViewController.swift
//  AR Quest
//
//  Created by Madushan Senavirathna on 3/30/22.
//

import UIKit
import Firebase

class SignUpViewController: BaseViewController {
    
    let objAJProgressView = AJProgressView()
    
    @IBOutlet weak var signUpLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var passwordLabel: UILabel!
    @IBOutlet weak var signUpButton: UIButton!
    @IBOutlet var alredyHaveAnAccountLabel: UILabel!
    @IBOutlet weak var usenameTextField: UITextField!
    @IBOutlet weak var emailTextFeild: UITextField!
    @IBOutlet weak var passwordTextFeild: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    override func setupUI() {
        signUpLabel?.text = "Authentication.SignUpScreen.signUpLabel.Label".localized
        nameLabel?.text = "Authentication.SignUpScreen.nameLabel.Label".localized
        emailLabel?.text = "Authentication.SignUpScreen.emailLabel.Label".localized
        passwordLabel?.text = "Authentication.SignUpScreen.passwordLabel.Label".localized
        signUpButton.setTitle("Authentication.SignUpScreen.signUpButton.Button".localized, for: .normal)
        alredyHaveAnAccountLabel?.text = "Authentication.SignUpScreen.AlredyHaveAnAccountLabel.Label".localized
    }
    
    private var authUser : User? {
        return Auth.auth().currentUser
    }

    public func sendVerificationMail() {
        if self.authUser != nil && !self.authUser!.isEmailVerified {
            self.authUser!.sendEmailVerification(completion: { (error) in
                // Notify the user that the mail has sent or couldn't because of an error.
                self.showAlert(title: "Error", message: "You are verification sent not success", okBtnName: "Alert.Button.Ok".localized) { (success) in
                }
            })
        }
        else {
            // Either the user is not available, or the user is already verified.
            self.showAlert(title: "Verified", message: "User alredy verified", okBtnName: "Alert.Button.Ok".localized) { (success) in
            }
        }
    }
    
func emailSignup() {
    objAJProgressView.show()
    Auth.auth().createUser(withEmail: emailTextFeild.text!, password: passwordTextFeild.text!) { authResult, error in
    self.objAJProgressView.hide()
        if let authResult = authResult {
           let user = authResult.user
           print("User has Signed In")
            self.sendVerificationMail()
            self.showAlert(title: "Success", message: "Please verify your email address", okBtnName: "Alert.Button.Ok".localized) { (success) in
                let loginViewController = UIStoryboard.mainStoryboard().instantiateViewController(identifier: "LoginViewController")
                self.navigationController?.pushViewController(loginViewController, animated: true)
            }
           if user.isEmailVerified {
               let loginViewController = UIStoryboard.mainStoryboard().instantiateViewController(identifier: "LoginViewController")
               self.navigationController?.pushViewController(loginViewController, animated: true)
           } else {
             // do whatever you want to do when user isn't verified
               self.showAlert(title: "Error", message: "You are email verification not success", okBtnName: "Alert.Button.Ok".localized) { (success) in
               }
           }
        }
    }
}


    @IBAction func SignUpBtnClick(_ sender: Any) {
        emailSignup()
    }
    
    @IBAction func backBtnSignUp(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    
    @IBAction func signInBtn(_ sender: Any) {
        let loginViewController = UIStoryboard.mainStoryboard().instantiateViewController(identifier: "LoginViewController")
        self.navigationController?.pushViewController(loginViewController, animated: true)
    }
    
}
