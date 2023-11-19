//
//  AppStateView.swift
//  Marvel
//
//  Created by Gonzalo Gregorio on 15/11/2023.
//

import SwiftUI

struct AppRouterView: View {
    @EnvironmentObject var appStateViewModel: LoginViewModel
    
    var body: some View {
        switch appStateViewModel.state {
        case AppState.none:
            withAnimation {
                LoginView()
            }
        case AppState.register:
            withAnimation {
                Text("Register")
            }
        case AppState.loading:
            withAnimation {
                LoaderView()
            }
        case AppState.loaded:
            withAnimation {
                HomeView()
            }
        case AppState.error(error: let errorMessage):
            withAnimation {
                Text("Error description: \(errorMessage)")
            }
        }
    }
}

#Preview {
    AppRouterView()
        .environmentObject(LoginViewModel())
}
