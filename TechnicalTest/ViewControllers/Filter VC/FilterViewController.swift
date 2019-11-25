//
//  FilterViewController.swift
//  TechnicalTest
//
//  Created by Ernando Kasaluhe on 25/11/19.
//  Copyright © 2019 Test Coding. All rights reserved.
//

import UIKit

class FilterViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }
}

//MARK: - Action
extension FilterViewController {
    
    @IBAction func buttonCancelTapped(_ sender: UIButton) {
        
        self.dismiss(animated: true, completion: nil)
    }
}
