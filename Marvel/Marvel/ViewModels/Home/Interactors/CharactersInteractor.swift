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
    
    func login(publicKey: String, privateKey: String) -> AnyPublisher<MarvelResponseModel, Error> {
        networker.execute(type: MarvelResponseModel.self, request: dataProvider.login(publicKey: publicKey, privateKey: privateKey))
    }
}
