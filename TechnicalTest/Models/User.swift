//
//  User.swift
//  TechnicalTest
//
//  Created by Ernando Kasaluhe on 22/11/19.
//  Copyright © 2019 Test Coding. All rights reserved.
//

import Foundation

protocol ResponseDataConvertible {
    init?(rawData: Any)
}

final class User: NSObject, NSCoding {
    var email: String
    
    init?(dictionary: [String: Any]) {
        if let email = dictionary["email"] as? String {
            self.email = email
        } else {
            self.email = ""
        }
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(email, forKey: "email")
    }
    
    init?(coder aDecoder: NSCoder) {
        self.email = ""
        
        if let email = aDecoder.decodeObject(forKey: "email") as? String {
            self.email = email
        }
    }
}

extension User: ResponseDataConvertible {
    convenience init?(rawData: Any) {
        if let dictionary = rawData as? [String: Any] {
            self.init(dictionary: dictionary)
        } else {
            return nil
        }
    }
}

extension User {
    enum AuthenticationResult {
        case success(User)
        case failed(String)
        case failure(Error)
    }
    
    enum AuthenticationError: Error {
        case alreadyLoggedIn
        case unableToWriteFile
        case unableToWriteKeychain
        case unknownError
    }
}

// MARK: - Data
extension User {
    
    static var currentUser: User? {
        
        if let user = loadUserFromDisk(key: userKeychain) {
            
            return user
        }
        return nil
    }
    
    func saveToDiskCurrentUser() -> AuthenticationResult {
        
        if saveSensitiveUserData(user: self, key: userKeychain) {
            
            if persistUserToDisk(user: self, key: userKeychain) {
                
                return .success(self)
            } else {
                
                return .failure(AuthenticationError.unableToWriteFile)
            }
        }
        return .failure(AuthenticationError.unableToWriteKeychain)
    }
    
    static func deleteCurrentUserFromDisk() -> Bool {
        
        if removePersistentUserFromDisk(key: userKeychain) {
            
            if deleteSensitiveUserData(forkey: userKeychain) {
                
                return true
            } else {
                
                return false
            }
        }
        return false
    }
    
    static func logout() {
        _ = deleteCurrentUserFromDisk()
    }
}

// MARK: - File Persistence
extension User {
    static func loadUserFromDisk(key: String) -> User? {
        let filePersistencController = FilePersistentsController(storageDirectoryURL: documentBaseURL)
        
        if let data = filePersistencController.data(forKey: key) {
            return NSKeyedUnarchiver.unarchiveObject(with: data) as? User
            
        } else {
            return nil
        }
    }
    
    func persistUserToDisk(user: User, key: String) -> Bool {
        let data = NSKeyedArchiver.archivedData(withRootObject: user)
        let filePersistencController = FilePersistentsController(storageDirectoryURL: User.documentBaseURL)
        
        return filePersistencController.writeData(data, forKey: key)
    }
    
    static func removePersistentUserFromDisk(key: String) -> Bool {
        let filePersistencController = FilePersistentsController(storageDirectoryURL: documentBaseURL)
        
        return filePersistencController.removeData(forKey: key)!
    }
    
    static var documentBaseURL: URL {
        return FileManager.default.urls(for: .libraryDirectory, in: .userDomainMask)[0]
            .appendingPathComponent("Private Documents", isDirectory: true)
            .appendingPathComponent("AlodokterAssignment", isDirectory: true)
    }
}

// MARK: - Keychain
extension User {
    func saveSensitiveUserData(user: User, key: String) -> Bool {
        let keychainController = KeychainController()
        
        return keychainController.setValue(user, forKey: key)
    }
    
    static func userSessionTokenInKeyChain(forkey key: String) -> String? {
        let keychainController = KeychainController()
        
        return keychainController.value(forKey: key) as? String
    }
    
    static func deleteSensitiveUserData(forkey key: String) -> Bool {
        let keychainController = KeychainController()
        
        return keychainController.removeValue(forKey: key)
    }
}
