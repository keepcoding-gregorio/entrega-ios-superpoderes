//
//  MockCharactersInteractor.swift
//  Marvel
//
//  Created by Gonzalo Gregorio on 18/11/2023.
//

import Foundation
import Combine

final class MockCharactersInteractor: CharactersInteractorProtocol {
    func login(publicKey: String, privateKey: String) -> AnyPublisher<MarvelResponseModel, Error> {
        let character1 = Character(id: 1017100, name: "A-Bomb (HAS)", description: "Rick Jones has been Hulk's best bud since day one, but now he's more than a friend...he's a teammate! Transformed by a Gamma energy explosion, A-Bomb's thick, armored skin is just as strong and powerful as it is blue. And when he curls into action, he uses it like a giant bowling ball of destruction!", thumbnail: Thumbnail(path: "http://i.annihil.us/u/prod/marvel/i/mg/3/20/5232158de5b16", thumbnailExtension: Extension.jpg))
        
        let character2 = Character(id: 1009144, name: "A.I.M.", description: "AIM is a terrorist organization bent on destroying the world.", thumbnail: Thumbnail(path: "http://i.annihil.us/u/prod/marvel/i/mg/6/20/52602f21f29ec", thumbnailExtension: Extension.jpg))
        
        let character3 = Character(id: 1017438, name: "Araña", description: "No need for description..", thumbnail: Thumbnail(path: "http://i.annihil.us/u/prod/marvel/i/mg/b/40/image_not_available", thumbnailExtension: Extension.jpg))
        
        let character4 = Character(id: 1009165, name: "Avengers", description: "Earth's Mightiest Heroes joined forces to take on threats that were too big for any one hero to tackle. With a roster that has included Captain America, Iron Man, Ant-Man, Hulk, Thor, Wasp and dozens more over the years, the Avengers have come to be regarded as Earth's No. 1 team.", thumbnail: Thumbnail(path: "http://i.annihil.us/u/prod/marvel/i/mg/9/20/5102c774ebae7", thumbnailExtension: Extension.jpg))
        
        let mockedMarvelData = MarvelData(offset: 0, limit: 100, total: 1563, count: 100,results:  [character1, character2, character3, character4])
        let mockedMarvelResponse = MarvelResponseModel(code: 200, data: mockedMarvelData)
        let publisher = CurrentValueSubject<MarvelResponseModel, Error>(mockedMarvelResponse)
        return publisher.eraseToAnyPublisher()
    }
    
//    func getCharacters(filter: String) -> AnyPublisher<[CharacterModel], Error> {
//        let character1 = Character(id: 1017100, name: "A-Bomb (HAS)", description: "Rick Jones has been Hulk's best bud since day one, but now he's more than a friend...he's a teammate! Transformed by a Gamma energy explosion, A-Bomb's thick, armored skin is just as strong and powerful as it is blue. And when he curls into action, he uses it like a giant bowling ball of destruction!", thumbnail: Thumbnail(path: "http://i.annihil.us/u/prod/marvel/i/mg/3/20/5232158de5b16", thumbnailExtension: Extension.jpg))
//        
//        let character2 = Character(id: 1009144, name: "A.I.M.", description: "AIM is a terrorist organization bent on destroying the world.", thumbnail: Thumbnail(path: "http://i.annihil.us/u/prod/marvel/i/mg/6/20/52602f21f29ec", thumbnailExtension: Extension.jpg))
//        
//        let character3 = Character(id: 1017438, name: "Araña", description: "No need for description..", thumbnail: Thumbnail(path: "http://i.annihil.us/u/prod/marvel/i/mg/b/40/image_not_available", thumbnailExtension: Extension.jpg))
//        
//        let character4 = Character(id: 1009165, name: "Avengers", description: "Earth's Mightiest Heroes joined forces to take on threats that were too big for any one hero to tackle. With a roster that has included Captain America, Iron Man, Ant-Man, Hulk, Thor, Wasp and dozens more over the years, the Avengers have come to be regarded as Earth's No. 1 team.", thumbnail: Thumbnail(path: "http://i.annihil.us/u/prod/marvel/i/mg/9/20/5102c774ebae7", thumbnailExtension: Extension.jpg))
//        
//        let characters = [character1, character2, character3, character4]
//        
//        let publisher = CurrentValueSubject<[Character], Error>(characters)
//        return publisher.eraseToAnyPublisher()
//    }
    
}
