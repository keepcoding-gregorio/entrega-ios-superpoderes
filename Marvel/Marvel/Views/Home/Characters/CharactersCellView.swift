//
//  CharactersCellView.swift
//  Marvel
//
//  Created by Gonzalo Gregorio on 16/11/2023.
//

import SwiftUI

struct CharactersCellView: View {
    var character: Character //modelo
    
    var body: some View {
        ZStack{
            //Foto del heroe
            AsyncImage(url: URL(string: character.getImage())) { photo in
                //foto descargada
                photo
                    .resizable()
                    .cornerRadius(20)
                    .opacity(0.8)
                
            } placeholder: {
                Image(systemName: "photo")
                    .resizable()
                    .cornerRadius(20)
                    .opacity(0.8)
            }
            
            
            
            //VStack para nombre y "me gusta"
            VStack(alignment: .leading){
                //name
                HStack{
                    Text(character.name)
                        .font(.title2)
                        .foregroundStyle(.black)
                        .bold()
                        .padding([.top, .leading], 20)
                    Spacer()
                }
                Spacer()
                
                //like
                //                if (character.favorite!){
                //                    Image(systemName: "heart.circle")
                //                        .resizable()
                //                        .foregroundColor(.red)
                //                        .frame(width: 40, height: 40)
                //                        .padding([.leading], 10)
                //
                //                } else{
                //                    Image(systemName: "heart.circle")
                //                        .resizable()
                //                        .foregroundColor(.gray)
                //                        .frame(width: 40, height: 40)
                //                        .padding([.leading], 10)
                //                }
                //
            }
        }
    }
}

#Preview {
    Group {
        let mockedCharacter = Character(id: 1017100, name: "A-Bomb (HAS)", description: "Rick Jones has been Hulk's best bud since day one, but now he's more than a friend...he's a teammate! Transformed by a Gamma energy explosion, A-Bomb's thick, armored skin is just as strong and powerful as it is blue. And when he curls into action, he uses it like a giant bowling ball of destruction!", thumbnail: Thumbnail(path: "http://i.annihil.us/u/prod/marvel/i/mg/3/20/5232158de5b16", thumbnailExtension: Extension.jpg))
        
        CharactersCellView(character: mockedCharacter)
    }
}
