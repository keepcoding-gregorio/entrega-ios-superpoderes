//
//  RequestProtocol.swift
//  Marvel
//
//  Created by Gonzalo Gregorio on 18/11/2023.
//

import Foundation
import Combine

protocol RequestProtocol: AnyObject {
    func execute<T>(type: T.Type, request: URLRequest) -> AnyPublisher< T, Error> where T: Decodable
}
