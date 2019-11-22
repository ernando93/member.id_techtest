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
    
    func setConfigure(with data: Awards) {
        
        setContent(with: data.title ?? "", type: data.type ?? 0, name: data.name ?? "", poin: data.poin ?? 0)
    }
}

//MARK: - Setup Content
extension AwardsCell {
    
    func setContent(with title: String, type: Int, name: String, poin: Int) {
        
        setImageView(in: imageAwards)
        setButtonType(in: buttonType, type: type, name: name)
        labelTitle.text = title
        labelPoin.text = String.formatCurrency(number: "\(poin)", digitBeforeZero: 0) + " Poin"
    }
    
    func setImageView(in image: UIImageView) {
        
        image.layer.cornerRadius = 5.0
        image.layer.shadowOffset = CGSize(width: 1.0, height: 3.0)
        image.layer.shadowRadius = 2.0
        image.layer.shadowOpacity = 0.20
        image.layer.masksToBounds = false
    }
    
    func setButtonType(in button: UIButton, type: Int, name: String) {

        button.backgroundColor = type == 0 ? UIColor(red: 0.0/255.0, green: 122.0/255.0, blue: 255.0/255.0, alpha: 1.0) : .systemOrange
        button.setTitle(type == 0 ? "   \(name)   " : "   \(name)   ", for: .normal)
        button.isUserInteractionEnabled = false
        button.layer.cornerRadius = 5.0
    }
}
