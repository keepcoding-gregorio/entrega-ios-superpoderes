//
//  CharactersInteractor.swift
//  Marvel
//
//  Created by Gonzalo Gregorio on 18/11/2023.
//

import Foundation
import Combine

final class CharactersInteractor: CharactersInteractorProtocol {
    let networker: RequestProtocol
    let dataProvider: MarvelDataProvider
    
    init(worker: RequestProtocol = RequestWorker(), dataProvider : MarvelDataProvider =  MarvelDataProvider()){
        self.networker = worker
        self.dataProvider = dataProvider
    }
    
    func getCharacters(filter: String) -> AnyPublisher<[CharacterModel], Error> {
        networker.execute(type: [CharacterModel].self, request: dataProvider.getCharacters(filter: filter))
    }
}
