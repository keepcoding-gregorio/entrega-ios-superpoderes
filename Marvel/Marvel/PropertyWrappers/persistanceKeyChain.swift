//
//  persistanceKeyChain.swift
//  Marvel
//
//  Created by Gonzalo Gregorio on 15/11/2023.
//

import Foundation

@propertyWrapper
class persistanceKeychain {
    private var key: String
    private let keyChain = KeychainDataProvider()
    
    init(key: String) {
        self.key = key
    }
    
    var wrappedValue: String {
        get {
            guard let value = keyChain.get(key: key) else {
                return ""
            }
            return value
        }
        
        set {
            keyChain.save(key: key, value: newValue)
        }
    }
}
