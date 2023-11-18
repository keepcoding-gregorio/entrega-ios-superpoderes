//
//  CharacterModel.swift
//  Marvel
//
//  Created by Gonzalo Gregorio on 18/11/2023.
//

import Foundation

struct Character: Codable {
    let id: Int
    let name, description: String
    let modified: Date
    let thumbnail: Thumbnail
    let resourceURI: String
    let comics, series: Comics
    let stories: Stories
    let events: Comics
    let urls: [URLElement]
}
