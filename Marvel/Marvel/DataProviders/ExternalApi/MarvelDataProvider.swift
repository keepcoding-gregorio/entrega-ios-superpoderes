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
    
    // MARK: Login - (CharacterList)
    /**
     We simulate a login with an actual api get call to the characters of Marvel API with the public and private key provided in the Login view. If response is 200 we assume is a succesfull login and pass the characters to the Home view.
     */
    func login(publicKey: String, privateKey: String) -> URLRequest {
        let url = "\(MarvelApiEndpoint.baseURL)\(MarvelApiEndpoint.getCharacters)\(composeUrlCredentialsQueryParams(publicKey: publicKey, privateKey: privateKey))"

        var request: URLRequest = URLRequest(url: URL(string: url)!)
        request.httpMethod = HTTPMethods.get
        request.addValue(HTTPHeaders.content, forHTTPHeaderField: HTTPHeaders.contentType)

        return request
    }
    
    // MARK: CharacterDetail
//        func getCharacterDetail(id: String) -> URLRequest{

    func getCharacters(publicKey: String, privateKey: String) -> URLRequest{
        let url = "\(MarvelApiEndpoint.baseURL)\(MarvelApiEndpoint.getCharacters)\(composeUrlCredentialsQueryParams(publicKey: publicKey, privateKey: privateKey))"

        var request: URLRequest = URLRequest(url: URL(string: url)!)
        request.httpMethod = HTTPMethods.get
        request.addValue(HTTPHeaders.content, forHTTPHeaderField: HTTPHeaders.contentType)

        //seguridad JWT
        let tokenOptional = keychainDataProvider.get(key: KeyChainEnum.token)
        if let tokenJWT = tokenOptional {
            request.addValue("Bearer \(tokenJWT)", forHTTPHeaderField: HTTPHeaders.authorization)
        }
        
        return request
    }
    
    
    // MARK: Private Methods
    private func composeUrlCredentialsQueryParams(publicKey: String, privateKey: String) -> String {
        let timestamp = String(randomTimestamp())
        return "?apikey=\(publicKey)&ts=\(timestamp)&hash=\(hashSecretsToMD5(string: timestamp+privateKey+publicKey))&orderBy=name&limit=100"
    }
    
    private func hashSecretsToMD5(string: String) -> String {
        Insecure.MD5.hash(data: Data(string.utf8)).map {
            // 02 : String width = 2 add 0 at the front if width is less than 2
            // hhx: x for hex, hh as lenght modifier specifying that the hex conversion applies to a char
            String(format: "%02hhx", $0)
        }.joined()
    }
    
    private func randomTimestamp() -> Int {
        let currentDate = Date()
        let randomOffset = TimeInterval(arc4random_uniform(UInt32(365 * 24 * 60 * 60))) // 365 days in seconds

        return Int(currentDate.timeIntervalSince1970 + randomOffset)
    }
}


