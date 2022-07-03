//
//  UserDefaultManager.swift
//  AR-Quest
//
//  Created by Madushan Senavirathna on 6/12/22.
//

import Foundation
import UIKit

class UserDefaultManager {
    static let shared = UserDefaultManager()
    
    func saveEmail(email: String){
        UserDefaults.standard.set(email, forKey: Constants.email.rawValue)
    }

    func getEmail() -> String {
        if let email = UserDefaults.standard.string(forKey: Constants.email.rawValue){
            return email
        }
        else{
            return ""
        }
    }

    func saveIDToken(idToken: String){
        UserDefaults.standard.set(idToken, forKey: Constants.idToken.rawValue)
    }

    func getIDToken() -> String{
        if let idToken = UserDefaults.standard.string(forKey: Constants.idToken.rawValue){
            return idToken
        }
        else{
            return ""
        }
    }
    
    func saveName(name: String){
        UserDefaults.standard.set(name, forKey: Constants.name.rawValue)
    }
    
    func getName() -> String {
        if let name = UserDefaults.standard.string(forKey: Constants.name.rawValue){
            return name
        }
        else{
            return ""
        }
    }
}

