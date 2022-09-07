//
//  AuthViewController.swift
//  FirebaseAuthenticationApp
//
//  Created by User-P2 on 9/6/22.
//

import UIKit
import FirebaseAnalytics
import FirebaseAuth

class AuthViewController: UIViewController {

    @IBOutlet var emailTF: UITextField!
    @IBOutlet var passwordTF: UITextField!
    @IBOutlet var signUpB: UIButton!
    @IBOutlet var loginB: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Analytics Event message
        Analytics.logEvent("Main Screeen", parameters: ["message": "Firebase integration started."])
        
    }

    @IBAction func signUpButtonAction(_ sender: Any) {
        if let email = emailTF.text, let password = passwordTF.text {
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
    }
    
    @IBAction func loginButtonAction(_ sender: Any) {
        if let email = emailTF.text, let password = passwordTF.text {
            Auth.auth().signIn(withEmail: email, password: password) {
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
    }
    
}

