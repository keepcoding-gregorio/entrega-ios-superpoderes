//
//  MarvelResponseModel.swift
//  Marvel
//
//  Created by Gonzalo Gregorio on 18/11/2023.
//

import Foundation

struct MarvelResponseModel: Codable {
    let code: Int
    let status, copyright, attributionText, attributionHTML: String
    let etag: String
    let data: DataModel
}
