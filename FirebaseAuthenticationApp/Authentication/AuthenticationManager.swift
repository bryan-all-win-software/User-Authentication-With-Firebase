//
//  AuthenticationManager.swift
//  FirebaseAuthenticationApp
//
//  Created by User-P2 on 9/7/22.
//

import Foundation
import FirebaseAnalytics
import FirebaseAuth

final class AuthenticationManage: AuthViewController {
    
    override func pushHomeViewController(email: String, password: String) {
        Auth.auth().createUser(withEmail: email, password: password) {
            ( result, error ) in
            if let result = result, error == nil {
                self.navigationController?.pushViewController(HomeViewController(email: result.user.email!, provider: .basic), animated: true)
            }else {
                let alertController  = UIAlertController(title: "Error!", message: error?.localizedDescription, preferredStyle: .alert)
                alertController.addAction(UIAlertAction(title: "Ok", style: .default))
                self.present(alertController, animated: true, completion: nil)
            }
        }
    }
    
    public func pushAlert(error: Error?) {
        let alertController  = UIAlertController(title: "Error!", message: error?.localizedDescription, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "Ok", style: .default))
        self.present(alertController, animated: true, completion: nil)
    }
    
}
