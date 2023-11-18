//
//  CharacterView.swift
//  Marvel
//
//  Created by Gonzalo Gregorio on 16/11/2023.
//

import SwiftUI

struct CharactersView: View {
    @StateObject var viewModel: HomeViewModel
    @State private var filter: String = ""
    @EnvironmentObject var appStateViewModel: AppStateViewModel
    
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
                        appStateViewModel.closeSession()
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
        .onChange(of: filter) { oldValue, newValue in
            //Ha cambiado el filtro de busqueda
            viewModel.getCharacters(filter: newValue)
        }
    }
}

#Preview {
    CharactersView(viewModel: HomeViewModel(isTestEnvironment: true))
}
