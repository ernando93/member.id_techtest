//
//  FilePersistentsController.swift
//  TechnicalTest
//
//  Created by Ernando Kasaluhe on 21/11/19.
//  Copyright © 2019 Test Coding. All rights reserved.
//

import Foundation

struct FilePersistentsController {
    let storageDirectoryURL: URL
    
    func writeData(_ data: Data, forKey key: String) -> Bool {
        let url = fileURL(forKey: key)
        
        try? FileManager.default.createDirectory(at: storageDirectoryURL,
                                                 withIntermediateDirectories: true)
        
        do {
            try data.write(to: url, options: .atomic)
            return true
        } catch {
            return false
        }
    }
    
    func data(forKey key: String) -> Data? {
        let url = fileURL(forKey: key)
        
        do {
            let data = try Data(contentsOf: url)
            return data
        } catch {
            return nil
        }
    }
    
    func removeData(forKey key: String) -> Bool? {
        let url = fileURL(forKey: key)
        
        do {
            try FileManager.default.removeItem(at: url)
            return true
        } catch {
            return false
        }
    }
}

extension FilePersistentsController {
    func fileURL(forKey key: String) -> URL {
        return storageDirectoryURL.appendingPathComponent(key, isDirectory: false)
    }
}
