//
//  LoginViewController.swift
//  TechnicalTest
//
//  Created by Ernando Kasaluhe on 21/11/19.
//  Copyright © 2019 Test Coding. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

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
        
        let sb = UIStoryboard.init(name: "Main", bundle: nil)
        let vc = sb.instantiateViewController(withIdentifier: "HomeVC") as! HomeViewController
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: true, completion: nil)
    }
}
