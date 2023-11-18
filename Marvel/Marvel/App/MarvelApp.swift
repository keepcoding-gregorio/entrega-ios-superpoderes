//
//  MarvelApp.swift
//  Marvel
//
//  Created by Gonzalo Gregorio on 13/11/2023.
//

import SwiftUI

@main
struct MarvelApp: App {
    let persistenceController = PersistenceController.shared
    
    // MARK: Global State
    @StateObject var appState = AppStateViewModel()
    
    var body: some Scene {
        WindowGroup {
            AppRouterView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
                .environmentObject(appState)
        }
    }
}
