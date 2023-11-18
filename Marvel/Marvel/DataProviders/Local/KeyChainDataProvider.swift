//
//  KeyChainDataProvider.swift
//  Marvel
//
//  Created by Gonzalo Gregorio on 14/11/2023.
//

import Foundation
import KeychainSwift

final class KeychainDataProvider: SecureDataProviderProtocol {
    private let keyChain = KeychainSwift()
    
    func get(key: String) -> String? {
        keyChain.get(key) ?? ""
    }
    
    @discardableResult
    func save(key: String, value: String) -> Bool {
        guard let encodedValue = value.data(using: .utf8) else {
            return false
        }
        return keyChain.set(encodedValue, forKey: key)
    }
    
    func put(key: String, value: String) -> Bool {
        guard let encodedValue = value.data(using: .utf8) else { return false }
        return keyChain.get(key) != nil ? keyChain.set(encodedValue, forKey: key) : false
    }
    
    
    func delete(key: String) -> Bool {
        keyChain.delete(key)
    }
}
