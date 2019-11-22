//
//  Constant.swift
//  TechnicalTest
//
//  Created by Ernando Kasaluhe on 21/11/19.
//  Copyright © 2019 Test Coding. All rights reserved.
//

import Foundation

let userKeychain = "currentUser"

class Constant: NSObject {
    static func saveUserData(data: [String: Any]) {
        let user = User.init(dictionary: data)
        _ = user?.saveToDiskCurrentUser()
    }
}
