//
//  HomeView.swift
//  Marvel
//
//  Created by Gonzalo Gregorio on 15/11/2023.
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject var appStateViewModel: AppStateViewModel
    
    @StateObject var homeViewModel = HomeViewModel()
    
    var body: some View {
        TabView{
            VStack{
                CharactersView(viewModel: homeViewModel)
            }
            .tabItem {
                Image(systemName: "house")
                Text("Heroes")
            }
            
        }
    }
}

#Preview {
    HomeView().environmentObject(AppStateViewModel())
}
