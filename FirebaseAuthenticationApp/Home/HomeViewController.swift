//
//  HomeViewController.swift
//  FirebaseAuthenticationApp
//
//  Created by User-P2 on 9/6/22.
//

import UIKit
import FirebaseAuth

internal enum ProviderType: String{
    case basic
}

final class HomeViewController: UIViewController {

    @IBOutlet private var emailLabel: UILabel!
    @IBOutlet private var providerLabel: UILabel!
    @IBOutlet private var logOutButton: UIButton!
    
    private let email: String
    private let provider: ProviderType
    
    //MARK: Contructor
    init(email: String, provider: ProviderType) {
        self.email = email
        self.provider = provider
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    internal override func viewDidLoad() {
        super.viewDidLoad()
        title = "Main Page"
        emailLabel.text = self.email
        providerLabel.text = provider.rawValue
        
    }
    
    @IBAction private func logOutActionButton(_ sender: Any) {
        switch provider {
        case .basic:
            do {
                try Auth.auth().signOut()
                navigationController?.popViewController(animated: true)
            }catch{
                self.alertShow()
            }
        }
    }
    
    //MARK: Error function to use more later
    private func alertShow() {
        let alert = UIAlertController(title: "Error!", message: "Log out error!", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default))
        self.present(alert, animated: true, completion: nil)
    }
}
