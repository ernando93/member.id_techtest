//
//  KeychainController.swift
//  TechnicalTest
//
//  Created by Ernando Kasaluhe on 21/11/19.
//  Copyright © 2019 Test Coding. All rights reserved.
//

import Foundation

struct KeychainController {
    let service: String
    
    init(service: String = "id.member") {
        self.service = service
    }
    
    // Getter
    func value(forKey key: String) -> Any? {
        if let data = data(forKey: key) {
            let object = NSKeyedUnarchiver.unarchiveObject(with: data)
            return object
        }
        return nil
    }
    
    // Setter
    func setValue(_ value: Any, forKey key: String) -> Bool {
        let data = NSKeyedArchiver.archivedData(withRootObject: value)
        
        var query = templateQuery
        query[kSecAttrAccount as String] = key
        
        let update = [kSecValueData as String: data]
        
        var status = errSecSuccess
        
        if self.data(forKey: key) == nil {
            query += update
            status = SecItemAdd(query as CFDictionary, nil)
        } else {
            status = SecItemUpdate(query as CFDictionary, update as CFDictionary)
        }
        
        return status == errSecSuccess
    }
    
    // Remove
    func removeValue(forKey key: String) -> Bool {
        var query = templateQuery
        query[kSecAttrAccount as String] = key
        
        let status = SecItemDelete(query as CFDictionary)
        
        return status == errSecSuccess
    }
    
    fileprivate func data(forKey key: String) -> Data? {
        var query = templateQuery
        
        query[kSecAttrAccount as String] = key
        query[kSecMatchLimit as String] = kSecMatchLimitOne
        query[kSecReturnData as String] = kCFBooleanTrue
        
        var result: AnyObject?
        
        let status = SecItemCopyMatching(query as CFDictionary, &result)
        
        if status == noErr, let data = result as? Data {
            return data
        }
        
        return nil
    }
    
    fileprivate var templateQuery: [String: Any] {
        return [
            kSecClass as String: kSecClassGenericPassword,
            kSecAttrService as String: service
        ]
    }
}

// MARK: - Helper
fileprivate extension Dictionary {
    static func +=(lhs: inout Dictionary, rhs: Dictionary) {
        for (k, v) in rhs {
            lhs[k] = v
        }
    }
}
