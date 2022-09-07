//
//  AuthViewController.swift
//  FirebaseAuthenticationApp
//
//  Created by User-P2 on 9/6/22.
//

import UIKit
import FirebaseAnalytics
import FirebaseAuth

final class AuthViewController: UIViewController {

    @IBOutlet private var emailTF: UITextField!
    @IBOutlet private var passwordTF: UITextField!
    @IBOutlet private var signUpB: UIButton!
    @IBOutlet private var loginB: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //MARK: Analytics Event message
        Analytics.logEvent("Main Screeen", parameters: ["message": "Firebase integration started."])
        
    }

    @IBAction private func signUpButtonAction(_ sender: Any) {
        if let email = emailTF.text, let password = passwordTF.text {
            Auth.auth().createUser(withEmail: email, password: password) {
                ( result, error ) in
                self.pushHomeViewController(result: result, error: error, email: email)
            }
        }
    }
    
    @IBAction private func loginButtonAction(_ sender: Any) {
        if let email = emailTF.text, let password = passwordTF.text {
            Auth.auth().signIn(withEmail: email, password: password) {
                ( result, error ) in
                self.pushHomeViewController(result: result, error: error, email: email)
            }
        }
    }
    
    //MARK: Sending to HomeViewController with user email after to authentication verification
    private func pushHomeViewController (result: AuthDataResult?, error: Error?, email: String) {
        if let _ = result, error == nil {
            self.navigationController?.pushViewController(HomeViewController(email: email, provider: .basic), animated: true)
        } else {
            let alertController = UIAlertController(title: "Error!", message: "Authentication fail to incorret credentials.", preferredStyle: .alert)
            alertController.addAction(UIAlertAction(title: "Dissmis", style: .default))
            self.present(alertController, animated: true, completion: nil)
        }
    }
     
}

