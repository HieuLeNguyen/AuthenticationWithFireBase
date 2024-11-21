//
//  WelcomeViewController.swift
//  AuthenticationWithFireBase
//
//  Created by Nguyễn Văn Hiếu on 21/11/24.
//

import UIKit

class WelcomeViewController: UIViewController {
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        addBackground()
    }
    
    @IBAction func tapLoginButton(_ sender: Any) {
        if let loginVC = storyboard?.instantiateViewController(withIdentifier: "LoginViewController") as? LoginViewController {
            //            loginVC.modalPresentationStyle = .fullScreen
            present(loginVC, animated: true)
        }
    }
    
    @IBAction func tapRegisterButton(_ sender: Any) {
        if let registerVC = storyboard?.instantiateViewController(withIdentifier: "RegisterViewController") as? RegisterViewController {
            //            registerVC.modalPresentationStyle = .fullScreen
            present(registerVC, animated: true)
        }
    }
    
}

