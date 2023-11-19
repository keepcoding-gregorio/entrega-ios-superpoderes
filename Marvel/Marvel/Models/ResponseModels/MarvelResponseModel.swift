//
//  MarvelResponseModel.swift
//  Marvel
//
//  Created by Gonzalo Gregorio on 18/11/2023.
//

import Foundation

//struct MarvelResponseModel: Codable {
//    let code: Int
//    let status, copyright, attributionText, attributionHTML: String
//    let etag: String
//    let data: DataModel
//}

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let marvelResponseModel = try? JSONDecoder().decode(MarvelResponseModel.self, from: jsonData)

import Foundation

// MARK: - MarvelResponseModel
struct MarvelResponseModel: Codable {
    let code: Int
//    let status, copyright, attributionText, attributionHTML: String
//    let etag: String
    let data: MarvelData
}

// MARK: - DataClass
struct MarvelData: Codable {
    let offset, limit, total, count: Int
    let results: [Character]
}

// MARK: - Result
//struct Character: Codable, Identifiable {
//    let id: Int
//    let name, description: String
////    let modified: Date
//    let thumbnail: Thumbnail
//    let resourceURI: String
//    let comics, series: Comics
//    let stories: Stories
//    let events: Comics
//    let urls: [URLElement]
//}

// MARK: - Comics
struct Comics: Codable {
    let available: Int
    let collectionURI: String
    let items: [ComicsItem]
    let returned: Int
}

// MARK: - ComicsItem
struct ComicsItem: Codable {
    let resourceURI: String
    let name: String
}

// MARK: - Stories
struct Stories: Codable {
    let available: Int
    let collectionURI: String
    let items: [StoriesItem]
    let returned: Int
}

// MARK: - StoriesItem
struct StoriesItem: Codable {
    let resourceURI: String
    let name: String
    let type: ItemType
}

enum ItemType: String, Codable {
    case ad = "ad"
    case backcovers = "backcovers"
    case cover = "cover"
    case empty = ""
    case interiorStory = "interiorStory"
    case pinup = "pinup"
    case textArticle = "text article"
}

// MARK: - Thumbnail
struct Thumbnail: Codable {
    let path: String
    let thumbnailExtension: Extension

    enum CodingKeys: String, CodingKey {
        case path
        case thumbnailExtension = "extension"
    }
}

enum Extension: String, Codable {
    case gif = "gif"
    case jpg = "jpg"
}

// MARK: - URLElement
struct URLElement: Codable {
    let type: URLType
    let url: String
}

enum URLType: String, Codable {
    case comiclink = "comiclink"
    case detail = "detail"
    case wiki = "wiki"
}
