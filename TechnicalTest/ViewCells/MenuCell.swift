//
//  MenuCell.swift
//  TechnicalTest
//
//  Created by Ernando Kasaluhe on 23/11/19.
//  Copyright © 2019 Test Coding. All rights reserved.
//

import UIKit

class MenuCell: UITableViewCell {

    @IBOutlet weak var labelTitle: UILabel!
    
    
    func setConfigure(with data: Menu, selectedRow: Int) {
        
        labelTitle.text = data.title ?? ""
        labelTitle.textColor = selectedRow == data.id ? .black : .lightGray
    }
}
