//
//  HomeView.swift
//  Marvel
//
//  Created by Gonzalo Gregorio on 15/11/2023.
//

import SwiftUI

struct HomeView: View {
//    @EnvironmentObject var viewModel: LoginViewModel
    
//    @StateObject var loginViewModel = LoginViewModel()
    @StateObject var homeViewModel = HomeViewModel()
    
    
    var body: some View {
        TabView{
            VStack{
                CharactersView(viewModel: homeViewModel)
//                CharactersView(viewModel: loginViewModel)
//                CharactersView()
            }
            .tabItem {
                Image(systemName: "house")
                Text("Heroes")
            }
            
        }
    }
}

#Preview {
    HomeView(homeViewModel: HomeViewModel(isTestEnvironment: true))
//        .environmentObject(LoginViewModel())
}
