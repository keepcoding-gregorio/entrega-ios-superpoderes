//
//  CharactersInteractorProtocol.swift
//  Marvel
//
//  Created by Gonzalo Gregorio on 18/11/2023.
//

import Foundation
import Combine

protocol CharactersInteractorProtocol: AnyObject {
    func getCharacters(filter: String) -> AnyPublisher<[CharacterModel], Error>
}
