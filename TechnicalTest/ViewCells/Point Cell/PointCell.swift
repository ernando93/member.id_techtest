//
//  PointCell.swift
//  TechnicalTest
//
//  Created by Ernando Kasaluhe on 26/11/19.
//  Copyright © 2019 Test Coding. All rights reserved.
//

import UIKit
import RangeSeekSlider
import AORangeSlider

class PointCell: UITableViewCell {

    @IBOutlet weak var rangeSlider: RangeSeekSlider!
    @IBOutlet weak var labelMinPoint: UILabel!
    @IBOutlet weak var labelMaxPoint: UILabel!
    
    func setConfigure() {
        
        setContentView()
    }
}

//MARK: - Setup Content View
extension PointCell: RangeSeekSliderDelegate {
    
    func setContentView() {
        
        setRangeSlider(slider: rangeSlider)
        setupLabelPoint(minPoint: String.formatCurrency(number: "10000", digitBeforeZero: 0), maxPoint: String.formatCurrency(number: "500000", digitBeforeZero: 0))
    }
    
    func setRangeSlider(slider: RangeSeekSlider) {
        
        slider.delegate = self
        slider.minValue = 10000
        slider.selectedMinValue = 10000
        slider.maxValue = 1000000
        slider.selectedMaxValue = 500000
        slider.hideLabels = true
        slider.enableStep = true
        slider.disableRange = true
        slider.step = 10000
    }
    
    func setupLabelPoint(minPoint: String, maxPoint: String) {
        labelMinPoint.text = "IDR " + minPoint
        labelMaxPoint.text = "IDR " + maxPoint
    }
    
    func rangeSeekSlider(_ slider: RangeSeekSlider, didChange minValue: CGFloat, maxValue: CGFloat) {
        let minPoint = Int(minValue)
        let maxPoint = Int(maxValue)
        
        let stringMinPoint = String.formatCurrency(number: "\(minPoint)", digitBeforeZero: 0)
        let StringMaxPoint = String.formatCurrency(number: "\(maxPoint)", digitBeforeZero: 0)
        
        setupLabelPoint(minPoint: stringMinPoint, maxPoint: StringMaxPoint)
    }
}
