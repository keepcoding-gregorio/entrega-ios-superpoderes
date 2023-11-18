//
//  MarvelDataProvider.swift
//  Marvel
//
//  Created by Gonzalo Gregorio on 14/11/2023.
//

import Foundation
import CryptoKit

struct MarvelDataProvider {
    
    private let keychainDataProvider = KeychainDataProvider()
    
    // MARK: Login
    func login(user: String, password: String) -> URLRequest {
        let url = "\(MarvelApiEndpoint.baseURL)\(MarvelApiEndpoint.login)"
        let credentials = self.getLoginCredentials(user: user, password: password)
        var request: URLRequest = URLRequest(url: URL(string: url)!)
        request.httpMethod = HTTPMethods.post
        request.addValue(HTTPHeaders.content, forHTTPHeaderField: HTTPHeaders.contentType)
        request.addValue(credentials, forHTTPHeaderField: HTTPHeaders.authorization)
        
        return request
    }
    
    // MARK: CharacterList
    func getCharacters(filter: String) -> URLRequest{
        let url = "\(MarvelApiEndpoint.baseURL)\(MarvelApiEndpoint.getCharacters)"

        var request: URLRequest = URLRequest(url: URL(string: url)!)
        request.httpMethod = HTTPMethods.post
        
        //generamos el JSON y lo metemos en el body de la llamada
        request.httpBody = try? JSONEncoder().encode(CharacterFilterModel(name: filter))
        request.addValue(HTTPHeaders.content, forHTTPHeaderField: HTTPHeaders.contentType)

        //seguridad JWT
        let tokenOptional = keychainDataProvider.get(key: KeyChainEnum.token)
        if let tokenJWT = tokenOptional {
            request.addValue("Bearer \(tokenJWT)", forHTTPHeaderField: HTTPHeaders.authorization)
        }
        
        return request
    }
    
    
    // MARK: Private Methods
    private func getLoginCredentials(user: String, password: String) -> String {
        guard let encodedCredentials = "\(user):\(password)".data(using: .utf8)?.base64EncodedString() else {
            return ""
        }
        return "Basic \(encodedCredentials)"
    }
    
    private func hashSecretsToMD5() {
        
    }
    
    let baseUrl = "https://gateway.marvel.com/v1/public"
    let endPoint = "/characters"
    let privKey = "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"
    let pubKey = "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"

    var finalUrl: String {
        let ts = String(Date().timeIntervalSince1970)
        return baseUrl+endPoint+"?ts="+ts+"&hash="+string2Md5(string: ts+privKey+pubKey)
    }

    private func string2Md5 (string: String) -> String {
        Insecure.MD5.hash(data: Data(string.utf8)).map {
            // 02 : String width = 2 add 0 at the front if width is less than 2
            // hhx: x for hex, hh as lenght modifier specifying that the hex conversion applies to a char
            String(format: "%02hhx", $0)
        }.joined()
    }
}


