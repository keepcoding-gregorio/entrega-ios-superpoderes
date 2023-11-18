//
//  SecureDataProviderProtocol.swift
//  Marvel
//
//  Created by Gonzalo Gregorio on 14/11/2023.
//

import Foundation

protocol SecureDataProviderProtocol {
    func get(key: String) -> String?
    func save(key: String, value: String) -> Bool
    func delete(key: String) -> Bool
}
