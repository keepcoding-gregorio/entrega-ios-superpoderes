//
//  CharacterModel.swift
//  Marvel
//
//  Created by Gonzalo Gregorio on 16/11/2023.
//

import Foundation

struct CharacterModel: Codable, Identifiable {
    var id: UUID
    var name: String
    var description: String
    var photo: String
    var favorite: Bool?
}

struct CharacterFilterModel: Codable {
    var name: String
}
