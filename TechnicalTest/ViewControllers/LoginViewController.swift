//
//  LoginViewController.swift
//  TechnicalTest
//
//  Created by Ernando Kasaluhe on 21/11/19.
//  Copyright © 2019 Test Coding. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var buttonLogin: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setViewContent()
    }
}

//MARK: - Setup View Content
extension LoginViewController {
    
    func setViewContent() {
        
        setButtonLogin(in: buttonLogin)
    }
    
    func setButtonLogin(in button: UIButton) {
        
        button.layer.cornerRadius = 5.0
        button.addTarget(self, action: #selector(buttonLoginTapped), for: .touchUpInside)
    }
}

//MARK: - Action
extension LoginViewController {
    
    @objc func buttonLoginTapped() {
        
//        if emailTextField.text == "" {
//
//            self.present(UIAlertController.defaultAlertController(title: "", message: "Fill your email address", textAction: "OK"), animated: true, completion: nil)
//        } else {
//
//            if String.isValidEmail(emailString: emailTextField.text!) {
//
//                Constant.saveUserData(data: ["email": emailTextField.text as Any])
//
//                let sb = UIStoryboard.init(name: "Main", bundle: nil)
//                let vc = sb.instantiateViewController(withIdentifier: "HomeVC") as! HomeViewController
//                vc.modalPresentationStyle = .fullScreen
//                self.present(vc, animated: true, completion: nil)
//            } else {
//
//                self.present(UIAlertController.defaultAlertController(title: "", message: "Email is wrong format", textAction: "OK"), animated: true, completion: nil)
//            }
//        }
        
        let sb = UIStoryboard.init(name: "Main", bundle: nil)
        let vc = sb.instantiateViewController(withIdentifier: "HomeVC") as! HomeViewController
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: true, completion: nil)
    }
}
