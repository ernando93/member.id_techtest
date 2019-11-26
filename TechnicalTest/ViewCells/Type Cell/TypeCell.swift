//
//  TypeCell.swift
//  TechnicalTest
//
//  Created by Ernando Kasaluhe on 26/11/19.
//  Copyright © 2019 Test Coding. All rights reserved.
//

import UIKit

class TypeCell: UITableViewCell {

    @IBOutlet weak var imageTick: UIImageView!
    @IBOutlet weak var labelName: UILabel!
    
    func setConfigure(with data: AwardsType, selected: Bool) {
        
        setContent(with: data.name ?? "", selected: selected)
    }
}

//MARK: - Setup Content
extension TypeCell {
    
    func setContent(with name: String, selected: Bool) {
        
        labelName.text = name
        imageTick.image = selected ? UIImage(named: "IcCheck") : UIImage(named: "IcCheckBox")
    }
}
