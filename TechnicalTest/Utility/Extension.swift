//
//  Extension.swift
//  TechnicalTest
//
//  Created by Ernando Kasaluhe on 21/11/19.
//  Copyright © 2019 Test Coding. All rights reserved.
//

import Foundation
import UIKit

extension UIAlertController {
    
    static func defaultAlertController(title: String, message: String, textAction: String) -> UIAlertController {
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        if textAction != "" {
            
            alert.addAction(UIAlertAction(title: textAction, style: .default, handler: nil))
        }
        return alert
    }
}

extension String {
    
    static func isValidEmail(emailString:String) -> Bool {
        
        if emailString == "" {
            
            return false
        }
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        
        let emailPredicate = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPredicate.evaluate(with: emailString)
    }
    
    static func formatCurrency(number: String, digitBeforeZero: Int) -> String {
        
        if number == "" {
            
            return String()
        }
        
        let newPrice = number.replacingOccurrences(of: ".", with: "", options: .literal, range: nil)
        let value: Double = Double(newPrice)!
        
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.groupingSeparator = "."
        formatter.groupingSize = 3
        formatter.minimumFractionDigits = digitBeforeZero
        formatter.maximumFractionDigits = 2
        formatter.decimalSeparator = "."
        let svalue = formatter.string(from: value as NSNumber)
        return svalue!
    }
}
