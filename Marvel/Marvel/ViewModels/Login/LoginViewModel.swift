//
//  AppState.swift
//  Marvel
//
//  Created by Gonzalo Gregorio on 14/11/2023.
//

import Foundation
import Combine

final class LoginViewModel: ObservableObject {

    // MARK: Publishers
    @Published var state: AppState = AppState.none
    @Published var characters: [Character]?


    @persistanceKeychain(key: KeyChainEnum.token)
    var publicKey {
        didSet {
            print("Stored public key")
        }
    }
    @persistanceKeychain(key: KeyChainEnum.token)
    var privateKey {
        didSet {
            print("Stored private key")
        }
    }
    
    // MARK: Combine Suscriptor
    var suscriptors = Set<AnyCancellable>()
    
    // MARK: Class variables
    private let keyChain = KeychainDataProvider()
    private var interactor: CharactersInteractorProtocol
    
    // MARK: Initializer
    init(interactor : CharactersInteractorProtocol = CharactersInteractor()) {
        self.interactor = interactor
        self.userIsLogged()
    }
    
    // MARK: Functions
    func userIsLogged() {
        if publicKey != "" && privateKey != "" {
            state = .loaded
        }
    }
    
    func closeSession() {
        publicKey = ""
        privateKey = ""
        state = .none
    }
    
    func login(publicKey: String, privateKey: String) {
        state = .loading
        interactor.login(publicKey: publicKey, privateKey: privateKey)
            .sink{
                switch $0 {
                case .failure:
                    self.state = .error(error: "Incorrect public or private key")
                case .finished:
                    self.state = .loaded
                }
            } receiveValue: {
                self.characters = $0.data.results
            }
            .store(in: &suscriptors)
    }
}
