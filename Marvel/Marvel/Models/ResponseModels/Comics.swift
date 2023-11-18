//
//  Comics.swift
//  Marvel
//
//  Created by Gonzalo Gregorio on 18/11/2023.
//

import Foundation

struct Comics: Codable {
    let available: Int
    let collectionURI: String
    let items: [ComicsItem]
    let returned: Int
}
