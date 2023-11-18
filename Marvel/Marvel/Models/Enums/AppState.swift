//
//  AppStateEnum.swift
//  Marvel
//
//  Created by Gonzalo Gregorio on 14/11/2023.
//

import Foundation

enum AppState {
    case none, loading, loaded, register, error(error: String)
}
