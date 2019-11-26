//
//  AwardsType.swift
//  TechnicalTest
//
//  Created by Ernando Kasaluhe on 25/11/19.
//  Copyright © 2019 Test Coding. All rights reserved.
//

import Foundation

struct AwardsType {
    
    var id: Int?
    var name: String?
    var type: Int?
}

var DataAwardsType = [AwardsType(id: 0, name: "All Type", type: 0),
                     AwardsType(id: 1, name: "Vouchers", type: 0),
                     AwardsType(id: 2, name: "Products", type: 1),
                     AwardsType(id: 3, name: "Others", type: 2)]
