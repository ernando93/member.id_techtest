//
//  AwardsCell.swift
//  TechnicalTest
//
//  Created by Ernando Kasaluhe on 21/11/19.
//  Copyright © 2019 Test Coding. All rights reserved.
//

import UIKit

class AwardsCell: UICollectionViewCell {

    @IBOutlet weak var imageAwards: UIImageView!
    @IBOutlet weak var buttonType: UIButton!
    @IBOutlet weak var labelPoin: UILabel!
    @IBOutlet weak var labelTitle: UILabel!
    
    func setConfigure() {
        
        setContent()
    }
}

//MARK: - Setup Content
extension AwardsCell {
    
    func setContent() {
        
        setImageView(in: imageAwards)
        setButtonType(in: buttonType)
    }
    
    func setImageView(in image: UIImageView) {
        
        image.layer.cornerRadius = 5.0
        image.layer.shadowOffset = CGSize(width: 1.0, height: 3.0)
        image.layer.shadowRadius = 2.0
        image.layer.shadowOpacity = 0.20
        image.layer.masksToBounds = false
    }
    
    func setButtonType(in button: UIButton) {
        
        button.isUserInteractionEnabled = false
        button.layer.cornerRadius = 5.0
    }
}
