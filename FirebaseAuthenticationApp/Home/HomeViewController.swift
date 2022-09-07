//
//  HomeViewController.swift
//  FirebaseAuthenticationApp
//
//  Created by User-P2 on 9/6/22.
//

import UIKit
import FirebaseAuth

enum ProviderType: String{
    case basic
}

class HomeViewController: UIViewController {

    @IBOutlet var emailLabel: UILabel!
    @IBOutlet var providerLabel: UILabel!
    @IBOutlet var logOutButton: UIButton!
    
    private let email: String
    private let provider: ProviderType
    
    
    init(email: String, provider: ProviderType) {
        self.email = email
        self.provider = provider
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Main Page"
        
        emailLabel.text = self.email
        providerLabel.text = provider.rawValue
        
    }
    
    @IBAction func logOutActionButton(_ sender: Any) {
        
        switch provider {
        case .basic:
            do {
                try Auth.auth().signOut()
                navigationController?.popViewController(animated: true)
                print(provider.rawValue)
            }catch{
                let alert = UIAlertController(title: "Error!", message: "Log out error!", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "Ok", style: .default))
                                              self.present(alert, animated: true, completion: nil)
            }
        }
        
    }
}
