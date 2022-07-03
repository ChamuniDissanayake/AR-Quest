//
//  StoryboardUtil.swift
//  AR-Quest
//
//  Created by Madushan Senavirathna on 6/12/22.
//

import UIKit

class StoryboardUtil: NSObject {
    static func getViewController(storyboardName: StoryboardName, storyboardIdentifier: StoryboardIdentifier) -> UIViewController {
        let viewController = UIStoryboard.init(name: storyboardName.rawValue, bundle: Bundle.main).instantiateViewController(withIdentifier: storyboardIdentifier.rawValue)
        return viewController
    }
    
    static func getLoginViewController() -> LoginViewController {
        let loginViewController = getViewController(storyboardName: StoryboardName.main, storyboardIdentifier: StoryboardIdentifier.loginViewController) as? LoginViewController
        return loginViewController!
    }
    
    static func getSignUpViewController() -> SignUpViewController {
        let signViewController = getViewController(storyboardName: StoryboardName.main, storyboardIdentifier: StoryboardIdentifier.SignUpViewController) as? SignUpViewController
        return signViewController!
    }
    
    static func getMainViewController() -> MainViewController {
        let mainViewController = getViewController(storyboardName: StoryboardName.main, storyboardIdentifier: StoryboardIdentifier.mainViewController) as? MainViewController
        return mainViewController!
    }
    
    static func getForgetPasswordViewController() -> ForgetPasswordViewController {
        let forgetPasswordViewController = getViewController(storyboardName: StoryboardName.main, storyboardIdentifier: StoryboardIdentifier.forgetpasswordViewController) as? ForgetPasswordViewController
        return forgetPasswordViewController!
    }
    
    static func getHomeViewController() -> ViewController {
        let viewController = getViewController(storyboardName: StoryboardName.main, storyboardIdentifier: StoryboardIdentifier.viewController) as? ViewController
        return viewController!
    }
    
    static func getCartViewController() -> CartViewController {
        let cartViewController = getViewController(storyboardName: StoryboardName.main, storyboardIdentifier: StoryboardIdentifier.cartViewController) as? CartViewController
        return cartViewController!
    }
    
    static func getPaymentViewController() -> PaymentViewController {
        let paymentViewController = getViewController(storyboardName: StoryboardName.main, storyboardIdentifier: StoryboardIdentifier.paymentViewController) as? PaymentViewController
        return paymentViewController!
    }
    
    static func getSuccessViewController() -> SuccessViewController {
        let successViewController = getViewController(storyboardName: StoryboardName.main, storyboardIdentifier: StoryboardIdentifier.successViewController) as? SuccessViewController
        return successViewController!
    }
    
    static func getUnSuccessViewController() -> UnSuccessViewController {
        let unSuccessViewController = getViewController(storyboardName: StoryboardName.main, storyboardIdentifier: StoryboardIdentifier.unSuccessViewController) as? UnSuccessViewController
        return unSuccessViewController!
    }
}
