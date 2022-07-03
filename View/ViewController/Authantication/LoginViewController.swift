//
//  LoginViewController.swift
//  AR-Quest
//
//  Created by Madushan Senavirathna on 6/12/22.
//

import UIKit

import Firebase

class LoginViewController: BaseViewController {
    
    let objAJProgressView = AJProgressView()

    @IBOutlet var signInLabel: UILabel!
    @IBOutlet var emailLabel: UILabel!
    @IBOutlet var passwordLabel: UILabel!
    @IBOutlet weak var forgetPasswordBtn: UIButton!
    @IBOutlet weak var signInButton: UIButton!
    @IBOutlet weak var dontHaveAnAccount: UILabel!
    @IBOutlet weak var emailTextFeild: UITextField!
    @IBOutlet weak var passwordTextFeild: UITextField!
    var email = ""
    var password = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    override func setupUI() {
        signInLabel?.text = "Authentication.SignUpScreen.signInLabel.Label".localized
        emailLabel?.text = "Authentication.SignUpScreen.emailLabel.Label".localized
        passwordLabel?.text = "Authentication.SignUpScreen.passwordLabel.Label".localized
        forgetPasswordBtn.setTitle("Authentication.SignUpScreen.forgetPasswordBtn.Button".localized, for: .normal)
        signInButton.setTitle("Authentication.SignUpScreen.signInButton.Button".localized, for: .normal)
        dontHaveAnAccount?.text = "Authentication.SignUpScreen.dontHaveAnAccount.Label".localized
    }
    
    func emailSignin() {
        objAJProgressView.show()
        Auth.auth().signIn(withEmail: emailTextFeild.text!, password: passwordTextFeild.text!) { [weak self] authResult, error in
            self?.objAJProgressView.hide()
               guard let strongSelf = self else { return }

               if let error = error as? NSError {
                   // Handle sign in error
                   self!.showAlert(title: "Error", message: "Please create a new account ", okBtnName: "Alert.Button.Ok".localized) { (success) in
                   }
                   
               } else {
                   // No errors: Perform segue here...
                   let OnboardingViewController = UIStoryboard.mainStoryboard().instantiateViewController(identifier: "OnboardingVC")
                   self?.navigationController?.pushViewController(OnboardingViewController, animated: true)
               }
           }
       }
    
    
    @IBAction func logInButtonClick(_ sender: Any) {
        emailSignin()
    }
    
    @IBAction func logInBackBtn(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    @IBAction func forgetPasswordButton(_ sender: Any) {
        let forgetpassword = UIStoryboard.mainStoryboard().instantiateViewController(identifier: "ForgetPasswordViewController")
        self.navigationController?.pushViewController(forgetpassword, animated: true)
    }
    @IBAction func signUpbtn(_ sender: Any) {
        let signUpViewController = UIStoryboard.mainStoryboard().instantiateViewController(identifier: "SignUpViewController")
        self.navigationController?.pushViewController(signUpViewController, animated: true)
    }
    
}
