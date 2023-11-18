//
//  AppState.swift
//  Marvel
//
//  Created by Gonzalo Gregorio on 14/11/2023.
//

import Foundation
import Combine

final class AppStateViewModel: ObservableObject {

    // MARK: Global Environment variables
    @Published var state: AppState = AppState.none
//    var isLogged: Bool = false
//    @Published var token: String = "" {
//        didSet {
//            print("Successfull login")
//            keyChain.save(key: KeyChainEnum.token, value: token)
//            isLogged = token.count > 0 ? true : false
//        }
//    }
    @persistanceKeychain(key: KeyChainEnum.token)
    var token {
        didSet {
            print("Successfull login")
//            isLogged = token.count > 0 ? true : false
        }
    }
    
    // MARK: Combine Suscriptor
    var suscriptors = Set<AnyCancellable>()
    
    // MARK: Class variables
    private let keyChain = KeychainDataProvider()
    
    // MARK: Initializer
    init() {
        self.userIsLogged()
    }
    
    // MARK: Login
    func userIsLogged() {
//        let existsToken = keyChain.get(key: KeyChainEnum.token)
//        if let currentToken = existsToken {
//            token = currentToken
//            status = .loaded
//        }
        if token != "" {
            state = .loaded
        }
    }
    
    func closeSession() {
        token = ""
        state = .none
    }
    
    func login(user: String, password: String) {
        state = .loading
        
        URLSession.shared
            .dataTaskPublisher(for: MarvelDataProvider().login(user: user, password: password))
            .tryMap {
                guard let response = $0.response as? HTTPURLResponse, response.statusCode == 200 else {
                    throw URLError(.badServerResponse)
                }
                return String(decoding: $0.data, as: UTF8.self)
            }
            .receive(on: DispatchQueue.main)
            .sink{
                switch $0 {
                case .failure:
                    self.state = .error(error: "Incorrect user or password")
                case .finished:
                    self.state = .loaded
                }
            } receiveValue: {
                self.token = $0
            }
            .store(in: &suscriptors)
    }
}
