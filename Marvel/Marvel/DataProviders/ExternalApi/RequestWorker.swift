//
//  RequestWorker.swift
//  Marvel
//
//  Created by Gonzalo Gregorio on 18/11/2023.
//

import Foundation
import Combine

final class RequestWorker: RequestProtocol {
    func execute<T>(type: T.Type, request: URLRequest) -> AnyPublisher<T, Error> where T : Decodable {
        URLSession.shared
            .dataTaskPublisher(for: request)
            .tryMap{
                guard let response = $0.response as? HTTPURLResponse,
                      response.statusCode == 200 else{
                    throw URLError(.badServerResponse)
                }
                print("Response Status Code: \(response.statusCode)")
                return $0.data
            }
            .decode(type: T.self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
}
