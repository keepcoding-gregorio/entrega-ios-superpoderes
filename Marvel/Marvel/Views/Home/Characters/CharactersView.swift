//
//  CharacterView.swift
//  Marvel
//
//  Created by Gonzalo Gregorio on 16/11/2023.
//

import SwiftUI

struct CharactersView: View {
    @EnvironmentObject var loginViewModel: LoginViewModel

    @StateObject var viewModel: HomeViewModel
    @State private var filter: String = ""
    
    var body: some View {
        NavigationStack {
            List{
                if let characters = viewModel.characters {
                    ForEach(characters){ character in
                        NavigationLink {
                            //Destino
                            CharacterDetailView(character: character)
                        } label: {
                            //La celda personalizada
                            CharactersCellView(character: character)
                                .frame(height: 200)
                        }
                    }
                }
            }
            .navigationTitle("Marvel Characters")
            .toolbar{
                ToolbarItem(placement: .topBarTrailing) {
                    Button(action: {
                        loginViewModel.closeSession()
                    }, label: {
                        HStack{
                            Image(systemName: "xmark.circle")
                            Text("close")
                                .font(.caption2)
                        }
                    })
                }
            }
        }
        .searchable(text: $filter,
                    placement: .navigationBarDrawer(displayMode: .always),
                    prompt: "Find character")
//        .onChange(of: filter) { oldValue, newValue in
//            //Ha cambiado el filtro de busqueda
//            appStateViewModel.getCharacters()
//        }
    }
}

#Preview {
    CharactersView(viewModel: HomeViewModel(isTestEnvironment: true))
//    CharactersView(viewModel: HomeViewModel())
//    CharactersView()
}
