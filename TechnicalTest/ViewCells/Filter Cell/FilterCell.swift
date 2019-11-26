//
//  FilterCell.swift
//  TechnicalTest
//
//  Created by Ernando Kasaluhe on 26/11/19.
//  Copyright © 2019 Test Coding. All rights reserved.
//

import UIKit

class FilterCell: UITableViewCell {

    @IBOutlet weak var viewPoint: UIView!
    @IBOutlet weak var viewType: UIView!
    @IBOutlet weak var viewClear: UIView!
    
    func setConfigure() {
        
        setContentView()
    }
    
}

//MARK: - Setup Content View
extension FilterCell {
    
    func setContentView() {
        
        setViewContainer(in: viewPoint)
        setViewContainer(in: viewType)
        setViewContainer(in: viewClear)
    }
    
    func setViewContainer(in view: UIView) {
        
        view.layer.borderWidth = 1.0
        view.layer.borderColor = UIColor(red: 0.0/255.0, green: 122.0/255.0, blue: 255.0/255.0, alpha: 1.0).cgColor
        view.layer.cornerRadius = 5.0
        view.clipsToBounds = true
    }
}
